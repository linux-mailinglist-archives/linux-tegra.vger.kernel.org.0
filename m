Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC641249B5
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 15:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfLRObd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 09:31:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:54404 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726955AbfLRObc (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 09:31:32 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 57666AE3F;
        Wed, 18 Dec 2019 14:31:30 +0000 (UTC)
Date:   Wed, 18 Dec 2019 15:31:30 +0100
Message-ID: <s5h5zid903h.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     <alsa-devel@alsa-project.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: Use standard waitqueue for RIRB wakeup
In-Reply-To: <53562c71-4d81-1580-f311-971ceb029431@nvidia.com>
References: <20191210145727.22054-1-tiwai@suse.de>
        <53562c71-4d81-1580-f311-971ceb029431@nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 18 Dec 2019 15:17:27 +0100,
Jon Hunter wrote:
> 
> 
> On 10/12/2019 14:57, Takashi Iwai wrote:
> > The HD-audio CORB/RIRB communication was programmed in a way that was
> > documented in the reference in decades ago, which is essentially a
> > polling in the waiter side.  It's working fine but costs CPU cycles on
> > some platforms that support only slow communications.  Also, for some
> > platforms that had unreliable communications, we put longer wait time
> > (2 ms), which accumulate quite long time if you execute many verbs in
> > a shot (e.g. at the initialization or resume phase).
> > 
> > This patch attempts to improve the situation by introducing the
> > standard waitqueue in the RIRB waiter side instead of polling.  The
> > test results on my machine show significant improvements.  The time
> > spent for "cat /proc/asound/card*/codec#*" were changed like:
> > 
> > * Intel SKL + Realtek codec
> >   before the patch:
> >    0.00user 0.04system 0:00.10elapsed 40.0%CPU
> >   after the patch:
> >    0.00user 0.01system 0:00.10elapsed 10.0%CPU
> > 
> > * Nvidia GP107GL + Nvidia HDMI codec
> >   before the patch:
> >    0.00user 0.00system 0:02.76elapsed 0.0%CPU
> >   after the patch:
> >    0.00user 0.00system 0:00.01elapsed 17.0%CPU
> > 
> > So, for Intel chips, the total time is same, while the total time is
> > greatly reduced (from 2.76 to 0.01s) for Nvidia chips.
> > The only negative data here is the increase of CPU time for Nvidia,
> > but this is the unavoidable cost for faster wakeups, supposedly.
> > 
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> Starting with next-20191217 I am seeing the following error on one of
> our Tegra platforms ...
> 
> tegra-hda 3510000.hda: azx_get_response timeout, switching to polling
> mode: last cmd=0x404f2d00
> 
> Bisect is point to this commit and although it does not cleanly revert,
> if I revert this and a couple dependencies on top of -next the issue
> goes away. Any thoughts on what could be going on here?

Do you see any bad behavior other than the warning message?

If you don't see any dysfunction, I guess that the difference is that
the old code went to the trial mode at first silently (with
dev_dbg()), then switching to polling mode at next.  The trial mode is
basically same as polling mode, but it was just considered to be a
temporary transition, so not warned.

IOW, if my guess is correct, maybe Tegra never worked in the normal
mode but only in the polling mode (but without complaints).
If so, the patch like below would be needed.

To prove my theory, could you check the old code with dyndbg enabled
for sound/pci/hda/hda_controller.c?  If a message like below appears,
it's the case:
  azx_get_response timeout, polling the codec once: last cmd=xxx


thanks,

Takashi

--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -394,6 +394,7 @@ static int hda_tegra_create(struct snd_card *card,
 	if (err < 0)
 		return err;
 
+	chip->bus.core.polling = 1;
 	chip->bus.core.needs_damn_long_delay = 1;
 
 	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);

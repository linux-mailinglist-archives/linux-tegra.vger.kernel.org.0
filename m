Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0EE411CC2E
	for <lists+linux-tegra@lfdr.de>; Thu, 12 Dec 2019 12:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728994AbfLLL2E (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 12 Dec 2019 06:28:04 -0500
Received: from mx2.suse.de ([195.135.220.15]:49024 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728953AbfLLL2E (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Dec 2019 06:28:04 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 06D34AFA7;
        Thu, 12 Dec 2019 11:28:02 +0000 (UTC)
Date:   Thu, 12 Dec 2019 12:28:02 +0100
Message-ID: <s5ho8wdhjgd.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jaroslav Kysela <perex@perex.cz>,
        Jon Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/tegra: Remove unused "bus" variable
In-Reply-To: <20191212111930.3076101-1-thierry.reding@gmail.com>
References: <20191212111930.3076101-1-thierry.reding@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 12 Dec 2019 12:19:30 +0100,
Thierry Reding wrote:
> 
> From: Thierry Reding <treding@nvidia.com>
> 
> After commit f36da9406e66 ("ALSA: hda: Support PCM sync_stop"), the
> local "bus" variable is no longer used. Remove it.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Thanks, that's already addressed on my tree.


Takashi

> ---
>  sound/pci/hda/hda_tegra.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
> index fc2e0a294bc1..269f242fcbfd 100644
> --- a/sound/pci/hda/hda_tegra.c
> +++ b/sound/pci/hda/hda_tegra.c
> @@ -166,7 +166,6 @@ static int __maybe_unused hda_tegra_runtime_suspend(struct device *dev)
>  	struct snd_card *card = dev_get_drvdata(dev);
>  	struct azx *chip = card->private_data;
>  	struct hda_tegra *hda = container_of(chip, struct hda_tegra, chip);
> -	struct hdac_bus *bus = azx_bus(chip);
>  
>  	if (chip && chip->running) {
>  		azx_stop_chip(chip);
> -- 
> 2.23.0
> 

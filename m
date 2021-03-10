Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28ED33432D
	for <lists+linux-tegra@lfdr.de>; Wed, 10 Mar 2021 17:38:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbhCJQho (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 10 Mar 2021 11:37:44 -0500
Received: from mx2.suse.de ([195.135.220.15]:35854 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229467AbhCJQh1 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Mar 2021 11:37:27 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 01531ABD7;
        Wed, 10 Mar 2021 16:37:26 +0000 (UTC)
Date:   Wed, 10 Mar 2021 17:37:25 +0100
Message-ID: <s5hzgzbvube.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Mark Brown <broonie@kernel.org>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        Bard liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is present
In-Reply-To: <20210310161814.GA28564@sirena.org.uk>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
        <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
        <20210310133534.GD4746@sirena.org.uk>
        <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
        <20210310161814.GA28564@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 10 Mar 2021 17:18:14 +0100,
Mark Brown wrote:
> 
> On Wed, Mar 10, 2021 at 09:44:07AM -0600, Pierre-Louis Bossart wrote:
> > On 3/10/21 7:35 AM, Mark Brown wrote:
> 
> > > Just change it to a system level check for ACPI, checking for OF would
> > > leave problems for board files or any other alternative firmware
> > > interfaces.
> 
> > did you mean if (!IS_ENABLED(CONFIG_ACPI)) ?
> 
> Is there a runtime check?

Well, basically both DMI and ACPI are completely different things, so
I don't think it's right to check the availability of ACPI as a signal
of the availability of DMI.


Takashi

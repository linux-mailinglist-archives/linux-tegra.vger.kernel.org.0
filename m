Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54BD721EC3B
	for <lists+linux-tegra@lfdr.de>; Tue, 14 Jul 2020 11:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgGNJIW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Jul 2020 05:08:22 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:19990 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgGNJIW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Jul 2020 05:08:22 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0d75950000>; Tue, 14 Jul 2020 02:06:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 14 Jul 2020 02:08:21 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 14 Jul 2020 02:08:21 -0700
Received: from [10.26.72.103] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Jul
 2020 09:08:20 +0000
Subject: Re: [PATCH] ALSA: hda: Enable sync-write operation as default for all
 controllers
To:     Takashi Iwai <tiwai@suse.de>
CC:     <alsa-devel@alsa-project.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20200618144051.7415-1-tiwai@suse.de>
 <8fc9f086-9a34-4287-8f51-6e0ebc34928f@nvidia.com>
 <s5hy2nmv6qv.wl-tiwai@suse.de>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <6f7a6d27-127d-9242-0638-abaf10e38410@nvidia.com>
Date:   Tue, 14 Jul 2020 10:08:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <s5hy2nmv6qv.wl-tiwai@suse.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594717589; bh=Vwmt7N6nQCfUL1AHZzyBgLJesLtmD2bFuXlH0D6r7Ts=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=kygR47v1IoMUsYnf/nZy5pnbQILuoPtmgTLX4LXLc5vU2i5MncARkfqjeY7MwIbFP
         vRta1WLQMsjq1L5oGv0zsUbKT9rer23NyNtoEp0l6Dax2IA+kGInyi9xNmbw6eHePB
         H56o70A4WDKmFzTVKlkEvtGSiyA0uWkSJyRH+jj98sbX6M/o19OnIpANoHShBHGaAk
         2L+zY2TtR7l8fR7xoU6TBqYudgbBWtMuf2pj79Aq26K2ivUfYfko+ztFFgqrHKIqok
         UqcPVN1vm0TxATuh4NWmB8X509JHj6NQfCEFAnR0cqATwfwuCq/fJhwyDHRT2/p8R9
         UBoNpueTk62uQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 14/07/2020 09:30, Takashi Iwai wrote:
> On Tue, 14 Jul 2020 10:08:02 +0200,
> Jon Hunter wrote:
>>
>> Hi Takashi,
>>
>> On 18/06/2020 15:40, Takashi Iwai wrote:
>>> In the end we already enabled the sync-write mode for most of HD-audio
>>> controllers including Intel, and it's no big merit to keep the async
>>> write mode for the rest.  Let's make it as default and drop the
>>> superfluous AZX_DCAPS_SYNC_WRITE bit flag.
>>>
>>> Also, avoid to set the allow_bus_reset flag, which is a quite unstable
>>> and hackish behavior that was needed only for some early platforms
>>> (decades ago).  The straight fallback to the single cmd mode is more
>>> robust.
>>>
>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>>
>>
>> I have noticed a regression in HDA playback on our Tegra186 Jetson TX2
>> platform. Bisect is pointing to this patch and reverting this does
>> appear to fix it. Interestingly, I am not seeing any problems on other
>> Tegra platforms, however, Tegra186 does have the IOMMU enabled for HDA
>> which is one different between the other platforms.
>>
>> We can take a closer look at this for Tegra, but I am wondering if we
>> revert this for Tegra for now.
> 
> It's a deja vu, we (or someone else in Nvidia?) discussed it in the
> past?
> 
> The patch below should cure the problem temporarily, as it sets the
> polling mode as default for Tegra.  But it'd be appreciated if you can
> find the root cause.
> 
> 
> thanks,
> 
> Takashi
> 
> --- a/sound/pci/hda/hda_tegra.c
> +++ b/sound/pci/hda/hda_tegra.c
> @@ -394,6 +394,7 @@ static int hda_tegra_create(struct snd_card *card,
>  	if (err < 0)
>  		return err;
>  
> +	chip->bus.core.polling = 1;
>  	chip->bus.core.needs_damn_long_delay = 1;
>  
>  	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
> 

Did you mean ...

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 0cc5fad1af8a..5637f0129932 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -443,6 +443,7 @@ static int hda_tegra_create(struct snd_card *card,
        if (err < 0)
                return err;

+       chip->bus.core.sync_write = 0;
        chip->bus.core.needs_damn_long_delay = 1;
        chip->bus.core.aligned_mmio = 1;

The above works for me.

Cheers
Jon

-- 
nvpublic

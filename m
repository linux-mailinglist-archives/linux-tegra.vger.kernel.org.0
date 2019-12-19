Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 931201261D1
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Dec 2019 13:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfLSMPy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 19 Dec 2019 07:15:54 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16140 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbfLSMPy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Dec 2019 07:15:54 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dfb69ed0000>; Thu, 19 Dec 2019 04:15:43 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 19 Dec 2019 04:15:53 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 19 Dec 2019 04:15:53 -0800
Received: from [10.21.133.51] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Dec
 2019 12:15:50 +0000
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: Use standard waitqueue for RIRB
 wakeup
To:     Takashi Iwai <tiwai@suse.de>
CC:     <alsa-devel@alsa-project.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20191210145727.22054-1-tiwai@suse.de>
 <53562c71-4d81-1580-f311-971ceb029431@nvidia.com>
 <s5h5zid903h.wl-tiwai@suse.de>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <51e59f38-0db9-df80-bb62-44fff504ffc4@nvidia.com>
Date:   Thu, 19 Dec 2019 12:15:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <s5h5zid903h.wl-tiwai@suse.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1576757743; bh=J96tn4J+2yBlP/4nolpkcJfrGIW/MBYSH2G/7gHDyJA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=H2jlweJchd57jwWmfWf+xhFMoW6awZf0IRGZXGnL+OvTAWk5V6Nmf2CHGfpVCMDK0
         hbf3m0aoJ9wPPsHDyk4rpHB1iseuRG3jO8igT1RKz1dsoX+ARQqHe4WWj4UaioxL3B
         R4Ty37e8V2xVCQtdGeP6DjKtprr7SJCDufrRwpw0NCafppwCcRr3jcfVaPNnORfQlE
         kNvt7DdCg2csR3rmr+f/6LR4MINeCdO5UPM/YdHwd7JYux3xoptoqJ+3x6WHnTFBG1
         F2K/VTBIRjxQjI09jzlN27lwLNt0Rg/6k359SzQjZkcKu6nXp010ioOADUMuBE5rlY
         fRYNfIovB0qiA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 18/12/2019 14:31, Takashi Iwai wrote:
> On Wed, 18 Dec 2019 15:17:27 +0100,
> Jon Hunter wrote:
>>
>>
>> On 10/12/2019 14:57, Takashi Iwai wrote:
>>> The HD-audio CORB/RIRB communication was programmed in a way that was
>>> documented in the reference in decades ago, which is essentially a
>>> polling in the waiter side.  It's working fine but costs CPU cycles on
>>> some platforms that support only slow communications.  Also, for some
>>> platforms that had unreliable communications, we put longer wait time
>>> (2 ms), which accumulate quite long time if you execute many verbs in
>>> a shot (e.g. at the initialization or resume phase).
>>>
>>> This patch attempts to improve the situation by introducing the
>>> standard waitqueue in the RIRB waiter side instead of polling.  The
>>> test results on my machine show significant improvements.  The time
>>> spent for "cat /proc/asound/card*/codec#*" were changed like:
>>>
>>> * Intel SKL + Realtek codec
>>>   before the patch:
>>>    0.00user 0.04system 0:00.10elapsed 40.0%CPU
>>>   after the patch:
>>>    0.00user 0.01system 0:00.10elapsed 10.0%CPU
>>>
>>> * Nvidia GP107GL + Nvidia HDMI codec
>>>   before the patch:
>>>    0.00user 0.00system 0:02.76elapsed 0.0%CPU
>>>   after the patch:
>>>    0.00user 0.00system 0:00.01elapsed 17.0%CPU
>>>
>>> So, for Intel chips, the total time is same, while the total time is
>>> greatly reduced (from 2.76 to 0.01s) for Nvidia chips.
>>> The only negative data here is the increase of CPU time for Nvidia,
>>> but this is the unavoidable cost for faster wakeups, supposedly.
>>>
>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>> Starting with next-20191217 I am seeing the following error on one of
>> our Tegra platforms ...
>>
>> tegra-hda 3510000.hda: azx_get_response timeout, switching to polling
>> mode: last cmd=0x404f2d00
>>
>> Bisect is point to this commit and although it does not cleanly revert,
>> if I revert this and a couple dependencies on top of -next the issue
>> goes away. Any thoughts on what could be going on here?
> 
> Do you see any bad behavior other than the warning message?

I have done some more local testing and so far I don't see any bad
behaviour just the warning.

> If you don't see any dysfunction, I guess that the difference is that
> the old code went to the trial mode at first silently (with
> dev_dbg()), then switching to polling mode at next.  The trial mode is
> basically same as polling mode, but it was just considered to be a
> temporary transition, so not warned.
> 
> IOW, if my guess is correct, maybe Tegra never worked in the normal
> mode but only in the polling mode (but without complaints).
> If so, the patch like below would be needed.
> 
> To prove my theory, could you check the old code with dyndbg enabled
> for sound/pci/hda/hda_controller.c?  If a message like below appears,
> it's the case:
>   azx_get_response timeout, polling the codec once: last cmd=xxx

Yes I tried this and you are correct, this does appear even if v5.5-rc2.

Please note that this timeout is intermittent and so does not always
happen. So it appears to work, but sometimes it can fail.

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

I don't think we want to do this, because so far this is only seen on
one Tegra device and this enable polling for all.

For now you can ignore this report and we will investigate what is
happening on Tegra194 to cause this.

Thanks
Jon

-- 
nvpublic

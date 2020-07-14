Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E57D521ED39
	for <lists+linux-tegra@lfdr.de>; Tue, 14 Jul 2020 11:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgGNJv0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Jul 2020 05:51:26 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13505 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbgGNJvZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Jul 2020 05:51:25 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0d80100000>; Tue, 14 Jul 2020 02:51:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 14 Jul 2020 02:51:25 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 14 Jul 2020 02:51:25 -0700
Received: from [10.26.72.103] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Jul
 2020 09:51:23 +0000
Subject: Re: [PATCH] ALSA: hda: Enable sync-write operation as default for all
 controllers
To:     Takashi Iwai <tiwai@suse.de>
CC:     <alsa-devel@alsa-project.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20200618144051.7415-1-tiwai@suse.de>
 <8fc9f086-9a34-4287-8f51-6e0ebc34928f@nvidia.com>
 <s5hy2nmv6qv.wl-tiwai@suse.de>
 <6f7a6d27-127d-9242-0638-abaf10e38410@nvidia.com>
 <s5hr1tev4sw.wl-tiwai@suse.de>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c2c925ab-5bf7-7f7c-cf30-126b3ba34fff@nvidia.com>
Date:   Tue, 14 Jul 2020 10:51:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <s5hr1tev4sw.wl-tiwai@suse.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594720272; bh=w7g3s9EjCSylMdJ5ySi5SN8nnfirYHN96+rO9FyAjdo=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=gku6mRwxysxKbZqUMYWGmfEcmAVWxh3dH8RYPaj2zWovPIrN50sGQr+LhUg1sW+TN
         TgS2caGRBulOMutrGTdGddjGKmcUCoAmdGe4IUDoM0Kz9O3GBrO2jb4ggI6OuicDeB
         eW7BLt5jq5OvZSwglzdzDiQ4WBUnFDaX2LAAnatGmm10x/G8LAYpwyW/HQZK64tZBB
         geoFS3qmu2zVlUz4ny+soH9Zs7oI3ffOXYj1BH5Nq+NK0CdtwbOYZwJKzkto5q+8z1
         Rlz/EARNDLWmtCWrw0ihwVZXPmCo6WjTzvz7/yIQsTnX4qo1h1NyLdoQFo0J8PA+iN
         DF1yAykbMJ7IA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 14/07/2020 10:12, Takashi Iwai wrote:

...

>> Did you mean ...
>>
>> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
>> index 0cc5fad1af8a..5637f0129932 100644
>> --- a/sound/pci/hda/hda_tegra.c
>> +++ b/sound/pci/hda/hda_tegra.c
>> @@ -443,6 +443,7 @@ static int hda_tegra_create(struct snd_card *card,
>>         if (err < 0)
>>                 return err;
>>
>> +       chip->bus.core.sync_write = 0;
>>         chip->bus.core.needs_damn_long_delay = 1;
>>         chip->bus.core.aligned_mmio = 1;
>>
>> The above works for me.
> 
> Yeah, sorry, that was a wrong patch :)
> I'm fine for applying it with some more comments.
> 
> Care to submit a proper patch?


No problem. I will submit a patch.

Jon

-- 
nvpublic

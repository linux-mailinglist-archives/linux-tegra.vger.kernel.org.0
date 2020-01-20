Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9875F14303F
	for <lists+linux-tegra@lfdr.de>; Mon, 20 Jan 2020 17:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgATQub (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 20 Jan 2020 11:50:31 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33326 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgATQua (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Jan 2020 11:50:30 -0500
Received: by mail-lf1-f67.google.com with SMTP id n25so24630065lfl.0
        for <linux-tegra@vger.kernel.org>; Mon, 20 Jan 2020 08:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=S823y5r0qE/kszJj6OhQ0qMGICpBQxRhKLmmHJUihXw=;
        b=RwZ2EhmDdKrA8tPlHI0wEr/PD8GFiZ7JISFdS17uHCCjLP1OQLBsfL+p6mkX7aHmpP
         1QQB3rZ8jiWaxlb6ktitqAhmxz+3kfi778SfRenlRGkEABezKPAxONJprnlHn47PIzJ/
         Nel/BP7kiXTbPVQ2+t42PC1cu3qckWO4PT5znrSRLWRqt3PgadpjmzCxjqP1hTL3OnEG
         i0O4amxFTUmbH7/KcF2xg1MVFN0XR/zJusUUws8Zv3ho1kRQ0P0uYkWG1epL9JWuN+2E
         ww79hl2qauVi0VSLpHcjXk0x/RfHN69OTFKs5yairPbYpmoEFtgdb3YhgrolOeEdN5Wz
         FWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S823y5r0qE/kszJj6OhQ0qMGICpBQxRhKLmmHJUihXw=;
        b=KAeBmvjtu0Yb88dEIoHRko/itMmAsmekGEaKDTER6O38sdmboJop5IkyN5nxTGSJeB
         YufKlP6nKzy4gTvL8jwgLd9Gf7qE0+7n0XM1zfYm6icRNCqiwkS+aZRUtMN/mjcwMcnA
         6tT5v3PmixRG33J7TDZ0WBh2B6PJ9nJ5GQKIGULLu8dD12sq0GUV7c0JT5AD7Y9b/PzU
         zNMsC7xaExPmRpV9x/IgL7W1rwTt60IxfWCQ8veqolLLjUJFnzmmVRxDE/+A/moU1//q
         yXVdkVJDZ5fgUw6LvSuNLBAICrVjImSjaBoEYxyQB3cd2SAiEuJLx3GskAH0MXIQr2eb
         DF5A==
X-Gm-Message-State: APjAAAXh/UPiZz1nZPaiNqBhovguBPsk0RbvgWkWm8QgftuD/9rjH2Y3
        buMGMWznsrnSY9Ja1sCs2VafUpgn
X-Google-Smtp-Source: APXvYqz+ox3NGUI8TmFKpuaDg2tsFWOZdN8RF6KJqH4RVeJ/uGqyfYXwBTeDcU9suhnDMMdXpH+7ig==
X-Received: by 2002:ac2:4909:: with SMTP id n9mr109581lfi.21.1579539028234;
        Mon, 20 Jan 2020 08:50:28 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id n30sm20256815lfi.54.2020.01.20.08.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2020 08:50:27 -0800 (PST)
Subject: Re: [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit
 samples
To:     Jon Hunter <jonathanh@nvidia.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra@vger.kernel.org
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <07cd66dc-1a6c-6b49-55a9-1420fe235161@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ebfaa0d3-1236-cac4-4bd8-4456a171d773@gmail.com>
Date:   Mon, 20 Jan 2020 19:50:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <07cd66dc-1a6c-6b49-55a9-1420fe235161@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

08.01.2020 14:37, Jon Hunter пишет:
> 
> On 07/01/2020 01:39, Dmitry Osipenko wrote:
>> 06.01.2020 22:00, Ben Dooks пишет:
>>> On 05/01/2020 10:53, Ben Dooks wrote:
>>>>
>>>>
>>>> On 2020-01-05 01:48, Dmitry Osipenko wrote:
>>>>> 05.01.2020 03:04, Ben Dooks пишет:
>>>>>> [snip]
>>>>>>
>>>>>> I've just gone through testing.
>>>>>>
>>>>>> Some simple data tests show 16 and 32-bits work.
>>>>>>
>>>>>> The 24 bit case seems to be weird, it looks like the 24-bit expects
>>>>>> 24 bit samples in 32 bit words. I can't see any packing options to
>>>>>> do 24 bit in 24 bit, so we may have to remove 24 bit sample support
>>>>>> (which is a shame)
>>>>>>
>>>>>> My preference is to remove the 24-bit support and keep the 32 bit in.
>>>>>>
>>>>>
>>>>> Interesting.. Jon, could you please confirm that 24bit format isn't
>>>>> usable on T30?
>>>>
>>>> If there is an option of 24 packed into 32, then I think that would work.
>>>>
>>>> I can try testing that with raw data on Monday.
>>>
>>> I need to check some things, I assumed 24 was 24 packed bits, it looks
>>> like the default is 24 in 32 bits so we may be ok. However I need to
>>> re-write my test case which assumed it was 24bits in 3 bytes (S24_3LE).
>>>
>>> I'll follow up later,
>>
>> Okay, the S24_3LE isn't supported by RT5640 codec in my case. I briefly
>> looked through the TRM doc and got impression that AHUB could re-pack
>> data stream into something that codec supports, but maybe it's a wrong
>> impression.
> 
> I chatted with Sameer about this, so yes the AHUB can repack, but there
> is a problem with S24_LE where if we try to extract 24-bits we actually
> get the upper 24-bits and not the lower LSBs in the 32-bit data element.
> So actually we don't support S24_LE.
> 
> Ben do you need 24-bit support or 32-bit or both?

Any updates? Should we revert all the applied patches for now?

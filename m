Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33F66131D4C
	for <lists+linux-tegra@lfdr.de>; Tue,  7 Jan 2020 02:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbgAGBj7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 6 Jan 2020 20:39:59 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44378 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727326AbgAGBj7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Jan 2020 20:39:59 -0500
Received: by mail-lf1-f68.google.com with SMTP id v201so37650809lfa.11
        for <linux-tegra@vger.kernel.org>; Mon, 06 Jan 2020 17:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Lxnvfp5VC343XHHg909SUXIQiaU3FYHnyesY0NbV52s=;
        b=HEHOaba85kHY2JfMsANHNhKcLo+c9w513es3pIkRwEqTNARv097eQqmvaKoRWI61ow
         FS4QegglU7KBNst4ZuWZY68Ri+mzUOAfPmE6WjOGb02+FG/AAHbP60uMfmMaZfB9c/6N
         vZf3jMD/vjeKjEH8862bWNIhN79TxWDxuT2GIc6Ah6kR1qoUKGBuk/ya6v006wjVWxWJ
         CPW8vYUFLb90w2OFlvaHrDS38fiDJRIN+Bk7QHFHnTXIbkwTJX/0HPHpTuHyFRt2xkhD
         PDWm3pnFA1lqMpqHhMSo6Ilcrr2iqkgR3hu2je1j8sIviATi9RHx6QSIrgNrfg85jAq0
         iviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Lxnvfp5VC343XHHg909SUXIQiaU3FYHnyesY0NbV52s=;
        b=QHqCvq+k+kZeM+FXTfMHd/WKsXWVWgDv3WheoiXOiTWSMpljlCQn6q6Q5pJUYtIqMc
         uKcKF11ud3jFfNqUpF1Ywa66SP0wdILgOU/uDA3pTEXJcNSFCU8ugZpawynMqQR0wKy1
         235k8g317ax6lIeY2OwPXtIQF5Pif3LQZcteUvGseHByUBxBclIDWFLkn/zY9T2sMdge
         C6l7zfH+1ORXUOTGpJs8TjqdLBZz4ehHtTKn6O6zggkhtc0AKwWMcs+mzrGh9LaC+gbN
         t69zXR/ZKooJVnvsob7//kUefliQlBCcl7eH1ls93XXXKt/BT646pSLuA9gcZvlCmXK4
         aOGg==
X-Gm-Message-State: APjAAAV/F1r3FcvNCJMJ7Qi0n6Ug966KNAoHw9zDtAi1kks39I4fCcDT
        N/GtIzoZyjnl3NGzUDSNtWc=
X-Google-Smtp-Source: APXvYqwCjxdSfvtwXVkhI/bAkHyw7cLLOmc2xoNHKZwXrac30TuwkcRP9oPm95HbZid+Snrc8YlhZQ==
X-Received: by 2002:ac2:5605:: with SMTP id v5mr59898160lfd.136.1578361197030;
        Mon, 06 Jan 2020 17:39:57 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id q11sm22285429ljm.76.2020.01.06.17.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2020 17:39:56 -0800 (PST)
Subject: Re: [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit
 samples
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
Date:   Tue, 7 Jan 2020 04:39:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

06.01.2020 22:00, Ben Dooks пишет:
> On 05/01/2020 10:53, Ben Dooks wrote:
>>
>>
>> On 2020-01-05 01:48, Dmitry Osipenko wrote:
>>> 05.01.2020 03:04, Ben Dooks пишет:
>>>> [snip]
>>>>
>>>> I've just gone through testing.
>>>>
>>>> Some simple data tests show 16 and 32-bits work.
>>>>
>>>> The 24 bit case seems to be weird, it looks like the 24-bit expects
>>>> 24 bit samples in 32 bit words. I can't see any packing options to
>>>> do 24 bit in 24 bit, so we may have to remove 24 bit sample support
>>>> (which is a shame)
>>>>
>>>> My preference is to remove the 24-bit support and keep the 32 bit in.
>>>>
>>>
>>> Interesting.. Jon, could you please confirm that 24bit format isn't
>>> usable on T30?
>>
>> If there is an option of 24 packed into 32, then I think that would work.
>>
>> I can try testing that with raw data on Monday.
> 
> I need to check some things, I assumed 24 was 24 packed bits, it looks
> like the default is 24 in 32 bits so we may be ok. However I need to
> re-write my test case which assumed it was 24bits in 3 bytes (S24_3LE).
> 
> I'll follow up later,

Okay, the S24_3LE isn't supported by RT5640 codec in my case. I briefly
looked through the TRM doc and got impression that AHUB could re-pack
data stream into something that codec supports, but maybe it's a wrong
impression.

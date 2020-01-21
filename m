Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCA11444A4
	for <lists+linux-tegra@lfdr.de>; Tue, 21 Jan 2020 19:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbgAUSy2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 21 Jan 2020 13:54:28 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40478 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729081AbgAUSy2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Jan 2020 13:54:28 -0500
Received: by mail-ed1-f65.google.com with SMTP id b8so4072689edx.7
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jan 2020 10:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5wQMTpimvaMznbvYI4EKz0kLTIVvcRzlxme+D5Y8GcY=;
        b=DBize4MQMnv3Ysj1ZktpwCNoe1WJDC7RbzwC954usMDvHcckIHSjCEXz5eXmBDeB+s
         V97xHmAtcjCist0T4VI5yAH5I9dbneqt8IAlpsCoYqE35vvSBDbq3u03Cx9DaFRt13xS
         Kbo3XkLYr0G/kLZcXxAcWYyPtc4+3r1DZbEuTMdHyFPjnBuToubz//YEHw238npUrr0i
         82GAhRd7LcqCZefhm6F2ioFrn0nyDnt5SD7yCGBmJNd1rbG7gQdyfL7amRGpx2S4D20T
         /Na12JL3+X+as27RZ0gzw9rpeLrGmsWlrXzZuRgSpvpRoHkuVxLZAviNFtyx1UQzgTs/
         eYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5wQMTpimvaMznbvYI4EKz0kLTIVvcRzlxme+D5Y8GcY=;
        b=YEIr7wPPQfbc6fLvb5WFPkzso5L26NnyzOBMRrmj80L8CgUTwnZqjOAXi62g4ysLoJ
         dOHlZqKf0ok7PrrzUG6UeIq0vU0eMjacSxuPH9TT1z5rWlXkqGYBFvDK0W58sr7uGghP
         cEoLR2Q8arcuMgra1lmbcwToXY6bWqaAmv5+UWuFc2RAfaCV1Y1ZYUSSZICjqa0ymwrJ
         iBEx3BJiqdfYUJlNWIe8LbBb9T/gOzFYCqXjdUObEdli3wQ1TodOfHUcEWB4kqIf4tfJ
         ipnyG/7f5bOAPU3CoKxCz9zFmNxSVOr+7A5F3Yt+s9SwqOk0nXDnU0TCSb0ZLE7iyn5G
         THAg==
X-Gm-Message-State: APjAAAX468cQAFpKXrF1pttkO1RVc6FzSY7J8AYcNXBWbw5Hvq7nv08A
        9auwEnvi04ehWtnqtizvYAr6t4/P
X-Google-Smtp-Source: APXvYqyv9SiwDSHiz7Kv9vtIi33Q50o8KMKFstas+IBpjmjlZTguMS/DRKhqx9SlW2d+WdUEJkAldA==
X-Received: by 2002:a17:906:a859:: with SMTP id dx25mr5713348ejb.226.1579632866508;
        Tue, 21 Jan 2020 10:54:26 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id j63sm1367192edd.81.2020.01.21.10.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 10:54:26 -0800 (PST)
Subject: Re: [alsa-devel] [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit
 samples
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra@vger.kernel.org
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
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
 <eb90ee78-e462-401a-de60-4a9bfc2a00c4@nvidia.com>
 <9fc97644-b679-ef9f-41ca-1d3a5f296f3a@codethink.co.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <01154788-89a6-8937-130c-4618c105d409@gmail.com>
Date:   Tue, 21 Jan 2020 21:54:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <9fc97644-b679-ef9f-41ca-1d3a5f296f3a@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

21.01.2020 21:15, Ben Dooks пишет:
> On 07/01/2020 10:29, Jon Hunter wrote:
>>
>> On 05/01/2020 10:53, Ben Dooks wrote:
>>>
>>>
>>> On 2020-01-05 01:48, Dmitry Osipenko wrote:
>>>> 05.01.2020 03:04, Ben Dooks пишет:
>>>>> [snip]
>>>>>
>>>>> I've just gone through testing.
>>>>>
>>>>> Some simple data tests show 16 and 32-bits work.
>>>>>
>>>>> The 24 bit case seems to be weird, it looks like the 24-bit expects
>>>>> 24 bit samples in 32 bit words. I can't see any packing options to
>>>>> do 24 bit in 24 bit, so we may have to remove 24 bit sample support
>>>>> (which is a shame)
>>>>>
>>>>> My preference is to remove the 24-bit support and keep the 32 bit in.
>>>>>
>>>>
>>>> Interesting.. Jon, could you please confirm that 24bit format isn't
>>>> usable on T30?
>>>
>>> If there is an option of 24 packed into 32, then I think that would
>>> work.
>>>
>>> I can try testing that with raw data on Monday.
>>
>> I will check on this. I would have thought that S24_LE (24-bits packed
>> into 32-bit elements) would be fine. Typically we don't support S24_3LE
>> (24-bits in 24-bit elements).
>>
> 
> I've just had to spend time fixing pulseview/sigrok's i2s handling for
> this, but have run a simple test of S24_LE using a pattern generator
> and the low level output looks ok.
> 
> I will test a bit more tomorrow, but I suspect something else is either
> getting S24_LE wrong or we have some other issue.

Okay, thanks for the update.

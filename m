Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F13AC3FD0
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Oct 2019 20:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732046AbfJAS0P (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 14:26:15 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42269 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731034AbfJAS0P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 14:26:15 -0400
Received: by mail-lj1-f193.google.com with SMTP id y23so14403348lje.9
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2019 11:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UzweArRXT/ArZXnm6+XFg5Q/U3UdCw1QS8GZGtfWoxM=;
        b=NXGKLQhoofHFMqTWOCZjAY70izL5XqHQ6tvjjDVOA57OfQRoc39TMAWJSAJ82nCzYD
         1SPxVLxaHgz8+r209FpSbush7ibOBjNVDOlSd1OZjbvPIfcG4jUUBSrEKj5GpXVx7q/N
         4gkQg+ysXt15fiyubiiB8Sd+KSizL288oBADVg76Fg/FBGJNmY7QvdxY/+xn52DUodpc
         Y30NUtpVtNfTnMyyhrLYH4KXqGkmhhzHjXJh/UnkEVCjBgkNwQclsTSOvldDj8wj+oHq
         WSDX7dy5qR97Z2h1/hiRy3RF3EWdo2Tt9z3mfff1QdwOs46RN1NNU2VmQ5I+TNt3LG2v
         JRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UzweArRXT/ArZXnm6+XFg5Q/U3UdCw1QS8GZGtfWoxM=;
        b=GqIIX2DC0y2LjgZUeYTV9r/GJmq9nMv3qpiZRrbtJraupaCEHYZMpOt3UdwW8eNxsO
         bwLDEIty2hhjm55yM2irXFLhIfarY/OotLSU3aFiiznDDwMVRJvHKc0P+o9APFeDftb7
         ZdNyc85hDcr7ODQPtWW5f9l4/87cv+21syYChXhkAcGuus2CVW3C6AQyD9H9KGFFOpWW
         vebhc4JKAE0t8jQNo9GQXOsIyf17/kRwTlFgdJWx3+YY7i37zK6zZQWkeMLOKpL+Nhzn
         /rP8g137TCYUkwyloncPTB44Y5LlSb9n+3IxD5fIe44dIswFeiRTxbWS/ZmrP1MFg5OS
         3cfA==
X-Gm-Message-State: APjAAAXJo9eUCf7yLYcccAf7DdAbv+J006GHoi5JxZyNW8T/TCletHTu
        ZNowxUu5RTyYlUSGDewBLqSXRSOq
X-Google-Smtp-Source: APXvYqxwOQgB24op6grVkeFHLz4E+jtS05u2HP3aYT+dcOYfjJFtjefhnf/JvLcQjT7UKLkUCMZV9w==
X-Received: by 2002:a05:651c:1132:: with SMTP id e18mr17038654ljo.33.1569954372750;
        Tue, 01 Oct 2019 11:26:12 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-32-67.pppoe.spdop.ru. [94.29.32.67])
        by smtp.googlemail.com with ESMTPSA id z26sm4238041lji.79.2019.10.01.11.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2019 11:26:11 -0700 (PDT)
Subject: Re: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
 <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
 <CAMdYzYq9ovn3JnSmRks2WHJe3haF8kGEkVpO_UShQLCkX8vgJA@mail.gmail.com>
 <33559f3b-780a-1e37-3d7c-d61357d32e43@gmail.com>
 <CAMdYzYoT6ZG0Qaj9FxgnjLhzwFmo0580F4JgSH2-o9B-Ei-ciw@mail.gmail.com>
 <7b20bd86-08a9-a4de-cb8c-a7624d7df6cb@gmail.com>
 <CAMdYzYqOWsD8ypmANJ32m0A=qYmoaWbPKNB_xRuVS34Fjo1wGA@mail.gmail.com>
 <2e3bb349-fb62-180b-5f07-402500d4e427@gmail.com>
 <CAMdYzYr3MikMF721PCZmAhFxrmJHt6ZtmYruF_i8tbhpkGPq2g@mail.gmail.com>
 <9f9939ba-e28b-74f6-a852-8a76ce9a6b42@gmail.com>
 <f61aea11-47b5-ec00-9e4f-3938b0e78694@gmail.com>
 <CAMdYzYr7irO-qLKws2cFZm6y1iuBj7RQRmUA4Zzx7vO-QoEKVw@mail.gmail.com>
 <980e7e6e-97e4-4b44-f273-677cbd777cf7@gmail.com>
 <CAMdYzYptUQHcTRjxj0SC5M13E2jTPUcZnnq7GC9sCTcUyHqxrQ@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <38f4da40-15b5-dd67-d6e8-0279a722475a@gmail.com>
Date:   Tue, 1 Oct 2019 21:26:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAMdYzYptUQHcTRjxj0SC5M13E2jTPUcZnnq7GC9sCTcUyHqxrQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.10.2019 20:07, Peter Geis пишет:
> On Tue, Oct 1, 2019 at 12:12 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 01.10.2019 15:49, Peter Geis пишет:
>>> On Mon, Sep 30, 2019 at 5:27 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>
>>>> 30.09.2019 23:55, Dmitry Osipenko пишет:
>>>>> 30.09.2019 23:05, Peter Geis пишет:
>>>>>> Good Afternoon,
>>>>>>
>>>>>> I have prepped the patch for the tegra-udc driver to fail out in host
>>>>>> mode and load as a peripheral in otg mode.
>>>>
>>>> Just to be clear, this part is good to me. Although, doesn't CI driver
>>>> operates by default in a peripheral mode when drm_mode=otg?
>>>>
>>> The code sets OTG mode in the case of mode is unknown.
>>> Based off the code path and behavior on my devices, I'm pretty sure it
>>> defaults to host unless something intervenes in the process, such as
>>> extcon.
>>
>> Okay! It definitely defaults to the peripheral mode in my case, sounds
>> like sensing is working for the OTG mode in yours case.
> 
>>
>>> I'll see if I can get host mode working, as I'd really like to see
>>> your Tegra30 cpufreq drivers land.
>>>
>>
>> Please let us know if you'll have any progress, I'll also try to look at
>> it sometime soon.
> 
> I got host mode working, it's the same issue with dma alignment that
> was killing gadget mode.
> I did it by literally ripping the dma alignment code out of the
> tegra-ehci driver and it's hideous right now.
> Need to figure out a better way to accomplish that.

That's very nice! Please ping me once you'll have something to try.

>>
>> It will be very nice if all of the pending patches could get into next
>> release. You could also help with that by testing the patches, usually
>> it helps to get some more attention from maintainers.
> 
> I'm currently testing the cpuidle driver on both the Xoom and the
> Ouya, but I haven't seen the cpufreq drivers recently.
> Any other patch sets you'd like tested?

I'll be sending out new cpufreq patches to the mailing list soon, will
add you to the CC list. Right now you could find all the patches in the
grate-driver's kernel github [1]. I don't have anything specific to
test, although maybe T30 memory driver and T20/30 devfreq support are
interesting for you to try? Please let me know if you'll spot any
problem or have any question.

[1] https://github.com/grate-driver/linux

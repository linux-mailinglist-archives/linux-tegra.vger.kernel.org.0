Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56799C28CA
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Sep 2019 23:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729357AbfI3V1t (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 Sep 2019 17:27:49 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44034 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbfI3V1t (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Sep 2019 17:27:49 -0400
Received: by mail-lf1-f65.google.com with SMTP id q11so8163220lfc.11
        for <linux-tegra@vger.kernel.org>; Mon, 30 Sep 2019 14:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/uNq/RBtJ3zdg3FO7x7bTjljTdw8TDKXqjTJ+4dX3yU=;
        b=ULhFswQcwVqFc4+lmj7FZnqdGq29GzdlhtJzgMEJcWmpRYgrMssMiG48w60CjDNbEC
         9okLtVbg1X4Z1Udnrb413npIDwt6+2Nb9i/odbsdhh+WKPpKAN7EvBo18Vts6h4UDt3E
         q2emFOjLXoKkPuDWYoZxxH7Yz+q6rANpSOcxqo/BIy8zfkzynfPZhM5/MeF6P2Em9Utp
         Np3p21JfXLHzsxGYbkdoGBi79sdNZ85mH6NYISnPqgWXRweR6gctRXG22L2bd3A8mir3
         YDuQGnmBUjkYBmmR3G2JZw3XLmjJ8aaimDq7g8nq6ARkdD9aiu7jJI0o7ySpRk6SdqX4
         F32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/uNq/RBtJ3zdg3FO7x7bTjljTdw8TDKXqjTJ+4dX3yU=;
        b=Yb513LJubg1hHoeShUwAvx8miD4iFxeP21XVrzFPjz/S5ZhnZ0w0G1nyv8Wk3sHNRC
         4nRwcHQkeDnFZhYzuTZ9vno+3FCNO9tnSOionfRa0YpJkA7Foi0enyotT7+sBPEpszpk
         t5S7s+++1z0d7X+8YSqqvP1XvY+UMOkdlPvP96QGEOwWUphEarvplC87nPoMMcsbtkRp
         Mk8kV+WQ44Id62QTkl6dwiEiskbOW/wFIicQcmcvfrx/9LRByU/L+aUaKWKwhAArvCHI
         f6Wn0ZQ5qKUcY1Al6Y+5Zo+re+DceBNDI6xlEkyoGSogrSSVhwchhnEtZkkElvC8q7o+
         UqmQ==
X-Gm-Message-State: APjAAAXl2Bj6OJtFvOg/AB9AqZljP1aYYxOE22oSorN/7EAKIGVfZiwC
        nFgx9MMTwK+lXxjM6P4vDmz1D9R+
X-Google-Smtp-Source: APXvYqz2BZGMoVwuyeHazC4EBAfyCBt9P7uicCIo1VAWzAEcNA9k281H7ZTcztuzHjl++rg8eN/Krg==
X-Received: by 2002:ac2:5203:: with SMTP id a3mr12458447lfl.151.1569878866214;
        Mon, 30 Sep 2019 14:27:46 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-32-67.pppoe.spdop.ru. [94.29.32.67])
        by smtp.googlemail.com with ESMTPSA id c6sm3022291lfh.65.2019.09.30.14.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2019 14:27:45 -0700 (PDT)
Subject: Re: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
From:   Dmitry Osipenko <digetx@gmail.com>
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
Message-ID: <f61aea11-47b5-ec00-9e4f-3938b0e78694@gmail.com>
Date:   Tue, 1 Oct 2019 00:27:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <9f9939ba-e28b-74f6-a852-8a76ce9a6b42@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2019 23:55, Dmitry Osipenko пишет:
> 30.09.2019 23:05, Peter Geis пишет:
>> Good Afternoon,
>>
>> I have prepped the patch for the tegra-udc driver to fail out in host
>> mode and load as a peripheral in otg mode.

Just to be clear, this part is good to me. Although, doesn't CI driver
operates by default in a peripheral mode when drm_mode=otg?

>> My reasoning for this is as follows:
>> host mode allows devices to enumerate, but data cannot transmit correctly
>> otg mode allows mode switching which is broken and was never supported
>> peripheral mode is the only function that behaves correctly
>>
>> My presumption is this is caused by the chipidea driver not handling
>> the tegra specific quirks.
>> Reading through how nice and clean the tegra-ehci driver is, I'm
>> wondering if it would be better to simply pull the requisite gadget
>> stuff into the ehci driver, vice trying to wedge into the chipidea
>> driver.
>>
>> What do y'all think?
> 
> Not possible. The ChipIdea driver supports multiple vendors, it is
> universal and should have all functionality needed by the host mode.
> There is no point in duplicating the effort.
> 
> Looking at host.c of CI driver I even see that it has references to the
> tegra-ehci driver. I may take a look at what it would take to replace
> tegra-ehci driver with the CI, then there will one less USB driver for
> the same hardware (IIRC, the fsl-usb2-udc also potentially could be
> squashed into the CI driver).
> 
>> On Mon, Sep 30, 2019 at 1:55 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>>
>>> 30.09.2019 20:46, Peter Geis пишет:
>>>> On Mon, Sep 30, 2019 at 1:42 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>>
>>>>> 30.09.2019 18:54, Peter Geis пишет:
>>>>>> Dmitry,
>>>>>>
>>>>>> As far as I can tell the cpuidle drivers work perfectly, but I don't
>>>>>> have full power management yet on either my T20 device nor my T30
>>>>>> device.
>>>>>> They aren't the cause of this though.
>>>>>>
>>>>>> I've been sticking to the mainline release code since 5.3 landed, as
>>>>>> something was merged into linux-next that breaks brcm4329/brcm4330
>>>>>> firmware loading.
>>>>>>
>>>>>> Jumping to linux-next to test your driver just revealed the behavior.
>>>>>>
>>>>>> On my T20 device I haven't encountered issues, but that operates
>>>>>> almost exclusively in gadget mode.
>>>>>> On my T30 device tegra-udc is misbehaving, especially on linux-next.
>>>>>>
>>>>>> By removing the hardcoded LL_DEBUG config and moving to a command line
>>>>>> earlycon statement, I seem to be making progress in capturing what's
>>>>>> going on.
>>>>>> With the following actions, I got a panic crash dump:
>>>>>> phy set to peripheral, boot with tegra-ehci in host mode, usb hub plugged in.
>>>>>> Booted successfully, hub enumerated, passed data through attached
>>>>>> ethernet device.
>>>>>> Unbind the tegra-ehci driver, bind the tegra-udc driver.
>>>>>> Hub enumerates, as well as attached ethernet device, but writes to the
>>>>>> device throw constant errors.
>>>>>
>>>>> Is the host mode working properly when booting with the tegra-udc as a
>>>>> primary driver?
>>>>
>>>> I actually got it working <once>.
>>>> It threw constant reset errors though.
>>>> Afterwards a soft reboot caused the kernel to crash with an irq-init error.
>>>> tegra-ehci is the only stable host driver.
>>>
>>> Okay, I guess the host mode requires some extra configuration (or some
>>> quirk) that is currently missing in the tegra-udc. You may try to
>>> compare what tegra-ehci and tegra-udc do differently and then figure out
>>> how make it to work, for now I don't have any better advises.
>>>
>>>>>> Unbind the tegra-udc driver, produces the following panic:
>>>>>
>>>>> Looks like it is a CI driver bug, perhaps timer's tear down isn't
>>>>> performed correctly. Maybe it is related to the errors you're seeing and
>>>>> something getting stuck with the offending timer being active during of
>>>>> the driver's unbinding..
>>>>>
>>>>> Probably Peter Chen could help with that.
>>>>>
>>>>> [snip]
>>>
> 


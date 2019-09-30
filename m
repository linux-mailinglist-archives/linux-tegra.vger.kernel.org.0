Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC586C2694
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Sep 2019 22:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730977AbfI3UiA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 Sep 2019 16:38:00 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33141 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730105AbfI3UiA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Sep 2019 16:38:00 -0400
Received: by mail-lj1-f196.google.com with SMTP id a22so10958173ljd.0
        for <linux-tegra@vger.kernel.org>; Mon, 30 Sep 2019 13:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BDZEKC+3T86MmRp+oimXllMJhDINroEo8QQSv+JeSeM=;
        b=MSQj1HjZp1UGKqbX//Hcs+wqxmi1pYG01X74r2/om8CfNKzWUoBwCXS/0DPk8aHb9H
         fY3lMk3oLnO48+YlvEjxNlp3Kfv7vuLktL1SYou/QdnMDRf4TDmJEIhMD5X9XT4gWL9I
         6Elt42MWlIc51QwVNjLPtcq5DqUSj3DF447ASEGndn3mE8qV9mQdss+nQtXZbUB2SNBD
         Dea6lh7xcwBAXbW0HPh3/AuetyZd5FjKzIg66RZJtxv8DJD12XMiyzXFq5VYcYy4ZDyw
         jrNAR/AewwvES7yHanj9jcy/KkZey5UMsbIILoMEqsAIMb4/bP8UyK2c/viN983VoAj8
         4xqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BDZEKC+3T86MmRp+oimXllMJhDINroEo8QQSv+JeSeM=;
        b=pxwgj+yCZlhRfcT8S5CDGMSyHvF/yDVrtfmktY0dRVEOXAWwXG2n6vcnvBj9K1I5Hb
         7FVKxVhw/+aBhWk7ar/5L5xdywMr6yJDKpVSIn/ADJjFBSWOrg4OCf9KQqiWD/9ylBhK
         m1+2q0Vk6fKTLF4BMEUTxvyvRkfQPNRM+YQGj/whJ7n5PBSPuS5ImFYbvvxI0UvIJ1Ts
         ljN7EDf5O9Nn0FtnTrhxmIVqzNXzY54loeaHIqkkyowRnO9pk2A6UyYdYuOOy/BTGym0
         4JwBJGZOPohb4WePAxAxMvA0Bz71i4PQU25Frs5fRROVZhYejiUC/2/u2eBstlEY8kJg
         F9nA==
X-Gm-Message-State: APjAAAU4DzrlAwl4S9OiOANfwqyzK4jzdLNDrFx73RIs/Rvt0brNeJ9r
        rFDzZKPLmwvB+Q4caoy9Gfk2wWeJ
X-Google-Smtp-Source: APXvYqz1EXKQooJeSVV6IimYVsbH/XiKBC+1GDfQr611kfVFmtxaa0gW6AR5ULGd6E2vFoPYckStKA==
X-Received: by 2002:a2e:b4ee:: with SMTP id s14mr13106061ljm.76.1569866145052;
        Mon, 30 Sep 2019 10:55:45 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-32-67.pppoe.spdop.ru. [94.29.32.67])
        by smtp.googlemail.com with ESMTPSA id o15sm3229795lff.22.2019.09.30.10.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2019 10:55:44 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2e3bb349-fb62-180b-5f07-402500d4e427@gmail.com>
Date:   Mon, 30 Sep 2019 20:55:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAMdYzYqOWsD8ypmANJ32m0A=qYmoaWbPKNB_xRuVS34Fjo1wGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2019 20:46, Peter Geis пишет:
> On Mon, Sep 30, 2019 at 1:42 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 30.09.2019 18:54, Peter Geis пишет:
>>> Dmitry,
>>>
>>> As far as I can tell the cpuidle drivers work perfectly, but I don't
>>> have full power management yet on either my T20 device nor my T30
>>> device.
>>> They aren't the cause of this though.
>>>
>>> I've been sticking to the mainline release code since 5.3 landed, as
>>> something was merged into linux-next that breaks brcm4329/brcm4330
>>> firmware loading.
>>>
>>> Jumping to linux-next to test your driver just revealed the behavior.
>>>
>>> On my T20 device I haven't encountered issues, but that operates
>>> almost exclusively in gadget mode.
>>> On my T30 device tegra-udc is misbehaving, especially on linux-next.
>>>
>>> By removing the hardcoded LL_DEBUG config and moving to a command line
>>> earlycon statement, I seem to be making progress in capturing what's
>>> going on.
>>> With the following actions, I got a panic crash dump:
>>> phy set to peripheral, boot with tegra-ehci in host mode, usb hub plugged in.
>>> Booted successfully, hub enumerated, passed data through attached
>>> ethernet device.
>>> Unbind the tegra-ehci driver, bind the tegra-udc driver.
>>> Hub enumerates, as well as attached ethernet device, but writes to the
>>> device throw constant errors.
>>
>> Is the host mode working properly when booting with the tegra-udc as a
>> primary driver?
> 
> I actually got it working <once>.
> It threw constant reset errors though.
> Afterwards a soft reboot caused the kernel to crash with an irq-init error.
> tegra-ehci is the only stable host driver.

Okay, I guess the host mode requires some extra configuration (or some
quirk) that is currently missing in the tegra-udc. You may try to
compare what tegra-ehci and tegra-udc do differently and then figure out
how make it to work, for now I don't have any better advises.

>>> Unbind the tegra-udc driver, produces the following panic:
>>
>> Looks like it is a CI driver bug, perhaps timer's tear down isn't
>> performed correctly. Maybe it is related to the errors you're seeing and
>> something getting stuck with the offending timer being active during of
>> the driver's unbinding..
>>
>> Probably Peter Chen could help with that.
>>
>> [snip]


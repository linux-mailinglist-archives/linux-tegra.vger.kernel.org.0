Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A52F46C1A7
	for <lists+linux-tegra@lfdr.de>; Wed, 17 Jul 2019 21:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbfGQTnt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 17 Jul 2019 15:43:49 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40296 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfGQTns (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Jul 2019 15:43:48 -0400
Received: by mail-lj1-f195.google.com with SMTP id m8so24811244lji.7;
        Wed, 17 Jul 2019 12:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hTJmfiThIyeo9KQe53HMG/Ol3pe8lZCYSPEnHlv1WJ8=;
        b=fD+tIZoYFx+7yUwQexG2cxjZ5UfnYOp/EEHYzlDXHjxA9Mjawv8f5jisMDZsSeowpB
         HPxdHgf+jUvkMlSGWvOOYTf10xBILX2AJobEqDptnflZv2YoYrit2INP7n/rfluPWkkC
         slxplqw5rtKuF4Ek/hq5EGeMu/4USLWxfYN3x/8fzC/aXUOzG0fx9DyZWE4VXsSd3MuQ
         7nyrq5Ye1/3bCrDxT78heai027+ybawMYrrSJj0dRfGAUiB0sCHLu9vFsPtMn43XHAzj
         KCc+K39emkYmQMVjrVmH6P7SfwGaJzU9oyeTyUqJs0rvWgAxlbWxSHgrWeFuev/T5S5W
         odlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hTJmfiThIyeo9KQe53HMG/Ol3pe8lZCYSPEnHlv1WJ8=;
        b=dSHoMNwdqPzUP89mZmJsJgZ7OVHnV/4RqKtKLNp1M1Fv5nRbE7yfPkCZ9o7WLZdkJg
         Dh0Ppj6AAhc9re/2InQeKyftJpn+xlh15I5TgjR1vXbGU5NX/sNcAoomdKp/sKLnQ5dC
         IGSxuAmqHivsyk6pbIa24fgUQnXo7HVID7D5qmxzV7AM47tqTXNq1T2B3+XvtjqXZqxF
         hE5oYjoOR30DiBhPOc+3HCJ7ynsx1Wx6tNb9HNWskGVbozTQ6pokMQ+frF9CNAgjunUt
         V4DRoeEyQcez9WZuY5Fw1A5HJSavcYuA9K5O3gaT/glsEDeYz9c92sLb6QsSA9O2xiwV
         qcTw==
X-Gm-Message-State: APjAAAXrPQ/QwaHMiSECtdGHElrap4pLRHVBdygaK2P6MB5NRG0n5gWS
        4/jdUDEbDE6DFBspYgtFEMVuWSjy
X-Google-Smtp-Source: APXvYqwDrsFdx2D4ZfREk7rLLbUD3O2IKF6kK2v0a+BTJ5xdutZba5cJIs3eS7Bfk0fgmt2C/cu5rA==
X-Received: by 2002:a2e:8007:: with SMTP id j7mr21959833ljg.191.1563392624195;
        Wed, 17 Jul 2019 12:43:44 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id e87sm5268402ljf.54.2019.07.17.12.43.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 12:43:43 -0700 (PDT)
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net,
        marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch,
        mark.rutland@arm.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
References: <a5e1a6df-dff7-9e0c-9551-f78103a5462f@gmail.com>
 <27641e30-fdd1-e53a-206d-71e1f23343fd@gmail.com>
 <10c4b9a2-a857-d124-c22d-7fd71a473079@nvidia.com>
 <fd8bad73-464b-54f1-be94-fe3ac8b23e6e@gmail.com>
 <0ee06d1a-310d-59f7-0aa6-b688b33447f5@nvidia.com>
 <cedfafd0-4114-0821-0c4b-efc17c213449@gmail.com>
 <707c4679-fde6-1714-ced0-dcf7ca8380a9@nvidia.com>
 <c6c0a205-c083-fd46-361c-175bd8840c6e@nvidia.com>
 <055457fd-621b-6c93-b671-d5e5380698c6@nvidia.com>
 <20190717071105.3750a021@dimatab>
 <77df234f-aa40-0319-a593-f1f19f0f1c2a@nvidia.com>
 <20190717084221.2e9af56c@dimatab>
 <093462f3-8c6d-d084-9822-ae4eff041c64@nvidia.com>
 <20190717093317.70fefb27@dimatab>
 <6e73dcee-6e24-b646-97a4-4b34aedd231d@nvidia.com>
 <16f8b146-2581-a842-4997-53ab05b62c70@gmail.com>
 <d7892bfc-2cbf-27af-518d-dc7e243815b8@nvidia.com>
 <71272e9a-0f2a-c20d-6532-7e9057ad985c@gmail.com>
 <78fd19b9-b652-8ac3-1f57-3b4adadee03f@nvidia.com>
 <351a07d4-ba90-4793-129b-b1a733f95531@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e3e9beaf-b195-305e-4010-66e824813472@gmail.com>
Date:   Wed, 17 Jul 2019 22:43:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <351a07d4-ba90-4793-129b-b1a733f95531@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.07.2019 21:54, Sowjanya Komatineni пишет:
> 
> On 7/17/19 11:51 AM, Sowjanya Komatineni wrote:
>>
>> On 7/17/19 11:32 AM, Dmitry Osipenko wrote:
>>> 17.07.2019 20:29, Sowjanya Komatineni пишет:
>>>> On 7/17/19 8:17 AM, Dmitry Osipenko wrote:
>>>>> 17.07.2019 9:36, Sowjanya Komatineni пишет:
>>>>>> On 7/16/19 11:33 PM, Dmitry Osipenko wrote:
>>>>>>> В Tue, 16 Jul 2019 22:55:52 -0700
>>>>>>> Sowjanya Komatineni <skomatineni@nvidia.com> пишет:
>>>>>>>
>>>>>>>> On 7/16/19 10:42 PM, Dmitry Osipenko wrote:
>>>>>>>>> В Tue, 16 Jul 2019 22:25:25 -0700
>>>>>>>>> Sowjanya Komatineni <skomatineni@nvidia.com> пишет:
>>>>>>>>>> On 7/16/19 9:11 PM, Dmitry Osipenko wrote:
>>>>>>>>>>> В Tue, 16 Jul 2019 19:35:49 -0700
>>>>>>>>>>> Sowjanya Komatineni <skomatineni@nvidia.com> пишет:
>>>>>>>>>>>> On 7/16/19 7:18 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>> On 7/16/19 3:06 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>>> On 7/16/19 3:00 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>> 17.07.2019 0:35, Sowjanya Komatineni пишет:
>>>>>>>>>>>>>>>> On 7/16/19 2:21 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>> 17.07.2019 0:12, Sowjanya Komatineni пишет:
>>>>>>>>>>>>>>>>>> On 7/16/19 1:47 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>> 16.07.2019 22:26, Sowjanya Komatineni пишет:
>>>>>>>>>>>>>>>>>>>> On 7/16/19 11:43 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>>>> 16.07.2019 21:30, Sowjanya Komatineni пишет:
>>>>>>>>>>>>>>>>>>>>>> On 7/16/19 11:25 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>>>>>> 16.07.2019 21:19, Sowjanya Komatineni пишет:
>>>>>>>>>>>>>>>>>>>>>>>> On 7/16/19 9:50 AM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>>>>>>>>>>>>>> On 7/16/19 8:00 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>>>>>>>>> 16.07.2019 11:06, Peter De Schrijver пишет:
>>>>>>>>>>>>>>>>>>>>>>>>>>> On Tue, Jul 16, 2019 at 03:24:26PM +0800, Joseph
>>>>>>>>>>>>>>>>>>>>>>>>>>> Lo wrote:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> OK, Will add to CPUFreq driver...
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> The other thing that also need attention is
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> that T124 CPUFreq
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> driver
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> implicitly relies on DFLL driver to be probed
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> first, which is
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> icky.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Should I add check for successful dfll clk
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> register explicitly in
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPUFreq driver probe and defer till dfll clk
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> registers?
>>>>>>>>>>>>>>>>>>>>>>>>>> Probably you should use the "device links". See
>>>>>>>>>>>>>>>>>>>>>>>>>> [1][2] for the
>>>>>>>>>>>>>>>>>>>>>>>>>> example.
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>> [1]
>>>>>>>>>>>>>>>>>>>>>>>>>> https://elixir.bootlin.com/linux/v5.2.1/source/drivers/gpu/drm/tegra/dc.c#L2383
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>> [2]
>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.kernel.org/doc/html/latest/driver-api/device_link.html
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>> Return EPROBE_DEFER instead of EINVAL if
>>>>>>>>>>>>>>>>>>>>>>>>>> device_link_add() fails.
>>>>>>>>>>>>>>>>>>>>>>>>>> And
>>>>>>>>>>>>>>>>>>>>>>>>>> use of_find_device_by_node() to get the DFLL's
>>>>>>>>>>>>>>>>>>>>>>>>>> device, see [3].
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>> [3]
>>>>>>>>>>>>>>>>>>>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/devfreq/tegra20-devfreq.c#n100
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>> Will go thru and add...
>>>>>>>>>>>>>>>>>>>>>>> Looks like I initially confused this case with
>>>>>>>>>>>>>>>>>>>>>>> getting
>>>>>>>>>>>>>>>>>>>>>>> orphaned clock.
>>>>>>>>>>>>>>>>>>>>>>> I'm now seeing that the DFLL driver registers the
>>>>>>>>>>>>>>>>>>>>>>> clock and then
>>>>>>>>>>>>>>>>>>>>>>> clk_get(dfll) should be returning EPROBE_DEFER until
>>>>>>>>>>>>>>>>>>>>>>> DFLL driver is
>>>>>>>>>>>>>>>>>>>>>>> probed, hence everything should be fine as-is and
>>>>>>>>>>>>>>>>>>>>>>> there is no real
>>>>>>>>>>>>>>>>>>>>>>> need
>>>>>>>>>>>>>>>>>>>>>>> for the 'device link'. Sorry for the confusion!
>>>>>>>>>>>>>>>>>>>>>>>>>>>> Sorry, I didn't follow the mail thread. Just
>>>>>>>>>>>>>>>>>>>>>>>>>>>> regarding the DFLL
>>>>>>>>>>>>>>>>>>>>>>>>>>>> part.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>> As you know it, the DFLL clock is one of the
>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPU
>>>>>>>>>>>>>>>>>>>>>>>>>>>> clock sources and
>>>>>>>>>>>>>>>>>>>>>>>>>>>> integrated with DVFS control logic with the
>>>>>>>>>>>>>>>>>>>>>>>>>>>> regulator. We will not
>>>>>>>>>>>>>>>>>>>>>>>>>>>> switch
>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPU to other clock sources once we switched to
>>>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL. Because the
>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPU has
>>>>>>>>>>>>>>>>>>>>>>>>>>>> been regulated by the DFLL HW with the DVFS
>>>>>>>>>>>>>>>>>>>>>>>>>>>> table
>>>>>>>>>>>>>>>>>>>>>>>>>>>> (CVB or OPP
>>>>>>>>>>>>>>>>>>>>>>>>>>>> table
>>>>>>>>>>>>>>>>>>>>>>>>>>>> you see
>>>>>>>>>>>>>>>>>>>>>>>>>>>> in the driver.). We shouldn't reparent it to
>>>>>>>>>>>>>>>>>>>>>>>>>>>> other sources with
>>>>>>>>>>>>>>>>>>>>>>>>>>>> unknew
>>>>>>>>>>>>>>>>>>>>>>>>>>>> freq/volt pair. That's not guaranteed to
>>>>>>>>>>>>>>>>>>>>>>>>>>>> work. We
>>>>>>>>>>>>>>>>>>>>>>>>>>>> allow switching to
>>>>>>>>>>>>>>>>>>>>>>>>>>>> open-loop mode but different sources.
>>>>>>>>>>>>>>>>>>>>>>>>>> Okay, then the CPUFreq driver will have to
>>>>>>>>>>>>>>>>>>>>>>>>>> enforce
>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL freq to
>>>>>>>>>>>>>>>>>>>>>>>>>> PLLP's
>>>>>>>>>>>>>>>>>>>>>>>>>> rate before switching to PLLP in order to have a
>>>>>>>>>>>>>>>>>>>>>>>>>> proper CPU voltage.
>>>>>>>>>>>>>>>>>>>>>>>>> PLLP freq is safe to work for any CPU voltage.
>>>>>>>>>>>>>>>>>>>>>>>>> So no
>>>>>>>>>>>>>>>>>>>>>>>>> need to enforce
>>>>>>>>>>>>>>>>>>>>>>>>> DFLL freq to PLLP rate before changing CCLK_G
>>>>>>>>>>>>>>>>>>>>>>>>> source
>>>>>>>>>>>>>>>>>>>>>>>>> to PLLP during
>>>>>>>>>>>>>>>>>>>>>>>>> suspend
>>>>>>>>>>>>>>>>>>>>>>>> Sorry, please ignore my above comment. During
>>>>>>>>>>>>>>>>>>>>>>>> suspend, need to change
>>>>>>>>>>>>>>>>>>>>>>>> CCLK_G source to PLLP when dfll is in closed loop
>>>>>>>>>>>>>>>>>>>>>>>> mode first and
>>>>>>>>>>>>>>>>>>>>>>>> then
>>>>>>>>>>>>>>>>>>>>>>>> dfll need to be set to open loop.
>>>>>>>>>>>>>>>>>>>>>>> Okay.
>>>>>>>>>>>>>>>>>>>>>>>>>>>> And I don't exactly understand why we need to
>>>>>>>>>>>>>>>>>>>>>>>>>>>> switch to PLLP in
>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPU
>>>>>>>>>>>>>>>>>>>>>>>>>>>> idle
>>>>>>>>>>>>>>>>>>>>>>>>>>>> driver. Just keep it on CL-DVFS mode all the
>>>>>>>>>>>>>>>>>>>>>>>>>>>> time.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>> In SC7 entry, the dfll suspend function
>>>>>>>>>>>>>>>>>>>>>>>>>>>> moves it
>>>>>>>>>>>>>>>>>>>>>>>>>>>> the open-loop
>>>>>>>>>>>>>>>>>>>>>>>>>>>> mode. That's
>>>>>>>>>>>>>>>>>>>>>>>>>>>> all. The sc7-entryfirmware will handle the rest
>>>>>>>>>>>>>>>>>>>>>>>>>>>> of the sequence to
>>>>>>>>>>>>>>>>>>>>>>>>>>>> turn off
>>>>>>>>>>>>>>>>>>>>>>>>>>>> the CPU power.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>> In SC7 resume, the warmboot code will handle
>>>>>>>>>>>>>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>>>>>>>>>>>>>> sequence to
>>>>>>>>>>>>>>>>>>>>>>>>>>>> turn on
>>>>>>>>>>>>>>>>>>>>>>>>>>>> regulator and power up the CPU cluster. And
>>>>>>>>>>>>>>>>>>>>>>>>>>>> leave
>>>>>>>>>>>>>>>>>>>>>>>>>>>> it on PLL_P.
>>>>>>>>>>>>>>>>>>>>>>>>>>>> After
>>>>>>>>>>>>>>>>>>>>>>>>>>>> resuming to the kernel, we re-init DFLL,
>>>>>>>>>>>>>>>>>>>>>>>>>>>> restore
>>>>>>>>>>>>>>>>>>>>>>>>>>>> the CPU clock
>>>>>>>>>>>>>>>>>>>>>>>>>>>> policy (CPU
>>>>>>>>>>>>>>>>>>>>>>>>>>>> runs on DFLL open-loop mode) and then moving to
>>>>>>>>>>>>>>>>>>>>>>>>>>>> close-loop mode.
>>>>>>>>>>>>>>>>>>>>>>>>>> The DFLL is re-inited after switching CCLK to
>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL
>>>>>>>>>>>>>>>>>>>>>>>>>> parent during of
>>>>>>>>>>>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>>>>>>>>>>>> early clocks-state restoring by CaR driver. Hence
>>>>>>>>>>>>>>>>>>>>>>>>>> instead of having
>>>>>>>>>>>>>>>>>>>>>>>>>> odd
>>>>>>>>>>>>>>>>>>>>>>>>>> hacks in the CaR driver, it is much nicer to
>>>>>>>>>>>>>>>>>>>>>>>>>> have a
>>>>>>>>>>>>>>>>>>>>>>>>>> proper suspend-resume sequencing of the device
>>>>>>>>>>>>>>>>>>>>>>>>>> drivers. In this case
>>>>>>>>>>>>>>>>>>>>>>>>>> CPUFreq
>>>>>>>>>>>>>>>>>>>>>>>>>> driver is the driver that enables DFLL and
>>>>>>>>>>>>>>>>>>>>>>>>>> switches
>>>>>>>>>>>>>>>>>>>>>>>>>> CPU to that
>>>>>>>>>>>>>>>>>>>>>>>>>> clock
>>>>>>>>>>>>>>>>>>>>>>>>>> source, which means that this driver is also
>>>>>>>>>>>>>>>>>>>>>>>>>> should
>>>>>>>>>>>>>>>>>>>>>>>>>> be responsible for
>>>>>>>>>>>>>>>>>>>>>>>>>> management of the DFLL's state during of
>>>>>>>>>>>>>>>>>>>>>>>>>> suspend/resume process. If
>>>>>>>>>>>>>>>>>>>>>>>>>> CPUFreq driver disables DFLL during suspend and
>>>>>>>>>>>>>>>>>>>>>>>>>> re-enables it
>>>>>>>>>>>>>>>>>>>>>>>>>> during
>>>>>>>>>>>>>>>>>>>>>>>>>> resume, then looks like the CaR driver hacks
>>>>>>>>>>>>>>>>>>>>>>>>>> around
>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL are not
>>>>>>>>>>>>>>>>>>>>>>>>>> needed.
>>>>>>>>>>>>>>>>>>>>>>>>>>>> The DFLL part looks good to me. BTW, change the
>>>>>>>>>>>>>>>>>>>>>>>>>>>> patch subject to
>>>>>>>>>>>>>>>>>>>>>>>>>>>> "Add
>>>>>>>>>>>>>>>>>>>>>>>>>>>> suspend-resume support" seems more
>>>>>>>>>>>>>>>>>>>>>>>>>>>> appropriate to
>>>>>>>>>>>>>>>>>>>>>>>>>>>> me.
>>>>>>>>>>>>>>>>>>>>>>>>>>> To clarify this, the sequences for DFLL use
>>>>>>>>>>>>>>>>>>>>>>>>>>> are as
>>>>>>>>>>>>>>>>>>>>>>>>>>> follows (assuming
>>>>>>>>>>>>>>>>>>>>>>>>>>> all
>>>>>>>>>>>>>>>>>>>>>>>>>>> required DFLL hw configuration has been done)
>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>> Switch to DFLL:
>>>>>>>>>>>>>>>>>>>>>>>>>>> 0) Save current parent and frequency
>>>>>>>>>>>>>>>>>>>>>>>>>>> 1) Program DFLL to open loop mode
>>>>>>>>>>>>>>>>>>>>>>>>>>> 2) Enable DFLL
>>>>>>>>>>>>>>>>>>>>>>>>>>> 3) Change cclk_g parent to DFLL
>>>>>>>>>>>>>>>>>>>>>>>>>>> For OVR regulator:
>>>>>>>>>>>>>>>>>>>>>>>>>>> 4) Change PWM output pin from tristate to output
>>>>>>>>>>>>>>>>>>>>>>>>>>> 5) Enable DFLL PWM output
>>>>>>>>>>>>>>>>>>>>>>>>>>> For I2C regulator:
>>>>>>>>>>>>>>>>>>>>>>>>>>> 4) Enable DFLL I2C output
>>>>>>>>>>>>>>>>>>>>>>>>>>> 6) Program DFLL to closed loop mode
>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>> Switch away from DFLL:
>>>>>>>>>>>>>>>>>>>>>>>>>>> 0) Change cclk_g parent to PLLP so the CPU
>>>>>>>>>>>>>>>>>>>>>>>>>>> frequency is ok for
>>>>>>>>>>>>>>>>>>>>>>>>>>> any
>>>>>>>>>>>>>>>>>>>>>>>>>>> vdd_cpu voltage
>>>>>>>>>>>>>>>>>>>>>>>>>>> 1) Program DFLL to open loop mode
>>>>>>>>>>>>>>>>>>>>>>>> I see during switch away from DFLL (suspend),
>>>>>>>>>>>>>>>>>>>>>>>> cclk_g
>>>>>>>>>>>>>>>>>>>>>>>> parent is not
>>>>>>>>>>>>>>>>>>>>>>>> changed to PLLP before changing dfll to open loop
>>>>>>>>>>>>>>>>>>>>>>>> mode.
>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>> Will add this ...
>>>>>>>>>>>>>>>>>>>>>>> The CPUFreq driver switches parent to PLLP during
>>>>>>>>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>>>>>>>>> probe, similar
>>>>>>>>>>>>>>>>>>>>>>> should be done on suspend.
>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>> I'm also wondering if it's always safe to switch to
>>>>>>>>>>>>>>>>>>>>>>> PLLP in the probe.
>>>>>>>>>>>>>>>>>>>>>>> If CPU is running on a lower freq than PLLP, then
>>>>>>>>>>>>>>>>>>>>>>> some
>>>>>>>>>>>>>>>>>>>>>>> other more
>>>>>>>>>>>>>>>>>>>>>>> appropriate intermediate parent should be selected.
>>>>>>>>>>>>>>>>>>>>>> CPU parents are PLL_X, PLL_P, and dfll. PLL_X always
>>>>>>>>>>>>>>>>>>>>>> runs at higher
>>>>>>>>>>>>>>>>>>>>>> rate
>>>>>>>>>>>>>>>>>>>>>> so switching to PLL_P during CPUFreq probe prior to
>>>>>>>>>>>>>>>>>>>>>> dfll clock enable
>>>>>>>>>>>>>>>>>>>>>> should be safe.
>>>>>>>>>>>>>>>>>>>>> AFAIK, PLLX could run at ~200MHz. There is also a
>>>>>>>>>>>>>>>>>>>>> divided output of
>>>>>>>>>>>>>>>>>>>>> PLLP
>>>>>>>>>>>>>>>>>>>>> which CCLKG supports, the PLLP_OUT4.
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>> Probably, realistically, CPU is always running off a
>>>>>>>>>>>>>>>>>>>>> fast PLLX during
>>>>>>>>>>>>>>>>>>>>> boot, but I'm wondering what may happen on KEXEC. I
>>>>>>>>>>>>>>>>>>>>> guess ideally CPUFreq driver should also have a
>>>>>>>>>>>>>>>>>>>>> 'shutdown' callback to teardown DFLL
>>>>>>>>>>>>>>>>>>>>> on a reboot, but likely that there are other
>>>>>>>>>>>>>>>>>>>>> clock-related problems as
>>>>>>>>>>>>>>>>>>>>> well that may break KEXEC and thus it is not very
>>>>>>>>>>>>>>>>>>>>> important at the
>>>>>>>>>>>>>>>>>>>>> moment.
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>> [snip]
>>>>>>>>>>>>>>>>>>>> During bootup CPUG sources from PLL_X. By PLL_P source
>>>>>>>>>>>>>>>>>>>> above I meant
>>>>>>>>>>>>>>>>>>>> PLL_P_OUT4.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> As per clock policies, PLL_X is always used for high
>>>>>>>>>>>>>>>>>>>> freq
>>>>>>>>>>>>>>>>>>>> like
>>>>>>>>>>>>>>>>>>>>> 800Mhz
>>>>>>>>>>>>>>>>>>>> and for low frequency it will be sourced from PLLP.
>>>>>>>>>>>>>>>>>>> Alright, then please don't forget to pre-initialize
>>>>>>>>>>>>>>>>>>> PLLP_OUT4 rate to a
>>>>>>>>>>>>>>>>>>> reasonable value using tegra_clk_init_table or
>>>>>>>>>>>>>>>>>>> assigned-clocks.
>>>>>>>>>>>>>>>>>> PLLP_OUT4 rate update is not needed as it is safe to
>>>>>>>>>>>>>>>>>> run at
>>>>>>>>>>>>>>>>>> 408Mhz because it is below fmax @ Vmin
>>>>>>>>>>>>>>>>> So even 204MHz CVB entries are having the same voltage as
>>>>>>>>>>>>>>>>> 408MHz, correct? It's not instantly obvious to me from the
>>>>>>>>>>>>>>>>> DFLL driver's code where the fmax @ Vmin is defined, I see
>>>>>>>>>>>>>>>>> that there is the min_millivolts
>>>>>>>>>>>>>>>>> and frequency entries starting from 204MHZ defined
>>>>>>>>>>>>>>>>> per-table.
>>>>>>>>>>>>>>>> Yes at Vmin CPU Fmax is ~800Mhz. So anything below that
>>>>>>>>>>>>>>>> will
>>>>>>>>>>>>>>>> work at Vmin voltage and PLLP max is 408Mhz.
>>>>>>>>>>>>>>> Thank you for the clarification. It would be good to have
>>>>>>>>>>>>>>> that
>>>>>>>>>>>>>>> commented
>>>>>>>>>>>>>>> in the code as well.
>>>>>>>>>>>>>> OK, Will add...
>>>>>>>>>>>>> Regarding, adding suspend/resume to CPUFreq, CPUFreq suspend
>>>>>>>>>>>>> happens very early even before disabling non-boot CPUs and
>>>>>>>>>>>>> also
>>>>>>>>>>>>> need to export clock driver APIs to CPUFreq.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Was thinking of below way of implementing this...
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Clock DFLL driver Suspend:
>>>>>>>>>>>>>
>>>>>>>>>>>>>              - Save CPU clock policy registers, and Perform
>>>>>>>>>>>>> dfll
>>>>>>>>>>>>> suspend which sets in open loop mode
>>>>>>>>>>>>>
>>>>>>>>>>>>> CPU Freq driver Suspend: does nothing
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Clock DFLL driver Resume:
>>>>>>>>>>>>>
>>>>>>>>>>>>>              - Re-init DFLL, Set in Open-Loop mode, restore
>>>>>>>>>>>>> CPU
>>>>>>>>>>>>> Clock policy registers which actually sets source to DFLL
>>>>>>>>>>>>> along
>>>>>>>>>>>>> with other CPU Policy register restore.
>>>>>>>>>>>>>
>>>>>>>>>>>>> CPU Freq driver Resume:
>>>>>>>>>>>>>
>>>>>>>>>>>>>              - do clk_prepare_enable which acutally sets
>>>>>>>>>>>>> DFLL in
>>>>>>>>>>>>> Closed loop mode
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Adding one more note: Switching CPU Clock to PLLP is not
>>>>>>>>>>>>> needed
>>>>>>>>>>>>> as CPU CLock can be from dfll in open-loop mode as DFLL is not
>>>>>>>>>>>>> disabled anywhere throught the suspend/resume path and SC7
>>>>>>>>>>>>> entry
>>>>>>>>>>>>> FW and Warm boot code will switch CPU source to PLLP.
>>>>>>>>>>> Since CPU resumes on PLLP, it will be cleaner to suspend it on
>>>>>>>>>>> PLLP as well. And besides, seems that currently disabling DFLL
>>>>>>>>>>> clock will disable DFLL completely and then you'd want to
>>>>>>>>>>> re-init
>>>>>>>>>>> the DFLL on resume any ways. So better to just disable DFLL
>>>>>>>>>>> completely on suspend, which should happen on clk_disable(dfll).
>>>>>>>>>> Will switch to PLLP during CPUFreq suspend. With decision of
>>>>>>>>>> using
>>>>>>>>>> clk_disable during suspend, its mandatory to switch to PLLP as
>>>>>>>>>> DFLL
>>>>>>>>>> is completely disabled.
>>>>>>>>>>
>>>>>>>>>> My earlier concern was on restoring CPU policy as we can't do
>>>>>>>>>> that
>>>>>>>>>> from CPUFreq driver and need export from clock driver.
>>>>>>>>>>
>>>>>>>>>> Clear now and will do CPU clock policy restore in after dfll
>>>>>>>>>> re-init.
>>>>>>>>> Why the policy can't be saved/restored by the CaR driver as a
>>>>>>>>> context of any other clock?
>>>>>>>> restoring cpu clock policy involves programming source and
>>>>>>>> super_cclkg_divider.
>>>>>>>>
>>>>>>>> cclk_g is registered as clk_super_mux and it doesn't use
>>>>>>>> frac_div ops
>>>>>>>> to do save/restore its divider.
>>>>>>> That can be changed of course and I guess it also could be as
>>>>>>> simple as
>>>>>>> saving and restoring of two raw u32 values of the policy/divider
>>>>>>> registers.
>>>>>>>
>>>>>>>> Also, during clock context we cant restore cclk_g as cclk_g source
>>>>>>>> will be dfll and dfll will not be resumed/re-initialized by the
>>>>>>>> time
>>>>>>>> clk_super_mux save/restore happens.
>>>>>>>>
>>>>>>>> we can't use save/restore context for dfll clk_ops because
>>>>>>>> dfllCPU_out parent to CCLK_G is first in the clock tree and
>>>>>>>> dfll_ref
>>>>>>>> and dfll_soc peripheral clocks are not restored by the time dfll
>>>>>>>> restore happens. Also dfll peripheral clock enables need to be
>>>>>>>> restored before dfll restore happens which involves programming
>>>>>>>> dfll
>>>>>>>> controller for re-initialization.
>>>>>>>>
>>>>>>>> So dfll resume/re-init is done in clk-tegra210 at end of all clocks
>>>>>>>> restore in V5 series but instead of in clk-tegra210 driver I moved
>>>>>>>> now to dfll-fcpu driver pm_ops as all dfll dependencies will be
>>>>>>>> restored thru clk_restore_context by then. This will be in V6.
>>>>>>> Since DFLL is now guaranteed to be disabled across CaR
>>>>>>> suspend/resume
>>>>>>> (hence it has nothing to do in regards to CCLK) and given that PLLs
>>>>>>> state is restored before the rest of the clocks, I don't see why
>>>>>>> not to
>>>>>>> implement CCLK save/restore in a generic fasion. CPU policy wull be
>>>>>>> restored to either PLLP or PLLX (if CPUFreq driver is disabled).
>>>>>>>
>>>>>> CCLK_G save/restore should happen in clk_super_mux ops
>>>>>> save/context and
>>>>>> clk_super_mux save/restore happens very early as cclk_g is first
>>>>>> in the
>>>>>> clock tree and save/restore traverses through the tree top-bottom
>>>>>> order.
>>>>> If CCLK_G is restored before the PLLs, then just change the clocks
>>>>> order
>>>>> such that it won't happen.
>>>>>
>>>> I dont think we can change clocks order for CCLK_G.
>>>>
>>>> During bootup, cclk_g is registered after all pll's and peripheral
>>>> clocks which is the way we wanted, So cclk_g will be the first one in
>>>> the clk list as clk_register adds new clock first in the list.
>>>>
>>>> When clk_save_context and clk_restore_context APIs iterates over the
>>>> list, cclk_g is the first
>>> Looking at clk_core_restore_context(), I see that it walks up CLKs list
>>> from parent to children, hence I don't understand how it can ever happen
>>> that CCLK will be restored before the parent. The clocks registration
>>> order doesn't matter at all in that case.
>>
>> yes from parent to children and dfllCPU_out is the top in the list and
>> its child is cclk_g.
>>
>> the way clocks are registered is the order I see in the clock list and
>> looking into clk_register API it adds new node first in the list.
>>
> cclkg_g & dfll register happens after all plls and peripheral clocks as
> it need ref, soc and peripheral clocks to be enabled.
>>
>> So they are the last to get registered and so becomes first in the list.
>>
>> During save/restore context, it traverses thru this list and first in
>> the list is dfllcpu_OUT (parent) and its child (cclk_g)
>>
>> saving should not be an issue at all but we cant restore cclk_g/dfll
>> in normal way thru clk_ops restore as plls and peripherals restore
>> doesn't happen by that time.
>>
> 
> I was referring to clk_restore_context where it iterates thru root list
> and for each core from the root list clk_core_restore does restore of
> parent and children.
> 
> dfllCPU_Out gets first in the list and its child is cclk_g
> 
> https://elixir.bootlin.com/linux/v5.2.1/source/drivers/clk/clk.c#L1105

What list you're talking about? clk_summary? It shows current *active*
clocks configuration, if you'll try to disable CPUFreq driver then the
parent of CCLK_G should be PLLX. Similarly when CPU is reparented to
PLLP on driver's suspend, then PLLP is the parent.

>>>>>> DFLL enable thru CPUFreq resume happens after all clk_restore_context
>>>>>> happens. So during clk_restore_context, dfll re-init doesnt happen
>>>>>> and
>>>>>> doing cpu clock policy restore during super_mux clk_ops will crash as
>>>>>> DFLL is not initialized and its clock is not enabled but CPU clock
>>>>>> restore sets source to DFLL if we restore during super_clk_mux
>>>>> If CPU was suspended on PLLP, then it will be restored on PLLP by
>>>>> CaR. I
>>>>> don't understand what DFLL has to do with the CCLK in that case during
>>>>> the clocks restore.
>>>> My above comment is in reference to your request of doing save/restore
>>>> for cclk_g in normal fashion thru save/restore context. Because of the
>>>> clk order I mentioned above, we cclk_g will be the first one to go thru
>>>> save/context.
>>>>
>>>> During save_context of cclk_g, source can be from PLLX, dfll.
>>>>
>>>> Issue will be when we do restore during clk_restore_context of
>>>> cclk_g as
>>>> by that time PLLX/dfll will not be restored.
>>>>
>>> Seems we already agreed that DFLL will be disabled by the CPUFreq driver
>>> on suspend. Hence CCLK can't be from DFLL if CPU is reparented to PLLP
>>> on CPUFreq driver's suspend, otherwise CPU keeps running from a
>>> boot-state PLLX if CPUFreq driver is disabled.
>>
>> Yes suspend should not be an issue but issue will be during resume
>> where if we do cclk_g restore in normal way thru clk_restore_context,
>> cclk_g restore happens very early as dfllCPU out is the first one that
>> goes thru restore context and plls/peripherals are not resumed by then.
>>
>> CPU runs from PLLX if dfll clock enable fails during boot. So when it
>> gets to suspend, we save CPU running clock source as either PLLX or
>> DFLL and then we switch to PLLP.
>>
>>
>> On resume, CPU runs from PLLP by warm boot code and we need to restore
>> back its source to the one it was using from saved source context
>> (which can be either PLLX or DFLL)
>>
>> So PLLs & DFLL resume need to happen before CCLKG restore/resume.
>>
>>
>> With all above discussions, we do DFLL disable in CPUFreq driver on
>> suspend and on CPUFreq resume we enable DFLL back and restore CPU
>> clock source it was using during suspend (which will be either PLLX if
>> dfll enable fails during probe or it will be using DFLL).

During suspend CPU's parent shall be PLLP and not DFLL (note that it is
disabled) after reparenting to PLLP by the CPUFreq driver.

>> So i was trying to say dfll/cclk_g restore can't be done in normal way
>> thru clk_ops save/restore context

Let's see what happens if CPUFreq is active:

1. CPUFreq driver probe happens
	2. CPU is reparented to PLLP
	3. DFLL inited
	4. CPU is reparented to DFLL

5. CPUFreq driver suspend happens
	6. CPU is reparented to PLLP
	7. DFLL is disabled

8. Car suspend happens
	9. DFLL context saved
	10. PLLP/PLLX context saved
	11. CCLK context saved

12. Car resume happens
	13. DFLL context restored
	14. PLLP/PLLX context restored
	15. CCLK context restored

16. CPUFreq driver resume happens
	17. DFLL re-inited
	18. CPU is reparented to DFLL

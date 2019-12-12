Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2CFF11C473
	for <lists+linux-tegra@lfdr.de>; Thu, 12 Dec 2019 04:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727627AbfLLDyG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 11 Dec 2019 22:54:06 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:11444 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726823AbfLLDyG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Dec 2019 22:54:06 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5df1b9c50000>; Wed, 11 Dec 2019 19:53:41 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 11 Dec 2019 19:54:03 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 11 Dec 2019 19:54:03 -0800
Received: from [10.2.169.141] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Dec
 2019 03:54:01 +0000
Subject: Re: [PATCH v3 03/15] soc: tegra: Add Tegra PMC clock registrations
 into PMC driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mperttunen@nvidia.com>,
        <sboyd@kernel.org>, <pdeschrijver@nvidia.com>
CC:     <gregkh@linuxfoundation.org>, <tglx@linutronix.de>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <allison@lohutok.net>, <pgaikwad@nvidia.com>,
        <mturquette@baylibre.com>, <horms+renesas@verge.net.au>,
        <Jisheng.Zhang@synaptics.com>, <krzk@kernel.org>, <arnd@arndb.de>,
        <spujar@nvidia.com>, <josephl@nvidia.com>, <vidyas@nvidia.com>,
        <daniel.lezcano@linaro.org>, <mmaddireddy@nvidia.com>,
        <markz@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <alexios.zavras@intel.com>, <alsa-devel@alsa-project.org>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-4-git-send-email-skomatineni@nvidia.com>
 <7cf4ff77-2f33-4ee5-0e09-5aa6aef3e8be@gmail.com>
 <ad3a6743-4b36-fa25-9cc7-72803038ecc5@gmail.com>
 <dc7a057a-0bed-0e6f-0987-edcfec47f867@gmail.com>
 <288a1701-def6-d628-26bc-a305f817bdb1@gmail.com>
 <78644d45-2ae3-121f-99fc-0a46f205907d@nvidia.com>
 <b35916e1-c6ee-52ca-9111-5ae109437b6e@nvidia.com>
 <ccb715cc-c927-ea91-a26e-24d6eeeeef1a@gmail.com>
 <ee1d39d4-9a57-da9b-fce6-8130dac1d2fd@nvidia.com>
 <49da77dc-b346-68eb-9ef8-42cfb3221489@nvidia.com>
 <3f1c9325-3017-62be-1e3b-82fd28540fdf@nvidia.com>
 <6fcbff3d-8695-7cd0-60de-6eb523b6964c@gmail.com>
 <8eb792ad-cded-05cc-93fc-763be7ee66aa@nvidia.com>
 <bb966cf2-50f6-6729-7644-54d71d55bbcb@nvidia.com>
 <02109d70-2747-c246-5401-69a2d5c84771@gmail.com>
 <01bf40ae-393d-3cb1-9ba2-acdd10385cb8@nvidia.com>
Message-ID: <56b7d160-6156-59e5-66ec-712d64e1927a@nvidia.com>
Date:   Wed, 11 Dec 2019 19:54:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <01bf40ae-393d-3cb1-9ba2-acdd10385cb8@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1576122821; bh=EAfd8OVfC8impgQKa6Ho3QK7N9AXhjYp3gaYSI1A+KU=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=FJ2MXVgM3xNwxi1MKdgjhWCFSiSDkqzq3zX4pJvpDVef34AERpY8MYRHe+wSOIQU2
         ZEEhNTVcczny7/3Jspw2yPoAahDBxrrSpxC9Sh6lodoxQ2u73l9lIk2+lX99D0nu1A
         7wR/GxwbIzwwitqPsK8u7Na0+RhHJejc2JyoI1WChiQu3r8dfCA59CkMY2wARs+78a
         zNs7EXxgI9tzayNJxuEU22nAV2neVBNauXYSprmAgJMhQWV3gqnN7oEJpfL598YJid
         Zxxc2uSVLA7uPheFH/BMPspL0QxWfTeK9Rc9L2BjATzP0A9un0qZtvD25puvHIFADr
         il/Fn/vP1vJIQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 12/11/19 7:45 PM, Sowjanya Komatineni wrote:
>
> On 12/11/19 5:39 PM, Dmitry Osipenko wrote:
>> 11.12.2019 21:50, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 12/10/19 5:06 PM, Sowjanya Komatineni wrote:
>>>> On 12/10/19 9:41 AM, Dmitry Osipenko wrote:
>>>>> 10.12.2019 19:53, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> On 12/9/19 3:03 PM, Sowjanya Komatineni wrote:
>>>>>>> On 12/9/19 12:46 PM, Sowjanya Komatineni wrote:
>>>>>>>> On 12/9/19 12:12 PM, Dmitry Osipenko wrote:
>>>>>>>>> 08.12.2019 00:36, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>>>> On 12/7/19 11:59 AM, Sowjanya Komatineni wrote:
>>>>>>>>>>> On 12/7/19 8:00 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>> 07.12.2019 18:53, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>>>>>>> 07.12.2019 18:47, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>>>>>>>> 07.12.2019 17:28, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
>>>>>>>>>>>>>>> 06.12.2019 05:48, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=
=B5=D1=82:
>>>>>>>>>>>>>>>> Tegra210 and prior Tegra PMC has clk_out_1, clk_out_2,
>>>>>>>>>>>>>>>> clk_out_3
>>>>>>>>>>>>>>>> with
>>>>>>>>>>>>>>>> mux and gate for each of these clocks.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Currently these PMC clocks are registered by Tegra clock
>>>>>>>>>>>>>>>> driver
>>>>>>>>>>>>>>>> using
>>>>>>>>>>>>>>>> clk_register_mux and clk_register_gate by passing PMC base
>>>>>>>>>>>>>>>> address
>>>>>>>>>>>>>>>> and register offsets and PMC programming for these clocks
>>>>>>>>>>>>>>>> happens
>>>>>>>>>>>>>>>> through direct PMC access by the clock driver.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> With this, when PMC is in secure mode any direct PMC=20
>>>>>>>>>>>>>>>> access
>>>>>>>>>>>>>>>> from the
>>>>>>>>>>>>>>>> non-secure world does not go through and these clocks will
>>>>>>>>>>>>>>>> not be
>>>>>>>>>>>>>>>> functional.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> This patch adds these clocks registration with PMC as a=20
>>>>>>>>>>>>>>>> clock
>>>>>>>>>>>>>>>> provider
>>>>>>>>>>>>>>>> for these clocks. clk_ops callback implementations for=20
>>>>>>>>>>>>>>>> these
>>>>>>>>>>>>>>>> clocks
>>>>>>>>>>>>>>>> uses tegra_pmc_readl and tegra_pmc_writel which=20
>>>>>>>>>>>>>>>> supports PMC
>>>>>>>>>>>>>>>> programming
>>>>>>>>>>>>>>>> in secure mode and non-secure mode.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Signed-off-by: Sowjanya Komatineni=20
>>>>>>>>>>>>>>>> <skomatineni@nvidia.com>
>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>> [snip]
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static const struct clk_ops pmc_clk_gate_ops =3D {
>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 .is_enabled =3D pmc_clk_is_enabled,
>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 .enable =3D pmc_clk_enable,
>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 .disable =3D pmc_clk_disable,
>>>>>>>>>>>>>>>> +};
>>>>>>>>>>>>>>> What's the benefit of separating GATE from the MUX?
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> I think it could be a single clock.
>>>>>>>>>>>>>> According to TRM:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> 1. GATE and MUX are separate entities.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> 2. GATE is the parent of MUX (see PMC's CLK_OUT paths=20
>>>>>>>>>>>>>> diagram
>>>>>>>>>>>>>> in TRM).
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> 3. PMC doesn't gate EXTPERIPH clock but could "force-enable"
>>>>>>>>>>>>>> it,
>>>>>>>>>>>>>> correct?
>>>>>>>>>> Was following existing clk-tegra-pmc as I am not sure of=20
>>>>>>>>>> reason for
>>>>>>>>>> having these clocks registered as separate mux and gate clocks.
>>>>>>>>>>
>>>>>>>>>> Yes, PMC clocks can be registered as single clock and can use
>>>>>>>>>> clk_ops
>>>>>>>>>> for set/get parent and enable/disable.
>>>>>>>>>>
>>>>>>>>>> enable/disable of PMC clocks is for force-enable to force the
>>>>>>>>>> clock to
>>>>>>>>>> run regardless of ACCEPT_REQ or INVERT_REQ.
>>>>>>>>>>
>>>>>>>>>>>>> 4. clk_m_div2/4 are internal PMC OSC dividers and thus these
>>>>>>>>>>>>> clocks
>>>>>>>>>>>>> should belong to PMC.
>>>>>>>>>>>> Also, it should be "osc" and not "clk_m".
>>>>>>>>>>> I followed the same parents as it were in existing=20
>>>>>>>>>>> clk-tegra-pmc
>>>>>>>>>>> driver.
>>>>>>>>>>>
>>>>>>>>>>> Yeah they are wrong and they should be from osc and not clk_m.
>>>>>>>>>>>
>>>>>>>>>>> Will fix in next version.
>>>>>>>>>>>
>>>>>>> Reg clk_m_div2/3, they are dividers at OSC pad and not really=20
>>>>>>> internal
>>>>>>> to PMC block.
>>>>>>>
>>>>>>> current clock driver creates clk_m_div clocks which should=20
>>>>>>> actually be
>>>>>>> osc_div2/osc_div4 clocks with osc as parent.
>>>>>>>
>>>>>>> There are no clk_m_div2 and clk_m_div4 from clk_m
>>>>>>>
>>>>>>> Will fix this in next version.
>>>>>>>
>>>>>>>>> Could you please describe the full EXTPERIPH clock topology and
>>>>>>>>> how the
>>>>>>>>> pinmux configuration is related to it all?
>>>>>>>>>
>>>>>>>>> What is internal to the Tegra chip and what are the external
>>>>>>>>> outputs?
>>>>>>>>>
>>>>>>>>> Is it possible to bypass PMC on T30+ for the EXTPERIPH clocks?
>>>>>>>> PMC CLK1/2/3 possible sources are OSC_DIV1, OSC_DIV2, OSC_DIV4,
>>>>>>>> EXTPERIPH from CAR.
>>>>>>>>
>>>>>>>> OSC_DIV1/2/4 are with internal dividers at the OSC Pads
>>>>>>>>
>>>>>>>> EXTPERIPH is from CAR and it has reset and enable controls=20
>>>>>>>> along with
>>>>>>>> clock source selections to choose one of the PLLA_OUT0, CLK_S,
>>>>>>>> PLLP_OUT0, CLK_M, PLLE_OUT0
>>>>>>>>
>>>>>>>> So, PMC CLK1/2/4 possible parents are OSC_DIV1, OSC_DIV2,=20
>>>>>>>> OSC_DIV4,
>>>>>>>> EXTERN.
>>>>>>>>
>>>>>>>>
>>>>>>>> CLK1/2/3 also has Pinmux to route EXTPERIPH output on to these=20
>>>>>>>> pins.
>>>>>>>>
>>>>>>>>
>>>>>>>> When EXTERN output clock is selected for these PMC clocks thru
>>>>>>>> CLKx_SRC_SEL, output clock is from driver by EXTPERIPH from CAR=20
>>>>>>>> via
>>>>>>>> Pinmux logic or driven as per CLKx_SRC_SEL bypassing pinmux=20
>>>>>>>> based on
>>>>>>>> CLKx_ACCEPT_REQ bit.
>>>>>>>>
>>>>>>>>
>>>>>>>> PMC Clock control register has bit CLKx_ACCEPT_REQ
>>>>>>>> When CLKx_ACCEPT_REQ =3D 0, output clock driver is from by EXTPERI=
PH
>>>>>>>> through the pinmux
>>>>>>>> When CLKx_ACCEPT_REQ =3D 1, output clock is based on CLKx_SRC_SEL=
=20
>>>>>>>> bits
>>>>>>>> (OSC_DIV1/2/4 and EXTPERIPH clock bypassing the pinmux)
>>>>>>>>
>>>>>>>> FORCE_EN bit in PMC CLock control register forces the clock to run
>>>>>>>> regardless of this.
>>>>>> PMC clock gate is based on the state of CLKx_ACCEPT_REQ and FORCE_EN
>>>>>> like explained above.
>>>>>>
>>>>>> CLKx_ACCEPT_REQ is 0 default and FORCE_EN acts as gate to
>>>>>> enable/disable
>>>>>> EXTPERIPH clock output to PMC CLK_OUT_1/2/3.
>>>>> [and to enable OSC as well]
>>>>>
>>>>>> So I believe we need to register as MUX and Gate rather than as a
>>>>>> single
>>>>>> clock. Please confirm.
>>>>> 1. The force-enabling is applied to both OSC and EXTERN sources of
>>>>> PMC_CLK_OUT_x by PMC at once.
>>>>>
>>>>> 2. Both of PMC's force-enabling and OSC/EXTERN selection is internal
>>>>> to PMC.
>>>>>
>>>>> Should be better to define it as a single "pmc_clk_out_x". I don't=20
>>>>> see
>>>>> any good reasons for differentiating PMC's Gate from the MUX, it's a
>>>>> single hardware unit from a point of view of the rest of the system.
>>>>>
>>>>> Peter, do you have any objections?
>>>> We added fallback option for audio mclk and also added check for
>>>> assigned-clock-parents dt property in audio driver and if its not then
>>>> we do parent init configuration in audio driver.
>>>>
>>>> Current clock driver creates 2 separate clocks clk_out_1_mux and
>>>> clk_out_1 for each pmc clock in clock driver and uses extern1 as
>>>> parent to clk_out_1_mux and clk_out_1_mux is parent to clk_out_1.
>>>>
>>>> With change of registering each pmc clock as a single clock, when we
>>>> do parent init assignment in audio driver when
>>>> assigned-clock-properties are not used in DT (as we removed parent
>>>> inits for extern and clk_outs from clock driver), we should still try
>>>> to get clock based on clk_out_1_mux as parent assignment of extern1 is
>>>> for clk_out_1_mux as per existing clock tree.
>>>>
>>>> clk_out_1_mux clock retrieve will fail with this change of single
>>>> clock when any new platform device tree doesn't specify
>>>> assigned-clock-parents properties and tegra_asoc_utils_init fails.
>> You made the PMC/CaR changes before the audio changes, the clk_out_1_mux
>> won't exist for the audio driver patches.
>>
>> If you care about bisect-ability of the patches, then the clock and
>> audio changes need to be done in a single patch. But I don't think that
>> it's worthwhile.
>>
>>>> With single clock, extern1 is the parent for clk_out_1 and with
>>>> separate clocks for mux and gate, extern1 is the parent for
>>>> clk_out_1_mux.
>>> If we move to single clock now, it need one more additional fallback
>>> implementation in audio driver during parent configuration as
>>> clk_out_1_mux will not be there with single clock change and=20
>>> old/current
>>> kernel has it as it uses separate clocks for pmc mux and gate.
>> Why additional fallback? Additional to what?
>>
>>> Also, with single clock for both PMC mux and gate now, new DT should=20
>>> use
>>> extern1 as parent to CLK_OUT_1 as CLK_OUT_1_MUX will not be there old
>>> PMC dt-bindings has separate clocks for MUX (CLK_OUT_1_MUX) and gate
>>> (CLK_OUT_1)
>>>
>>> DT bindings will not be compatible b/w old and new changes if we=20
>>> move to
>>> Single PMC clock now.
>> Sorry, I don't understand what you're meaning by the "new changes".
>>
>>> Should we go with same separate clocks to have it compatible to avoid
>>> all this?
>>>
> The reason we added mclk fallback and also for doing parent=20
> configuration based on presence of assigned-clock-parents property is=20
> to have old dt compatible with new kernel and also to have new dt=20
> compatible with old kernel.
>
> So the point I was mentioning is to have new DT to work with old=20
> kernel, setting extern1 as parent to clk_out_1 (with single pmc clock)=20
> through assigned-clock-parents in DT will fail as old kernel has mux=20
> and gate as separate clocks and parent configuration is for mux clock=20
> (clk_out_1_mux)
>
Sorry never mind, with old kernel clock driver does all parent=20
configuration so should be ok. So no additional fallbacks are needed=20
except to the one we already added.

OK, So its just that changes are slightly more to switch to single clock=20
compared to using separate clocks as gate clk_ops (which are needed=20
anyway for blink control) of clock enable and disable can't be used for=20
clk_out_1 enable/disable and need additional clk_enable and disable=20
callbacks.

Will make changes to use single clock..


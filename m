Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD811272BB
	for <lists+linux-tegra@lfdr.de>; Fri, 20 Dec 2019 02:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfLTBVh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 19 Dec 2019 20:21:37 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2780 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbfLTBVh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Dec 2019 20:21:37 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dfc22160000>; Thu, 19 Dec 2019 17:21:26 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 19 Dec 2019 17:21:36 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 19 Dec 2019 17:21:36 -0800
Received: from [10.110.102.174] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Dec
 2019 01:21:35 +0000
Subject: Re: [PATCH v4 06/19] soc: tegra: Add Tegra PMC clock registrations
 into PMC driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mperttunen@nvidia.com>,
        <gregkh@linuxfoundation.org>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <spujar@nvidia.com>, <josephl@nvidia.com>,
        <daniel.lezcano@linaro.org>, <mmaddireddy@nvidia.com>,
        <markz@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
 <1576613046-17159-7-git-send-email-skomatineni@nvidia.com>
 <87b2b266-e4a9-9a7a-2336-6ec57d7c4d1d@gmail.com>
 <55a56c3d-3fac-cc77-46ae-acf5de77d262@gmail.com>
 <e11d2ea9-20f1-6920-7efc-ba8a50312f75@gmail.com>
 <c5bb3c25-1fae-3ca9-6bf3-c3d66be20e19@nvidia.com>
Message-ID: <664f1a41-d539-36e8-092b-11d7e4555108@nvidia.com>
Date:   Thu, 19 Dec 2019 17:21:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <c5bb3c25-1fae-3ca9-6bf3-c3d66be20e19@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1576804886; bh=/SDq2sZOYv9C9KGuZBrRMEidh44RtqXlQBdmFhl3wAk=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=sLLaUAH4a+QyBpkYkryJFC39StW1Qow3vy5jAG2ebdUFkhtvilmb+WPWLmOUXrP54
         5X8KckX1HnBYEpqr3fV2evBlpGH9T2BuCCvCacxyLZcLqNs89idPMErGG8fgcznEM6
         RSYQKPD/CgV+IMtZ28j1cxuiYVad6xPh6h3nVHhwn/xKJoPfj2hRq78XBoq6YTQmV2
         6SCXERHDweJaBT1fTmJoSqIwnSpkw+OukStO86PnUD5Oc6teW/k0H1JKudI4wKgxL0
         pZJ6uZ2kjf3tB7KnI9YUhRucfu5cMPiJ1+XL6DVTHFSBqvjY2HbZWKXpx1wNpwGHdf
         qTf4vmcfwN6bw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 12/18/19 4:41 PM, Sowjanya Komatineni wrote:
>
> On 12/18/19 1:44 PM, Dmitry Osipenko wrote:
>> 18.12.2019 11:35, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> 18.12.2019 11:30, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> 17.12.2019 23:03, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> Tegra PMC has clk_out_1, clk_out_2, and clk_out_3 clocks and=20
>>>>> currently
>>>>> these PMC clocks are registered by Tegra clock driver with each=20
>>>>> clock as
>>>>> separate mux and gate clocks using clk_register_mux and=20
>>>>> clk_register_gate
>>>>> by passing PMC base address and register offsets and PMC=20
>>>>> programming for
>>>>> these clocks happens through direct PMC access by the clock driver.
>>>>>
>>>>> With this, when PMC is in secure mode any direct PMC access from the
>>>>> non-secure world does not go through and these clocks will not be
>>>>> functional.
>>>>>
>>>>> This patch adds these PMC clocks registration to pmc driver with=20
>>>>> PMC as
>>>>> a clock provider and registers each clock as single clock.
>>>>>
>>>>> clk_ops callback implementations for these clocks uses=20
>>>>> tegra_pmc_readl and
>>>>> tegra_pmc_writel which supports PMC programming in both secure=20
>>>>> mode and
>>>>> non-secure mode.
>>>>>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>> =C2=A0 drivers/soc/tegra/pmc.c | 248=20
>>>>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>> =C2=A0 1 file changed, 248 insertions(+)
>>>>>
>>>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>>>> index ea0e11a09c12..6d65194a6e71 100644
>>>>> --- a/drivers/soc/tegra/pmc.c
>>>>> +++ b/drivers/soc/tegra/pmc.c
>>>>> @@ -13,6 +13,9 @@
>>>>> =C2=A0 =C2=A0 #include <linux/arm-smccc.h>
>>>>> =C2=A0 #include <linux/clk.h>
>>>>> +#include <linux/clk-provider.h>
>>>>> +#include <linux/clkdev.h>
>>>>> +#include <linux/clk/clk-conf.h>
>>>>> =C2=A0 #include <linux/clk/tegra.h>
>>>>> =C2=A0 #include <linux/debugfs.h>
>>>>> =C2=A0 #include <linux/delay.h>
>>>>> @@ -48,6 +51,7 @@
>>>>> =C2=A0 #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
>>>>> =C2=A0 #include <dt-bindings/gpio/tegra186-gpio.h>
>>>>> =C2=A0 #include <dt-bindings/gpio/tegra194-gpio.h>
>>>>> +#include <dt-bindings/soc/tegra-pmc.h>
>>>>> =C2=A0 =C2=A0 #define PMC_CNTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0
>>>>> =C2=A0 #define=C2=A0 PMC_CNTRL_INTR_POLARITY=C2=A0=C2=A0=C2=A0 BIT(17=
) /* inverts INTR=20
>>>>> polarity */
>>>>> @@ -100,6 +104,7 @@
>>>>> =C2=A0 #define PMC_WAKE2_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x168
>>>>> =C2=A0 #define PMC_SW_WAKE2_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x16c
>>>>> =C2=A0 +#define PMC_CLK_OUT_CNTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x1a8
>>>>> =C2=A0 #define PMC_SENSOR_CTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1b0
>>>>> =C2=A0 #define=C2=A0 PMC_SENSOR_CTRL_SCRATCH_WRITE=C2=A0=C2=A0=C2=A0 =
BIT(2)
>>>>> =C2=A0 #define=C2=A0 PMC_SENSOR_CTRL_ENABLE_RST=C2=A0=C2=A0=C2=A0 BIT=
(1)
>>>>> @@ -155,6 +160,64 @@
>>>>> =C2=A0 #define=C2=A0 TEGRA_SMC_PMC_READ=C2=A0=C2=A0=C2=A0 0xaa
>>>>> =C2=A0 #define=C2=A0 TEGRA_SMC_PMC_WRITE=C2=A0=C2=A0=C2=A0 0xbb
>>>>> =C2=A0 +struct pmc_clk {
>>>>> +=C2=A0=C2=A0=C2=A0 struct clk_hw=C2=A0=C2=A0=C2=A0 hw;
>>>>> +=C2=A0=C2=A0=C2=A0 unsigned long=C2=A0=C2=A0=C2=A0 offs;
>>>>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mux=
_mask;
>>>>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mux=
_shift;
>>>>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gat=
e_shift;
>>>>> +};
>>>>> +
>>>>> +#define to_pmc_clk(_hw) container_of(_hw, struct pmc_clk, hw)
>>>>> +
>>>>> +struct pmc_clk_init_data {
>>>>> +=C2=A0=C2=A0=C2=A0 char *name;
>>>>> +=C2=A0=C2=A0=C2=A0 const char *const *parents;
>>>>> +=C2=A0=C2=A0=C2=A0 int num_parents;
>>>>> +=C2=A0=C2=A0=C2=A0 int clk_id;
>>>>> +=C2=A0=C2=A0=C2=A0 u8 mux_shift;
>>>>> +=C2=A0=C2=A0=C2=A0 u8 gate_shift;
>>>>> +};
>>>>> +
>>>>> +static const char * const clk_out1_parents[] =3D { "osc", "osc_div2"=
,
>>>>> +=C2=A0=C2=A0=C2=A0 "osc_div4", "extern1",
>>>>> +};
>>>>> +
>>>>> +static const char * const clk_out2_parents[] =3D { "osc", "osc_div2"=
,
>>>>> +=C2=A0=C2=A0=C2=A0 "osc_div4", "extern2",
>>>>> +};
>>>>> +
>>>>> +static const char * const clk_out3_parents[] =3D { "osc", "osc_div2"=
,
>>>>> +=C2=A0=C2=A0=C2=A0 "osc_div4", "extern3",
>>>>> +};
>>>>> +
>>>>> +static const struct pmc_clk_init_data tegra_pmc_clks_data[] =3D {
>>>>> +=C2=A0=C2=A0=C2=A0 {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "clk_out_1",
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .parents =3D clk_out1_par=
ents,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_parents =3D ARRAY_SI=
ZE(clk_out1_parents),
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .clk_id =3D TEGRA_PMC_CLK=
_OUT_1,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .mux_shift =3D 6,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gate_shift =3D 2,
>>>> I'd replace these with a single .shift, given that mux_shift =3D
>>>> gate_shift + 4 for all clocks.
>>>>
>>>>> +=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0 {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "clk_out_2",
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .parents =3D clk_out2_par=
ents,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_parents =3D ARRAY_SI=
ZE(clk_out2_parents),
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .clk_id =3D TEGRA_PMC_CLK=
_OUT_2,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .mux_shift =3D 14,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gate_shift =3D 10,
>>>>> +=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0 {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "clk_out_3",
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .parents =3D clk_out3_par=
ents,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_parents =3D ARRAY_SI=
ZE(clk_out3_parents),
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .clk_id =3D TEGRA_PMC_CLK=
_OUT_3,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .mux_shift =3D 22,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gate_shift =3D 18,
>>>>> +=C2=A0=C2=A0=C2=A0 },
>>>>> +};
>>>>> +
>>>>> =C2=A0 struct tegra_powergate {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct generic_pm_domain genpd;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_pmc *pmc;
>>>>> @@ -254,6 +317,9 @@ struct tegra_pmc_soc {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct tegra_wake_event *wake_ev=
ents;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_wake_events;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 const struct pmc_clk_init_data *pmc_clks_data;
>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int num_pmc_clks;
>>>>> =C2=A0 };
>>>>> =C2=A0 =C2=A0 static const char * const tegra186_reset_sources[] =3D =
{
>>>>> @@ -2163,6 +2229,173 @@ static int tegra_pmc_clk_notify_cb(struct=20
>>>>> notifier_block *nb,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY_OK;
>>>>> =C2=A0 }
>>>>> =C2=A0 +static void pmc_clk_fence_udelay(u32 offset)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_readl(pmc, offset);
>>>>> +=C2=A0=C2=A0=C2=A0 /* pmc clk propagation delay 2 us */
>>>>> +=C2=A0=C2=A0=C2=A0 udelay(2);
>>>>> +}
>>>>> +
>>>>> +static u8 pmc_clk_mux_get_parent(struct clk_hw *hw)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct pmc_clk *clk =3D to_pmc_clk(hw);
>>>>> +=C2=A0=C2=A0=C2=A0 u32 val;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 val =3D tegra_pmc_readl(pmc, clk->offs) >> clk->m=
ux_shift;
>>>>> +=C2=A0=C2=A0=C2=A0 val &=3D clk->mux_mask;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return val;
>>>>> +}
>>>>> +
>>>>> +static int pmc_clk_mux_set_parent(struct clk_hw *hw, u8 index)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct pmc_clk *clk =3D to_pmc_clk(hw);
>>>>> +=C2=A0=C2=A0=C2=A0 u32 val;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 val =3D tegra_pmc_readl(pmc, clk->offs);
>>>>> +=C2=A0=C2=A0=C2=A0 val &=3D ~(clk->mux_mask << clk->mux_shift);
>>>>> +=C2=A0=C2=A0=C2=A0 val |=3D index << clk->mux_shift;
>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, val, clk->offs);
>>>>> +=C2=A0=C2=A0=C2=A0 pmc_clk_fence_udelay(clk->offs);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>> +}
>>>>> +
>>>>> +static int pmc_clk_is_enabled(struct clk_hw *hw)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct pmc_clk *clk =3D to_pmc_clk(hw);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return tegra_pmc_readl(pmc, clk->offs) & BIT(clk-=
>gate_shift)=20
>>>>> ? 1 : 0;
>>>>> +}
>>>>> +
>>>>> +static void pmc_clk_set_state(unsigned long offs, u32 shift, int=20
>>>>> state)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 u32 val;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 val =3D tegra_pmc_readl(pmc, offs);
>>>>> +=C2=A0=C2=A0=C2=A0 val =3D state ? (val | BIT(shift)) : (val & ~BIT(=
shift));
>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, val, offs);
>>>>> +=C2=A0=C2=A0=C2=A0 pmc_clk_fence_udelay(offs);
>>>>> +}
>>>>> +
>>>>> +static int pmc_clk_enable(struct clk_hw *hw)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct pmc_clk *clk =3D to_pmc_clk(hw);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 pmc_clk_set_state(clk->offs, clk->gate_shift, 1);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>> +}
>>>>> +
>>>>> +static void pmc_clk_disable(struct clk_hw *hw)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct pmc_clk *clk =3D to_pmc_clk(hw);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 pmc_clk_set_state(clk->offs, clk->gate_shift, 0);
>>>>> +}
>>>>> +
>>>>> +static const struct clk_ops pmc_clk_ops =3D {
>>>>> +=C2=A0=C2=A0=C2=A0 .get_parent =3D pmc_clk_mux_get_parent,
>>>>> +=C2=A0=C2=A0=C2=A0 .set_parent =3D pmc_clk_mux_set_parent,
>>>>> +=C2=A0=C2=A0=C2=A0 .determine_rate =3D __clk_mux_determine_rate,
>>>>> +=C2=A0=C2=A0=C2=A0 .is_enabled =3D pmc_clk_is_enabled,
>>>>> +=C2=A0=C2=A0=C2=A0 .enable =3D pmc_clk_enable,
>>>>> +=C2=A0=C2=A0=C2=A0 .disable =3D pmc_clk_disable,
>>>>> +};
>>>>> +
>>>>> +static struct clk *
>>>>> +tegra_pmc_clk_out_register(const struct pmc_clk_init_data *data,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 unsigned long offset)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct clk_init_data init;
>>>>> +=C2=A0=C2=A0=C2=A0 struct pmc_clk *pmc_clk;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 pmc_clk =3D kzalloc(sizeof(*pmc_clk), GFP_KERNEL)=
;
>>>>> +=C2=A0=C2=A0=C2=A0 if (!pmc_clk)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(-ENOMEM);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 init.name =3D data->name;
>>>>> +=C2=A0=C2=A0=C2=A0 init.ops =3D &pmc_clk_ops;
>>>>> +=C2=A0=C2=A0=C2=A0 init.parent_names =3D data->parents;
>>>>> +=C2=A0=C2=A0=C2=A0 init.num_parents =3D data->num_parents;
>>>>> +=C2=A0=C2=A0=C2=A0 init.flags =3D CLK_SET_RATE_NO_REPARENT | CLK_SET=
_RATE_PARENT |
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 CLK_SET_PARENT_GATE;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 pmc_clk->hw.init =3D &init;
>>>>> +=C2=A0=C2=A0=C2=A0 pmc_clk->offs =3D offset;
>>>>> +=C2=A0=C2=A0=C2=A0 pmc_clk->mux_mask =3D 3;
>>>> If mux_mask is a constant value, perhaps will be better to replace the
>>>> variable with a literal?
>>>>
>>>> #define PMC_CLK_OUT_MUX_MASK=C2=A0=C2=A0=C2=A0 GENMASK(1, 0)
>>> Maybe even:
>>>
>>> #define PMC_CLK_OUT_MUX_MASK(c)=C2=A0=C2=A0=C2=A0 GENMASK(c->shift + 1,=
 c->shift)
>
> MUX Mask is used only here for PMC clock out and is same for all=20
> clk_out mux so will use
>
> #define PMC_CLK_OUT_MUX_MASK=C2=A0=C2=A0=C2=A0 GENMASK(1, 0)
>
>> I want to point out that may be a separated gate/mux shifts is a fine
>> variant, you should try and see whether another variants produce more
>> concise result.
>>
>> [snip]

We can do mux_shift as gate_shift + 4 and that restricts this clk=20
register only for clk1/2/3 as well and there are no other clocks in pmc=20
anyway.

How about using bit shift define for CLK1, CLK2, and CLK3?

.mux_shift =3D PMC_CLK1_SRC_SEL_SHIFT,

.gate_shift =3D PMC_CLK1_FORCE_EN_SHIFT,



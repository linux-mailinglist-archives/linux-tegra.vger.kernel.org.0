Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB4C124BF8
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 16:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbfLRPqb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 10:46:31 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:11459 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfLRPqa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 10:46:30 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dfa49cb0000>; Wed, 18 Dec 2019 07:46:19 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 18 Dec 2019 07:46:29 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 18 Dec 2019 07:46:29 -0800
Received: from [10.2.164.84] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Dec
 2019 15:46:27 +0000
Subject: Re: [PATCH v4 06/19] soc: tegra: Add Tegra PMC clock registrations
 into PMC driver
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <e4588ae6-8f9a-e4cb-3fd0-aba80a3689dc@nvidia.com>
Date:   Wed, 18 Dec 2019 07:46:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <55a56c3d-3fac-cc77-46ae-acf5de77d262@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1576683979; bh=e6L/tRJZoJtIw22S4UrseUEVHWXAajfC5K3ul7NlgsU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=LQOHyv0VnXPe9Nyjat5jGPLCnEcdTjHNR88OWV3yJFA3pG3+APQPyrtaYSjXPCoTy
         ajVlc//GkNQZw3pQbRawUb7qLIx6IJeZwCmbHJeQAsqd+jEUGVsiIcP+Lu/0umBLjW
         lkCQoBTd0JjDoqgsI/wIp+yf2XJQG/jBX+CJhdjKWsD/SC+Ik3Yod2yalsr5KCjddz
         jgDn/HWJzD2kiicM0VDbh4OQUT1TnF2zlIw8VAfWyhknXolOXsfTKdEX2NVVTSfdIF
         ODi2kCdZjQ+9KuuaFqsIALnV1hcE+tsGiR+vbpi5CT+c/ZHVYxIAKu8TAWgjWr9U3p
         7E/OInILvzoKw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 12/18/19 12:35 AM, Dmitry Osipenko wrote:
> 18.12.2019 11:30, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 17.12.2019 23:03, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> Tegra PMC has clk_out_1, clk_out_2, and clk_out_3 clocks and currently
>>> these PMC clocks are registered by Tegra clock driver with each clock a=
s
>>> separate mux and gate clocks using clk_register_mux and clk_register_ga=
te
>>> by passing PMC base address and register offsets and PMC programming fo=
r
>>> these clocks happens through direct PMC access by the clock driver.
>>>
>>> With this, when PMC is in secure mode any direct PMC access from the
>>> non-secure world does not go through and these clocks will not be
>>> functional.
>>>
>>> This patch adds these PMC clocks registration to pmc driver with PMC as
>>> a clock provider and registers each clock as single clock.
>>>
>>> clk_ops callback implementations for these clocks uses tegra_pmc_readl =
and
>>> tegra_pmc_writel which supports PMC programming in both secure mode and
>>> non-secure mode.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/soc/tegra/pmc.c | 248 +++++++++++++++++++++++++++++++++++++++=
+++++++++
>>>   1 file changed, 248 insertions(+)
>>>
>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>> index ea0e11a09c12..6d65194a6e71 100644
>>> --- a/drivers/soc/tegra/pmc.c
>>> +++ b/drivers/soc/tegra/pmc.c
>>> @@ -13,6 +13,9 @@
>>>  =20
>>>   #include <linux/arm-smccc.h>
>>>   #include <linux/clk.h>
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/clkdev.h>
>>> +#include <linux/clk/clk-conf.h>
>>>   #include <linux/clk/tegra.h>
>>>   #include <linux/debugfs.h>
>>>   #include <linux/delay.h>
>>> @@ -48,6 +51,7 @@
>>>   #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
>>>   #include <dt-bindings/gpio/tegra186-gpio.h>
>>>   #include <dt-bindings/gpio/tegra194-gpio.h>
>>> +#include <dt-bindings/soc/tegra-pmc.h>
>>>  =20
>>>   #define PMC_CNTRL			0x0
>>>   #define  PMC_CNTRL_INTR_POLARITY	BIT(17) /* inverts INTR polarity */
>>> @@ -100,6 +104,7 @@
>>>   #define PMC_WAKE2_STATUS		0x168
>>>   #define PMC_SW_WAKE2_STATUS		0x16c
>>>  =20
>>> +#define PMC_CLK_OUT_CNTRL		0x1a8
>>>   #define PMC_SENSOR_CTRL			0x1b0
>>>   #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
>>>   #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
>>> @@ -155,6 +160,64 @@
>>>   #define  TEGRA_SMC_PMC_READ	0xaa
>>>   #define  TEGRA_SMC_PMC_WRITE	0xbb
>>>  =20
>>> +struct pmc_clk {
>>> +	struct clk_hw	hw;
>>> +	unsigned long	offs;
>>> +	u32		mux_mask;
>>> +	u32		mux_shift;
>>> +	u32		gate_shift;
>>> +};
>>> +
>>> +#define to_pmc_clk(_hw) container_of(_hw, struct pmc_clk, hw)
>>> +
>>> +struct pmc_clk_init_data {
>>> +	char *name;
>>> +	const char *const *parents;
>>> +	int num_parents;
>>> +	int clk_id;
>>> +	u8 mux_shift;
>>> +	u8 gate_shift;
>>> +};
>>> +
>>> +static const char * const clk_out1_parents[] =3D { "osc", "osc_div2",
>>> +	"osc_div4", "extern1",
>>> +};
>>> +
>>> +static const char * const clk_out2_parents[] =3D { "osc", "osc_div2",
>>> +	"osc_div4", "extern2",
>>> +};
>>> +
>>> +static const char * const clk_out3_parents[] =3D { "osc", "osc_div2",
>>> +	"osc_div4", "extern3",
>>> +};
>>> +
>>> +static const struct pmc_clk_init_data tegra_pmc_clks_data[] =3D {
>>> +	{
>>> +		.name =3D "clk_out_1",
>>> +		.parents =3D clk_out1_parents,
>>> +		.num_parents =3D ARRAY_SIZE(clk_out1_parents),
>>> +		.clk_id =3D TEGRA_PMC_CLK_OUT_1,
>>> +		.mux_shift =3D 6,
>>> +		.gate_shift =3D 2,
>> I'd replace these with a single .shift, given that mux_shift =3D
>> gate_shift + 4 for all clocks.
>>
>>> +	},
>>> +	{
>>> +		.name =3D "clk_out_2",
>>> +		.parents =3D clk_out2_parents,
>>> +		.num_parents =3D ARRAY_SIZE(clk_out2_parents),
>>> +		.clk_id =3D TEGRA_PMC_CLK_OUT_2,
>>> +		.mux_shift =3D 14,
>>> +		.gate_shift =3D 10,
>>> +	},
>>> +	{
>>> +		.name =3D "clk_out_3",
>>> +		.parents =3D clk_out3_parents,
>>> +		.num_parents =3D ARRAY_SIZE(clk_out3_parents),
>>> +		.clk_id =3D TEGRA_PMC_CLK_OUT_3,
>>> +		.mux_shift =3D 22,
>>> +		.gate_shift =3D 18,
>>> +	},
>>> +};
>>> +
>>>   struct tegra_powergate {
>>>   	struct generic_pm_domain genpd;
>>>   	struct tegra_pmc *pmc;
>>> @@ -254,6 +317,9 @@ struct tegra_pmc_soc {
>>>   	 */
>>>   	const struct tegra_wake_event *wake_events;
>>>   	unsigned int num_wake_events;
>>> +
>>> +	const struct pmc_clk_init_data *pmc_clks_data;
>>> +	unsigned int num_pmc_clks;
>>>   };
>>>  =20
>>>   static const char * const tegra186_reset_sources[] =3D {
>>> @@ -2163,6 +2229,173 @@ static int tegra_pmc_clk_notify_cb(struct notif=
ier_block *nb,
>>>   	return NOTIFY_OK;
>>>   }
>>>  =20
>>> +static void pmc_clk_fence_udelay(u32 offset)
>>> +{
>>> +	tegra_pmc_readl(pmc, offset);
>>> +	/* pmc clk propagation delay 2 us */
>>> +	udelay(2);
>>> +}
>>> +
>>> +static u8 pmc_clk_mux_get_parent(struct clk_hw *hw)
>>> +{
>>> +	struct pmc_clk *clk =3D to_pmc_clk(hw);
>>> +	u32 val;
>>> +
>>> +	val =3D tegra_pmc_readl(pmc, clk->offs) >> clk->mux_shift;
>>> +	val &=3D clk->mux_mask;
>>> +
>>> +	return val;
>>> +}
>>> +
>>> +static int pmc_clk_mux_set_parent(struct clk_hw *hw, u8 index)
>>> +{
>>> +	struct pmc_clk *clk =3D to_pmc_clk(hw);
>>> +	u32 val;
>>> +
>>> +	val =3D tegra_pmc_readl(pmc, clk->offs);
>>> +	val &=3D ~(clk->mux_mask << clk->mux_shift);
>>> +	val |=3D index << clk->mux_shift;
>>> +	tegra_pmc_writel(pmc, val, clk->offs);
>>> +	pmc_clk_fence_udelay(clk->offs);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int pmc_clk_is_enabled(struct clk_hw *hw)
>>> +{
>>> +	struct pmc_clk *clk =3D to_pmc_clk(hw);
>>> +
>>> +	return tegra_pmc_readl(pmc, clk->offs) & BIT(clk->gate_shift) ? 1 : 0=
;
>>> +}
>>> +
>>> +static void pmc_clk_set_state(unsigned long offs, u32 shift, int state=
)
>>> +{
>>> +	u32 val;
>>> +
>>> +	val =3D tegra_pmc_readl(pmc, offs);
>>> +	val =3D state ? (val | BIT(shift)) : (val & ~BIT(shift));
>>> +	tegra_pmc_writel(pmc, val, offs);
>>> +	pmc_clk_fence_udelay(offs);
>>> +}
>>> +
>>> +static int pmc_clk_enable(struct clk_hw *hw)
>>> +{
>>> +	struct pmc_clk *clk =3D to_pmc_clk(hw);
>>> +
>>> +	pmc_clk_set_state(clk->offs, clk->gate_shift, 1);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void pmc_clk_disable(struct clk_hw *hw)
>>> +{
>>> +	struct pmc_clk *clk =3D to_pmc_clk(hw);
>>> +
>>> +	pmc_clk_set_state(clk->offs, clk->gate_shift, 0);
>>> +}
>>> +
>>> +static const struct clk_ops pmc_clk_ops =3D {
>>> +	.get_parent =3D pmc_clk_mux_get_parent,
>>> +	.set_parent =3D pmc_clk_mux_set_parent,
>>> +	.determine_rate =3D __clk_mux_determine_rate,
>>> +	.is_enabled =3D pmc_clk_is_enabled,
>>> +	.enable =3D pmc_clk_enable,
>>> +	.disable =3D pmc_clk_disable,
>>> +};
>>> +
>>> +static struct clk *
>>> +tegra_pmc_clk_out_register(const struct pmc_clk_init_data *data,
>>> +			   unsigned long offset)
>>> +{
>>> +	struct clk_init_data init;
>>> +	struct pmc_clk *pmc_clk;
>>> +
>>> +	pmc_clk =3D kzalloc(sizeof(*pmc_clk), GFP_KERNEL);
>>> +	if (!pmc_clk)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	init.name =3D data->name;
>>> +	init.ops =3D &pmc_clk_ops;
>>> +	init.parent_names =3D data->parents;
>>> +	init.num_parents =3D data->num_parents;
>>> +	init.flags =3D CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT |
>>> +		     CLK_SET_PARENT_GATE;
>>> +
>>> +	pmc_clk->hw.init =3D &init;
>>> +	pmc_clk->offs =3D offset;
>>> +	pmc_clk->mux_mask =3D 3;
>> If mux_mask is a constant value, perhaps will be better to replace the
>> variable with a literal?
>>
>> #define PMC_CLK_OUT_MUX_MASK	GENMASK(1, 0)
> Maybe even:
>
> #define PMC_CLK_OUT_MUX_MASK(c)	GENMASK(c->shift + 1, c->shift)
>
>>> +	pmc_clk->mux_shift =3D data->mux_shift;
>>> +	pmc_clk->gate_shift =3D data->gate_shift;
>>> +
>>> +	return clk_register(NULL, &pmc_clk->hw);
>>> +}
>>> +
>>> +static void tegra_pmc_clock_register(struct tegra_pmc *pmc,
>>> +				     struct device_node *np)
>>> +{
>>> +	struct clk *clk;
>>> +	struct clk_onecell_data *clk_data;
>>> +	unsigned int num_clks;
>>> +	int i, err =3D -ENOMEM;
>>> +
>>> +	num_clks =3D pmc->soc->num_pmc_clks;
>>> +
>>> +	if (!num_clks)
>>> +		return;
>>> +
>>> +	clk_data =3D kmalloc(sizeof(*clk_data), GFP_KERNEL);
>>> +	if (!clk_data)
>>> +		goto err_clk;
>> What about devm_kmalloc, devm_kcalloc?
>>
>>> +	clk_data->clks =3D kcalloc(TEGRA_PMC_CLK_MAX, sizeof(*clk_data->clks)=
,
>>> +				 GFP_KERNEL);
>>> +	if (!clk_data->clks)
>>> +		goto free_clkdata;
>>> +
>>> +	clk_data->clk_num =3D TEGRA_PMC_CLK_MAX;
>>> +
>>> +	for (i =3D 0; i < TEGRA_PMC_CLK_MAX; i++)
>>> +		clk_data->clks[i] =3D ERR_PTR(-ENOENT);
>>> +
>>> +	for (i =3D 0; i < pmc->soc->num_pmc_clks; i++) {
>>> +		const struct pmc_clk_init_data *data;
>>> +
>>> +		data =3D pmc->soc->pmc_clks_data + i;
>>> +
>>> +		clk =3D tegra_pmc_clk_out_register(data, PMC_CLK_OUT_CNTRL);> +		if =
(IS_ERR(clk)) {
>>> +			dev_err(pmc->dev,
>>> +				"unable to register %s\n", data->name);
>>> +			err =3D PTR_ERR(clk);
>> Error codes in a message could be useful.

Added error code at end of clock register along with WARN message to=20
have it common to show warning with error code for all errors including=20
kmalloc and kcalloc.

>>
>> 		err =3D PTR_ERR_OR_ZERO(clk);
>> 		if (err)
>> 			dev_err(pmc->dev, "unable to register %s: %d\n",
>> 				data->name, err);
>>
>>> +			goto free_clks;
>>> +		}
>> -		clk_data->clks[data->clk_id] =3D clk;
>>
>>> +		err =3D clk_register_clkdev(clk, data->name, NULL);
>>> +		if (err) {
>>> +			dev_err(pmc->dev,
>>> +				"unable to register %s clock lookup\n",
>>> +				data->name);
>> 			dev_err(pmc->dev,
>> 				"unable to register %s clock lookup: %d\n",
>> 				data->name, err);
>>
>>> +			goto free_clks;
>>> +		}
>> I'd move the assignment here for a bit more consistency.
>>
>> +		clk_data->clks[data->clk_id] =3D clk;
>>
>>> +	}
>>> +
>>> +	err =3D of_clk_add_provider(np, of_clk_src_onecell_get, clk_data);
>>> +	if (err) {
>>> +		dev_err(pmc->dev, "failed to add pmc clk provider\n");
>>> +		goto free_clks;
>>> +	}
>> [snip]
>>


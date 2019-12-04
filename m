Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F416C1136EE
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Dec 2019 22:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbfLDVNB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 4 Dec 2019 16:13:01 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44852 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727930AbfLDVNB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Dec 2019 16:13:01 -0500
Received: by mail-lj1-f193.google.com with SMTP id c19so900214lji.11;
        Wed, 04 Dec 2019 13:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=shg+qqJ/vXPet3p4e2cxiBsJ36VIZq+giOZd2Pn48WM=;
        b=RP/qf8ynJBt+I+sRCkivQFhq46kofkGe2E1iPDeJkT3Tpn55z6ZMUB4q/pgDAzsR+2
         jFN4MveKlekMv32dYATrDggSL+OfkleYl9kjgnbzUjYSQido37t0lsORjj9CAOx4MiN/
         tPPDrMfNQOao2mNlcu9eBvD3fL+HVPC3vNtsLflD7gH9BHJEDRD/rr3njj26hmR7MrQl
         WzRo+ytKgAO21tDR0xUOSOe1WttWY1pNkVdImO5V6hJfzoLXKjUNbzPhXi1Xs6tJjLcT
         SJzrMr6zZXHGu7humfrsx8ngM/eDFciO+JQW5+A9siG/04TpOAqil19xPypVE13wEN5w
         W5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=shg+qqJ/vXPet3p4e2cxiBsJ36VIZq+giOZd2Pn48WM=;
        b=PbzPpp8x2+Vkdd+A3QjAk8J4gBS1DAWI+Tlq5o+mM5IPMMTqTDo8eDKvXjMsln6bnq
         JzkhZtYufD9UUlExfyv1z4TWwYV+Q3ZOHTtMwpcxUuxysmi8iUyo6AWyPj7//4HmxsJf
         qQ1iCAQv+xSZZK99D5Go8KeJao8Xbra00zxlgIC+8Ur21knS3mqjPgWIGRb5ZjN6qXYM
         KMxkQPSctUrSOPc3GGzVMeWLfFkbOTRsaDNNcyOGrXslP1j7tnb1FBIfloB3OvN555x0
         zWIVjZykdJfhwtjGCpcAe47HHT0ADmOyg44HAsgM15FuaK4Duxb5a/SF2tXitj4OQWXV
         epUA==
X-Gm-Message-State: APjAAAUY3vpz2vgeZWINRAJar1k5mbm7zeU0TOXYtJRDb97Sns/oRuEC
        /IjJUFbY+FjSayvKUQhwTM79Qmqd
X-Google-Smtp-Source: APXvYqwHGBgq35XpsllL/DwF9/Xw+att3lDYWB1FLz5EZ3Om+OXWa65NZ5eTk120HGjKb7zdXOFI8w==
X-Received: by 2002:a2e:894b:: with SMTP id b11mr3376310ljk.118.1575493976575;
        Wed, 04 Dec 2019 13:12:56 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id a11sm4006627lfg.17.2019.12.04.13.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2019 13:12:55 -0800 (PST)
Subject: Re: [PATCH v2 02/11] soc: tegra: Add Tegra PMC clock registrations
 into PMC driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        mperttunen@nvidia.com, gregkh@linuxfoundation.org,
        sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        mturquette@baylibre.com, horms+renesas@verge.net.au,
        Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de,
        spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com,
        daniel.lezcano@linaro.org, mmaddireddy@nvidia.com,
        markz@nvidia.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1574830773-14892-1-git-send-email-skomatineni@nvidia.com>
 <1574830773-14892-3-git-send-email-skomatineni@nvidia.com>
 <749de44c-ec59-3cab-c02e-7b8fcb1fb9f4@gmail.com>
 <3d1492a1-f2a5-2d56-5341-a28fcb73fe64@nvidia.com>
 <484cb1bb-4fb2-9e71-87be-2bd5bd5b2348@gmail.com>
 <e4ee58aa-c421-ea4b-a37b-574fc987c7c1@nvidia.com>
 <e5da42b8-bf21-4b57-8ae6-37ce6ca4210c@gmail.com>
 <bb4853a1-83d7-273d-50df-324570c4a4b8@nvidia.com>
 <bd979864-b3e8-02b1-e0b0-869ddfa8ac67@nvidia.com>
 <41508376-f30b-3761-47bf-c9c87db997dc@nvidia.com>
 <348e9382-9978-0c01-1493-4226c1cd70a3@nvidia.com>
 <74ff9e90-0969-bf53-444c-d643d342d0cb@nvidia.com>
 <f9d85789-b847-ef88-dbd0-2883a45ed9c3@gmail.com>
 <474d4b95-91af-6bfb-c110-d2d232d9b522@nvidia.com>
 <0a16d627-b0e5-eb03-5aa4-ac200bf202b1@nvidia.com>
 <f649394b-18dc-1709-3c84-cbfb37f289f3@gmail.com>
 <a867bdae-977a-8aad-3c00-93430a739aef@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <48b3cc8d-c617-e3de-2110-34ddc6ec6094@gmail.com>
Date:   Thu, 5 Dec 2019 00:12:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <a867bdae-977a-8aad-3c00-93430a739aef@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.12.2019 23:33, Sowjanya Komatineni пишет:
> 
> On 12/4/19 12:28 PM, Dmitry Osipenko wrote:
>> 04.12.2019 23:08, Sowjanya Komatineni пишет:
>>> On 12/4/19 8:02 AM, Sowjanya Komatineni wrote:
>>>> On 12/4/19 5:39 AM, Dmitry Osipenko wrote:
>>>>> 03.12.2019 19:45, Sowjanya Komatineni пишет:
>>>>>> On 12/2/19 4:07 PM, Sowjanya Komatineni wrote:
>>>>>>> On 12/2/19 3:14 PM, Sowjanya Komatineni wrote:
>>>>>>>> On 12/2/19 3:10 PM, Sowjanya Komatineni wrote:
>>>>>>>>> On 12/2/19 2:58 PM, Sowjanya Komatineni wrote:
>>>>>>>>>> On 12/2/19 1:50 PM, Dmitry Osipenko wrote:
>>>>>>>>>>> 02.12.2019 23:09, Sowjanya Komatineni пишет:
>>>>>>>>>>>> On 11/28/19 5:25 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>>> 28.11.2019 01:57, Sowjanya Komatineni пишет:
>>>>>>>>>>>>>> On 11/27/19 7:14 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>> 27.11.2019 07:59, Sowjanya Komatineni пишет:
>>>>>>>>>>>>>>>> Tegra210 and prior Tegra PMC has clk_out_1, clk_out_2,
>>>>>>>>>>>>>>>> clk_out_3 with
>>>>>>>>>>>>>>>> mux and gate for each of these clocks.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Currently these PMC clocks are registered by Tegra clock
>>>>>>>>>>>>>>>> driver using
>>>>>>>>>>>>>>>> clk_register_mux and clk_register_gate by passing PMC base
>>>>>>>>>>>>>>>> address
>>>>>>>>>>>>>>>> and register offsets and PMC programming for these clocks
>>>>>>>>>>>>>>>> happens
>>>>>>>>>>>>>>>> through direct PMC access by the clock driver.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> With this, when PMC is in secure mode any direct PMC access
>>>>>>>>>>>>>>>> from the
>>>>>>>>>>>>>>>> non-secure world does not go through and these clocks will
>>>>>>>>>>>>>>>> not be
>>>>>>>>>>>>>>>> functional.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> This patch adds these clocks registration with PMC as a
>>>>>>>>>>>>>>>> clock
>>>>>>>>>>>>>>>> provider
>>>>>>>>>>>>>>>> for these clocks. clk_ops callback implementations for
>>>>>>>>>>>>>>>> these
>>>>>>>>>>>>>>>> clocks
>>>>>>>>>>>>>>>> uses tegra_pmc_readl and tegra_pmc_writel which supports
>>>>>>>>>>>>>>>> PMC
>>>>>>>>>>>>>>>> programming
>>>>>>>>>>>>>>>> in secure mode and non-secure mode.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>       drivers/soc/tegra/pmc.c | 330
>>>>>>>>>>>>>>>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>>>>       1 file changed, 330 insertions(+)
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> diff --git a/drivers/soc/tegra/pmc.c
>>>>>>>>>>>>>>>> b/drivers/soc/tegra/pmc.c
>>>>>>>>>>>>>>>> index ea0e11a09c12..a353f6d0a832 100644
>>>>>>>>>>>>>>>> --- a/drivers/soc/tegra/pmc.c
>>>>>>>>>>>>>>>> +++ b/drivers/soc/tegra/pmc.c
>>>>>>>>>>>>>>>> @@ -13,6 +13,9 @@
>>>>>>>>>>>>>>>>         #include <linux/arm-smccc.h>
>>>>>>>>>>>>>>>>       #include <linux/clk.h>
>>>>>>>>>>>>>>>> +#include <linux/clk-provider.h>
>>>>>>>>>>>>>>>> +#include <linux/clkdev.h>
>>>>>>>>>>>>>>>> +#include <linux/clk/clk-conf.h>
>>>>>>>>>>>>>>>>       #include <linux/clk/tegra.h>
>>>>>>>>>>>>>>>>       #include <linux/debugfs.h>
>>>>>>>>>>>>>>>>       #include <linux/delay.h>
>>>>>>>>>>>>>>>> @@ -48,6 +51,7 @@
>>>>>>>>>>>>>>>>       #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
>>>>>>>>>>>>>>>>       #include <dt-bindings/gpio/tegra186-gpio.h>
>>>>>>>>>>>>>>>>       #include <dt-bindings/gpio/tegra194-gpio.h>
>>>>>>>>>>>>>>>> +#include <dt-bindings/soc/tegra-pmc.h>
>>>>>>>>>>>>>>>>         #define PMC_CNTRL            0x0
>>>>>>>>>>>>>>>>       #define  PMC_CNTRL_INTR_POLARITY BIT(17) /*
>>>>>>>>>>>>>>>> inverts INTR
>>>>>>>>>>>>>>>> polarity */
>>>>>>>>>>>>>>>> @@ -100,6 +104,7 @@
>>>>>>>>>>>>>>>>       #define PMC_WAKE2_STATUS        0x168
>>>>>>>>>>>>>>>>       #define PMC_SW_WAKE2_STATUS 0x16c
>>>>>>>>>>>>>>>>       +#define PMC_CLK_OUT_CNTRL 0x1a8
>>>>>>>>>>>>>>>>       #define PMC_SENSOR_CTRL 0x1b0
>>>>>>>>>>>>>>>>       #define PMC_SENSOR_CTRL_SCRATCH_WRITE BIT(2)
>>>>>>>>>>>>>>>>       #define  PMC_SENSOR_CTRL_ENABLE_RST BIT(1)
>>>>>>>>>>>>>>>> @@ -155,6 +160,91 @@
>>>>>>>>>>>>>>>>       #define  TEGRA_SMC_PMC_READ    0xaa
>>>>>>>>>>>>>>>>       #define  TEGRA_SMC_PMC_WRITE    0xbb
>>>>>>>>>>>>>>>>       +struct pmc_clk_mux {
>>>>>>>>>>>>>>>> +    struct clk_hw    hw;
>>>>>>>>>>>>>>>> +    unsigned long    offs;
>>>>>>>>>>>>>>>> +    u32        mask;
>>>>>>>>>>>>>>>> +    u32        shift;
>>>>>>>>>>>>>>>> +};
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +#define to_pmc_clk_mux(_hw) container_of(_hw, struct
>>>>>>>>>>>>>>>> pmc_clk_mux, hw)
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +struct pmc_clk_gate {
>>>>>>>>>>>>>>>> +    struct clk_hw    hw;
>>>>>>>>>>>>>>>> +    unsigned long    offs;
>>>>>>>>>>>>>>>> +    u32        shift;
>>>>>>>>>>>>>>>> +};
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +#define to_pmc_clk_gate(_hw) container_of(_hw, struct
>>>>>>>>>>>>>>>> pmc_clk_gate, hw)
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +struct pmc_clk_init_data {
>>>>>>>>>>>>>>>> +    char *mux_name;
>>>>>>>>>>>>>>>> +    char *gate_name;
>>>>>>>>>>>>>>>> +    const char **parents;
>>>>>>>>>>>>>>>> +    int num_parents;
>>>>>>>>>>>>>>>> +    int mux_id;
>>>>>>>>>>>>>>>> +    int gate_id;
>>>>>>>>>>>>>>>> +    char *dev_name;
>>>>>>>>>>>>>>>> +    u8 mux_shift;
>>>>>>>>>>>>>>>> +    u8 gate_shift;
>>>>>>>>>>>>>>>> +    u8 init_parent_index;
>>>>>>>>>>>>>>>> +    int init_state;
>>>>>>>>>>>>>>>> +};
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static const char *clk_out1_parents[] = { "clk_m",
>>>>>>>>>>>>>>>> "clk_m_div2",
>>>>>>>>>>>>>>>> +    "clk_m_div4", "extern1",
>>>>>>>>>>>>>>>> +};
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static const char *clk_out2_parents[] = { "clk_m",
>>>>>>>>>>>>>>>> "clk_m_div2",
>>>>>>>>>>>>>>>> +    "clk_m_div4", "extern2",
>>>>>>>>>>>>>>>> +};
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static const char *clk_out3_parents[] = { "clk_m",
>>>>>>>>>>>>>>>> "clk_m_div2",
>>>>>>>>>>>>>>>> +    "clk_m_div4", "extern3",
>>>>>>>>>>>>>>>> +};
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static struct pmc_clk_init_data tegra_pmc_clks_data[] = {
>>>>>>>>>>>>>>>> +    {
>>>>>>>>>>>>>>>> +        .mux_name = "clk_out_1_mux",
>>>>>>>>>>>>>>>> +        .gate_name = "clk_out_1",
>>>>>>>>>>>>>>>> +        .parents = clk_out1_parents,
>>>>>>>>>>>>>>>> +        .num_parents = ARRAY_SIZE(clk_out1_parents),
>>>>>>>>>>>>>>>> +        .mux_id = TEGRA_PMC_CLK_OUT_1_MUX,
>>>>>>>>>>>>>>>> +        .gate_id = TEGRA_PMC_CLK_OUT_1,
>>>>>>>>>>>>>>>> +        .dev_name = "extern1",
>>>>>>>>>>>>>>>> +        .mux_shift = 6,
>>>>>>>>>>>>>>>> +        .gate_shift = 2,
>>>>>>>>>>>>>>>> +        .init_parent_index = 3,
>>>>>>>>>>>>>>>> +        .init_state = 1,
>>>>>>>>>>>>>>>> +    },
>>>>>>>>>>>>>>>> +    {
>>>>>>>>>>>>>>>> +        .mux_name = "clk_out_2_mux",
>>>>>>>>>>>>>>>> +        .gate_name = "clk_out_2",
>>>>>>>>>>>>>>>> +        .parents = clk_out2_parents,
>>>>>>>>>>>>>>>> +        .num_parents = ARRAY_SIZE(clk_out2_parents),
>>>>>>>>>>>>>>>> +        .mux_id = TEGRA_PMC_CLK_OUT_2_MUX,
>>>>>>>>>>>>>>>> +        .gate_id = TEGRA_PMC_CLK_OUT_2,
>>>>>>>>>>>>>>>> +        .dev_name = "extern2",
>>>>>>>>>>>>>>>> +        .mux_shift = 14,
>>>>>>>>>>>>>>>> +        .gate_shift = 10,
>>>>>>>>>>>>>>>> +        .init_parent_index = 0,
>>>>>>>>>>>>>>>> +        .init_state = 0,
>>>>>>>>>>>>>>>> +    },
>>>>>>>>>>>>>>>> +    {
>>>>>>>>>>>>>>>> +        .mux_name = "clk_out_3_mux",
>>>>>>>>>>>>>>>> +        .gate_name = "clk_out_3",
>>>>>>>>>>>>>>>> +        .parents = clk_out3_parents,
>>>>>>>>>>>>>>>> +        .num_parents = ARRAY_SIZE(clk_out3_parents),
>>>>>>>>>>>>>>>> +        .mux_id = TEGRA_PMC_CLK_OUT_3_MUX,
>>>>>>>>>>>>>>>> +        .gate_id = TEGRA_PMC_CLK_OUT_3,
>>>>>>>>>>>>>>>> +        .dev_name = "extern3",
>>>>>>>>>>>>>>>> +        .mux_shift = 22,
>>>>>>>>>>>>>>>> +        .gate_shift = 18,
>>>>>>>>>>>>>>>> +        .init_parent_index = 0,
>>>>>>>>>>>>>>>> +        .init_state = 0,
>>>>>>>>>>>>>>>> +    },
>>>>>>>>>>>>>>>> +};
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>       struct tegra_powergate {
>>>>>>>>>>>>>>>>           struct generic_pm_domain genpd;
>>>>>>>>>>>>>>>>           struct tegra_pmc *pmc;
>>>>>>>>>>>>>>>> @@ -254,6 +344,9 @@ struct tegra_pmc_soc {
>>>>>>>>>>>>>>>>            */
>>>>>>>>>>>>>>>>           const struct tegra_wake_event *wake_events;
>>>>>>>>>>>>>>>>           unsigned int num_wake_events;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    struct pmc_clk_init_data *pmc_clks_data;
>>>>>>>>>>>>>>>> +    unsigned int num_pmc_clks;
>>>>>>>>>>>>>>>>       };
>>>>>>>>>>>>>>>>         static const char * const
>>>>>>>>>>>>>>>> tegra186_reset_sources[] = {
>>>>>>>>>>>>>>>> @@ -2163,6 +2256,228 @@ static int
>>>>>>>>>>>>>>>> tegra_pmc_clk_notify_cb(struct
>>>>>>>>>>>>>>>> notifier_block *nb,
>>>>>>>>>>>>>>>>           return NOTIFY_OK;
>>>>>>>>>>>>>>>>       }
>>>>>>>>>>>>>>>>       +static void pmc_clk_fence_udelay(u32 offset)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +    tegra_pmc_readl(pmc, offset);
>>>>>>>>>>>>>>>> +    /* pmc clk propagation delay 2 us */
>>>>>>>>>>>>>>>> +    udelay(2);
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static u8 pmc_clk_mux_get_parent(struct clk_hw *hw)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +    struct pmc_clk_mux *mux = to_pmc_clk_mux(hw);
>>>>>>>>>>>>>>>> +    int num_parents = clk_hw_get_num_parents(hw);
>>>>>>>>>>>>>>>> +    u32 val;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    val = tegra_pmc_readl(pmc, mux->offs) >> mux->shift;
>>>>>>>>>>>>>>>> +    val &= mux->mask;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    if (val >= num_parents)
>>>>>>>>>>>>>>>> +        return -EINVAL;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    return val;
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static int pmc_clk_mux_set_parent(struct clk_hw *hw, u8
>>>>>>>>>>>>>>>> index)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +    struct pmc_clk_mux *mux = to_pmc_clk_mux(hw);
>>>>>>>>>>>>>>>> +    u32 val;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    val = tegra_pmc_readl(pmc, mux->offs);
>>>>>>>>>>>>>>>> +    val &= ~(mux->mask << mux->shift);
>>>>>>>>>>>>>>>> +    val |= index << mux->shift;
>>>>>>>>>>>>>>>> +    tegra_pmc_writel(pmc, val, mux->offs);
>>>>>>>>>>>>>>>> +    pmc_clk_fence_udelay(mux->offs);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    return 0;
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static const struct clk_ops pmc_clk_mux_ops = {
>>>>>>>>>>>>>>>> +    .get_parent = pmc_clk_mux_get_parent,
>>>>>>>>>>>>>>>> +    .set_parent = pmc_clk_mux_set_parent,
>>>>>>>>>>>>>>>> +    .determine_rate = __clk_mux_determine_rate,
>>>>>>>>>>>>>>>> +};
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static struct clk *
>>>>>>>>>>>>>>>> +tegra_pmc_clk_mux_register(const char *name, const char *
>>>>>>>>>>>>>>>> const
>>>>>>>>>>>>>>>> *parent_names,
>>>>>>>>>>>>>>>> +               int num_parents, unsigned long flags,
>>>>>>>>>>>>>>>> +               unsigned long offset, u32 shift, u32 mask)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +    struct clk_init_data init;
>>>>>>>>>>>>>>>> +    struct pmc_clk_mux *mux;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    mux = kzalloc(sizeof(*mux), GFP_KERNEL);
>>>>>>>>>>>>>>>> +    if (!mux)
>>>>>>>>>>>>>>>> +        return ERR_PTR(-ENOMEM);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    init.name = name;
>>>>>>>>>>>>>>>> +    init.ops = &pmc_clk_mux_ops;
>>>>>>>>>>>>>>>> +    init.parent_names = parent_names;
>>>>>>>>>>>>>>>> +    init.num_parents = num_parents;
>>>>>>>>>>>>>>>> +    init.flags = flags;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    mux->hw.init = &init;
>>>>>>>>>>>>>>>> +    mux->offs = offset;
>>>>>>>>>>>>>>>> +    mux->mask = mask;
>>>>>>>>>>>>>>>> +    mux->shift = shift;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    return clk_register(NULL, &mux->hw);
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static int pmc_clk_is_enabled(struct clk_hw *hw)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +    struct pmc_clk_gate *gate = to_pmc_clk_gate(hw);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    return tegra_pmc_readl(pmc, gate->offs) &
>>>>>>>>>>>>>>>> BIT(gate->shift) ? 1
>>>>>>>>>>>>>>>> : 0;
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static void pmc_clk_set_state(struct clk_hw *hw, int
>>>>>>>>>>>>>>>> state)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +    struct pmc_clk_gate *gate = to_pmc_clk_gate(hw);
>>>>>>>>>>>>>>>> +    u32 val;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    val = tegra_pmc_readl(pmc, gate->offs);
>>>>>>>>>>>>>>>> +    val = state ? (val | BIT(gate->shift)) : (val &
>>>>>>>>>>>>>>>> ~BIT(gate->shift));
>>>>>>>>>>>>>>>> +    tegra_pmc_writel(pmc, val, gate->offs);
>>>>>>>>>>>>>>>> +    pmc_clk_fence_udelay(gate->offs);
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static int pmc_clk_enable(struct clk_hw *hw)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +    pmc_clk_set_state(hw, 1);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    return 0;
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static void pmc_clk_disable(struct clk_hw *hw)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +    pmc_clk_set_state(hw, 0);
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static const struct clk_ops pmc_clk_gate_ops = {
>>>>>>>>>>>>>>>> +    .is_enabled = pmc_clk_is_enabled,
>>>>>>>>>>>>>>>> +    .enable = pmc_clk_enable,
>>>>>>>>>>>>>>>> +    .disable = pmc_clk_disable,
>>>>>>>>>>>>>>>> +};
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static struct clk *
>>>>>>>>>>>>>>>> +tegra_pmc_clk_gate_register(const char *name, const char
>>>>>>>>>>>>>>>> *parent_name,
>>>>>>>>>>>>>>>> +                unsigned long flags, unsigned long offset,
>>>>>>>>>>>>>>>> +                u32 shift)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +    struct clk_init_data init;
>>>>>>>>>>>>>>>> +    struct pmc_clk_gate *gate;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    gate = kzalloc(sizeof(*gate), GFP_KERNEL);
>>>>>>>>>>>>>>>> +    if (!gate)
>>>>>>>>>>>>>>>> +        return ERR_PTR(-ENOMEM);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    init.name = name;
>>>>>>>>>>>>>>>> +    init.ops = &pmc_clk_gate_ops;
>>>>>>>>>>>>>>>> +    init.parent_names = &parent_name;
>>>>>>>>>>>>>>>> +    init.num_parents = 1;
>>>>>>>>>>>>>>>> +    init.flags = flags;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    gate->hw.init = &init;
>>>>>>>>>>>>>>>> +    gate->offs = offset;
>>>>>>>>>>>>>>>> +    gate->shift = shift;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    return clk_register(NULL, &gate->hw);
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static void tegra_pmc_clock_register(struct tegra_pmc
>>>>>>>>>>>>>>>> *pmc,
>>>>>>>>>>>>>>>> +                     struct device_node *np)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +    struct clk *clkmux, *clk, *parent;
>>>>>>>>>>>>>>>> +    struct clk_onecell_data *clk_data;
>>>>>>>>>>>>>>>> +    unsigned int num_clks;
>>>>>>>>>>>>>>>> +    int i, ret;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    /* each pmc clock output has a mux and a gate */
>>>>>>>>>>>>>>>> +    num_clks = pmc->soc->num_pmc_clks * 2;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    if (!num_clks)
>>>>>>>>>>>>>>>> +        return;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    clk_data = kmalloc(sizeof(*clk_data), GFP_KERNEL);
>>>>>>>>>>>>>>>> +    if (!clk_data)
>>>>>>>>>>>>>>>> +        return;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    clk_data->clks = kcalloc(TEGRA_PMC_CLK_MAX,
>>>>>>>>>>>>>>>> sizeof(*clk_data->clks),
>>>>>>>>>>>>>>>> +                 GFP_KERNEL);
>>>>>>>>>>>>>>>> +    if (!clk_data->clks)
>>>>>>>>>>>>>>>> +        goto free_clkdata;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    clk_data->clk_num = num_clks;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    for (i = 0; i < pmc->soc->num_pmc_clks; i++) {
>>>>>>>>>>>>>>>> +        struct pmc_clk_init_data *data;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +        data = pmc->soc->pmc_clks_data + i;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +        clkmux =
>>>>>>>>>>>>>>>> tegra_pmc_clk_mux_register(data->mux_name,
>>>>>>>>>>>>>>>> + data->parents,
>>>>>>>>>>>>>>>> + data->num_parents,
>>>>>>>>>>>>>>>> + CLK_SET_RATE_NO_REPARENT |
>>>>>>>>>>>>>>>> + CLK_SET_RATE_PARENT,
>>>>>>>>>>>>>>>> + PMC_CLK_OUT_CNTRL,
>>>>>>>>>>>>>>>> + data->mux_shift, 3);
>>>>>>>>>>>>>>>> +        if (IS_ERR(clkmux))
>>>>>>>>>>>>>>>> +            goto free_clks;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> + clk_data->clks[data->mux_id] = clkmux;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +        clk = tegra_pmc_clk_gate_register(data->gate_name,
>>>>>>>>>>>>>>>> + data->mux_name,
>>>>>>>>>>>>>>>> + CLK_SET_RATE_PARENT,
>>>>>>>>>>>>>>>> + PMC_CLK_OUT_CNTRL,
>>>>>>>>>>>>>>>> + data->gate_shift);
>>>>>>>>>>>>>>>> +        if (IS_ERR(clk))
>>>>>>>>>>>>>>>> +            goto free_clks;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> + clk_data->clks[data->gate_id] = clk;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +        ret = clk_set_parent(clk, clkmux);
>>>>>>>>>>>>>>>> +        if (ret < 0) {
>>>>>>>>>>>>>>>> +            pr_err("failed to set parent of %s to %s\n",
>>>>>>>>>>>>>>>> +                   __func__, __clk_get_name(clk),
>>>>>>>>>>>>>>>> + __clk_get_name(clkmux));
>>>>>>>>>>>>>>>> +        }
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +        clk_register_clkdev(clk, data->dev_name,
>>>>>>>>>>>>>>>> data->gate_name);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +        /* configure initial clock parent and state */
>>>>>>>>>>>>>>>> +        parent = clk_get_sys(data->gate_name,
>>>>>>>>>>>>>>>> + data->parents[data->init_parent_index]);
>>>>>>>>>>> Couldn't the default parent be defined using "assigned clock"
>>>>>>>>>>> in a
>>>>>>>>>>> device-tree? Please see "Assigned clock parents and rates" in
>>>>>>>>>>> the
>>>>>>>>>>> doc.
>>>>>>>>>>>
>>>>>>>>>>> https://www.kernel.org/doc/Documentation/devicetree/bindings/clock/clock-bindings.txt
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Then you could simply use of_clk_set_defaults(pmc->dev->of_node,
>>>>>>>>>>> true).
>>>>>>>>>> Yes, of_clk_add_provider() does of_clk_set_defaults which sets
>>>>>>>>>> based on assigned parents and clock rates.
>>>>>>>>>>
>>>>>>>>>> This need device tree to specify assigned clock parent
>>>>>>>>>> properties.
>>>>>>>>>> Will update device tree and remove init parent from the driver.
>>>>>>>>>>
>>>>>>>>> assigned-clock properties should be set in consumer node of these
>>>>>>>>> clocks and currently these clocks are not used yet.
>>>>>>>>>
>>>>>>>>> So will just remove init parent from driver and when these clocks
>>>>>>>>> are used device tree can be updated in corresponding consumer node
>>>>>>>>> with these properties.
>>>>>>>>>
>>>>>>>> How about default ON/OFF init state for the clocks? I see
>>>>>>>> assigned-clock properties for parent and rate only.
>>>>>>>>
>>>>>>>> But based on existing clock-tegra-pmc driver, I see clk_out_1 is
>>>>>>>> default enabled with extern1 parent for T30 thru T210 platforms.
>>>>>>>>
>>>>>>>> Peter/Thierry, What was the reason we enable clk_out_1 right
>>>>>>>> from the
>>>>>>>> clock registration?
>>>>>>>>
>>>>>>> clk_out_1 is for audio and its not required to be enabled during the
>>>>>>> boot and audio driver can enable/disable it.
>>>>>>>
>>>>>>> same with blink 32khz which is used for WIFI. WIFI driver can
>>>>>>> enable/disable during power up/down sequence and technically as per
>>>>>>> design we dont need to have it always on right from the boot.
>>>>>>>
>>>>>>> So can remove out clocks init states from driver once thierry also
>>>>>>> agree on this.
>>>>>>>
>>>>>> Hi Dmitry,
>>>>>>
>>>>>> Looking at audio driver, it doesn't take care of mclk which is from
>>>>>> clk_out_1 and expects mclk to be always on.
>>>>>>
>>>>>> So probably we should have this init state enables in pmc driver for
>>>>>> 32Khz and clk_out's to not break existing functionality.
>>>>> Hello Sowjanya,
>>>>>
>>>>> IIUC, it's a bug in the device-trees and sound's MCLK actually
>>>>> should be
>>>>> set to CLK_OUT_1 of PMC instead of CaR's EXTPERIPH1. If that's the
>>>>> case,
>>>>> then the device-trees need to be fixed.
>>>> OK, will have this in v3
>>> Actually if we change mclk to use clk_out_1, then it will break with old
>>> device trees.
>>>
>>> Currently clk_out_1 parent is set to extern1 as init state by the clock
>>> driver and device tree for sound node is using extern1 as mclk works and
>>> extern1 itself has enable and disable. But yes implementation wise, its
>>> incorrect as mclk should really be clk_out_1.
>>>
>>> Now, with moving clk_out_1 to tegra PMC, pmc is the clock provider and
>>> if we now change the device tree to use CLK_OUT_1 as mclk then it will
>>> break old device tree.
>> There souldn't be any problem with enabling CLK_OUT_1 by the audio
>> driver itself (in the code) if an old device-tree is detected.
>>
>>     clk_out_1 = clk_get(dev, "clk_out_1");
>>     clk_set_parent(clk_out_1, clk_extern1);
>>     ...
>>     data->clk_cdev1 = clk_out_1;
>>
>> Maybe it will be even better to compare clocks for detection of an
>> older DT:
>>
>>     if (tegra_get_chip_id() > TEGRA20 &&
>>         clk_is_match(data->clk_cdev1, clk_extern1)) {
>>     ...
>>
> we can do parent init in audio driver which is not an issue.
> 
> But I was saying we can keep extern1 as mclk in device tree instead of
> changing to clk_out_1 from pmc as it will break old device tree becasue
> we moved clk_out_1 from clock driver to pmc driver.
> 
> once we do init parent in audio driver, we still can use extern1 as mclk
> in device tree.
> 
> mclk -> clk_out_1 -> extern1 -> plla_out0 -> plla
> 
> with init of clk_out_1 parent to extern1, mclk can use extern1 handle
> for rate/enable/disable clk operations

It should be okay to fallback to extern1 for a backwards compatibility
of the new DT with older kernels.

@@ -192,8 +192,14 @@ int tegra_asoc_utils_init(struct
tegra_asoc_utils_data *data,
        data->clk_cdev1 = clk_get(dev, "mclk");
        if (IS_ERR(data->clk_cdev1)) {
                dev_err(data->dev, "Can't retrieve clk cdev1\n");
-               ret = PTR_ERR(data->clk_cdev1);
-               goto err_put_pll_a_out0;
+
+               data->clk_cdev1 = clk_get_sys("clk_out_1", "extern1");
+               if (IS_ERR(data->clk_cdev1)) {
+                       ret = PTR_ERR(data->clk_cdev1);
+                       goto err_put_pll_a_out0;
+               }
+
+               dev_err(data->dev, "Falling back to extern1\n");
        }

        ret = tegra_asoc_utils_set_rate(data, 44100, 256 * 44100);

This change should be a standalone patch and it should be requsted for
backporting into stable kernels.

>>>>>> Regarding using assigned-clock properties for init parent and
>>>>>> removing
>>>>>> init parent from driver, it also needs consumer node in device
>>>>>> tree to
>>>>>> be updated to specify assigned-clock properties for default/init
>>>>>> parent.
>>>>>>
>>>>>> This breaks device tree ABI as prior Tegra210 supports audio driver.
>>>>> So it's the sound node which should have had the assigned clocks in
>>>>> device-tree in order to define route for the audio MCLK clock from CaR
>>>>> to PMC.
>>>>>
>>>>> Given that the audio clocks configuration is the same for all of the
>>>>> currently supported boards, I think it will be better to remove the
>>>>> entire audio clocks initialization from the clk drivers and move it
>>>>> all
>>>>> to the audio driver. It could be something like this:
>>>>>
>>>>> int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
>>>>>                struct device *dev)
>>>>> {
>>>>>      ...
>>>>>
>>>>>      if (!of_find_property(dev->of_node, "assigned-clock-parents",
>>>>> NULL) &&
>>>>>          tegra_get_chip_id() > TEGRA20) {
>>>>>          clk_extern1 = clk_get(dev, "extern1");
>>>>>          ...
>>>>>          clk_set_parent(clk_extern1, clk_pll_a_out0);
>>>>>          ...
>>>>>          clk_put(data->clk_cdev1);
>>>>>
>>>>>          data->clk_cdev1 = clk_out_1;
>>>>>      }
>>>>>      ...
>>>>>
>>>>> So now the old device-trees will cointinue to work and new could have
>>>>> the assigned-clocks and set MCLK to CLK_OUT_1.
>>>>>
>>>>> [snip]
>>>> Will update clk-tegra, pmc and audio driver to move init state
>>>> configuration for extern1 and clk_out_1 into audio driver and will use
>>>> assigned clock properties in device tree.
>>>>


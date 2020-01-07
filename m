Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52ACC133765
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Jan 2020 00:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbgAGX2N (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 7 Jan 2020 18:28:13 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33764 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgAGX2N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Jan 2020 18:28:13 -0500
Received: by mail-lj1-f193.google.com with SMTP id y6so1421227lji.0;
        Tue, 07 Jan 2020 15:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eTZGag+y6119nfv8Dd/B27LF9AMF/5U+f13CKpoPEUE=;
        b=hVYyNLsCsAy1f7z532KOxTvi4vu+IVQDm7L35oiVOsJXTmngWBP/xaq8WFldkeJLOh
         VhITjPRL51WOT7c0tjGD/w0ZpiD470HjkUWVF/ShekSQIu9VVoK1+iLQUg+zt9CyaPQB
         fWGV4zJyJHRjgCwcuqtgrUxORaCER0gY1G/Ipwd7Htzd6ZKDAyAJtPhcfYebLLKcEtit
         nB4slwP/hrIaT9+XKYO/fsgj6iZOPFvElSkCpMG43jtDivgUa2uWauszbyb+tuKToWcK
         Q9UMZkxnK97PRT4D5N65mhzNyi9w0kKlF+/kb9eNNef2us1Dt++sUUiaztjzHAZHFq8p
         nc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eTZGag+y6119nfv8Dd/B27LF9AMF/5U+f13CKpoPEUE=;
        b=eA1u3RjnNPacP3EgzdODz76teElvanTSJ2OOWMRV1PBaKWZ1NBVDkxAg2tSqwwA/Rb
         Aww4KqAsFp0IXo0PqGtLHsnVBdlRHju7pRvCmTXccwZwp4ai8VpNWOPPcdA+ROrI3Fa/
         d6zKEsat2YcdjZG17Smu3lug4qxORllMlg65Gdn/vnNrRpKG59YCJ6zqwgo5muEYPL2H
         Ua9ufqhMmIMgfQBStkTR0a08F0KLQyd+gd77CU84AB5evoe5tpZ+w5ACPHYIB2N5b08N
         Z+UFzn54V3ivIU1fKTak6cRte5oiYoVJNw4dpUr3J9D4KBmVP+jdaaRaf8Do5ulESQBg
         PCOA==
X-Gm-Message-State: APjAAAWcr0W1g9elouqgu/CfQrFcIcET5hTLFXmsLfEdr2aRnwu4q3li
        wcfuQ2oXu0z4d94nt9afdVrth4VE
X-Google-Smtp-Source: APXvYqwvzYcRGsb23HVw3Gc+K7buHuUVz83DL1Yf/5A4zjfvva27qftO3pt05dDeXo6F86b8IySA4Q==
X-Received: by 2002:a2e:98c6:: with SMTP id s6mr1170474ljj.14.1578439689994;
        Tue, 07 Jan 2020 15:28:09 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id x29sm539782lfg.45.2020.01.07.15.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 15:28:09 -0800 (PST)
Subject: Re: [PATCH v6 00/19] Move PMC clocks into Tegra PMC driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        mperttunen@nvidia.com, gregkh@linuxfoundation.org,
        sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com,
        josephl@nvidia.com, daniel.lezcano@linaro.org,
        mmaddireddy@nvidia.com, markz@nvidia.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1578370458-3686-1-git-send-email-skomatineni@nvidia.com>
 <4f52bc6e-3e97-f5fb-ce20-be7b55e688ee@gmail.com>
 <d0447620-48bb-ab2a-1f5f-f8a62aa736f7@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1e603a95-fb6b-1b8a-a0c2-9b47666da79a@gmail.com>
Date:   Wed, 8 Jan 2020 02:28:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <d0447620-48bb-ab2a-1f5f-f8a62aa736f7@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

08.01.2020 02:24, Sowjanya Komatineni пишет:
> 
> On 1/7/20 3:01 PM, Dmitry Osipenko wrote:
>> Hello Sowjanya,
>>
>> 07.01.2020 07:13, Sowjanya Komatineni пишет:
>>> This patch series moves Tegra PMC clocks from clock driver to pmc driver
>>> along with the device trees changes and audio driver which uses one of
>>> the pmc clock for audio mclk.
>>>
>>> Tegra PMC has clk_out_1, clk_out_2, clk_out_3 and blink controls which
>>> are currently registered by Tegra clock driver using clk_regiser_mux and
>>> clk_register_gate which performs direct Tegra PMC register access.
>>>
>>> When Tegra PMC is in secure mode, any access from non-secure world will
>>> not go through.
>>>
>>> This patch series adds these Tegra PMC clocks and blink controls to
>>> Tegra
>>> PMC driver with PMC as clock provider and removes them from Tegra clock
>>> driver.
>>>
>>> PMC clock clk_out_1 is dedicated for audio mclk from Tegra30 thru
>>> Tegra210
>>> and clock driver does inital parent configuration for it and enables
>>> them.
>>> But this clock should be taken care by audio driver as there is no need
>>> to have this clock pre enabled.
>>>
>>> So, this series also includes patch that updates ASoC driver to take
>>> care of parent configuration for mclk if device tree don't specify
>>> initial parent configuration using assigned-clock-parents and controls
>>> audio mclk enable/disable during ASoC machine startup and shutdown.
>>>
>>> DTs are also updated to use clk_out_1 as audio mclk rather than extern1.
>>>
>>> This series also includes a patch for mclk fallback to extern1 when
>>> retrieving mclk fails to have this backward compatible of new DT with
>>> old kernels.
>>>
>>> [v6]:    Changes between v5 and v6 are
>>>     - v5 feedback
>>>     - Added ASoC machine startup and shutdown callbacks to control audio
>>>       mclk enable/disable and removed default mclk enable from clock
>>> driver.
>>>     - Updated tegra_asoc_utils_set_rate to disable mclk only during PLLA
>>>       rate change and removed disabling PLLA as its already taken
>>> care by
>>>       pll clock driver.
>>>     - Removed tegra_asoc_utils_set_rate call from utils_init as set_rate
>>>       is set during machine hw_params and during utils_init mclk is
>>>       already in disabled state and this causes warning during mclk
>>> disable
>>>       in utils_set_rate.
>>>
>>> [v5]:    Changes between v4 and v5 are
>>>     - v4 feedback
>>>     - updated dt-binding pmc YAML schema with more description on power
>>>       gate nodes and pad configuration state nodes.
>>>     - update tegra_asoc_utils_set_rate to disable audio mclk only if
>>>       its in enable state.
>>>
>>> [v4]:    Changes between v3 and v4 are
>>>     - v3 Feedback
>>>     - Updated clocks clk_m_div2 and clk_m_div4 as osc_div2 and osc_div4.
>>>       Tegra don't have clk_m_div2, clk_m_div4 and they should actually
>>>       be osc_div2 and osc_div4 clocks from osc pads.
>>>     - Fixed PMC clock parents to use osc, osc_div2, osc_div4.
>>>     - Register each PMC clock as single clock rather than separate
>>>       mux and gate clocks.
>>>     - Update ASoC utils to use resource managed APIs rather than
>>>       using clk_get and clk_put.
>>>     - Updated device tree and ASoC driver to use clk_out_1 instead of
>>>       clk_out_1_mux as PMC clocks are registered as single clock.
>>>     - Update clock driver init_table to not enable audio related clocks
>>>       as ASoC utils will do audio clock enables.
>>>
>>> [v3]:    Changes between v2 and v3 are
>>>     - Removes set parent of clk_out_1_mux to extern1 and enabling
>>>       extern1 from the clock driver.
>>>     - Doesn't enable clk_out_1 and blink by default in pmc driver
>>>     - Updates ASoC driver to take care of audio mclk parent
>>>       configuration incase if device tree don't specify assigned
>>>       clock parent properties and enables mclk using both clk_out_1
>>>       and extern1.
>>>     - updates all device trees using extern1 as mclk in sound node
>>>       to use clk_out_1 from pmc.
>>>     - patch for YAML format pmc dt-binding
>>>     - Includes v2 feedback
>>>
>>> [v2]:    Changes between v1 and v2 are
>>>     - v2 includes patches for adding clk_out_1, clk_out_2, clk_out_3,
>>>       blink controls to Tegra PMC driver and removing clk-tegra-pmc.
>>>     - feedback related to pmc clocks in Tegra PMC driver from v1
>>>     - Removed patches for WB0 PLLM overrides and PLLE IDDQ PMC
>>> programming
>>>       by the clock driver using helper functions from Tegra PMC.
>>>
>>>         Note:
>>>       To use helper functions from PMC driver, PMC early init need to
>>>       happen prior to using helper functions and these helper
>>> functions are
>>>       for PLLM Override and PLLE IDDQ programming in PMC during
>>> PLLM/PLLE
>>>       clock registration which happen in clock_init prior to Tegra PMC
>>>       probe.
>>>       Moving PLLM/PLLE clocks registration to happen after Tegra PMC
>>>       impacts other clocks EMC, MC and corresponding tegra_emc_init and
>>>       tegra_mc_init.
>>>       This implementation of configuring PMC registers thru helper
>>>       functions in clock driver needs proper changes across PMC, Clock,
>>>       EMC and MC inits to have it work across all Tegra platforms.
>>>
>>>       Currently PLLM Override is not enabled in the bootloader so proper
>>>       patches for this fix will be taken care separately.
>>>
>>> [v1]:    v1 includes patches for below fixes.
>>>     - adding clk_out_1, clk_out_2, clk_out_3, blink controls to Tegra
>>> PMC
>>>       driver and removing clk-tegra-pmc.
>>>     - updated clock provider from tegra_car to pmc in the device tree
>>>       tegra210-smaug.dts that uses clk_out_2.
>>>     - Added helper functions in PMC driver for WB0 PLLM overrides and
>>> PLLE
>>>       IDDQ programming to use by clock driver and updated clock
>>> driver to
>>>       use these helper functions and removed direct PMC access from
>>> clock
>>>       driver and all pmc base address references in clock driver.
>>>
>>>
>>>
>>>
>>> Sowjanya Komatineni (19):
>>>    dt-bindings: clock: tegra: Change CLK_M_DIV to OSC_DIV clocks
>>>    clk: tegra: Change CLK_M_DIV clocks to OSC_DIV clocks
>>>    clk: tegra: Fix Tegra PMC clock out parents
>>>    dt-bindings: tegra: Convert Tegra PMC bindings to YAML
>>>    dt-bindings: soc: tegra-pmc: Add Tegra PMC clock bindings
>>>    soc: tegra: Add Tegra PMC clocks registration into PMC driver
>>>    dt-bindings: soc: tegra-pmc: Add id for Tegra PMC 32KHz blink clock
>>>    soc: tegra: Add support for 32KHz blink clock
>>>    clk: tegra: Remove tegra_pmc_clk_init along with clk ids
>>>    dt-bindings: clock: tegra: Remove pmc clock ids from clock
>>> dt-bindings
>>>    ASoC: tegra: Use device managed resource APIs to get the clock
>>>    ASoC: tegra: Add audio mclk configuration
>>>    ASoC: tegra: Add fallback implementation for audio mclk
>>>    clk: tegra: Remove audio related clock enables from init_table
>>>    ARM: dts: tegra: Add clock-cells property to pmc
>>>    arm64: tegra: Add clock-cells property to Tegra PMC node
>>>    ARM: tegra: Update sound node clocks in device tree
>>>    arm64: tegra: smaug: Change clk_out_2 provider to pmc
>>>    ASoC: nau8825: change Tegra clk_out_2 provider from tegra_car to pmc
>>>
>>>   .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 300
>>> -----------------
>>>   .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 354
>>> +++++++++++++++++++++
>>>   .../devicetree/bindings/sound/nau8825.txt          |   2 +-
>>>   arch/arm/boot/dts/tegra114-dalmore.dts             |   8 +-
>>>   arch/arm/boot/dts/tegra114.dtsi                    |   4 +-
>>>   arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi        |   8 +-
>>>   arch/arm/boot/dts/tegra124-apalis.dtsi             |   8 +-
>>>   arch/arm/boot/dts/tegra124-jetson-tk1.dts          |   8 +-
>>>   arch/arm/boot/dts/tegra124-nyan.dtsi               |   8 +-
>>>   arch/arm/boot/dts/tegra124-venice2.dts             |   8 +-
>>>   arch/arm/boot/dts/tegra124.dtsi                    |   4 +-
>>>   arch/arm/boot/dts/tegra20.dtsi                     |   4 +-
>>>   arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi         |   8 +-
>>>   arch/arm/boot/dts/tegra30-apalis.dtsi              |   8 +-
>>>   arch/arm/boot/dts/tegra30-beaver.dts               |   8 +-
>>>   arch/arm/boot/dts/tegra30-cardhu.dtsi              |   8 +-
>>>   arch/arm/boot/dts/tegra30-colibri.dtsi             |   8 +-
>>>   arch/arm/boot/dts/tegra30.dtsi                     |   4 +-
>>>   arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   4 +-
>>>   arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |   2 +-
>>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   6 +-
>>>   drivers/clk/tegra/Makefile                         |   1 -
>>>   drivers/clk/tegra/clk-id.h                         |  11 +-
>>>   drivers/clk/tegra/clk-tegra-fixed.c                |  32 +-
>>>   drivers/clk/tegra/clk-tegra-pmc.c                  | 122 -------
>>>   drivers/clk/tegra/clk-tegra114.c                   |  41 +--
>>>   drivers/clk/tegra/clk-tegra124.c                   |  46 +--
>>>   drivers/clk/tegra/clk-tegra20.c                    |   9 +-
>>>   drivers/clk/tegra/clk-tegra210.c                   |  30 +-
>>>   drivers/clk/tegra/clk-tegra30.c                    |  31 +-
>>>   drivers/clk/tegra/clk.h                            |   1 -
>>>   drivers/soc/tegra/pmc.c                            | 352
>>> ++++++++++++++++++++
>>>   include/dt-bindings/clock/tegra114-car.h           |  18 +-
>>>   include/dt-bindings/clock/tegra124-car-common.h    |  18 +-
>>>   include/dt-bindings/clock/tegra20-car.h            |   2 +-
>>>   include/dt-bindings/clock/tegra210-car.h           |  18 +-
>>>   include/dt-bindings/clock/tegra30-car.h            |  18 +-
>>>   include/dt-bindings/soc/tegra-pmc.h                |  16 +
>>>   sound/soc/tegra/tegra_alc5632.c                    |  28 +-
>>>   sound/soc/tegra/tegra_asoc_utils.c                 | 125 ++++----
>>>   sound/soc/tegra/tegra_asoc_utils.h                 |   3 +-
>>>   sound/soc/tegra/tegra_max98090.c                   |  43 ++-
>>>   sound/soc/tegra/tegra_rt5640.c                     |  43 ++-
>>>   sound/soc/tegra/tegra_rt5677.c                     |  28 +-
>>>   sound/soc/tegra/tegra_sgtl5000.c                   |  28 +-
>>>   sound/soc/tegra/tegra_wm8753.c                     |  43 ++-
>>>   sound/soc/tegra/tegra_wm8903.c                     |  43 ++-
>>>   sound/soc/tegra/tegra_wm9712.c                     |   8 +-
>>>   sound/soc/tegra/trimslice.c                        |  39 ++-
>>>   49 files changed, 1192 insertions(+), 777 deletions(-)
>>>   delete mode 100644
>>> Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
>>>   create mode 100644
>>> Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
>>>   delete mode 100644 drivers/clk/tegra/clk-tegra-pmc.c
>>>   create mode 100644 include/dt-bindings/soc/tegra-pmc.h
>>>
>> I briefly looked through the patches and tested them in all possible
>> configurations. For now everything looks and works well.
>>
>> You could add this to all patches:
>>
>> Tested-by: Dmitry Osipenko <digetx@gmail.com>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Thanks Dmitry

Actually, it will be more accurate if you will add my t-b only to the
T20/30 patches. I only looked through the T114+ patches without testing
them, thanks.

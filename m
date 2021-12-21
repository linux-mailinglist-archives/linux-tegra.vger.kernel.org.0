Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F93A47BB91
	for <lists+linux-tegra@lfdr.de>; Tue, 21 Dec 2021 09:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235464AbhLUIPD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 21 Dec 2021 03:15:03 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55704
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235465AbhLUIPC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Dec 2021 03:15:02 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 59B013FFE9
        for <linux-tegra@vger.kernel.org>; Tue, 21 Dec 2021 08:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640074500;
        bh=unzKlROTSDkZ2H17InUSxNeUgzq1dfHAeoMgtouOPKY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=ktQQQGEge6rMiCcRLL8iSEg+VFF1/JIYxERrF5PxCxAdFR/q8YiOAwOG2LQNpZ4UK
         8qFgrF04UkI5bZS31VsVVafht8K0hq9suIVZEFgeH4XswLnSU7YqbcaWh4+Ryb5GfT
         eon8phwMBkQt9VFrP57oX8VkLXWSACmh8ir8zwLb5elAnI7rESiG1Alz1Sub/nLJqw
         5X94v3N59evtmJANv7BMzwtsijBLWGuPcBCaRm8Dlw6fG/lZIqJSiu6GDx8Fv4cdpZ
         pVzY4tpyL4GkIPw4kL2kLqd3+OkqLgSO9PcvpYgSopxwRT4fe+fmLzJnPSSnuXZwxW
         WDJ3pxitlNoUQ==
Received: by mail-lj1-f200.google.com with SMTP id bn28-20020a05651c179c00b002222b4cc6d8so1980241ljb.0
        for <linux-tegra@vger.kernel.org>; Tue, 21 Dec 2021 00:15:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=unzKlROTSDkZ2H17InUSxNeUgzq1dfHAeoMgtouOPKY=;
        b=mERM0laUqbjFTZg2yzkGIjHbAgi/sbag17uu1+eqaSDeiAwfRkPXpb9WTUlrzO7nt1
         BhO8bmZo7V6pkWHHVdXSOUWP00UGRv4vuk+LFTwtmBYegGJj+U5MflfFeTDB3SntfkYN
         WpbjUI0iigVXuZuFxuhOBEQFE92NkZBQIfspXGr4V+ZLvuGatsbWhdqt3uY5wdYG+GJl
         TujP1sb8wu3+pjz+iJ4dcOJ+dDaZIc6b/1IEJF0SCmz6vcMn6QCAHB99cIhixPPp53ke
         dPeLPtMN+z+WD8v1LGo5XxO4WXJ2Y/+5CsEm0IsHVV5KV1TX2osuh8g/jwqyIphPzso6
         ApiA==
X-Gm-Message-State: AOAM531fNe6/JxttQZPPTQiSvIu8fZUV1OXLq+SlozQVkmaQ56qhgtMH
        /g/73f0xPAy7oEx5TSgwLonytGi54dcE+oA5d9UIRVF3pR9qSXYvkkr6Ux9OEtnbknrzTEHbc7B
        nVAHrG+cbVuNHxrsfSoOq3u7ebSCoNTKdA63Rpl2G
X-Received: by 2002:a05:6512:1324:: with SMTP id x36mr2112496lfu.495.1640074498244;
        Tue, 21 Dec 2021 00:14:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwGZohg1XqgJzmBQWomoxCDi6AUox4WkhITAi/1I0iErY7NdBuHTJbhMUBZfe7ca0I37JxzA==
X-Received: by 2002:a05:6512:1324:: with SMTP id x36mr2112479lfu.495.1640074497960;
        Tue, 21 Dec 2021 00:14:57 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id m14sm2705332ljg.2.2021.12.21.00.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 00:14:57 -0800 (PST)
Message-ID: <84487ed8-2f9d-c178-012b-8407e5083b87@canonical.com>
Date:   Tue, 21 Dec 2021 09:14:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v1] memory: tegra30-emc: Print additional memory info
Content-Language: en-US
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20211217234711.8353-1-digetx@gmail.com>
 <fc5601e7-40e7-03c5-a433-859539f82144@canonical.com>
 <03a09ff5-fe2d-3ce2-a93b-4e44fd030ffb@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <03a09ff5-fe2d-3ce2-a93b-4e44fd030ffb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20/12/2021 14:44, Dmitry Osipenko wrote:
> 20.12.2021 14:03, Krzysztof Kozlowski пишет:
>> On 18/12/2021 00:47, Dmitry Osipenko wrote:
>>> Print out memory type and LPDDR2 configuration on Tegra30, making it
>>> similar to the memory info printed by the Tegra20 memory driver. This
>>> info is useful for debugging purposes.
>>>
>>> Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # T30 ASUS TF201 LPDDR2
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/memory/tegra/Kconfig       |   1 +
>>>  drivers/memory/tegra/tegra30-emc.c | 131 ++++++++++++++++++++++++++---
>>>  2 files changed, 122 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
>>> index 7951764b4efe..3fe83d7c2bf8 100644
>>> --- a/drivers/memory/tegra/Kconfig
>>> +++ b/drivers/memory/tegra/Kconfig
>>> @@ -28,6 +28,7 @@ config TEGRA30_EMC
>>>  	default y
>>>  	depends on ARCH_TEGRA_3x_SOC || COMPILE_TEST
>>>  	select PM_OPP
>>> +	select DDR
>>>  	help
>>>  	  This driver is for the External Memory Controller (EMC) found on
>>>  	  Tegra30 chips. The EMC controls the external DRAM on the board.
>>> diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
>>> index 80f98d717e13..4c0432704f46 100644
>>> --- a/drivers/memory/tegra/tegra30-emc.c
>>> +++ b/drivers/memory/tegra/tegra30-emc.c
>>> @@ -9,6 +9,7 @@
>>>   * Copyright (C) 2019 GRATE-DRIVER project
>>>   */
>>>  
>>> +#include <linux/bitfield.h>
>>>  #include <linux/clk.h>
>>>  #include <linux/clk/tegra.h>
>>>  #include <linux/debugfs.h>
>>> @@ -31,11 +32,15 @@
>>>  #include <soc/tegra/common.h>
>>>  #include <soc/tegra/fuse.h>
>>>  
>>> +#include "../jedec_ddr.h"
>>> +#include "../of_memory.h"
>>> +
>>>  #include "mc.h"
>>>  
>>>  #define EMC_INTSTATUS				0x000
>>>  #define EMC_INTMASK				0x004
>>>  #define EMC_DBG					0x008
>>> +#define EMC_ADR_CFG				0x010
>>>  #define EMC_CFG					0x00c
>>>  #define EMC_REFCTRL				0x020
>>>  #define EMC_TIMING_CONTROL			0x028
>>> @@ -81,6 +86,7 @@
>>>  #define EMC_EMRS				0x0d0
>>>  #define EMC_SELF_REF				0x0e0
>>>  #define EMC_MRW					0x0e8
>>> +#define EMC_MRR					0x0ec
>>>  #define EMC_XM2DQSPADCTRL3			0x0f8
>>>  #define EMC_FBIO_SPARE				0x100
>>>  #define EMC_FBIO_CFG5				0x104
>>> @@ -208,6 +214,13 @@
>>>  
>>>  #define EMC_REFRESH_OVERFLOW_INT		BIT(3)
>>>  #define EMC_CLKCHANGE_COMPLETE_INT		BIT(4)
>>> +#define EMC_MRR_DIVLD_INT			BIT(5)
>>> +
>>> +#define EMC_MRR_DEV_SELECTN			GENMASK(31, 30)
>>> +#define EMC_MRR_MRR_MA				GENMASK(23, 16)
>>> +#define EMC_MRR_MRR_DATA			GENMASK(15, 0)
>>> +
>>> +#define EMC_ADR_CFG_EMEM_NUMDEV			BIT(0)
>>>  
>>>  enum emc_dram_type {
>>>  	DRAM_TYPE_DDR3,
>>> @@ -378,6 +391,8 @@ struct tegra_emc {
>>>  
>>>  	/* protect shared rate-change code path */
>>>  	struct mutex rate_lock;
>>> +
>>> +	bool mrr_error;
>>>  };
>>>  
>>>  static int emc_seq_update_timing(struct tegra_emc *emc)
>>> @@ -1008,12 +1023,18 @@ static int emc_load_timings_from_dt(struct tegra_emc *emc,
>>>  	return 0;
>>>  }
>>>  
>>> -static struct device_node *emc_find_node_by_ram_code(struct device *dev)
>>> +static struct device_node *emc_find_node_by_ram_code(struct tegra_emc *emc)
>>>  {
>>> +	struct device *dev = emc->dev;
>>>  	struct device_node *np;
>>>  	u32 value, ram_code;
>>>  	int err;
>>>  
>>> +	if (emc->mrr_error) {
>>> +		dev_warn(dev, "memory timings skipped due to MRR error\n");
>>> +		return NULL;
>>> +	}
>>> +
>>>  	if (of_get_child_count(dev->of_node) == 0) {
>>>  		dev_info_once(dev, "device-tree doesn't have memory timings\n");
>>>  		return NULL;
>>> @@ -1035,11 +1056,73 @@ static struct device_node *emc_find_node_by_ram_code(struct device *dev)
>>>  	return NULL;
>>>  }
>>>  
>>> +static int emc_read_lpddr_mode_register(struct tegra_emc *emc,
>>> +					unsigned int emem_dev,
>>> +					unsigned int register_addr,
>>> +					unsigned int *register_data)
>>> +{
>>> +	u32 memory_dev = emem_dev + 1;
>>> +	u32 val, mr_mask = 0xff;
>>> +	int err;
>>> +
>>> +	/* clear data-valid interrupt status */
>>> +	writel_relaxed(EMC_MRR_DIVLD_INT, emc->regs + EMC_INTSTATUS);
>>> +
>>> +	/* issue mode register read request */
>>> +	val  = FIELD_PREP(EMC_MRR_DEV_SELECTN, memory_dev);
>>> +	val |= FIELD_PREP(EMC_MRR_MRR_MA, register_addr);
>>> +
>>> +	writel_relaxed(val, emc->regs + EMC_MRR);
>>> +
>>> +	/* wait for the LPDDR2 data-valid interrupt */
>>> +	err = readl_relaxed_poll_timeout_atomic(emc->regs + EMC_INTSTATUS, val,
>>> +						val & EMC_MRR_DIVLD_INT,
>>> +						1, 100);
>>> +	if (err) {
>>> +		dev_err(emc->dev, "mode register %u read failed: %d\n",
>>> +			register_addr, err);
>>> +		emc->mrr_error = true;
>>> +		return err;
>>> +	}
>>> +
>>> +	/* read out mode register data */
>>> +	val = readl_relaxed(emc->regs + EMC_MRR);
>>> +	*register_data = FIELD_GET(EMC_MRR_MRR_DATA, val) & mr_mask;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void emc_read_lpddr_sdram_info(struct tegra_emc *emc,
>>> +				      unsigned int emem_dev)
>>> +{
>>> +	union lpddr2_basic_config4 basic_conf4;
>>> +	unsigned int manufacturer_id;
>>> +	unsigned int revision_id1;
>>> +	unsigned int revision_id2;
>>> +
>>> +	/* these registers are standard for all LPDDR JEDEC memory chips */
>>> +	emc_read_lpddr_mode_register(emc, emem_dev, 5, &manufacturer_id);
>>> +	emc_read_lpddr_mode_register(emc, emem_dev, 6, &revision_id1);
>>> +	emc_read_lpddr_mode_register(emc, emem_dev, 7, &revision_id2);
>>> +	emc_read_lpddr_mode_register(emc, emem_dev, 8, &basic_conf4.value);
>>> +
>>> +	dev_info(emc->dev, "SDRAM[dev%u]: manufacturer: 0x%x (%s) rev1: 0x%x rev2: 0x%x prefetch: S%u density: %uMbit iowidth: %ubit\n",
>>> +		 emem_dev, manufacturer_id,
>>> +		 lpddr2_jedec_manufacturer(manufacturer_id),
>>> +		 revision_id1, revision_id2,
>>> +		 4 >> basic_conf4.arch_type,
>>> +		 64 << basic_conf4.density,
>>> +		 32 >> basic_conf4.io_width);
>>> +}
>>> +
>>
>> Quickly looking, these two functions are exactly the same as ones in
>> tegra20-emc.c
>> . Later you might come up with another set for other SoCs, so it looks
>> it is worth to share these.
> 
> Should be too much trouble for not much gain, IMO. How many bytes will
> be shared in the end? There is no much code here, we may lose more than
> win. All these Tegra EMC drivers can be compiled as a loadable modules,
> that's what distro kernels usually do. There are no plans for other SoCs
> for today.

It's not about the bytes but source code lines to maintain and fix (if
there is something to fix). But if you don't plan to make a third copy
of it, it is okay.

> 
> I don't see how that sharing could be done easily and nicely. Please
> tell if you see.

Since it is not about duplicated object code, but code for review, it is
pretty straightforward:

1. Create tegra-emc-common.[ch]
2. In Makefile:

+tegra20_emc-y += tegra20-emc.o tegra-emc-common.o

+obj-$(CONFIG_TEGRA20_EMC)  += tegra20_emc.o

+

+tegra30_emc-y += tegra30-emc.o tegra-emc-common.o

+obj-$(CONFIG_TEGRA30_EMC)  += tegra30_emc.o



Best regards,
Krzysztof

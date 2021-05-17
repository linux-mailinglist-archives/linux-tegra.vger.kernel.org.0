Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2C01383966
	for <lists+linux-tegra@lfdr.de>; Mon, 17 May 2021 18:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347367AbhEQQPr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 17 May 2021 12:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344536AbhEQQMH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 May 2021 12:12:07 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4153C0494E3;
        Mon, 17 May 2021 07:47:11 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id v8so4217685lft.8;
        Mon, 17 May 2021 07:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SEA3EwJIt3rzzFHp4o5m/p8jxV9Zmq+VibaWYsv49TE=;
        b=Hsiv82W97hbMKpEhsQMsW6lcJ2MT0an4aXXxdGMQhZpMeKZgrmcy2WHXuvlQ6QX2ZO
         WrqmTOsWpd8IFdIR+sjdPPEf2x8qpZMp8pgis1M+h/5XOc/76wUlP4hvohw4+Ix/1/FQ
         PAn6WK6Tk9+qdaHhIMTCuF3JRqLyK5xQwRa+lyAEBGz+Rmn2C0EYKcZK62cOjkBgT+Ur
         m8HteSjr3ls4oxbKucPxwpzGRPTLf0ek/Mk98r/gRMQLjTKk8VBx3E5DhyBKZB4nHzGs
         dqg44BFYcpwMFMC1B+zP40xRXeXmNbyCGXHyJe9RSjPlTML+gBGMcGRMlXLuMaNWBHb6
         5KqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SEA3EwJIt3rzzFHp4o5m/p8jxV9Zmq+VibaWYsv49TE=;
        b=oPXazGV7CgdQXV9RakprUVarPgfNMwPhn+0HnzBbN/eIKLWQlq/BXZ+b3L2Ma1PuIZ
         +hmjIDmFqdFqX/pgi1LUhv5ynSkI7Mj7W9SA8vNPjB5lSW3+kjRzK19gTgEazuS+xNln
         uxxZC78yGHqA0mTOw/dlZnUYCOZAlKGBgjZimlZ0WECJNnmmQ3maqHjbRlwEFaVHAdm8
         5IjOSoDQqNf+6SV+39io2/11E0ujGDMD3Nd5Euna41jnR8+UEyblhYbVsZFk8c/cEHaA
         mUmVzK75FmdMvfQjLO+OgCWBmpvMf9444HNy6rHp9BQzu1BopmX2R51KbLF6zn5n5XUv
         r51w==
X-Gm-Message-State: AOAM530/we7IpSdS3UniwxNliwNVeUaL95yY13RMhprDq5ELP56RVgqq
        0Zsu2CI7MACqCi1f4en7DWMUiAbvquY=
X-Google-Smtp-Source: ABdhPJwIhZEsa68lzrxmBmtVnI6PtEzqWJDaxxtZQ37Pt6wE2KuNB43Zd8pMIJlReGk6G8bXJfU6yw==
X-Received: by 2002:a05:6512:1109:: with SMTP id l9mr183151lfg.550.1621262830161;
        Mon, 17 May 2021 07:47:10 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.googlemail.com with ESMTPSA id q2sm61976lfd.84.2021.05.17.07.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 07:47:09 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] soc/tegra: Add
 devm_tegra_core_dev_init_opp_table()
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Paul Fertser <fercerpav@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210516205138.22501-1-digetx@gmail.com>
 <20210516205138.22501-2-digetx@gmail.com>
 <3ea6b48f-af3f-51db-8d7b-1292a68ae74e@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a3b42449-4cd8-f692-c41a-205cbaa987eb@gmail.com>
Date:   Mon, 17 May 2021 17:47:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3ea6b48f-af3f-51db-8d7b-1292a68ae74e@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.05.2021 14:43, Krzysztof Kozlowski пишет:
...
>> +static int tegra_core_dev_init_opp_state(struct device *dev)
>> +{
>> +	struct dev_pm_opp *opp;
>> +	unsigned long rate;
>> +	struct clk *clk;
>> +	int err;
>> +
>> +	clk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(clk)) {
>> +		dev_err(dev, "failed to get clk: %pe\n", clk);
>> +		return PTR_ERR(clk);
>> +	}
>> +
>> +	rate = clk_get_rate(clk);
>> +	if (!rate) {
>> +		dev_err(dev, "failed to get clk rate\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	opp = dev_pm_opp_find_freq_ceil(dev, &rate);
>> +
>> +	if (opp == ERR_PTR(-ERANGE))
>> +		opp = dev_pm_opp_find_freq_floor(dev, &rate);
>> +
>> +	err = PTR_ERR_OR_ZERO(opp);
>> +	if (err) {
>> +		dev_err(dev, "failed to get OPP for %ld Hz: %d\n",
>> +			rate, err);
>> +		return err;
>> +	}
>> +
>> +	dev_pm_opp_put(opp);
>> +
>> +	/* first dummy rate-setting initializes voltage vote */
>> +	err = dev_pm_opp_set_rate(dev, rate);
>> +	if (err) {
>> +		dev_err(dev, "failed to initialize OPP clock: %d\n", err);
>> +		return err;
>> +	}
> 
> 
> The devm_pm_opp_set_clkname will call clk_get(), so here you should drop
> the clk reference at the end. Why having it twice?

The devm_pm_opp_set_clkname assigns clock to the OPP table.

The devm_clk_get() is needed for the clk_get_rate(). OPP core doesn't
initialize voltage vote and we need this initialization for the Tegra
memory drivers.

The reference count of the clk will be dropped automatically once device
driver is released. The resource-managed helper avoids the need to care
about the error unwinding in the code, making it clean and easy to follow.

...
>> +EXPORT_SYMBOL_GPL(devm_tegra_core_dev_init_opp_table);
>> diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
>> index 98027a76ce3d..e8eab13aa199 100644
>> --- a/include/soc/tegra/common.h
>> +++ b/include/soc/tegra/common.h
>> @@ -6,6 +6,36 @@
>>  #ifndef __SOC_TEGRA_COMMON_H__
>>  #define __SOC_TEGRA_COMMON_H__
>>  
>> +#include <linux/errno.h>
>> +#include <linux/types.h>
>> +
>> +struct device;
>> +
>> +/**
>> + * Tegra SoC core device OPP table configuration
>> + *
>> + * @init_state: pre-initialize OPP state of a device
>> + */
>> +struct tegra_core_opp_params {
>> +	bool init_state;
>> +};
>> +
>> +#ifdef CONFIG_ARCH_TEGRA
>>  bool soc_is_tegra(void);
>> +int devm_tegra_core_dev_init_opp_table(struct device *dev,
>> +				       struct tegra_core_opp_params *params);
>> +#else
>> +static inline bool soc_is_tegra(void)
> 
> This looks unrelated. Please make it a separate patch.

The missing stub for soc_is_tegra() popped up multiple times before.
Hence it didn't look like a bad idea to me to add stub for it since this
patch touches code around it.

I'll factor it out into a separate patch in v2.

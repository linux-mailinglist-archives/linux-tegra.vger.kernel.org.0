Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6602AE873
	for <lists+linux-tegra@lfdr.de>; Wed, 11 Nov 2020 06:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbgKKFxT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 11 Nov 2020 00:53:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgKKFxS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Nov 2020 00:53:18 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F81C0613D6
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2020 21:53:17 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id w11so409134pll.8
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2020 21:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w2JojwkEcpz1e9R3DiGEQQXf6doZlQNTIMB3Trmj4A8=;
        b=MbniOIo3XqyjpEy5SStX98myWeonEnjeW8Y5gptfGuXRnMmbQRJuGxmJ91VvuhRCIn
         P/EQCsiW2/qM+NVURXwQJ027gp1LJpMBYB2UQSQWV8W3q+aBW/o84dCtJqo/SE5yX/x6
         ztHDPpeegy6BwBlguNf25C7UOQNoC5YDyGczaFWw5rvxjgVsO9TfJUcm8YFf6AeRFqpi
         8WDCTKIXWyMYKZUcmbBqzJeG1hpYuY9Y/7nyA87Jk0IcWwbh6wPZ2j3DIH40MfzferBP
         QfHqJlKgbwcmi26fY1M4kIYMSD3Ih3sO+UYwHAHhmZDfrgbM6rVFS5bEf8c/Y4ELiiik
         /7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w2JojwkEcpz1e9R3DiGEQQXf6doZlQNTIMB3Trmj4A8=;
        b=MRqomgmQlaHrwvovs9yAKP+aZNQlt7fupiYmuFGmnsHMak3Kb2PYNPubyyKyLbWf50
         T0szSGsaihgRsr4hzXkDqo/L1DBRAUTSaX/fH/R6ZuCXRWWx9lEQmAXOtDURJGHKRcOh
         nZwviuOYY34sKXTmjPs7VTwpkS+NcGOvmMPQV/a+QShSOBKV+wfxqXg19oSVUGelGAkS
         Zj0ZUmBNwu8frnY5Uj5yXQ5jocPzMhlFdrd8mu/djCkYpKeVM67sYEPPhVaT4tzhZj5O
         3q+4ZW8ORLnHaj+6GCKvXnVJfnQXgXv8Dtrp8gw5kGddjpaSNiGNiDXkAq2ZSYYC2Y0I
         mpyw==
X-Gm-Message-State: AOAM533QKOaHjJUsnVxvNRC40Ss5sqeNcJ1zhSG7x6GF4reWSYCNYY7m
        4jlDmnFcCNO1lP5ZqmHce7fRXA==
X-Google-Smtp-Source: ABdhPJz54Nl3VsqoaqAlEDpB7LxwMBDa3cF9p5RJdQReuwk7xa1C+v33EeGmHlrLtc1Fh6hLMf9Sfg==
X-Received: by 2002:a17:90a:d486:: with SMTP id s6mr2182310pju.115.1605073997016;
        Tue, 10 Nov 2020 21:53:17 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id z17sm1018135pfq.121.2020.11.10.21.53.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2020 21:53:15 -0800 (PST)
Date:   Wed, 11 Nov 2020 11:23:13 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Viresh Kumar <vireshk@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 09/26] memory: tegra30: Support interconnect framework
Message-ID: <20201111055313.tefidnmc7f4yb3jk@vireshk-i7>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-10-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111011456.7875-10-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11-11-20, 04:14, Dmitry Osipenko wrote:
> +static int tegra_emc_opp_table_init(struct tegra_emc *emc)
> +{
> +	struct opp_table *reg_opp_table = NULL, *clk_opp_table, *hw_opp_table;
> +	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
> +	const char *rname = "core";
> +	int err;
> +
> +	/*
> +	 * Legacy device-trees don't have OPP table and EMC driver isn't
> +	 * useful in this case.
> +	 */
> +	if (!device_property_present(emc->dev, "operating-points-v2")) {

I don't understand why you want to check this ? The below call to
dev_pm_opp_of_add_table() will fail anyway and that should be good for
you.

> +		dev_err(emc->dev,
> +			"OPP table not found, please update your device tree\n");
> +		return -ENODEV;
> +	}
> +
> +	/* voltage scaling is optional */
> +	if (device_property_present(emc->dev, "core-supply")) {
> +		reg_opp_table = dev_pm_opp_set_regulators(emc->dev, &rname, 1);
> +		if (IS_ERR(reg_opp_table))
> +			return dev_err_probe(emc->dev, PTR_ERR(reg_opp_table),
> +					     "failed to set OPP regulator\n");
> +	}
> +
> +	clk_opp_table = dev_pm_opp_set_clkname(emc->dev, NULL);

I think there is still some misunderstanding here. This call with a
NULL connection id is useful only if the DT OPP table is optional for
your platform and you want the same driver to work with and without
the DT OPP table. Clearly in your case you want the OPP table in the
DT to be there and so this call is not required at all.

> +	err = PTR_ERR_OR_ZERO(clk_opp_table);
> +	if (err) {
> +		dev_err(emc->dev, "failed to set OPP clk: %d\n", err);
> +		goto put_reg_table;
> +	}
> +
> +	hw_opp_table = dev_pm_opp_set_supported_hw(emc->dev, &hw_version, 1);
> +	err = PTR_ERR_OR_ZERO(hw_opp_table);
> +	if (err) {
> +		dev_err(emc->dev, "failed to set OPP supported HW: %d\n", err);
> +		goto put_clk_table;
> +	}
> +
> +	err = dev_pm_opp_of_add_table(emc->dev);
> +	if (err) {
> +		dev_err(emc->dev, "failed to add OPP table: %d\n", err);
> +		goto put_hw_table;
> +	}
> +
> +	dev_info(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
> +		 hw_version, clk_get_rate(emc->clk) / 1000000);
> +
> +	/* first dummy rate-set initializes voltage state */
> +	err = dev_pm_opp_set_rate(emc->dev, clk_get_rate(emc->clk));
> +	if (err) {
> +		dev_err(emc->dev, "failed to initialize OPP clock: %d\n", err);
> +		goto remove_table;
> +	}
> +
> +	return 0;
> +
> +remove_table:
> +	dev_pm_opp_of_remove_table(emc->dev);
> +put_hw_table:
> +	dev_pm_opp_put_supported_hw(hw_opp_table);
> +put_clk_table:
> +	dev_pm_opp_put_clkname(clk_opp_table);
> +put_reg_table:
> +	if (reg_opp_table)
> +		dev_pm_opp_put_regulators(reg_opp_table);
> +
> +	return err;
> +}

-- 
viresh

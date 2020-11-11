Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F23E72AE85A
	for <lists+linux-tegra@lfdr.de>; Wed, 11 Nov 2020 06:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbgKKFpy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 11 Nov 2020 00:45:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgKKFpq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Nov 2020 00:45:46 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2831C0613D1
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2020 21:45:46 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id w20so149219pjh.1
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2020 21:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tW5eWnXuvaPQysY5F4/p1CXf/0e354oeDmt853ri8UM=;
        b=zmIQDeCZG18/faKuhY2+fauFnbQcPnSt0T+wqaMFQqvNh/3/uCWxU4BuI2cXcAvWSd
         RT23iTKj17Iz2042g8c9dBnJT1zAI8zCbL0Aw9BlF80AxWBzM+nEeDdmnVyWg17erRVJ
         +aqyrrYdjAyehM9Dr+Q6clgUThw5muES7qGOWXgh4r6jarPOiTwG+nr46pUhYnj+rLdb
         5Gwyms0eYwNcCAo81zqW/dEzFDAW4YGYahifmWHtrbDQNdwL4PA3oKhGBYNLcwGL8LqS
         HMIO7p3QrZqg+0QaeqeFdCYOa2gjKeVTfn/hxEypz3z5CQLPQt4JZqNAddHEg1p1b4qj
         tj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tW5eWnXuvaPQysY5F4/p1CXf/0e354oeDmt853ri8UM=;
        b=Dcb3fDfVJsUs8R94QW6E80UwNtHRWn5PLm8qk16Mm9Rr2TKkG43rLR5TsBdx9V46y3
         oRrJFl3kaIrmNJtInNabsRgRVUQkF0YPpyFT9MzNpaypZDEkVvWkL5mHZl502SBqLbPX
         PNKs/W3ECX8ciZoKrkFsw8H6I6hrdcyDlrZdMM3H37zMV5Bixyn+0F8V+7tDkIUIAman
         vXEsj5wiT9i/t0k8pNP2x0wMAmAZdOGcKiEnkZ1lkNo5yRZoTqg4THnRgNJQFFu1QT7N
         jdl8XEtEdDAvAxRhgHrNMZmsGmbNOHKvMbaG0PG3suPypZjlKoIFiWu1mRroNo8ymZ12
         kDLw==
X-Gm-Message-State: AOAM530XI7tZ0V3RgYtuZgP7cQwZw8AMtjMSgsUq6aS5VVRzg51VaXK2
        ARi4VBjT+L+6TT+zCweKvWbsFw==
X-Google-Smtp-Source: ABdhPJxF017zDNxi4Sg5i6CUySBJ3dWebfaqChhQgw7Vs4mjLWzxeY8V8yJwaLr/0MiubQoEaQHmxw==
X-Received: by 2002:a17:902:9f85:b029:d6:e802:75b0 with SMTP id g5-20020a1709029f85b02900d6e80275b0mr20483312plq.29.1605073544732;
        Tue, 10 Nov 2020 21:45:44 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id q22sm869299pgi.33.2020.11.10.21.45.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2020 21:45:43 -0800 (PST)
Date:   Wed, 11 Nov 2020 11:15:41 +0530
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
Subject: Re: [PATCH v8 02/26] memory: tegra20-emc: Use
 dev_pm_opp_set_clkname()
Message-ID: <20201111054541.hstqrlvtpwxxbv4m@vireshk-i7>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111011456.7875-3-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11-11-20, 04:14, Dmitry Osipenko wrote:
> The dev_pm_opp_get_opp_table() shouldn't be used by drivers, use
> dev_pm_opp_set_clkname() instead.
> 
> Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
> index 5e10aa97809f..bb3f315c9587 100644
> --- a/drivers/memory/tegra/tegra20-emc.c
> +++ b/drivers/memory/tegra/tegra20-emc.c
> @@ -902,7 +902,7 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
>  
>  static int tegra_emc_opp_table_init(struct tegra_emc *emc)
>  {
> -	struct opp_table *opp_table;
> +	struct opp_table *reg_opp_table = NULL, *clk_opp_table;
>  	const char *rname = "core";
>  	int err;
>  
> @@ -917,19 +917,24 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
>  	}
>  
>  	/* voltage scaling is optional */
> -	if (device_property_present(emc->dev, "core-supply"))
> -		opp_table = dev_pm_opp_set_regulators(emc->dev, &rname, 1);
> -	else
> -		opp_table = dev_pm_opp_get_opp_table(emc->dev);
> +	if (device_property_present(emc->dev, "core-supply")) {
> +		reg_opp_table = dev_pm_opp_set_regulators(emc->dev, &rname, 1);
> +		if (IS_ERR(reg_opp_table))
> +			return dev_err_probe(emc->dev, PTR_ERR(reg_opp_table),
> +					     "failed to set OPP regulator\n");
> +	}
>  
> -	if (IS_ERR(opp_table))
> -		return dev_err_probe(emc->dev, PTR_ERR(opp_table),
> -				     "failed to prepare OPP table\n");
> +	clk_opp_table = dev_pm_opp_set_clkname(emc->dev, NULL);
> +	err = PTR_ERR_OR_ZERO(clk_opp_table);

Don't check for NULL here.

> +	if (err) {
> +		dev_err(emc->dev, "failed to set OPP clk: %d\n", err);
> +		goto put_reg_table;
> +	}
>  
>  	err = dev_pm_opp_of_add_table(emc->dev);
>  	if (err) {
>  		dev_err(emc->dev, "failed to add OPP table: %d\n", err);
> -		goto put_table;
> +		goto put_clk_table;
>  	}
>  
>  	dev_info(emc->dev, "current clock rate %lu MHz\n",
> @@ -946,8 +951,11 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
>  
>  remove_table:
>  	dev_pm_opp_of_remove_table(emc->dev);
> -put_table:
> -	dev_pm_opp_put_regulators(opp_table);
> +put_clk_table:
> +	dev_pm_opp_put_clkname(clk_opp_table);
> +put_reg_table:
> +	if (reg_opp_table)

This won't be required after my other patchset and yeah it is a
classic chicken and egg problem we have here :)

Maybe you can fix them separately in 5.11 after everything is applied.

> +		dev_pm_opp_put_regulators(reg_opp_table);
>  
>  	return err;
>  }
> -- 
> 2.29.2

-- 
viresh

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628852F9D71
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Jan 2021 12:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387746AbhARLCy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Jan 2021 06:02:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389809AbhARLBf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Jan 2021 06:01:35 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 055C4C0613CF
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 03:00:37 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id j12so2832559pfj.12
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 03:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ChNH22Z5HZChYsCjae7b831d+/CbiVMv84UtIu3UXM8=;
        b=Zt/yZIHI7ZV/rVfdcD40vMcON9v/sBdnxFSW+O8wypIz9jSxbwnfCqlzpLNZBaVhiw
         VdCDk/LrYk3/RLmBCr9RmjWqtBelBQK9sjDUuNuHaKu3tla2rgq1FJ0tDLvgfWQ36VuG
         9TpQGtAGmxGCrmLVnoU/7B68n9qFORiRdv8IYhXGfmuNyOLrZDcR2dMQlnFVc3MQfGuk
         RFp6bcibjelann6sjtC50PgYdHtpnbSJRl5o1f07gq8vO0+taLHNtQ+2Dg1x79npwfAd
         ykOtUtFoytClt6SYOL/7CC5lEB52CgDEP+X6kXv0QgYcs1H2+zI5AJQ6DUsa0VJxfMZP
         DHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ChNH22Z5HZChYsCjae7b831d+/CbiVMv84UtIu3UXM8=;
        b=ayJnG88e1p3fx3bjbaw1LzhhJ7dofZvfvKx8LP4C+PzpeNSkD2dOHjM8HXRBvMA1iA
         TgfsV0n3eYjCvkt+Yjb406RhZfAIfGX+D48jGNZWH9bL6Ob2mTcTlu8Zs1VKIEGWKKuB
         /RQdgoGZ04mi8Z3N+5aQbm+4lO/tEceysztxMR7yHS4JQfdQ5Vkp+r6ivnqjsmunKu0Y
         +cMRV3gYPH/rwHKNvwWBGwFU/8SubRMP48HUizrO8dQTiZvN12pGXT+3m4Sc55T8xdox
         tS8i5dAdYTfj0ATBS3P+ar9XYOdm6K8s9hRaOVfdUCtLjVHp1OFTEEoFOzjx8QEoKQh6
         afRg==
X-Gm-Message-State: AOAM5319H157xhj6KUrAETGKm8MF0qdq5n6lyWb72anY2lGr7oGSxmZU
        d6o91glU8jr1RfmgPW9XiQjkIw==
X-Google-Smtp-Source: ABdhPJzZKvrbczLbEmwrbgRXmppTIpOEG8lBCnJf9nFANrDqVY88oS4W9KHCOCu3rJJRyPvhmank0A==
X-Received: by 2002:a63:1220:: with SMTP id h32mr25626825pgl.309.1610967633652;
        Mon, 18 Jan 2021 03:00:33 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id i22sm12073565pjv.35.2021.01.18.03.00.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Jan 2021 03:00:32 -0800 (PST)
Date:   Mon, 18 Jan 2021 16:30:29 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 04/12] opp: Add dev_pm_opp_sync_regulators()
Message-ID: <20210118110029.sjczugppsvrxd2tl@vireshk-i7>
References: <20210118005524.27787-1-digetx@gmail.com>
 <20210118005524.27787-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118005524.27787-5-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18-01-21, 03:55, Dmitry Osipenko wrote:
> Extend OPP API with dev_pm_opp_sync_regulators() function, which syncs
> voltage state of regulators.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c     | 45 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_opp.h |  6 ++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 7b4d07279638..99d18befc209 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -2686,3 +2686,48 @@ void dev_pm_opp_remove_table(struct device *dev)
>  	dev_pm_opp_put_opp_table(opp_table);
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_opp_remove_table);
> +
> +/**
> + * dev_pm_opp_sync_regulators() - Sync state of voltage regulators
> + * @dev:	device for which we do this operation
> + *
> + * Sync voltage state of the OPP table regulators.
> + *
> + * Return: 0 on success or a negative error value.
> + */
> +int dev_pm_opp_sync_regulators(struct device *dev)
> +{
> +	struct opp_table *opp_table;
> +	struct regulator *reg;
> +	int i, ret = 0;
> +
> +	/* Device may not have OPP table */
> +	opp_table = _find_opp_table(dev);
> +	if (IS_ERR(opp_table))
> +		return 0;
> +
> +	/* Regulator may not be required for the device */
> +	if (!opp_table->regulators)
> +		goto put_table;
> +
> +	mutex_lock(&opp_table->lock);
> +
> +	/* Nothing to sync if voltage wasn't changed */
> +	if (!opp_table->enabled)
> +		goto unlock;
> +
> +	for (i = 0; i < opp_table->regulator_count; i++) {
> +		reg = opp_table->regulators[i];
> +		ret = regulator_sync_voltage(reg);
> +		if (ret)
> +			break;
> +	}
> +unlock:
> +	mutex_unlock(&opp_table->lock);
> +put_table:
> +	/* Drop reference taken by _find_opp_table() */
> +	dev_pm_opp_put_opp_table(opp_table);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(dev_pm_opp_sync_regulators);
> diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
> index c24bd34339d7..1c3a09cc8dcd 100644
> --- a/include/linux/pm_opp.h
> +++ b/include/linux/pm_opp.h
> @@ -162,6 +162,7 @@ int dev_pm_opp_set_sharing_cpus(struct device *cpu_dev, const struct cpumask *cp
>  int dev_pm_opp_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask);
>  void dev_pm_opp_remove_table(struct device *dev);
>  void dev_pm_opp_cpumask_remove_table(const struct cpumask *cpumask);
> +int dev_pm_opp_sync_regulators(struct device *dev);
>  #else
>  static inline struct opp_table *dev_pm_opp_get_opp_table(struct device *dev)
>  {
> @@ -398,6 +399,11 @@ static inline void dev_pm_opp_cpumask_remove_table(const struct cpumask *cpumask
>  {
>  }
>  
> +static inline int dev_pm_opp_sync_regulators(struct device *dev)
> +{
> +	return -ENOTSUPP;
> +}
> +
>  #endif		/* CONFIG_PM_OPP */
>  
>  #if defined(CONFIG_PM_OPP) && defined(CONFIG_OF)

Applied. Thanks.

I had to apply it manually, please make sure it looks okay.

-- 
viresh

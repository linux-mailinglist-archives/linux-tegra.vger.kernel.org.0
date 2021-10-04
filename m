Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00F8420651
	for <lists+linux-tegra@lfdr.de>; Mon,  4 Oct 2021 09:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbhJDHDk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 4 Oct 2021 03:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232131AbhJDHDg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 03:03:36 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E0E0C061745
        for <linux-tegra@vger.kernel.org>; Mon,  4 Oct 2021 00:01:48 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id e7so15653384pgk.2
        for <linux-tegra@vger.kernel.org>; Mon, 04 Oct 2021 00:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Zosd0K9+Pr0UnKUkcxuf4vbfDDIKWorpLv6c8v1wXp8=;
        b=EgouGwLh3fT8/lKAaNHvybA9iCHEzUwWbJOJ/KZOWVa0/ByZwTAZsVJtB3PAWdL370
         3afvfpf2fh3gz+TW4TShMAhPhDs/s6pwPFRaAf906vCBlrtmVcDF2AGd+u50ZPo9TQQj
         38x9HiM3dh/6t19B9tELTVF8K+bEpJZk8bGhHqDMtan5oJaltnyUs/z6pt36HcEcI+LN
         a0b7y4l65d3/jLl53An9KKMc9/U2w7XDRYLv0NoQXSL0DFhxkQBVJJ05AUflDLCQItPg
         GTtwIUhVCyxvr86BxjqKTod7QfnRXtMe86A94NTI+R+kGS34QhtpHY90FoxcSQ8JtlbO
         HnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Zosd0K9+Pr0UnKUkcxuf4vbfDDIKWorpLv6c8v1wXp8=;
        b=E66/5uKgc7zIlEufLNDISpjSkPL9b5w5Gkw0W/NVJdosRrGrndhsQaMtNO7E7SGzGj
         k0u6VyFTtfHSNM5sRJZ0T14HvJj1ESMagrwtRF/In0rOXiBWnRBGMC9Vj5NQDc7B1vOc
         Sp+4E/f5KKMzRWakKqf+7P+km3HkzrlBsqfU2AH2Z5o64dNf6wBHb7sMDrPJ9oc5fjTN
         1FPN/K7wle7k71XODe+3QpFBIRUlcrHqSLa8BRbluG9MQr3ZbFGdVgScyZnomWCI1x5L
         nEnIMyEyiqgsWypvCfgFQr9I71NK0rg90RlxgzJH+dmC0tth+KrHdd+NAMqDVYtI514W
         vOmw==
X-Gm-Message-State: AOAM5337E5fvRmiMkU7ewxdGNUdAxxUIuCi5uHSTu9DzYXxlyF0OmPwE
        M2ggDN4i7NYA2M4c1DxsYagpnw==
X-Google-Smtp-Source: ABdhPJy5BzjgSp5dOVO2Q/8r2By2JGyoZJca5CF8hCTYjl4Tc3ffPkLFEpGg6Jgs0xx9pahYhJu9zg==
X-Received: by 2002:a63:4743:: with SMTP id w3mr3446051pgk.245.1633330908122;
        Mon, 04 Oct 2021 00:01:48 -0700 (PDT)
Received: from localhost ([122.171.247.18])
        by smtp.gmail.com with ESMTPSA id i5sm1417791pfk.170.2021.10.04.00.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 00:01:47 -0700 (PDT)
Date:   Mon, 4 Oct 2021 12:31:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     rafael@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
        krzysztof.kozlowski@canonical.com, lorenzo.pieralisi@arm.com,
        robh@kernel.org, kw@linux.com, p.zabel@pengutronix.de,
        rui.zhang@intel.com, daniel.lezcano@linaro.org, amitk@kernel.org,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 4/5] cpufreq: tegra186/tegra194: Handle errors in BPMP
 response
Message-ID: <20211004070145.pp3rafkinffk2pyh@vireshk-i7>
References: <20210915085517.1669675-1-mperttunen@nvidia.com>
 <20210915085517.1669675-4-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915085517.1669675-4-mperttunen@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 15-09-21, 11:55, Mikko Perttunen wrote:
> The return value from tegra_bpmp_transfer indicates the success or
> failure of the IPC transaction with BPMP. If the transaction
> succeeded, we also need to check the actual command's result code.
> Add code to do this.
> 
> While at it, explicitly handle missing CPU clusters, which can
> occur on floorswept chips. This worked before as well, but
> possibly only by accident.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/cpufreq/tegra186-cpufreq.c | 4 ++++
>  drivers/cpufreq/tegra194-cpufreq.c | 8 +++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
> index 5d1943e787b0..6c88827f4e62 100644
> --- a/drivers/cpufreq/tegra186-cpufreq.c
> +++ b/drivers/cpufreq/tegra186-cpufreq.c
> @@ -159,6 +159,10 @@ static struct cpufreq_frequency_table *init_vhint_table(
>  		table = ERR_PTR(err);
>  		goto free;
>  	}
> +	if (msg.rx.ret) {
> +		table = ERR_PTR(-EINVAL);
> +		goto free;
> +	}
>  
>  	for (i = data->vfloor; i <= data->vceil; i++) {
>  		u16 ndiv = data->ndiv[i];
> diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
> index a9620e4489ae..ac381db25dbe 100644
> --- a/drivers/cpufreq/tegra194-cpufreq.c
> +++ b/drivers/cpufreq/tegra194-cpufreq.c
> @@ -242,7 +242,7 @@ static int tegra194_cpufreq_init(struct cpufreq_policy *policy)
>  
>  	smp_call_function_single(policy->cpu, get_cpu_cluster, &cl, true);
>  
> -	if (cl >= data->num_clusters)
> +	if (cl >= data->num_clusters || !data->tables[cl])
>  		return -EINVAL;
>  
>  	/* set same policy for all cpus in a cluster */
> @@ -310,6 +310,12 @@ init_freq_table(struct platform_device *pdev, struct tegra_bpmp *bpmp,
>  	err = tegra_bpmp_transfer(bpmp, &msg);
>  	if (err)
>  		return ERR_PTR(err);
> +	if (msg.rx.ret == -BPMP_EINVAL) {
> +		/* Cluster not available */
> +		return NULL;
> +	}
> +	if (msg.rx.ret)
> +		return ERR_PTR(-EINVAL);
>  
>  	/*
>  	 * Make sure frequency table step is a multiple of mdiv to match

Applied. Thanks.

-- 
viresh

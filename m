Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F8C21CDB0
	for <lists+linux-tegra@lfdr.de>; Mon, 13 Jul 2020 05:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728628AbgGMDZ6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 12 Jul 2020 23:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726684AbgGMDZ6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Jul 2020 23:25:58 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3256AC08C5DB
        for <linux-tegra@vger.kernel.org>; Sun, 12 Jul 2020 20:25:58 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id o22so5544907pjw.2
        for <linux-tegra@vger.kernel.org>; Sun, 12 Jul 2020 20:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ku+KGKSdyTcTfELJ7NXu99BEXkWOgdvhpbREnxQezjk=;
        b=PwbtGioZTVXRYoSt77N+XzTdEwuoZiBLj+bfaLApUKvczh5g9hHa87VxxrHt0Mminf
         O7AlUgNMG2e8+tHuFNOks51A+gSyaadtiJf8OcQWCwxImwSMWxoRSWilzClMVeyojw1k
         QCJXMI+2IUIOVwGIq6xxm0t0TlSpGx7OxJiGbparipah532xIvILDYF+6MsIETdP7Vrb
         //Zn594OrcpROP22NLZBAi2arfJ5s57HhdEZTjhmAv+zAgB7rrpfD4/AdtgT76gUHMJU
         HpgPZR7/rRS5Sb7IIFkGRAz6lXAFLmNDlsEBL/0Cb4yRiTbokyehZYqnI59dkZFOU+Rm
         CQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ku+KGKSdyTcTfELJ7NXu99BEXkWOgdvhpbREnxQezjk=;
        b=azb1E+ZWrEfv+T7I8gidgh1AHwpudxvpqSbtfx9+1nxVrjgaQsYhOfv9dX3C+cgFQU
         TZ6vuVayJaZ9MUjQFxEEsVH/9gMVJxTj3eEDiZU2nynY8bOr61jK+TjryKDvIj6nxksH
         obsRhgMfD8XevfsW3gjPfJ5GyITrWtb9pQVWcfirkTAGfHvyAy5BYB2iTFi/TF4fXzZc
         p+bfC94M2jAv2lVlqCQJU0x/t3YtKpgFDKh2RNRYc9nb6HqxO0m4sC7ByXI9Tz2kfGNy
         2ep4p5WDthoCEKpL7uxQDPfk9wziy8B4scPnjcZBkPXHHfimxyv97n4s+b7IYZw9GR10
         VMBg==
X-Gm-Message-State: AOAM532S41zfpmFk/xSUE742sFCVyPx+TYKM8RHIvtIT+Fc79+3AVRLs
        ZzvDvVC8DoLLt4H2H64HwQiJSA==
X-Google-Smtp-Source: ABdhPJwPcX49Y2B2rKnxJlUWTPPH4EguURLC5kuMDOJMFwA/y1Fu/K22zimSQ+O4r9Y7ZHufPr8ihA==
X-Received: by 2002:a17:90a:eaca:: with SMTP id ev10mr17196919pjb.151.1594610757535;
        Sun, 12 Jul 2020 20:25:57 -0700 (PDT)
Received: from localhost ([122.172.34.142])
        by smtp.gmail.com with ESMTPSA id nh14sm12239188pjb.4.2020.07.12.20.25.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Jul 2020 20:25:56 -0700 (PDT)
Date:   Mon, 13 Jul 2020 08:55:54 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] cpufreq: tegra186: Fix initial frequency
Message-ID: <20200713032554.cykywnygxln6ukrl@vireshk-i7>
References: <20200712100645.13927-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200712100645.13927-1-jonathanh@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 12-07-20, 11:06, Jon Hunter wrote:
> Commit 6cc3d0e9a097 ("cpufreq: tegra186: add
> CPUFREQ_NEED_INITIAL_FREQ_CHECK flag") fixed CPUFREQ support for
> Tegra186 but as a consequence the following warnings are now seen on
> boot ...
> 
>  cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 0 KHz
>  cpufreq: cpufreq_online: CPU0: Unlisted initial frequency changed to: 2035200 KHz
>  cpufreq: cpufreq_online: CPU1: Running at unlisted freq: 0 KHz
>  cpufreq: cpufreq_online: CPU1: Unlisted initial frequency changed to: 2035200 KHz
>  cpufreq: cpufreq_online: CPU2: Running at unlisted freq: 0 KHz
>  cpufreq: cpufreq_online: CPU2: Unlisted initial frequency changed to: 2035200 KHz
>  cpufreq: cpufreq_online: CPU3: Running at unlisted freq: 0 KHz
>  cpufreq: cpufreq_online: CPU3: Unlisted initial frequency changed to: 2035200 KHz
>  cpufreq: cpufreq_online: CPU4: Running at unlisted freq: 0 KHz
>  cpufreq: cpufreq_online: CPU4: Unlisted initial frequency changed to: 2035200 KHz
>  cpufreq: cpufreq_online: CPU5: Running at unlisted freq: 0 KHz
>  cpufreq: cpufreq_online: CPU5: Unlisted initial frequency changed to: 2035200 KHz
> 
> Although we could fix this by adding a 'get' operator for the Tegra186
> CPUFREQ driver, there is really little point because the CPUFREQ on
> Tegra186 is set by writing a value stored in the frequency table to a
> register and we just need to set the initial frequency.

The hardware still runs at the frequency requested by cpufreq core here, right ?
It is better to provide the get() callback as it is also used to show the
current frequency in userspace.

> So for Tegra186
> the simplest way to fix this is read the register that sets the
> frequency for each CPU and set the initial frequency when initialising
> the CPUFREQ driver.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/cpufreq/tegra186-cpufreq.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
> index 3d2f143748ef..c44190ce3f03 100644
> --- a/drivers/cpufreq/tegra186-cpufreq.c
> +++ b/drivers/cpufreq/tegra186-cpufreq.c
> @@ -59,6 +59,7 @@ static int tegra186_cpufreq_init(struct cpufreq_policy *policy)
>  		struct tegra186_cpufreq_cluster *cluster = &data->clusters[i];
>  		const struct tegra186_cpufreq_cluster_info *info =
>  			cluster->info;
> +		u32 edvd_val;
>  		int core;
>  
>  		for (core = 0; core < ARRAY_SIZE(info->cpus); core++) {
> @@ -71,6 +72,13 @@ static int tegra186_cpufreq_init(struct cpufreq_policy *policy)
>  		policy->driver_data =
>  			data->regs + info->offset + EDVD_CORE_VOLT_FREQ(core);
>  		policy->freq_table = cluster->table;
> +
> +		edvd_val = readl(policy->driver_data);
> +
> +		for (i = 0; cluster->table[i].frequency != CPUFREQ_TABLE_END; i++) {
> +			if (cluster->table[i].driver_data == edvd_val)
> +				policy->cur = cluster->table[i].frequency;
> +		}
>  		break;
>  	}
>  
> -- 
> 2.17.1

-- 
viresh

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 000522F9E0F
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Jan 2021 12:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388301AbhARLZo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Jan 2021 06:25:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390006AbhARLTX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Jan 2021 06:19:23 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C30C061757
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 03:18:43 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id i63so2937247pfg.7
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 03:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qvWPaK3zACYwIkc6wMItqXNn6sO7dnS45mVY/rO0wb0=;
        b=On+AGOoEh+vrvNR4PL/b9h96zYscCTTVrm8slAGdicARLvnclK58tesyumvLoZLClv
         wDI8JMKNLji0qERfh2x/PTtmqPpUQdwDd+7eXZUW+Z/LrUXXwzAVCvM6jUmdRKWCZUbp
         FLSnjGF4+E4eke5WMEeq+IHv/TlYS7mQDgce4YOPTdorJNtroxBatLCZlnu+uj5iZLdy
         T4nvosofdsItOBVovNntgQm0UlXZaQcsRx7l4+ru9odmCGJFYhzme/jNwxp+V5ZRCRhg
         Sr/FtfetP9dHsVDmgGOATeV8zTeXiSlRLZg/ZiaaQj2tgTmiJJL4Bv7qDxZEcdamgW79
         j2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qvWPaK3zACYwIkc6wMItqXNn6sO7dnS45mVY/rO0wb0=;
        b=gVcTBA7KvRAzqge4BBEEyWmGPsd0AizTDCtAf7M3i9YAUVx1+VKTOMk8G56wT33tzf
         1ApuHxYJObjYZ5bnc6KTnxam1+BMOHCArsscQToFupgdGmcBeKJWvjA2678U76L2J+Qo
         Ri0/RXttiJsD44a6uwsnPWFIea5mFMM34rftSd6pd82pBq8CR/chYxFIG0nfQT4vpqgn
         HFRRB8nfUlOMwJpEAUpG+nSzBi9iDrW4/Qjj/vf69KQbOUdFprGEtw/KGhk3m0c4sZJL
         l6SU3h0RcwnVS5FX1ttC5mDAfs+5OZTCu2j3q7oSlibKA1DjZkhl0es01pKJBXUHWeA3
         Bm7w==
X-Gm-Message-State: AOAM533apIPL9Tk6xbgAW8wSATnUTbA8dFTK4XNTfZNRqU/bW80a+Rxg
        tuqaLSoxMofS3p2CKIkOcQYVeA==
X-Google-Smtp-Source: ABdhPJwo5yg6tKKDdr5GIxiIymn6AT5Faoi4uAlwTfJz4xEassHz2Y0wmw92k4JDGpp61RuD93yZXw==
X-Received: by 2002:a05:6a00:884:b029:1b4:440f:bce7 with SMTP id q4-20020a056a000884b02901b4440fbce7mr14580002pfj.20.1610968723322;
        Mon, 18 Jan 2021 03:18:43 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id 22sm16423434pjw.19.2021.01.18.03.18.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Jan 2021 03:18:42 -0800 (PST)
Date:   Mon, 18 Jan 2021 16:48:40 +0530
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
Subject: Re: [PATCH v3 12/12] opp: Print OPP level in debug message of
 _opp_add_static_v2()
Message-ID: <20210118111840.gvan3fb2t7jo3xz5@vireshk-i7>
References: <20210118005524.27787-1-digetx@gmail.com>
 <20210118005524.27787-13-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118005524.27787-13-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18-01-21, 03:55, Dmitry Osipenko wrote:
> Print OPP level in debug message of _opp_add_static_v2(). This helps to
> chase GENPD bugs.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/of.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index 63b16cdba5ea..758730d070da 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -822,10 +822,11 @@ static struct dev_pm_opp *_opp_add_static_v2(struct opp_table *opp_table,
>  	if (new_opp->clock_latency_ns > opp_table->clock_latency_ns_max)
>  		opp_table->clock_latency_ns_max = new_opp->clock_latency_ns;
>  
> -	pr_debug("%s: turbo:%d rate:%lu uv:%lu uvmin:%lu uvmax:%lu latency:%lu\n",
> +	pr_debug("%s: turbo:%d rate:%lu uv:%lu uvmin:%lu uvmax:%lu latency:%lu level:%u\n",
>  		 __func__, new_opp->turbo, new_opp->rate,
>  		 new_opp->supplies[0].u_volt, new_opp->supplies[0].u_volt_min,
> -		 new_opp->supplies[0].u_volt_max, new_opp->clock_latency_ns);
> +		 new_opp->supplies[0].u_volt_max, new_opp->clock_latency_ns,
> +		 new_opp->level);
>  
>  	/*
>  	 * Notify the changes in the availability of the operable

Applied. Thanks.

-- 
viresh

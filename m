Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B62B92F9AC2
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Jan 2021 08:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733061AbhARHpF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Jan 2021 02:45:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733044AbhARHo7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Jan 2021 02:44:59 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31358C061575
        for <linux-tegra@vger.kernel.org>; Sun, 17 Jan 2021 23:44:19 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id 15so10419956pgx.7
        for <linux-tegra@vger.kernel.org>; Sun, 17 Jan 2021 23:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tG2ZkIlPRQanLBVIchs0TjT+jl8Xjtc0CE3s1wTefiU=;
        b=mW1Htp48X2dHMHQjBwIQf+l6sEVMTr0sO+5+Z8pZbwVyf7CW9kcXod08hxGrB0RVeS
         yMRzZUA9X3LMqs1bz9Pe8JFP8uEB4XcJz+4UZhlNaXUjG1nMg6Aa40B4rVBaoojNGzIX
         mlQDOvbI2hmyupom4boWX1dmJVd17NHz3q0a+pb0CRl/TwoIVU2X9KVR/c9wS3UfIqR7
         1x6LpBbnHUEO5iJMgqfnCOyYSxCcFS1U0GvDcazX4uecmVlb1SufgqepG3Kb5vIeDrL7
         jidHXmx6MEihy/FhIYcxeE0Tf1xcBvpu/a9SyJwgwPK78m28Tr4tS3Sltv149fyELlGw
         xB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tG2ZkIlPRQanLBVIchs0TjT+jl8Xjtc0CE3s1wTefiU=;
        b=c3mpTFj23lDl3MAm7nz/qWx+vhD8KFjvs/mV8xP0JrV8bJ3qkvyQ3eUHpTK8v39tII
         KtXuuIoepVTjlYzzgL+IDuw85INPsoUK7YwckThH4OwughE5OCuus/3OsoSfT64rEDuZ
         Q+yM8RIZuFSAMV8pTDNHQEtYiuZrcsAHDJnGtHr+dZReFEPRh44bXkvd/0+CFNlQyvns
         YpTxWSSHZDrSL+PYfHsWDkHs/Mg7cQ5xvxhnBgaQ+F1GDEG6NB9uWKRHL4voXA1kMlDd
         hHgewZz/B77YC2h+cALEl74cM1lJlVwjrbVflRsDCJMm3Lobc3LmCeC8yS6hSFotqHZg
         wYJA==
X-Gm-Message-State: AOAM5334k203nBll/u9OYNAb8yHaHA2jAYbnJhATtpVW8KIbuTu0i/kC
        CYjlVUGAjBjWCPNuXlJ4zdalfg==
X-Google-Smtp-Source: ABdhPJyL2i8D1O12pZSTHQR8MFhA8ZuWSJUTdowMZk6y7fHlnukMj1xt9pmoIjLK8L7QYUfwXSbycA==
X-Received: by 2002:aa7:8701:0:b029:19e:561:d476 with SMTP id b1-20020aa787010000b029019e0561d476mr25136763pfo.2.1610955858651;
        Sun, 17 Jan 2021 23:44:18 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id q23sm14930878pfg.192.2021.01.17.23.44.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Jan 2021 23:44:17 -0800 (PST)
Date:   Mon, 18 Jan 2021 13:14:16 +0530
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
Subject: Re: [PATCH v3 01/12] opp: Fix adding OPP entries in a wrong order if
 rate is unavailable
Message-ID: <20210118074416.5mjogew62fjohzlm@vireshk-i7>
References: <20210118005524.27787-1-digetx@gmail.com>
 <20210118005524.27787-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118005524.27787-2-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18-01-21, 03:55, Dmitry Osipenko wrote:
> Fix adding OPP entries in a wrong (opposite) order if OPP rate is
> unavailable. The OPP comparison was erroneously skipped, thus OPPs
> were left unsorted.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index dfc4208d3f87..48618ff3e99e 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -1527,12 +1527,10 @@ int _opp_add(struct device *dev, struct dev_pm_opp *new_opp,
>  	mutex_lock(&opp_table->lock);
>  	head = &opp_table->opp_list;
>  
> -	if (likely(!rate_not_available)) {
> -		ret = _opp_is_duplicate(dev, new_opp, opp_table, &head);
> -		if (ret) {
> -			mutex_unlock(&opp_table->lock);
> -			return ret;
> -		}
> +	ret = _opp_is_duplicate(dev, new_opp, opp_table, &head);
> +	if (ret) {
> +		mutex_unlock(&opp_table->lock);
> +		return ret;
>  	}
>  
>  	list_add(&new_opp->node, head);

Applied. Thanks.

I am not sending it for 5.11-rc as there shouldn't be any users which
are impacted because of this right now, right ?

-- 
viresh

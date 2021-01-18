Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4762F9D85
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Jan 2021 12:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388737AbhARLGF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Jan 2021 06:06:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389392AbhARKvN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Jan 2021 05:51:13 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0ED8C0613D3
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 02:50:16 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id p18so10665507pgm.11
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 02:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/R3UCFnO6UqmoJANzPoDRlRakiNGCKfWPdfz/PEj6G0=;
        b=JgIT275MouwzJRI/IlJros32BFBpp/uk6O7jXlgjoZdf6afSkxXYI/VEZ3g/9LKgeO
         TAPfaMpRl2EyOW6sCdSNNDar8odE4NwLSQS0HZ4t0kj3NwzxWauJuqsYUW7tgFoibNue
         VYJTENAAxRe6O7YBYHSkHGXrYrHoViznGpSPU0/OfMyQYlWbFQFX1ctE7Pg9txrZAtW+
         jGxhip9cMCnYTZG2rF3qZC0P2Yq+uCVhyKF7t0dwAabht79kiIhxD368XFeUXT8xcHlK
         OuLDXgTuET2lSUWm5p4ybvI2c2y1ZWAEL+K56v7obPBK2OggzcSmu/K8GfkMl2r6IfaN
         QIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/R3UCFnO6UqmoJANzPoDRlRakiNGCKfWPdfz/PEj6G0=;
        b=d8sa0fiQsFV6uPVDL9TBbhJvsGoWYKPMsA2ZlFZqpqtDrW0gV8xTv3q2Lm7KLO9tw0
         N1yn1f417oPtbsUuu8YlgRg5b/iqoP3tkep2+hWPwrwD0r9O0bm9Cz9paZ6e7Eo1Vt4P
         OmeuPeSS+GUsnDF106tCdTKvPpmSQ9LGgVeV7EqCs6rkqyERT1SBtrh8ceq1Dq6GKxJU
         9LlM3/WIQ+QI7Chx0dOrUovJAmoJn6U3qeFjJ6DopGnrrzPpcIwT9ctn/itDk8XtRVP4
         nDPDlTAtEcJOV6eUe4YtFXkC/reJrV2ayLhnRd+tHIYjHLWHueRpaVEcuQGhVuca5QGW
         vwjA==
X-Gm-Message-State: AOAM532Dwa9MQbnDvf06aNRCErXrDKhL+1bRVSqarbSwUcqBSHDxMIgy
        B3lKFADNDxLpLt1GeYF0/cx6SA==
X-Google-Smtp-Source: ABdhPJx/jeIGcSJLY/ARAydthMDOg2XQJOnRGnR84+atUL4sjdxZXtdurD1hIIsNAIhbU+3GF7/Abw==
X-Received: by 2002:a63:504e:: with SMTP id q14mr25486348pgl.21.1610967016260;
        Mon, 18 Jan 2021 02:50:16 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id e3sm9140099pgs.60.2021.01.18.02.50.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Jan 2021 02:50:15 -0800 (PST)
Date:   Mon, 18 Jan 2021 16:20:13 +0530
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
Subject: Re: [PATCH v3 07/12] opp: Add dev_pm_opp_get_required_pstate()
Message-ID: <20210118105013.ah2gvizv3rjdt4vr@vireshk-i7>
References: <20210118005524.27787-1-digetx@gmail.com>
 <20210118005524.27787-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118005524.27787-8-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18-01-21, 03:55, Dmitry Osipenko wrote:
> Add dev_pm_opp_get_required_pstate() which allows OPP users to retrieve
> required performance state of a given OPP.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c     | 22 ++++++++++++++++++++++
>  include/linux/pm_opp.h | 10 ++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index df0969002555..fde2ec00ab0e 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -145,6 +145,28 @@ unsigned int dev_pm_opp_get_level(struct dev_pm_opp *opp)
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_opp_get_level);
>  
> +/**
> + * dev_pm_opp_get_required_pstate() - Gets the required performance state
> + *                                    corresponding to an available opp
> + * @opp:	opp for which performance state has to be returned for
> + * @index:	index of the required opp
> + *
> + * Return: performance state read from device tree corresponding to the
> + * required opp, else return 0.
> + */
> +unsigned int dev_pm_opp_get_required_pstate(struct dev_pm_opp *opp,
> +					    unsigned int index)
> +{
> +	if (IS_ERR_OR_NULL(opp) || !opp->available ||
> +	    index >= opp->opp_table->required_opp_count) {
> +		pr_err("%s: Invalid parameters\n", __func__);
> +		return 0;
> +	}
> +
> +	return opp->required_opps[index]->pstate;
> +}
> +EXPORT_SYMBOL_GPL(dev_pm_opp_get_required_pstate);
> +
>  /**
>   * dev_pm_opp_is_turbo() - Returns if opp is turbo OPP or not
>   * @opp: opp for which turbo mode is being verified
> diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
> index b7dc993487c7..e072148ae0e1 100644
> --- a/include/linux/pm_opp.h
> +++ b/include/linux/pm_opp.h
> @@ -98,6 +98,9 @@ unsigned long dev_pm_opp_get_freq(struct dev_pm_opp *opp);
>  
>  unsigned int dev_pm_opp_get_level(struct dev_pm_opp *opp);
>  
> +unsigned int dev_pm_opp_get_required_pstate(struct dev_pm_opp *opp,
> +					    unsigned int index);
> +
>  bool dev_pm_opp_is_turbo(struct dev_pm_opp *opp);
>  
>  int dev_pm_opp_get_opp_count(struct device *dev);
> @@ -194,6 +197,13 @@ static inline unsigned int dev_pm_opp_get_level(struct dev_pm_opp *opp)
>  	return 0;
>  }
>  
> +static inline
> +unsigned int dev_pm_opp_get_required_pstate(struct dev_pm_opp *opp,
> +					    unsigned int index)
> +{
> +	return 0;
> +}
> +
>  static inline bool dev_pm_opp_is_turbo(struct dev_pm_opp *opp)
>  {
>  	return false;

Applied. Thanks.

-- 
viresh

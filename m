Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3C2911FD6D
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Dec 2019 05:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbfLPEFg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 15 Dec 2019 23:05:36 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36134 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbfLPEFf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 15 Dec 2019 23:05:35 -0500
Received: by mail-pg1-f194.google.com with SMTP id k3so2886132pgc.3
        for <linux-tegra@vger.kernel.org>; Sun, 15 Dec 2019 20:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=d4XspCOLY0K+C1Vfb2PDWcaWLInJRK+f1WKwR2zrrME=;
        b=HchpIwQMnBNKqHOnvMjOMVaASy6pIUbbRENB4Er0WySYNfH+cBpQd/VVttcEc1iKxU
         S1PRRWmCeQcvQ71kCjxcxw41+AUwXVn06ggSP/Zx9ly0DoKdBGTHyVbF0ccUKPnpjHM+
         xX3YY+c/v+G56ALgVfZqfy5qyUXDan07Mw01WG8VVtLiAxZf3yM10dpMJQx5B+lGuXdA
         hydKasR+2Z/bXmU6U1hqBFvb0IYLydzNSl3ZU39fzdqrbkMJDNWsewQly1buzzFbWPFk
         ielGKUyIRolOQcCwzMA3Dslc650R54M64soVcZ6fdMEva18UuIe1odrXveTbZJmYsueA
         Ga0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d4XspCOLY0K+C1Vfb2PDWcaWLInJRK+f1WKwR2zrrME=;
        b=oQ+pd1akY5snm/i+NtNzU91lRyIIjoT6CQJ7hp0sdOevh+4ZBmz/w9jtPsbtBFQtqf
         sMbG9GcdDx5IyDmfaYaQVfxkIkjhGzKAS1vgU5XKJFuJOxUQG38jlstMcX4eFreK87A6
         ueVS0D1U2OQaROSdcLdz23ziX6k4joomJrsw5jXDl3uIjxuQ1HhYEAwjMhAwwodY88QQ
         PIlEqJys9W9EjUnIOE5bogiD0i1eKzLyz7idYMXWgH3oT2pfpJt1w7OdjDeG83F8EBI1
         OO/hdYEeiaprZp2/zxZx6daP/ojQLOUYjJVMGfZA0AoPt5uc4TFmn4IuMv/VP9hz5cW2
         5RUA==
X-Gm-Message-State: APjAAAVJKJozQMw7YGIFIH5v0IwHeuE1rLLPGg6aGE6aCUSriootdg33
        v0iMAGsEOxs0twoZS1VHGCGbZQ==
X-Google-Smtp-Source: APXvYqwLt7wj56FeIgG9ZelBz/Zll/j8P4bcApK8Q+7U541auajpxb17fqK7nFsQ5ScZhkF9BwftfQ==
X-Received: by 2002:a65:66d7:: with SMTP id c23mr16106550pgw.40.1576469135086;
        Sun, 15 Dec 2019 20:05:35 -0800 (PST)
Received: from localhost ([122.171.234.168])
        by smtp.gmail.com with ESMTPSA id e10sm20480322pfm.3.2019.12.15.20.05.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Dec 2019 20:05:34 -0800 (PST)
Date:   Mon, 16 Dec 2019 09:35:32 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/11] cpufreq: dt-platdev: Blacklist NVIDIA Tegra20
 and Tegra30 SoCs
Message-ID: <20191216040532.mzdovqoub5rdztwb@vireshk-i7>
References: <20191118164512.8676-1-digetx@gmail.com>
 <20191118164512.8676-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191118164512.8676-8-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18-11-19, 19:45, Dmitry Osipenko wrote:
> Both NVIDIA Tegra20 and Tegra30 SoCs should be blacklisted because CPU
> OPPs use supported_hw and thus platdev isn't suitable for these SoCs.
> Currently cpufreq-dt driver produces a bit annoying warning splats
> during boot because valid OPPs are not found, this will be fixed once
> tegra20-cpufreq driver will be update to support cpufreq-dt. The warnings
> will also happen on older stable kernels using newer device-trees, thus
> this patch should be backported to stable kernels as well.
> 
> Cc: <stable@vger.kernel.org>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Fixes: 4053aa65c517 ("ARM: tegra: cardhu-a04: Add CPU Operating Performance Points")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index f1d170dcf4d3..aba591d57c67 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -121,6 +121,8 @@ static const struct of_device_id blacklist[] __initconst = {
>  	{ .compatible = "mediatek,mt8176", },
>  	{ .compatible = "mediatek,mt8183", },
>  
> +	{ .compatible = "nvidia,tegra20", },
> +	{ .compatible = "nvidia,tegra30", },
>  	{ .compatible = "nvidia,tegra124", },
>  	{ .compatible = "nvidia,tegra210", },

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

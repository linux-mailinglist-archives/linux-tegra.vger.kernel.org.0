Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB46811FD71
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Dec 2019 05:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfLPEHo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 15 Dec 2019 23:07:44 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35439 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbfLPEHn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 15 Dec 2019 23:07:43 -0500
Received: by mail-pg1-f194.google.com with SMTP id l24so2892546pgk.2
        for <linux-tegra@vger.kernel.org>; Sun, 15 Dec 2019 20:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O0EDp2VR7vRrdpezRRk8VnhFZPtMH566WLQKOyukB0Q=;
        b=Es/WNnW6oIegDELYoewhci7zWAZBMTG3UNR4q9zqfYkP7PKxVi1jqOIrLQwmesPGvB
         X0kF3I7HDgxiZ7YT95a53VFsmqGg2Hcsl0pNhQPx6LWk2QmOfwcstIUNlbAbNtZxltxE
         RPUgTj+qs/eQsF/6/NhDx3bzydjDTzI0iuVLe0aL0zUIaNBUxcxZiT/9nzq08ji6w9su
         ocl7Uh418YxUzz4Z3jDsqOl5f/A3WL/ajKMklV2HuK0h0cRA+iV2XvngPWufeRupTJx6
         iuL/aU0EqICCUzd2nIzGvv2ZwhWCb0r/fti0JMwgBUqW0Oc82u/nRLR3ZbHjMbdLboQr
         sXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O0EDp2VR7vRrdpezRRk8VnhFZPtMH566WLQKOyukB0Q=;
        b=Lg9svZJevL7Twzq+1sDr0ZKGBYTxG6TzlNBjVsv/JwHjP27hBmq7zPrLzphs6itNSr
         eTRriDgA9xKmuXQwB8aLPx5cMHxYSp/5zhqnP/z+LK9iQDp3cdAFg9eA4Jjet6q+Ozys
         1kx17pvuMR3KmpXky6j7StFBEPPy6PKTUEf57Fnq8gTbE6ioBgBjfK1edgm6IAE5Zafn
         T5v8SATgxLfn0Mpd4CEmc+tUB0meRhwYg42T/YNrsKeBF0ILBEgpT0+dCDH1cbCl6flz
         db0mgroR51OpNLmlmhkr3Fcve4QptTkXj3H6opF7FywTheSAtQvfIFDu734ZZmzcoGE2
         uFdQ==
X-Gm-Message-State: APjAAAUYlWolecnk947agXuwBt4OzVHNDxMf+iA99l9hTXrvfOxJJyWN
        PjzdikofP4i2jNSh0zHSvv57oQ==
X-Google-Smtp-Source: APXvYqwcp08t+zOBxQyHNztM8wNJhrrKhtCm3cB1YuJMwthppEEIOJAkZprpR/02QkZjtblZgQjDSQ==
X-Received: by 2002:a62:c541:: with SMTP id j62mr14001745pfg.237.1576469263222;
        Sun, 15 Dec 2019 20:07:43 -0800 (PST)
Received: from localhost ([122.171.234.168])
        by smtp.gmail.com with ESMTPSA id 100sm18149086pjo.17.2019.12.15.20.07.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Dec 2019 20:07:42 -0800 (PST)
Date:   Mon, 16 Dec 2019 09:37:40 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Yangtao Li <tiny.windzz@gmail.com>
Cc:     rjw@rjwysocki.net, thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] cpufreq: kirkwood: convert to
 devm_platform_ioremap_resource
Message-ID: <20191216040740.d5r2dn3gs6xamxh3@vireshk-i7>
References: <20191215140522.30872-1-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191215140522.30872-1-tiny.windzz@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 15-12-19, 14:05, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/cpufreq/kirkwood-cpufreq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/kirkwood-cpufreq.c b/drivers/cpufreq/kirkwood-cpufreq.c
> index cb74bdc5baaa..70ad8fe1d78b 100644
> --- a/drivers/cpufreq/kirkwood-cpufreq.c
> +++ b/drivers/cpufreq/kirkwood-cpufreq.c
> @@ -102,13 +102,11 @@ static struct cpufreq_driver kirkwood_cpufreq_driver = {
>  static int kirkwood_cpufreq_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np;
> -	struct resource *res;
>  	int err;
>  
>  	priv.dev = &pdev->dev;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv.base = devm_ioremap_resource(&pdev->dev, res);
> +	priv.base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(priv.base))
>  		return PTR_ERR(priv.base);
>  

Applied both. Thanks.

-- 
viresh

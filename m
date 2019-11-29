Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7F1D10D333
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Nov 2019 10:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbfK2JYO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 29 Nov 2019 04:24:14 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33792 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfK2JYO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Nov 2019 04:24:14 -0500
Received: by mail-wr1-f65.google.com with SMTP id t2so34183585wrr.1
        for <linux-tegra@vger.kernel.org>; Fri, 29 Nov 2019 01:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7LhFAcjV7jdT90dH+pVWA1/5jK5ehW9ZZY7BlTD4CNw=;
        b=lwqIMEP9sKSqHwuHJ8ISzFRWN1kwGs6foGY5TXT+9rFVjKq8sYS98nCkpX+zljZaVo
         2crAvs4eFqLDMOpOyP2BmDE3HH+2O5d+9+8FmkH8AF27q6H1F+7T5q9KqREBUx+Q7dD/
         DaNvpt0UrHa/fFSbf4cT9WEYvKB+MUkW0/CcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7LhFAcjV7jdT90dH+pVWA1/5jK5ehW9ZZY7BlTD4CNw=;
        b=XXGXagXn687bgbho6QiRuFOuKuX9zWvpQ836hvD3YAGc69+cXSkWWcH8K5Ev2xNWlz
         NScTdSyd4OmFPjwOARqBiTNawdTZtHBFxfSPjIBkMs8VWa0k0eNf2HciqkeyHbcYHiya
         ioJxP/hdAjDOrHMB6kfuYLMXnwCsI6OPvd/Iq/b8Dae3FZLVrps5SXr8cQ3mjJQVIpBi
         3JqQbNC4fXryjqtRZc4kIwlo6TDPvVySZjrBxbsxB1pDc/am0dODfY3SjmN1A1nyPixA
         7W5titVSgLjQn3DT8l59TB2DDDEL/M7TBJUS8pYqPQ7V6r3lVyoGHYPSh384cTvhaUVX
         Vt2g==
X-Gm-Message-State: APjAAAXJWNIGmGzh6JTg+32adc3+SzLDsejQGn0vfowTfnmp2BmbGkHq
        YOuG5Ekgvr2aBJPbdEGNQig33mmy56w=
X-Google-Smtp-Source: APXvYqyU4d7rBqA+DeLWPtwWmoPW+jO/47z9caNHBTyOmd9L1u2p3EWNavS8mHT/Yfajj6tb1DrYsQ==
X-Received: by 2002:adf:83c7:: with SMTP id 65mr7607282wre.368.1575019451628;
        Fri, 29 Nov 2019 01:24:11 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id h8sm9784763wrx.63.2019.11.29.01.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 01:24:11 -0800 (PST)
Date:   Fri, 29 Nov 2019 10:24:09 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 9/9] drm/tegra: sor: Make the +5V HDMI supply optional
Message-ID: <20191129092409.GE624164@phenom.ffwll.local>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-10-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191128153741.2380419-10-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Nov 28, 2019 at 04:37:41PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The SOR supports multiple display modes, but only when driving an HDMI
> monitor does it make sense to control the +5V power supply. eDP and DP
> don't need this, so make it optional.
> 
> This fixes a crash observed during system suspend/resume.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/tegra/sor.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 2200f4cd397a..a68d3b36b972 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -3970,15 +3970,29 @@ static int tegra_sor_runtime_resume(struct device *dev)
>  static int tegra_sor_suspend(struct device *dev)
>  {
>  	struct tegra_sor *sor = dev_get_drvdata(dev);
> +	int err;
> +
> +	if (sor->hdmi_supply) {
> +		err = regulator_disable(sor->hdmi_supply);
> +		if (err < 0)
> +			return err;
> +	}
>  
> -	return regulator_disable(sor->hdmi_supply);
> +	return 0;
>  }
>  
>  static int tegra_sor_resume(struct device *dev)
>  {
>  	struct tegra_sor *sor = dev_get_drvdata(dev);
> +	int err;
> +
> +	if (sor->hdmi_supply) {
> +		err = regulator_enable(sor->hdmi_supply);
> +		if (err < 0)
> +			return err;
> +	}
>  
> -	return regulator_enable(sor->hdmi_supply);
> +	return 0;
>  }
>  
>  static const struct dev_pm_ops tegra_sor_pm_ops = {
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

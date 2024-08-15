Return-Path: <linux-tegra+bounces-3272-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F82B9529C3
	for <lists+linux-tegra@lfdr.de>; Thu, 15 Aug 2024 09:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 820BD1C2223F
	for <lists+linux-tegra@lfdr.de>; Thu, 15 Aug 2024 07:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB3917ADFA;
	Thu, 15 Aug 2024 07:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TGbIa2yr"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B874917A5BD
	for <linux-tegra@vger.kernel.org>; Thu, 15 Aug 2024 07:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723706373; cv=none; b=CufbflCVd+plBbp1cvWV3zh92xUuXig6w1F0/nbZCrWVPprgw3mGezID0+v6ChvXx9UwjQOKZfVBl1d6JSwgnGp85beIb4Ossyq+ClsaZBP3jDDj6/J2NBRvQm1yvDSnoSFEaQUvRQM7NSfzRmM2N18o8hf50ONcXbdddAhAu8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723706373; c=relaxed/simple;
	bh=0aDqFb9x+MKvUfcLmRZLE0edxA2SzrFvTX87CwOLRaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGXWVoy9fOZtYwcOp/bK5Dkuu+EYnznJAzPkTUSdwaZvUy4kWPtgbkd4Ag6knHTfl7DfG9XJq/jqOw4w7Nz8erXA1Jr4sDBqQxVNsWWAPKpmb5huKqKTRB6PSjcUeg7yv08hapFa/d+zsP4EUm8NKLQuNvmDdjTArasViOWeQME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TGbIa2yr; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2d3bdab22b1so456196a91.0
        for <linux-tegra@vger.kernel.org>; Thu, 15 Aug 2024 00:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723706371; x=1724311171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NmpuMWed3wE/MKqQQ30dx9YCUbl3v+yH31472iJ8R/c=;
        b=TGbIa2yr20k9wYfthAsuCk9y0d+QP7odvEVrq7vs7Tc3xNZ/uOC2oSYkfqlUTZ2g9o
         IOM7mY5engl8jb648hA/qq90q7/uoI9QJ/6O3I8MVmaEB7QfIMMf1SpNKYj/9SYJcOeh
         nGSXvBc0STIIxjv4nRvqMBszJ0UC2iEdtsdCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723706371; x=1724311171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmpuMWed3wE/MKqQQ30dx9YCUbl3v+yH31472iJ8R/c=;
        b=vt4t75+Jzn3PiHy/5ZjVX/wse0TqcMylA8lRtYSE1C+zUMA0jHaQLRU1w8B+DTnYJJ
         vkg7UjbdwZwyDivNzQ2VoFTj+nwmWhsxSawWo4e321aw4Y7JtTnTNIJaW536V6sg1Cof
         0iM9Nc+iLmBCgivu41Wsliy224WB6R+4Kaun44k5OL4nIafmkYB0Yn4PLl2AuB+Ru/t1
         i99AsSWjBiZsszQk0ZVxn8lY0VRR2zbRkxh7ycyni1zaew/5QMingz2Xr6uXoEgEc8aL
         ElT2TZGeQEZETqTy3g8+PSFE9FZtGJvtfZTpaQwtP/BQ5/Mgd96qQRWjJsL2VVWnrMoN
         hAxg==
X-Forwarded-Encrypted: i=1; AJvYcCVZvLbbd9ot53NxXI2AbE76geFdlqSumx3gmrPIywPciPVFoxitoDlKwemJturZxfgKdFIq0r3BkOqhMWqaoeKRtVnky+nnH7vyKy4=
X-Gm-Message-State: AOJu0YzkV8TdVEjTS7DXUJglve0TP0M6IpZVU1EZVBBGzdlF2iIbjJEP
	5WG3eCdsXPKeLwGCkiGn/+7ShusNJOnggeS6b8518b6W8h+Cip8F6nsodIAc1w==
X-Google-Smtp-Source: AGHT+IHRshLWXbi6eNNbn2lqpjEggfJMf0Uyu0Go3ioD6E5Am71ibLtxHtFVTG87K3YJW6ZSoF1EvA==
X-Received: by 2002:a17:90b:4b12:b0:2d3:90e1:41c7 with SMTP id 98e67ed59e1d1-2d3aab492a6mr6014296a91.31.1723706370866;
        Thu, 15 Aug 2024 00:19:30 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:745d:58f7:b3cd:901f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3c87b0450sm741049a91.28.2024.08.15.00.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 00:19:30 -0700 (PDT)
Date: Thu, 15 Aug 2024 15:19:25 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/7] thermal: of: Use scoped device node handling to
 simplify of_thermal_zone_find()
Message-ID: <20240815071925.GC350960@google.com>
References: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-thermal-v1-3-7a1381e1627e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-thermal-v1-3-7a1381e1627e@linaro.org>

On Wed, Aug 14, 2024 at 10:17:49PM +0200, Krzysztof Kozlowski wrote:
> Obtain the device node reference with scoped/cleanup.h to reduce error
> handling and make the code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
> 
> This depends on my earlier fixes:
> 
> https://lore.kernel.org/all/20240814195823.437597-1-krzysztof.kozlowski@linaro.org/
> ---
>  drivers/thermal/thermal_of.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index c8ded4462bb8..fb5472d6ffea 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -157,10 +157,9 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
>  
>  static struct device_node *of_thermal_zone_find(struct device_node *sensor, int id)
>  {
> -	struct device_node *np, *tz;
>  	struct of_phandle_args sensor_specs;
>  
> -	np = of_find_node_by_name(NULL, "thermal-zones");
> +	struct device_node *np __free(device_node) = of_find_node_by_name(NULL, "thermal-zones");
>  	if (!np) {
>  		pr_debug("No thermal zones description\n");
>  		return ERR_PTR(-ENODEV);
> @@ -178,8 +177,7 @@ static struct device_node *of_thermal_zone_find(struct device_node *sensor, int
>  						   "#thermal-sensor-cells");
>  		if (count <= 0) {
>  			pr_err("%pOFn: missing thermal sensor\n", child);
> -			tz = ERR_PTR(-EINVAL);
> -			goto out;
> +			return ERR_PTR(-EINVAL);
>  		}
>  
>  		for (i = 0; i < count; i++) {
> @@ -191,22 +189,18 @@ static struct device_node *of_thermal_zone_find(struct device_node *sensor, int
>  							 i, &sensor_specs);
>  			if (ret < 0) {
>  				pr_err("%pOFn: Failed to read thermal-sensors cells: %d\n", child, ret);
> -				tz = ERR_PTR(ret);
> -				goto out;
> +				return ERR_PTR(ret);
>  			}
>  
>  			if ((sensor == sensor_specs.np) && id == (sensor_specs.args_count ?
>  								  sensor_specs.args[0] : 0)) {
>  				pr_debug("sensor %pOFn id=%d belongs to %pOFn\n", sensor, id, child);
> -				tz = no_free_ptr(child);
> -				goto out;
> +				return no_free_ptr(child);
>  			}
>  		}
>  	}
> -	tz = ERR_PTR(-ENODEV);
> -out:
> -	of_node_put(np);
> -	return tz;
> +
> +	return ERR_PTR(-ENODEV);
>  }
>  
>  static int thermal_of_monitor_init(struct device_node *np, int *delay, int *pdelay)
> 
> -- 
> 2.43.0
> 


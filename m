Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D116B108B39
	for <lists+linux-tegra@lfdr.de>; Mon, 25 Nov 2019 10:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbfKYJ4e (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 25 Nov 2019 04:56:34 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37544 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727133AbfKYJ4d (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Nov 2019 04:56:33 -0500
Received: by mail-wr1-f66.google.com with SMTP id t1so17124142wrv.4
        for <linux-tegra@vger.kernel.org>; Mon, 25 Nov 2019 01:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mQLXL4wEvCHiGZx1WE499NjfF/ywAujK0jr8uEANUhc=;
        b=C2KaDLiFnlOYsWP3jS8XknzxzkuuBZxi9r3cHIV+ylP0OxOLzS8e+bYjxtNS7ODOlo
         RE9RB1cDEI4wPLl537d/Q6XHkyN14me1kHnTZMS04AEjfIWS8n3+YXkQs1kiI3Ugsioj
         Jaoy02TQnSYhVgnchkhrrpwsrVj9NVUpjSefI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mQLXL4wEvCHiGZx1WE499NjfF/ywAujK0jr8uEANUhc=;
        b=asdHSUg7LYAxNYy0EIk5WwjhfiKgKkhpVK84NUstMwjj7FxY3OPASR+Ok/JTcEfmtI
         MltsaYKG+3M9A+x01p9l7kIeRQup8hJ9smyQ2Xb77KRpcygBNy6Q4JBvJ0JXJWUr/hAu
         Ej2s5ppiNNcW2FqZdZnOYm7TRT0ri7EOyKcEOEWKxwQQr7ex2kwCdk1TUBIXEikMncZD
         jfnBlvbXbiV2YdSqOOV8iFc+IkJjJyTAEYG9b9gJe/YDuWZblIsq8RJ9ZiuEG7HRXyl2
         UtNXTW6sil6tcl+EG9EfyMNvYz9NfaDt2ZqwMOmC1JlySketUUUkRMucMgMeFck4DOK+
         KcbA==
X-Gm-Message-State: APjAAAWS0t4G1nO7vRhoRWmXNwTmNHqX0ETNfu2kF/gn110MHsWg3nkL
        dGk3/5eGF6UnlYNGLFQxZVTOtA==
X-Google-Smtp-Source: APXvYqxT2jc/vj80jYZH5pCOS2C3bSf/Y0E/TFujPDmPYxHwgfOnnJiIxnMWRiZ/oSAW6UMxuNP5Uw==
X-Received: by 2002:adf:f18e:: with SMTP id h14mr31979916wro.348.1574675792033;
        Mon, 25 Nov 2019 01:56:32 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id y15sm9349438wrh.94.2019.11.25.01.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 01:56:30 -0800 (PST)
Date:   Mon, 25 Nov 2019 10:56:29 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] drm/tegra: vic: Export module device table
Message-ID: <20191125095629.GK29965@phenom.ffwll.local>
References: <20191122133215.1317039-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122133215.1317039-1-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 22, 2019 at 02:32:15PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Export the module device table to ensure the VIC compatible strings are
> listed in the module's aliases table. This in turn causes the driver to
> be automatically loaded on boot if VIC is the only enabled subdevice of
> the logical host1x DRM device.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I noticed that the drm subdev driver also lacks the matches. How does that
work? Just by getting loaded when any of the subdev drivers match?
-Daniel

> ---
>  drivers/gpu/drm/tegra/vic.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> index 9444ba183990..c4d82b8b3065 100644
> --- a/drivers/gpu/drm/tegra/vic.c
> +++ b/drivers/gpu/drm/tegra/vic.c
> @@ -386,13 +386,14 @@ static const struct vic_config vic_t194_config = {
>  	.supports_sid = true,
>  };
>  
> -static const struct of_device_id vic_match[] = {
> +static const struct of_device_id tegra_vic_of_match[] = {
>  	{ .compatible = "nvidia,tegra124-vic", .data = &vic_t124_config },
>  	{ .compatible = "nvidia,tegra210-vic", .data = &vic_t210_config },
>  	{ .compatible = "nvidia,tegra186-vic", .data = &vic_t186_config },
>  	{ .compatible = "nvidia,tegra194-vic", .data = &vic_t194_config },
>  	{ },
>  };
> +MODULE_DEVICE_TABLE(of, tegra_vic_of_match);
>  
>  static int vic_probe(struct platform_device *pdev)
>  {
> @@ -516,7 +517,7 @@ static const struct dev_pm_ops vic_pm_ops = {
>  struct platform_driver tegra_vic_driver = {
>  	.driver = {
>  		.name = "tegra-vic",
> -		.of_match_table = vic_match,
> +		.of_match_table = tegra_vic_of_match,
>  		.pm = &vic_pm_ops
>  	},
>  	.probe = vic_probe,
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

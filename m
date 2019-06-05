Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 531FA35D05
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Jun 2019 14:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727615AbfFEMkR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Jun 2019 08:40:17 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42630 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbfFEMkR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jun 2019 08:40:17 -0400
Received: by mail-ed1-f68.google.com with SMTP id z25so5579889edq.9
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jun 2019 05:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=19Zu+rAYo+G3lJ9CumK/W89DuTXy0hR8UhibNfpN+P4=;
        b=fE4SL0f4q/InjUL5sSgaTYrHEFfPwX9MhChobpROX88enEjOxXYKx8+1mdXozTcsI1
         G3z8q8zOfG6gwLa8W2F9+AFnBBMjzOmdN6ca2IkZdIfokFXR00CBOkYBzcGJvjnYRtzc
         Ga8ZX+6HMGPAmPpx2qIHOl+1N928Yo8fy+qzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=19Zu+rAYo+G3lJ9CumK/W89DuTXy0hR8UhibNfpN+P4=;
        b=evBXHlzsnNdzCeMQFdCgJut+GJt2OW0nJgcJ2vkW/X9OjKG2/gpF2waIjeFNzFFmh+
         dEWn75v2PqFwQxHb+o3/LLAJAG46UTkS0SvoFt/e/1udSXnEexA+h7Pp/Ru45NkB/DWQ
         ZmJ3ZOwv3cetAOapOyaOkMXC5sdFqQ0bH2xMVF5UoCblmTu6KOjvtJ14x8Q6i5wlWzuZ
         IMRGyMB6tG96Sy0W3zmOiaZF8vQHbngmmQO85uktCl1Vm1Lq8HaiJd+0V70D3O8yWFuo
         591ewsM2U6bBfIOkTW9p/KnA7/8DC+WZmPnRwmFz+j569jRhwY2XkbkI2Z3pXs5NFD2T
         xINg==
X-Gm-Message-State: APjAAAUOzRlLuL/jEuuocIxkbB7YBDGK8IRAaziBQcgVQvGmMegp9S6w
        B3GegTlXJz5Fv+4X24YeB1bfkg==
X-Google-Smtp-Source: APXvYqwtCdDy+7ckC3bq0JLPz1ETCd0W2/kqC6hte7TbeC809Dxf35J8hw0BPRDFWMWhdfcS7f/ZEQ==
X-Received: by 2002:a50:ca89:: with SMTP id x9mr41756654edh.164.1559738415815;
        Wed, 05 Jun 2019 05:40:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id z27sm832131ejk.20.2019.06.05.05.40.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 05:40:14 -0700 (PDT)
Date:   Wed, 5 Jun 2019 14:40:12 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] gpu: host1x: Do not output error message for deferred
 probe
Message-ID: <20190605124012.GU21222@phenom.ffwll.local>
References: <20190604153150.22265-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604153150.22265-1-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jun 04, 2019 at 05:31:50PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> When deferring probe, avoid logging a confusing error message. While at
> it, make the error message more informational.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/host1x/dev.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index c55e2d634887..5a3f797240d4 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -247,8 +247,11 @@ static int host1x_probe(struct platform_device *pdev)
>  
>  	host->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(host->clk)) {
> -		dev_err(&pdev->dev, "failed to get clock\n");
>  		err = PTR_ERR(host->clk);
> +
> +		if (err != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "failed to get clock: %d\n", err);

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  		return err;
>  	}
>  
> -- 
> 2.21.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

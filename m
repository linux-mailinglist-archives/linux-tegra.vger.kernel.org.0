Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2F421AA193
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Apr 2020 14:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S370095AbgDOMnM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 15 Apr 2020 08:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S370090AbgDOMnJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Apr 2020 08:43:09 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC6C1C061A0C
        for <linux-tegra@vger.kernel.org>; Wed, 15 Apr 2020 05:43:08 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k1so11745412wrx.4
        for <linux-tegra@vger.kernel.org>; Wed, 15 Apr 2020 05:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xz+YTOHNYCXdP1BDbqG5YAFKwQGTYMNNrFa2gvIXERM=;
        b=fZQxdNoApyvNeBsn2jIoaMwXN15cK/vKO9+PLRI3LBOsjXFLn1GeBzPPyjw8+KtTjs
         2bWgWwxitVfu/M9wMaOThxOv5T6M1Yli+RdLaZpOoKLavGVebcSEYNu5W9DM3WtPApxF
         2BW8mDeLeATpX7He1zzfcqJPEz4C6aKSWI1qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xz+YTOHNYCXdP1BDbqG5YAFKwQGTYMNNrFa2gvIXERM=;
        b=O3HA24jfeZL1Gt1s/mg/GLFGFlBJc/jaCsce1Zrrj9OYvKklchQ04QB7NqsRC8wMml
         WRGnzY6Kr11qOgEMCUtn02dpM3T3gjM3Ssl29mvWzgZGWV5ZHLIcFVE8dnPDhTN/I3tS
         5IkKVszDUwCl0hhFYkJSb0QEsgUaHQBXzqtS3QMuNQQ8UzW30wMk/uwh9dsm3oNKsx0x
         FKW5v3gLhPMuhYn9+YD+sIYUwjH/iN3Ft6M35/+M8158jlhCyUfprPVi7LqKqF5xa+KN
         CAy0YPpBFr36OXaw/K8g+kKIeOqXIdqHhyiVkS0TrVxRM3yjHRQxm1KVTJDRWCcQ4htt
         JF5A==
X-Gm-Message-State: AGi0PuZiZ332V+vTlLspduCbi9JxNtiJzM9LuoH98Q/e4bXQSqtZl7li
        kc9m8gbTYsvYP6+cyoF//K3YYA==
X-Google-Smtp-Source: APiQypI/joouelURTy4OKxn0y/Uzbjwa4A81ZP3a5dY66+yY/aNdM1czkBjo4FY/RYkgSehhK70yMg==
X-Received: by 2002:adf:afe4:: with SMTP id y36mr29792465wrd.205.1586954587467;
        Wed, 15 Apr 2020 05:43:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id t13sm7139552wre.70.2020.04.15.05.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 05:43:06 -0700 (PDT)
Date:   Wed, 15 Apr 2020 14:43:05 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/tegra: Clean up GPIO includes
Message-ID: <20200415124305.GC3456981@phenom.ffwll.local>
References: <20200415122427.111769-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415122427.111769-1-linus.walleij@linaro.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Apr 15, 2020 at 02:24:27PM +0200, Linus Walleij wrote:
> The Tegra DRM drivers includes the legacy GPIO headers
> <linux/gpio.h> and <linux/of_gpio.h> but what it really
> uses is <linux/gpio/consumer.h> since only gpio_desc
> structs are ever referenced.
> 
> Include the right header on the top level tegra/drm.h
> file and drop all the surplus includes.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Hm, I wonder whether we should do similar splits for drm_bridge and
drm_panel, so that drivers don't pick the wrong interfaces ...

Anyway this looks neat, I spent a bit of time looking at how this is done,
fwiw (not much) and assuming it compiles:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/tegra/dpaux.c | 2 --
>  drivers/gpu/drm/tegra/drm.h   | 2 +-
>  drivers/gpu/drm/tegra/hdmi.c  | 1 -
>  drivers/gpu/drm/tegra/sor.c   | 1 -
>  4 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index 7dfb50f65067..105fb9cdbb3b 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -5,12 +5,10 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> -#include <linux/gpio.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> -#include <linux/of_gpio.h>
>  #include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinmux.h>
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> index ed99b67deb29..bf0512177e8f 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -9,7 +9,7 @@
>  
>  #include <linux/host1x.h>
>  #include <linux/iova.h>
> -#include <linux/of_gpio.h>
> +#include <linux/gpio/consumer.h>
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_edid.h>
> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> index 38252c0f068d..94fb0193fa3d 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -7,7 +7,6 @@
>  #include <linux/clk.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
> -#include <linux/gpio.h>
>  #include <linux/hdmi.h>
>  #include <linux/math64.h>
>  #include <linux/module.h>
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 81226a4953c1..b010826e86da 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -6,7 +6,6 @@
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/debugfs.h>
> -#include <linux/gpio.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> -- 
> 2.25.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05A68C1939
	for <lists+linux-tegra@lfdr.de>; Sun, 29 Sep 2019 21:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729098AbfI2Txd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 29 Sep 2019 15:53:33 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46527 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728755AbfI2Txd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 29 Sep 2019 15:53:33 -0400
Received: by mail-lj1-f195.google.com with SMTP id d1so7211579ljl.13
        for <linux-tegra@vger.kernel.org>; Sun, 29 Sep 2019 12:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W7zlmLnqflzMuImuGywOpRjtBgvUKXG365Da50lzcQ4=;
        b=YjYCKNYjwjy7YGliAeN3wHzz6op+udBja2SoSnwxOBMv+5C8nvRDy6NmzIhXL7BVTM
         o4BtaVpXhfv2/s/30+LYa0KzZikmq4A6r8vzZEBZ5UcOhk0SXKoa8GqrC0fj+4r6h+gz
         zXOhXfoY1Vj0BnCPY5zphcQWAPeUqOfqMFTeYxYDDLqVepL2otWytY67r5vFakA2jUqW
         nVR4Cby3aeHg2f5LcG4zhLzXDDsnDiR5XS8C9a0RvdpjPH0c1rJxvdU0cuLdNhlxRu0d
         y1EMlJ0SG7rN35D79UkG69w4tZl7LjVdKx35xZtjPGMK6zczV9yNPCrrC/USBiKpnK3V
         5CgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W7zlmLnqflzMuImuGywOpRjtBgvUKXG365Da50lzcQ4=;
        b=Z9SHrz6UllhRb0aFsyvWCIHFFplULVBMYAvRlI6h+0Ldye3PGSI8E44TpZBdbO9Pks
         NdH+6b2Dr6aysgrBHFzoXOK+V7Zj4tOh95N+jkysOrwshgONd7QaeuDAoxA7OBQtsZpa
         dFQJlMAYpHk2EVXsXWV/NQt/Mj24TkN5jnhvxqNZwXjTloCWvtzCJtcsS1HHNb/J9feR
         dLQZd9SUPXPi3AD7BniwbyX1zakf4nt6WV9BI87I2/v/5fkeiuGbzlIPHP5v0CcX6EE6
         10Zks1gF1wWj4FEZhfxTmsCR8CR7uICOp33YDTLGMpu0E0fVTovbuAMfan5s4Jcmjzfb
         /qpg==
X-Gm-Message-State: APjAAAXp5sA+p3qCGKcxyruzfxYmr4/HWuQsqBRo+oXa0wh9ti765wBW
        przc4lIhAdWWsdVYZ5FDRLc=
X-Google-Smtp-Source: APXvYqx0NwxTwpOpvSq7LIWowUj7dA0Mp8aKj8CBHdzJ8zBzsypi+wQa6FdQQfVilTTp7Hc3fvK5IA==
X-Received: by 2002:a2e:86d5:: with SMTP id n21mr6664854ljj.1.1569786811041;
        Sun, 29 Sep 2019 12:53:31 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-32-67.pppoe.spdop.ru. [94.29.32.67])
        by smtp.googlemail.com with ESMTPSA id j17sm2481949lfb.11.2019.09.29.12.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Sep 2019 12:53:30 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: Fix ordering of cleanup code
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20190925112659.2048-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b74304ef-de09-8c16-3178-b8bd439bff84@gmail.com>
Date:   Sun, 29 Sep 2019 22:53:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190925112659.2048-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.09.2019 14:26, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Commit Fixes: b9f8b09ce256 ("drm/tegra: Setup shared IOMMU domain after
> initialization") changed the initialization order of the IOMMU related
> bits but didn't update the cleanup path accordingly. This asymmetry can
> cause failures during error recovery.
> 
> Fixes: b9f8b09ce256 ("drm/tegra: Setup shared IOMMU domain after initialization")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 6fb7d74ff553..bc7cc32140f8 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -201,19 +201,19 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
>  	if (tegra->hub)
>  		tegra_display_hub_cleanup(tegra->hub);
>  device:
> -	host1x_device_exit(device);
> -fbdev:
> -	drm_kms_helper_poll_fini(drm);
> -	tegra_drm_fb_free(drm);
> -config:
> -	drm_mode_config_cleanup(drm);
> -
>  	if (tegra->domain) {
>  		mutex_destroy(&tegra->mm_lock);
>  		drm_mm_takedown(&tegra->mm);
>  		put_iova_domain(&tegra->carveout.domain);
>  		iova_cache_put();
>  	}
> +
> +	host1x_device_exit(device);
> +fbdev:
> +	drm_kms_helper_poll_fini(drm);
> +	tegra_drm_fb_free(drm);
> +config:
> +	drm_mode_config_cleanup(drm);
>  domain:
>  	if (tegra->domain)
>  		iommu_domain_free(tegra->domain);
> 

Hello Thierry,

Good that you spotted this! I had a similar patch sometime ago, but my
version had some problem and then I just forgot about it. I tried yours
patch and didn't notice anything wrong, thanks!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>

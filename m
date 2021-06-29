Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B303B76D9
	for <lists+linux-tegra@lfdr.de>; Tue, 29 Jun 2021 19:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbhF2RGM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 29 Jun 2021 13:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232231AbhF2RGL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Jun 2021 13:06:11 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4C4C061767
        for <linux-tegra@vger.kernel.org>; Tue, 29 Jun 2021 10:03:44 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id m18so76766wrv.2
        for <linux-tegra@vger.kernel.org>; Tue, 29 Jun 2021 10:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1mzwo7wjAUa0IJEbXNRwxkpgdnTr5r+kaQt26hfpS9Q=;
        b=QmmxT28DkHNzpao9vOpgiqd/+dJLsDibGQbrStNZ7JbAn0dorBqHkDj0WWKEfZk7OQ
         FNxBzNYYbYzgKsCZ0j18iEU1KtSxaIL4Fyk8uM4HCQ67154O4rhEmH9kLiuRXoOrC5q7
         S624F07BLgYEYsvGXAHARz0QA4dg1CTiaNym2G/4ZRiWeANMPe2N15L3MveDp/WgRSYk
         IJA2nKKslgAsYg8dbGq8sMAXlDTQQYlDUbjGPAMWzEYVYvDRIOTDYXncAhpesbhqxL40
         4Pb94hp2YdPRJ2JAMke+tMLiLTqa8JIZadNCDJ75yRoh9swK/MMMGXHQQBoAwR42SkSD
         djPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1mzwo7wjAUa0IJEbXNRwxkpgdnTr5r+kaQt26hfpS9Q=;
        b=fb6F/Tkt2uzpUZ9Iytt7y/RKJbuO37VKFR3vfJyeWiZvbCCjQm4fN0kXVZSaDrrj2p
         lkEjuNxYQ9sfHPVqrGUHZAaxasQt58truWdikY6cAwib3etL5EKGv2XdluHIwn0+eGed
         DPIb3mPvjeClFKeo8p6QwNfk9EaCLnWGZ8z02AoJbF1/KsGoYb6BaG8mZ4+rqERVUmEZ
         1Lm5iMe5uOOTVA2QQATHdmn7QyVoMsl0EJjUvT9ZlC+CA3Kif/cAI7RTeHwf5YtHNJPK
         u9DR0JZRo/d3bYxIDqbjKWUhL5bBfoQxmiDq+VjuF3+nMPi2wDui6vEDx/UoKB/AuJEy
         6vbg==
X-Gm-Message-State: AOAM530VG5CijttkKxu/UEJQ/786Fy2lwzmLCIqTI//AbNWiXYEBlPIx
        83DlZu+mBSCpea7G5MDjbjQMpw==
X-Google-Smtp-Source: ABdhPJw9BHdV2PhR+4EY9fQcITZ83GZhxsD5N3hVP1Z53THaNgNupwsLwr8mtFaReraEAQtYUI3qaQ==
X-Received: by 2002:adf:ff8e:: with SMTP id j14mr34485328wrr.374.1624986222594;
        Tue, 29 Jun 2021 10:03:42 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:9ed5:b63d:622c:fb4e? ([2001:861:44c0:66c0:9ed5:b63d:622c:fb4e])
        by smtp.gmail.com with ESMTPSA id h10sm3399285wmb.40.2021.06.29.10.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jun 2021 10:03:37 -0700 (PDT)
Subject: Re: [PATCH] drm/aperture: Pass DRM driver structure instead of driver
 name
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@redhat.com
Cc:     linux-hyperv@vger.kernel.org, nouveau@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
        spice-devel@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org, freedreno@lists.freedesktop.org,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20210629135833.22679-1-tzimmermann@suse.de>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <32c2b8f1-e8e5-c161-ed87-f80190173552@baylibre.com>
Date:   Tue, 29 Jun 2021 19:03:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629135833.22679-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On 29/06/2021 15:58, Thomas Zimmermann wrote:
> Print the name of the DRM driver when taking over fbdev devices. Makes
> the output to dmesg more consistent. Note that the driver name is only
> used for printing a string to the kernel log. No UAPI is affected by this
> change.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

...

>  drivers/gpu/drm/meson/meson_drv.c             |  2 +-

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

...

>  
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index a7388bf7c838..3d0ccc7eef1b 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -285,7 +285,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  	 * Remove early framebuffers (ie. simplefb). The framebuffer can be
>  	 * located anywhere in RAM
>  	 */
> -	ret = drm_aperture_remove_framebuffers(false, "meson-drm-fb");
> +	ret = drm_aperture_remove_framebuffers(false, &meson_driver);
>  	if (ret)
>  		goto free_drm;
>  

...

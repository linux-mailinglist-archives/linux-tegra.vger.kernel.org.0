Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4771FB8A9
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 17:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732551AbgFPP5z (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 11:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733002AbgFPPyj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 11:54:39 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848FDC0613EE
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 08:54:38 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q19so24213278lji.2
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 08:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BwPR5JNs/q9Egd57RYRsGFErs0pzw9dkx/+kfWRalPo=;
        b=gzzirRpTPCq5Ny76s3yb9d3m8QffquYAtuj5mbGMtdGp6LEw5TVXUhQ8kyJHFRuq7j
         +xtd94IEK7jV9DzUEz12b7pGxV+er0UIMBXrHj7LN2kNwX3TsEL1pWjDEms5IL3Ff8i8
         PpG0Wa4IFPkfQY8xU011oQQ0MO0wdT6kz1zpI0zPr4juMvY1WQ+suKyE899tuLrliwxT
         CC/JnJc1MbujFF6durjOfKQRiTS9DR6H61u5qGBcP0aOm1/kZt6ITT+/p67m/9bpfO7j
         OWr/sp12EjviRVtNj/n8m+B1d8S8RIOx/p2TL6091tdgXLsKXW+K0yR5ARMhtRo66Xx7
         bTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BwPR5JNs/q9Egd57RYRsGFErs0pzw9dkx/+kfWRalPo=;
        b=ebx8iFlWp20vUXWrnfg6OjeLhQbkacHJRagOnZSzN7EZr0fvHzbaARtvzn3Q73I6R/
         uOJHcHu4v+3zjHLQN09um+yADUXGbfIiiwlWvj9jJRZDNZXNIfto5Vi5eHeR+jELVglv
         PFOXsHLkTW64v/Rvuw2u1PHgB9unKfW5tN7iAoDOpjJw9CeReUxyKgWeWU2pR77TTHz/
         Tt3qm0PWGcQlJxY9flsdjyvk5g/WXJbvn4DA6K+uvVj4NzcXFbA9fmuyf8D0aEM3ssKO
         jkJrL+STU6fet5jOC8uE4vgVLPFv+j6MScfX0iQwkKT2Yk8FEcV9hECYC93bcPJoiKSO
         kMMg==
X-Gm-Message-State: AOAM5323UMc+WtP4XLFBirzA+2EZ+Csco9/GGA5JwReK5CAnhN5wZ3wg
        tydhdYXOPBz8CCX8eOGfSm8XxHvp
X-Google-Smtp-Source: ABdhPJyWXA4jpmvQMSBu85gdPskFjHd8t0vKD51B0L0bmgUnzBtySLDikzSYzj76TgqKFV57cR55Vw==
X-Received: by 2002:a2e:b0fa:: with SMTP id h26mr1723066ljl.148.1592322876724;
        Tue, 16 Jun 2020 08:54:36 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id w24sm4468518ljd.14.2020.06.16.08.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 08:54:35 -0700 (PDT)
Subject: Re: [PATCH v2] drm/tegra: Add zpos property for cursor planes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Daniel Stone <daniel@fooishbar.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20200616121713.2983627-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c34c97ab-08de-341e-05e5-77e2651d956f@gmail.com>
Date:   Tue, 16 Jun 2020 18:54:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200616121713.2983627-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.06.2020 15:17, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
> have a zpos property") a warning is emitted if there's a mix of planes
> with and without a zpos property.
> 
> On Tegra, cursor planes are always composited on top of all other
> planes, which is why they never had a zpos property attached to them.
> However, since the composition order is fixed, this is trivial to
> remedy by simply attaching an immutable zpos property to them.
> 
> Changes in v2:
> - hardcode cursor plane zpos to 255 instead of 0 (Ville)
> 
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/dc.c  | 9 +++++++--
>  drivers/gpu/drm/tegra/hub.c | 2 +-
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 83f31c6e891c..85408eed4685 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -787,7 +787,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
>  	}
>  
>  	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
> -	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
> +	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 254);
>  
>  	err = drm_plane_create_rotation_property(&plane->base,
>  						 DRM_MODE_ROTATE_0,
> @@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
>  	}
>  
>  	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
> +	drm_plane_create_zpos_immutable_property(&plane->base, 255);
>  
>  	return &plane->base;
>  }
> @@ -1074,7 +1075,11 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
>  	}
>  
>  	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
> -	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
> +
> +	if (!cursor)
> +		drm_plane_create_zpos_property(&plane->base, plane->index, 0, 254);
> +	else
> +		drm_plane_create_zpos_immutable_property(&plane->base, 255);

On T20/30 we're are setting the plane's type to CURSOR because we want
to use one overlay plane for the mouse cursor. Nevertheless, it's still
a generic overlay plane that can change its z-position, and thus, it's
wrong to make zpos immutable here.

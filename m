Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B0E202350
	for <lists+linux-tegra@lfdr.de>; Sat, 20 Jun 2020 13:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728013AbgFTLVj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 20 Jun 2020 07:21:39 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:51528 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbgFTLVi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 20 Jun 2020 07:21:38 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 39A458053F;
        Sat, 20 Jun 2020 13:21:34 +0200 (CEST)
Date:   Sat, 20 Jun 2020 13:21:32 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 7/7] drm/panel-simple: Add missing connector type for
 some panels
Message-ID: <20200620112132.GB16901@ravnborg.org>
References: <20200617222703.17080-1-digetx@gmail.com>
 <20200617222703.17080-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617222703.17080-8-digetx@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
        a=weqEaMSWHVjOYctd_rUA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry

On Thu, Jun 18, 2020 at 01:27:03AM +0300, Dmitry Osipenko wrote:
> The DRM panel bridge core requires connector type to be set up properly,
> otherwise it rejects the panel. The missing connector type problem popped
> up while I was trying to wrap CLAA070WP03XG panel into a DRM bridge in
> order to test whether panel's rotation property work properly using
> panel-simple driver on NVIDIA Tegra30 Nexus 7 tablet device, which uses
> CLAA070WP03XG display panel.
> 
> The NVIDIA Tegra DRM driver recently gained DRM bridges support for the
> RGB output and now driver wraps directly-connected panels into DRM bridge.
> Hence all panels should have connector type set properly now, otherwise
> the panel's wrapping fails.
> 
> This patch adds missing connector types for the LVDS panels that are found
> on NVIDIA Tegra devices:
> 
>   1. AUO B101AW03
>   2. Chunghwa CLAA070WP03XG
>   3. Chunghwa CLAA101WA01A
>   4. Chunghwa CLAA101WB01
>   5. EDT ET057090DHU
>   6. Innolux N156BGE L21
>   7. Samsung LTN101NT05
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Very good to have this fixed.
I went ahead and pushed this commit to drm-misc-next as it is really
independent from the rest of the series.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 6764ac630e22..9eb2dbb7bfa6 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -687,6 +687,7 @@ static const struct panel_desc auo_b101aw03 = {
>  		.width = 223,
>  		.height = 125,
>  	},
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
>  static const struct display_timing auo_b101ean01_timing = {
> @@ -1340,6 +1341,7 @@ static const struct panel_desc chunghwa_claa070wp03xg = {
>  		.width = 94,
>  		.height = 150,
>  	},
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
>  static const struct drm_display_mode chunghwa_claa101wa01a_mode = {
> @@ -1362,6 +1364,7 @@ static const struct panel_desc chunghwa_claa101wa01a = {
>  		.width = 220,
>  		.height = 120,
>  	},
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
>  static const struct drm_display_mode chunghwa_claa101wb01_mode = {
> @@ -1384,6 +1387,7 @@ static const struct panel_desc chunghwa_claa101wb01 = {
>  		.width = 223,
>  		.height = 125,
>  	},
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
>  static const struct drm_display_mode dataimage_scf0700c48ggu18_mode = {
> @@ -1573,6 +1577,7 @@ static const struct panel_desc edt_et057090dhu = {
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
>  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
>  static const struct drm_display_mode edt_etm0700g0dh6_mode = {
> @@ -2055,6 +2060,7 @@ static const struct panel_desc innolux_n156bge_l21 = {
>  		.width = 344,
>  		.height = 193,
>  	},
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
>  static const struct drm_display_mode innolux_p120zdg_bf1_mode = {
> @@ -3001,6 +3007,7 @@ static const struct panel_desc samsung_ltn101nt05 = {
>  		.width = 223,
>  		.height = 125,
>  	},
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
>  static const struct drm_display_mode samsung_ltn140at29_301_mode = {
> -- 
> 2.26.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

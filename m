Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F174D817A9
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Aug 2019 12:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbfHEK4w (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Aug 2019 06:56:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51416 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfHEK4w (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Aug 2019 06:56:52 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5F032F9;
        Mon,  5 Aug 2019 12:56:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565002609;
        bh=nisUIk5L2tjJD15aLfwBsmDwP/QvwsSaKKmQVHAH03Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DvfNSMsq9Iz0RSwd24A/p89jCmKQ/1WhEHui6UQFf0FmiuolkRgjJT1onBjHZcSvh
         oflCXD0nj+c/zQiVLayDOq4tm6eIeDOMhUCaJ1X7HVDwJsVexhwYAZeYr20JNNZny7
         Fc+8ZcDaBMGp3zyq7PONluW7eDNtNgQbtDMYivjY=
Date:   Mon, 5 Aug 2019 13:56:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Alison Wang <alison.wang@nxp.com>,
        Allison Randal <allison@lohutok.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Enrico Weigelt <info@metux.net>,
        Fabio Estevam <festevam@gmail.com>,
        Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marek Vasut <marex@denx.de>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincent Abriou <vincent.abriou@st.com>
Subject: Re: [PATCH v1 13/16] drm/panel: drop return code from
 drm_panel_detach()
Message-ID: <20190805105647.GH29747@pendragon.ideasonboard.com>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-14-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-14-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Sun, Aug 04, 2019 at 10:16:34PM +0200, Sam Ravnborg wrote:
> There are no errors that can be reported by this function,
> so drop the return code.
> Fix the only bridge driver that checked the return result.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 3 +--
>  drivers/gpu/drm/drm_panel.c                        | 6 +-----
>  include/drm/drm_panel.h                            | 2 +-
>  3 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index f2f7f69d6cc3..22885dceaa17 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1780,8 +1780,7 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
>  	if (dp->plat_data->panel) {
>  		if (drm_panel_unprepare(dp->plat_data->panel))
>  			DRM_ERROR("failed to turnoff the panel\n");
> -		if (drm_panel_detach(dp->plat_data->panel))
> -			DRM_ERROR("failed to detach the panel\n");
> +		drm_panel_detach(dp->plat_data->panel);
>  	}
>  
>  	drm_dp_aux_unregister(&dp->aux);
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 9946b8d9bacc..da19d5b4a2f4 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -219,15 +219,11 @@ EXPORT_SYMBOL(drm_panel_attach);
>   *
>   * This function should not be called by the panel device itself. It
>   * is only for the drm device that called drm_panel_attach().
> - *
> - * Return: 0 on success or a negative error code on failure.
>   */
> -int drm_panel_detach(struct drm_panel *panel)
> +void drm_panel_detach(struct drm_panel *panel)
>  {
>  	panel->connector = NULL;
>  	panel->drm = NULL;
> -
> -	return 0;
>  }
>  EXPORT_SYMBOL(drm_panel_detach);
>  
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 5e62deea49ba..624bd15ecfab 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -153,7 +153,7 @@ int drm_panel_add(struct drm_panel *panel);
>  void drm_panel_remove(struct drm_panel *panel);
>  
>  int drm_panel_attach(struct drm_panel *panel, struct drm_connector *connector);
> -int drm_panel_detach(struct drm_panel *panel);
> +void drm_panel_detach(struct drm_panel *panel);
>  
>  int drm_panel_prepare(struct drm_panel *panel);
>  int drm_panel_unprepare(struct drm_panel *panel);

-- 
Regards,

Laurent Pinchart

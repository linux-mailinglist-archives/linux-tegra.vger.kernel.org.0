Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C842D817B5
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Aug 2019 12:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbfHEK7d (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Aug 2019 06:59:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51492 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfHEK7d (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Aug 2019 06:59:33 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5EF02F9;
        Mon,  5 Aug 2019 12:59:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565002769;
        bh=ARbvDmu/mBI7c7RZcT5zH3TBI3qsqJ0Vjc6Kj8MQeEc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bzG0gADiIV8BDeHLoa9Kj9zUWn2mS5xhEnGk8ww5Zw5YmaTPgbxnpI/mRbrnCerJI
         QvPFax2dQhbSESR8dqmTYt0v0EA3QS3neJcCJF3XQ1ha+Ozf4yS3hCmqCCdlL/C1Og
         XQQIK/ulpNLVSMxGTf5Eu5gPH4tD47qshkiq8R9g=
Date:   Mon, 5 Aug 2019 13:59:28 +0300
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
Subject: Re: [PATCH v1 14/16] drm/panel: call prepare/enable only once
Message-ID: <20190805105928.GI29747@pendragon.ideasonboard.com>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-15-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-15-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Sun, Aug 04, 2019 at 10:16:35PM +0200, Sam Ravnborg wrote:
> Many panel drivers duplicate logic to prevent prepare to be called
> for a panel that is already prepared.
> Likewise for enable.
> 
> Implement this logic in drm_panel so the individual drivers
> no longer needs this.
> A panel is considered prepared/enabled only if the prepare/enable call
> succeeds.
> For disable/unprepare it is unconditionally considered
> disabled/unprepared.
> 
> This allows calls to prepare/enable again, even if there were
> some issue disabling a regulator or similar during disable/unprepare.

Is this the right place to handle this ? Shouldn't the upper layers
ensure than enable/disable and prepare/unprepare are correcty balanced,
and not called multiple times ? Adding enabled and prepared state to
drm_panel not only doesn't align well with atomic state handling, but
also would hide issues in upper layers that should really be fixed
there.

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_panel.c | 66 ++++++++++++++++++++++++++++++-------
>  include/drm/drm_panel.h     | 21 ++++++++++++
>  2 files changed, 75 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index da19d5b4a2f4..0853764040de 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -66,10 +66,21 @@ EXPORT_SYMBOL(drm_panel_init);
>   */
>  int drm_panel_prepare(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->prepare)
> -		return panel->funcs->prepare(panel);
> +	int ret = -ENOSYS;
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (panel->prepared)
> +		return 0;
> +
> +	if (panel->funcs && panel->funcs->prepare)
> +		ret = panel->funcs->prepare(panel);
> +
> +	if (ret >= 0)
> +		panel->prepared = true;
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_panel_prepare);
>  
> @@ -85,10 +96,21 @@ EXPORT_SYMBOL(drm_panel_prepare);
>   */
>  int drm_panel_enable(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->enable)
> -		return panel->funcs->enable(panel);
> +	int ret = -ENOSYS;
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (panel->enabled)
> +		return 0;
> +
> +	if (panel->funcs && panel->funcs->enable)
> +		ret = panel->funcs->enable(panel);
> +
> +	if (ret >= 0)
> +		panel->enabled = true;
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_panel_enable);
>  
> @@ -104,10 +126,20 @@ EXPORT_SYMBOL(drm_panel_enable);
>   */
>  int drm_panel_disable(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->disable)
> -		return panel->funcs->disable(panel);
> +	int ret = -ENOSYS;
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (!panel->enabled)
> +		return 0;
> +
> +	if (panel->funcs && panel->funcs->disable)
> +		ret = panel->funcs->disable(panel);
> +
> +	panel->enabled = false;
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_panel_disable);
>  
> @@ -124,10 +156,20 @@ EXPORT_SYMBOL(drm_panel_disable);
>   */
>  int drm_panel_unprepare(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->unprepare)
> -		return panel->funcs->unprepare(panel);
> +	int ret = -ENOSYS;
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (!panel->prepared)
> +		return 0;
> +
> +	if (panel->funcs && panel->funcs->unprepare)
> +		ret = panel->funcs->unprepare(panel);
> +
> +	panel->prepared = false;
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_panel_unprepare);
>  
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 624bd15ecfab..7493500fc9bd 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -65,6 +65,9 @@ struct drm_panel_funcs {
>  	 * @prepare:
>  	 *
>  	 * Turn on panel and perform set up.
> +	 * When the panel is successfully prepared the prepare() function
> +	 * will not be called again until the panel has been unprepared.
> +	 *
>  	 */
>  	int (*prepare)(struct drm_panel *panel);
>  
> @@ -72,6 +75,8 @@ struct drm_panel_funcs {
>  	 * @enable:
>  	 *
>  	 * Enable panel (turn on back light, etc.).
> +	 * When the panel is successfully enabled the enable() function
> +	 * will not be called again until the panel has been disabled.
>  	 */
>  	int (*enable)(struct drm_panel *panel);
>  
> @@ -79,6 +84,7 @@ struct drm_panel_funcs {
>  	 * @disable:
>  	 *
>  	 * Disable panel (turn off back light, etc.).
> +	 * If the panel is already disabled the disable() function is not called.
>  	 */
>  	int (*disable)(struct drm_panel *panel);
>  
> @@ -86,6 +92,7 @@ struct drm_panel_funcs {
>  	 * @unprepare:
>  	 *
>  	 * Turn off panel.
> +	 * If the panel is already unprepared the unprepare() function is not called.
>  	 */
>  	int (*unprepare)(struct drm_panel *panel);
>  
> @@ -145,6 +152,20 @@ struct drm_panel {
>  	 * Panel entry in registry.
>  	 */
>  	struct list_head list;
> +
> +	/**
> +	 * @prepared:
> +	 *
> +	 * Set to true when the panel is successfully prepared.
> +	 */
> +	bool prepared;
> +
> +	/**
> +	 * @enabled:
> +	 *
> +	 * Set to true when the panel is successfully enabled.
> +	 */
> +	bool enabled;
>  };
>  
>  void drm_panel_init(struct drm_panel *panel);

-- 
Regards,

Laurent Pinchart

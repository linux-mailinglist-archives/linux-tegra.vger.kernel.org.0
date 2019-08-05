Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E169F8174B
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Aug 2019 12:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbfHEKpW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Aug 2019 06:45:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51192 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727739AbfHEKpW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Aug 2019 06:45:22 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78CCA2F9;
        Mon,  5 Aug 2019 12:45:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565001917;
        bh=g7Pp29Mgg/gZ2YsNt1ThUlqv1p+7aPpCapxhy4OXn+w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nBxG6lfmjq8e2op+WOyy21pYLWM+0AUNucYtwffECcWzYEZUa11K2zfn7wlxuia2W
         Lgzn3KjgPSzMabMcxeBYz8juvhZfEQOeWUFfF1Epq83f0jUtL8WyGslw/+3Sy7Pp8/
         dZD+0OAwIrFaKPWXpABtCoHloEh9j7+KGiN0ez3Y=
Date:   Mon, 5 Aug 2019 13:45:15 +0300
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
Subject: Re: [PATCH v1 11/16] drm/panel: move drm_panel functions to .c file
Message-ID: <20190805104515.GF29747@pendragon.ideasonboard.com>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-12-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-12-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Sun, Aug 04, 2019 at 10:16:32PM +0200, Sam Ravnborg wrote:
> Move inline functions from include/drm/drm_panel.h to drm_panel.c.
> This is in preparation for follow-up patches that will add extra
> logic to the functions.
> As they are no longer static inline, EXPORT them.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_panel.c | 96 +++++++++++++++++++++++++++++++++++
>  include/drm/drm_panel.h     | 99 +++----------------------------------
>  2 files changed, 104 insertions(+), 91 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index dbd5b873e8f2..9946b8d9bacc 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -54,6 +54,102 @@ void drm_panel_init(struct drm_panel *panel)
>  }
>  EXPORT_SYMBOL(drm_panel_init);
>  
> +/**
> + * drm_panel_prepare - power on a panel
> + * @panel: DRM panel
> + *
> + * Calling this function will enable power and deassert any reset signals to
> + * the panel. After this has completed it is possible to communicate with any
> + * integrated circuitry via a command bus.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int drm_panel_prepare(struct drm_panel *panel)
> +{
> +	if (panel && panel->funcs && panel->funcs->prepare)
> +		return panel->funcs->prepare(panel);
> +
> +	return panel ? -ENOSYS : -EINVAL;
> +}
> +EXPORT_SYMBOL(drm_panel_prepare);
> +
> +/**
> + * drm_panel_enable - enable a panel
> + * @panel: DRM panel
> + *
> + * Calling this function will cause the panel display drivers to be turned on
> + * and the backlight to be enabled. Content will be visible on screen after
> + * this call completes.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int drm_panel_enable(struct drm_panel *panel)
> +{
> +	if (panel && panel->funcs && panel->funcs->enable)
> +		return panel->funcs->enable(panel);
> +
> +	return panel ? -ENOSYS : -EINVAL;
> +}
> +EXPORT_SYMBOL(drm_panel_enable);
> +
> +/**
> + * drm_panel_disable - disable a panel
> + * @panel: DRM panel
> + *
> + * This will typically turn off the panel's backlight or disable the display
> + * drivers. For smart panels it should still be possible to communicate with
> + * the integrated circuitry via any command bus after this call.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int drm_panel_disable(struct drm_panel *panel)
> +{
> +	if (panel && panel->funcs && panel->funcs->disable)
> +		return panel->funcs->disable(panel);
> +
> +	return panel ? -ENOSYS : -EINVAL;
> +}
> +EXPORT_SYMBOL(drm_panel_disable);
> +
> +/**
> + * drm_panel_unprepare - power off a panel
> + * @panel: DRM panel
> + *
> + * Calling this function will completely power off a panel (assert the panel's
> + * reset, turn off power supplies, ...). After this function has completed, it
> + * is usually no longer possible to communicate with the panel until another
> + * call to drm_panel_prepare().
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int drm_panel_unprepare(struct drm_panel *panel)
> +{
> +	if (panel && panel->funcs && panel->funcs->unprepare)
> +		return panel->funcs->unprepare(panel);
> +
> +	return panel ? -ENOSYS : -EINVAL;
> +}
> +EXPORT_SYMBOL(drm_panel_unprepare);
> +
> +/**
> + * drm_panel_get_modes - probe the available display modes of a panel
> + * @panel: DRM panel
> + *
> + * The modes probed from the panel are automatically added to the connector
> + * that the panel is attached to.
> + *
> + * Return: The number of modes available from the panel on success or a
> + * negative error code on failure.
> + */
> +int drm_panel_get_modes(struct drm_panel *panel)
> +{
> +	if (panel && panel->funcs && panel->funcs->get_modes)
> +		return panel->funcs->get_modes(panel);
> +
> +	return panel ? -ENOSYS : -EINVAL;
> +}
> +EXPORT_SYMBOL(drm_panel_get_modes);
> +
>  /**
>   * drm_panel_add - add a panel to the global registry
>   * @panel: panel to add
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 26377836141c..053d611656b9 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -97,97 +97,6 @@ struct drm_panel {
>  	struct list_head list;
>  };
>  
> -/**
> - * drm_disable_unprepare - power off a panel
> - * @panel: DRM panel
> - *
> - * Calling this function will completely power off a panel (assert the panel's
> - * reset, turn off power supplies, ...). After this function has completed, it
> - * is usually no longer possible to communicate with the panel until another
> - * call to drm_panel_prepare().
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -static inline int drm_panel_unprepare(struct drm_panel *panel)
> -{
> -	if (panel && panel->funcs && panel->funcs->unprepare)
> -		return panel->funcs->unprepare(panel);
> -
> -	return panel ? -ENOSYS : -EINVAL;
> -}
> -
> -/**
> - * drm_panel_disable - disable a panel
> - * @panel: DRM panel
> - *
> - * This will typically turn off the panel's backlight or disable the display
> - * drivers. For smart panels it should still be possible to communicate with
> - * the integrated circuitry via any command bus after this call.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -static inline int drm_panel_disable(struct drm_panel *panel)
> -{
> -	if (panel && panel->funcs && panel->funcs->disable)
> -		return panel->funcs->disable(panel);
> -
> -	return panel ? -ENOSYS : -EINVAL;
> -}
> -
> -/**
> - * drm_panel_prepare - power on a panel
> - * @panel: DRM panel
> - *
> - * Calling this function will enable power and deassert any reset signals to
> - * the panel. After this has completed it is possible to communicate with any
> - * integrated circuitry via a command bus.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -static inline int drm_panel_prepare(struct drm_panel *panel)
> -{
> -	if (panel && panel->funcs && panel->funcs->prepare)
> -		return panel->funcs->prepare(panel);
> -
> -	return panel ? -ENOSYS : -EINVAL;
> -}
> -
> -/**
> - * drm_panel_enable - enable a panel
> - * @panel: DRM panel
> - *
> - * Calling this function will cause the panel display drivers to be turned on
> - * and the backlight to be enabled. Content will be visible on screen after
> - * this call completes.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -static inline int drm_panel_enable(struct drm_panel *panel)
> -{
> -	if (panel && panel->funcs && panel->funcs->enable)
> -		return panel->funcs->enable(panel);
> -
> -	return panel ? -ENOSYS : -EINVAL;
> -}
> -
> -/**
> - * drm_panel_get_modes - probe the available display modes of a panel
> - * @panel: DRM panel
> - *
> - * The modes probed from the panel are automatically added to the connector
> - * that the panel is attached to.
> - *
> - * Return: The number of modes available from the panel on success or a
> - * negative error code on failure.
> - */
> -static inline int drm_panel_get_modes(struct drm_panel *panel)
> -{
> -	if (panel && panel->funcs && panel->funcs->get_modes)
> -		return panel->funcs->get_modes(panel);
> -
> -	return panel ? -ENOSYS : -EINVAL;
> -}
> -
>  void drm_panel_init(struct drm_panel *panel);
>  
>  int drm_panel_add(struct drm_panel *panel);
> @@ -196,6 +105,14 @@ void drm_panel_remove(struct drm_panel *panel);
>  int drm_panel_attach(struct drm_panel *panel, struct drm_connector *connector);
>  int drm_panel_detach(struct drm_panel *panel);
>  
> +int drm_panel_prepare(struct drm_panel *panel);
> +int drm_panel_unprepare(struct drm_panel *panel);
> +
> +int drm_panel_enable(struct drm_panel *panel);
> +int drm_panel_disable(struct drm_panel *panel);

Nitpicking, I would keep the order of the declarations aligned with the
definitions. prepare - enable - disable - unprepare and prepare -
unprepare - enable - disable are both fine with me, as long as they're
consistent.

Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +int drm_panel_get_modes(struct drm_panel *panel);
> +
>  #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL)
>  struct drm_panel *of_drm_find_panel(const struct device_node *np);
>  #else

-- 
Regards,

Laurent Pinchart

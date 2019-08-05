Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85A20817CD
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Aug 2019 13:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbfHELEh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Aug 2019 07:04:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51586 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfHELEh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Aug 2019 07:04:37 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87C3C2F9;
        Mon,  5 Aug 2019 13:04:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565003074;
        bh=8VWmeKAi+VQmMmX5OgERLSe/ebFgda0ImZi18qt+/lw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I4bCAk7E3hHQYAAekZt6asjHI5GYpU3skG/lyEpBDPe2MY7uV9zFqHd/ryYs08+ax
         3FHMb6fQ73A8yNLXKxmvlR1VuNjv+/3fzD7gAGFyUc2mHZPcxaKcLzp6uRPUvbaEPV
         1l2EYMpteaUJO4KcBixbmm0n3//c0ZIQ2VW5MXE0=
Date:   Mon, 5 Aug 2019 14:04:32 +0300
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
Subject: Re: [PATCH v1 15/16] drm/panel: add backlight support
Message-ID: <20190805110432.GJ29747@pendragon.ideasonboard.com>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-16-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-16-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Sun, Aug 04, 2019 at 10:16:36PM +0200, Sam Ravnborg wrote:
> Panels often supports backlight as specified in a device tree.
> Update the drm_panel infrastructure to support this to
> simplify the drivers.
> 
> With this the panel driver just needs to add the following to the
> probe() function:
> 
>     err = drm_panel_of_backlight(panel);
>     if (err)
>             return err;
> 
> Then drm_panel will handle all the rest.

Do you have an example on how this will simplify drivers ? How many
existing panel drivers would benefit from this, and do you plan to
convert them ?

> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_panel.c | 41 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_panel.h     | 23 +++++++++++++++++++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 0853764040de..d8139674b883 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -21,6 +21,7 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>  
> +#include <linux/backlight.h>
>  #include <linux/err.h>
>  #include <linux/module.h>
>  
> @@ -110,6 +111,7 @@ int drm_panel_enable(struct drm_panel *panel)
>  	if (ret >= 0)
>  		panel->enabled = true;
>  
> +	backlight_enable(panel->backlight);
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_panel_enable);
> @@ -134,6 +136,8 @@ int drm_panel_disable(struct drm_panel *panel)
>  	if (!panel->enabled)
>  		return 0;
>  
> +	backlight_disable(panel->backlight);
> +
>  	if (panel->funcs && panel->funcs->disable)
>  		ret = panel->funcs->disable(panel);
>  
> @@ -308,6 +312,43 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
>  EXPORT_SYMBOL(of_drm_find_panel);
>  #endif
>  
> +#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
> +/**
> + * drm_panel_of_backlight - use backlight device node for backlight
> + * @panel: DRM panel
> + *
> + * Use this function to enable backlight handling if your panel
> + * uses device tree and has a backlight handle.
> + *
> + * When panel is enabled backlight will be enabled after a
> + * successfull call to &drm_panel_funcs.enable()
> + *
> + * When panel is disabled backlight will be disabled before the
> + * call to &drm_panel_funcs.disable().
> + *
> + * A typical implementation for a panel driver supporting device tree
> + * will call this function and then backlight just works.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int drm_panel_of_backlight(struct drm_panel *panel)
> +{
> +	struct backlight_device *backlight;
> +
> +	if (!panel || !panel->dev)
> +		return -EINVAL;
> +
> +	backlight = devm_of_find_backlight(panel->dev);
> +
> +	if (IS_ERR(backlight))
> +                return PTR_ERR(backlight);
> +
> +	panel->backlight = backlight;
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_panel_of_backlight);
> +#endif
> +
>  MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
>  MODULE_DESCRIPTION("DRM panel infrastructure");
>  MODULE_LICENSE("GPL and additional rights");
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 7493500fc9bd..31349c2393b7 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -28,6 +28,7 @@
>  #include <linux/errno.h>
>  #include <linux/list.h>
>  
> +struct backlight_device;
>  struct device_node;
>  struct drm_connector;
>  struct drm_device;
> @@ -59,6 +60,10 @@ struct display_timing;
>   *
>   * To save power when no video data is transmitted, a driver can power down
>   * the panel. This is the job of the .unprepare() function.
> + *
> + * Backlight can be handled automatically if configured using
> + * drm_panel_of_backlight(). Then the driver do not need to implement the
> + * functionality to enable/disable backlight.
>   */
>  struct drm_panel_funcs {
>  	/**
> @@ -139,6 +144,15 @@ struct drm_panel {
>  	 */
>  	struct device *dev;
>  
> +	/**
> +	 * @backlight:
> +	 *
> +	 * Backlight device, used to turn on backlight after
> +	 * the call to enable(), and to turn off
> +	 * backlight before call to disable().
> +	 */
> +	struct backlight_device *backlight;
> +
>  	/**
>  	 * @funcs:
>  	 *
> @@ -193,4 +207,13 @@ static inline struct drm_panel *of_drm_find_panel(const struct device_node *np)
>  }
>  #endif
>  
> +#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) && defined(CONFIG_DRM_PANEL)
> +int drm_panel_of_backlight(struct drm_panel *panel);

I would expect callers of this function to depend on (or select)
CONFIG_DRM_PANEL, so I would drop it from here.

> +#else
> +static inline int drm_panel_of_backlight(struct drm_panel *panel)
> +{
> +	return -EINVAL;

Maybe -ENOSYS ?

> +}
> +#endif
> +
>  #endif

-- 
Regards,

Laurent Pinchart

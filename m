Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1A04817E9
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Aug 2019 13:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbfHELMO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Aug 2019 07:12:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51658 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfHELMO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Aug 2019 07:12:14 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EEB72F9;
        Mon,  5 Aug 2019 13:12:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565003530;
        bh=9oRsbzluvIx+scgB0q5nmoh2+Hfrsu1ybp+awEmQZY8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eoYncRKfcImPqIfTcPR1dT5vdOL9hemgqDnF24i/ui4gdfshnvu+4mqRcdAQe0n66
         c6X81UopU3KaY5I1pvjJmbar1s/WPxSaCImYooIaM2zSFk7hmI0izXPZcQMNPwuty+
         jqej5nQxn4BVSxLv3Gcsv+pHn+fbVjvwXB4yWn1Y=
Date:   Mon, 5 Aug 2019 14:12:08 +0300
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
Subject: Re: [PATCH v1 16/16] drm/panel: simple: use drm_panel infrastructure
Message-ID: <20190805111208.GK29747@pendragon.ideasonboard.com>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-17-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-17-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Sun, Aug 04, 2019 at 10:16:37PM +0200, Sam Ravnborg wrote:
> Use drm_panel infrastrucute:
> - drm_panel has guards for calling disable/enable twice

As stated in the review of the corresponding patch, I think those checks
should be dropped, but not moved to the panel core.

> - drm_panel has backlight support

This answers my first question in the review of 15/16 :-)

> To use the drm_panel infrastructure use the drm_panel_*
> variants for prepare/enable/disable/unprepare.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

The change looks good overall,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

but this is pending an agreement on what to do with the multiple
prepare/enable guards.

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 73 +++++-----------------------
>  1 file changed, 11 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index bff7578f84dd..c7eed34f2c9c 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -21,7 +21,6 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>  
> -#include <linux/backlight.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> @@ -98,13 +97,10 @@ struct panel_desc {
>  
>  struct panel_simple {
>  	struct drm_panel base;
> -	bool prepared;
> -	bool enabled;
>  	bool no_hpd;
>  
>  	const struct panel_desc *desc;
>  
> -	struct backlight_device *backlight;
>  	struct regulator *supply;
>  	struct i2c_adapter *ddc;
>  
> @@ -232,20 +228,9 @@ static int panel_simple_disable(struct drm_panel *panel)
>  {
>  	struct panel_simple *p = to_panel_simple(panel);
>  
> -	if (!p->enabled)
> -		return 0;
> -
> -	if (p->backlight) {
> -		p->backlight->props.power = FB_BLANK_POWERDOWN;
> -		p->backlight->props.state |= BL_CORE_FBBLANK;
> -		backlight_update_status(p->backlight);
> -	}
> -
>  	if (p->desc->delay.disable)
>  		msleep(p->desc->delay.disable);
>  
> -	p->enabled = false;
> -
>  	return 0;
>  }
>  
> @@ -253,9 +238,6 @@ static int panel_simple_unprepare(struct drm_panel *panel)
>  {
>  	struct panel_simple *p = to_panel_simple(panel);
>  
> -	if (!p->prepared)
> -		return 0;
> -
>  	gpiod_set_value_cansleep(p->enable_gpio, 0);
>  
>  	regulator_disable(p->supply);
> @@ -263,8 +245,6 @@ static int panel_simple_unprepare(struct drm_panel *panel)
>  	if (p->desc->delay.unprepare)
>  		msleep(p->desc->delay.unprepare);
>  
> -	p->prepared = false;
> -
>  	return 0;
>  }
>  
> @@ -274,9 +254,6 @@ static int panel_simple_prepare(struct drm_panel *panel)
>  	unsigned int delay;
>  	int err;
>  
> -	if (p->prepared)
> -		return 0;
> -
>  	err = regulator_enable(p->supply);
>  	if (err < 0) {
>  		dev_err(panel->dev, "failed to enable supply: %d\n", err);
> @@ -291,8 +268,6 @@ static int panel_simple_prepare(struct drm_panel *panel)
>  	if (delay)
>  		msleep(delay);
>  
> -	p->prepared = true;
> -
>  	return 0;
>  }
>  
> @@ -300,20 +275,9 @@ static int panel_simple_enable(struct drm_panel *panel)
>  {
>  	struct panel_simple *p = to_panel_simple(panel);
>  
> -	if (p->enabled)
> -		return 0;
> -
>  	if (p->desc->delay.enable)
>  		msleep(p->desc->delay.enable);
>  
> -	if (p->backlight) {
> -		p->backlight->props.state &= ~BL_CORE_FBBLANK;
> -		p->backlight->props.power = FB_BLANK_UNBLANK;
> -		backlight_update_status(p->backlight);
> -	}
> -
> -	p->enabled = true;
> -
>  	return 0;
>  }
>  
> @@ -413,7 +377,7 @@ static void panel_simple_parse_panel_timing_node(struct device *dev,
>  
>  static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  {
> -	struct device_node *backlight, *ddc;
> +	struct device_node *ddc;
>  	struct panel_simple *panel;
>  	struct display_timing dt;
>  	int err;
> @@ -422,8 +386,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  	if (!panel)
>  		return -ENOMEM;
>  
> -	panel->enabled = false;
> -	panel->prepared = false;
>  	panel->desc = desc;
>  
>  	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
> @@ -441,24 +403,13 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  		return err;
>  	}
>  
> -	backlight = of_parse_phandle(dev->of_node, "backlight", 0);
> -	if (backlight) {
> -		panel->backlight = of_find_backlight_by_node(backlight);
> -		of_node_put(backlight);
> -
> -		if (!panel->backlight)
> -			return -EPROBE_DEFER;
> -	}
> -
>  	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
>  	if (ddc) {
>  		panel->ddc = of_find_i2c_adapter_by_node(ddc);
>  		of_node_put(ddc);
>  
> -		if (!panel->ddc) {
> -			err = -EPROBE_DEFER;
> -			goto free_backlight;
> -		}
> +		if (!panel->ddc)
> +			return -EPROBE_DEFER;
>  	}
>  
>  	if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
> @@ -468,6 +419,10 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  	panel->base.dev = dev;
>  	panel->base.funcs = &panel_simple_funcs;
>  
> +	err = drm_panel_of_backlight(&panel->base);
> +	if (err)
> +		goto free_ddc;
> +
>  	err = drm_panel_add(&panel->base);
>  	if (err < 0)
>  		goto free_ddc;
> @@ -479,9 +434,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  free_ddc:
>  	if (panel->ddc)
>  		put_device(&panel->ddc->dev);
> -free_backlight:
> -	if (panel->backlight)
> -		put_device(&panel->backlight->dev);

This looks weird, where

>  
>  	return err;
>  }
> @@ -492,15 +444,12 @@ static int panel_simple_remove(struct device *dev)
>  
>  	drm_panel_remove(&panel->base);
>  
> -	panel_simple_disable(&panel->base);
> -	panel_simple_unprepare(&panel->base);
> +	drm_panel_disable(&panel->base);
> +	drm_panel_unprepare(&panel->base);
>  
>  	if (panel->ddc)
>  		put_device(&panel->ddc->dev);
>  
> -	if (panel->backlight)
> -		put_device(&panel->backlight->dev);
> -
>  	return 0;
>  }
>  
> @@ -508,8 +457,8 @@ static void panel_simple_shutdown(struct device *dev)
>  {
>  	struct panel_simple *panel = dev_get_drvdata(dev);
>  
> -	panel_simple_disable(&panel->base);
> -	panel_simple_unprepare(&panel->base);
> +	drm_panel_disable(&panel->base);
> +	drm_panel_unprepare(&panel->base);
>  }
>  
>  static const struct drm_display_mode ampire_am_480272h3tmqw_t01h_mode = {

-- 
Regards,

Laurent Pinchart

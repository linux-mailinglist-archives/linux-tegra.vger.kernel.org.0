Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 524ED1AE5BF
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2020 21:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbgDQTZJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Apr 2020 15:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728826AbgDQTZJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Apr 2020 15:25:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790DBC061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 12:25:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07A6B97D;
        Fri, 17 Apr 2020 21:25:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587151506;
        bh=oJuP5vEbmZOzK2L9fcnsYSJyiu8LftdzwxM6mpOYhuc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AQ7IcBnm6jcxzWSAjvgQEyOJV75TOsHNt+IFZVgGUaC6hJl5WsSCcyw0zs6j5HyDw
         9Pvn08Ai13hcKQT2Aloe+dKGwXlJVEu2b3qgEGcF7nlxoffD0dWxw6TCtHR3mI+bPD
         +OLCGl5oOfNm2x8xNdN3afzfNES+E1BLgR9QKxag=
Date:   Fri, 17 Apr 2020 22:24:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 3/3] drm/tegra: output: rgb: Support LVDS encoder
 bridge
Message-ID: <20200417192453.GH5861@pendragon.ideasonboard.com>
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200417175238.27154-4-digetx@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

Thank you for the patch.

On Fri, Apr 17, 2020 at 08:52:38PM +0300, Dmitry Osipenko wrote:
> Newer Tegra device-trees will specify a video output graph, which involves
> LVDS encoder bridge. This patch adds support for the LVDS encoder bridge
> to the RGB output, allowing us to model the display hardware properly.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/rgb.c | 58 +++++++++++++++++++++++++++++++------
>  1 file changed, 49 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> index 0562a7eb793f..f28a226914c0 100644
> --- a/drivers/gpu/drm/tegra/rgb.c
> +++ b/drivers/gpu/drm/tegra/rgb.c
> @@ -7,6 +7,7 @@
>  #include <linux/clk.h>
>  
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_simple_kms_helper.h>
>  
> @@ -267,24 +268,63 @@ int tegra_dc_rgb_remove(struct tegra_dc *dc)
>  int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
>  {
>  	struct tegra_output *output = dc->rgb;
> +	struct drm_connector *connector;
>  	int err;
>  
>  	if (!dc->rgb)
>  		return -ENODEV;
>  
> -	drm_connector_init(drm, &output->connector, &tegra_rgb_connector_funcs,
> -			   DRM_MODE_CONNECTOR_LVDS);
> -	drm_connector_helper_add(&output->connector,
> -				 &tegra_rgb_connector_helper_funcs);
> -	output->connector.dpms = DRM_MODE_DPMS_OFF;
> -
>  	drm_simple_encoder_init(drm, &output->encoder, DRM_MODE_ENCODER_LVDS);
>  	drm_encoder_helper_add(&output->encoder,
>  			       &tegra_rgb_encoder_helper_funcs);
>  
> -	drm_connector_attach_encoder(&output->connector,
> -					  &output->encoder);
> -	drm_connector_register(&output->connector);
> +	/*
> +	 * Tegra devices that have LVDS panel utilize LVDS encoder bridge
> +	 * for converting up to 28 LCD LVTTL lanes into 5/4 LVDS lanes that
> +	 * go to display panel's receiver.
> +	 *
> +	 * Encoder usually have a power-down control which needs to be enabled
> +	 * in order to transmit data to the panel. Historically devices that
> +	 * use an older device-tree version didn't model the bridge, assuming
> +	 * that encoder is turned ON by default, while today's DRM allows us
> +	 * to model LVDS encoder properly.
> +	 *
> +	 * Newer device-trees utilize LVDS encoder bridge, which provides
> +	 * us with a connector and handles the display panel.
> +	 *
> +	 * For older device-trees we fall back to our own connector and use
> +	 * nvidia,panel phandle.

As I tried to explain before, if you wrap the panel in a bridge with
drm_panel_bridge_add() (or the devm_ variant), you will always have a
bridge associated with the output, and will be able to remove your
custom connector implementation. I thus recommend converting to
drm_panel_bridge_add() either as part of this patch series, or just
after it, to get full benefits.

With the assumption that this will be handled,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	 */
> +	if (output->bridge) {
> +		err = drm_bridge_attach(&output->encoder, output->bridge,
> +					NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +		if (err) {
> +			dev_err(output->dev, "failed to attach bridge: %d\n",
> +				err);
> +			return err;
> +		}
> +
> +		connector = drm_bridge_connector_init(drm, &output->encoder);
> +		if (IS_ERR(connector)) {
> +			dev_err(output->dev,
> +				"failed to initialize bridge connector: %pe\n",
> +				connector);
> +			return PTR_ERR(connector);
> +		}
> +
> +		drm_connector_attach_encoder(connector, &output->encoder);
> +	} else {
> +		drm_connector_init(drm, &output->connector,
> +				   &tegra_rgb_connector_funcs,
> +				   DRM_MODE_CONNECTOR_LVDS);
> +		drm_connector_helper_add(&output->connector,
> +					 &tegra_rgb_connector_helper_funcs);
> +		output->connector.dpms = DRM_MODE_DPMS_OFF;
> +
> +		drm_connector_attach_encoder(&output->connector,
> +					     &output->encoder);
> +		drm_connector_register(&output->connector);
> +	}
>  
>  	err = tegra_output_init(drm, output);
>  	if (err < 0) {

-- 
Regards,

Laurent Pinchart

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F49F8179B
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Aug 2019 12:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbfHEKyb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Aug 2019 06:54:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51346 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfHEKyb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Aug 2019 06:54:31 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C82CF2F9;
        Mon,  5 Aug 2019 12:54:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565002467;
        bh=RwQ5mnU7RUBzTgtf9QVDKC/TD/uPXzpxPEkwiDIp9go=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o1GVXvYZTbKujwlbSWjhyKHPW4owM5I0zlEmcs35W5UJBLn/uX9Y1tgQEVNlHfCbu
         /nMXTotTJmqYaQ8CHoaAUSMqptXHOSOgKzy2jlzBudupzdlL+rtr7/MD3KkjGOYseq
         vW5cLPFJmFIz7+5Iycxf8kVVcCzLg1Lzyt0SrqHE=
Date:   Mon, 5 Aug 2019 13:54:25 +0300
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
Subject: Re: [PATCH v1 12/16] drm/panel: use inline comments in drm_panel.h
Message-ID: <20190805105425.GG29747@pendragon.ideasonboard.com>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-13-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-13-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Sun, Aug 04, 2019 at 10:16:33PM +0200, Sam Ravnborg wrote:
> Inline comments provide better space for additional comments.
> Comments was slightly edited to follow the normal style,
> but no change to actual content.
> Used the opportuniy to change the order in drm_panel_funcs
> to follow the order they will be used by a panel.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/drm/drm_panel.h | 82 +++++++++++++++++++++++++++++++++--------
>  1 file changed, 66 insertions(+), 16 deletions(-)
> 
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 053d611656b9..5e62deea49ba 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -36,14 +36,6 @@ struct display_timing;
>  
>  /**
>   * struct drm_panel_funcs - perform operations on a given panel
> - * @disable: disable panel (turn off back light, etc.)
> - * @unprepare: turn off panel
> - * @prepare: turn on panel and perform set up
> - * @enable: enable panel (turn on back light, etc.)
> - * @get_modes: add modes to the connector that the panel is attached to and
> - * return the number of modes added
> - * @get_timings: copy display timings into the provided array and return
> - * the number of display timings available
>   *
>   * The .prepare() function is typically called before the display controller
>   * starts to transmit video data. Panel drivers can use this to turn the panel
> @@ -69,31 +61,89 @@ struct display_timing;
>   * the panel. This is the job of the .unprepare() function.
>   */
>  struct drm_panel_funcs {
> -	int (*disable)(struct drm_panel *panel);
> -	int (*unprepare)(struct drm_panel *panel);
> +	/**
> +	 * @prepare:
> +	 *
> +	 * Turn on panel and perform set up.
> +	 */
>  	int (*prepare)(struct drm_panel *panel);
> +
> +	/**
> +	 * @enable:
> +	 *
> +	 * Enable panel (turn on back light, etc.).
> +	 */
>  	int (*enable)(struct drm_panel *panel);
> +
> +	/**
> +	 * @disable:
> +	 *
> +	 * Disable panel (turn off back light, etc.).
> +	 */
> +	int (*disable)(struct drm_panel *panel);
> +
> +	/**
> +	 * @unprepare:
> +	 *
> +	 * Turn off panel.
> +	 */
> +	int (*unprepare)(struct drm_panel *panel);
> +
> +	/**
> +	 * @get_modes:
> +	 *
> +	 * Add modes to the connector that the panel is attached to and
> +	 * return the number of modes added.
> +	 */
>  	int (*get_modes)(struct drm_panel *panel);
> +
> +	/**
> +	 * @get_timings:
> +	 *
> +	 * Copy display timings into the provided array and return
> +	 * the number of display timings available.
> +	 */
>  	int (*get_timings)(struct drm_panel *panel, unsigned int num_timings,
>  			   struct display_timing *timings);
>  };
>  
>  /**
>   * struct drm_panel - DRM panel object
> - * @drm: DRM device owning the panel
> - * @connector: DRM connector that the panel is attached to
> - * @dev: parent device of the panel
> - * @link: link from panel device (supplier) to DRM device (consumer)
> - * @funcs: operations that can be performed on the panel
> - * @list: panel entry in registry
>   */
>  struct drm_panel {
> +	/**
> +	 * @drm:
> +	 *
> +	 * DRM device owning the panel.
> +	 */
>  	struct drm_device *drm;
> +
> +	/**
> +	 * @connector:
> +	 *
> +	 * DRM connector that the panel is attached to.
> +	 */
>  	struct drm_connector *connector;
> +
> +	/**
> +	 * @dev:
> +	 *
> +	 * Parent device of the panel.
> +	 */
>  	struct device *dev;
>  
> +	/**
> +	 * @funcs:
> +	 *
> +	 * Operations that can be performed on the panel.
> +	 */
>  	const struct drm_panel_funcs *funcs;
>  
> +	/**
> +	 * @list:
> +	 *
> +	 * Panel entry in registry.
> +	 */
>  	struct list_head list;
>  };
>  

-- 
Regards,

Laurent Pinchart

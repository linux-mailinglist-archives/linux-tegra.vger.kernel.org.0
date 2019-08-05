Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 085498152F
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Aug 2019 11:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbfHEJQ3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Aug 2019 05:16:29 -0400
Received: from mail.kmu-office.ch ([178.209.48.109]:39630 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfHEJQ3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Aug 2019 05:16:29 -0400
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
        by mail.kmu-office.ch (Postfix) with ESMTPSA id 07B255C05E2;
        Mon,  5 Aug 2019 11:16:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
        t=1564996587;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HPQtnZFrmV2z2ZY4AUfwVhL1KZOhKYp78pnR/I9Q3gU=;
        b=dDz17VqIE1JQlYngbbljhYiHAlll72f3XT1TPeuh9u7wN5YpW3p2+imJ+iWmB7Hm6vizk6
        BimPIm5U7TgfWtGCwCzvNwsmbj3kDU9O3OCtzuQfVbVr1ZuIFBIcNhPDSLRS2O79bmIOTJ
        yQA/FaXqhxhjIC6jiFXV63Z5IRaa6Gc=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date:   Mon, 05 Aug 2019 11:16:26 +0200
From:   Stefan Agner <stefan@agner.ch>
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
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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
        Thomas Gleixner <tglx@linutronix.de>,
        Vincent Abriou <vincent.abriou@st.com>,
        Sam Ravnborg <sam.ravnborg@gmail.com>
Subject: Re: [PATCH v1 05/16] drm/fsl-dcu: fix opencoded use of drm_panel_*
In-Reply-To: <20190804201637.1240-6-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-6-sam@ravnborg.org>
Message-ID: <8567eb4c916a0b1d134bd62112a11903@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2019-08-04 22:16, Sam Ravnborg wrote:
> Use drm_panel_get_modes() to access modes.
> This has a nice side effect to simplify the code.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Alison Wang <alison.wang@nxp.com>
> ---
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
> b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
> index 279d83eaffc0..a92fd6c70b09 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
> @@ -65,17 +65,9 @@ static const struct drm_connector_funcs
> fsl_dcu_drm_connector_funcs = {
>  static int fsl_dcu_drm_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct fsl_dcu_drm_connector *fsl_connector;
> -	int (*get_modes)(struct drm_panel *panel);
> -	int num_modes = 0;
>  
>  	fsl_connector = to_fsl_dcu_connector(connector);
> -	if (fsl_connector->panel && fsl_connector->panel->funcs &&
> -	    fsl_connector->panel->funcs->get_modes) {
> -		get_modes = fsl_connector->panel->funcs->get_modes;
> -		num_modes = get_modes(fsl_connector->panel);
> -	}
> -
> -	return num_modes;
> +	return drm_panel_get_modes(fsl_connector->panel);

Oh, that old code looks rather messy. Thanks for the simplification!

This behaves slightly different since it now returns -EINVAL or -ENOSYS,
but that is what we want.

Acked-by: Stefan Agner <stefan@agner.ch>

--
Stefan

>  }
>  
>  static int fsl_dcu_drm_connector_mode_valid(struct drm_connector *connector,

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B15CC8158C
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Aug 2019 11:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbfHEJe5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Aug 2019 05:34:57 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35319 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727225AbfHEJe5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Aug 2019 05:34:57 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1huZNt-0006zK-Ts; Mon, 05 Aug 2019 11:34:29 +0200
Message-ID: <1564997664.3056.11.camel@pengutronix.de>
Subject: Re: [PATCH v1 04/16] drm/imx: fix opencoded use of drm_panel_*
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Alexios Zavras <alexios.zavras@intel.com>,
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
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>
Date:   Mon, 05 Aug 2019 11:34:24 +0200
In-Reply-To: <20190804201637.1240-5-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
         <20190804201637.1240-5-sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 2019-08-04 at 22:16 +0200, Sam Ravnborg wrote:
> Use the drm_panel_get_modes() function to get the modes.
> 
> This patch leave one test for the function pointer:
>     panel->funcs->get_modes
> 
> This is used to check if the panel may have any modes.
> There is no direct replacement.
> We may be able to just check that drm_panel_get_modes() return > 0,
> but as this is not the same functionality it is left for later.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

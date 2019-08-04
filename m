Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC97580C6D
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 22:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbfHDURc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 16:17:32 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45071 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbfHDURc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 16:17:32 -0400
Received: by mail-lf1-f66.google.com with SMTP id u10so17590234lfm.12;
        Sun, 04 Aug 2019 13:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=shoyTDJcoi5HvA8suEJ+ePhtLRmu1CfLIIIm8v7PNNs=;
        b=TT0liCbgGg0E/gJCenrGbe3V7qxESoHcLYR9Fqum61d5epYgpLiaYRYFfKL92Pr3ih
         8qYhDSumrhQUVMEQzIyzfC1SGb+fphtyBPbjIx90BYEUkYkHRusp/zv3xYTe4Q5JntxV
         tPvq1numLSzbK1j6IgLi22GioQ71kzagFKwDFQTjXRdiZQgt2p+E4RM5HcLdsKTlmHBc
         xcIoztstMzYcu0dtXtODbAIM4OsypFfHT2H5Sbqg70r2FfpBM/xvUiRRgTp1cQZhCVPM
         63T3SG4pNSJFLmpPNWxgt7AqRvsoRkBsILlP/FwlXKZdsAnovbJMjKhi+vrEpjsIAHnh
         ymFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=shoyTDJcoi5HvA8suEJ+ePhtLRmu1CfLIIIm8v7PNNs=;
        b=U9+pcDg4GTOd0ock0ee2FVovF9qkPkkBRKRMk9/x/hirKl7OOSvpUMbi8SohJdYgIX
         Qe28il04w5qUhfoFWej4DCzlIkNfJe9l7mIGkUqm09XX08ZIb1cITLQbnxwbmXbhf6bd
         CcmDXaznlt6LRd7/BS3ypZ76YmHa02w+nVgRburBTw2TJczsKygqrmXtz3XurZmu0fKC
         kJ7/BIz6QJ1JiMxvAtDfGdGcMtdDCciZPwoG22rT8O89UKSP4LgGt3kmVARr3GVG58fx
         hoTO1LuCsH8m8R/CR1QsJKmz4nBhSJAiuxZLFAMVjsxWsXmVICPumS4MQpRwUGYXkfJo
         xY+Q==
X-Gm-Message-State: APjAAAX2aOE017Vy/rLnU7bADhv72msvXdkeVmg/8IP1LnyFmK8nJ37q
        GV197/IJNMU1WKBgZ22x+OGxNvrhYeL0Ew==
X-Google-Smtp-Source: APXvYqzl1MkkA4C89bp42Rzz6UlZz/8K8R5A5+jNjhZrXPItPaaVvFQmywl+F1LIRSh1rcVqQi6CzA==
X-Received: by 2002:ac2:5c1d:: with SMTP id r29mr18089640lfp.72.1564949849567;
        Sun, 04 Aug 2019 13:17:29 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id p87sm16540794ljp.50.2019.08.04.13.17.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 13:17:29 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
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
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincent Abriou <vincent.abriou@st.com>
Subject: [PATCH v1 10/16] drm/panel: ili9322: move bus_flags to get_modes()
Date:   Sun,  4 Aug 2019 22:16:31 +0200
Message-Id: <20190804201637.1240-11-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

To prepare the driver to receive drm_connector only in the get_modes()
callback, move bus_flags handling to ili9322_get_modes().

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 34 +++++++++-----------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
index 53dd1e128795..3c58f63adbf7 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
@@ -349,7 +349,6 @@ static const struct regmap_config ili9322_regmap_config = {
 
 static int ili9322_init(struct drm_panel *panel, struct ili9322 *ili)
 {
-	struct drm_connector *connector = panel->connector;
 	u8 reg;
 	int ret;
 	int i;
@@ -407,23 +406,11 @@ static int ili9322_init(struct drm_panel *panel, struct ili9322 *ili)
 	 * Polarity and inverted color order for RGB input.
 	 * None of this applies in the BT.656 mode.
 	 */
-	if (ili->conf->dclk_active_high) {
+	reg = 0;
+	if (ili->conf->dclk_active_high)
 		reg = ILI9322_POL_DCLK;
-		connector->display_info.bus_flags |=
-			DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
-	} else {
-		reg = 0;
-		connector->display_info.bus_flags |=
-			DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
-	}
-	if (ili->conf->de_active_high) {
+	if (ili->conf->de_active_high)
 		reg |= ILI9322_POL_DE;
-		connector->display_info.bus_flags |=
-			DRM_BUS_FLAG_DE_HIGH;
-	} else {
-		connector->display_info.bus_flags |=
-			DRM_BUS_FLAG_DE_LOW;
-	}
 	if (ili->conf->hsync_active_high)
 		reg |= ILI9322_POL_HSYNC;
 	if (ili->conf->vsync_active_high)
@@ -659,9 +646,20 @@ static int ili9322_get_modes(struct drm_panel *panel)
 	struct drm_connector *connector = panel->connector;
 	struct ili9322 *ili = panel_to_ili9322(panel);
 	struct drm_display_mode *mode;
+	struct drm_display_info *info;
+
+	info = &connector->display_info;
+	info->width_mm = ili->conf->width_mm;
+	info->height_mm = ili->conf->height_mm;
+	if (ili->conf->dclk_active_high)
+		info->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
+	else
+		info->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
 
-	connector->display_info.width_mm = ili->conf->width_mm;
-	connector->display_info.height_mm = ili->conf->height_mm;
+	if (ili->conf->de_active_high)
+		info->bus_flags |= DRM_BUS_FLAG_DE_HIGH;
+	else
+		info->bus_flags |= DRM_BUS_FLAG_DE_LOW;
 
 	switch (ili->input) {
 	case ILI9322_INPUT_SRGB_DUMMY_320X240:
-- 
2.20.1


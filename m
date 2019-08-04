Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7726880C80
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 22:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbfHDURt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 16:17:49 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44597 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbfHDURt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 16:17:49 -0400
Received: by mail-lj1-f193.google.com with SMTP id k18so77400066ljc.11;
        Sun, 04 Aug 2019 13:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=58L2c6AoPRdtw97mukFPxD0pdo2vv2X7JQRJbq8/vUE=;
        b=iWaSTn6msFtanMS3ltawVoyI/akm3SIk334RyboYedy/nyCR1hjYvRVV5qxkjjz0/H
         HqXXvHotINKZ0MV5HIpyWLnyZtxGL/1hGgmFIEEI7UdhvUfg75bpnhgOJWt5N8zKgrdm
         iOXfl/+wIB5SpvjXO1jqzazjXb4JocnXkPI+PCSJkpOFvrS+MIjtXrKGdq9eXuHzZGgb
         +cj5IV6oh60Itbyl7Tn5K5BhmHxd4/gcjJnW0V2KehXKtOWe4oIYhKGzrUlEdTmqAkt/
         88lPYDyYgqhmfZxkZeRgCPjyUrPVFHA+tyGQMdVbBGoApF+gML1pHYItNM5NHOyvti76
         MsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=58L2c6AoPRdtw97mukFPxD0pdo2vv2X7JQRJbq8/vUE=;
        b=XkL1oyTDVR6Z5oXGE04FMqYI0KXKoXVhToQKmem8qvWIqWQQXOUleqtx+Pz0m3KZk5
         waVIsA7vN7f996l0FgB6s/JGfp1Z80BVmNlQC9NaBDz3bLajLhjcPVPeVvVxaW5S177S
         hBftMWnpcsGAh4PSTkVYfH+HNHHiLeNQCMR1eZSjcosgKGNiU5F7uo3hiQGSAo6IB3QV
         0mvv6GjZEP81S1mat1oPLMBqFIIolHBNOzzjl0Xb0prFZc+97NlxK4kOlGImi9+LML4t
         uf+9BlmBgLKzTFqafjRurUGZWu4qnNjSmRu32F5ZIf3NxXqqbf6YuMFR4NpeKNxMcUlp
         XnOA==
X-Gm-Message-State: APjAAAWgJN/jckTlWyaV0HCMCX5pmPQznuCKtnxd3piVS6ArL6Y/Vgiq
        5tZSPTQtTW7pzC9QINholJ4=
X-Google-Smtp-Source: APXvYqwd3qng5VMg9Mb2Vmyn/6Orka9Dj+RSr/HOVzJm2eC00ZYEFloJNhEpBCBt7pNnr0htBnzZ8A==
X-Received: by 2002:a2e:834e:: with SMTP id l14mr30558098ljh.158.1564949866148;
        Sun, 04 Aug 2019 13:17:46 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id p87sm16540794ljp.50.2019.08.04.13.17.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 13:17:45 -0700 (PDT)
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
Subject: [PATCH v1 16/16] drm/panel: simple: use drm_panel infrastructure
Date:   Sun,  4 Aug 2019 22:16:37 +0200
Message-Id: <20190804201637.1240-17-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use drm_panel infrastrucute:
- drm_panel has guards for calling disable/enable twice
- drm_panel has backlight support

To use the drm_panel infrastructure use the drm_panel_*
variants for prepare/enable/disable/unprepare.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 73 +++++-----------------------
 1 file changed, 11 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index bff7578f84dd..c7eed34f2c9c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -21,7 +21,6 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -98,13 +97,10 @@ struct panel_desc {
 
 struct panel_simple {
 	struct drm_panel base;
-	bool prepared;
-	bool enabled;
 	bool no_hpd;
 
 	const struct panel_desc *desc;
 
-	struct backlight_device *backlight;
 	struct regulator *supply;
 	struct i2c_adapter *ddc;
 
@@ -232,20 +228,9 @@ static int panel_simple_disable(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
 
-	if (!p->enabled)
-		return 0;
-
-	if (p->backlight) {
-		p->backlight->props.power = FB_BLANK_POWERDOWN;
-		p->backlight->props.state |= BL_CORE_FBBLANK;
-		backlight_update_status(p->backlight);
-	}
-
 	if (p->desc->delay.disable)
 		msleep(p->desc->delay.disable);
 
-	p->enabled = false;
-
 	return 0;
 }
 
@@ -253,9 +238,6 @@ static int panel_simple_unprepare(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
 
-	if (!p->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(p->enable_gpio, 0);
 
 	regulator_disable(p->supply);
@@ -263,8 +245,6 @@ static int panel_simple_unprepare(struct drm_panel *panel)
 	if (p->desc->delay.unprepare)
 		msleep(p->desc->delay.unprepare);
 
-	p->prepared = false;
-
 	return 0;
 }
 
@@ -274,9 +254,6 @@ static int panel_simple_prepare(struct drm_panel *panel)
 	unsigned int delay;
 	int err;
 
-	if (p->prepared)
-		return 0;
-
 	err = regulator_enable(p->supply);
 	if (err < 0) {
 		dev_err(panel->dev, "failed to enable supply: %d\n", err);
@@ -291,8 +268,6 @@ static int panel_simple_prepare(struct drm_panel *panel)
 	if (delay)
 		msleep(delay);
 
-	p->prepared = true;
-
 	return 0;
 }
 
@@ -300,20 +275,9 @@ static int panel_simple_enable(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
 
-	if (p->enabled)
-		return 0;
-
 	if (p->desc->delay.enable)
 		msleep(p->desc->delay.enable);
 
-	if (p->backlight) {
-		p->backlight->props.state &= ~BL_CORE_FBBLANK;
-		p->backlight->props.power = FB_BLANK_UNBLANK;
-		backlight_update_status(p->backlight);
-	}
-
-	p->enabled = true;
-
 	return 0;
 }
 
@@ -413,7 +377,7 @@ static void panel_simple_parse_panel_timing_node(struct device *dev,
 
 static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 {
-	struct device_node *backlight, *ddc;
+	struct device_node *ddc;
 	struct panel_simple *panel;
 	struct display_timing dt;
 	int err;
@@ -422,8 +386,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	if (!panel)
 		return -ENOMEM;
 
-	panel->enabled = false;
-	panel->prepared = false;
 	panel->desc = desc;
 
 	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
@@ -441,24 +403,13 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		return err;
 	}
 
-	backlight = of_parse_phandle(dev->of_node, "backlight", 0);
-	if (backlight) {
-		panel->backlight = of_find_backlight_by_node(backlight);
-		of_node_put(backlight);
-
-		if (!panel->backlight)
-			return -EPROBE_DEFER;
-	}
-
 	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
 	if (ddc) {
 		panel->ddc = of_find_i2c_adapter_by_node(ddc);
 		of_node_put(ddc);
 
-		if (!panel->ddc) {
-			err = -EPROBE_DEFER;
-			goto free_backlight;
-		}
+		if (!panel->ddc)
+			return -EPROBE_DEFER;
 	}
 
 	if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
@@ -468,6 +419,10 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	panel->base.dev = dev;
 	panel->base.funcs = &panel_simple_funcs;
 
+	err = drm_panel_of_backlight(&panel->base);
+	if (err)
+		goto free_ddc;
+
 	err = drm_panel_add(&panel->base);
 	if (err < 0)
 		goto free_ddc;
@@ -479,9 +434,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 free_ddc:
 	if (panel->ddc)
 		put_device(&panel->ddc->dev);
-free_backlight:
-	if (panel->backlight)
-		put_device(&panel->backlight->dev);
 
 	return err;
 }
@@ -492,15 +444,12 @@ static int panel_simple_remove(struct device *dev)
 
 	drm_panel_remove(&panel->base);
 
-	panel_simple_disable(&panel->base);
-	panel_simple_unprepare(&panel->base);
+	drm_panel_disable(&panel->base);
+	drm_panel_unprepare(&panel->base);
 
 	if (panel->ddc)
 		put_device(&panel->ddc->dev);
 
-	if (panel->backlight)
-		put_device(&panel->backlight->dev);
-
 	return 0;
 }
 
@@ -508,8 +457,8 @@ static void panel_simple_shutdown(struct device *dev)
 {
 	struct panel_simple *panel = dev_get_drvdata(dev);
 
-	panel_simple_disable(&panel->base);
-	panel_simple_unprepare(&panel->base);
+	drm_panel_disable(&panel->base);
+	drm_panel_unprepare(&panel->base);
 }
 
 static const struct drm_display_mode ampire_am_480272h3tmqw_t01h_mode = {
-- 
2.20.1


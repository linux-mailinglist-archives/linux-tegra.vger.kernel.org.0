Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81BAA1AF281
	for <lists+linux-tegra@lfdr.de>; Sat, 18 Apr 2020 19:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726850AbgDRRHc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 18 Apr 2020 13:07:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726909AbgDRRH1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 18 Apr 2020 13:07:27 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 836D2C061A0F;
        Sat, 18 Apr 2020 10:07:25 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id k28so4394093lfe.10;
        Sat, 18 Apr 2020 10:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n6hq2XlIahyxNhJ/uhIqbU22a2HtKZ7QcDFqMh6e2uc=;
        b=p8+rPkCQFlqk8Qz5o6rG+cm0B0GQn1ZPk+VZjXU0bU3vhKYL1ISyCecUxphRh6caRX
         IMaYy03D4Y6kU+BwW5E8yuGUZFFKNC2h3mS6WyoqV9x/UIZNzTbLXnFymi5bL515Ng64
         jR9sV05P16vG/GepxUh4FZKY+jukbV7Uayc5bZ/wRZktbAgnIPSrqgha4qkaOu810IH2
         CqKSVXvB/x2d+HmKubLBNKaj3fSl6XmxZdLcBl+mqBURUY6lp5zz+3Eh2kULhTWgqwk3
         A9I8f4ucQMuwMoePIVguxgsN+CuWHrz4n1cqicgcqxpEmEQhP6+oHE+9W/5vpbkKo5jh
         XYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n6hq2XlIahyxNhJ/uhIqbU22a2HtKZ7QcDFqMh6e2uc=;
        b=i8lNFfOtx4maaOqe9wXkbmaqt5pyH2nHAl91PACTsDS1JA18U5oRQGS5GopCZhSi92
         M1ovjx33u3rZXIVD0OIRap8EeDgFKfYTM6rvVTjgmI0GED76Z5kQjvOb3fmuaze/FhHm
         4cVRUFdX2jsIEZZv7lW+M4jpzhpKNNzCi3SiEt/+h2AEsT9Byb0Zyw/hkr76OuDjfoaZ
         ru3ECQ+q+hJp1DVX5NWV9Mzg72Fj8jh9Wv+83/D4NkkFxNM74kcvH1buoIbk3FXJB9md
         EZsQKYHG/FeOaMdspE1LIcv80BdfcI2ygmCtK0ufbW8aZDDSE2M/UVkA2oZQXsz/SiAh
         yB9w==
X-Gm-Message-State: AGi0Pub76fOP2ahWMWtK2fJMpNysTkrxx5XewK30MJYG/z812k03IYof
        OW/URU4GxM3iX+B7gY8F0LY=
X-Google-Smtp-Source: APiQypJKSR6OQSZl8ELLfty+ryCDSBKdNmCq2quUB+LFQLqbsTFG8Isth8KFNW7Lv1XLNJL+IRBRnw==
X-Received: by 2002:a19:c14e:: with SMTP id r75mr5468293lff.62.1587229644017;
        Sat, 18 Apr 2020 10:07:24 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id e15sm8768909ljb.25.2020.04.18.10.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 10:07:23 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/6] drm/tegra: output: rgb: Wrap directly-connected panel into DRM bridge
Date:   Sat, 18 Apr 2020 20:07:03 +0300
Message-Id: <20200418170703.1583-7-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200418170703.1583-1-digetx@gmail.com>
References: <20200418170703.1583-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Currently Tegra DRM driver manually manages display panel, but this
management could be moved out into DRM core if we'll wrap panel into
DRM bridge. This patch wraps RGB panel into a DRM bridge and removes
manual handling of the panel from the RGB output code.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/rgb.c | 53 +++++++++++++------------------------
 1 file changed, 18 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 9a7024ec96bc..a4c5a6066c54 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -8,7 +8,6 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge_connector.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "drm.h"
@@ -86,15 +85,6 @@ static void tegra_dc_write_regs(struct tegra_dc *dc,
 		tegra_dc_writel(dc, table[i].value, table[i].offset);
 }
 
-static const struct drm_connector_funcs tegra_rgb_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
-	.detect = tegra_output_connector_detect,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = tegra_output_connector_destroy,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
 static enum drm_mode_status
 tegra_rgb_connector_mode_valid(struct drm_connector *connector,
 			       struct drm_display_mode *mode)
@@ -117,14 +107,8 @@ static void tegra_rgb_encoder_disable(struct drm_encoder *encoder)
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_rgb *rgb = to_rgb(output);
 
-	if (output->panel)
-		drm_panel_disable(output->panel);
-
 	tegra_dc_write_regs(rgb->dc, rgb_disable, ARRAY_SIZE(rgb_disable));
 	tegra_dc_commit(rgb->dc);
-
-	if (output->panel)
-		drm_panel_unprepare(output->panel);
 }
 
 static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
@@ -133,9 +117,6 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	struct tegra_rgb *rgb = to_rgb(output);
 	u32 value;
 
-	if (output->panel)
-		drm_panel_prepare(output->panel);
-
 	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
 
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
@@ -157,9 +138,6 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	tegra_dc_writel(rgb->dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
 
 	tegra_dc_commit(rgb->dc);
-
-	if (output->panel)
-		drm_panel_enable(output->panel);
 }
 
 static int
@@ -278,6 +256,23 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 	drm_encoder_helper_add(&output->encoder,
 			       &tegra_rgb_encoder_helper_funcs);
 
+	/*
+	 * Wrap directly-connected panel into DRM bridge in order to let
+	 * DRM core to handle panel for us.
+	 */
+	if (output->panel) {
+		output->bridge = devm_drm_panel_bridge_add(output->dev,
+							   output->panel);
+		if (IS_ERR(output->bridge)) {
+			dev_err(output->dev,
+				"failed to wrap panel into bridge: %pe\n",
+				output->bridge);
+			return PTR_ERR(output->bridge);
+		}
+
+		output->panel = NULL;
+	}
+
 	/*
 	 * Tegra devices that have LVDS panel utilize LVDS encoder bridge
 	 * for converting up to 28 LCD LVTTL lanes into 5/4 LVDS lanes that
@@ -292,8 +287,7 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 	 * Newer device-trees utilize LVDS encoder bridge, which provides
 	 * us with a connector and handles the display panel.
 	 *
-	 * For older device-trees we fall back to our own connector and use
-	 * nvidia,panel phandle.
+	 * For older device-trees we wrapped panel into the panel-bridge.
 	 */
 	if (output->bridge) {
 		err = drm_bridge_attach(&output->encoder, output->bridge,
@@ -313,17 +307,6 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 		}
 
 		drm_connector_attach_encoder(connector, &output->encoder);
-	} else {
-		drm_connector_init(drm, &output->connector,
-				   &tegra_rgb_connector_funcs,
-				   DRM_MODE_CONNECTOR_LVDS);
-		drm_connector_helper_add(&output->connector,
-					 &tegra_rgb_connector_helper_funcs);
-		output->connector.dpms = DRM_MODE_DPMS_OFF;
-
-		drm_connector_attach_encoder(&output->connector,
-					     &output->encoder);
-		drm_connector_register(&output->connector);
 	}
 
 	err = tegra_output_init(drm, output);
-- 
2.26.0


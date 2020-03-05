Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C192917A9A9
	for <lists+linux-tegra@lfdr.de>; Thu,  5 Mar 2020 17:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgCEQAT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 5 Mar 2020 11:00:19 -0500
Received: from mx2.suse.de ([195.135.220.15]:57114 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726676AbgCEQAT (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 5 Mar 2020 11:00:19 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 117B1B12C;
        Thu,  5 Mar 2020 16:00:18 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        abrodkin@synopsys.com, bbrezillon@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, jingoohan1@gmail.com, inki.dae@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
        stefan@agner.ch, alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
        xinliang.liu@linaro.org, zourongrong@gmail.com,
        john.stultz@linaro.org, kong.kongxinwei@hisilicon.com,
        puck.chen@hisilicon.com, linux@armlinux.org.uk,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, paul@crapouillou.net, ck.hu@mediatek.com,
        matthias.bgg@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
        heiko@sntech.de, wens@csie.org, jernej.skrabec@siol.net,
        thierry.reding@gmail.com, jonathanh@nvidia.com, jsarha@ti.com,
        tomi.valkeinen@ti.com, eric@anholt.net, kraxel@redhat.com,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        sebastian.reichel@collabora.com
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 17/22] drm/tilcdc: Use simple encoder
Date:   Thu,  5 Mar 2020 16:59:45 +0100
Message-Id: <20200305155950.2705-18-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200305155950.2705-1-tzimmermann@suse.de>
References: <20200305155950.2705-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The tilcdc driver uses empty implementations for its encoders. Replace
the code with the generic simple encoder.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tilcdc/tilcdc_external.c | 10 +++-------
 drivers/gpu/drm/tilcdc/tilcdc_panel.c    |  8 ++------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 28b7f703236e..b177525588c1 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -10,6 +10,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "tilcdc_drv.h"
 #include "tilcdc_external.h"
@@ -83,10 +84,6 @@ int tilcdc_add_component_encoder(struct drm_device *ddev)
 	return 0;
 }
 
-static const struct drm_encoder_funcs tilcdc_external_encoder_funcs = {
-	.destroy	= drm_encoder_cleanup,
-};
-
 static
 int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 {
@@ -131,9 +128,8 @@ int tilcdc_attach_external_device(struct drm_device *ddev)
 	if (!priv->external_encoder)
 		return -ENOMEM;
 
-	ret = drm_encoder_init(ddev, priv->external_encoder,
-			       &tilcdc_external_encoder_funcs,
-			       DRM_MODE_ENCODER_NONE, NULL);
+	ret = drm_simple_encoder_init(ddev, priv->external_encoder,
+				      DRM_MODE_ENCODER_NONE);
 	if (ret) {
 		dev_err(ddev->dev, "drm_encoder_init() failed %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
index 5584e656b857..12823d60c4e8 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -16,6 +16,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "tilcdc_drv.h"
 #include "tilcdc_panel.h"
@@ -74,10 +75,6 @@ static void panel_encoder_mode_set(struct drm_encoder *encoder,
 	/* nothing needed */
 }
 
-static const struct drm_encoder_funcs panel_encoder_funcs = {
-		.destroy        = drm_encoder_cleanup,
-};
-
 static const struct drm_encoder_helper_funcs panel_encoder_helper_funcs = {
 		.dpms           = panel_encoder_dpms,
 		.prepare        = panel_encoder_prepare,
@@ -102,8 +99,7 @@ static struct drm_encoder *panel_encoder_create(struct drm_device *dev,
 	encoder = &panel_encoder->base;
 	encoder->possible_crtcs = 1;
 
-	ret = drm_encoder_init(dev, encoder, &panel_encoder_funcs,
-			DRM_MODE_ENCODER_LVDS, NULL);
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_LVDS);
 	if (ret < 0)
 		goto fail;
 
-- 
2.25.1


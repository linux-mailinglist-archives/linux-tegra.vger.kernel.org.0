Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA5217A9CA
	for <lists+linux-tegra@lfdr.de>; Thu,  5 Mar 2020 17:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgCEQA2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 5 Mar 2020 11:00:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:58218 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgCEQA2 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 5 Mar 2020 11:00:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 631B5AC84;
        Thu,  5 Mar 2020 16:00:25 +0000 (UTC)
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
Subject: [PATCH 22/22] drm/zte: Use simple encoder
Date:   Thu,  5 Mar 2020 16:59:50 +0100
Message-Id: <20200305155950.2705-23-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200305155950.2705-1-tzimmermann@suse.de>
References: <20200305155950.2705-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The zte driver uses empty implementations for its encoders. Replace
the code with the generic simple encoder.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/zte/zx_hdmi.c  | 8 ++------
 drivers/gpu/drm/zte/zx_tvenc.c | 8 ++------
 drivers/gpu/drm/zte/zx_vga.c   | 8 ++------
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/zte/zx_hdmi.c b/drivers/gpu/drm/zte/zx_hdmi.c
index b98a1420dcd3..76a16d997a23 100644
--- a/drivers/gpu/drm/zte/zx_hdmi.c
+++ b/drivers/gpu/drm/zte/zx_hdmi.c
@@ -20,6 +20,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_print.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include <sound/hdmi-codec.h>
 
@@ -254,10 +255,6 @@ static const struct drm_encoder_helper_funcs zx_hdmi_encoder_helper_funcs = {
 	.mode_set = zx_hdmi_encoder_mode_set,
 };
 
-static const struct drm_encoder_funcs zx_hdmi_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int zx_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct zx_hdmi *hdmi = to_zx_hdmi(connector);
@@ -313,8 +310,7 @@ static int zx_hdmi_register(struct drm_device *drm, struct zx_hdmi *hdmi)
 
 	encoder->possible_crtcs = VOU_CRTC_MASK;
 
-	drm_encoder_init(drm, encoder, &zx_hdmi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
 	drm_encoder_helper_add(encoder, &zx_hdmi_encoder_helper_funcs);
 
 	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
diff --git a/drivers/gpu/drm/zte/zx_tvenc.c b/drivers/gpu/drm/zte/zx_tvenc.c
index c598b7daf1f1..d8a89ba383bc 100644
--- a/drivers/gpu/drm/zte/zx_tvenc.c
+++ b/drivers/gpu/drm/zte/zx_tvenc.c
@@ -14,6 +14,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "zx_drm_drv.h"
 #include "zx_tvenc_regs.h"
@@ -218,10 +219,6 @@ static const struct drm_encoder_helper_funcs zx_tvenc_encoder_helper_funcs = {
 	.mode_set = zx_tvenc_encoder_mode_set,
 };
 
-static const struct drm_encoder_funcs zx_tvenc_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int zx_tvenc_connector_get_modes(struct drm_connector *connector)
 {
 	struct zx_tvenc *tvenc = to_zx_tvenc(connector);
@@ -285,8 +282,7 @@ static int zx_tvenc_register(struct drm_device *drm, struct zx_tvenc *tvenc)
 	 */
 	encoder->possible_crtcs = BIT(1);
 
-	drm_encoder_init(drm, encoder, &zx_tvenc_encoder_funcs,
-			 DRM_MODE_ENCODER_TVDAC, NULL);
+	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TVDAC);
 	drm_encoder_helper_add(encoder, &zx_tvenc_encoder_helper_funcs);
 
 	connector->interlace_allowed = true;
diff --git a/drivers/gpu/drm/zte/zx_vga.c b/drivers/gpu/drm/zte/zx_vga.c
index c4fa3bbaba78..a7ed7f5ca837 100644
--- a/drivers/gpu/drm/zte/zx_vga.c
+++ b/drivers/gpu/drm/zte/zx_vga.c
@@ -14,6 +14,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "zx_drm_drv.h"
 #include "zx_vga_regs.h"
@@ -72,10 +73,6 @@ static const struct drm_encoder_helper_funcs zx_vga_encoder_helper_funcs = {
 	.disable = zx_vga_encoder_disable,
 };
 
-static const struct drm_encoder_funcs zx_vga_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int zx_vga_connector_get_modes(struct drm_connector *connector)
 {
 	struct zx_vga *vga = to_zx_vga(connector);
@@ -154,8 +151,7 @@ static int zx_vga_register(struct drm_device *drm, struct zx_vga *vga)
 
 	encoder->possible_crtcs = VOU_CRTC_MASK;
 
-	ret = drm_encoder_init(drm, encoder, &zx_vga_encoder_funcs,
-			       DRM_MODE_ENCODER_DAC, NULL);
+	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_DAC);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to init encoder: %d\n", ret);
 		return ret;
-- 
2.25.1


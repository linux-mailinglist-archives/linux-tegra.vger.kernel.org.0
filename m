Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9546F17A9C3
	for <lists+linux-tegra@lfdr.de>; Thu,  5 Mar 2020 17:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbgCEQAZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 5 Mar 2020 11:00:25 -0500
Received: from mx2.suse.de ([195.135.220.15]:58046 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726273AbgCEQAY (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 5 Mar 2020 11:00:24 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 87920AC84;
        Thu,  5 Mar 2020 16:00:22 +0000 (UTC)
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
Subject: [PATCH 20/22] drm/vkms: Use simple encoder
Date:   Thu,  5 Mar 2020 16:59:48 +0100
Message-Id: <20200305155950.2705-21-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200305155950.2705-1-tzimmermann@suse.de>
References: <20200305155950.2705-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The vkms driver uses an empty implementation for its encoder. Replace
the code with the generic simple encoder.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vkms/vkms_output.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index fb1941a6522c..85afb77e97f0 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -3,6 +3,7 @@
 #include "vkms_drv.h"
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 static void vkms_connector_destroy(struct drm_connector *connector)
 {
@@ -17,10 +18,6 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static const struct drm_encoder_funcs vkms_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int vkms_conn_get_modes(struct drm_connector *connector)
 {
 	int count;
@@ -70,8 +67,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
 
-	ret = drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
 	if (ret) {
 		DRM_ERROR("Failed to init encoder\n");
 		goto err_encoder;
-- 
2.25.1


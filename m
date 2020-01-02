Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36B7612E6A2
	for <lists+linux-tegra@lfdr.de>; Thu,  2 Jan 2020 14:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728369AbgABNXN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 2 Jan 2020 08:23:13 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59950 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728362AbgABNXN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Jan 2020 08:23:13 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 156CC28A074
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Eric Anholt <eric@anholt.net>, Shawn Guo <shawnguo@kernel.org>,
        kernel@collabora.com
Subject: [PATCH 2/4] drm/vc4: Provide ddc symlink in connector sysfs directory
Date:   Thu,  2 Jan 2020 14:22:58 +0100
Message-Id: <20200102132300.24309-3-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200102132300.24309-1-andrzej.p@collabora.com>
References: <20200102132300.24309-1-andrzej.p@collabora.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use the ddc pointer provided by the generic connector.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1c62c6c9244b..cea18dc15f77 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -267,7 +267,8 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 };
 
 static struct drm_connector *vc4_hdmi_connector_init(struct drm_device *dev,
-						     struct drm_encoder *encoder)
+						     struct drm_encoder *encoder,
+						     struct i2c_adapter *ddc)
 {
 	struct drm_connector *connector;
 	struct vc4_hdmi_connector *hdmi_connector;
@@ -281,8 +282,10 @@ static struct drm_connector *vc4_hdmi_connector_init(struct drm_device *dev,
 
 	hdmi_connector->encoder = encoder;
 
-	drm_connector_init(dev, connector, &vc4_hdmi_connector_funcs,
-			   DRM_MODE_CONNECTOR_HDMIA);
+	drm_connector_init_with_ddc(dev, connector,
+				    &vc4_hdmi_connector_funcs,
+				    DRM_MODE_CONNECTOR_HDMIA,
+				    ddc);
 	drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
 
 	/* Create and attach TV margin props to this connector. */
@@ -1395,7 +1398,8 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 			 DRM_MODE_ENCODER_TMDS, NULL);
 	drm_encoder_helper_add(hdmi->encoder, &vc4_hdmi_encoder_helper_funcs);
 
-	hdmi->connector = vc4_hdmi_connector_init(drm, hdmi->encoder);
+	hdmi->connector =
+		vc4_hdmi_connector_init(drm, hdmi->encoder, hdmi->ddc);
 	if (IS_ERR(hdmi->connector)) {
 		ret = PTR_ERR(hdmi->connector);
 		goto err_destroy_encoder;
-- 
2.17.1


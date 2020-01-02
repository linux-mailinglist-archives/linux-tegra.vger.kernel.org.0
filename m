Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D896512E6A1
	for <lists+linux-tegra@lfdr.de>; Thu,  2 Jan 2020 14:23:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgABNXN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 2 Jan 2020 08:23:13 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59966 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728361AbgABNXN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Jan 2020 08:23:13 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 811C028A0B9
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Eric Anholt <eric@anholt.net>, Shawn Guo <shawnguo@kernel.org>,
        kernel@collabora.com
Subject: [PATCH 3/4] drm: zte: Provide ddc symlink in hdmi connector sysfs directory
Date:   Thu,  2 Jan 2020 14:22:59 +0100
Message-Id: <20200102132300.24309-4-andrzej.p@collabora.com>
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
 drivers/gpu/drm/zte/zx_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/zte/zx_hdmi.c b/drivers/gpu/drm/zte/zx_hdmi.c
index a50f5a1f09b8..b98a1420dcd3 100644
--- a/drivers/gpu/drm/zte/zx_hdmi.c
+++ b/drivers/gpu/drm/zte/zx_hdmi.c
@@ -319,8 +319,10 @@ static int zx_hdmi_register(struct drm_device *drm, struct zx_hdmi *hdmi)
 
 	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
 
-	drm_connector_init(drm, &hdmi->connector, &zx_hdmi_connector_funcs,
-			   DRM_MODE_CONNECTOR_HDMIA);
+	drm_connector_init_with_ddc(drm, &hdmi->connector,
+				    &zx_hdmi_connector_funcs,
+				    DRM_MODE_CONNECTOR_HDMIA,
+				    &hdmi->ddc->adap);
 	drm_connector_helper_add(&hdmi->connector,
 				 &zx_hdmi_connector_helper_funcs);
 
-- 
2.17.1


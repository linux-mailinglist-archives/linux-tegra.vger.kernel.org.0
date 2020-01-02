Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54A7812E6A3
	for <lists+linux-tegra@lfdr.de>; Thu,  2 Jan 2020 14:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbgABNXN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 2 Jan 2020 08:23:13 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59982 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbgABNXN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Jan 2020 08:23:13 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id EA60528A0BE
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Eric Anholt <eric@anholt.net>, Shawn Guo <shawnguo@kernel.org>,
        kernel@collabora.com
Subject: [PATCH 4/4] drm: zte: Provide ddc symlink in vga connector sysfs directory
Date:   Thu,  2 Jan 2020 14:23:00 +0100
Message-Id: <20200102132300.24309-5-andrzej.p@collabora.com>
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
 drivers/gpu/drm/zte/zx_vga.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/zte/zx_vga.c b/drivers/gpu/drm/zte/zx_vga.c
index 9b67e419280c..c4fa3bbaba78 100644
--- a/drivers/gpu/drm/zte/zx_vga.c
+++ b/drivers/gpu/drm/zte/zx_vga.c
@@ -165,8 +165,10 @@ static int zx_vga_register(struct drm_device *drm, struct zx_vga *vga)
 
 	vga->connector.polled = DRM_CONNECTOR_POLL_HPD;
 
-	ret = drm_connector_init(drm, connector, &zx_vga_connector_funcs,
-				 DRM_MODE_CONNECTOR_VGA);
+	ret = drm_connector_init_with_ddc(drm, connector,
+					  &zx_vga_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA,
+					  &vga->ddc->adap);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to init connector: %d\n", ret);
 		goto clean_encoder;
-- 
2.17.1


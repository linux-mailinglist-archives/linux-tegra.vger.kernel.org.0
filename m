Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F03C03950D8
	for <lists+linux-tegra@lfdr.de>; Sun, 30 May 2021 14:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbhE3MYC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 30 May 2021 08:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbhE3MYB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 30 May 2021 08:24:01 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF67C061761
        for <linux-tegra@vger.kernel.org>; Sun, 30 May 2021 05:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=bG9I9CL3K4IOUJDfJdgcvDkyqmtvOIHkX+V+SZb9vlw=; b=dV0Y07rgJgayXU7iUuued9QStA
        FXCxs0RhCr9iD0iGvBnegCbtm4Em6dMuiBg5ZaalpvgclDhXvMw+1nDzCx8UWgrMGBTkpYBcitU/D
        o9pybuQM11b4y7PDLB8y1Ga2/mn73C6mT99+yeTMWOZs/D16745Sa2AYdNdoUxqKNFoRHB/vWZN8Q
        ZHLwZv8373k2Uug7SWJnIC7VpwAP20xjJ1PLSHMld2SL5GTFyGmZd/wLUAvLE70IglRzB7EB2jEoq
        7SSUzDnOTiUT1D1tzNGRo8pYMXZ95khOrkUT1nM++j4AR4yg0GYk/Bbo/DsmHuiflCkdPNZruxc4Q
        +bl/lHxA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lnKSQ-000775-Do; Sun, 30 May 2021 15:22:18 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v6 11/14] drm/tegra: Implement syncpoint wait UAPI
Date:   Sun, 30 May 2021 15:21:53 +0300
Message-Id: <20210530122156.3292479-12-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210530122156.3292479-1-mperttunen@nvidia.com>
References: <20210530122156.3292479-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Implement new syncpoint wait UAPI. This is different from the
legacy one in taking an absolute timestamp in line with modern
DRM conventions.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v6:
- New patch
---
 drivers/gpu/drm/tegra/drm.c  |  2 ++
 drivers/gpu/drm/tegra/uapi.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/tegra/uapi.h |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 7530c988f795..b76bfdd078df 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -731,6 +731,8 @@ static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPOINT_FREE, tegra_drm_ioctl_syncpoint_free,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPOINT_WAIT, tegra_drm_ioctl_syncpoint_wait,
+			  DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_gem_create, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_gem_mmap, DRM_RENDER_ALLOW),
diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
index 2788c5b4ae4f..b411d050b7d8 100644
--- a/drivers/gpu/drm/tegra/uapi.c
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_utils.h>
 
 #include "drm.h"
 #include "uapi.h"
@@ -350,3 +351,24 @@ int tegra_drm_ioctl_syncpoint_free(struct drm_device *drm, void *data,
 
 	return 0;
 }
+
+int tegra_drm_ioctl_syncpoint_wait(struct drm_device *drm, void *data,
+				   struct drm_file *file)
+{
+	struct host1x *host1x = tegra_drm_to_host1x(drm->dev_private);
+	struct drm_tegra_syncpoint_wait *args = data;
+	signed long timeout_jiffies;
+	struct host1x_syncpt *sp;
+
+	if (args->padding[0] != 0)
+		return -EINVAL;
+
+	sp = host1x_syncpt_get_by_id_noref(host1x, args->id);
+	if (!sp)
+		return -EINVAL;
+
+	timeout_jiffies = drm_timeout_abs_to_jiffies(args->timeout_ns);
+
+	return host1x_syncpt_wait(sp, args->threshold, timeout_jiffies,
+				  &args->value);
+}
diff --git a/drivers/gpu/drm/tegra/uapi.h b/drivers/gpu/drm/tegra/uapi.h
index e4e498facf61..12adad770ad3 100644
--- a/drivers/gpu/drm/tegra/uapi.h
+++ b/drivers/gpu/drm/tegra/uapi.h
@@ -49,6 +49,8 @@ int tegra_drm_ioctl_syncpoint_allocate(struct drm_device *drm, void *data,
 				       struct drm_file *file);
 int tegra_drm_ioctl_syncpoint_free(struct drm_device *drm, void *data,
 				   struct drm_file *file);
+int tegra_drm_ioctl_syncpoint_wait(struct drm_device *drm, void *data,
+				   struct drm_file *file);
 
 void tegra_drm_uapi_close_file(struct tegra_drm_file *file);
 void tegra_drm_mapping_put(struct tegra_drm_mapping *mapping);
-- 
2.30.1


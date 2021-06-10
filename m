Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B883A29C7
	for <lists+linux-tegra@lfdr.de>; Thu, 10 Jun 2021 13:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbhFJLHU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 10 Jun 2021 07:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbhFJLHR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Jun 2021 07:07:17 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85967C06124A
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jun 2021 04:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=z3UsU1YWxjNYAuG9pu89hNfxGQLoCHGghhR3wfWxFvc=; b=gRe3EYL7lE5i6+6Gge7d6NQg+C
        87CARwycg+4IO2s5JmJvOqo5O4IbSY4CUx13yvT6Rvv8VU3XPsBFJq2AQoci6X3o4gBRfR9Ny6z2t
        vbx7pcODC1estU3Jo5Wbs4ejvKQy3baLPqJzGPdRmdwge46i8zqsMBwXDTezPKKeyi45Oz8P2FUJz
        cLyhT2s1RJvQYbSfUJZERfoTjOCGvXbfhXmLMWWqr9p9lahezZs8xs72wyKuLNwPfKSqqPt6Dqypk
        TdcpXnFgAlJ+43anViRJCsmXmez6vAzJFkrDth/a1IzAVIzZGadBWyR+saJjmAJdSDFo4vDrnn8Is
        hJ8G2Hww==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lrIUt-0001s7-Gq; Thu, 10 Jun 2021 14:05:15 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v7 11/15] drm/tegra: Implement syncpoint management UAPI
Date:   Thu, 10 Jun 2021 14:04:52 +0300
Message-Id: <20210610110456.3692391-12-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210610110456.3692391-1-mperttunen@nvidia.com>
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Implement TegraDRM IOCTLs for allocating and freeing syncpoints.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v6:
- New patch
---
 drivers/gpu/drm/tegra/drm.c  |  5 ++++
 drivers/gpu/drm/tegra/uapi.c | 56 ++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/tegra/uapi.h |  5 ++++
 3 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 05ceddfef643..1237e7a02e14 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -92,6 +92,7 @@ static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
 
 	idr_init_base(&fpriv->legacy_contexts, 1);
 	xa_init_flags(&fpriv->contexts, XA_FLAGS_ALLOC1);
+	xa_init(&fpriv->syncpoints);
 	mutex_init(&fpriv->lock);
 	filp->driver_priv = fpriv;
 
@@ -727,6 +728,10 @@ static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_UNMAP, tegra_drm_ioctl_channel_unmap,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPOINT_ALLOCATE, tegra_drm_ioctl_syncpoint_allocate,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPOINT_FREE, tegra_drm_ioctl_syncpoint_free,
+			  DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_gem_create, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_gem_mmap, DRM_RENDER_ALLOW),
diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
index 1e5b29f8ae71..1cc97d79bc5c 100644
--- a/drivers/gpu/drm/tegra/uapi.c
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -48,13 +48,18 @@ static void tegra_drm_channel_ctx_close(struct tegra_drm_context *ctx)
 
 void tegra_drm_uapi_close_file(struct tegra_drm_file *file)
 {
-	unsigned long ctx_id;
 	struct tegra_drm_context *ctx;
+	struct host1x_syncpt *sp;
+	unsigned long id;
 
-	xa_for_each(&file->contexts, ctx_id, ctx)
+	xa_for_each(&file->contexts, id, ctx)
 		tegra_drm_channel_ctx_close(ctx);
 
+	xa_for_each(&file->syncpoints, id, sp)
+		host1x_syncpt_put(sp);
+
 	xa_destroy(&file->contexts);
+	xa_destroy(&file->syncpoints);
 }
 
 static struct tegra_drm_client *tegra_drm_find_client(struct tegra_drm *tegra,
@@ -261,3 +266,50 @@ int tegra_drm_ioctl_channel_unmap(struct drm_device *drm, void *data,
 		return -EINVAL;
 	}
 }
+
+int tegra_drm_ioctl_syncpoint_allocate(struct drm_device *drm, void *data,
+				       struct drm_file *file)
+{
+	struct host1x *host1x = tegra_drm_to_host1x(drm->dev_private);
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_syncpoint_allocate *args = data;
+	struct host1x_syncpt *sp;
+	int err;
+
+	if (args->id)
+		return -EINVAL;
+
+	sp = host1x_syncpt_alloc(host1x, HOST1X_SYNCPT_CLIENT_MANAGED,
+				 current->comm);
+	if (!sp)
+		return -EBUSY;
+
+	args->id = host1x_syncpt_id(sp);
+
+	err = xa_insert(&fpriv->syncpoints, args->id, sp, GFP_KERNEL);
+	if (err) {
+		host1x_syncpt_put(sp);
+		return err;
+	}
+
+	return 0;
+}
+
+int tegra_drm_ioctl_syncpoint_free(struct drm_device *drm, void *data,
+				   struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_syncpoint_allocate *args = data;
+	struct host1x_syncpt *sp;
+
+	mutex_lock(&fpriv->lock);
+	sp = xa_erase(&fpriv->syncpoints, args->id);
+	mutex_unlock(&fpriv->lock);
+
+	if (!sp)
+		return -EINVAL;
+
+	host1x_syncpt_put(sp);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/tegra/uapi.h b/drivers/gpu/drm/tegra/uapi.h
index fbef39726c29..e4e498facf61 100644
--- a/drivers/gpu/drm/tegra/uapi.h
+++ b/drivers/gpu/drm/tegra/uapi.h
@@ -21,6 +21,7 @@ struct tegra_drm_file {
 
 	/* New UAPI state */
 	struct xarray contexts;
+	struct xarray syncpoints;
 };
 
 struct tegra_drm_mapping {
@@ -44,6 +45,10 @@ int tegra_drm_ioctl_channel_unmap(struct drm_device *drm, void *data,
 				  struct drm_file *file);
 int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
 				   struct drm_file *file);
+int tegra_drm_ioctl_syncpoint_allocate(struct drm_device *drm, void *data,
+				       struct drm_file *file);
+int tegra_drm_ioctl_syncpoint_free(struct drm_device *drm, void *data,
+				   struct drm_file *file);
 
 void tegra_drm_uapi_close_file(struct tegra_drm_file *file);
 void tegra_drm_mapping_put(struct tegra_drm_mapping *mapping);
-- 
2.30.1


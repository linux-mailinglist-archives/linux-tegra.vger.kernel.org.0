Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7373F3950E4
	for <lists+linux-tegra@lfdr.de>; Sun, 30 May 2021 14:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbhE3MYF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 30 May 2021 08:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbhE3MYC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 30 May 2021 08:24:02 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140B2C061761
        for <linux-tegra@vger.kernel.org>; Sun, 30 May 2021 05:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Y1Y1trHmnHXXeuzyu/yNRR1XvtygQqvcgRJ5sXhhDRk=; b=BdpENrFe4OdsxmaCakuoXZ1uvU
        T8SA7dsDj6omr4B9EW2/5oY5ixTiad+BpKAqjOzcTPzb/B0T0HWmWqcy2JOEdQmK/l1UQkHnxvKG5
        wdMIO66o1tdP76o0e7gTYXJ+gIG3rfgW2Z5hyO2/PkOgiCUrYSA6WoEOjGfMBC13ty464LaT3E/wM
        V9NGtqigCR8919DXU+knXpMk4bAFK2Vth5qQYU+Irdto0mnF1MV9MzdrXQmGGaZ15l1LAQ0ug2Ejq
        EI88Mz9pO9YLxF1OT5TkmkUue0H63YxGZXZCIlnq/DxZyxM5bZv4hlj1SO13O9l8SootkFflYX1TS
        EBCodqDg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lnKSQ-000775-8m; Sun, 30 May 2021 15:22:18 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v6 09/14] drm/tegra: Implement new UAPI
Date:   Sun, 30 May 2021 15:21:51 +0300
Message-Id: <20210530122156.3292479-10-mperttunen@nvidia.com>
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

Implement the non-submission parts of the new UAPI, including
channel management and memory mapping. The UAPI is under the
CONFIG_DRM_TEGRA_STAGING config flag for now.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v6:
* Whitespace fixes
* Tell userspace if engine is cache coherent when opening
  a channel
* Removed uapi subdirectory
* Reuse tegra_drm_context instead of creating new
  tegra_drm_channel_ctx
* Remove tegra_drm_channel_ctx_lock
* Simplify id variable names
* Remove unused close_channel_ctx function
* Use tegra_gem_lookup
* Clean up channel_open by outlining client-finding
  code
* Use DMA API path when there is no IOMMU
* Remove unnecessary comment
* Remove new GEM_CREATE/GEM_MMAP
* Move unlock in channel_map to avoid double unlock
  on error path.
v5:
* Set iova_end in both mapping paths
v4:
* New patch, split out from combined UAPI + submit patch.
---
 drivers/gpu/drm/tegra/Makefile |   1 +
 drivers/gpu/drm/tegra/drm.c    |  37 ++--
 drivers/gpu/drm/tegra/drm.h    |  10 ++
 drivers/gpu/drm/tegra/uapi.c   | 300 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/uapi.h   |  51 ++++++
 5 files changed, 383 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/uapi.c
 create mode 100644 drivers/gpu/drm/tegra/uapi.h

diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index d6cf202414f0..783475ffd943 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -3,6 +3,7 @@ ccflags-$(CONFIG_DRM_TEGRA_DEBUG) += -DDEBUG
 
 tegra-drm-y := \
 	drm.o \
+	uapi.o \
 	gem.o \
 	fb.o \
 	dp.o \
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index a27e5a89d676..a15954c1a047 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -20,6 +20,7 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_vblank.h>
 
+#include "uapi.h"
 #include "drm.h"
 #include "gem.h"
 
@@ -33,11 +34,6 @@
 #define CARVEOUT_SZ SZ_64M
 #define CDMA_GATHER_FETCHES_MAX_NB 16383
 
-struct tegra_drm_file {
-	struct idr contexts;
-	struct mutex lock;
-};
-
 static int tegra_atomic_check(struct drm_device *drm,
 			      struct drm_atomic_state *state)
 {
@@ -93,7 +89,8 @@ static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
 	if (!fpriv)
 		return -ENOMEM;
 
-	idr_init_base(&fpriv->contexts, 1);
+	idr_init_base(&fpriv->legacy_contexts, 1);
+	xa_init_flags(&fpriv->contexts, XA_FLAGS_ALLOC1);
 	mutex_init(&fpriv->lock);
 	filp->driver_priv = fpriv;
 
@@ -418,7 +415,7 @@ static int tegra_client_open(struct tegra_drm_file *fpriv,
 	if (err < 0)
 		return err;
 
-	err = idr_alloc(&fpriv->contexts, context, 1, 0, GFP_KERNEL);
+	err = idr_alloc(&fpriv->legacy_contexts, context, 1, 0, GFP_KERNEL);
 	if (err < 0) {
 		client->ops->close_channel(context);
 		return err;
@@ -473,13 +470,13 @@ static int tegra_close_channel(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = idr_find(&fpriv->contexts, args->context);
+	context = idr_find(&fpriv->legacy_contexts, args->context);
 	if (!context) {
 		err = -EINVAL;
 		goto unlock;
 	}
 
-	idr_remove(&fpriv->contexts, context->id);
+	idr_remove(&fpriv->legacy_contexts, context->id);
 	tegra_drm_context_free(context);
 
 unlock:
@@ -498,7 +495,7 @@ static int tegra_get_syncpt(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = idr_find(&fpriv->contexts, args->context);
+	context = idr_find(&fpriv->legacy_contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
@@ -527,7 +524,7 @@ static int tegra_submit(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = idr_find(&fpriv->contexts, args->context);
+	context = idr_find(&fpriv->legacy_contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
@@ -552,7 +549,7 @@ static int tegra_get_syncpt_base(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = idr_find(&fpriv->contexts, args->context);
+	context = idr_find(&fpriv->legacy_contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
@@ -721,10 +718,17 @@ static int tegra_gem_get_flags(struct drm_device *drm, void *data,
 
 static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
 #ifdef CONFIG_DRM_TEGRA_STAGING
-	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_gem_create,
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_OPEN, tegra_drm_ioctl_channel_open,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_CLOSE, tegra_drm_ioctl_channel_close,
 			  DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_gem_mmap,
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_MAP, tegra_drm_ioctl_channel_map,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_UNMAP, tegra_drm_ioctl_channel_unmap,
+			  DRM_RENDER_ALLOW),
+
+	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_gem_create, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_gem_mmap, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPT_READ, tegra_syncpt_read,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPT_INCR, tegra_syncpt_incr,
@@ -778,10 +782,11 @@ static void tegra_drm_postclose(struct drm_device *drm, struct drm_file *file)
 	struct tegra_drm_file *fpriv = file->driver_priv;
 
 	mutex_lock(&fpriv->lock);
-	idr_for_each(&fpriv->contexts, tegra_drm_context_cleanup, NULL);
+	idr_for_each(&fpriv->legacy_contexts, tegra_drm_context_cleanup, NULL);
+	tegra_drm_uapi_close_file(fpriv);
 	mutex_unlock(&fpriv->lock);
 
-	idr_destroy(&fpriv->contexts);
+	idr_destroy(&fpriv->legacy_contexts);
 	mutex_destroy(&fpriv->lock);
 	kfree(fpriv);
 }
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 1ec07034727c..99918a532809 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -59,12 +59,22 @@ struct tegra_drm {
 	struct tegra_display_hub *hub;
 };
 
+static inline struct host1x *tegra_drm_to_host1x(struct tegra_drm *tegra)
+{
+	return dev_get_drvdata(tegra->drm->dev->parent);
+}
+
 struct tegra_drm_client;
 
 struct tegra_drm_context {
 	struct tegra_drm_client *client;
 	struct host1x_channel *channel;
+
+	/* Only used by legacy UAPI. */
 	unsigned int id;
+
+	/* Only used by new UAPI. */
+	struct xarray mappings;
 };
 
 struct tegra_drm_client_ops {
diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
new file mode 100644
index 000000000000..59b698817d5c
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2020 NVIDIA Corporation */
+
+#include <linux/host1x.h>
+#include <linux/iommu.h>
+#include <linux/list.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+
+#include "drm.h"
+#include "uapi.h"
+
+static void tegra_drm_mapping_release(struct kref *ref)
+{
+	struct tegra_drm_mapping *mapping =
+		container_of(ref, struct tegra_drm_mapping, ref);
+
+	if (mapping->sgt)
+		dma_unmap_sgtable(mapping->dev, mapping->sgt,
+				  mapping->direction, DMA_ATTR_SKIP_CPU_SYNC);
+
+	host1x_bo_unpin(mapping->dev, mapping->bo, mapping->sgt);
+	host1x_bo_put(mapping->bo);
+
+	kfree(mapping);
+}
+
+void tegra_drm_mapping_put(struct tegra_drm_mapping *mapping)
+{
+	kref_put(&mapping->ref, tegra_drm_mapping_release);
+}
+
+static void tegra_drm_channel_ctx_close(struct tegra_drm_context *ctx)
+{
+	struct tegra_drm_mapping *mapping;
+	unsigned long id;
+
+	xa_for_each(&ctx->mappings, id, mapping)
+		tegra_drm_mapping_put(mapping);
+
+	xa_destroy(&ctx->mappings);
+
+	host1x_channel_put(ctx->channel);
+
+	kfree(ctx);
+}
+
+void tegra_drm_uapi_close_file(struct tegra_drm_file *file)
+{
+	unsigned long ctx_id;
+	struct tegra_drm_context *ctx;
+
+	xa_for_each(&file->contexts, ctx_id, ctx)
+		tegra_drm_channel_ctx_close(ctx);
+
+	xa_destroy(&file->contexts);
+}
+
+static struct tegra_drm_client *tegra_drm_find_client(struct tegra_drm *tegra,
+						      u32 class)
+{
+	struct tegra_drm_client *client;
+
+	list_for_each_entry(client, &tegra->clients, list)
+		if (client->base.class == class)
+			return client;
+
+	return NULL;
+}
+
+int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data,
+				 struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct tegra_drm *tegra = drm->dev_private;
+	struct drm_tegra_channel_open *args = data;
+	struct tegra_drm_client *client = NULL;
+	struct tegra_drm_context *ctx;
+	int err;
+
+	if (args->flags)
+		return -EINVAL;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	client = tegra_drm_find_client(tegra, args->host1x_class);
+	if (!client) {
+		err = -ENODEV;
+		goto free_ctx;
+	}
+
+	if (client->shared_channel) {
+		ctx->channel = host1x_channel_get(client->shared_channel);
+	} else {
+		ctx->channel = host1x_channel_request(&client->base);
+		if (!ctx->channel) {
+			err = -EBUSY;
+			goto free_ctx;
+		}
+	}
+
+	err = xa_alloc(&fpriv->contexts, &args->channel_ctx, ctx,
+		       XA_LIMIT(1, U32_MAX), GFP_KERNEL);
+	if (err < 0)
+		goto put_channel;
+
+	ctx->client = client;
+	xa_init_flags(&ctx->mappings, XA_FLAGS_ALLOC1);
+
+	args->hardware_version = client->version;
+
+	args->hardware_flags = 0;
+	if (device_get_dma_attr(client->base.dev) == DEV_DMA_COHERENT)
+		args->hardware_flags |= DRM_TEGRA_CHANNEL_OPEN_HW_CACHE_COHERENT;
+
+	return 0;
+
+put_channel:
+	host1x_channel_put(ctx->channel);
+free_ctx:
+	kfree(ctx);
+
+	return err;
+}
+
+int tegra_drm_ioctl_channel_close(struct drm_device *drm, void *data,
+				  struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_channel_close *args = data;
+	struct tegra_drm_context *ctx;
+
+	mutex_lock(&fpriv->lock);
+	ctx = xa_load(&fpriv->contexts, args->channel_ctx);
+	if (!ctx) {
+		mutex_unlock(&fpriv->lock);
+		return -EINVAL;
+	}
+
+	xa_erase(&fpriv->contexts, args->channel_ctx);
+
+	mutex_unlock(&fpriv->lock);
+
+	tegra_drm_channel_ctx_close(ctx);
+
+	return 0;
+}
+
+int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data,
+				struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_channel_map *args = data;
+	struct tegra_drm_mapping *mapping;
+	struct tegra_drm_context *ctx;
+	int err = 0;
+
+	if (args->flags & ~DRM_TEGRA_CHANNEL_MAP_READWRITE)
+		return -EINVAL;
+
+	mutex_lock(&fpriv->lock);
+	ctx = xa_load(&fpriv->contexts, args->channel_ctx);
+	if (!ctx) {
+		mutex_unlock(&fpriv->lock);
+		return -EINVAL;
+	}
+
+	mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
+	if (!mapping) {
+		err = -ENOMEM;
+		goto unlock;
+	}
+
+	kref_init(&mapping->ref);
+
+	mapping->dev = ctx->client->base.dev;
+	mapping->bo = tegra_gem_lookup(file, args->handle);
+	if (!mapping->bo) {
+		err = -EINVAL;
+		goto unlock;
+	}
+
+	if (ctx->client->base.group) {
+		/* IOMMU domain managed directly using IOMMU API */
+		host1x_bo_pin(mapping->dev, mapping->bo,
+			      &mapping->iova);
+	} else {
+		/* No IOMMU, or IOMMU managed through DMA API */
+		mapping->direction = DMA_TO_DEVICE;
+		if (args->flags & DRM_TEGRA_CHANNEL_MAP_READWRITE)
+			mapping->direction = DMA_BIDIRECTIONAL;
+
+		mapping->sgt =
+			host1x_bo_pin(mapping->dev, mapping->bo, NULL);
+		if (IS_ERR(mapping->sgt)) {
+			err = PTR_ERR(mapping->sgt);
+			goto put_gem;
+		}
+
+		err = dma_map_sgtable(mapping->dev, mapping->sgt,
+				      mapping->direction,
+				      DMA_ATTR_SKIP_CPU_SYNC);
+		if (err)
+			goto unpin;
+
+		mapping->iova = sg_dma_address(mapping->sgt->sgl);
+	}
+
+	mapping->iova_end = mapping->iova + host1x_to_tegra_bo(mapping->bo)->size;
+
+	err = xa_alloc(&ctx->mappings, &args->mapping_id, mapping,
+		       XA_LIMIT(1, U32_MAX), GFP_KERNEL);
+	if (err < 0)
+		goto unmap;
+
+	mutex_unlock(&fpriv->lock);
+
+	return 0;
+
+unmap:
+	if (mapping->sgt) {
+		dma_unmap_sgtable(mapping->dev, mapping->sgt,
+				  mapping->direction, DMA_ATTR_SKIP_CPU_SYNC);
+	}
+unpin:
+	host1x_bo_unpin(mapping->dev, mapping->bo, mapping->sgt);
+put_gem:
+	host1x_bo_put(mapping->bo);
+	kfree(mapping);
+unlock:
+	mutex_unlock(&fpriv->lock);
+	return err;
+}
+
+int tegra_drm_ioctl_channel_unmap(struct drm_device *drm, void *data,
+				  struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_channel_unmap *args = data;
+	struct tegra_drm_mapping *mapping;
+	struct tegra_drm_context *ctx;
+
+	mutex_lock(&fpriv->lock);
+	ctx = xa_load(&fpriv->contexts, args->channel_ctx);
+	if (!ctx) {
+		mutex_unlock(&fpriv->lock);
+		return -EINVAL;
+	}
+
+	mapping = xa_erase(&ctx->mappings, args->mapping_id);
+
+	mutex_unlock(&fpriv->lock);
+
+	if (mapping) {
+		tegra_drm_mapping_put(mapping);
+		return 0;
+	} else {
+		return -EINVAL;
+	}
+}
+
+int tegra_drm_ioctl_gem_create(struct drm_device *drm, void *data,
+			       struct drm_file *file)
+{
+	struct drm_tegra_gem_create *args = data;
+	struct tegra_bo *bo;
+
+	if (args->flags)
+		return -EINVAL;
+
+	bo = tegra_bo_create_with_handle(file, drm, args->size, args->flags,
+					 &args->handle);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	return 0;
+}
+
+int tegra_drm_ioctl_gem_mmap(struct drm_device *drm, void *data,
+			     struct drm_file *file)
+{
+	struct drm_tegra_gem_mmap *args = data;
+	struct drm_gem_object *gem;
+	struct tegra_bo *bo;
+
+	gem = drm_gem_object_lookup(file, args->handle);
+	if (!gem)
+		return -EINVAL;
+
+	bo = to_tegra_bo(gem);
+
+	args->offset = drm_vma_node_offset_addr(&bo->gem.vma_node);
+
+	drm_gem_object_put(gem);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/tegra/uapi.h b/drivers/gpu/drm/tegra/uapi.h
new file mode 100644
index 000000000000..fbef39726c29
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2020 NVIDIA Corporation */
+
+#ifndef _TEGRA_DRM_UAPI_H
+#define _TEGRA_DRM_UAPI_H
+
+#include <linux/dma-mapping.h>
+#include <linux/idr.h>
+#include <linux/kref.h>
+#include <linux/xarray.h>
+
+#include <drm/drm.h>
+
+struct drm_file;
+struct drm_device;
+
+struct tegra_drm_file {
+	/* Legacy UAPI state */
+	struct idr legacy_contexts;
+	struct mutex lock;
+
+	/* New UAPI state */
+	struct xarray contexts;
+};
+
+struct tegra_drm_mapping {
+	struct kref ref;
+
+	struct device *dev;
+	struct host1x_bo *bo;
+	struct sg_table *sgt;
+	enum dma_data_direction direction;
+	dma_addr_t iova;
+	dma_addr_t iova_end;
+};
+
+int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data,
+				 struct drm_file *file);
+int tegra_drm_ioctl_channel_close(struct drm_device *drm, void *data,
+				  struct drm_file *file);
+int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data,
+				struct drm_file *file);
+int tegra_drm_ioctl_channel_unmap(struct drm_device *drm, void *data,
+				  struct drm_file *file);
+int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
+				   struct drm_file *file);
+
+void tegra_drm_uapi_close_file(struct tegra_drm_file *file);
+void tegra_drm_mapping_put(struct tegra_drm_mapping *mapping);
+
+#endif
-- 
2.30.1


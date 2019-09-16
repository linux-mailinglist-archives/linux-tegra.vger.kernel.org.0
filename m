Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 531E5B3D2A
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Sep 2019 17:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbfIPPEf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Sep 2019 11:04:35 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45867 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730458AbfIPPEe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Sep 2019 11:04:34 -0400
Received: by mail-ed1-f67.google.com with SMTP id h33so331115edh.12
        for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2019 08:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FJlOwAXiSilHvUnHmYW+dmFOwIiOXstK6Y21ZKlB/PI=;
        b=drQZ9ImxauWX/3jXkmQx8tZCEZgXLTRBiO0Cxjcrrp5dWoFbUTE0uhJG8uBjsC84NA
         Vs4W8l6Fx2B3uFhE4Z9Eb3/vCJ1TwAw3wIism+65ctGeBjCk5EP0ozMx9zmJffsZGJDQ
         k1gmsinYeZlPtb0y8rRKSy6Ea4hJMXBajuLDn69h4SQAgYJdrCErwroVP1mA7URHJ63D
         Pe5F8LdRdcKZPn/7yF1Rnh7u8Y9iRDHwujMtiHP5AUOMmaBX5CyvY8sc217HEZdq42X5
         o+oXe6LdNWmSV06ghK8ys8PXd0Sdo0gyGCZEssHoxFEtyj1Fpmh/pD+0jVvpQZvb4O5O
         VCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FJlOwAXiSilHvUnHmYW+dmFOwIiOXstK6Y21ZKlB/PI=;
        b=jJ/Y8yupx5SxEwx5aHdyV3USFUND+5S15N4GGIwKeta1uSnH0f4IXpT8sIVadswQPd
         rE8awN76VwV14qf/jrZtD9j1goFYOiPOdtqeOnAmIMuO9pokGR0Fp13RdhRXoTUA9371
         k3ceSXE2+48VrYdErrFqKxjW5KeX/jSo5tdTi5slLXtWj+48RAzln+QT67wJejchusxp
         hhdo22AXZMDbMQoIQI9pdBePLqlIJt1fmbrDzvdgrSYsrXDkO31oWS6aAgzD8Fp1JTwH
         G98PzbNyYBJztXKeRPBr2frxXpdmSeYtl+XhpEx4yzGlkWirm3PZWEbxrslyB5ssqSmu
         sg/g==
X-Gm-Message-State: APjAAAW1mgEVR/LzC0Bb9X2j8Jnug1pqR/1K2SoY462FuHThUygnOCf/
        RdCTt4nY5EmwUJccJ8pQkMyFS13c
X-Google-Smtp-Source: APXvYqyhSix6HWrhpHfek1wjTzN4hw0goqzM+YDA9NO2fJP15tFL8WhP2fkqfUw0hWg6/1EAxBBhDg==
X-Received: by 2002:a17:906:cf8a:: with SMTP id um10mr428922ejb.310.1568646272470;
        Mon, 16 Sep 2019 08:04:32 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id i63sm2314899edi.65.2019.09.16.08.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 08:04:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 07/11] drm/nouveau: gk20a: Implement custom MMU class
Date:   Mon, 16 Sep 2019 17:04:08 +0200
Message-Id: <20190916150412.10025-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916150412.10025-1-thierry.reding@gmail.com>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The GPU integrated in NVIDIA Tegra SoCs is connected to system memory
via two paths: one direct path to the memory controller and another path
that goes through a system MMU first. It's not typically necessary to go
through the system MMU because the GPU's MMU can already map buffers so
that they appear contiguous to the GPU.

However, in order to support big pages, the system MMU has to be used to
combine multiple small pages into one virtually contiguous chunk so that
the GPU can then treat that as a single big page.

In order to prepare for big page support, implement a custom MMU class
that takes care of setting the IOMMU bit when writing page tables and
when appropriate.

This is also necessary to make sure that Nouveau works correctly on
Tegra devices where the GPU is connected to a system MMU and that IOMMU
is used to back the DMA API. Currently Nouveau assumes that the DMA API
is never backed by an IOMMU, so access to DMA-mapped buffers fault when
suddenly this assumption is no longer true.

One situation where this can happen is on 32-bit Tegra SoCs where the
ARM architecture code automatically attaches the GPU with a DMA/IOMMU
domain. This is currently worked around by detaching the GPU from the
IOMMU domain at probe time. However, with Tegra186 and later this can
now also happen, but unfortunately no mechanism exists to detach from
the domain in the 64-bit ARM architecture code.

Using this Tegra-specific MMU class ensures that DMA-mapped buffers are
properly mapped (with the IOMMU bit set) if the DMA API is backed by an
IOMMU domain.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.c   | 50 ++++++++++++++++++-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.h   | 44 ++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/mmu/gm20b.c   |  6 ++-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/gp10b.c   |  4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |  1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c    | 22 +++++++-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c    |  4 +-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c    | 20 +++++++-
 8 files changed, 142 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.h

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.c
index ac74965a60d4..d9a5e05b7dc7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.c
@@ -19,11 +19,59 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
+
+#include "gk20a.h"
 #include "mem.h"
 #include "vmm.h"
 
+#include <nvkm/core/tegra.h>
 #include <nvif/class.h>
 
+static void
+gk20a_mmu_ctor(const struct nvkm_mmu_func *func, struct nvkm_device *device,
+	       int index, struct gk20a_mmu *mmu)
+{
+	struct iommu_domain *domain = iommu_get_domain_for_dev(device->dev);
+	struct nvkm_device_tegra *tegra = device->func->tegra(device);
+
+	nvkm_mmu_ctor(func, device, index, &mmu->base);
+
+	/*
+	 * If the DMA API is backed by an IOMMU, make sure the IOMMU bit is
+	 * set for all buffer accesses. If the IOMMU is explicitly used, it
+	 * is only used for instance blocks and the MMU doesn't care, since
+	 * buffer objects are only mapped through the MMU, not through the
+	 * IOMMU.
+	 *
+	 * Big page support could be implemented using explicit IOMMU usage,
+	 * but the DMA API already provides that for free, so we don't worry
+	 * about it for now.
+	 */
+	if (domain && !tegra->iommu.domain) {
+		mmu->iommu_mask = BIT_ULL(tegra->func->iommu_bit);
+		nvkm_debug(&mmu->base.subdev, "IOMMU mask: %llx\n",
+			   mmu->iommu_mask);
+	}
+}
+
+int
+gk20a_mmu_new_(const struct nvkm_mmu_func *func, struct nvkm_device *device,
+	       int index, struct nvkm_mmu **pmmu)
+{
+	struct gk20a_mmu *mmu;
+
+	mmu = kzalloc(sizeof(*mmu), GFP_KERNEL);
+	if (!mmu)
+		return -ENOMEM;
+
+	gk20a_mmu_ctor(func, device, index, mmu);
+
+	if (pmmu)
+		*pmmu = &mmu->base;
+
+	return 0;
+}
+
 static const struct nvkm_mmu_func
 gk20a_mmu = {
 	.dma_bits = 40,
@@ -37,5 +85,5 @@ gk20a_mmu = {
 int
 gk20a_mmu_new(struct nvkm_device *device, int index, struct nvkm_mmu **pmmu)
 {
-	return nvkm_mmu_new_(&gk20a_mmu, device, index, pmmu);
+	return gk20a_mmu_new_(&gk20a_mmu, device, index, pmmu);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.h
new file mode 100644
index 000000000000..bb81fc62509c
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.h
@@ -0,0 +1,44 @@
+/*
+ * Copyright (c) 2019 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef __NVKM_MMU_GK20A_H__
+#define __NVKM_MMU_GK20A_H__
+
+#include "priv.h"
+
+struct gk20a_mmu {
+	struct nvkm_mmu base;
+
+	/*
+	 * If an IOMMU is used, indicates which address bit will trigger an
+	 * IOMMU translation when set (when this bit is not set, the IOMMU is
+	 * bypassed). A value of 0 means an IOMMU is never used.
+	 */
+	u64 iommu_mask;
+};
+
+#define gk20a_mmu(mmu) container_of(mmu, struct gk20a_mmu, base)
+
+int gk20a_mmu_new_(const struct nvkm_mmu_func *, struct nvkm_device *,
+		   int index, struct nvkm_mmu **);
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm20b.c
index 7353a94b4091..7fccd4df52a8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm20b.c
@@ -19,6 +19,8 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
+
+#include "gk20a.h"
 #include "mem.h"
 #include "vmm.h"
 
@@ -50,6 +52,6 @@ int
 gm20b_mmu_new(struct nvkm_device *device, int index, struct nvkm_mmu **pmmu)
 {
 	if (device->fb->page)
-		return nvkm_mmu_new_(&gm20b_mmu_fixed, device, index, pmmu);
-	return nvkm_mmu_new_(&gm20b_mmu, device, index, pmmu);
+		return gk20a_mmu_new_(&gm20b_mmu_fixed, device, index, pmmu);
+	return gk20a_mmu_new_(&gm20b_mmu, device, index, pmmu);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp10b.c
index 0a50be9a785a..ae3cb47be3d8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp10b.c
@@ -19,6 +19,8 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
+
+#include "gk20a.h"
 #include "mem.h"
 #include "vmm.h"
 
@@ -41,5 +43,5 @@ gp10b_mmu_new(struct nvkm_device *device, int index, struct nvkm_mmu **pmmu)
 {
 	if (!nvkm_boolopt(device->cfgopt, "GP100MmuLayout", true))
 		return gm20b_mmu_new(device, index, pmmu);
-	return nvkm_mmu_new_(&gp10b_mmu, device, index, pmmu);
+	return gk20a_mmu_new_(&gp10b_mmu, device, index, pmmu);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
index 5e55ecbd8005..fb3a9e8bb9cd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -213,6 +213,7 @@ void gf100_vmm_invalidate(struct nvkm_vmm *, u32 type);
 void gf100_vmm_invalidate_pdb(struct nvkm_vmm *, u64 addr);
 
 int gk20a_vmm_aper(enum nvkm_memory_target);
+int gk20a_vmm_valid(struct nvkm_vmm *, void *, u32, struct nvkm_vmm_map *);
 
 int gm200_vmm_new_(const struct nvkm_vmm_func *, const struct nvkm_vmm_func *,
 		   struct nvkm_mmu *, bool, u64, u64, void *, u32,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c
index 5a9582dce970..16d7bf727292 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c
@@ -19,6 +19,8 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
+
+#include "gk20a.h"
 #include "vmm.h"
 
 #include <core/memory.h>
@@ -33,12 +35,28 @@ gk20a_vmm_aper(enum nvkm_memory_target target)
 	}
 }
 
+int
+gk20a_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
+		struct nvkm_vmm_map *map)
+{
+	struct gk20a_mmu *mmu = gk20a_mmu(vmm->mmu);
+	int ret;
+
+	ret = gf100_vmm_valid(vmm, argv, argc, map);
+	if (ret < 0)
+		return ret;
+
+	map->type |= mmu->iommu_mask >> 8;
+
+	return 0;
+}
+
 static const struct nvkm_vmm_func
 gk20a_vmm_17 = {
 	.join = gf100_vmm_join,
 	.part = gf100_vmm_part,
 	.aper = gf100_vmm_aper,
-	.valid = gf100_vmm_valid,
+	.valid = gk20a_vmm_valid,
 	.flush = gf100_vmm_flush,
 	.invalidate_pdb = gf100_vmm_invalidate_pdb,
 	.page = {
@@ -53,7 +71,7 @@ gk20a_vmm_16 = {
 	.join = gf100_vmm_join,
 	.part = gf100_vmm_part,
 	.aper = gf100_vmm_aper,
-	.valid = gf100_vmm_valid,
+	.valid = gk20a_vmm_valid,
 	.flush = gf100_vmm_flush,
 	.invalidate_pdb = gf100_vmm_invalidate_pdb,
 	.page = {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c
index 96b759695dd8..7a6066d886cd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c
@@ -26,7 +26,7 @@ gm20b_vmm_17 = {
 	.join = gm200_vmm_join,
 	.part = gf100_vmm_part,
 	.aper = gk20a_vmm_aper,
-	.valid = gf100_vmm_valid,
+	.valid = gk20a_vmm_valid,
 	.flush = gf100_vmm_flush,
 	.invalidate_pdb = gf100_vmm_invalidate_pdb,
 	.page = {
@@ -42,7 +42,7 @@ gm20b_vmm_16 = {
 	.join = gm200_vmm_join,
 	.part = gf100_vmm_part,
 	.aper = gk20a_vmm_aper,
-	.valid = gf100_vmm_valid,
+	.valid = gk20a_vmm_valid,
 	.flush = gf100_vmm_flush,
 	.invalidate_pdb = gf100_vmm_invalidate_pdb,
 	.page = {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
index e081239afe58..180c8f006e32 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
@@ -19,14 +19,32 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
+
+#include "gk20a.h"
 #include "vmm.h"
 
+static int
+gp10b_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
+		struct nvkm_vmm_map *map)
+{
+	struct gk20a_mmu *mmu = gk20a_mmu(vmm->mmu);
+	int ret;
+
+	ret = gp100_vmm_valid(vmm, argv, argc, map);
+	if (ret < 0)
+		return ret;
+
+	map->type |= mmu->iommu_mask >> 4;
+
+	return 0;
+}
+
 static const struct nvkm_vmm_func
 gp10b_vmm = {
 	.join = gp100_vmm_join,
 	.part = gf100_vmm_part,
 	.aper = gk20a_vmm_aper,
-	.valid = gp100_vmm_valid,
+	.valid = gp10b_vmm_valid,
 	.flush = gp100_vmm_flush,
 	.mthd = gp100_vmm_mthd,
 	.invalidate_pdb = gp100_vmm_invalidate_pdb,
-- 
2.23.0


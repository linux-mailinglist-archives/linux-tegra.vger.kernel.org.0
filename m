Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D23FD903C
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Oct 2019 13:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387542AbfJPL7g (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 16 Oct 2019 07:59:36 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37050 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387930AbfJPL7g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Oct 2019 07:59:36 -0400
Received: by mail-wr1-f66.google.com with SMTP id p14so27710799wro.4
        for <linux-tegra@vger.kernel.org>; Wed, 16 Oct 2019 04:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kVkr12Iu2+4HR1jUPEdlO1s6WuDU7ymBLcZKRk/pgz4=;
        b=kGVvDey63eygtoV9TJkCe7bt9HyHEwZa7Eotj9VAgdJD3u8KDU/3SXqZKS8O4HOpLs
         PZAAMEWraxW/ddbypXqUu1bfhDWQ763gOfU64vF0uqYUfwSVYykALQ7SSRsOoCzLf4V2
         JSLuj9ojtATP7fkicQOq02cdcumy1z5dmMMLw70nre8nmShqhgiFfAhckX1fK5SONbrE
         XEf5uFBe8NIxn7CnElg/L1Q8z1P3gYsU2swcGLFN8toHbMGKfobvX7hlXD0Bo4NrTeTd
         8IRMzkSWjayNOnFNqkme5m3hYStbYB6MbrReC/dCEiOfDGEdgOQFTf5cHSht8QLzsrw3
         MNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kVkr12Iu2+4HR1jUPEdlO1s6WuDU7ymBLcZKRk/pgz4=;
        b=VI2jl/bGpHFVE9sLEMXZCr+aThcU7o2nrMjYiP1iWYoSNXPvemO1ml4kYijUz81Uug
         IPoJBAFvxJFU6gI7k7OYTBZMmYz1xOyEHarqWt2Yx4Zx3nJLRSV5MY6dK0QGPFkAh0AX
         +Ztt82G4DMveHtUqx73hdme6uZzRbXbC7nZ7BbrbqSUGxjOCbOSHpX1etWkCUbP0UPMO
         IpkZg5B9fIs1XQE1asSXnQ6lK5Cp6+C0DzVwjqHJGp+XDX6gqzh5t2wr+hRzH+IdmYkW
         aRp3ktLSEV71iQogo5V0zF28CA2rWVRNhLil+UmlEoVgo4I8AGIY9bMM+TcR+aKAVJul
         a3yQ==
X-Gm-Message-State: APjAAAVwDzNHiqLoqUmo/UXSqxKeGarNv1D483uJXlCwvWsiRsOF3Sm5
        Nf0tVvCPzhpzmYGt6HYOxqs=
X-Google-Smtp-Source: APXvYqyBFn3mgtlzZaAIPD98gDJqh42kWj5iMTnm1Rw/q0LvIegCwJmB6W2/MsVikMnIFpxXO0I/iw==
X-Received: by 2002:a5d:4a87:: with SMTP id o7mr2499176wrq.374.1571227173853;
        Wed, 16 Oct 2019 04:59:33 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id a192sm2592264wma.1.2019.10.16.04.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 04:59:32 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 8/8] drm/tegra: Optionally attach clients to the IOMMU
Date:   Wed, 16 Oct 2019 13:59:16 +0200
Message-Id: <20191016115916.1769133-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016115916.1769133-1-thierry.reding@gmail.com>
References: <20191016115916.1769133-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

If a client is already attached to an IOMMU domain that is not the
shared domain, don't try to attach it again. This allows using the
IOMMU-backed DMA API.

Since the IOMMU-backed DMA API is now supported and there's no way
to detach from it on 64-bit ARM, don't bother to detach from it on
32-bit ARM either.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 55 +++++++++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 959086644b52..3012f13bab97 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -20,10 +20,6 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_vblank.h>
 
-#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
-#include <asm/dma-iommu.h>
-#endif
-
 #include "drm.h"
 #include "gem.h"
 
@@ -89,6 +85,7 @@ tegra_drm_mode_config_helpers = {
 static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 {
 	struct host1x_device *device = to_host1x_device(drm->dev);
+	struct iommu_domain *domain;
 	struct tegra_drm *tegra;
 	int err;
 
@@ -96,7 +93,36 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 	if (!tegra)
 		return -ENOMEM;
 
-	if (iommu_present(&platform_bus_type)) {
+	/*
+	 * If the Tegra DRM clients are backed by an IOMMU, push buffers are
+	 * likely to be allocated beyond the 32-bit boundary if sufficient
+	 * system memory is available. This is problematic on earlier Tegra
+	 * generations where host1x supports a maximum of 32 address bits in
+	 * the GATHER opcode. In this case, unless host1x is behind an IOMMU
+	 * as well it won't be able to process buffers allocated beyond the
+	 * 32-bit boundary.
+	 *
+	 * The DMA API will use bounce buffers in this case, so that could
+	 * perhaps still be made to work, even if less efficient, but there
+	 * is another catch: in order to perform cache maintenance on pages
+	 * allocated for discontiguous buffers we need to map and unmap the
+	 * SG table representing these buffers. This is fine for something
+	 * small like a push buffer, but it exhausts the bounce buffer pool
+	 * (typically on the order of a few MiB) for framebuffers (many MiB
+	 * for any modern resolution).
+	 *
+	 * Work around this by making sure that Tegra DRM clients only use
+	 * an IOMMU if the parent host1x also uses an IOMMU.
+	 *
+	 * Note that there's still a small gap here that we don't cover: if
+	 * the DMA API is backed by an IOMMU there's no way to control which
+	 * device is attached to an IOMMU and which isn't, except via wiring
+	 * up the device tree appropriately. This is considered an problem
+	 * of integration, so care must be taken for the DT to be consistent.
+	 */
+	domain = iommu_get_domain_for_dev(drm->dev->parent);
+
+	if (domain && iommu_present(&platform_bus_type)) {
 		tegra->domain = iommu_domain_alloc(&platform_bus_type);
 		if (!tegra->domain) {
 			err = -ENOMEM;
@@ -139,7 +165,7 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 	if (err < 0)
 		goto fbdev;
 
-	if (tegra->domain) {
+	if (tegra->group) {
 		u64 carveout_start, carveout_end, gem_start, gem_end;
 		u64 dma_mask = dma_get_mask(&device->dev);
 		dma_addr_t start, end;
@@ -167,6 +193,10 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 		DRM_DEBUG_DRIVER("  GEM: %#llx-%#llx\n", gem_start, gem_end);
 		DRM_DEBUG_DRIVER("  Carveout: %#llx-%#llx\n", carveout_start,
 				 carveout_end);
+	} else if (tegra->domain) {
+		iommu_domain_free(tegra->domain);
+		tegra->domain = NULL;
+		iova_cache_put();
 	}
 
 	if (tegra->hub) {
@@ -1072,11 +1102,15 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
 
 int host1x_client_iommu_attach(struct host1x_client *client, bool shared)
 {
+	struct iommu_domain *domain = iommu_get_domain_for_dev(client->dev);
 	struct drm_device *drm = dev_get_drvdata(client->parent);
 	struct tegra_drm *tegra = drm->dev_private;
 	struct iommu_group *group = NULL;
 	int err;
 
+	if (domain && domain != tegra->domain)
+		return 0;
+
 	if (tegra->domain) {
 		group = iommu_group_get(client->dev);
 		if (!group) {
@@ -1085,14 +1119,6 @@ int host1x_client_iommu_attach(struct host1x_client *client, bool shared)
 		}
 
 		if (!shared || (shared && (group != tegra->group))) {
-#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
-			if (client->dev->archdata.mapping) {
-				struct dma_iommu_mapping *mapping =
-					to_dma_iommu_mapping(client->dev);
-				arm_iommu_detach_device(client->dev);
-				arm_iommu_release_mapping(mapping);
-			}
-#endif
 			err = iommu_attach_group(tegra->domain, group);
 			if (err < 0) {
 				iommu_group_put(group);
@@ -1121,6 +1147,7 @@ void host1x_client_iommu_detach(struct host1x_client *client)
 		}
 
 		iommu_group_put(client->group);
+		client->group = NULL;
 	}
 }
 
-- 
2.23.0


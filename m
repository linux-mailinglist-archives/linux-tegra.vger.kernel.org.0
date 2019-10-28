Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC607E7185
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Oct 2019 13:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbfJ1Mht (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Oct 2019 08:37:49 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45648 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbfJ1Mht (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Oct 2019 08:37:49 -0400
Received: by mail-wr1-f66.google.com with SMTP id q13so9675386wrs.12
        for <linux-tegra@vger.kernel.org>; Mon, 28 Oct 2019 05:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2ymWEbRHSElzNbuDgsTAxIt0SPIxRdOmiGeksusZlhM=;
        b=icu0V3tx03OmBkcca8Z6qPTM+g+WBsmLC62jDZV98LF03Gh01rH58bOG9foikmkKUz
         6MT5u/4sIeF8UY/fLTarKdv0J2nV8CdFkarPd4Mq4rtFdkD67aaturmImUrpQcVIxOKo
         lExGlkiVqVKa2/SyBpt+W0lnl/HAN57+hft002CSldIT4+gKBKVDyt/OkUR5ZFXbJZS8
         TaWqp+YlmflzVLR6jyXldqxhFlJFvJgxHMos+wQ5Q7RUTFp++jDBiQVrvQMTpahI+L/b
         +pxdNszHt/cf9ovJ6/x2vqvIl6KfBgVM4jHospbUtbIhTZEh9P887pbmjcAfg3P98mVB
         O/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ymWEbRHSElzNbuDgsTAxIt0SPIxRdOmiGeksusZlhM=;
        b=sZuQXYB9+4qogzh2qzTFfM5cR3OSuqRD/2qWesxLxwp6BxK5F0ER4lhqthTrRvlxgX
         EeXL58OIdTD0Wjg0rGXiJmNr2ZCuqHFZc9BqWjLYeH30idF6GaCEBia8RGhRLka21pKN
         +4c5w7It9oYX+b7U2deiAAOgmfZY+JAS2keeEwibC37QMa/RIPuKgnJTlWARfvo7ydY6
         hRhwnGN+4clagRvW1DCDc/oo02WpyX9NYz+lnD9CYxka+yoqmyxiWg9Q5Cu2Y60Rhyx9
         xozfunrEeZ6qtf6iwpJC9cJQo3SE9pj4806cZ5zJZoCfGVNJQ6HYW5gpPsus+vy5yFXm
         ccrA==
X-Gm-Message-State: APjAAAU8IWE7ltgFPgcp/Cngz1N6dop33pKINybKQUJZUVJrQ55r4Uwh
        oEI3s0Fj33j07JuBncZmwRU=
X-Google-Smtp-Source: APXvYqz04kjsxEAcAdJD5HKV9ccsMeQdCvjWpQurQhV2rNL5tLBaD5O6xZzys65f9IqRDbRp1DOhLw==
X-Received: by 2002:adf:fec3:: with SMTP id q3mr14812954wrs.343.1572266266222;
        Mon, 28 Oct 2019 05:37:46 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id s10sm13109089wrr.5.2019.10.28.05.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 05:37:45 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sachin Nikam <snikam@nvidia.com>,
        Puneet Saxena <puneets@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 12/12] drm/tegra: Optionally attach clients to the IOMMU
Date:   Mon, 28 Oct 2019 13:37:18 +0100
Message-Id: <20191028123718.3890217-13-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028123718.3890217-1-thierry.reding@gmail.com>
References: <20191028123718.3890217-1-thierry.reding@gmail.com>
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
 drivers/gpu/drm/tegra/drm.c | 66 +++++++++++++++++++++++++++----------
 drivers/gpu/drm/tegra/drm.h |  1 +
 2 files changed, 49 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index efc8a27b9e6a..56e5e7a5c108 100644
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
 
@@ -908,30 +904,27 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
 
 int host1x_client_iommu_attach(struct host1x_client *client)
 {
+	struct iommu_domain *domain = iommu_get_domain_for_dev(client->dev);
 	struct drm_device *drm = dev_get_drvdata(client->parent);
 	struct tegra_drm *tegra = drm->dev_private;
 	struct iommu_group *group = NULL;
 	int err;
 
-	if (tegra->domain) {
-		struct iommu_domain *domain;
+	/*
+	 * If the host1x client is already attached to an IOMMU domain that is
+	 * not the shared IOMMU domain, don't try to attach it to a different
+	 * domain. This allows using the IOMMU-backed DMA API.
+	 */
+	if (domain && domain != tegra->domain)
+		return 0;
 
+	if (tegra->domain) {
 		group = iommu_group_get(client->dev);
 		if (!group) {
 			dev_err(client->dev, "failed to get IOMMU group\n");
 			return -ENODEV;
 		}
 
-#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
-		if (client->dev->archdata.mapping) {
-			struct dma_iommu_mapping *mapping =
-				to_dma_iommu_mapping(client->dev);
-			arm_iommu_detach_device(client->dev);
-			arm_iommu_release_mapping(mapping);
-		}
-#endif
-
-		domain = iommu_get_domain_for_dev(client->dev);
 		if (domain != tegra->domain) {
 			err = iommu_attach_group(tegra->domain, group);
 			if (err < 0) {
@@ -939,6 +932,8 @@ int host1x_client_iommu_attach(struct host1x_client *client)
 				return err;
 			}
 		}
+
+		tegra->use_explicit_iommu = true;
 	}
 
 	client->group = group;
@@ -963,6 +958,7 @@ void host1x_client_iommu_detach(struct host1x_client *client)
 			iommu_detach_group(tegra->domain, client->group);
 
 		iommu_group_put(client->group);
+		client->group = NULL;
 	}
 }
 
@@ -1046,6 +1042,7 @@ void tegra_drm_free(struct tegra_drm *tegra, size_t size, void *virt,
 static int host1x_drm_probe(struct host1x_device *dev)
 {
 	struct drm_driver *driver = &tegra_drm_driver;
+	struct iommu_domain *domain;
 	struct tegra_drm *tegra;
 	struct drm_device *drm;
 	int err;
@@ -1060,7 +1057,36 @@ static int host1x_drm_probe(struct host1x_device *dev)
 		goto put;
 	}
 
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
@@ -1104,7 +1130,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 	if (err < 0)
 		goto fbdev;
 
-	if (tegra->domain) {
+	if (tegra->use_explicit_iommu) {
 		u64 carveout_start, carveout_end, gem_start, gem_end;
 		u64 dma_mask = dma_get_mask(&dev->dev);
 		dma_addr_t start, end;
@@ -1132,6 +1158,10 @@ static int host1x_drm_probe(struct host1x_device *dev)
 		DRM_DEBUG_DRIVER("  GEM: %#llx-%#llx\n", gem_start, gem_end);
 		DRM_DEBUG_DRIVER("  Carveout: %#llx-%#llx\n", carveout_start,
 				 carveout_end);
+	} else if (tegra->domain) {
+		iommu_domain_free(tegra->domain);
+		tegra->domain = NULL;
+		iova_cache_put();
 	}
 
 	if (tegra->hub) {
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 28f2820a7371..d941553f7a3d 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -36,6 +36,7 @@ struct tegra_drm {
 	struct drm_device *drm;
 
 	struct iommu_domain *domain;
+	bool use_explicit_iommu;
 	struct mutex mm_lock;
 	struct drm_mm mm;
 
-- 
2.23.0


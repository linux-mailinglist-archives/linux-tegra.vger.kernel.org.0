Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6B6B3D2C
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Sep 2019 17:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730555AbfIPPEg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Sep 2019 11:04:36 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38940 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730458AbfIPPEg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Sep 2019 11:04:36 -0400
Received: by mail-ed1-f65.google.com with SMTP id g12so368027eds.6
        for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2019 08:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4ccugY6ClSnbuX7APJroS2mNfHC14XOtjAHCQoqo1l0=;
        b=rqrXASqqg0Wt2ElZbDzwn9YUA12fnkmFRR5RjTH92TD/4WMMnpGAlmyZLDrPlmwrPp
         VSN0VbGB+dfg1H7dtDuzpKTaxJFQ/LtK0k3Z+RBmthUHsjOdbVMDrQBpNHwSAfBTUm5r
         Tk8YIV/5E3XZprWXihHmVx0htM0mUVLVZjvQEoFQC07t2/YJTcJQkwPl7EdvWOkBgqnn
         z3ZxWIzmhUkC40om417QMynb6dV6HLBRzeG4MP/Z0II+ra/iNu34csozVX/ymJxNmegP
         3PmSZdtOa4HJXJSCWqdbX/PejXhWHdj+SkUepfCKYRpj8FQ+4tZ1ss51ZTNIVEr1CIpf
         cGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4ccugY6ClSnbuX7APJroS2mNfHC14XOtjAHCQoqo1l0=;
        b=C+FqZxamIUliUvTdQE+sY1WA78zqwt1322WOClQFfUS5SFqGswVX+M2KGME8OHtynd
         iXaawEhYxrFliliB7OBxQbsLIei+2qzIcSQFQ/j5PZj2I+rph34hXdKY1L2iJwgH3dt2
         F1dlJdRmqgJwS3aUzYkp6avrDOQ+8ShURATubnzWzejGFkUpFDvtLkHNixSipNVGfDyR
         WDQt2KydZ7VLTLUH/zwMX9R225ET1gNfGYvT2R15ywdU5+41pz9fMzilYc5JET/UdgxI
         eO1fxLmIByhbNh0AFwc6PO9gvpo7YFNgqmD7/TZaczBN+sSl4Qrh+hhx2zNKh1sq0E6y
         q2og==
X-Gm-Message-State: APjAAAWzoji+3eRUXZkmImNCl1x7xSJzGiAPS4M4+OwNyBvIEJJ+Vk6m
        kAKSD9JH2BwbAl4utyKf8hQ=
X-Google-Smtp-Source: APXvYqzWp5v8wABQQuXME4pRri+jmpw25ohBKUxrL9wKEhSeykouiUN4nTbccXTpL4h81AdC9KnLrg==
X-Received: by 2002:aa7:c71a:: with SMTP id i26mr4215857edq.68.1568646274381;
        Mon, 16 Sep 2019 08:04:34 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id n12sm598159edi.1.2019.09.16.08.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 08:04:33 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 08/11] drm/nouveau: tegra: Skip IOMMU initialization if already attached
Date:   Mon, 16 Sep 2019 17:04:09 +0200
Message-Id: <20190916150412.10025-9-thierry.reding@gmail.com>
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

If the GPU is already attached to an IOMMU, don't detach it and setup an
explicit IOMMU domain. Since Nouveau can now properly handle the case of
the DMA API being backed by an IOMMU, just continue using the DMA API.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../drm/nouveau/nvkm/engine/device/tegra.c    | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index d0d52c1d4aee..fc652aaa41c7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -23,10 +23,6 @@
 #ifdef CONFIG_NOUVEAU_PLATFORM_DRIVER
 #include "priv.h"
 
-#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
-#include <asm/dma-iommu.h>
-#endif
-
 static int
 nvkm_device_tegra_power_up(struct nvkm_device_tegra *tdev)
 {
@@ -109,14 +105,13 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_tegra *tdev)
 	unsigned long pgsize_bitmap;
 	int ret;
 
-#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
-	if (dev->archdata.mapping) {
-		struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-
-		arm_iommu_detach_device(dev);
-		arm_iommu_release_mapping(mapping);
-	}
-#endif
+	/*
+	 * Skip explicit IOMMU initialization if the GPU is already attached
+	 * to an IOMMU domain. This can happen if the DMA API is backed by an
+	 * IOMMU.
+	 */
+	if (iommu_get_domain_for_dev(dev))
+		return;
 
 	if (!tdev->func->iommu_bit)
 		return;
-- 
2.23.0


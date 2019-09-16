Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02DF9B3D2F
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Sep 2019 17:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388164AbfIPPEj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Sep 2019 11:04:39 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46164 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730458AbfIPPEj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Sep 2019 11:04:39 -0400
Received: by mail-ed1-f65.google.com with SMTP id i8so322766edn.13
        for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2019 08:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L8O9mHrKvq5rb1TB0Q/I3+pJa7f/9NUidjAbRAJ3yyQ=;
        b=q2aAeloXIhGtOTfP1HCcff+R6vkR9E72SykXc8vCyeY7QEsmj7TUVInhUvr/sc180R
         ZpuREcf7hc7/ChYEgRDIPfq1UvAwC08SuvhNYq027z92/IaJMd4yugVpgvMz1sjQOltx
         d+bkjiKCgEs28x48sPGrqNxH0aM3FKL0wZ219qGd5SOljmKeYOHWJbWg0IEShTtEdzVk
         8r0xfEsoiESOOU7xu1w1Aqch4/a7qz1epM2aC1tpxJHDt+ZPs1hEcs+o17Na4i4Z+jCo
         l13wtavce2qtrJbI1QRTg4UayW+yrZOU0GRNeILw5MLsu4uqy9zd55MYS65N6sjZhHJ5
         oVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L8O9mHrKvq5rb1TB0Q/I3+pJa7f/9NUidjAbRAJ3yyQ=;
        b=eyRFqzZfcZFIuWbshdZYFlfhOzKAAKX/9P2/M6do/P7S8loaUtvfehPhDTvCqwtZyH
         CiFiRmJk50yjdS2rA0sCRq+EZYdtTy/fPYGy/4x7ZqNP1ZEdAGLHVmxTaLES1Zs9Pnwz
         2sZ3M/Rz/N5HTxbErV/7T8T5Oj1RQBrC3GcXRF0IwzD089RlWOE56D/h8W1A/24CUVyp
         1fnywaw5U+Mf0Bb3jW6K1Ron9vLsLmW/R0g1i77TFtKOA0dcZSVrxtprMclBJhqmh8o0
         hZzTAZGZUaUR/2tPzvB+P5/9+7Sw/+mgLbWhj8muh7iBMuVMdEEp+Rj9xiAzrHphnEF8
         bZ2g==
X-Gm-Message-State: APjAAAVFti1MqoYHl3lOZBoq2hq1hVDWGKWn41Aq4AlZ1fktcBp1+Im5
        eM/3gIZj7aJqGWVvmyuIEdQ=
X-Google-Smtp-Source: APXvYqxFcR3Kiz5TONmtlT2zhZb4kFuRXoHStIZ1pcpWOI9lXgKcxLuUkTbnZjIos0OQ3Bq8DUQVPw==
X-Received: by 2002:a17:906:c7d4:: with SMTP id dc20mr415048ejb.235.1568646276546;
        Mon, 16 Sep 2019 08:04:36 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id h10sm3837307ejt.12.2019.09.16.08.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 08:04:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 09/11] drm/nouveau: tegra: Fall back to 32-bit DMA mask without IOMMU
Date:   Mon, 16 Sep 2019 17:04:10 +0200
Message-Id: <20190916150412.10025-10-thierry.reding@gmail.com>
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

The GPU can usually address more than 32-bit, even without being
attached to an IOMMU. However, if the GPU is not attached to an IOMMU,
it's likely that there is no IOMMU in the system, in which case any
buffers allocated by Nouveau will likely end up in a region of memory
that cannot be accessed by host1x.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../drm/nouveau/nvkm/engine/device/tegra.c    | 111 +++++++++++-------
 1 file changed, 70 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index fc652aaa41c7..221238a2cf53 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -97,7 +97,7 @@ nvkm_device_tegra_power_down(struct nvkm_device_tegra *tdev)
 	return 0;
 }
 
-static void
+static int
 nvkm_device_tegra_probe_iommu(struct nvkm_device_tegra *tdev)
 {
 #if IS_ENABLED(CONFIG_IOMMU_API)
@@ -111,47 +111,65 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_tegra *tdev)
 	 * IOMMU.
 	 */
 	if (iommu_get_domain_for_dev(dev))
-		return;
+		return -ENODEV;
 
 	if (!tdev->func->iommu_bit)
-		return;
+		return -ENODEV;
+
+	if (!iommu_present(&platform_bus_type))
+		return -ENODEV;
 
 	mutex_init(&tdev->iommu.mutex);
 
-	if (iommu_present(&platform_bus_type)) {
-		tdev->iommu.domain = iommu_domain_alloc(&platform_bus_type);
-		if (!tdev->iommu.domain)
-			goto error;
+	tdev->iommu.domain = iommu_domain_alloc(&platform_bus_type);
+	if (!tdev->iommu.domain)
+		return -ENOMEM;
 
-		/*
-		 * A IOMMU is only usable if it supports page sizes smaller
-		 * or equal to the system's PAGE_SIZE, with a preference if
-		 * both are equal.
-		 */
-		pgsize_bitmap = tdev->iommu.domain->ops->pgsize_bitmap;
-		if (pgsize_bitmap & PAGE_SIZE) {
-			tdev->iommu.pgshift = PAGE_SHIFT;
-		} else {
-			tdev->iommu.pgshift = fls(pgsize_bitmap & ~PAGE_MASK);
-			if (tdev->iommu.pgshift == 0) {
-				dev_warn(dev, "unsupported IOMMU page size\n");
-				goto free_domain;
-			}
-			tdev->iommu.pgshift -= 1;
+	/*
+	 * An IOMMU is only usable if it supports page sizes smaller or equal
+	 * to the system's PAGE_SIZE, with a preference if both are equal.
+	 */
+	pgsize_bitmap = tdev->iommu.domain->ops->pgsize_bitmap;
+	if (pgsize_bitmap & PAGE_SIZE) {
+		tdev->iommu.pgshift = PAGE_SHIFT;
+	} else {
+		tdev->iommu.pgshift = fls(pgsize_bitmap & ~PAGE_MASK);
+		if (tdev->iommu.pgshift == 0) {
+			dev_warn(dev, "unsupported IOMMU page size\n");
+			ret = -ENOTSUPP;
+			goto free_domain;
 		}
 
-		ret = iommu_attach_device(tdev->iommu.domain, dev);
-		if (ret)
-			goto free_domain;
+		tdev->iommu.pgshift -= 1;
+	}
 
-		ret = nvkm_mm_init(&tdev->iommu.mm, 0, 0,
-				   (1ULL << tdev->func->iommu_bit) >>
-				   tdev->iommu.pgshift, 1);
-		if (ret)
-			goto detach_device;
+	ret = iommu_attach_device(tdev->iommu.domain, dev);
+	if (ret) {
+		dev_warn(dev, "failed to attach to IOMMU: %d\n", ret);
+		goto free_domain;
+	}
+
+	ret = nvkm_mm_init(&tdev->iommu.mm, 0, 0,
+			   (1ULL << tdev->func->iommu_bit) >>
+			   tdev->iommu.pgshift, 1);
+	if (ret) {
+		dev_warn(dev, "failed to initialize IOVA space: %d\n", ret);
+		goto detach_device;
+	}
+
+	/*
+	 * The IOMMU bit defines the upper limit of the GPU-addressable space.
+	 */
+	ret = dma_set_mask(dev, DMA_BIT_MASK(tdev->func->iommu_bit));
+	if (ret) {
+		dev_warn(dev, "failed to set DMA mask: %d\n", ret);
+		goto fini_mm;
 	}
 
-	return;
+	return 0;
+
+fini_mm:
+	nvkm_mm_fini(&tdev->iommu.mm);
 
 detach_device:
 	iommu_detach_device(tdev->iommu.domain, dev);
@@ -159,10 +177,15 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_tegra *tdev)
 free_domain:
 	iommu_domain_free(tdev->iommu.domain);
 
-error:
+	/* reset these so that the DMA API code paths are executed */
 	tdev->iommu.domain = NULL;
 	tdev->iommu.pgshift = 0;
-	dev_err(dev, "cannot initialize IOMMU MM\n");
+
+	dev_warn(dev, "cannot initialize IOMMU MM\n");
+
+	return ret;
+#else
+	return -ENOTSUPP;
 #endif
 }
 
@@ -327,14 +350,20 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 		goto free;
 	}
 
-	/**
-	 * The IOMMU bit defines the upper limit of the GPU-addressable space.
-	 */
-	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(tdev->func->iommu_bit));
-	if (ret)
-		goto free;
-
-	nvkm_device_tegra_probe_iommu(tdev);
+	ret = nvkm_device_tegra_probe_iommu(tdev);
+	if (ret) {
+		/*
+		 * If we fail to set up an IOMMU, fall back to a 32-bit DMA
+		 * mask. This is not necessary for the GPU to work because it
+		 * can usually address all of system memory. However, if the
+		 * buffers allocated by Nouveau are meant to be shared with
+		 * the display controller, we need to restrict where they can
+		 * come from.
+		 */
+		ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
+		if (ret)
+			goto free;
+	}
 
 	ret = nvkm_device_tegra_power_up(tdev);
 	if (ret)
-- 
2.23.0


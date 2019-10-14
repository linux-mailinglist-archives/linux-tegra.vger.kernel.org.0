Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9C09D6309
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Oct 2019 14:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731455AbfJNMvS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Oct 2019 08:51:18 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51100 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731443AbfJNMvS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Oct 2019 08:51:18 -0400
Received: by mail-wm1-f65.google.com with SMTP id 5so17172782wmg.0
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2019 05:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5kAEqnBZ6MmRl+pXbq1LnTbk9P8s3U977DcUAEiFmNQ=;
        b=lp/tJ/XNOr+QTKZTeVJqJkHPo6CdzfhczvWGwiyMVGrHxfKOxokv20TZuMjMV7HsKL
         4lqj7pkB+1xuV2peHoYiAcpxXlaqX7nRJeE2IXOanWFcvXqunKImn5G4IgOlf0y8NafE
         AHhG6rkS7R5YiHRVptyRH0LGXFS43j56F6FzkNZ01lpob8+ndRXISLPAbID4ZtMQTMKj
         6S/Thf4cx2ot0ha6IOzEQStjbUleLyDURrDQirnQToFpmmCy4ONPHwINOwByo5UK+yq5
         0UvLV/1TzgeT7qkbEvs9HnjbLEnaLYpGxZAPwJ5tIeSvR8EpA2RCatgcRXA9JmldGwPt
         ihMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5kAEqnBZ6MmRl+pXbq1LnTbk9P8s3U977DcUAEiFmNQ=;
        b=ijQZtTmporLzxcU4Ii4WnQKwiSa5JpxwEEdCEILOVQ5a2R+iyblW7n0/Pazr3fkCP9
         QG6661kVDR70hT0Uy+DQpL4udo0jxnIzZ2wO9soJHMAemWzI1UyNzJS0vrnUB8r+EnZM
         7LMRXuzeG6NYl7rMeBFxhto92qPgYfs8e9hTpGY/5ITeUpQA+ULnvNWoQtaba+pAl51j
         qlR6N4M9pm6U1uUuu6XuCq9vHU1Mcm+cZVuNfe4OFKhsRYyBsX078Y4RAUNY8AQzu083
         XN5Q51TuJhTROOvQeObgETz7Ef1JyE/z4Ws4wFw8hrvT2qjZaEVeymVN6SD+HHmTV/Pb
         g14Q==
X-Gm-Message-State: APjAAAUDf+gWvCiPozR33dUFYbvEx8fd8V8MngByEV6KPZYYtcx4vsRE
        lt+p8piw6B7i5yDlurugteM=
X-Google-Smtp-Source: APXvYqzHAe84RO7omKdazqiBlohn5OFKMP5dJ0KX3C4NyvHOdxnOz7lq0UQEhU/M8Fkw8ZPW46LAdg==
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr14027365wmc.136.1571057475139;
        Mon, 14 Oct 2019 05:51:15 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id g13sm15458488wrm.42.2019.10.14.05.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:51:14 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 11/14] drm/tegra: gem: Rename paddr -> iova
Date:   Mon, 14 Oct 2019 14:50:46 +0200
Message-Id: <20191014125049.425101-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The address can refer to either physical memory or IO virtual memory.
If referring to IO virtual memory, there will always be an associated
physical memory address. Rename this variable to "iova" to clarify in
all cases that this is the IO virtual memory, which in the absence of
an IOMMU is identical to the physical address.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  |  6 +++---
 drivers/gpu/drm/tegra/fb.c  |  4 ++--
 drivers/gpu/drm/tegra/gem.c | 18 +++++++++---------
 drivers/gpu/drm/tegra/gem.h |  2 +-
 drivers/gpu/drm/tegra/hub.c |  2 +-
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 3ac535bd99ca..54966f538141 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -717,7 +717,7 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 	for (i = 0; i < fb->format->num_planes; i++) {
 		struct tegra_bo *bo = tegra_fb_get_plane(fb, i);
 
-		window.base[i] = bo->paddr + fb->offsets[i];
+		window.base[i] = bo->iova + fb->offsets[i];
 
 		/*
 		 * Tegra uses a shared stride for UV planes. Framebuffers are
@@ -869,11 +869,11 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
 		return;
 	}
 
-	value |= (bo->paddr >> 10) & 0x3fffff;
+	value |= (bo->iova >> 10) & 0x3fffff;
 	tegra_dc_writel(dc, value, DC_DISP_CURSOR_START_ADDR);
 
 #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-	value = (bo->paddr >> 32) & 0x3;
+	value = (bo->iova >> 32) & 0x3;
 	tegra_dc_writel(dc, value, DC_DISP_CURSOR_START_ADDR_HI);
 #endif
 
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index e34325c83d28..7cea89f29a5c 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -269,10 +269,10 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 		}
 	}
 
-	drm->mode_config.fb_base = (resource_size_t)bo->paddr;
+	drm->mode_config.fb_base = (resource_size_t)bo->iova;
 	info->screen_base = (void __iomem *)bo->vaddr + offset;
 	info->screen_size = size;
-	info->fix.smem_start = (unsigned long)(bo->paddr + offset);
+	info->fix.smem_start = (unsigned long)(bo->iova + offset);
 	info->fix.smem_len = size;
 
 	return 0;
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index fb7667c8dd4c..7412e23500d1 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -33,7 +33,7 @@ static dma_addr_t tegra_bo_pin(struct host1x_bo *bo, struct sg_table **sgt)
 
 	*sgt = obj->sgt;
 
-	return obj->paddr;
+	return obj->iova;
 }
 
 static void tegra_bo_unpin(struct host1x_bo *bo, struct sg_table *sgt)
@@ -133,9 +133,9 @@ static int tegra_bo_iommu_map(struct tegra_drm *tegra, struct tegra_bo *bo)
 		goto unlock;
 	}
 
-	bo->paddr = bo->mm->start;
+	bo->iova = bo->mm->start;
 
-	bo->size = iommu_map_sg(tegra->domain, bo->paddr, bo->sgt->sgl,
+	bo->size = iommu_map_sg(tegra->domain, bo->iova, bo->sgt->sgl,
 				bo->sgt->nents, prot);
 	if (!bo->size) {
 		dev_err(tegra->drm->dev, "failed to map buffer\n");
@@ -161,7 +161,7 @@ static int tegra_bo_iommu_unmap(struct tegra_drm *tegra, struct tegra_bo *bo)
 		return 0;
 
 	mutex_lock(&tegra->mm_lock);
-	iommu_unmap(tegra->domain, bo->paddr, bo->size);
+	iommu_unmap(tegra->domain, bo->iova, bo->size);
 	drm_mm_remove_node(bo->mm);
 	mutex_unlock(&tegra->mm_lock);
 
@@ -209,7 +209,7 @@ static void tegra_bo_free(struct drm_device *drm, struct tegra_bo *bo)
 		sg_free_table(bo->sgt);
 		kfree(bo->sgt);
 	} else if (bo->vaddr) {
-		dma_free_wc(drm->dev, bo->gem.size, bo->vaddr, bo->paddr);
+		dma_free_wc(drm->dev, bo->gem.size, bo->vaddr, bo->iova);
 	}
 }
 
@@ -264,7 +264,7 @@ static int tegra_bo_alloc(struct drm_device *drm, struct tegra_bo *bo)
 	} else {
 		size_t size = bo->gem.size;
 
-		bo->vaddr = dma_alloc_wc(drm->dev, size, &bo->paddr,
+		bo->vaddr = dma_alloc_wc(drm->dev, size, &bo->iova,
 					 GFP_KERNEL | __GFP_NOWARN);
 		if (!bo->vaddr) {
 			dev_err(drm->dev,
@@ -365,7 +365,7 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 			goto detach;
 		}
 
-		bo->paddr = sg_dma_address(bo->sgt->sgl);
+		bo->iova = sg_dma_address(bo->sgt->sgl);
 	}
 
 	bo->gem.import_attach = attach;
@@ -461,7 +461,7 @@ int __tegra_gem_mmap(struct drm_gem_object *gem, struct vm_area_struct *vma)
 		vma->vm_flags &= ~VM_PFNMAP;
 		vma->vm_pgoff = 0;
 
-		err = dma_mmap_wc(gem->dev->dev, vma, bo->vaddr, bo->paddr,
+		err = dma_mmap_wc(gem->dev->dev, vma, bo->vaddr, bo->iova,
 				  gem->size);
 		if (err < 0) {
 			drm_gem_vm_close(vma);
@@ -523,7 +523,7 @@ tegra_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 		if (sg_alloc_table(sgt, 1, GFP_KERNEL))
 			goto free;
 
-		sg_dma_address(sgt->sgl) = bo->paddr;
+		sg_dma_address(sgt->sgl) = bo->iova;
 		sg_dma_len(sgt->sgl) = gem->size;
 	}
 
diff --git a/drivers/gpu/drm/tegra/gem.h b/drivers/gpu/drm/tegra/gem.h
index 83ffb1e14ca3..fafb5724499b 100644
--- a/drivers/gpu/drm/tegra/gem.h
+++ b/drivers/gpu/drm/tegra/gem.h
@@ -31,7 +31,7 @@ struct tegra_bo {
 	struct host1x_bo base;
 	unsigned long flags;
 	struct sg_table *sgt;
-	dma_addr_t paddr;
+	dma_addr_t iova;
 	void *vaddr;
 
 	struct drm_mm_node *mm;
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 839b49c40e51..104115e42190 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -457,7 +457,7 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 	tegra_plane_writel(p, 0, DC_WINBUF_CDE_CONTROL);
 
 	bo = tegra_fb_get_plane(fb, 0);
-	base = bo->paddr;
+	base = bo->iova;
 
 	tegra_plane_writel(p, state->format, DC_WIN_COLOR_DEPTH);
 	tegra_plane_writel(p, 0, DC_WIN_PRECOMP_WGRP_PARAMS);
-- 
2.23.0


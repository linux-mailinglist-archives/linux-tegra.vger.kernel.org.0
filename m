Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B545B3D29
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Sep 2019 17:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730524AbfIPPEe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Sep 2019 11:04:34 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38718 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbfIPPEe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Sep 2019 11:04:34 -0400
Received: by mail-ed1-f65.google.com with SMTP id a23so374407edv.5
        for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2019 08:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mswe0yNxUUeN6+euQulztA2QuAFX/m2N/24ZWKG86JE=;
        b=rDuSB+f9bOB+Ntj6tQgNBi+8+4sqMYyqILs9fUJfEUUbxIJ01GV9sAxiMcM0zZc3vn
         j4tGep08OvEjhVVNq5AqKIehzkD5VuFe8pZmxBBBpjsAOa4MNXi8+HFqRYnP+Jb0P6x8
         YsjzVuR2RG1n8RnTrXakhd6CqAUiTmmLnX1vOC8+GvFOXaJfVSxt0ENyge41heNHrcE8
         QpnFFeNC3FTnoukUTe3FEgVk3XWKjqBXcZeYWYYsS9GDYLPmlR/Q/KuXyTKX5w+cRm7h
         GTeaDMDYd0Ad6p1MzzDTOPG+ZMN4QB2/N6hXGWBJxf28TOIFneIV7mnL+B+bmXG6YthY
         Bgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mswe0yNxUUeN6+euQulztA2QuAFX/m2N/24ZWKG86JE=;
        b=ZodoR2lbqCuRNeVUgst0BizCqvmDB285RBGlutAz7TXE6+V0hLAuYkUNzfpdmTqe6l
         wQpsOzA/mvXUUYrZ9GoS9zqfd0SYeKjUTL7lTRmDO8kyk8hvpFm4APZlzmFwfbxkwjT1
         8uUF5Y92+1BJ2GLQinGd4ZxBZ2q2CcOh+iBiXOAc0vwp6okqhhkqovKS8OQqLtZPW3xw
         YLVvR/P9p/2CGnudeFJ0+PSrBrGVuKIyUsHNAjWm/8+evIguQ+KtmH3cpR/mcnxsR5Jx
         sq+ROefNfIQzE2xyqG1GAyv6nLERoU8nsa+jh6+iOeYCzRs8pUKO7cfzT73OuMwul8Rz
         Jz/Q==
X-Gm-Message-State: APjAAAXjhGB1/3yM8Zal+nuw43b+7GuGWAYTPr2oEjIp+Jn+CuxSJPjA
        Q1NSfJ0+EIH+xRx0wSn+nLc=
X-Google-Smtp-Source: APXvYqwDSbkm/cDSmuomYIzJNKN5v78AAWntn01J516te3mk+kSWMCYmD3jaDjgw0q5vAo3auWR16g==
X-Received: by 2002:a17:906:1385:: with SMTP id f5mr422963ejc.145.1568646270307;
        Mon, 16 Sep 2019 08:04:30 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id j9sm1139162edt.15.2019.09.16.08.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 08:04:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 06/11] drm/nouveau: gk20a: Set IOMMU bit for DMA API if appropriate
Date:   Mon, 16 Sep 2019 17:04:07 +0200
Message-Id: <20190916150412.10025-7-thierry.reding@gmail.com>
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

Detect if the DMA API is backed by an IOMMU and set the IOMMU bit if so.
This is needed to make sure IOMMU addresses are properly translated even
the explicit IOMMU API is not used.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../drm/nouveau/nvkm/subdev/instmem/gk20a.c   | 35 +++++++++++++------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index b0493f8df1fe..1120a2a7d5f1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -100,12 +100,14 @@ struct gk20a_instmem {
 	unsigned int vaddr_max;
 	struct list_head vaddr_lru;
 
+	/* IOMMU mapping */
+	unsigned int page_shift;
+	u64 iommu_mask;
+
 	/* Only used if IOMMU if present */
 	struct mutex *mm_mutex;
 	struct nvkm_mm *mm;
 	struct iommu_domain *domain;
-	unsigned long iommu_pgshift;
-	u16 iommu_bit;
 
 	/* Only used by DMA API */
 	unsigned long attrs;
@@ -357,12 +359,12 @@ gk20a_instobj_dtor_iommu(struct nvkm_memory *memory)
 	mutex_unlock(&imem->lock);
 
 	/* clear IOMMU bit to unmap pages */
-	r->offset &= ~BIT(imem->iommu_bit - imem->iommu_pgshift);
+	r->offset &= ~imem->iommu_mask;
 
 	/* Unmap pages from GPU address space and free them */
 	for (i = 0; i < node->base.mn->length; i++) {
 		iommu_unmap(imem->domain,
-			    (r->offset + i) << imem->iommu_pgshift, PAGE_SIZE);
+			    (r->offset + i) << imem->page_shift, PAGE_SIZE);
 		dma_unmap_page(dev, node->dma_addrs[i], PAGE_SIZE,
 			       DMA_BIDIRECTIONAL);
 		__free_page(node->pages[i]);
@@ -440,7 +442,7 @@ gk20a_instobj_ctor_dma(struct gk20a_instmem *imem, u32 npages, u32 align,
 
 	/* present memory for being mapped using small pages */
 	node->r.type = 12;
-	node->r.offset = node->handle >> 12;
+	node->r.offset = imem->iommu_mask | node->handle >> 12;
 	node->r.length = (npages << PAGE_SHIFT) >> 12;
 
 	node->base.mn = &node->r;
@@ -493,7 +495,7 @@ gk20a_instobj_ctor_iommu(struct gk20a_instmem *imem, u32 npages, u32 align,
 	mutex_lock(imem->mm_mutex);
 	/* Reserve area from GPU address space */
 	ret = nvkm_mm_head(imem->mm, 0, 1, npages, npages,
-			   align >> imem->iommu_pgshift, &r);
+			   align >> imem->page_shift, &r);
 	mutex_unlock(imem->mm_mutex);
 	if (ret) {
 		nvkm_error(subdev, "IOMMU space is full!\n");
@@ -502,7 +504,7 @@ gk20a_instobj_ctor_iommu(struct gk20a_instmem *imem, u32 npages, u32 align,
 
 	/* Map into GPU address space */
 	for (i = 0; i < npages; i++) {
-		u32 offset = (r->offset + i) << imem->iommu_pgshift;
+		u32 offset = (r->offset + i) << imem->page_shift;
 
 		ret = iommu_map(imem->domain, offset, node->dma_addrs[i],
 				PAGE_SIZE, IOMMU_READ | IOMMU_WRITE);
@@ -518,7 +520,7 @@ gk20a_instobj_ctor_iommu(struct gk20a_instmem *imem, u32 npages, u32 align,
 	}
 
 	/* IOMMU bit tells that an address is to be resolved through the IOMMU */
-	r->offset |= BIT(imem->iommu_bit - imem->iommu_pgshift);
+	r->offset |= imem->iommu_mask;
 
 	node->base.mn = r;
 	return 0;
@@ -619,11 +621,12 @@ gk20a_instmem_new(struct nvkm_device *device, int index,
 		imem->mm_mutex = &tdev->iommu.mutex;
 		imem->mm = &tdev->iommu.mm;
 		imem->domain = tdev->iommu.domain;
-		imem->iommu_pgshift = tdev->iommu.pgshift;
-		imem->iommu_bit = tdev->func->iommu_bit;
+		imem->page_shift = tdev->iommu.pgshift;
 
 		nvkm_info(&imem->base.subdev, "using IOMMU\n");
 	} else {
+		imem->page_shift = PAGE_SHIFT;
+
 		imem->attrs = DMA_ATTR_NON_CONSISTENT |
 			      DMA_ATTR_WEAK_ORDERING |
 			      DMA_ATTR_WRITE_COMBINE;
@@ -631,5 +634,17 @@ gk20a_instmem_new(struct nvkm_device *device, int index,
 		nvkm_info(&imem->base.subdev, "using DMA API\n");
 	}
 
+	/*
+	 * The IOMMU mask needs to be set if an IOMMU is used explicitly (via
+	 * direct IOMMU API usage) or implicitly (via the DMA API). In both
+	 * cases the device will have been attached to an IOMMU domain.
+	 */
+	if (iommu_get_domain_for_dev(device->dev)) {
+		imem->iommu_mask = BIT_ULL(tdev->func->iommu_bit -
+					   imem->page_shift);
+		nvkm_debug(&imem->base.subdev, "IOMMU mask: %016llx\n",
+			   imem->iommu_mask);
+	}
+
 	return 0;
 }
-- 
2.23.0


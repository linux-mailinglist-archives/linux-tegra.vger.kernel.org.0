Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E38C4100275
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 11:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbfKRKfs (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 05:35:48 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37381 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfKRKfs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 05:35:48 -0500
Received: by mail-wr1-f67.google.com with SMTP id t1so18787156wrv.4
        for <linux-tegra@vger.kernel.org>; Mon, 18 Nov 2019 02:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YpxWMRcpbAZ8vRO0hhGeBAkizcjjb+EwGPq78LSGoIc=;
        b=JjYHPvN4fgfI7MF2pubeKuD+GYtD7BlbPRDIfYCkJ91CYZjGSX/+8DgwlDnPfkaXue
         6rRUxbjmyP4SYql5CzSTzlnPpS+reeUlWHSv1S63Wr5WTyDtWwKjPYLsOnGa8riu29zV
         4M8YnhhCfzJBXW7beNGhAMpJ2dNrzaWuwdBck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YpxWMRcpbAZ8vRO0hhGeBAkizcjjb+EwGPq78LSGoIc=;
        b=ErzZQAHJcywJ0FvN+KINENaKbw1icm1wQHlcJaqK7qAHER0Mix/hNvEDl4ePdEI61r
         JqWJOmGqP2XmHVhdP99RNSsOFG8g+Ghfq1cxEuy3+OlRdPHfen2b2GpYXkqmzhkdY+51
         8Ywn6qWutFsbbHgV8V4raPifvoGruwCKj3UGiS5ZV8BYfzChqYTZzHShNmhxpXVCFoI6
         B5Jo0DDtJMX8+6SEHFgbOlnyfbHF7es+fK0/K0J1qparQFv4m7UUby/7FELmbPyStrbM
         aT0jzIrDKnbfLJLWvyhwMMRNET6w+qMJLI3EnyvdTYpxRP07zNNzDFoRqJqgW1hN6UG5
         o2hA==
X-Gm-Message-State: APjAAAXkkWv8+N5Urg7W8EpEuvtaNkRnP+3L1BI0uUp1xJf59/s6UAcU
        VY6iPXC8hVIGvVE0p+wTAHhSrQ==
X-Google-Smtp-Source: APXvYqyOGusOciBfG2OBXh6PKwLGp9NKfOVa9T1VHeuE1aaABFM0YzolACCslDVyf3lAWPh08o1InA==
X-Received: by 2002:a5d:670a:: with SMTP id o10mr20215754wru.312.1574073346158;
        Mon, 18 Nov 2019 02:35:46 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id j2sm22749200wrt.61.2019.11.18.02.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 02:35:45 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 02/15] drm/tegra: Delete host1x_bo_ops->k(un)map
Date:   Mon, 18 Nov 2019 11:35:23 +0100
Message-Id: <20191118103536.17675-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

It doesn't have any callers anymore.

Aside: The ->mmap/munmap hooks have a bit a confusing name, they don't
do userspace mmaps, but a kernel vmap. I think most places use vmap
for this, except ttm, which uses kmap for vmap for added confusion.
mmap seems entirely for userspace mappings set up through mmap(2)
syscall.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/gem.c | 28 ----------------------------
 include/linux/host1x.h      | 13 -------------
 2 files changed, 41 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 746dae32c484..662cb7c87ef5 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -103,32 +103,6 @@ static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
 		vunmap(addr);
 }
 
-static void *tegra_bo_kmap(struct host1x_bo *bo, unsigned int page)
-{
-	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
-
-	if (obj->vaddr)
-		return obj->vaddr + page * PAGE_SIZE;
-	else if (obj->gem.import_attach)
-		return dma_buf_kmap(obj->gem.import_attach->dmabuf, page);
-	else
-		return vmap(obj->pages + page, 1, VM_MAP,
-			    pgprot_writecombine(PAGE_KERNEL));
-}
-
-static void tegra_bo_kunmap(struct host1x_bo *bo, unsigned int page,
-			    void *addr)
-{
-	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
-
-	if (obj->vaddr)
-		return;
-	else if (obj->gem.import_attach)
-		dma_buf_kunmap(obj->gem.import_attach->dmabuf, page, addr);
-	else
-		vunmap(addr);
-}
-
 static struct host1x_bo *tegra_bo_get(struct host1x_bo *bo)
 {
 	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
@@ -145,8 +119,6 @@ static const struct host1x_bo_ops tegra_bo_ops = {
 	.unpin = tegra_bo_unpin,
 	.mmap = tegra_bo_mmap,
 	.munmap = tegra_bo_munmap,
-	.kmap = tegra_bo_kmap,
-	.kunmap = tegra_bo_kunmap,
 };
 
 static int tegra_bo_iommu_map(struct tegra_drm *tegra, struct tegra_bo *bo)
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 6f8d772591ba..6edeb9228c4e 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -72,8 +72,6 @@ struct host1x_bo_ops {
 	void (*unpin)(struct device *dev, struct sg_table *sgt);
 	void *(*mmap)(struct host1x_bo *bo);
 	void (*munmap)(struct host1x_bo *bo, void *addr);
-	void *(*kmap)(struct host1x_bo *bo, unsigned int pagenum);
-	void (*kunmap)(struct host1x_bo *bo, unsigned int pagenum, void *addr);
 };
 
 struct host1x_bo {
@@ -119,17 +117,6 @@ static inline void host1x_bo_munmap(struct host1x_bo *bo, void *addr)
 	bo->ops->munmap(bo, addr);
 }
 
-static inline void *host1x_bo_kmap(struct host1x_bo *bo, unsigned int pagenum)
-{
-	return bo->ops->kmap(bo, pagenum);
-}
-
-static inline void host1x_bo_kunmap(struct host1x_bo *bo,
-				    unsigned int pagenum, void *addr)
-{
-	bo->ops->kunmap(bo, pagenum, addr);
-}
-
 /*
  * host1x syncpoints
  */
-- 
2.24.0


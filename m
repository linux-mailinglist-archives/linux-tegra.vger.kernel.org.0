Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71EF0D902F
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Oct 2019 13:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387855AbfJPL7W (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 16 Oct 2019 07:59:22 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36742 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387542AbfJPL7W (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Oct 2019 07:59:22 -0400
Received: by mail-wr1-f65.google.com with SMTP id y19so27746074wrd.3
        for <linux-tegra@vger.kernel.org>; Wed, 16 Oct 2019 04:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EPOnpXDyGYq/dSQZFWsPMEbqvrED0YWkaamNYDQK338=;
        b=nEPaQ6+qY/eSGab05ZSBjvrANPqlfLro5LZKKYB8C7s998DBV3N0UytYDobxNaVssF
         k6/C/4KJK49+1LInVD4nkq5i+2uEgWZvrnnizv2B8VatRqZb9eC49zfumJLahr4XIxGb
         pgylwiYf4e3Eqj+YrIQw8adjHSjH2BMER23UKmBv+WDJQeGYDFGA30+k5HvH8JdErpjP
         gZ0Cad+kPb92PWz6ilmrlBc0zae2NIIS+si+kIz2XLuDX5AIznt1JsURHnWLbCfIVE6D
         Bf4+IADIbK5bij3KYRDCvy1I3wQCzFffRU3+hpbfl9i/EWB955M65uwiMcX5DmzNjyvT
         kj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EPOnpXDyGYq/dSQZFWsPMEbqvrED0YWkaamNYDQK338=;
        b=HRpLmzGL4jbHokvxNUwI93a3buoWeM9ly7zWYGm9/i4fWxS/nvKauU1a2HJ1d40zNH
         qE61rxQ9iUXoMzIw2z9gEDlChKE8m6MJWEiA36T8PrkEHQAhxhMvS36QL3ZBiKYmDIXU
         AN9yMetpHJcnn2CC5Bt8YeUhNHU6nnJtToNGEbudiYuyhWh1nV7+T8zLQK4AEdtRufYW
         IF0mAg9GNQNO9HsGgVzIIeS3xl2qskCh2vvdxctumFO4sY19gb0prQA0qrTky0R5r9zE
         PooKn6LsL5xMFaK7d+F0JaIW6Vr6WDgAR7FYSxRaZN5TQwuuPPMx7wKZ1T/2tK/v4Fs3
         VKxA==
X-Gm-Message-State: APjAAAX+9S4P7o34YhdmEFFwpn7otE7mcpzQ2m3dTxF2a/g51/oJ4qD5
        Qb5YlmAR7nyyMYDtJsVlNLgoso70
X-Google-Smtp-Source: APXvYqx5giAFp/xr6HcSlcRhUUI6X+YRSWVl98ruFVJ6CLNwGWUj+GGYnjlbtSX6TRc8hcY/O1U9wg==
X-Received: by 2002:adf:a547:: with SMTP id j7mr2366289wrb.154.1571227159200;
        Wed, 16 Oct 2019 04:59:19 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id h18sm11808302wrr.78.2019.10.16.04.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 04:59:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/8] gpu: host1x: Overhaul host1x_bo_{pin,unpin}() API
Date:   Wed, 16 Oct 2019 13:59:09 +0200
Message-Id: <20191016115916.1769133-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The host1x_bo_pin() and host1x_bo_unpin() APIs are used to pin and unpin
buffers during host1x job submission. Pinning currently returns the SG
table and the DMA address (an IOVA if an IOMMU is used or a physical
address if no IOMMU is used) of the buffer. The DMA address is only used
for buffers that are relocated, whereas the host1x driver will map
gather buffers into its own IOVA space so that they can be processed by
the CDMA engine.

This approach has a couple of issues. On one hand it's not very useful
to return a DMA address for the buffer if host1x doesn't need it. On the
other hand, returning the SG table of the buffer is suboptimal because a
single SG table cannot be shared for multiple mappings, because the DMA
address is stored within the SG table, and the DMA address may be
different for different devices.

Subsequent patches will move the host1x driver over to the DMA API which
doesn't work with a single shared SG table. Fix this by returning a new
SG table each time a buffer is pinned. This allows the buffer to be
referenced by multiple jobs for different engines.

Change the prototypes of host1x_bo_pin() and host1x_bo_unpin() to take a
struct device *, specifying the device for which the buffer should be
pinned. This is required in order to be able to properly construct the
SG table. While at it, make host1x_bo_pin() return the SG table because
that allows us to return an ERR_PTR()-encoded error code if we need to,
or return NULL to signal that we don't need the SG table to be remapped
and can simply use the DMA address as-is. At the same time, returning
the DMA address is made optional because in the example of command
buffers, host1x doesn't need to know the DMA address since it will have
to create its own mapping anyway.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 34 ++++++++++++++++++++++++++++++----
 drivers/gpu/host1x/job.c    | 15 ++++++++++++---
 include/linux/host1x.h      | 17 ++++++++++-------
 3 files changed, 52 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index d2f88cc3134f..564ef60f67c2 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -27,17 +27,43 @@ static void tegra_bo_put(struct host1x_bo *bo)
 	drm_gem_object_put_unlocked(&obj->gem);
 }
 
-static dma_addr_t tegra_bo_pin(struct host1x_bo *bo, struct sg_table **sgt)
+static struct sg_table *tegra_bo_pin(struct device *dev, struct host1x_bo *bo,
+				     dma_addr_t *phys)
 {
 	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
+	struct sg_table *sgt;
+	int err;
+
+	if (phys)
+		*phys = obj->iova;
 
-	*sgt = obj->sgt;
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
 
-	return obj->iova;
+	if (obj->pages) {
+		err = sg_alloc_table_from_pages(sgt, obj->pages, obj->num_pages,
+						0, obj->gem.size, GFP_KERNEL);
+		if (err < 0)
+			goto free;
+	} else {
+		err = dma_get_sgtable(dev, sgt, obj->vaddr, obj->iova,
+				      obj->gem.size);
+		if (err < 0)
+			goto free;
+	}
+
+	return sgt;
+
+free:
+	kfree(sgt);
+	return ERR_PTR(err);
 }
 
-static void tegra_bo_unpin(struct host1x_bo *bo, struct sg_table *sgt)
+static void tegra_bo_unpin(struct device *dev, struct sg_table *sgt)
 {
+	sg_free_table(sgt);
+	kfree(sgt);
 }
 
 static void *tegra_bo_mmap(struct host1x_bo *bo)
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index eaa5c3352c13..90dd592fdfca 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -99,6 +99,7 @@ EXPORT_SYMBOL(host1x_job_add_gather);
 
 static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 {
+	struct device *dev = job->client->dev;
 	unsigned int i;
 	int err;
 
@@ -115,7 +116,11 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			goto unpin;
 		}
 
-		phys_addr = host1x_bo_pin(reloc->target.bo, &sgt);
+		sgt = host1x_bo_pin(dev, reloc->target.bo, &phys_addr);
+		if (IS_ERR(sgt)) {
+			err = PTR_ERR(sgt);
+			goto unpin;
+		}
 
 		job->addr_phys[job->num_unpins] = phys_addr;
 		job->unpins[job->num_unpins].bo = reloc->target.bo;
@@ -139,7 +144,11 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			goto unpin;
 		}
 
-		phys_addr = host1x_bo_pin(g->bo, &sgt);
+		sgt = host1x_bo_pin(host->dev, g->bo, &phys_addr);
+		if (IS_ERR(sgt)) {
+			err = PTR_ERR(sgt);
+			goto unpin;
+		}
 
 		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
 			for_each_sg(sgt->sgl, sg, sgt->nents, j)
@@ -566,7 +575,7 @@ void host1x_job_unpin(struct host1x_job *job)
 				iova_pfn(&host->iova, job->addr_phys[i]));
 		}
 
-		host1x_bo_unpin(unpin->bo, unpin->sgt);
+		host1x_bo_unpin(host->dev, unpin->bo, unpin->sgt);
 		host1x_bo_put(unpin->bo);
 	}
 
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index df6e613ba715..1ba23a6a2021 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -67,8 +67,9 @@ struct sg_table;
 struct host1x_bo_ops {
 	struct host1x_bo *(*get)(struct host1x_bo *bo);
 	void (*put)(struct host1x_bo *bo);
-	dma_addr_t (*pin)(struct host1x_bo *bo, struct sg_table **sgt);
-	void (*unpin)(struct host1x_bo *bo, struct sg_table *sgt);
+	struct sg_table *(*pin)(struct device *dev, struct host1x_bo *bo,
+				dma_addr_t *phys);
+	void (*unpin)(struct device *dev, struct sg_table *sgt);
 	void *(*mmap)(struct host1x_bo *bo);
 	void (*munmap)(struct host1x_bo *bo, void *addr);
 	void *(*kmap)(struct host1x_bo *bo, unsigned int pagenum);
@@ -95,15 +96,17 @@ static inline void host1x_bo_put(struct host1x_bo *bo)
 	bo->ops->put(bo);
 }
 
-static inline dma_addr_t host1x_bo_pin(struct host1x_bo *bo,
-				       struct sg_table **sgt)
+static inline struct sg_table *host1x_bo_pin(struct device *dev,
+					     struct host1x_bo *bo,
+					     dma_addr_t *phys)
 {
-	return bo->ops->pin(bo, sgt);
+	return bo->ops->pin(dev, bo, phys);
 }
 
-static inline void host1x_bo_unpin(struct host1x_bo *bo, struct sg_table *sgt)
+static inline void host1x_bo_unpin(struct device *dev, struct host1x_bo *bo,
+				   struct sg_table *sgt)
 {
-	bo->ops->unpin(bo, sgt);
+	bo->ops->unpin(dev, sgt);
 }
 
 static inline void *host1x_bo_mmap(struct host1x_bo *bo)
-- 
2.23.0


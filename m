Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68BA0E7176
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Oct 2019 13:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfJ1Mhb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Oct 2019 08:37:31 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53996 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389093AbfJ1Mha (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Oct 2019 08:37:30 -0400
Received: by mail-wm1-f67.google.com with SMTP id n7so9274736wmc.3
        for <linux-tegra@vger.kernel.org>; Mon, 28 Oct 2019 05:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EPOnpXDyGYq/dSQZFWsPMEbqvrED0YWkaamNYDQK338=;
        b=vemlLMCW9674nFf3lYNNPdQO1uwyR23j2sCfYArUdKD5HaKwxyFjF6wrJdL3Ig+qR6
         Y0J1uYz7BV6JbGTJn37YDT4/Tdh6acZUjW8cyAm/DKSidIzsWo1Bxucal2HDxqMo/3dy
         7tqK0QX9LqSsANG0fKBU4F4F+mUHs/KdJ7WpZjDmo9rBqwzJzOmMj6f7irIUuzHAJ4rm
         kn3jJrZiWae5HaVPvrC+jAQK9jSE1oCKapVsLE2v3koDSSdiB0Om+Ppb1r54eK4qSUpy
         ToBhK+sUZb1MMoTd+h2132JzB50ayKGlXXYJYPPHh451nB1Mqw6S5BwWdwQhbdfWjC3S
         XmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EPOnpXDyGYq/dSQZFWsPMEbqvrED0YWkaamNYDQK338=;
        b=feUXyFPK7hhbRAQ2mgABiNSyefhB60JNrWsmi7f2eZY2pQ/DmCQn40TJ25CiQjKwil
         LTDADmSJnqBGqQv2q5lcSmPN1ko910/J7fgY+CAoU3dZp3BiZrVOTjB6GdDHHf8cGPYm
         2fxNwQcY8QLiWY3u8dIFoBdZrxGzjjOMqvOzli9+aw2MxqpcKUjD1ZIpJhcjJbzmZO1t
         mGxG2hAAYbw50GAWDSntHPaqpxz3CxuCBJZi3xBsHshyoyh8MGbCUtdx+HKdP403vLSh
         W4+7OUfHskqohjweQsS7QYqiPCVtEQhbLN/DnKHiNSCa26bXI0LrEKpzjAUusK4Fpl6h
         M6nA==
X-Gm-Message-State: APjAAAXvMtjMN6BHNG0GRQWLv6jJD/pPZVzWuoyyBExDYjcAO8CY9M6w
        Xv7OMlSVG9ZJMis4hlGRYAc=
X-Google-Smtp-Source: APXvYqztZlmUZhZoNCFZ0ah+tFbQBoRqbeo9L72jsb/i6ZYlDKsf5WwXIvYW6JjcJAW40w8VCs5A9g==
X-Received: by 2002:a1c:64d4:: with SMTP id y203mr15587137wmb.27.1572266247858;
        Mon, 28 Oct 2019 05:37:27 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id d202sm11919141wmd.47.2019.10.28.05.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 05:37:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sachin Nikam <snikam@nvidia.com>,
        Puneet Saxena <puneets@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 03/12] gpu: host1x: Overhaul host1x_bo_{pin,unpin}() API
Date:   Mon, 28 Oct 2019 13:37:09 +0100
Message-Id: <20191028123718.3890217-4-thierry.reding@gmail.com>
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


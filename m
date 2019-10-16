Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB8D4D9032
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Oct 2019 13:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387860AbfJPL70 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 16 Oct 2019 07:59:26 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36758 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387542AbfJPL70 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Oct 2019 07:59:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id y19so27746367wrd.3
        for <linux-tegra@vger.kernel.org>; Wed, 16 Oct 2019 04:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y3hGZKYPdf/kwQdJLWDVKLmiYb7Xh58rQiEmmA14dk8=;
        b=rBnAubMSEkuy9s5ymKrfWnS6Kz2clfXMSrYr4ZsU1kzwHW2pIxKELZdGFk0J90mIa6
         1q8FfWujh5N8MbeJPvnV8zKgp61kdPa27UXEv6TOEjaglCNYJtaUyDL+YuM5OXL9+r6P
         qjJcUzBmG3/wd8D5Mruge8I8s+VufIKktrMA5TSBDJM+FcjIqTtti/Y2vLiYG9j2keRx
         Oa4PkwdFOC+upFfpdWbuWYtQ77xaUZWuNHTJGPSHrjor0tvbjpbSUOE2MXw91Lr8ja8N
         YbadV7Qwhwd6ATn8d/ihMj2v5BbarjYIoPMsDy/hy/5hAL0Yr6pSynq4pQi1bquE6rT1
         HfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y3hGZKYPdf/kwQdJLWDVKLmiYb7Xh58rQiEmmA14dk8=;
        b=fVsf7/hTdsXB1vD4oAu6DSSh+rSPvURyYHxuuNv5lk7VLeNK/7sbQXmd+mirGRTqcj
         sYjp+N4EHfcHrmrlgQghHeziThZR1eS1nfyhSz9PyjIr6apoYNHhPSn6mGcNmDZlMO0s
         8U0joYbNiwhpsGV3/JLGxYuTAQxo9XxgqCHd8+bkGFOJT1vJ6FAMRw/e4bpKNqd/LvFL
         SfL2JG+/HiFZOpvlyjTYdqvX60ooXh6gQAMLmKIXFkdSfzbobO8M9AGm8IpmKSzrGjx8
         3l/Ns/LuP0iSK9kh2jtjYlO5GGrkmJgQqle5oh7ZuzFK/BpyxwGlOH5zY5YHEfXWdBPH
         jdQw==
X-Gm-Message-State: APjAAAUCpdV+KqnYdQnPl7XfByY30BdB/tFtIq3YOSX8PB8nICiiJHNp
        M9li5LaFubN5av2ShxB9Eb6wUjMp
X-Google-Smtp-Source: APXvYqyELGN2ZjBrFEMboPLn2QD5qpOc6hTtSLoKoPR8VS+Z+vDBcRBLESXLahwNxWNST7WDKK9GTw==
X-Received: by 2002:a5d:52c8:: with SMTP id r8mr2469673wrv.132.1571227163354;
        Wed, 16 Oct 2019 04:59:23 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id g17sm20472999wrq.58.2019.10.16.04.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 04:59:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 3/8] gpu: host1x: Support DMA mapping of buffers
Date:   Wed, 16 Oct 2019 13:59:11 +0200
Message-Id: <20191016115916.1769133-3-thierry.reding@gmail.com>
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

If host1x_bo_pin() returns an SG table, create a DMA mapping for the
buffer. For buffers that the host1x client has already mapped itself,
host1x_bo_pin() returns NULL and the existing DMA address is used.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 18 +++++++--
 drivers/gpu/host1x/dev.c    | 16 ++------
 drivers/gpu/host1x/job.c    | 73 ++++++++++++++++++++++++++++++++-----
 drivers/gpu/host1x/job.h    |  4 ++
 4 files changed, 87 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 564ef60f67c2..746dae32c484 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -34,9 +34,19 @@ static struct sg_table *tegra_bo_pin(struct device *dev, struct host1x_bo *bo,
 	struct sg_table *sgt;
 	int err;
 
-	if (phys)
+	/*
+	 * If we've manually mapped the buffer object through the IOMMU, make
+	 * sure to return the IOVA address of our mapping.
+	 */
+	if (phys && obj->mm) {
 		*phys = obj->iova;
+		return NULL;
+	}
 
+	/*
+	 * If we don't have a mapping for this buffer yet, return an SG table
+	 * so that host1x can do the mapping for us via the DMA API.
+	 */
 	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
 	if (!sgt)
 		return ERR_PTR(-ENOMEM);
@@ -62,8 +72,10 @@ static struct sg_table *tegra_bo_pin(struct device *dev, struct host1x_bo *bo,
 
 static void tegra_bo_unpin(struct device *dev, struct sg_table *sgt)
 {
-	sg_free_table(sgt);
-	kfree(sgt);
+	if (sgt) {
+		sg_free_table(sgt);
+		kfree(sgt);
+	}
 }
 
 static void *tegra_bo_mmap(struct host1x_bo *bo)
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index e8ab4d0c5091..18b6fc5e5b2e 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -18,10 +18,6 @@
 #include <trace/events/host1x.h>
 #undef CREATE_TRACE_POINTS
 
-#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
-#include <asm/dma-iommu.h>
-#endif
-
 #include "bus.h"
 #include "channel.h"
 #include "debug.h"
@@ -273,17 +269,13 @@ static int host1x_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to get reset: %d\n", err);
 		return err;
 	}
-#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
-	if (host->dev->archdata.mapping) {
-		struct dma_iommu_mapping *mapping =
-				to_dma_iommu_mapping(host->dev);
-		arm_iommu_detach_device(host->dev);
-		arm_iommu_release_mapping(mapping);
-	}
-#endif
+
 	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
 		goto skip_iommu;
 
+	if (iommu_get_domain_for_dev(&pdev->dev))
+		goto skip_iommu;
+
 	host->group = iommu_group_get(&pdev->dev);
 	if (host->group) {
 		struct iommu_domain_geometry *geometry;
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 90dd592fdfca..10c5fb8136e9 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -99,7 +99,8 @@ EXPORT_SYMBOL(host1x_job_add_gather);
 
 static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 {
-	struct device *dev = job->client->dev;
+	struct host1x_client *client = job->client;
+	struct device *dev = client->dev;
 	unsigned int i;
 	int err;
 
@@ -107,8 +108,8 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 
 	for (i = 0; i < job->num_relocs; i++) {
 		struct host1x_reloc *reloc = &job->relocs[i];
+		dma_addr_t phys_addr, *phys;
 		struct sg_table *sgt;
-		dma_addr_t phys_addr;
 
 		reloc->target.bo = host1x_bo_get(reloc->target.bo);
 		if (!reloc->target.bo) {
@@ -116,12 +117,51 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			goto unpin;
 		}
 
-		sgt = host1x_bo_pin(dev, reloc->target.bo, &phys_addr);
+		if (client->group)
+			phys = &phys_addr;
+		else
+			phys = NULL;
+
+		sgt = host1x_bo_pin(dev, reloc->target.bo, phys);
 		if (IS_ERR(sgt)) {
 			err = PTR_ERR(sgt);
 			goto unpin;
 		}
 
+		if (sgt) {
+			unsigned long mask = HOST1X_RELOC_READ |
+					     HOST1X_RELOC_WRITE;
+			enum dma_data_direction dir;
+
+			switch (reloc->flags & mask) {
+			case HOST1X_RELOC_READ:
+				dir = DMA_TO_DEVICE;
+				break;
+
+			case HOST1X_RELOC_WRITE:
+				dir = DMA_FROM_DEVICE;
+				break;
+
+			case HOST1X_RELOC_READ | HOST1X_RELOC_WRITE:
+				dir = DMA_BIDIRECTIONAL;
+				break;
+
+			default:
+				err = -EINVAL;
+				goto unpin;
+			}
+
+			err = dma_map_sg(dev, sgt->sgl, sgt->nents, dir);
+			if (!err) {
+				err = -ENOMEM;
+				goto unpin;
+			}
+
+			job->unpins[job->num_unpins].dev = dev;
+			job->unpins[job->num_unpins].dir = dir;
+			phys_addr = sg_dma_address(sgt->sgl);
+		}
+
 		job->addr_phys[job->num_unpins] = phys_addr;
 		job->unpins[job->num_unpins].bo = reloc->target.bo;
 		job->unpins[job->num_unpins].sgt = sgt;
@@ -144,7 +184,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			goto unpin;
 		}
 
-		sgt = host1x_bo_pin(host->dev, g->bo, &phys_addr);
+		sgt = host1x_bo_pin(host->dev, g->bo, NULL);
 		if (IS_ERR(sgt)) {
 			err = PTR_ERR(sgt);
 			goto unpin;
@@ -172,15 +212,24 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 				goto unpin;
 			}
 
-			job->addr_phys[job->num_unpins] =
-				iova_dma_addr(&host->iova, alloc);
 			job->unpins[job->num_unpins].size = gather_size;
+			phys_addr = iova_dma_addr(&host->iova, alloc);
 		} else {
-			job->addr_phys[job->num_unpins] = phys_addr;
+			err = dma_map_sg(host->dev, sgt->sgl, sgt->nents,
+					 DMA_TO_DEVICE);
+			if (!err) {
+				err = -ENOMEM;
+				goto unpin;
+			}
+
+			job->unpins[job->num_unpins].dev = host->dev;
+			phys_addr = sg_dma_address(sgt->sgl);
 		}
 
-		job->gather_addr_phys[i] = job->addr_phys[job->num_unpins];
+		job->addr_phys[job->num_unpins] = phys_addr;
+		job->gather_addr_phys[i] = phys_addr;
 
+		job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
 		job->unpins[job->num_unpins].bo = g->bo;
 		job->unpins[job->num_unpins].sgt = sgt;
 		job->num_unpins++;
@@ -566,6 +615,8 @@ void host1x_job_unpin(struct host1x_job *job)
 
 	for (i = 0; i < job->num_unpins; i++) {
 		struct host1x_job_unpin_data *unpin = &job->unpins[i];
+		struct device *dev = unpin->dev ?: host->dev;
+		struct sg_table *sgt = unpin->sgt;
 
 		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) &&
 		    unpin->size && host->domain) {
@@ -575,7 +626,11 @@ void host1x_job_unpin(struct host1x_job *job)
 				iova_pfn(&host->iova, job->addr_phys[i]));
 		}
 
-		host1x_bo_unpin(host->dev, unpin->bo, unpin->sgt);
+		if (unpin->dev && sgt)
+			dma_unmap_sg(unpin->dev, sgt->sgl, sgt->nents,
+				     unpin->dir);
+
+		host1x_bo_unpin(dev, unpin->bo, sgt);
 		host1x_bo_put(unpin->bo);
 	}
 
diff --git a/drivers/gpu/host1x/job.h b/drivers/gpu/host1x/job.h
index 62b8805e6b35..94bc2e4ae241 100644
--- a/drivers/gpu/host1x/job.h
+++ b/drivers/gpu/host1x/job.h
@@ -8,6 +8,8 @@
 #ifndef __HOST1X_JOB_H
 #define __HOST1X_JOB_H
 
+#include <linux/dma-direction.h>
+
 struct host1x_job_gather {
 	unsigned int words;
 	dma_addr_t base;
@@ -19,7 +21,9 @@ struct host1x_job_gather {
 struct host1x_job_unpin_data {
 	struct host1x_bo *bo;
 	struct sg_table *sgt;
+	struct device *dev;
 	size_t size;
+	enum dma_data_direction dir;
 };
 
 /*
-- 
2.23.0


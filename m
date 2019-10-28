Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04175E717C
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Oct 2019 13:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389116AbfJ1Mhj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Oct 2019 08:37:39 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50790 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389093AbfJ1Mhj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Oct 2019 08:37:39 -0400
Received: by mail-wm1-f68.google.com with SMTP id 11so9292449wmk.0
        for <linux-tegra@vger.kernel.org>; Mon, 28 Oct 2019 05:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E/UgrwgRQLjyCEevCXRu9Z+kxkO/MmTvvuOszdrefH0=;
        b=uBlDjD0NOHbZQoQnFny5KS7yvl6dLYmduoGNxk7iOlcSb+WzLIUdZY570FD5GgUcMw
         94rUWCloxKl1L6oydW/Vougyavt7DyUtfAH87juHEbx5nPhtXkkEH0W4NCVKJEQAKqGp
         iwKm0d7KuIOuTZpwIGkC787h+3Opww6PA18Oqaxkef3W9rLrRglGz0XxSncKGNZk0hF1
         S02aUoYRPuXA5K4HtX2pmbkrmUzbkrlNoSPWUj0j5m8VwEX6P7+RQUsyqAsX0v6rwQOF
         B8Pcj/IvEtNKZmVG4Wzfsis9iXlhleWR4EWMmSn1FRujNx/BVpHFY3g7jfe7Tg52M6ab
         5JAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E/UgrwgRQLjyCEevCXRu9Z+kxkO/MmTvvuOszdrefH0=;
        b=QMLGp0EZtcTln9WyBPsnq8FYtqgUT43X55muiWKVA0mBy6yQY/JZUvfeDV9y+kvafx
         c72AmpXsgv6tTmT86U2nG9PFAmFmswjMZk50DvWtWm17019I2MkhWJVSYVoqAxU3+OhR
         xapjDV2imsxeZEw/EgTMRaST+ufCfZf//hk/eDuARYOPRqXBxYD2r3rWj0ST93o8ERvs
         1xr/NDE/RViEDkFwSBrR1KpeqO+ir4M82p3i7mLje58smTae5OtG6IDWR+jGUdo9FbmI
         xm/O+unENg1sFshMflUNk10k02C4UImGgfeRWGLxKcjZZ6YV7ZqCKym2AOBH9HRKnefK
         bNfw==
X-Gm-Message-State: APjAAAU6Y1UOGIhapTP8co2dbddPaikQeNQHB3qCrc1u86aHgKXBpIJS
        KmAocshHfj+DsLrYMskMjyY=
X-Google-Smtp-Source: APXvYqyeRKg5k2Ef1ftZJv2yazvaKn/qdvlq67GEjLGiQEfnkKVmBiPD5813o6DyUzD5LAVPOTW6lA==
X-Received: by 2002:a1c:1d41:: with SMTP id d62mr15282285wmd.32.1572266256156;
        Mon, 28 Oct 2019 05:37:36 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id 74sm13180791wrm.92.2019.10.28.05.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 05:37:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sachin Nikam <snikam@nvidia.com>,
        Puneet Saxena <puneets@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 07/12] gpu: host1x: Support DMA mapping of buffers
Date:   Mon, 28 Oct 2019 13:37:13 +0100
Message-Id: <20191028123718.3890217-8-thierry.reding@gmail.com>
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
index f30b8447a319..5bdc484398f4 100644
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
@@ -276,17 +272,13 @@ static int host1x_probe(struct platform_device *pdev)
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
index 2e0c3e0ca1fa..25ca54de8fc5 100644
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
@@ -567,6 +616,8 @@ void host1x_job_unpin(struct host1x_job *job)
 
 	for (i = 0; i < job->num_unpins; i++) {
 		struct host1x_job_unpin_data *unpin = &job->unpins[i];
+		struct device *dev = unpin->dev ?: host->dev;
+		struct sg_table *sgt = unpin->sgt;
 
 		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) &&
 		    unpin->size && host->domain) {
@@ -576,7 +627,11 @@ void host1x_job_unpin(struct host1x_job *job)
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


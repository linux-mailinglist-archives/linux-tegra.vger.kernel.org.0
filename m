Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 177181E014A
	for <lists+linux-tegra@lfdr.de>; Sun, 24 May 2020 19:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387766AbgEXRwt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 24 May 2020 13:52:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387903AbgEXRwt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 24 May 2020 13:52:49 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC643C061A0E
        for <linux-tegra@vger.kernel.org>; Sun, 24 May 2020 10:52:47 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id m12so16006189ljc.6
        for <linux-tegra@vger.kernel.org>; Sun, 24 May 2020 10:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EidOYNDtTRNJ+8EWo2ihqYeWgFnIbrPaGzDz8MoTfPU=;
        b=hf0fkOh44Hz1GSlRaIJD2Q5yPM22PwrhY7QYVNciO9CJdlQngK5rMMI+qpN8ps0q/h
         TtQ2wlSbJQ1go+3USEETIMmOAs2xiaGTeFvrwiNgNEqEhxX/kP+GUGMZefD8YfKZgZ8d
         gqUka7iHYAoqQRR1atnI7lYpv4/Ot9TlKdF3xEl9h/58Th7yYiCdk++hrD5YN+P3FfF1
         w6GDQfeZMM8Vb7nMncdQt4TLHmVdwjkDeY5z9giU9yilvxMOWqiPFQjuYLWlZ1vHE1Cy
         bM/eD+0bzDaQ8n9ABFc4W3v8kRAqN0IMfDaSnC/fUQc834DKQU8XrCktfNJV64MavWB0
         DAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EidOYNDtTRNJ+8EWo2ihqYeWgFnIbrPaGzDz8MoTfPU=;
        b=o6s8W5P3rgUil2pYOZ4/rSV7gavyX+kKJC0Nsm2y982s9HjFa7T6v6g5eCT7V+SarN
         sEKDP0wyjHuDgIJNWJJIFNc0zN5z2S0o7DxlSBjt7BJWkRWI+f2b/i+lwd+qXnodGIje
         ik8JOjpWW+RME8tvsrqeJPFLt6ehcSDMEmSsyUNMREfgGPTbeoNLBYmaqwI0g0sdasT2
         s2CmBW2XMfz+yQi5ONOmzOvbPd73LsM/WYFy1qx+S2Bf5CMV6qIcKJzSjd6+CKckb21J
         y/FQz+APkjrbLSZ7TSLE6TPe3xL5wQbf5EnXLDufNKs/R5ldKFG4mr13JDW2n4MdAqcv
         aTyQ==
X-Gm-Message-State: AOAM5304qNJzja0AmtFb6TRgcdQzgWP2Xx15dYTyyqgjUt0CXmjwAQ3i
        p0B25lK2MCcNV65fOHLugPs=
X-Google-Smtp-Source: ABdhPJyGXNhwXDs66OdEMOiuakbEIOmA0CWoRIKacRnM5ybE3xnoSfUTfsadLaPdVerhtmq1Q4jLFg==
X-Received: by 2002:a2e:978d:: with SMTP id y13mr12899232lji.80.1590342766241;
        Sun, 24 May 2020 10:52:46 -0700 (PDT)
Received: from localhost.localdomain (ppp91-76-17-204.pppoe.mtu-net.ru. [91.76.17.204])
        by smtp.gmail.com with ESMTPSA id 130sm4045350lfl.37.2020.05.24.10.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 10:52:45 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/4] gpu: host1x: Put gather's BO on pinning error
Date:   Sun, 24 May 2020 20:50:58 +0300
Message-Id: <20200524175100.9334-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200524175100.9334-1-digetx@gmail.com>
References: <20200524175100.9334-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch fixes gather's BO refcounting on a pinning error. Gather's BO
won't be leaked now if something goes wrong.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/job.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index a954bd41aa79..89b6c14b7392 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -105,6 +105,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 {
 	struct host1x_client *client = job->client;
 	struct device *dev = client->dev;
+	struct host1x_job_gather *g;
 	struct iommu_domain *domain;
 	unsigned int i;
 	int err;
@@ -194,7 +195,6 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 		return 0;
 
 	for (i = 0; i < job->num_gathers; i++) {
-		struct host1x_job_gather *g = &job->gathers[i];
 		size_t gather_size = 0;
 		struct scatterlist *sg;
 		struct sg_table *sgt;
@@ -204,6 +204,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 		dma_addr_t *phys;
 		unsigned int j;
 
+		g = &job->gathers[i];
 		g->bo = host1x_bo_get(g->bo);
 		if (!g->bo) {
 			err = -EINVAL;
@@ -223,7 +224,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 		sgt = host1x_bo_pin(host->dev, g->bo, phys);
 		if (IS_ERR(sgt)) {
 			err = PTR_ERR(sgt);
-			goto unpin;
+			goto put;
 		}
 
 		if (host->domain) {
@@ -236,7 +237,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 					   host->iova_end >> shift, true);
 			if (!alloc) {
 				err = -ENOMEM;
-				goto unpin;
+				goto put;
 			}
 
 			err = iommu_map_sg(host->domain,
@@ -245,7 +246,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			if (err == 0) {
 				__free_iova(&host->iova, alloc);
 				err = -EINVAL;
-				goto unpin;
+				goto put;
 			}
 
 			job->unpins[job->num_unpins].size = gather_size;
@@ -255,7 +256,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 					 DMA_TO_DEVICE);
 			if (!err) {
 				err = -ENOMEM;
-				goto unpin;
+				goto put;
 			}
 
 			job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
@@ -273,6 +274,8 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 
 	return 0;
 
+put:
+	host1x_bo_put(g->bo);
 unpin:
 	host1x_job_unpin(job);
 	return err;
-- 
2.26.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7005520CC15
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jun 2020 05:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgF2DS5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 28 Jun 2020 23:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgF2DS5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Jun 2020 23:18:57 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18361C03E979
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 20:18:57 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id d17so1684539ljl.3
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 20:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EidOYNDtTRNJ+8EWo2ihqYeWgFnIbrPaGzDz8MoTfPU=;
        b=Y+YodDPux7QGmbop0JYWpFp0BOokiRnETh7u8XOIj59/zwhMKOyuD6ffbK1rlp+IYy
         tcBqK6n2xdr07S8OxbBHAgadJQY2cO8WwTzHmQG3zvevViS5Qn988RBdMlnTgJKP9uwg
         iWX7m4LqSWDgLnkEqb5t0wpsiX+JNpcWAdCsiONkvsI62m+1Phi7Jx86Z/2dUIC61oJE
         y7U5rySudAWbeUbpqaxfrc12bKJULjMcEM78OVKMJ/xLfjj1RC9JIJGE0mtfNa1eVjO3
         4xVmCrR0F+adH7AaQ6Ai5wImZ+ezRAEdrKFdnDLEPoNU3KIjsRXa4VpDyHIFwomFjE9u
         /Olw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EidOYNDtTRNJ+8EWo2ihqYeWgFnIbrPaGzDz8MoTfPU=;
        b=PssaY27MXTz5AH7XBk4ZVTRUb2QNAgv37qedz/Umf9t3f9zCL61eRCA/R/nPQiKtcn
         mzvtwtAtYC8nMuz+FTkiT/HmtdIejjB81tBVZY89bMY82JE8d1tmMHhhX7gAQDP7LGPM
         h2qFiZhauwxcwWi2pBH9T2ktM4ukDxonie88+i0dqas2IDEehQ5/ZpJ03Rux1PcWDIjD
         hZNBcrsefGuGpix1xzyRfruatpN7DrKUdXed2PKRw6CBATmUv2xhYnxollmhlgDlJfQK
         uXKlV8Pp4S73LWmYWoo6hEQiC2WsulXVbpUki9Lk1B6UJV4FuR6kO6PybsV9LnMt0WIb
         E1kg==
X-Gm-Message-State: AOAM530Pb9yLBkCJTB82MqDa3g5Sg1W3/YYUgAs/a/rL7uk+GTjZ2xZy
        ZmlbJKN7c6d31nENnGGfgmdeARfU9Ag=
X-Google-Smtp-Source: ABdhPJxLj+BbmYAqjK/EWXvwIUBZLwM/VqsFenHGt/B8hEyulXm5SHltxo39BOFkianXSP/Vo3goeQ==
X-Received: by 2002:a2e:7f10:: with SMTP id a16mr7257364ljd.69.1593400735631;
        Sun, 28 Jun 2020 20:18:55 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id m1sm2383295ljg.60.2020.06.28.20.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 20:18:55 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 4/6] gpu: host1x: Put gather's BO on pinning error
Date:   Mon, 29 Jun 2020 06:18:40 +0300
Message-Id: <20200629031842.32463-5-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200629031842.32463-1-digetx@gmail.com>
References: <20200629031842.32463-1-digetx@gmail.com>
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


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0318D1196A2
	for <lists+linux-tegra@lfdr.de>; Tue, 10 Dec 2019 22:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbfLJV2L (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 10 Dec 2019 16:28:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:60326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727835AbfLJVK1 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Dec 2019 16:10:27 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CFC95246A8;
        Tue, 10 Dec 2019 21:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576012226;
        bh=GOXWFvh7GoXw9UjuaXvqLHGd8pSf1Cch+DSQANsyhzk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wd4a7PhbH/7lS7uioVYJKiwPhSyx4KhkQm1CVuIYG1MDsyLqb9mdCwEtAxyFbQhND
         6+cTCdzfl2tHfAyLskBmlmu8haeUeXrfzDU8WMsINfu3owFFDmVyPeHcBOSjEMALqu
         wQlMVchVV3xj3TQ9Qj/Isv1xNlwayTjHZ6q5opTA=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Thierry Reding <treding@nvidia.com>,
        Sasha Levin <sashal@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 176/350] gpu: host1x: Allocate gather copy for host1x
Date:   Tue, 10 Dec 2019 16:04:41 -0500
Message-Id: <20191210210735.9077-137-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

[ Upstream commit b78e70c04c149299bd210759d7c7af7c86b89ca8 ]

Currently when the gather buffers are copied, they are copied to a
buffer that is allocated for the host1x client that wants to execute the
command streams in the buffers. However, the gather buffers will be read
by the host1x device, which causes SMMU faults if the DMA API is backed
by an IOMMU.

Fix this by allocating the gather buffer copy for the host1x device,
which makes sure that it will be mapped into the host1x's IOVA space if
the DMA API is backed by an IOMMU.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/host1x/job.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index eaa5c3352c134..22559670faeef 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -436,7 +436,8 @@ static int validate(struct host1x_firewall *fw, struct host1x_job_gather *g)
 	return err;
 }
 
-static inline int copy_gathers(struct host1x_job *job, struct device *dev)
+static inline int copy_gathers(struct device *host, struct host1x_job *job,
+			       struct device *dev)
 {
 	struct host1x_firewall fw;
 	size_t size = 0;
@@ -459,12 +460,12 @@ static inline int copy_gathers(struct host1x_job *job, struct device *dev)
 	 * Try a non-blocking allocation from a higher priority pools first,
 	 * as awaiting for the allocation here is a major performance hit.
 	 */
-	job->gather_copy_mapped = dma_alloc_wc(dev, size, &job->gather_copy,
+	job->gather_copy_mapped = dma_alloc_wc(host, size, &job->gather_copy,
 					       GFP_NOWAIT);
 
 	/* the higher priority allocation failed, try the generic-blocking */
 	if (!job->gather_copy_mapped)
-		job->gather_copy_mapped = dma_alloc_wc(dev, size,
+		job->gather_copy_mapped = dma_alloc_wc(host, size,
 						       &job->gather_copy,
 						       GFP_KERNEL);
 	if (!job->gather_copy_mapped)
@@ -512,7 +513,7 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
 		goto out;
 
 	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL)) {
-		err = copy_gathers(job, dev);
+		err = copy_gathers(host->dev, job, dev);
 		if (err)
 			goto out;
 	}
@@ -573,7 +574,7 @@ void host1x_job_unpin(struct host1x_job *job)
 	job->num_unpins = 0;
 
 	if (job->gather_copy_size)
-		dma_free_wc(job->channel->dev, job->gather_copy_size,
+		dma_free_wc(host->dev, job->gather_copy_size,
 			    job->gather_copy_mapped, job->gather_copy);
 }
 EXPORT_SYMBOL(host1x_job_unpin);
-- 
2.20.1


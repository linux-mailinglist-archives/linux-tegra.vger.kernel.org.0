Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAE2EE717A
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Oct 2019 13:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389099AbfJ1Mhh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Oct 2019 08:37:37 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33895 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbfJ1Mhh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Oct 2019 08:37:37 -0400
Received: by mail-wr1-f65.google.com with SMTP id t16so9728987wrr.1
        for <linux-tegra@vger.kernel.org>; Mon, 28 Oct 2019 05:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YGu5TjyuaHf7D/YFViamxWFcAcwWPrmI9iCh49BU0qM=;
        b=J6T8Et3Q9OPbN2qUhiKDlDj4XkuDt/ejRzmA4Y+vOMYWTSHcAmlFNIDC9V9jAW4w+p
         48GR6SvU7LTdX9aAiXbed/AX8rODJnC6qHCRM9qwMuVKohbGVxqnbmoCdKbSBjrbJhAj
         6RqYc7u4Q4YrZGyrNliJFpbCmlI0Gm+W+126GLBIqEkC4yoTQir++QrqrSzgONFmd+cY
         TA7yFW0twfdoblb5IrT4oQO/jrCTT/Ds+fwh3Tp4Cx7CWl2bOWsurn2p/uaox4dNVBCY
         Er3trvhH2kF0ENxCN9pN7J1Ts/AFK4smzAbkpnZR0ptF+Ujj0sC66JBQgmvUNBL3xRb6
         LSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YGu5TjyuaHf7D/YFViamxWFcAcwWPrmI9iCh49BU0qM=;
        b=QmiOyK2PW7rfu4eRNc10l2S0AhonIFzJrJO7c+RkTI2oNnw3+Riuo1oGp3GGJuu46+
         SxOp7B6B5K+B5EspdBRPvjv+81COTpdDXcBlNzBlTSRIodjRc0B9YO1zqKpQgSMz+IXl
         lBgla32j1JziEQGW7bM0bjYc6ZU9VCLMZmvr6ErwavU7Z8QhUg85XGrhEbDZ68lDlajU
         Uqt1pebRrG4CmdgFaDlLKofglBRqrfx4iUe9kPXJAaYRNZoG/Psr6QTkYHktWFsMdOQ3
         niWNEkI53QtCtvU+se6pMK5Pdaee3rl/W3LUOdsXXO5CLKvlBpJEWKehxZtdT/UqOhWt
         R6og==
X-Gm-Message-State: APjAAAXhlePyHsFNEazZby/CAb8U41e53Wixu8VlWjT6OOceFf1cQt3K
        VOd4XlGYrnitulkLxIbVvX4=
X-Google-Smtp-Source: APXvYqz7QNZG6RSaXHUuYYcJVyTDml0KvIAScsBZprWSCdNBiGZVAoDWl7Flo6yTPY3bLHEYb3ebhw==
X-Received: by 2002:a5d:4283:: with SMTP id k3mr14839241wrq.236.1572266253975;
        Mon, 28 Oct 2019 05:37:33 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id d16sm1542915wmb.27.2019.10.28.05.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 05:37:32 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sachin Nikam <snikam@nvidia.com>,
        Puneet Saxena <puneets@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 06/12] gpu: host1x: Allocate gather copy for host1x
Date:   Mon, 28 Oct 2019 13:37:12 +0100
Message-Id: <20191028123718.3890217-7-thierry.reding@gmail.com>
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

Currently when the gather buffers are copied, they are copied to a
buffer that is allocated for the host1x client that wants to execute the
command streams in the buffers. However, the gather buffers will be read
by the host1x device, which causes SMMU faults if the DMA API is backed
by an IOMMU.

Fix this by allocating the gather buffer copy for the host1x device,
which makes sure that it will be mapped into the host1x's IOVA space if
the DMA API is backed by an IOMMU.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/job.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 90dd592fdfca..2e0c3e0ca1fa 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -445,7 +445,8 @@ static int validate(struct host1x_firewall *fw, struct host1x_job_gather *g)
 	return err;
 }
 
-static inline int copy_gathers(struct host1x_job *job, struct device *dev)
+static inline int copy_gathers(struct device *host, struct host1x_job *job,
+			       struct device *dev)
 {
 	struct host1x_firewall fw;
 	size_t size = 0;
@@ -468,12 +469,12 @@ static inline int copy_gathers(struct host1x_job *job, struct device *dev)
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
@@ -521,7 +522,7 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
 		goto out;
 
 	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL)) {
-		err = copy_gathers(job, dev);
+		err = copy_gathers(host->dev, job, dev);
 		if (err)
 			goto out;
 	}
@@ -582,7 +583,7 @@ void host1x_job_unpin(struct host1x_job *job)
 	job->num_unpins = 0;
 
 	if (job->gather_copy_size)
-		dma_free_wc(job->channel->dev, job->gather_copy_size,
+		dma_free_wc(host->dev, job->gather_copy_size,
 			    job->gather_copy_mapped, job->gather_copy);
 }
 EXPORT_SYMBOL(host1x_job_unpin);
-- 
2.23.0


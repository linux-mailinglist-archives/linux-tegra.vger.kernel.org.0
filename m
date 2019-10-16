Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F778D9034
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Oct 2019 13:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387868AbfJPL72 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 16 Oct 2019 07:59:28 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38755 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387750AbfJPL72 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Oct 2019 07:59:28 -0400
Received: by mail-wm1-f65.google.com with SMTP id 3so2456305wmi.3
        for <linux-tegra@vger.kernel.org>; Wed, 16 Oct 2019 04:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p+D4uhaelqukiSJFoBgIs3xWgRBrX60LgMxJcjnSOSs=;
        b=IduVgptCmf9YNqd92wwi+BS/zpgwmOt6fcGIZEREbguHJtPnhJ/KnNdHjfeGD59X9D
         OOzS1SxkJ1msvOeOpNPnsWRPUC4UdjAlLjD2bGDWOQ7bUVqLQ33Fz+oeZASpxbdHl0AT
         h/esgCVOmkMXKfgZd7qsmvOweR7PytYO9QRlbP/1xIaacXUS9FK4/0vQ3UloOm04vfEY
         aj3fOcXbWaJCgkKlDJNFl5EBnSh+ZdCbZxjr8TvenA8liebjGFxGTKdX94prPwo16ekW
         C70AC4ut/fWewmOD1NAZnr4Wudnj+m585Wkdm7eX4DgQsENfec/SaZ5ZE+WaUByLOq3z
         1PDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p+D4uhaelqukiSJFoBgIs3xWgRBrX60LgMxJcjnSOSs=;
        b=GGnTkUHGcCXnk8FAi5YsqJkEVdUpyheFWzfX34hopxJSz1P3ui5EbrpoDdq+NxazWW
         fj7xPfcyIxs+iwSKfmvBgK+PdcmGRl/kcWnKAnZ9XYaVRWvdBOkKzynU5on5Gp5R4EC3
         uQGkA4+zRzR1LQ+h8WhKTHRERZP3MCsUvrX4X1wdri9wQCXv5bYE+KPMDtShJB+BKgJJ
         geB8xeCfofK0lbOnTYhoHNR/jqulKxtDvsohxsY2dUsZcaCh/+b53mlnTWpJN23/OK8v
         YPQqXEu4KHR1n/nnCR03tBVG7xGvuoDDJFfq1V5TA4EqdpJGNAHLYmrVzCs5Kv1PO7kI
         dY3Q==
X-Gm-Message-State: APjAAAV/C3jseWMjtlRf7Kmh4bpts2MW09lJgaLaEKq5y871OO7TTN+S
        UrYOU0094y8RkPXPqMl4EWpONT4e
X-Google-Smtp-Source: APXvYqzRUGxDcp7LWWmdWGph1uiXiblMz981jNsxK16gU4VflPBXtPUaX7qhH81GVn+j+daDV2zUjw==
X-Received: by 2002:a7b:c775:: with SMTP id x21mr3253109wmk.52.1571227165283;
        Wed, 16 Oct 2019 04:59:25 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id f143sm3892448wme.40.2019.10.16.04.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 04:59:24 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 4/8] gpu: host1x: Set DMA mask based on IOMMU setup
Date:   Wed, 16 Oct 2019 13:59:12 +0200
Message-Id: <20191016115916.1769133-4-thierry.reding@gmail.com>
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

If the Tegra DRM clients are backed by an IOMMU, push buffers are likely
to be allocated beyond the 32-bit boundary if sufficient system memory
is available. This is problematic on earlier generations of Tegra where
host1x supports a maximum of 32 address bits for the GATHER opcode. More
recent versions of Tegra (Tegra186 and later) have a wide variant of the
GATHER opcode, which allows addressing up to 64 bits of memory.

If host1x itself is behind an IOMMU as well this doesn't matter because
the IOMMU's input address space is restricted to 32 bits on generations
without support for wide GATHER opcodes.

However, if host1x is not behind an IOMMU, it won't be able to process
push buffers beyond the 32-bit boundary on Tegra generations that don't
support wide GATHER opcodes. Restrict the DMA mask to 32 bits on these
generations prevents buffers from being allocated from beyond the 32-bit
boundary.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 214 ++++++++++++++++++++++++---------------
 drivers/gpu/host1x/dev.h |   1 +
 2 files changed, 136 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 18b6fc5e5b2e..a86478508c91 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -73,6 +73,7 @@ static const struct host1x_info host1x01_info = {
 	.init = host1x01_init,
 	.sync_offset = 0x3000,
 	.dma_mask = DMA_BIT_MASK(32),
+	.has_wide_gather = false,
 	.has_hypervisor = false,
 	.num_sid_entries = 0,
 	.sid_table = NULL,
@@ -86,6 +87,7 @@ static const struct host1x_info host1x02_info = {
 	.init = host1x02_init,
 	.sync_offset = 0x3000,
 	.dma_mask = DMA_BIT_MASK(32),
+	.has_wide_gather = false,
 	.has_hypervisor = false,
 	.num_sid_entries = 0,
 	.sid_table = NULL,
@@ -99,6 +101,7 @@ static const struct host1x_info host1x04_info = {
 	.init = host1x04_init,
 	.sync_offset = 0x2100,
 	.dma_mask = DMA_BIT_MASK(34),
+	.has_wide_gather = false,
 	.has_hypervisor = false,
 	.num_sid_entries = 0,
 	.sid_table = NULL,
@@ -112,6 +115,7 @@ static const struct host1x_info host1x05_info = {
 	.init = host1x05_init,
 	.sync_offset = 0x2100,
 	.dma_mask = DMA_BIT_MASK(34),
+	.has_wide_gather = false,
 	.has_hypervisor = false,
 	.num_sid_entries = 0,
 	.sid_table = NULL,
@@ -134,6 +138,7 @@ static const struct host1x_info host1x06_info = {
 	.init = host1x06_init,
 	.sync_offset = 0x0,
 	.dma_mask = DMA_BIT_MASK(40),
+	.has_wide_gather = true,
 	.has_hypervisor = true,
 	.num_sid_entries = ARRAY_SIZE(tegra186_sid_table),
 	.sid_table = tegra186_sid_table,
@@ -156,6 +161,7 @@ static const struct host1x_info host1x07_info = {
 	.init = host1x07_init,
 	.sync_offset = 0x0,
 	.dma_mask = DMA_BIT_MASK(40),
+	.has_wide_gather = true,
 	.has_hypervisor = true,
 	.num_sid_entries = ARRAY_SIZE(tegra194_sid_table),
 	.sid_table = tegra194_sid_table,
@@ -186,6 +192,117 @@ static void host1x_setup_sid_table(struct host1x *host)
 	}
 }
 
+static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
+{
+	struct iommu_domain *domain = iommu_get_domain_for_dev(host->dev);
+	int err;
+
+	/*
+	 * If the host1x firewall is enabled, there's no need to enable IOMMU
+	 * support. Similarly, if host1x is already attached to an IOMMU (via
+	 * the DMA API), don't try to attach again.
+	 */
+	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) || domain)
+		return domain;
+
+	host->group = iommu_group_get(host->dev);
+	if (host->group) {
+		struct iommu_domain_geometry *geometry;
+		dma_addr_t start, end;
+		unsigned long order;
+
+		err = iova_cache_get();
+		if (err < 0)
+			goto put_group;
+
+		host->domain = iommu_domain_alloc(&platform_bus_type);
+		if (!host->domain) {
+			err = -ENOMEM;
+			goto put_cache;
+		}
+
+		err = iommu_attach_group(host->domain, host->group);
+		if (err) {
+			if (err == -ENODEV)
+				err = 0;
+
+			goto free_domain;
+		}
+
+		geometry = &host->domain->geometry;
+		start = geometry->aperture_start & host->info->dma_mask;
+		end = geometry->aperture_end & host->info->dma_mask;
+
+		order = __ffs(host->domain->pgsize_bitmap);
+		init_iova_domain(&host->iova, 1UL << order, start >> order);
+		host->iova_end = end;
+
+		domain = host->domain;
+	}
+
+	return domain;
+
+free_domain:
+	iommu_domain_free(host->domain);
+	host->domain = NULL;
+put_cache:
+	iova_cache_put();
+put_group:
+	iommu_group_put(host->group);
+	host->group = NULL;
+
+	return ERR_PTR(err);
+}
+
+static int host1x_iommu_init(struct host1x *host)
+{
+	u64 mask = host->info->dma_mask;
+	struct iommu_domain *domain;
+	int err;
+
+	domain = host1x_iommu_attach(host);
+	if (IS_ERR(domain)) {
+		err = PTR_ERR(domain);
+		dev_err(host->dev, "failed to attach to IOMMU: %d\n", err);
+		return err;
+	}
+
+	/*
+	 * If we're not behind an IOMMU make sure we don't get push buffers
+	 * that are allocated outside of the range addressable by the GATHER
+	 * opcode.
+	 *
+	 * Newer generations of Tegra (Tegra186 and later) support a wide
+	 * variant of the GATHER opcode that allows addressing more bits.
+	 */
+	if (!domain && !host->info->has_wide_gather)
+		mask = DMA_BIT_MASK(32);
+
+	err = dma_coerce_mask_and_coherent(host->dev, mask);
+	if (err < 0) {
+		dev_err(host->dev, "failed to set DMA mask: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static void host1x_iommu_exit(struct host1x *host)
+{
+	if (host->domain) {
+		put_iova_domain(&host->iova);
+		iommu_detach_group(host->domain, host->group);
+
+		iommu_domain_free(host->domain);
+		host->domain = NULL;
+
+		iova_cache_put();
+
+		iommu_group_put(host->group);
+		host->group = NULL;
+	}
+}
+
 static int host1x_probe(struct platform_device *pdev)
 {
 	struct host1x *host;
@@ -245,8 +362,6 @@ static int host1x_probe(struct platform_device *pdev)
 			return PTR_ERR(host->hv_regs);
 	}
 
-	dma_set_mask_and_coherent(host->dev, host->info->dma_mask);
-
 	if (host->info->init) {
 		err = host->info->init(host);
 		if (err)
@@ -270,82 +385,41 @@ static int host1x_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
-		goto skip_iommu;
-
-	if (iommu_get_domain_for_dev(&pdev->dev))
-		goto skip_iommu;
-
-	host->group = iommu_group_get(&pdev->dev);
-	if (host->group) {
-		struct iommu_domain_geometry *geometry;
-		u64 mask = dma_get_mask(host->dev);
-		dma_addr_t start, end;
-		unsigned long order;
-
-		err = iova_cache_get();
-		if (err < 0)
-			goto put_group;
-
-		host->domain = iommu_domain_alloc(&platform_bus_type);
-		if (!host->domain) {
-			err = -ENOMEM;
-			goto put_cache;
-		}
-
-		err = iommu_attach_group(host->domain, host->group);
-		if (err) {
-			if (err == -ENODEV) {
-				iommu_domain_free(host->domain);
-				host->domain = NULL;
-				iova_cache_put();
-				iommu_group_put(host->group);
-				host->group = NULL;
-				goto skip_iommu;
-			}
-
-			goto fail_free_domain;
-		}
-
-		geometry = &host->domain->geometry;
-		start = geometry->aperture_start & mask;
-		end = geometry->aperture_end & mask;
-
-		order = __ffs(host->domain->pgsize_bitmap);
-		init_iova_domain(&host->iova, 1UL << order, start >> order);
-		host->iova_end = end;
+	err = host1x_iommu_init(host);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to setup IOMMU: %d\n", err);
+		return err;
 	}
 
-skip_iommu:
 	err = host1x_channel_list_init(&host->channel_list,
 				       host->info->nb_channels);
 	if (err) {
 		dev_err(&pdev->dev, "failed to initialize channel list\n");
-		goto fail_detach_device;
+		goto iommu_exit;
 	}
 
 	err = clk_prepare_enable(host->clk);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to enable clock\n");
-		goto fail_free_channels;
+		goto free_channels;
 	}
 
 	err = reset_control_deassert(host->rst);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to deassert reset: %d\n", err);
-		goto fail_unprepare_disable;
+		goto unprepare_disable;
 	}
 
 	err = host1x_syncpt_init(host);
 	if (err) {
 		dev_err(&pdev->dev, "failed to initialize syncpts\n");
-		goto fail_reset_assert;
+		goto reset_assert;
 	}
 
 	err = host1x_intr_init(host, syncpt_irq);
 	if (err) {
 		dev_err(&pdev->dev, "failed to initialize interrupts\n");
-		goto fail_deinit_syncpt;
+		goto deinit_syncpt;
 	}
 
 	host1x_debug_init(host);
@@ -355,33 +429,22 @@ static int host1x_probe(struct platform_device *pdev)
 
 	err = host1x_register(host);
 	if (err < 0)
-		goto fail_deinit_intr;
+		goto deinit_intr;
 
 	return 0;
 
-fail_deinit_intr:
+deinit_intr:
 	host1x_intr_deinit(host);
-fail_deinit_syncpt:
+deinit_syncpt:
 	host1x_syncpt_deinit(host);
-fail_reset_assert:
+reset_assert:
 	reset_control_assert(host->rst);
-fail_unprepare_disable:
+unprepare_disable:
 	clk_disable_unprepare(host->clk);
-fail_free_channels:
+free_channels:
 	host1x_channel_list_free(&host->channel_list);
-fail_detach_device:
-	if (host->group && host->domain) {
-		put_iova_domain(&host->iova);
-		iommu_detach_group(host->domain, host->group);
-	}
-fail_free_domain:
-	if (host->domain)
-		iommu_domain_free(host->domain);
-put_cache:
-	if (host->group)
-		iova_cache_put();
-put_group:
-	iommu_group_put(host->group);
+iommu_exit:
+	host1x_iommu_exit(host);
 
 	return err;
 }
@@ -395,14 +458,7 @@ static int host1x_remove(struct platform_device *pdev)
 	host1x_syncpt_deinit(host);
 	reset_control_assert(host->rst);
 	clk_disable_unprepare(host->clk);
-
-	if (host->domain) {
-		put_iova_domain(&host->iova);
-		iommu_detach_group(host->domain, host->group);
-		iommu_domain_free(host->domain);
-		iova_cache_put();
-		iommu_group_put(host->group);
-	}
+	host1x_iommu_exit(host);
 
 	return 0;
 }
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index ff56f5e23a02..e2f1e0583b1b 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -97,6 +97,7 @@ struct host1x_info {
 	int (*init)(struct host1x *host1x); /* initialize per SoC ops */
 	unsigned int sync_offset; /* offset of syncpoint registers */
 	u64 dma_mask; /* mask of addressable memory */
+	bool has_wide_gather; /* supports GATHER_W opcode */
 	bool has_hypervisor; /* has hypervisor registers */
 	unsigned int num_sid_entries;
 	const struct host1x_sid_entry *sid_table;
-- 
2.23.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17459E717E
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Oct 2019 13:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389117AbfJ1Mhl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Oct 2019 08:37:41 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38323 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbfJ1Mhl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Oct 2019 08:37:41 -0400
Received: by mail-wm1-f68.google.com with SMTP id 22so8830667wms.3
        for <linux-tegra@vger.kernel.org>; Mon, 28 Oct 2019 05:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EsR2YxcBEI4MUl9EOXPu7+LeSq1Sp1B6X0bex2JGADQ=;
        b=U2SFeajSee2t0anmDd9kePHQiXKFxiXH4rhfm52UIKJi7EHFNGwMgqtgUVZqvE+l0V
         nOv95WPSjNiWmEkOINyCESL90QqzCccB80NTRRcXme3r7jv5Ww7TuZSKLPTV+re4QThU
         jE5V8qSIHQAdfd8bQFl9ql35pG5jMbZ2JPP3WMud3/75+yG7kvTkIIAXimyj/lgIOYo8
         yPFkIuZOGaX9UjGIIwMprsCf1gcpKexM7W8zEWqeu+PiTVqktx5BIaUOdKfO+pqD4wzX
         P6pY7p3SRo7yu4dywv6QezRXb0SgZj6vmpAmu8R13iQN2yV85WVMULOmJEqv4VtNfKEu
         gsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EsR2YxcBEI4MUl9EOXPu7+LeSq1Sp1B6X0bex2JGADQ=;
        b=qYJofkuqu4khS1bEbVeUEogS3jrJkrFIwmAzDs2Y0WiimYbg6J8TiTT64AtOcsCXkb
         JCc/pt0dKVkqaDwCx41pNiIv8+SLDopOi60Gpu/pS/NXvWqV0sqIcheECZEMtZIy+Nih
         l5wMYNOB6PG183aU1bm8/sVP1PcDXIT5bCIxFfnbbojaTc4Rb+3JTdtUnRBMJf60BFK7
         buUfsnY9+SHIXuYM66k9j8Tzw1g+XeWVThqvNBitSIWbuU5xTRmJuCPMDsKqvFGrYt9j
         QZslzMs8ZdKlcNTafZ0/9gmNjLO6Vf+6aclXNL3SPSIlnD92r7ZVnnOIvMiGSu3SXs+B
         L9YQ==
X-Gm-Message-State: APjAAAVvbqddmT85R0Sf8m0s/jJHqcyljCXj+n8HuImQzREu5nCu98R0
        ARGmykdfeF/i7/tdBM3cBcM=
X-Google-Smtp-Source: APXvYqzqKHG8EVopWt0rHUcXOAgn3Kztqk4T4Uj2Cl40VBfZKgpI7bwI3YESUAYitSoSEzrceUoHHA==
X-Received: by 2002:a05:600c:c7:: with SMTP id u7mr16101501wmm.141.1572266258257;
        Mon, 28 Oct 2019 05:37:38 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id x8sm11768339wrr.43.2019.10.28.05.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 05:37:37 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sachin Nikam <snikam@nvidia.com>,
        Puneet Saxena <puneets@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 08/12] gpu: host1x: Set DMA mask based on IOMMU setup
Date:   Mon, 28 Oct 2019 13:37:14 +0100
Message-Id: <20191028123718.3890217-9-thierry.reding@gmail.com>
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
index 5bdc484398f4..a738ea55e407 100644
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
@@ -248,8 +365,6 @@ static int host1x_probe(struct platform_device *pdev)
 	host->dev->dma_parms = &host->dma_parms;
 	dma_set_max_seg_size(host->dev, UINT_MAX);
 
-	dma_set_mask_and_coherent(host->dev, host->info->dma_mask);
-
 	if (host->info->init) {
 		err = host->info->init(host);
 		if (err)
@@ -273,82 +388,41 @@ static int host1x_probe(struct platform_device *pdev)
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
@@ -358,33 +432,22 @@ static int host1x_probe(struct platform_device *pdev)
 
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
@@ -399,14 +462,7 @@ static int host1x_remove(struct platform_device *pdev)
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
index abafde7c665e..f781a9b0f39d 100644
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


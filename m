Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE2ABD9037
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Oct 2019 13:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387965AbfJPL7d (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 16 Oct 2019 07:59:33 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38867 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387542AbfJPL7d (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Oct 2019 07:59:33 -0400
Received: by mail-wr1-f65.google.com with SMTP id y18so18275457wrn.5
        for <linux-tegra@vger.kernel.org>; Wed, 16 Oct 2019 04:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MT0Uue6i2yCOO0/jOCI9ZxD9haP5kL6ODgF+NAu+rj0=;
        b=O5QWyH1LPV6D4KyIJfAqe7MqO06GsgFckWKFPg6IWbjjdwWIm6zQFftCQ0HBxjopn5
         6JFdLlLWNfNs4q+tEjT60ThYSSJXpIW6ASQfL9BDNbwihFl3yWfxDfzyhBWWIke5yS7j
         EydnalYpvrwUmi61XzPnsQzMdWcq0A5nvrA4GQ5UnemGuH/AztBp+UZKYiOuYWz/xzAI
         Wv9ItxJNI85nsJf+oLc1YnCBWLh26vNPShG4EeihoQgTA0qK+xmafePBHuQnmQvRLLC7
         I7LgMKGLHgJWcSn4Nv93SIi2IEI6BlRKRyyH/awiJ4Pf60+y9wj0cuURTO7iJUhnlmTi
         5TWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MT0Uue6i2yCOO0/jOCI9ZxD9haP5kL6ODgF+NAu+rj0=;
        b=nGd1EgSfP7k3/4DwhTLVdrte23GEpmqwyfL0Weh/wKTdDOJxIqh/8LCaVCnsBv7ktH
         HILwboGBI8Cs0OUK4yGS0BY5GL1haoCiwfwgZatfVAkMRj99Faf67H1uaDpIK5jQHMwV
         atp0FksP0ztn6R/+Az85+jDcvxa4OTmL4mSm7TGA9xJV79mEj1qcodKG9KADDyCxbDsj
         2SwXA6sGA45J44hU0az0vxzEg7vtsCeYBojIZtl17GdTA8L6aoJIU2prr1RDRxEE0kA0
         6ia9P6s9ldV9DNTNELJ2PcuQDDaX69pawpjhV1sxh32NQD6R8Qvc5NHXyMtMW4u5qSwr
         WJ7Q==
X-Gm-Message-State: APjAAAV2VYbIz4gNvfPVQxNegsTS9XFo15OGAYaWv5ScCqghrnCq79Zz
        Z53iFSPOJcc39Fn5HT222A4=
X-Google-Smtp-Source: APXvYqzGVwy8vPSlpXdlLHB9kDFG8p+JCtFmhg3GBVEbv00ngApoMVLRvBKINxTNf7R8O3LFf/irgA==
X-Received: by 2002:a5d:624f:: with SMTP id m15mr2204400wrv.59.1571227169680;
        Wed, 16 Oct 2019 04:59:29 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id 63sm3928563wrq.90.2019.10.16.04.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 04:59:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 6/8] drm/tegra: falcon: Clarify address usage
Date:   Wed, 16 Oct 2019 13:59:14 +0200
Message-Id: <20191016115916.1769133-6-thierry.reding@gmail.com>
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

Rename paddr -> iova and vaddr -> virt to make it clearer how these
addresses are used. This is important for a subsequent patch that makes
a distinction between the physical address (physical address of the
system memory from the CPU's point of view) and the IOVA (physical
address of the system memory from the device's point of view).

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/falcon.c | 14 ++++-----
 drivers/gpu/drm/tegra/falcon.h |  5 +--
 drivers/gpu/drm/tegra/vic.c    | 56 +++++++++++++++-------------------
 3 files changed, 34 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/tegra/falcon.c b/drivers/gpu/drm/tegra/falcon.c
index a5b25e4ecbd2..56edef06c48e 100644
--- a/drivers/gpu/drm/tegra/falcon.c
+++ b/drivers/gpu/drm/tegra/falcon.c
@@ -58,17 +58,17 @@ static int falcon_copy_chunk(struct falcon *falcon,
 static void falcon_copy_firmware_image(struct falcon *falcon,
 				       const struct firmware *firmware)
 {
-	u32 *firmware_vaddr = falcon->firmware.vaddr;
+	u32 *virt = falcon->firmware.virt;
 	size_t i;
 
 	/* copy the whole thing taking into account endianness */
 	for (i = 0; i < firmware->size / sizeof(u32); i++)
-		firmware_vaddr[i] = le32_to_cpu(((u32 *)firmware->data)[i]);
+		virt[i] = le32_to_cpu(((u32 *)firmware->data)[i]);
 }
 
 static int falcon_parse_firmware_image(struct falcon *falcon)
 {
-	struct falcon_fw_bin_header_v1 *bin = (void *)falcon->firmware.vaddr;
+	struct falcon_fw_bin_header_v1 *bin = (void *)falcon->firmware.virt;
 	struct falcon_fw_os_header_v1 *os;
 
 	/* endian problems would show up right here */
@@ -89,7 +89,7 @@ static int falcon_parse_firmware_image(struct falcon *falcon)
 		return -EINVAL;
 	}
 
-	os = falcon->firmware.vaddr + bin->os_header_offset;
+	os = falcon->firmware.virt + bin->os_header_offset;
 
 	falcon->firmware.bin_data.size = bin->os_size;
 	falcon->firmware.bin_data.offset = bin->os_data_offset;
@@ -138,7 +138,7 @@ int falcon_load_firmware(struct falcon *falcon)
 
 int falcon_init(struct falcon *falcon)
 {
-	falcon->firmware.vaddr = NULL;
+	falcon->firmware.virt = NULL;
 
 	return 0;
 }
@@ -155,7 +155,7 @@ int falcon_boot(struct falcon *falcon)
 	u32 value;
 	int err;
 
-	if (!falcon->firmware.vaddr)
+	if (!falcon->firmware.virt)
 		return -EINVAL;
 
 	err = readl_poll_timeout(falcon->regs + FALCON_DMACTL, value,
@@ -168,7 +168,7 @@ int falcon_boot(struct falcon *falcon)
 	falcon_writel(falcon, 0, FALCON_DMACTL);
 
 	/* setup the address of the binary data so Falcon can access it later */
-	falcon_writel(falcon, (falcon->firmware.paddr +
+	falcon_writel(falcon, (falcon->firmware.iova +
 			       falcon->firmware.bin_data.offset) >> 8,
 		      FALCON_DMATRFBASE);
 
diff --git a/drivers/gpu/drm/tegra/falcon.h b/drivers/gpu/drm/tegra/falcon.h
index 92491a1e90df..c56ee32d92ee 100644
--- a/drivers/gpu/drm/tegra/falcon.h
+++ b/drivers/gpu/drm/tegra/falcon.h
@@ -84,8 +84,9 @@ struct falcon_firmware {
 	const struct firmware *firmware;
 
 	/* Raw firmware data */
-	dma_addr_t paddr;
-	void *vaddr;
+	dma_addr_t iova;
+	dma_addr_t phys;
+	void *virt;
 	size_t size;
 
 	/* Parsed firmware information */
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index c61d8ffcb4b8..3715855010b3 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -133,9 +133,9 @@ static int vic_boot(struct vic *vic)
 	if (err < 0)
 		return err;
 
-	hdr = vic->falcon.firmware.vaddr;
+	hdr = vic->falcon.firmware.virt;
 	fce_bin_data_offset = *(u32 *)(hdr + VIC_UCODE_FCE_DATA_OFFSET);
-	hdr = vic->falcon.firmware.vaddr +
+	hdr = vic->falcon.firmware.virt +
 		*(u32 *)(hdr + VIC_UCODE_FCE_HEADER_OFFSET);
 	fce_ucode_size = *(u32 *)(hdr + FCE_UCODE_SIZE_OFFSET);
 
@@ -143,7 +143,7 @@ static int vic_boot(struct vic *vic)
 	falcon_execute_method(&vic->falcon, VIC_SET_FCE_UCODE_SIZE,
 			      fce_ucode_size);
 	falcon_execute_method(&vic->falcon, VIC_SET_FCE_UCODE_OFFSET,
-			      (vic->falcon.firmware.paddr + fce_bin_data_offset)
+			      (vic->falcon.firmware.iova + fce_bin_data_offset)
 				>> 8);
 
 	err = falcon_wait_idle(&vic->falcon);
@@ -225,14 +225,17 @@ static int vic_exit(struct host1x_client *client)
 	host1x_channel_put(vic->channel);
 	host1x_client_iommu_detach(client);
 
-	if (client->group)
+	if (client->group) {
+		dma_unmap_single(vic->dev, vic->falcon.firmware.phys,
+				 vic->falcon.firmware.size, DMA_TO_DEVICE);
 		tegra_drm_free(tegra, vic->falcon.firmware.size,
-			       vic->falcon.firmware.vaddr,
-			       vic->falcon.firmware.paddr);
-	else
+			       vic->falcon.firmware.virt,
+			       vic->falcon.firmware.iova);
+	} else {
 		dma_free_coherent(vic->dev, vic->falcon.firmware.size,
-				  vic->falcon.firmware.vaddr,
-				  vic->falcon.firmware.paddr);
+				  vic->falcon.firmware.virt,
+				  vic->falcon.firmware.iova);
+	}
 
 	return 0;
 }
@@ -246,12 +249,12 @@ static int vic_load_firmware(struct vic *vic)
 {
 	struct host1x_client *client = &vic->client.base;
 	struct tegra_drm *tegra = vic->client.drm;
-	dma_addr_t phys;
+	dma_addr_t iova;
 	size_t size;
 	void *virt;
 	int err;
 
-	if (vic->falcon.firmware.vaddr)
+	if (vic->falcon.firmware.virt)
 		return 0;
 
 	err = falcon_read_firmware(&vic->falcon, vic->config->firmware);
@@ -261,17 +264,17 @@ static int vic_load_firmware(struct vic *vic)
 	size = vic->falcon.firmware.size;
 
 	if (!client->group) {
-		virt = dma_alloc_coherent(vic->dev, size, &phys, GFP_KERNEL);
+		virt = dma_alloc_coherent(vic->dev, size, &iova, GFP_KERNEL);
 
-		err = dma_mapping_error(vic->dev, phys);
+		err = dma_mapping_error(vic->dev, iova);
 		if (err < 0)
 			return err;
 	} else {
-		virt = tegra_drm_alloc(tegra, size, &phys);
+		virt = tegra_drm_alloc(tegra, size, &iova);
 	}
 
-	vic->falcon.firmware.vaddr = virt;
-	vic->falcon.firmware.paddr = phys;
+	vic->falcon.firmware.virt = virt;
+	vic->falcon.firmware.iova = iova;
 
 	err = falcon_load_firmware(&vic->falcon);
 	if (err < 0)
@@ -283,35 +286,24 @@ static int vic_load_firmware(struct vic *vic)
 	 * knows what memory pages to flush the cache for.
 	 */
 	if (client->group) {
+		dma_addr_t phys;
+
 		phys = dma_map_single(vic->dev, virt, size, DMA_TO_DEVICE);
 
 		err = dma_mapping_error(vic->dev, phys);
 		if (err < 0)
 			goto cleanup;
 
-		/*
-		 * If the DMA API mapped this through a bounce buffer, the
-		 * dma_sync_single_for_device() call below will not be able
-		 * to flush the caches for the right memory pages. Output a
-		 * big warning in that case so that the DMA mask can be set
-		 * properly and the bounce buffer avoided.
-		 */
-		WARN(phys != vic->falcon.firmware.paddr,
-		     "check DMA mask setting for %s\n", dev_name(vic->dev));
+		vic->falcon.firmware.phys = phys;
 	}
 
-	dma_sync_single_for_device(vic->dev, phys, size, DMA_TO_DEVICE);
-
-	if (client->group)
-		dma_unmap_single(vic->dev, phys, size, DMA_TO_DEVICE);
-
 	return 0;
 
 cleanup:
 	if (!client->group)
-		dma_free_coherent(vic->dev, size, virt, phys);
+		dma_free_coherent(vic->dev, size, virt, iova);
 	else
-		tegra_drm_free(tegra, size, virt, phys);
+		tegra_drm_free(tegra, size, virt, iova);
 
 	return err;
 }
-- 
2.23.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F283EE717F
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Oct 2019 13:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389118AbfJ1Mhn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Oct 2019 08:37:43 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36433 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389093AbfJ1Mhn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Oct 2019 08:37:43 -0400
Received: by mail-wm1-f66.google.com with SMTP id c22so8966355wmd.1
        for <linux-tegra@vger.kernel.org>; Mon, 28 Oct 2019 05:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jILA6qDn53+J3zi0Jq6tX7gPyhs2Q6cSmssSkEQ8Rg8=;
        b=pTqgjxlPaLbkkIIY3USRXVKFeIKU0kFj4yLhGgFMcWSS2+R7Tjloj6LZvFhkoJmLsI
         P4WPklGcifu01lZp61tbFsIU+MorRmgYS8o0sLZxfmZKbdll6AT78Vvv+6nCe51ra1d7
         OURxlshjvBoZXvZXqhb5kEmY7oIpJLdi4WC2tIExGEMIphjh1oFAKrBZMYsHAy2pceBh
         e990lodsL7SRb9COgkeqiUNnZf0W/1ADAeL0STxM6qm5oPhA8pEHSqkz/9oGQu5FTXdr
         RlJSTtWzpj/vEeNG/o2ILGjYlp2ACVY9hep24T686Qp2CAvcngLxyp7gV27j4dOHhBi2
         /ghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jILA6qDn53+J3zi0Jq6tX7gPyhs2Q6cSmssSkEQ8Rg8=;
        b=DAtoDDQgI6Y1DS3/KJmpSXzdRvp/tvEv6wA/zIiWe18ltB7ahm6mEK77v4NmgfcOqp
         xev63L1TFozbxOYpzPFf8Yr3jRx8DGCFJeMHr4+n2PHIONy90AH70FCVo+O1UFNJ53mf
         3zat7H2LIKmseWmi6CQqZE1opYMyT1R1q5rUowTsnWgkoJDb26ORVE//+i808c605mQa
         z+26Bo4RpiREyFYJ+lrbUmmmPAP6uFDWvJofNbzS+mCbup2VgyH3Y3vMt2oaOzMVv1b4
         LHk+j3YH7Ss3oNFL1xw7DF3K7IN/w9UgaXoZVVeK8Cga1Lk20/VMsbdl9oxYkGMtooHJ
         yiTg==
X-Gm-Message-State: APjAAAV9ulqX+txQGsEgeIygOcGkwhtmA+CqwBQc5wiKKyg96L+1yxWH
        p3qeWQVMlk1DU7uRtoNDp70=
X-Google-Smtp-Source: APXvYqz5nj0j+hMGb1J6QUL5CWdJWKsffHNU30eDaEQ9ZXUdZx0im/kV2RPALLu6vB96WycvSSuxlQ==
X-Received: by 2002:a05:600c:da:: with SMTP id u26mr16556164wmm.9.1572266260318;
        Mon, 28 Oct 2019 05:37:40 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id f18sm9962689wmh.43.2019.10.28.05.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 05:37:39 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sachin Nikam <snikam@nvidia.com>,
        Puneet Saxena <puneets@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 09/12] drm/tegra: Remove memory allocation from Falcon library
Date:   Mon, 28 Oct 2019 13:37:15 +0100
Message-Id: <20191028123718.3890217-10-thierry.reding@gmail.com>
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

Having to provide allocator hooks to the Falcon library is somewhat
cumbersome and it doesn't give the users of the library a lot of
flexibility to deal with allocations. Instead, remove the notion of
Falcon "operations" and let drivers deal with the memory allocations
themselves.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/falcon.c | 50 ++-----------------
 drivers/gpu/drm/tegra/falcon.h | 11 ----
 drivers/gpu/drm/tegra/vic.c    | 91 ++++++++++++++++++++++++----------
 3 files changed, 68 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/tegra/falcon.c b/drivers/gpu/drm/tegra/falcon.c
index f49ad36e24db..a5b25e4ecbd2 100644
--- a/drivers/gpu/drm/tegra/falcon.c
+++ b/drivers/gpu/drm/tegra/falcon.c
@@ -59,26 +59,11 @@ static void falcon_copy_firmware_image(struct falcon *falcon,
 				       const struct firmware *firmware)
 {
 	u32 *firmware_vaddr = falcon->firmware.vaddr;
-	dma_addr_t daddr;
 	size_t i;
-	int err;
 
 	/* copy the whole thing taking into account endianness */
 	for (i = 0; i < firmware->size / sizeof(u32); i++)
 		firmware_vaddr[i] = le32_to_cpu(((u32 *)firmware->data)[i]);
-
-	/* ensure that caches are flushed and falcon can see the firmware */
-	daddr = dma_map_single(falcon->dev, firmware_vaddr,
-			       falcon->firmware.size, DMA_TO_DEVICE);
-	err = dma_mapping_error(falcon->dev, daddr);
-	if (err) {
-		dev_err(falcon->dev, "failed to map firmware: %d\n", err);
-		return;
-	}
-	dma_sync_single_for_device(falcon->dev, daddr,
-				   falcon->firmware.size, DMA_TO_DEVICE);
-	dma_unmap_single(falcon->dev, daddr, falcon->firmware.size,
-			 DMA_TO_DEVICE);
 }
 
 static int falcon_parse_firmware_image(struct falcon *falcon)
@@ -125,6 +110,8 @@ int falcon_read_firmware(struct falcon *falcon, const char *name)
 	if (err < 0)
 		return err;
 
+	falcon->firmware.size = falcon->firmware.firmware->size;
+
 	return 0;
 }
 
@@ -133,16 +120,6 @@ int falcon_load_firmware(struct falcon *falcon)
 	const struct firmware *firmware = falcon->firmware.firmware;
 	int err;
 
-	falcon->firmware.size = firmware->size;
-
-	/* allocate iova space for the firmware */
-	falcon->firmware.vaddr = falcon->ops->alloc(falcon, firmware->size,
-						    &falcon->firmware.paddr);
-	if (IS_ERR(falcon->firmware.vaddr)) {
-		dev_err(falcon->dev, "DMA memory mapping failed\n");
-		return PTR_ERR(falcon->firmware.vaddr);
-	}
-
 	/* copy firmware image into local area. this also ensures endianness */
 	falcon_copy_firmware_image(falcon, firmware);
 
@@ -150,27 +127,17 @@ int falcon_load_firmware(struct falcon *falcon)
 	err = falcon_parse_firmware_image(falcon);
 	if (err < 0) {
 		dev_err(falcon->dev, "failed to parse firmware image\n");
-		goto err_setup_firmware_image;
+		return err;
 	}
 
 	release_firmware(firmware);
 	falcon->firmware.firmware = NULL;
 
 	return 0;
-
-err_setup_firmware_image:
-	falcon->ops->free(falcon, falcon->firmware.size,
-			  falcon->firmware.paddr, falcon->firmware.vaddr);
-
-	return err;
 }
 
 int falcon_init(struct falcon *falcon)
 {
-	/* check mandatory ops */
-	if (!falcon->ops || !falcon->ops->alloc || !falcon->ops->free)
-		return -EINVAL;
-
 	falcon->firmware.vaddr = NULL;
 
 	return 0;
@@ -178,17 +145,8 @@ int falcon_init(struct falcon *falcon)
 
 void falcon_exit(struct falcon *falcon)
 {
-	if (falcon->firmware.firmware) {
+	if (falcon->firmware.firmware)
 		release_firmware(falcon->firmware.firmware);
-		falcon->firmware.firmware = NULL;
-	}
-
-	if (falcon->firmware.vaddr) {
-		falcon->ops->free(falcon, falcon->firmware.size,
-				  falcon->firmware.paddr,
-				  falcon->firmware.vaddr);
-		falcon->firmware.vaddr = NULL;
-	}
 }
 
 int falcon_boot(struct falcon *falcon)
diff --git a/drivers/gpu/drm/tegra/falcon.h b/drivers/gpu/drm/tegra/falcon.h
index 3d1243217410..92491a1e90df 100644
--- a/drivers/gpu/drm/tegra/falcon.h
+++ b/drivers/gpu/drm/tegra/falcon.h
@@ -74,15 +74,6 @@ struct falcon_fw_os_header_v1 {
 	u32 data_size;
 };
 
-struct falcon;
-
-struct falcon_ops {
-	void *(*alloc)(struct falcon *falcon, size_t size,
-		       dma_addr_t *paddr);
-	void (*free)(struct falcon *falcon, size_t size,
-		     dma_addr_t paddr, void *vaddr);
-};
-
 struct falcon_firmware_section {
 	unsigned long offset;
 	size_t size;
@@ -107,8 +98,6 @@ struct falcon {
 	/* Set by falcon client */
 	struct device *dev;
 	void __iomem *regs;
-	const struct falcon_ops *ops;
-	void *data;
 
 	struct falcon_firmware firmware;
 };
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 603f41ed4b81..4345b8054617 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -158,27 +158,6 @@ static int vic_boot(struct vic *vic)
 	return 0;
 }
 
-static void *vic_falcon_alloc(struct falcon *falcon, size_t size,
-			      dma_addr_t *iova)
-{
-	struct tegra_drm *tegra = falcon->data;
-
-	return tegra_drm_alloc(tegra, size, iova);
-}
-
-static void vic_falcon_free(struct falcon *falcon, size_t size,
-			    dma_addr_t iova, void *va)
-{
-	struct tegra_drm *tegra = falcon->data;
-
-	return tegra_drm_free(tegra, size, va, iova);
-}
-
-static const struct falcon_ops vic_falcon_ops = {
-	.alloc = vic_falcon_alloc,
-	.free = vic_falcon_free
-};
-
 static int vic_init(struct host1x_client *client)
 {
 	struct tegra_drm_client *drm = host1x_to_drm_client(client);
@@ -246,6 +225,15 @@ static int vic_exit(struct host1x_client *client)
 	host1x_channel_put(vic->channel);
 	host1x_client_iommu_detach(client);
 
+	if (client->group)
+		tegra_drm_free(tegra, vic->falcon.firmware.size,
+			       vic->falcon.firmware.vaddr,
+			       vic->falcon.firmware.paddr);
+	else
+		dma_free_coherent(vic->dev, vic->falcon.firmware.size,
+				  vic->falcon.firmware.vaddr,
+				  vic->falcon.firmware.paddr);
+
 	return 0;
 }
 
@@ -256,25 +244,75 @@ static const struct host1x_client_ops vic_client_ops = {
 
 static int vic_load_firmware(struct vic *vic)
 {
+	struct host1x_client *client = &vic->client.base;
+	struct tegra_drm *tegra = vic->client.drm;
+	dma_addr_t phys;
+	size_t size;
+	void *virt;
 	int err;
 
-	if (vic->falcon.data)
+	if (vic->falcon.firmware.vaddr)
 		return 0;
 
-	vic->falcon.data = vic->client.drm;
-
 	err = falcon_read_firmware(&vic->falcon, vic->config->firmware);
 	if (err < 0)
-		goto cleanup;
+		return err;
+
+	size = vic->falcon.firmware.size;
+
+	if (!client->group) {
+		virt = dma_alloc_coherent(vic->dev, size, &phys, GFP_KERNEL);
+
+		err = dma_mapping_error(vic->dev, phys);
+		if (err < 0)
+			return err;
+	} else {
+		virt = tegra_drm_alloc(tegra, size, &phys);
+	}
+
+	vic->falcon.firmware.vaddr = virt;
+	vic->falcon.firmware.paddr = phys;
 
 	err = falcon_load_firmware(&vic->falcon);
 	if (err < 0)
 		goto cleanup;
 
+	/*
+	 * In this case we have received an IOVA from the shared domain, so we
+	 * need to make sure to get the physical address so that the DMA API
+	 * knows what memory pages to flush the cache for.
+	 */
+	if (client->group) {
+		phys = dma_map_single(vic->dev, virt, size, DMA_TO_DEVICE);
+
+		err = dma_mapping_error(vic->dev, phys);
+		if (err < 0)
+			goto cleanup;
+
+		/*
+		 * If the DMA API mapped this through a bounce buffer, the
+		 * dma_sync_single_for_device() call below will not be able
+		 * to flush the caches for the right memory pages. Output a
+		 * big warning in that case so that the DMA mask can be set
+		 * properly and the bounce buffer avoided.
+		 */
+		WARN(phys != vic->falcon.firmware.paddr,
+		     "check DMA mask setting for %s\n", dev_name(vic->dev));
+	}
+
+	dma_sync_single_for_device(vic->dev, phys, size, DMA_TO_DEVICE);
+
+	if (client->group)
+		dma_unmap_single(vic->dev, phys, size, DMA_TO_DEVICE);
+
 	return 0;
 
 cleanup:
-	vic->falcon.data = NULL;
+	if (!client->group)
+		dma_free_coherent(vic->dev, size, virt, phys);
+	else
+		tegra_drm_free(tegra, size, virt, phys);
+
 	return err;
 }
 
@@ -415,7 +453,6 @@ static int vic_probe(struct platform_device *pdev)
 
 	vic->falcon.dev = dev;
 	vic->falcon.regs = vic->regs;
-	vic->falcon.ops = &vic_falcon_ops;
 
 	err = falcon_init(&vic->falcon);
 	if (err < 0)
-- 
2.23.0


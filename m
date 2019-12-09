Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4B1116CB6
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 13:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbfLIMAY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Dec 2019 07:00:24 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41308 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbfLIMAY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Dec 2019 07:00:24 -0500
Received: by mail-wr1-f67.google.com with SMTP id c9so15889428wrw.8
        for <linux-tegra@vger.kernel.org>; Mon, 09 Dec 2019 04:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TBGvky0NnQZeg63n6Ic4zjBFtsUUkKVRowQY0EPm9HY=;
        b=R03vguED2s40kktOkojE6I7Y7zUvBMrEZHzQ0pAl0RExJQ9WFqnS8NveKy4px4zSwW
         zaAApsE+tVeQQQ/0QURLCx9CQCG90IwUCVyDPPltroHtK5FpdWADpUXLB3HZtHiAdhrg
         PfoEzfHGL6S0SA3umXd+vP9CR3Kv/o/UHCgg3Q/tthDud3B9ehasAZ+3Oggtlfe5NC3H
         Pu7DMu/TLv963y1mStx0yt1tclCM+Dyqirl0sKiCJA+dQFVhyg2k3B4nCjBoUOMsciHG
         uZGPbrMIaHD7RuhngsnLxGGpWKMTj3IQ3U5e4C5iX8or5jxRw9PCyVOVV5d3XsUo1Fio
         OIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TBGvky0NnQZeg63n6Ic4zjBFtsUUkKVRowQY0EPm9HY=;
        b=SUpgiyAIeTxJqXNsRoTKeZh6CAr5GtL0gQ0hycj72yMVZxdPg+aC6pUWAzMHws2Lqo
         0Hn7XqYCpMRDOET/B/hhw6W0HSEBXehc5/BPnRrn5wJZoSF9z5qv2DLK0Msh1o++VPuB
         52kGkIoxfhVWk4JZfGCdpLND9l66fDIaTLiNqRHOFXgn6cqa6dn3BhWCypPrxmny/+gM
         gMuo5H2eJELLhXp7w2xPliV1XT0CirzwyZu0tm1bCgjfBU2Udyu68tIRLRW4CRWVbCjQ
         GEeRf6t9HLQ5B86BQpVjQpePc7vhdiUxywwGB4oJOY2XbaHTNXcLruodvZCVU5p021Ok
         aOhw==
X-Gm-Message-State: APjAAAXnr8akAtI9Cacv0ywCOP3VH6gmfehHyoU940cH1Ot+bzWbl+TS
        bWwtxOUTIULtcmn4XKNwKZg=
X-Google-Smtp-Source: APXvYqzytMwCEmmroCjnIxnRwY1N1RULw4dxYaOOYQhLaEhCr2hA0MscwsiLqycIIzxLlMmwXaE2Ow==
X-Received: by 2002:adf:ee82:: with SMTP id b2mr1867255wro.194.1575892821636;
        Mon, 09 Dec 2019 04:00:21 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id n12sm13434368wmd.1.2019.12.09.04.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 04:00:20 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Lyude Paul <lyude@redhat.com>,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 7/9] drm/nouveau: secboot: Read WPR configuration from GPU registers
Date:   Mon,  9 Dec 2019 13:00:03 +0100
Message-Id: <20191209120005.2254786-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209120005.2254786-1-thierry.reding@gmail.com>
References: <20191209120005.2254786-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The GPUs found on Tegra SoCs have registers that can be used to read the
WPR configuration. Use these registers instead of reaching into the
memory controller's register space to read the same information.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../drm/nouveau/nvkm/subdev/secboot/gm200.h   |  2 +-
 .../drm/nouveau/nvkm/subdev/secboot/gm20b.c   | 81 ++++++++++++-------
 .../drm/nouveau/nvkm/subdev/secboot/gp10b.c   |  4 +-
 3 files changed, 53 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h
index 62c5e162099a..280b1448df88 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h
@@ -41,6 +41,6 @@ int gm200_secboot_run_blob(struct nvkm_secboot *, struct nvkm_gpuobj *,
 			   struct nvkm_falcon *);
 
 /* Tegra-only */
-int gm20b_secboot_tegra_read_wpr(struct gm200_secboot *, u32);
+int gm20b_secboot_tegra_read_wpr(struct gm200_secboot *);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
index df8b919dcf09..f8a543122219 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
@@ -23,39 +23,65 @@
 #include "acr.h"
 #include "gm200.h"
 
-#define TEGRA210_MC_BASE			0x70019000
-
 #ifdef CONFIG_ARCH_TEGRA
-#define MC_SECURITY_CARVEOUT2_CFG0		0xc58
-#define MC_SECURITY_CARVEOUT2_BOM_0		0xc5c
-#define MC_SECURITY_CARVEOUT2_BOM_HI_0		0xc60
-#define MC_SECURITY_CARVEOUT2_SIZE_128K		0xc64
-#define TEGRA_MC_SECURITY_CARVEOUT_CFG_LOCKED	(1 << 1)
 /**
  * gm20b_secboot_tegra_read_wpr() - read the WPR registers on Tegra
  *
- * On dGPU, we can manage the WPR region ourselves, but on Tegra the WPR region
- * is reserved from system memory by the bootloader and irreversibly locked.
- * This function reads the address and size of the pre-configured WPR region.
+ * On dGPU, we can manage the WPR region ourselves, but on Tegra this region
+ * is allocated from system memory by the secure firmware. The region is then
+ * marked as a "secure carveout" and irreversibly locked. Furthermore, the WPR
+ * secure carveout is also configured to be sent to the GPU via a dedicated
+ * serial bus between the memory controller and the GPU. The GPU requests this
+ * information upon leaving reset and exposes it through a FIFO register at
+ * offset 0x100cd4.
+ *
+ * The FIFO register's lower 4 bits can be used to set the read index into the
+ * FIFO. After each read of the FIFO register, the read index is incremented.
+ *
+ * Indices 2 and 3 contain the lower and upper addresses of the WPR. These are
+ * stored in units of 256 B. The WPR is inclusive of both addresses.
+ *
+ * Unfortunately, for some reason the WPR info register doesn't contain the
+ * correct values for the secure carveout. It seems like the upper address is
+ * always too small by 128 KiB - 1. Given that the secure carvout size in the
+ * memory controller configuration is specified in units of 128 KiB, it's
+ * possible that the computation of the upper address of the WPR is wrong and
+ * causes this difference.
  */
 int
-gm20b_secboot_tegra_read_wpr(struct gm200_secboot *gsb, u32 mc_base)
+gm20b_secboot_tegra_read_wpr(struct gm200_secboot *gsb)
 {
+	struct nvkm_device *device = gsb->base.subdev.device;
 	struct nvkm_secboot *sb = &gsb->base;
-	void __iomem *mc;
-	u32 cfg;
+	u64 base, limit;
+	u32 value;
 
-	mc = ioremap(mc_base, 0xd00);
-	if (!mc) {
-		nvkm_error(&sb->subdev, "Cannot map Tegra MC registers\n");
-		return -ENOMEM;
-	}
-	sb->wpr_addr = ioread32_native(mc + MC_SECURITY_CARVEOUT2_BOM_0) |
-	      ((u64)ioread32_native(mc + MC_SECURITY_CARVEOUT2_BOM_HI_0) << 32);
-	sb->wpr_size = ioread32_native(mc + MC_SECURITY_CARVEOUT2_SIZE_128K)
-		<< 17;
-	cfg = ioread32_native(mc + MC_SECURITY_CARVEOUT2_CFG0);
-	iounmap(mc);
+	/* set WPR info register to point at WPR base address register */
+	value = nvkm_rd32(device, 0x100cd4);
+	value &= ~0xf;
+	value |= 0x2;
+	nvkm_wr32(device, 0x100cd4, value);
+
+	/* read base address */
+	value = nvkm_rd32(device, 0x100cd4);
+	base = (u64)(value >> 4) << 12;
+
+	/* read limit */
+	value = nvkm_rd32(device, 0x100cd4);
+	limit = (u64)(value >> 4) << 12;
+
+	/*
+	 * The upper address of the WPR seems to be computed wrongly and is
+	 * actually SZ_128K - 1 bytes lower than it should be. Adjust the
+	 * value accordingly.
+	 */
+	limit += SZ_128K - 1;
+
+	sb->wpr_size = limit - base + 1;
+	sb->wpr_addr = base;
+
+	nvkm_info(&sb->subdev, "WPR: %016llx-%016llx\n", sb->wpr_addr,
+		  sb->wpr_addr + sb->wpr_size - 1);
 
 	/* Check that WPR settings are valid */
 	if (sb->wpr_size == 0) {
@@ -63,11 +89,6 @@ gm20b_secboot_tegra_read_wpr(struct gm200_secboot *gsb, u32 mc_base)
 		return -EINVAL;
 	}
 
-	if (!(cfg & TEGRA_MC_SECURITY_CARVEOUT_CFG_LOCKED)) {
-		nvkm_error(&sb->subdev, "WPR region not locked\n");
-		return -EINVAL;
-	}
-
 	return 0;
 }
 #else
@@ -85,7 +106,7 @@ gm20b_secboot_oneinit(struct nvkm_secboot *sb)
 	struct gm200_secboot *gsb = gm200_secboot(sb);
 	int ret;
 
-	ret = gm20b_secboot_tegra_read_wpr(gsb, TEGRA210_MC_BASE);
+	ret = gm20b_secboot_tegra_read_wpr(gsb);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
index 28ca29d0eeee..d84e85825995 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
@@ -23,15 +23,13 @@
 #include "acr.h"
 #include "gm200.h"
 
-#define TEGRA186_MC_BASE			0x02c10000
-
 static int
 gp10b_secboot_oneinit(struct nvkm_secboot *sb)
 {
 	struct gm200_secboot *gsb = gm200_secboot(sb);
 	int ret;
 
-	ret = gm20b_secboot_tegra_read_wpr(gsb, TEGRA186_MC_BASE);
+	ret = gm20b_secboot_tegra_read_wpr(gsb);
 	if (ret)
 		return ret;
 
-- 
2.23.0


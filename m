Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC7FCED01B
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 18:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfKBR47 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 13:56:59 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40971 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfKBR47 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 13:56:59 -0400
Received: by mail-wr1-f66.google.com with SMTP id p4so12717975wrm.8
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 10:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TBGvky0NnQZeg63n6Ic4zjBFtsUUkKVRowQY0EPm9HY=;
        b=mQwCxE+ACwCNAtNNotlKs7E39ChGSwDghVPnTpzol2wQB3+C+YI2dsshyZcPxsJDSW
         H1pwDNSRmafPvupZjjltT/3xJ9EBJrHo+vIRkgHCBc0tOWJkzl026DS0cwtRyR24Pq8k
         89IWShU/C7HWr+5rlTLVNSbqIkGbuJXOcojV47VPZs8iXQwWCd7FGsLPz9eiUjCLtVKc
         pUzIw8lJ9bsYj3W9ZLSe+sm3YX9IWzrBl4ghFLwN/+zhIqOKrnVjRkW+jwdkhw3LSdLy
         s0alr8g0PylVT0gmLDPryDhEaKnP9QLi0qNDxCGc26pp3aU+MAq6R4tG5KHpEFTrt1FS
         70vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TBGvky0NnQZeg63n6Ic4zjBFtsUUkKVRowQY0EPm9HY=;
        b=Pfu90G2T9zZBAwK8IXByygFcne9CG4RTDl4fqKImf6aHbcKXyzF2m2v+afmUkCph8Z
         GN/aIWy9H01fjk5eDsPpNhpTiez4Tt1YY9Te7gPJvQa6uif/Sn/OVA44L0vlYPUTN3Xh
         h221P63oCta4IGXrA3KAiu2XUhiG79nl/f+uCknFJM7W/KStjNf4RTbsHIiGrnvstzN1
         HUjtPBOL+ar+HD+erumrXMlTd1USY5FROME1PNzk+Nhr55t6Lf/FjPq0Pz6hTleU5Aiu
         qgFGDdXDT7BgJo/qpisBF7ridJVRsXC2J9/ntKUSZXYGIXVLP2pPU8gmKv0vflSnn4uM
         toaw==
X-Gm-Message-State: APjAAAXRjGf9QEhO8UlmW9c0XaoqmL/thAKUDu9WJ4lvNPdj9qv//+fQ
        X5EPdZbwJutpNXnEADhDEA8=
X-Google-Smtp-Source: APXvYqxOLNjP/3DBg4V3uwz9iz5CjZ1RkuM8IW/bvjgcCigsK2Vn74oR4RwbTRV5gqlOC9StRj92iw==
X-Received: by 2002:adf:db0e:: with SMTP id s14mr16844240wri.341.1572717416157;
        Sat, 02 Nov 2019 10:56:56 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id h205sm12007213wmf.35.2019.11.02.10.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 10:56:55 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>, Joerg Roedel <joro@8bytes.org>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 7/9] drm/nouveau: secboot: Read WPR configuration from GPU registers
Date:   Sat,  2 Nov 2019 18:56:35 +0100
Message-Id: <20191102175637.3065-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102175637.3065-1-thierry.reding@gmail.com>
References: <20191102175637.3065-1-thierry.reding@gmail.com>
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


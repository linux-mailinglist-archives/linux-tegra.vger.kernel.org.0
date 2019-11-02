Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1F8DED01C
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 18:57:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbfKBR5B (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 13:57:01 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40441 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbfKBR5B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 13:57:01 -0400
Received: by mail-wm1-f68.google.com with SMTP id f3so951684wmc.5
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 10:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KgCN3eDLCLLxgvLwcLPRUvAfY7m1hNtkJ6cy/5CLIlQ=;
        b=nWU0EQiDtPwW5QxBiIORTTGRkgsglc8fjDLPIwQuBoO+/gLIIG17Gx1U+B8QhZIY8W
         OnOFqylKcpVej5MtufBcHUDmGw4ajMffNyjD/fG91Q9mQwKicn14JyrxdzuwGVpf82zf
         4CCEACwSecba1VFahwpsemlBE+NO4OJxG16ZcohkafhSwo5FzQFTtAaLGqVfQT2jNBTK
         tTkCAdTSL2D3jL+O5/vlt7790YxiZvH8k0R4ikUQWARdnhYzT6dis4bMDBg4ZzXRFz5r
         6YliQip1Ur19euAXVw7nOHpBpfAsnlSvlm8kg5T2hJvmd6pkWJtbMxLdppDrZH5YZqFc
         pDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KgCN3eDLCLLxgvLwcLPRUvAfY7m1hNtkJ6cy/5CLIlQ=;
        b=qfVvxLeL4jUzLOikNh4dD+nzSHEay09y/svQMPZhgTiymCY0r97mm+nWfV+afAuE42
         fbAQYenxErrDHJojq+UHNrlDPmTRim4mxYMCEe6RR/XsJqA2umSRi9ZJbguutekV57ti
         qB/gqCZcxGoaV0iXBxb4FwAOpGr6Kipk2f4jR+/kYksQKj8irOneSz4B/4VdDUg8q6XT
         OWB+7Yzp9oT4gzya5QRTuAFml5L8EHfD9ShnduVHfOfbKtKXy/PcTfqMRJCVOswQK+R3
         C3CNV3jL7SiA9zIQ9jEJcETXhAtJeDvkn6MLMjjJADlahkKgmOq/GlpJYvSwKytbeXIv
         YIqg==
X-Gm-Message-State: APjAAAU3DA62BEmMJscrl8UB32EclbY3K7+ve9BAkqcaGMCoJ1vnIYAp
        T7fEAnVjXQ6BgNXntrIKAJo=
X-Google-Smtp-Source: APXvYqyLc1/offISysokD0OdxAmQjH1j//oM182q1XhuSlplZ67uIsjWLYLulL9JkZb2tJrQTDA8eg==
X-Received: by 2002:a05:600c:22cb:: with SMTP id 11mr2199541wmg.117.1572717418126;
        Sat, 02 Nov 2019 10:56:58 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id i71sm14737287wri.68.2019.11.02.10.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 10:56:57 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>, Joerg Roedel <joro@8bytes.org>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 8/9] drm/nouveau: gp10b: Add custom L2 cache implementation
Date:   Sat,  2 Nov 2019 18:56:36 +0100
Message-Id: <20191102175637.3065-9-thierry.reding@gmail.com>
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

There are extra registers that need to be programmed to make the level 2
cache work on GP10B, such as the stream ID register that is used when an
SMMU is used to translate memory addresses.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- remove IOMMU_API protection to increase compile coverage
- relies on dummy dev_iommu_fwspec_get() helper

 .../gpu/drm/nouveau/include/nvkm/subdev/ltc.h |  1 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c   | 65 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/ltc/priv.h    |  2 +
 5 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h
index 644d527c3b96..d76f60d7d29a 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h
@@ -40,4 +40,5 @@ int gm107_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
 int gm200_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
 int gp100_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
 int gp102_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
+int gp10b_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index b061df138142..231ec0073af3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2380,7 +2380,7 @@ nv13b_chipset = {
 	.fuse = gm107_fuse_new,
 	.ibus = gp10b_ibus_new,
 	.imem = gk20a_instmem_new,
-	.ltc = gp102_ltc_new,
+	.ltc = gp10b_ltc_new,
 	.mc = gp10b_mc_new,
 	.mmu = gp10b_mmu_new,
 	.secboot = gp10b_secboot_new,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild
index 2b6d36ea7067..728d75010847 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild
@@ -6,3 +6,4 @@ nvkm-y += nvkm/subdev/ltc/gm107.o
 nvkm-y += nvkm/subdev/ltc/gm200.o
 nvkm-y += nvkm/subdev/ltc/gp100.o
 nvkm-y += nvkm/subdev/ltc/gp102.o
+nvkm-y += nvkm/subdev/ltc/gp10b.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
new file mode 100644
index 000000000000..c0063c7caa50
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
@@ -0,0 +1,65 @@
+/*
+ * Copyright (c) 2019 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: Thierry Reding
+ */
+
+#include "priv.h"
+
+static void
+gp10b_ltc_init(struct nvkm_ltc *ltc)
+{
+	struct nvkm_device *device = ltc->subdev.device;
+	struct iommu_fwspec *spec;
+
+	nvkm_wr32(device, 0x17e27c, ltc->ltc_nr);
+	nvkm_wr32(device, 0x17e000, ltc->ltc_nr);
+	nvkm_wr32(device, 0x100800, ltc->ltc_nr);
+
+	spec = dev_iommu_fwspec_get(device->dev);
+	if (spec) {
+		u32 sid = spec->ids[0] & 0xffff;
+
+		/* stream ID */
+		nvkm_wr32(device, 0x160000, sid << 2);
+	}
+}
+
+static const struct nvkm_ltc_func
+gp10b_ltc = {
+	.oneinit = gp100_ltc_oneinit,
+	.init = gp10b_ltc_init,
+	.intr = gp100_ltc_intr,
+	.cbc_clear = gm107_ltc_cbc_clear,
+	.cbc_wait = gm107_ltc_cbc_wait,
+	.zbc = 16,
+	.zbc_clear_color = gm107_ltc_zbc_clear_color,
+	.zbc_clear_depth = gm107_ltc_zbc_clear_depth,
+	.zbc_clear_stencil = gp102_ltc_zbc_clear_stencil,
+	.invalidate = gf100_ltc_invalidate,
+	.flush = gf100_ltc_flush,
+};
+
+int
+gp10b_ltc_new(struct nvkm_device *device, int index, struct nvkm_ltc **pltc)
+{
+	return nvkm_ltc_new_(&gp10b_ltc, device, index, pltc);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/priv.h
index 2fcf18e46ce3..eca5a711b1b8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/priv.h
@@ -46,4 +46,6 @@ void gm107_ltc_zbc_clear_depth(struct nvkm_ltc *, int, const u32);
 int gp100_ltc_oneinit(struct nvkm_ltc *);
 void gp100_ltc_init(struct nvkm_ltc *);
 void gp100_ltc_intr(struct nvkm_ltc *);
+
+void gp102_ltc_zbc_clear_stencil(struct nvkm_ltc *, int, const u32);
 #endif
-- 
2.23.0


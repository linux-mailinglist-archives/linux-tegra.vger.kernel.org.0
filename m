Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8CA7B3D22
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Sep 2019 17:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbfIPPE1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Sep 2019 11:04:27 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37280 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbfIPPE1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Sep 2019 11:04:27 -0400
Received: by mail-ed1-f65.google.com with SMTP id r4so382866edy.4
        for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2019 08:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uy0nr/bNcwsKcxOQ/DphrezPOE8UXQ4ia7xbXPR534A=;
        b=bORIipyIS5e+dRD/J3XiDIYavv5TcCCjRrPNFyf8UdMC15oiNTC+Zq8xVqzYtkF7+M
         5b0M3QWLsabnbujzDzpH1oAfi0xTCBlRUn2QoEbkrEdZAXS8Zw1rl9++ar/IqeXriyXF
         vP2oAfhT5bEE+7mAqNR2WcsWdopnRDje4l/KiM95lMZeMwD4JHxzcIBUZXz6osRgy43u
         lw6xZb5A1xih6nI4EdCWZvpZW3u3ry8F1JOy5o/Scxn5H83r1XqlSkYKezpqD6TIyQd6
         uko2dhwErLCQB3hnEn0P0X/T+wMVz3aBsAepmv5uHFAjIxZA+aJPZ/zWKf8sW1Ic0V2B
         FYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uy0nr/bNcwsKcxOQ/DphrezPOE8UXQ4ia7xbXPR534A=;
        b=APHcKi+o/cIsMGAD21haezU+ggL9cTyTyrTRHPloauzqfjOwd+CDXEg39KcnJI8s70
         zbhnsCE/6b2p7v7jSsQKKnI3i5A3fdYZh/kh3Ljzca3hd6Z4QrXGqz7ByHw26IKmUGsy
         o7i5tJWDnQaZIqrmRuF+haa/wUj4Omx0jVUkaegD3C+yxD7iMFhz84LaF0pDlXf7yaOF
         eJz+FlRNrUIxIc4atLf8B/xbaeWRcJlocZY4oMMvl7VLaBvJRouJ3dEK8kAkeoLnjou6
         5r/I/YHbM5Ua/0gT7l+DzPxwme2lz3n8mVJ9Gj+31NamKfet2qRk8hmhzvzzwlAIkU9m
         T9Bw==
X-Gm-Message-State: APjAAAUpb7qm95P+1KjspE63sj/nSZySZ6Y9uTcnceg5v2W6cnkkkpgC
        aT4v0sJK8DDeHrP2h2lH+L4=
X-Google-Smtp-Source: APXvYqyoy0KDihGa/aaVoi9VzPhWToSwK8QpEAwEiEUmSXdjDmI1c/ivlpFZ9unBZ3ciKe8FnPDesA==
X-Received: by 2002:a50:acc1:: with SMTP id x59mr30380211edc.278.1568646265136;
        Mon, 16 Sep 2019 08:04:25 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id rs25sm748494ejb.14.2019.09.16.08.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 08:04:23 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 04/11] drm/nouveau: gp10b: Add custom L2 cache implementation
Date:   Mon, 16 Sep 2019 17:04:05 +0200
Message-Id: <20190916150412.10025-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916150412.10025-1-thierry.reding@gmail.com>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
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
 .../gpu/drm/nouveau/include/nvkm/subdev/ltc.h |  1 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c   | 69 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/ltc/priv.h    |  2 +
 5 files changed, 74 insertions(+), 1 deletion(-)
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
index c3c7159f3411..d2d6d5f4028a 100644
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
index 000000000000..4d27c6ea1552
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
@@ -0,0 +1,69 @@
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
+#ifdef CONFIG_IOMMU_API
+	struct iommu_fwspec *spec;
+#endif
+
+	nvkm_wr32(device, 0x17e27c, ltc->ltc_nr);
+	nvkm_wr32(device, 0x17e000, ltc->ltc_nr);
+	nvkm_wr32(device, 0x100800, ltc->ltc_nr);
+
+#ifdef CONFIG_IOMMU_API
+	spec = dev_iommu_fwspec_get(device->dev);
+	if (spec) {
+		u32 sid = spec->ids[0] & 0xffff;
+
+		/* stream ID */
+		nvkm_wr32(device, 0x160000, sid << 2);
+	}
+#endif
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


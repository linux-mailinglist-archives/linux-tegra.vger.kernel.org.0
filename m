Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56CB3116CB7
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 13:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727476AbfLIMA0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Dec 2019 07:00:26 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45102 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727385AbfLIMAZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Dec 2019 07:00:25 -0500
Received: by mail-wr1-f66.google.com with SMTP id j42so15831805wrj.12
        for <linux-tegra@vger.kernel.org>; Mon, 09 Dec 2019 04:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KgCN3eDLCLLxgvLwcLPRUvAfY7m1hNtkJ6cy/5CLIlQ=;
        b=ApC7j8X68bN2Dg8v05MEnRRnc65YLH4TqK3KQ+DoxfYryGN/aIAFNxHZPlaFUkbaBr
         +/eJIzBK7mnZHSmpzRrZ2CPxUttKLJMHtbJDHMzPtDXsRcEK+zfg6U2OQ3HPAeF44ERp
         g+Ex2K6xB5o3mstsmYIcvL4rp0WP43L/uVz2UV/UuO2SeJ6D4pq/1wc0HZUzu8jM6fFk
         OUSX690VSIH0CPjwxzI1OyCVmBi3U6m7e43g7PmrFEI1VBzQjjQyva5ug0Lw2ENEssng
         lt69IM9577rfMohi6jnd693NvN9yPwaAvttYMlk7qVd4gUYJgrcK0Jg1c6J6JHO0Rnbp
         oUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KgCN3eDLCLLxgvLwcLPRUvAfY7m1hNtkJ6cy/5CLIlQ=;
        b=uU4G0tzjUa/yFSN7gmawigkpKxiIPvxwVqUeYtNEY/mcu5uVYg5t6ldycpM0paCExU
         jkVHPoca+ZLe9S4eRIEq81SXANKAMPizaT3NAabRAe0hNOICkDImKiaIl2VbIbRdEquE
         f1OSwN/M5Jy8ZM9BJKZ98BArk2xt6vsBscSsorhH0bmiEzfFJRRJCji7T77WKUHMZZQ0
         1hVJPqEhz8QT+g4jddIU2EAaC5GKELQMkO0k6JMjsAG3oD3+/qP57hr2+xKKkxwEteEq
         4jJK0Y3zEGdjigsV8zEpB9OjxRxIPk3H5NaJ9heu23KR4BJftL20GR+MWHonmvok1asL
         CAAQ==
X-Gm-Message-State: APjAAAXa8EQHY9ti6Yojqx9VJY7MbDmJrqWX7i5jdGXd43BRilLu3R6n
        +pZr7uajqg+QZAzIMeZydSM=
X-Google-Smtp-Source: APXvYqym7z/GXeimnBPOS/GWRTrS2XW+r/qH5LHG9ZXppLkyCCUknrwNLQ9SDK2sNLV0NU/nH27uMA==
X-Received: by 2002:adf:e78b:: with SMTP id n11mr1806300wrm.10.1575892823512;
        Mon, 09 Dec 2019 04:00:23 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id c1sm26876837wrs.24.2019.12.09.04.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 04:00:22 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Lyude Paul <lyude@redhat.com>,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 8/9] drm/nouveau: gp10b: Add custom L2 cache implementation
Date:   Mon,  9 Dec 2019 13:00:04 +0100
Message-Id: <20191209120005.2254786-9-thierry.reding@gmail.com>
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


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E95B4ED012
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 18:56:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfKBR4u (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 13:56:50 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40423 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbfKBR4u (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 13:56:50 -0400
Received: by mail-wm1-f67.google.com with SMTP id f3so951432wmc.5
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 10:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ANfPpmnsT/oeTWNuA93BRI4tRFioqEyA5OCtqkzBRZ8=;
        b=UXbkDudP4dmji/zYAcLUXUjXdfcd7W8lG7HOEPZCRPQ/6upGd6Z4dRI0UqJ/eGYXSZ
         PLMxF18nEMIkCDF0isYInwxVgqRIYo/72TByzGmzBFSzQZCAdRgwTIryOPQIhNqOhr1h
         1g9+Iw7wBTRe5OR191YmEP9h0M7sfvvZJR61fRTAg1D+EoAGZD9n4MlUxzP4yFXTUmQ3
         It0P7xe765MhQnJJNkKaKrRYFKa0vwZ0/RF9ZqhC0Fvn8McebUWCECb+JRXOs+kFwX/6
         9qjUeDtVJemHafAMcSnJ2n3EUH2Rgx05UHdjXsUd7Fi8GdyrZnIaPU5Sv5E69i5gbe7r
         Vf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ANfPpmnsT/oeTWNuA93BRI4tRFioqEyA5OCtqkzBRZ8=;
        b=ZrkUx7IYkcvZ6AAj5k1bYGlSgQuWehn4iQD1WAeBDlh44judLHZfIiMIDwwQGV7B/I
         Mxj9pU/mc7/n+kWvuQRUqsOokfV0Ejys3TuUM8LY6bn9kIBW3wpILezraJH2wR8gIE+e
         gupLDPtEpP8GOP+dEafmEZ9vyfekJDmQAZA3n8cFCvTd1NVlWYilExkLem1vRICvdueX
         zO0pvp6zleCwTMwo1HXy663nRAw1olA/OR5xHRozHTW/usQ8zh39KchAC71dI5fRvoRB
         IWXab4yyw2j8hNUOEqN1sOJ8lpnybiL1hHo9R7vrOiUUzqcdhOoOwhwOhnlRKPOin+Sd
         nCnQ==
X-Gm-Message-State: APjAAAV+HRK9iaCfV5tp78vVTAjaiBmiJ3C3XvKaVWfjqpsBf+7VVToK
        ayaJBiOEF24sBlWaD9+vhLg=
X-Google-Smtp-Source: APXvYqx9tdG3WA1HsVorLUlV0lcZZZ0mAl4cYePM67MnHlKZPh33QVcD9sYlhIq0QqLoi69/NETT4w==
X-Received: by 2002:a1c:9a4f:: with SMTP id c76mr16062345wme.103.1572717406828;
        Sat, 02 Nov 2019 10:56:46 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id v10sm14574594wmg.48.2019.11.02.10.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 10:56:45 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>, Joerg Roedel <joro@8bytes.org>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 3/9] drm/nouveau: fault: Add support for GP10B
Date:   Sat,  2 Nov 2019 18:56:31 +0100
Message-Id: <20191102175637.3065-4-thierry.reding@gmail.com>
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

There is no BAR2 on GP10B and there is no need to map through BAR2
because all memory is shared between the GPU and the CPU. Add a custom
implementation of the fault sub-device that uses nvkm_memory_addr()
instead of nvkm_memory_bar2() to return the address of a pinned fault
buffer.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../drm/nouveau/include/nvkm/subdev/fault.h   |  1 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/fault/Kbuild  |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/fault/base.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/fault/gp100.c | 17 ++++--
 .../gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c | 53 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/fault/gv100.c |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/fault/priv.h  | 10 ++++
 8 files changed, 80 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fault.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fault.h
index 97322f95b3ee..a513c16ab105 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fault.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fault.h
@@ -31,6 +31,7 @@ struct nvkm_fault_data {
 };
 
 int gp100_fault_new(struct nvkm_device *, int, struct nvkm_fault **);
+int gp10b_fault_new(struct nvkm_device *, int, struct nvkm_fault **);
 int gv100_fault_new(struct nvkm_device *, int, struct nvkm_fault **);
 int tu102_fault_new(struct nvkm_device *, int, struct nvkm_fault **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index c3c7159f3411..b061df138142 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2375,7 +2375,7 @@ nv13b_chipset = {
 	.name = "GP10B",
 	.bar = gm20b_bar_new,
 	.bus = gf100_bus_new,
-	.fault = gp100_fault_new,
+	.fault = gp10b_fault_new,
 	.fb = gp10b_fb_new,
 	.fuse = gm107_fuse_new,
 	.ibus = gp10b_ibus_new,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/Kbuild
index 53b9d638f2c8..d65ec719f153 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/Kbuild
@@ -2,5 +2,6 @@
 nvkm-y += nvkm/subdev/fault/base.o
 nvkm-y += nvkm/subdev/fault/user.o
 nvkm-y += nvkm/subdev/fault/gp100.o
+nvkm-y += nvkm/subdev/fault/gp10b.o
 nvkm-y += nvkm/subdev/fault/gv100.o
 nvkm-y += nvkm/subdev/fault/tu102.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c
index ca251560d3e0..1c4b852b26c3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c
@@ -108,7 +108,7 @@ nvkm_fault_oneinit_buffer(struct nvkm_fault *fault, int id)
 		return ret;
 
 	/* Pin fault buffer in BAR2. */
-	buffer->addr = nvkm_memory_bar2(buffer->mem);
+	buffer->addr = fault->func->buffer.pin(buffer);
 	if (buffer->addr == ~0ULL)
 		return -EFAULT;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp100.c
index 4f3c4e091117..f6b189cc4330 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp100.c
@@ -21,25 +21,26 @@
  */
 #include "priv.h"
 
+#include <core/memory.h>
 #include <subdev/mc.h>
 
 #include <nvif/class.h>
 
-static void
+void
 gp100_fault_buffer_intr(struct nvkm_fault_buffer *buffer, bool enable)
 {
 	struct nvkm_device *device = buffer->fault->subdev.device;
 	nvkm_mc_intr_mask(device, NVKM_SUBDEV_FAULT, enable);
 }
 
-static void
+void
 gp100_fault_buffer_fini(struct nvkm_fault_buffer *buffer)
 {
 	struct nvkm_device *device = buffer->fault->subdev.device;
 	nvkm_mask(device, 0x002a70, 0x00000001, 0x00000000);
 }
 
-static void
+void
 gp100_fault_buffer_init(struct nvkm_fault_buffer *buffer)
 {
 	struct nvkm_device *device = buffer->fault->subdev.device;
@@ -48,7 +49,12 @@ gp100_fault_buffer_init(struct nvkm_fault_buffer *buffer)
 	nvkm_mask(device, 0x002a70, 0x00000001, 0x00000001);
 }
 
-static void
+u64 gp100_fault_buffer_pin(struct nvkm_fault_buffer *buffer)
+{
+	return nvkm_memory_bar2(buffer->mem);
+}
+
+void
 gp100_fault_buffer_info(struct nvkm_fault_buffer *buffer)
 {
 	buffer->entries = nvkm_rd32(buffer->fault->subdev.device, 0x002a78);
@@ -56,7 +62,7 @@ gp100_fault_buffer_info(struct nvkm_fault_buffer *buffer)
 	buffer->put = 0x002a80;
 }
 
-static void
+void
 gp100_fault_intr(struct nvkm_fault *fault)
 {
 	nvkm_event_send(&fault->event, 1, 0, NULL, 0);
@@ -68,6 +74,7 @@ gp100_fault = {
 	.buffer.nr = 1,
 	.buffer.entry_size = 32,
 	.buffer.info = gp100_fault_buffer_info,
+	.buffer.pin = gp100_fault_buffer_pin,
 	.buffer.init = gp100_fault_buffer_init,
 	.buffer.fini = gp100_fault_buffer_fini,
 	.buffer.intr = gp100_fault_buffer_intr,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c
new file mode 100644
index 000000000000..9e66d1f7654d
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c
@@ -0,0 +1,53 @@
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
+ */
+
+#include "priv.h"
+
+#include <core/memory.h>
+
+#include <nvif/class.h>
+
+u64
+gp10b_fault_buffer_pin(struct nvkm_fault_buffer *buffer)
+{
+	return nvkm_memory_addr(buffer->mem);
+}
+
+static const struct nvkm_fault_func
+gp10b_fault = {
+	.intr = gp100_fault_intr,
+	.buffer.nr = 1,
+	.buffer.entry_size = 32,
+	.buffer.info = gp100_fault_buffer_info,
+	.buffer.pin = gp10b_fault_buffer_pin,
+	.buffer.init = gp100_fault_buffer_init,
+	.buffer.fini = gp100_fault_buffer_fini,
+	.buffer.intr = gp100_fault_buffer_intr,
+	.user = { { 0, 0, MAXWELL_FAULT_BUFFER_A }, 0 },
+};
+
+int
+gp10b_fault_new(struct nvkm_device *device, int index,
+		struct nvkm_fault **pfault)
+{
+	return nvkm_fault_new_(&gp10b_fault, device, index, pfault);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c
index 6747f09c2dc3..2707be4ffabc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c
@@ -214,6 +214,7 @@ gv100_fault = {
 	.buffer.nr = 2,
 	.buffer.entry_size = 32,
 	.buffer.info = gv100_fault_buffer_info,
+	.buffer.pin = gp100_fault_buffer_pin,
 	.buffer.init = gv100_fault_buffer_init,
 	.buffer.fini = gv100_fault_buffer_fini,
 	.buffer.intr = gv100_fault_buffer_intr,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/priv.h
index 975e66ac6344..f6f1dd7eee1f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/priv.h
@@ -30,6 +30,7 @@ struct nvkm_fault_func {
 		int nr;
 		u32 entry_size;
 		void (*info)(struct nvkm_fault_buffer *);
+		u64 (*pin)(struct nvkm_fault_buffer *);
 		void (*init)(struct nvkm_fault_buffer *);
 		void (*fini)(struct nvkm_fault_buffer *);
 		void (*intr)(struct nvkm_fault_buffer *, bool enable);
@@ -40,6 +41,15 @@ struct nvkm_fault_func {
 	} user;
 };
 
+void gp100_fault_buffer_intr(struct nvkm_fault_buffer *, bool enable);
+void gp100_fault_buffer_fini(struct nvkm_fault_buffer *);
+void gp100_fault_buffer_init(struct nvkm_fault_buffer *);
+u64 gp100_fault_buffer_pin(struct nvkm_fault_buffer *);
+void gp100_fault_buffer_info(struct nvkm_fault_buffer *);
+void gp100_fault_intr(struct nvkm_fault *);
+
+u64 gp10b_fault_buffer_pin(struct nvkm_fault_buffer *);
+
 int gv100_fault_oneinit(struct nvkm_fault *);
 
 int nvkm_ufault_new(struct nvkm_device *, const struct nvkm_oclass *,
-- 
2.23.0


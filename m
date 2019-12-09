Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0002B116CAC
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 13:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbfLIMAQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Dec 2019 07:00:16 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39104 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbfLIMAQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Dec 2019 07:00:16 -0500
Received: by mail-wm1-f65.google.com with SMTP id s14so14615098wmh.4
        for <linux-tegra@vger.kernel.org>; Mon, 09 Dec 2019 04:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ANfPpmnsT/oeTWNuA93BRI4tRFioqEyA5OCtqkzBRZ8=;
        b=ob9HOr5DwFF+tNSe/WXsiZn6p1Nt0QxFFbskZ0noVqOtsmymLlYDs2ajFIQSsrXXA9
         m/h1UqoVUWIp5c0iKFQJhoP37lyn2TZfiYnsBg9H9WyYs5je9CnGSosNuD4ZRhPIJR4r
         kXL7SJtg8DZbsprRQQ7O8/VycZ99ueY3g3L1TjRqbMjAVqtuzL4shg5woRqmCBmlAitK
         ct1fJcm20Jln7vJG9GE+HfhutQWTofkWYihYTEyPMDtK/6ElzaBBF1Qymmsfk4diKENH
         pca+soryVuSswxvSE9L3lzMorVBrPa9DAeaQa8XKJxSxFi6DoQoAoN8Tv1CzCJgWOLfZ
         Zrew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ANfPpmnsT/oeTWNuA93BRI4tRFioqEyA5OCtqkzBRZ8=;
        b=tTpKnA2obQhY48pn8G9UGBNmY036Dr8XNUMhcMw5rpqbCfaM1U9ttL15QTBkJAF2mV
         Sho7G8T8Kchn4CITZuv8dbk4R1OZR+UA3mP9WJ49P7WNK2EHqdKr1o9mSzRce1sOOvpu
         MciDq5RvuWbVd9ewVJZ/LrKuCy5WqROkDUn9lUcVMsbtE5basEr9acQvpGOFN/FQ7ZsN
         GwBGSvlg8rrpSaeC6uYAxDuH89h4sCUAz15bvuwe1ceHZ8laQY7EEhthNDcGmXEra3Mn
         c73CSR+D3DbjG13X5eR+YwBGxTxHC9FRQMQtFUDGcUbodPqBtVcM4MJ8PTRgOhb3nHdF
         9MLw==
X-Gm-Message-State: APjAAAUgCC8qaVJV/u2q4ulbw/q9rIT2Ij1zYtUZxx0nj37E5QgQrPBE
        tdUvcNMj1kf1MLVporqRDAg=
X-Google-Smtp-Source: APXvYqxHuzcL+J/NVKsCLzdldjUO/c+9UNsnwNc79WjLEbI+it53OGHGxcu+pZ9FHPB1T9QDBu3v7g==
X-Received: by 2002:a05:600c:230d:: with SMTP id 13mr23732480wmo.12.1575892813723;
        Mon, 09 Dec 2019 04:00:13 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id c4sm13350848wml.7.2019.12.09.04.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 04:00:12 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Lyude Paul <lyude@redhat.com>,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 3/9] drm/nouveau: fault: Add support for GP10B
Date:   Mon,  9 Dec 2019 12:59:59 +0100
Message-Id: <20191209120005.2254786-4-thierry.reding@gmail.com>
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


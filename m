Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFFA880A1E
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 11:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbfHDJl6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 05:41:58 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35013 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfHDJl6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 05:41:58 -0400
Received: by mail-lj1-f194.google.com with SMTP id x25so76764681ljh.2
        for <linux-tegra@vger.kernel.org>; Sun, 04 Aug 2019 02:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DePQxNh8T47RVSWFEa9Q4aY3dls33KQZkKt6LAaKyh0=;
        b=vW7zSAJTmmPRh3B+v8IMuCzH/CxOrOOFS4M0Ts03o8VCz89/kvz5l5SfaJ9JUWgK7a
         rkNnn7qnojwYCL8IjiBTlCWKyaLKdU4RitqBu3k9De1PyG2x00OQtACpvDq2kiwdAkfe
         aL4a9CpfZTHuiL+m+Sa76aKQ5uB2I2rOeRjghIZ0cH9ynHC3XJlxuhO7lhw/zt7uhsAA
         2nWKfFaJagV91t8yKCTg95gA+tkIEq0aalmG4zGApZoF2se6SETISV8vSrJxdNc3xwKi
         0FgUzlzhdt8MYdXOo3jK1QYqSz3Jp7mcu/SSEwfVy0txmjJBO1VZrqy5wBoWf8BAYjgY
         b7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=DePQxNh8T47RVSWFEa9Q4aY3dls33KQZkKt6LAaKyh0=;
        b=PXV1DNGeJCa6gDFktwlom7jU3E0Feesf4HatILJ3hWpuniA8o8ti2Dp/cXcsPdmaeZ
         E/H8q8gZ3HGeBRVaQ+onCLF8Aw2oPQqxpuPKRNG+/wz+mLOGV80iRGK1FIibdL/GI8c1
         jlsfgBEB+ZmnyJNRhazySPQE1Mogn6o77cMOMFFPQTE97g3gVLU6SuqDT/3A3I3Gp8u2
         QI2pnKAps93YFwystMMyi0yVGncKcm+C5g/vuKnMQ9wscGsxR5vcBJk8OTRQ3c/4ZJSO
         oV2CoQbMni1ukucVFcYPvoRK3hgsFxzsuc2aT2O9PJwd0cHGeig/fUCt9pyav8yobxef
         qxAw==
X-Gm-Message-State: APjAAAUNWVgTbDeBYmtCCObdlqxMd7eynU9Ma6lhS38h6dex02XHCK+U
        GLqzboE3omlt1/pH6+xfdEs=
X-Google-Smtp-Source: APXvYqxkzQYang37I0j5GpRhLZVtxy73fOIwd7CT4giJfidOeGCRDny47w9stJcTRmKNM8rx28/Lpw==
X-Received: by 2002:a2e:8183:: with SMTP id e3mr26667561ljg.97.1564911715238;
        Sun, 04 Aug 2019 02:41:55 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id 25sm16230194ljn.62.2019.08.04.02.41.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 02:41:54 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Brian Starkey <brian.starkey@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
        malidp@foss.arm.com, Russell King <linux@armlinux.org.uk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 2/4] drm/tegra: drop use of drmP.h
Date:   Sun,  4 Aug 2019 11:41:30 +0200
Message-Id: <20190804094132.29463-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804094132.29463-1-sam@ravnborg.org>
References: <20190804094132.29463-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Drop use of the deprecated drmP.h header file.

For all touched files divide include files into blocks,
and sort them within the blocks.
Fix fallout.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/dc.c    | 13 +++++++++----
 drivers/gpu/drm/tegra/dpaux.c |  5 +++--
 drivers/gpu/drm/tegra/drm.c   |  8 ++++++++
 drivers/gpu/drm/tegra/drm.h   |  3 +--
 drivers/gpu/drm/tegra/dsi.c   |  8 +++++---
 drivers/gpu/drm/tegra/fb.c    |  6 ++++--
 drivers/gpu/drm/tegra/gem.c   |  3 +++
 drivers/gpu/drm/tegra/gem.h   |  1 -
 drivers/gpu/drm/tegra/gr2d.c  |  1 +
 drivers/gpu/drm/tegra/hdmi.c  |  5 +++++
 drivers/gpu/drm/tegra/hub.c   |  3 ++-
 drivers/gpu/drm/tegra/hub.h   |  1 -
 drivers/gpu/drm/tegra/plane.c |  1 +
 drivers/gpu/drm/tegra/sor.c   |  3 +++
 drivers/gpu/drm/tegra/vic.c   |  1 +
 15 files changed, 46 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 4a75d149e368..fbf57bc3cdab 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -6,23 +6,28 @@
 
 #include <linux/clk.h>
 #include <linux/debugfs.h>
+#include <linux/delay.h>
 #include <linux/iommu.h>
+#include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
 #include <soc/tegra/pmc.h>
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/drm_vblank.h>
+
 #include "dc.h"
 #include "drm.h"
 #include "gem.h"
 #include "hub.h"
 #include "plane.h"
 
-#include <drm/drm_atomic.h>
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
-
 static void tegra_crtc_atomic_destroy_state(struct drm_crtc *crtc,
 					    struct drm_crtc_state *state);
 
diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 2d94da225e51..a0f6f9b0d258 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -8,14 +8,15 @@
 #include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of_gpio.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
-#include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
-#include <linux/reset.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/workqueue.h>
 
 #include <drm/drm_dp_helper.h>
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 870904bfad78..6fb7d74ff553 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -8,9 +8,17 @@
 #include <linux/host1x.h>
 #include <linux/idr.h>
 #include <linux/iommu.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_prime.h>
+#include <drm/drm_vblank.h>
 
 #if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
 #include <asm/dma-iommu.h>
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 86daa19fcf24..29911eff9ceb 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -7,18 +7,17 @@
 #ifndef HOST1X_DRM_H
 #define HOST1X_DRM_H 1
 
-#include <uapi/drm/tegra_drm.h>
 #include <linux/host1x.h>
 #include <linux/iova.h>
 #include <linux/of_gpio.h>
 
-#include <drm/drmP.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_probe_helper.h>
+#include <uapi/drm/tegra_drm.h>
 
 #include "gem.h"
 #include "hub.h"
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 2fbfefe9cb42..a5d47e301c5f 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -5,22 +5,24 @@
 
 #include <linux/clk.h>
 #include <linux/debugfs.h>
+#include <linux/delay.h>
 #include <linux/host1x.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
-#include <linux/regulator/consumer.h>
+#include <video/mipi_display.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_file.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 
-#include <video/mipi_display.h>
-
 #include "dc.h"
 #include "drm.h"
 #include "dsi.h"
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 888ed0d74ccd..e34325c83d28 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -9,11 +9,13 @@
 
 #include <linux/console.h>
 
-#include "drm.h"
-#include "gem.h"
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modeset_helper.h>
 
+#include "drm.h"
+#include "gem.h"
+
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 static inline struct tegra_fbdev *to_tegra_fbdev(struct drm_fb_helper *helper)
 {
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 0a3d925d5284..fb7667c8dd4c 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -12,6 +12,9 @@
 
 #include <linux/dma-buf.h>
 #include <linux/iommu.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_prime.h>
 #include <drm/tegra_drm.h>
 
 #include "drm.h"
diff --git a/drivers/gpu/drm/tegra/gem.h b/drivers/gpu/drm/tegra/gem.h
index f1f758b25886..83ffb1e14ca3 100644
--- a/drivers/gpu/drm/tegra/gem.h
+++ b/drivers/gpu/drm/tegra/gem.h
@@ -11,7 +11,6 @@
 #include <linux/host1x.h>
 
 #include <drm/drm.h>
-#include <drm/drmP.h>
 #include <drm/drm_gem.h>
 
 #define TEGRA_BO_BOTTOM_UP (1 << 0)
diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 8dbfb30344e7..641299cc85b8 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/iommu.h>
+#include <linux/module.h>
 #include <linux/of_device.h>
 
 #include "drm.h"
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 334c4d7d238b..50269ffbcb6b 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -6,9 +6,11 @@
 
 #include <linux/clk.h>
 #include <linux/debugfs.h>
+#include <linux/delay.h>
 #include <linux/gpio.h>
 #include <linux/hdmi.h>
 #include <linux/math64.h>
+#include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -16,6 +18,9 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_file.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_probe_helper.h>
 
 #include "hda.h"
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 92f202ec0577..839b49c40e51 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/host1x.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -13,9 +14,9 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
-#include <drm/drmP.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_probe_helper.h>
 
 #include "drm.h"
diff --git a/drivers/gpu/drm/tegra/hub.h b/drivers/gpu/drm/tegra/hub.h
index 41541e261c91..767a60d9313c 100644
--- a/drivers/gpu/drm/tegra/hub.h
+++ b/drivers/gpu/drm/tegra/hub.h
@@ -6,7 +6,6 @@
 #ifndef TEGRA_HUB_H
 #define TEGRA_HUB_H 1
 
-#include <drm/drmP.h>
 #include <drm/drm_plane.h>
 
 #include "plane.h"
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index df80ca07e46e..6bab71d6e81d 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_plane_helper.h>
 
 #include "dc.h"
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 4ffe3794e6d3..e1669ada0a40 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -8,6 +8,7 @@
 #include <linux/debugfs.h>
 #include <linux/gpio.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -17,7 +18,9 @@
 #include <soc/tegra/pmc.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_debugfs.h>
 #include <drm/drm_dp_helper.h>
+#include <drm/drm_file.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_scdc_helper.h>
 
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 958548ef69e7..cd0399fd8c63 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/host1x.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
-- 
2.20.1


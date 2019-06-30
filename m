Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD3715AEA2
	for <lists+linux-tegra@lfdr.de>; Sun, 30 Jun 2019 07:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbfF3FVa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 30 Jun 2019 01:21:30 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46723 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfF3FV3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 30 Jun 2019 01:21:29 -0400
Received: by mail-lf1-f67.google.com with SMTP id z15so6515915lfh.13
        for <linux-tegra@vger.kernel.org>; Sat, 29 Jun 2019 22:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L7U3DctHkIQV4kklZ2cPuGz4FfGaj1NuNfRxS2griz4=;
        b=NKNyPmAPVUzj9Ovgr6om2t8Qv4BtRVQVWR/8nZ5D2IuQq2wC6oUvTNyJHvV57satac
         OLFP075azspIUyFJCvBMMqYu1Qls7S4Z+knWY045YqTk5qvl8eWxUFz4FXFaS6fg8m5b
         E8McNjKCFv0Q43GOkb+OLfqCB57dDqNz9emyzl1u2D1D1WM8gwfFuzQw7G1TbEaFcVoA
         fzA23pcJnc1y7fwfoPoGVcXWygkxQnED5RSXIX/Tw+F50LZjI8WRdOH/jqHa166S0RjK
         DbV09ibKehBOITqA5HNskBP+TMvVthLRm3lt18OtfnfrEBKEjxzE7vbVqxZJJP+epaEk
         JlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=L7U3DctHkIQV4kklZ2cPuGz4FfGaj1NuNfRxS2griz4=;
        b=VedXYiLo57i3N4igsa6y6o1sJme2m/GUicAmTWm5ARbg8kTvrjSh56y5wX2X0uWfOM
         OEWXI6Iz9pqo+syVfFZp7LYWiwXdRkzq24L3pdg2MoU1DX6RpRL3o9Ex/SMRjPnpiSSK
         ipP3Fsw/oB87U0fMQhdCvIdRoAPdOkxe5ZS4wW4Br/rxuFJjFmZb30ipnGWPzOlQ8mJU
         QcBvkwXkF2zAVM8Z0H4Q31RYd5zueuABnrMCOudNMZWxEwEt/V+YTklEA5QcnZRoZnCF
         L3htbBxRRIatGYrEuiEjJmCELopzxdH6SJ3ak7IF5Hi9jqf7rnBOBtLE4jv+TuFEDC7z
         xVVA==
X-Gm-Message-State: APjAAAVxYhgalRy5uXI/6Y17GDek6rWmU32gHXqjKz5D0Lf4HpaGZyAS
        7+guFA+S9/4ayfOCOBkJ0Vw=
X-Google-Smtp-Source: APXvYqxdiEfjltHa2rvK1YK4xWl2B+LHXk7pq6M/10cPEe+p5Y56gdiG5pTWgt94NR/N+DW8jwcmMA==
X-Received: by 2002:a19:d5:: with SMTP id 204mr9287214lfa.66.1561872086265;
        Sat, 29 Jun 2019 22:21:26 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i2sm2308413ljc.96.2019.06.29.22.21.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 29 Jun 2019 22:21:25 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1] drm/tegra: drop use of drmP.h
Date:   Sun, 30 Jun 2019 07:21:23 +0200
Message-Id: <20190630052123.6009-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
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
The patch is build tested using several configs and
several architectures (including arm, arm64, x86).

The patch is based on drm-misc.

If patch is OK, please apply to your tree
as this driver is maintained outside drm-misc.

I am happy to rebase on another tree, just let me know.

        Sam

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
index 079250c85733..4f08159817ca 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -9,23 +9,28 @@
 
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
index ee4180d8db14..8d9266fa464a 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -11,14 +11,15 @@
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
index 6dc326679915..ad0828b5672f 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -11,9 +11,17 @@
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
index 70154c253d45..e86fdbe0f704 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -10,18 +10,17 @@
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
index ee6ca8fa1c65..7461471a1738 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -8,22 +8,24 @@
 
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
index 57cc26e1da01..f323b2d17e3c 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -12,11 +12,13 @@
 
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
index fd5e9c3a2789..cb4ea2964b54 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -15,6 +15,9 @@
 
 #include <linux/dma-buf.h>
 #include <linux/iommu.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_prime.h>
 #include <drm/tegra_drm.h>
 
 #include "drm.h"
diff --git a/drivers/gpu/drm/tegra/gem.h b/drivers/gpu/drm/tegra/gem.h
index 85ebf83c7e43..964975d337c8 100644
--- a/drivers/gpu/drm/tegra/gem.h
+++ b/drivers/gpu/drm/tegra/gem.h
@@ -14,7 +14,6 @@
 #include <linux/host1x.h>
 
 #include <drm/drm.h>
-#include <drm/drmP.h>
 #include <drm/drm_gem.h>
 
 #define TEGRA_BO_BOTTOM_UP (1 << 0)
diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 673059fd2fcb..fba564d3a6d1 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/iommu.h>
+#include <linux/module.h>
 #include <linux/of_device.h>
 
 #include "drm.h"
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index d23c4bfde790..68165a0ac74f 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -9,9 +9,11 @@
 
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
@@ -19,6 +21,9 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_file.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_probe_helper.h>
 
 #include "hda.h"
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index b3436c2aed68..083071b07fe0 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/host1x.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -16,9 +17,9 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
-#include <drm/drmP.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_probe_helper.h>
 
 #include "drm.h"
diff --git a/drivers/gpu/drm/tegra/hub.h b/drivers/gpu/drm/tegra/hub.h
index 479087c0705a..b80f03fe485b 100644
--- a/drivers/gpu/drm/tegra/hub.h
+++ b/drivers/gpu/drm/tegra/hub.h
@@ -9,7 +9,6 @@
 #ifndef TEGRA_HUB_H
 #define TEGRA_HUB_H 1
 
-#include <drm/drmP.h>
 #include <drm/drm_plane.h>
 
 #include "plane.h"
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index d068e8aa3553..91ba2ea72e23 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -8,6 +8,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_plane_helper.h>
 
 #include "dc.h"
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 5be5a0817dfe..5eef4f5330e9 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -11,6 +11,7 @@
 #include <linux/debugfs.h>
 #include <linux/gpio.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -20,7 +21,9 @@
 #include <soc/tegra/pmc.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_debugfs.h>
 #include <drm/drm_dp_helper.h>
+#include <drm/drm_file.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_scdc_helper.h>
 
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 982ce37ecde1..bdb6d79ac9f1 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/host1x.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
-- 
2.20.1


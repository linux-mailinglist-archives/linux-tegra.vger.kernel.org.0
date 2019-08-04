Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEFBF80A21
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 11:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbfHDJmC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 05:42:02 -0400
Received: from mail-lf1-f45.google.com ([209.85.167.45]:40705 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfHDJmC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 05:42:02 -0400
Received: by mail-lf1-f45.google.com with SMTP id b17so55823678lff.7
        for <linux-tegra@vger.kernel.org>; Sun, 04 Aug 2019 02:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g8VFdl4NrmMqhYlVqhuuVpQOLXX+7zTYYJFix8/wDxU=;
        b=s/JCN7BSuSUN2KSb3VrDZf/1iFTScwSoxSSHV9rrv3SU0sZdZzoyR7c2J4OVRIs8KC
         BT74PvMP+wSV+vgUdLC3H7Rke8ja03kY+zwp18PRbV1h697+aoqn5gm5fTwy308A5BH0
         nQddSltVl4A5g/yVbfbqmptt6L25tnX5wzEadaydzmoIq78cxkamjIq2lOW9mcn5QMXD
         4MOk7CS5U0js06QJxYSR6J6sh2C8OR7YzOHegt0YXTrV+eIINuQJOZhAT/2o2CdMjolq
         lYxOFBQg3WZDzIIwXJaAuKuFC7AG3cn4Iv99QvrEKKcHmFB5aS3fRA4fyMVkssO6fQRl
         lhZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=g8VFdl4NrmMqhYlVqhuuVpQOLXX+7zTYYJFix8/wDxU=;
        b=Y6tUemda2srD6mc34xZB0N23YA/aAhT3hOVJ0BTc1ZZBisN1y9kxACEBDUvnFv8LKE
         1rjYGaSeW83WT13a665wzZPImqT2T+Pfc5aiBhOSFj9/oR9oEpb4xziO1K8e7oeBkzRl
         C9eKJptoZicxSxPHEJJVfzI9skx7vl0srB/ifFxsY04hIJt5aTtQtn3fKbGHGgNJcPU3
         +qxvDCNrTLSG06jjH20eWK0Zh/Y/tFocnGDBDzkBObEmt70iQSlowsA+8pkHpIN4E5cO
         VzoK2RDb3R3QPtjJImx0BOPK0F3JDqBYZjCoGadx2x6exK9EIjQCgO0PygJjujG+11Ig
         N4yw==
X-Gm-Message-State: APjAAAVPpAOUG5yQP7aYajt4rxFFufVt7uH5bO3e3AIpjdOZdPWXiJBF
        secZWODH4IFjGUq4MlR1qc0=
X-Google-Smtp-Source: APXvYqwPAzzhmYmR4+o9MiRMTw+v/jo8frl0yK0IlRNd2nEYzRI6WfSz2T/Mi3i2Bq4OeuJ/71FuRw==
X-Received: by 2002:a19:ca4b:: with SMTP id h11mr64873529lfj.162.1564911719187;
        Sun, 04 Aug 2019 02:41:59 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id 25sm16230194ljn.62.2019.08.04.02.41.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 02:41:58 -0700 (PDT)
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
Subject: [PATCH v2 4/4] drm/arm: drop use of drmP.h
Date:   Sun,  4 Aug 2019 11:41:32 +0200
Message-Id: <20190804094132.29463-5-sam@ravnborg.org>
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

While touching the list of include files divide them
into blocks and sort within each block.
Fix fallout.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: malidp@foss.arm.com
---
 drivers/gpu/drm/arm/hdlcd_crtc.c    | 12 +++++++-----
 drivers/gpu/drm/arm/hdlcd_drv.c     |  7 ++++++-
 drivers/gpu/drm/arm/malidp_crtc.c   | 11 +++++++----
 drivers/gpu/drm/arm/malidp_drv.c    |  8 +++++---
 drivers/gpu/drm/arm/malidp_drv.h    |  7 ++++---
 drivers/gpu/drm/arm/malidp_hw.c     |  7 ++++++-
 drivers/gpu/drm/arm/malidp_mw.c     |  5 +++--
 drivers/gpu/drm/arm/malidp_planes.c |  4 +++-
 8 files changed, 41 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index a3efa28436ea..af67fefed38d 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -9,7 +9,12 @@
  *  Implementation of a CRTC class for the HDLCD driver.
  */
 
-#include <drm/drmP.h>
+#include <linux/clk.h>
+#include <linux/of_graph.h>
+#include <linux/platform_data/simplefb.h>
+
+#include <video/videomode.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
@@ -19,10 +24,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <linux/clk.h>
-#include <linux/of_graph.h>
-#include <linux/platform_data/simplefb.h>
-#include <video/videomode.h>
+#include <drm/drm_vblank.h>
 
 #include "hdlcd_drv.h"
 #include "hdlcd_regs.h"
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 27c46a2838c5..2e053815b54a 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -14,21 +14,26 @@
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/console.h>
+#include <linux/dma-mapping.h>
 #include <linux/list.h>
 #include <linux/of_graph.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
-#include <drm/drmP.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_irq.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
 
 #include "hdlcd_drv.h"
 #include "hdlcd_regs.h"
diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
index db4451260fff..587d94798f5c 100644
--- a/drivers/gpu/drm/arm/malidp_crtc.c
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -6,14 +6,17 @@
  * ARM Mali DP500/DP550/DP650 driver (crtc operations)
  */
 
-#include <drm/drmP.h>
+#include <linux/clk.h>
+#include <linux/pm_runtime.h>
+
+#include <video/videomode.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <linux/clk.h>
-#include <linux/pm_runtime.h>
-#include <video/videomode.h>
+#include <drm/drm_vblank.h>
 
 #include "malidp_drv.h"
 #include "malidp_hw.h"
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index c27ff456eddc..333b88a5efb0 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -15,17 +15,19 @@
 #include <linux/pm_runtime.h>
 #include <linux/debugfs.h>
 
-#include <drm/drmP.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_probe_helper.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
 
 #include "malidp_drv.h"
 #include "malidp_mw.h"
diff --git a/drivers/gpu/drm/arm/malidp_drv.h b/drivers/gpu/drm/arm/malidp_drv.h
index 0a639af8337e..cdfddfabf2d1 100644
--- a/drivers/gpu/drm/arm/malidp_drv.h
+++ b/drivers/gpu/drm/arm/malidp_drv.h
@@ -9,12 +9,13 @@
 #ifndef __MALIDP_DRV_H__
 #define __MALIDP_DRV_H__
 
-#include <drm/drm_writeback.h>
-#include <drm/drm_encoder.h>
 #include <linux/mutex.h>
 #include <linux/wait.h>
 #include <linux/spinlock.h>
-#include <drm/drmP.h>
+
+#include <drm/drm_writeback.h>
+#include <drm/drm_encoder.h>
+
 #include "malidp_hw.h"
 
 #define MALIDP_CONFIG_VALID_INIT	0
diff --git a/drivers/gpu/drm/arm/malidp_hw.c b/drivers/gpu/drm/arm/malidp_hw.c
index 380be66d4c6e..bd8265f02e0b 100644
--- a/drivers/gpu/drm/arm/malidp_hw.c
+++ b/drivers/gpu/drm/arm/malidp_hw.c
@@ -9,12 +9,17 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/types.h>
 #include <linux/io.h>
-#include <drm/drmP.h>
+
 #include <video/videomode.h>
 #include <video/display_timing.h>
 
+#include <drm/drm_fourcc.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_print.h>
+
 #include "malidp_drv.h"
 #include "malidp_hw.h"
 #include "malidp_mw.h"
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 2e812525025d..22c0847986df 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -5,13 +5,14 @@
  *
  * ARM Mali DP Writeback connector implementation
  */
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_probe_helper.h>
 #include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drmP.h>
+#include <drm/drm_probe_helper.h>
 #include <drm/drm_writeback.h>
 
 #include "malidp_drv.h"
diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 488375bd133d..3c70a53813bf 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -7,11 +7,13 @@
  */
 
 #include <linux/iommu.h>
+#include <linux/platform_device.h>
 
-#include <drm/drmP.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane_helper.h>
-- 
2.20.1


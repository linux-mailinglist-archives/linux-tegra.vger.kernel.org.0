Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2E6B80A1F
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 11:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbfHDJmA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 05:42:00 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39291 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbfHDJmA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 05:42:00 -0400
Received: by mail-lj1-f194.google.com with SMTP id v18so76631135ljh.6
        for <linux-tegra@vger.kernel.org>; Sun, 04 Aug 2019 02:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=daZ+8GYd85VY52LllX4iDnTzgSTfoxzZTMIYWdMxynY=;
        b=Sq69kzi+Sw5HJNPo2qm9BeQDcaq0OZmHGtW21PlmcFzimDGky83ojQzYEJMl3+nc8C
         gXn3yF9ecQFUI5o46a3yiwEppJQZe5Sd/zvL2tFv2Fnrm/hVW6oeHqz/YGgalC7c4HdI
         +I+VLy+RCe+CMyv3wAP2JSnGBZ2+Yw+eROuTIFgAtVHB7sp7F7TUmDBqPC4WPq0WHhXk
         SGTDNFoFdu2j80/GNuBe82dgfxXtFKkhZm17TgTAwM9BnpIaXcXnGpA4i1t6YZJ+q91A
         jANng1FNlc0xSBQMwBK83dhyqVkXdjvEvhrBvS6/bDpkp++cLIzjcjBD6/d81ytC5xTn
         P2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=daZ+8GYd85VY52LllX4iDnTzgSTfoxzZTMIYWdMxynY=;
        b=JWtjSQr9xVxvJU8LIHuqdQYeOThxsVunA6VM28ii2BriasfTGF1ndgIf9AnFEKqgdm
         HSd4q5XT3qW9Tb4/LDSDwGfhUVgNuo7fVqkExgFDzn4Ho8ZwMkG9fm2yry5m0uKcvR3K
         mTBh74nsMsRWG9lb3RhOkELPT0UWwla85K96TNAiWM6Dv8YEic5pw+/set+qhehxPwDR
         JCx2+JwoF36jGhUG0Rtdj/bICUHudmRKkDpX9T9+2xQJbDjVy89qXq2zPxyJBEnsmpqS
         7muTr9bGVgN2pvl7NyW1IRjEcU1Y4/qxes6CxNPDeyDhw8kGIowha0SdRwEz4tH9TW4y
         E6JQ==
X-Gm-Message-State: APjAAAWfyBkw7uHNz5SUBAjeSOV3AsE16lF/Dr6ouiozm/HdAdLTDtlU
        CUpq8yU0pdM3TvMu6rzRd4M=
X-Google-Smtp-Source: APXvYqzrjtDqsUIQ3WsJJIafZtVasgNOrabKlG2C5Nxnq4bwi38Uxx7qPZ9SxZMCo+ShNgeItH4n0g==
X-Received: by 2002:a2e:a16c:: with SMTP id u12mr5408093ljl.59.1564911717144;
        Sun, 04 Aug 2019 02:41:57 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id 25sm16230194ljn.62.2019.08.04.02.41.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 02:41:56 -0700 (PDT)
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
Subject: [PATCH v2 3/4] drm/armada: drop use of drmP.h
Date:   Sun,  4 Aug 2019 11:41:31 +0200
Message-Id: <20190804094132.29463-4-sam@ravnborg.org>
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
While touching the list of include files group them and sort them.
Fix fallout from the header file removal.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/armada/armada_crtc.c    | 10 +++++++---
 drivers/gpu/drm/armada/armada_debugfs.c |  8 ++++++--
 drivers/gpu/drm/armada/armada_drm.h     |  5 ++++-
 drivers/gpu/drm/armada/armada_drv.c     |  8 ++++++++
 drivers/gpu/drm/armada/armada_fb.c      |  3 +++
 drivers/gpu/drm/armada/armada_fbdev.c   |  3 +++
 drivers/gpu/drm/armada/armada_gem.c     |  7 ++++++-
 drivers/gpu/drm/armada/armada_overlay.c |  8 +++++---
 drivers/gpu/drm/armada/armada_plane.c   |  4 +++-
 drivers/gpu/drm/armada/armada_trace.h   |  5 ++++-
 10 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index d44fca4e1655..c2b92acd1e9a 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -3,15 +3,19 @@
  * Copyright (C) 2012 Russell King
  *  Rewritten from the dovefb driver, and Armada510 manuals.
  */
+
 #include <linux/clk.h>
 #include <linux/component.h>
+#include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
-#include <drm/drmP.h>
+
 #include <drm/drm_atomic.h>
-#include <drm/drm_probe_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+
 #include "armada_crtc.h"
 #include "armada_drm.h"
 #include "armada_fb.h"
diff --git a/drivers/gpu/drm/armada/armada_debugfs.c b/drivers/gpu/drm/armada/armada_debugfs.c
index dc3716dbb2c0..c6fc2f1d58e9 100644
--- a/drivers/gpu/drm/armada/armada_debugfs.c
+++ b/drivers/gpu/drm/armada/armada_debugfs.c
@@ -3,11 +3,15 @@
  * Copyright (C) 2012 Russell King
  *  Rewritten from the dovefb driver, and Armada510 manuals.
  */
+
 #include <linux/ctype.h>
-#include <linux/debugfs.h>
 #include <linux/module.h>
 #include <linux/seq_file.h>
-#include <drm/drmP.h>
+#include <linux/uaccess.h>
+
+#include <drm/drm_debugfs.h>
+#include <drm/drm_file.h>
+
 #include "armada_crtc.h"
 #include "armada_drm.h"
 
diff --git a/drivers/gpu/drm/armada/armada_drm.h b/drivers/gpu/drm/armada/armada_drm.h
index c7794c8bdd90..a11bdaccbb33 100644
--- a/drivers/gpu/drm/armada/armada_drm.h
+++ b/drivers/gpu/drm/armada/armada_drm.h
@@ -8,11 +8,14 @@
 #include <linux/kfifo.h>
 #include <linux/io.h>
 #include <linux/workqueue.h>
-#include <drm/drmP.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_mm.h>
 
 struct armada_crtc;
 struct armada_gem_object;
 struct clk;
+struct drm_display_mode;
 struct drm_fb_helper;
 
 static inline void
diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 055c92bc88bf..197dca3fc84c 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -2,14 +2,22 @@
 /*
  * Copyright (C) 2012 Russell King
  */
+
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_prime.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_vblank.h>
+
 #include "armada_crtc.h"
 #include "armada_drm.h"
 #include "armada_gem.h"
diff --git a/drivers/gpu/drm/armada/armada_fb.c b/drivers/gpu/drm/armada/armada_fb.c
index de030cb0aa90..426ca383d696 100644
--- a/drivers/gpu/drm/armada/armada_fb.c
+++ b/drivers/gpu/drm/armada/armada_fb.c
@@ -2,9 +2,12 @@
 /*
  * Copyright (C) 2012 Russell King
  */
+
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+
 #include "armada_drm.h"
 #include "armada_fb.h"
 #include "armada_gem.h"
diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index 096aff530b01..090cc0d699ae 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -3,11 +3,14 @@
  * Copyright (C) 2012 Russell King
  *  Written from the i915 driver.
  */
+
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_fourcc.h>
+
 #include "armada_crtc.h"
 #include "armada_drm.h"
 #include "armada_fb.h"
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 60c509784fa3..93cf8b8bfcff 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -2,12 +2,17 @@
 /*
  * Copyright (C) 2012 Russell King
  */
+
 #include <linux/dma-buf.h>
 #include <linux/dma-mapping.h>
+#include <linux/mman.h>
 #include <linux/shmem_fs.h>
+
+#include <drm/armada_drm.h>
+#include <drm/drm_prime.h>
+
 #include "armada_drm.h"
 #include "armada_gem.h"
-#include <drm/armada_drm.h>
 #include "armada_ioctlP.h"
 
 static vm_fault_t armada_gem_vm_fault(struct vm_fault *vmf)
diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
index e8060216b389..07f0da4d9ba1 100644
--- a/drivers/gpu/drm/armada/armada_overlay.c
+++ b/drivers/gpu/drm/armada/armada_overlay.c
@@ -3,12 +3,14 @@
  * Copyright (C) 2012 Russell King
  *  Rewritten from the dovefb driver, and Armada510 manuals.
  */
-#include <drm/drmP.h>
+
+#include <drm/armada_drm.h>
 #include <drm/drm_atomic.h>
-#include <drm/drm_atomic_uapi.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_uapi.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_plane_helper.h>
-#include <drm/armada_drm.h>
+
 #include "armada_crtc.h"
 #include "armada_drm.h"
 #include "armada_fb.h"
diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
index f08b4f37816d..e7cc2b343bcb 100644
--- a/drivers/gpu/drm/armada/armada_plane.c
+++ b/drivers/gpu/drm/armada/armada_plane.c
@@ -3,10 +3,12 @@
  * Copyright (C) 2012 Russell King
  *  Rewritten from the dovefb driver, and Armada510 manuals.
  */
-#include <drm/drmP.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_plane_helper.h>
+
 #include "armada_crtc.h"
 #include "armada_drm.h"
 #include "armada_fb.h"
diff --git a/drivers/gpu/drm/armada/armada_trace.h b/drivers/gpu/drm/armada/armada_trace.h
index f03a56bda596..528f20fe3147 100644
--- a/drivers/gpu/drm/armada/armada_trace.h
+++ b/drivers/gpu/drm/armada/armada_trace.h
@@ -3,7 +3,10 @@
 #define ARMADA_TRACE_H
 
 #include <linux/tracepoint.h>
-#include <drm/drmP.h>
+
+struct drm_crtc;
+struct drm_framebuffer;
+struct drm_plane;
 
 #undef TRACE_SYSTEM
 #define TRACE_SYSTEM armada
-- 
2.20.1


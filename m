Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E94A1EB8D8
	for <lists+linux-tegra@lfdr.de>; Tue,  2 Jun 2020 11:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgFBJvy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 2 Jun 2020 05:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbgFBJvx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Jun 2020 05:51:53 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79752C061A0E
        for <linux-tegra@vger.kernel.org>; Tue,  2 Jun 2020 02:51:53 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l10so2691487wrr.10
        for <linux-tegra@vger.kernel.org>; Tue, 02 Jun 2020 02:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+TUQlURBiYUvX4eGj1cmnygFBEIqoBCMKPSr5vwFyYk=;
        b=i+OdYT4kLo1/b2shX9NxpycnXGOHsI3rZsaVnWOdzITJvXO5gFAWmpKtZqPyupqMFD
         M6ib1JemUVtn9Hw8BFc2WCjBh+qkBr4tpUAL/SjeWMQpnu98ZGSsOUVZMKTw6i8KRCMk
         92oJBMisxnekYBP5clqL/6nt91hi8i2nDOh50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+TUQlURBiYUvX4eGj1cmnygFBEIqoBCMKPSr5vwFyYk=;
        b=sghDVvptbUim2yLycSrjpUrfloxRpcGTjNiL8pjJX/hAmxvx1gDTXihwH1UH0X8Ayt
         4wVCphNNwY+OhTyYdANUQ2L/ar3f1pKADeLiC96sDsCCJrS1LtIuKQWLdBuTJSByJlRS
         4JZ5faMQM9m3bahaQGcIJm1p9OS2oscxjTn2HEGP+yZ6qLSnAPnXmQMlEYhTWg3KgqdX
         oIRlgepoUKOGJxVB7dX6Jki8gKmrs353sekEt3jU2lneVfEcyITCzNiMSaAdLoitq1LP
         J4G/Bjank7iast0uNlbmr2VyXBrb1LCrYuqj4tGSvUF44LVMjikZ8kTQywOXNYIvsNec
         om5Q==
X-Gm-Message-State: AOAM533RjfXd9z1BHZGsY9e803YEF8gu/8ZTfpxuNNYQv6hHIvY30bya
        d7F6yg+wMNJP4OL+zGU9/BTOMA==
X-Google-Smtp-Source: ABdhPJwGhsG45NVOnFfrcSqMCGUUP5Na6EQs7omzLU2JngUUImZOWaj0hrPPGW7fd1TjkTghzVGsVA==
X-Received: by 2002:a5d:4b85:: with SMTP id b5mr25214853wrt.8.1591091512202;
        Tue, 02 Jun 2020 02:51:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a6sm2996443wrn.38.2020.06.02.02.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 02:51:51 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Thierry Reding <treding@nvidia.com>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jsarha@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Brian Masney <masneyb@onstation.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        zhengbin <zhengbin13@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-tegra@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 1/3] drm/atomic-helper: reset vblank on crtc reset
Date:   Tue,  2 Jun 2020 11:51:38 +0200
Message-Id: <20200602095140.36678-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Only when vblanks are supported ofc.

Some drivers do this already, but most unfortunately missed it. This
opens up bugs after driver load, before the crtc is enabled for the
first time. syzbot spotted this when loading vkms as a secondary
output. Given how many drivers are buggy it's best to solve this once
and for all in shared helper code.

Aside from moving the few existing calls to drm_crtc_vblank_reset into
helpers (i915 doesn't use helpers, so keeps its own) I think the
regression risk is minimal: atomic helpers already rely on drivers
calling drm_crtc_vblank_on/off correctly in their hooks when they
support vblanks. And driver that's failing to handle vblanks after
this is missing those calls already, and vblanks could only work by
accident when enabling a CRTC for the first time right after boot.

Big thanks to Tetsuo for helping track down what's going wrong here.

There's only a few drivers which already had the necessary call and
needed some updating:
- komeda, atmel and tidss also needed to be changed to call
  __drm_atomic_helper_crtc_reset() intead of open coding it
- tegra and msm even had it in the same place already, just code
  motion, and malidp already uses __drm_atomic_helper_crtc_reset().

Only call left is in i915, which doesn't use drm_mode_config_reset,
but has its own fastboot infrastructure. So that's the only case where
we actually want this in the driver still.

I've also reviewed all other drivers which set up vblank support with
drm_vblank_init. After the previous patch fixing mxsfb all atomic
drivers do call drm_crtc_vblank_on/off as they should, the remaining
drivers are either legacy kms or legacy dri1 drivers, so not affected
by this change to atomic helpers.

v2: Use the drm_dev_has_vblank() helper.

v3: Laurent pointed out that omap and rcar-du used drm_crtc_vblank_off
instead of drm_crtc_vblank_reset. Adjust them too.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Link: https://syzkaller.appspot.com/bug?id=0ba17d70d062b2595e1f061231474800f076c7cb
Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Reported-by: syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Mihail Atanassov <mihail.atanassov@arm.com>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Brian Masney <masneyb@onstation.org>
Cc: Emil Velikov <emil.velikov@collabora.com>
Cc: zhengbin <zhengbin13@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 7 ++-----
 drivers/gpu/drm/arm/malidp_drv.c                 | 1 -
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c   | 7 ++-----
 drivers/gpu/drm/drm_atomic_state_helper.c        | 4 ++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c        | 2 --
 drivers/gpu/drm/omapdrm/omap_drv.c               | 3 ---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c           | 3 ---
 drivers/gpu/drm/tegra/dc.c                       | 1 -
 drivers/gpu/drm/tidss/tidss_crtc.c               | 3 +--
 drivers/gpu/drm/tidss/tidss_kms.c                | 4 ----
 10 files changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 56bd938961ee..f33418d6e1a0 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -492,10 +492,8 @@ static void komeda_crtc_reset(struct drm_crtc *crtc)
 	crtc->state = NULL;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (state) {
-		crtc->state = &state->base;
-		crtc->state->crtc = crtc;
-	}
+	if (state)
+		__drm_atomic_helper_crtc_reset(crtc, &state->base);
 }
 
 static struct drm_crtc_state *
@@ -616,7 +614,6 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
 		return err;
 
 	drm_crtc_helper_add(crtc, &komeda_crtc_helper_funcs);
-	drm_crtc_vblank_reset(crtc);
 
 	crtc->port = kcrtc->master->of_output_port;
 
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index c2507b7d8512..02904392e370 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -870,7 +870,6 @@ static int malidp_bind(struct device *dev)
 	drm->irq_enabled = true;
 
 	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
-	drm_crtc_vblank_reset(&malidp->crtc);
 	if (ret < 0) {
 		DRM_ERROR("failed to initialise vblank\n");
 		goto vblank_fail;
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 10985134ce0b..ce246b96330b 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -411,10 +411,8 @@ static void atmel_hlcdc_crtc_reset(struct drm_crtc *crtc)
 	}
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (state) {
-		crtc->state = &state->base;
-		crtc->state->crtc = crtc;
-	}
+	if (state)
+		__drm_atomic_helper_crtc_reset(crtc, &state->base);
 }
 
 static struct drm_crtc_state *
@@ -528,7 +526,6 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
 	}
 
 	drm_crtc_helper_add(&crtc->base, &lcdc_crtc_helper_funcs);
-	drm_crtc_vblank_reset(&crtc->base);
 
 	drm_mode_crtc_set_gamma_size(&crtc->base, ATMEL_HLCDC_CLUT_SIZE);
 	drm_crtc_enable_color_mgmt(&crtc->base, 0, false,
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 8fce6a115dfe..9ad74045158e 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -32,6 +32,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_print.h>
+#include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
 
 #include <linux/slab.h>
@@ -93,6 +94,9 @@ __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
 	if (crtc_state)
 		__drm_atomic_helper_crtc_state_reset(crtc_state, crtc);
 
+	if (drm_dev_has_vblank(crtc->dev))
+		drm_crtc_vblank_reset(crtc);
+
 	crtc->state = crtc_state;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_reset);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index ca3368c828d0..9606185c284b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -1117,8 +1117,6 @@ static void mdp5_crtc_reset(struct drm_crtc *crtc)
 		mdp5_crtc_destroy_state(crtc, crtc->state);
 
 	__drm_atomic_helper_crtc_reset(crtc, &mdp5_cstate->base);
-
-	drm_crtc_vblank_reset(crtc);
 }
 
 static const struct drm_crtc_funcs mdp5_crtc_funcs = {
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 242d28281784..7a7066cded79 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -642,9 +642,6 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 		goto err_cleanup_modeset;
 	}
 
-	for (i = 0; i < priv->num_pipes; i++)
-		drm_crtc_vblank_off(priv->pipes[i].crtc);
-
 	omap_fbdev_init(ddev);
 
 	drm_kms_helper_poll_init(ddev);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index d73e88ddecd0..e2959e32fd19 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -1271,9 +1271,6 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 
 	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
 
-	/* Start with vertical blanking interrupt reporting disabled. */
-	drm_crtc_vblank_off(crtc);
-
 	/* Register the interrupt handler. */
 	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CRTC_IRQ_CLOCK)) {
 		/* The IRQ's are associated with the CRTC (sw)index. */
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 83f31c6e891c..9b308b572eac 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1168,7 +1168,6 @@ static void tegra_crtc_reset(struct drm_crtc *crtc)
 		tegra_crtc_atomic_destroy_state(crtc, crtc->state);
 
 	__drm_atomic_helper_crtc_reset(crtc, &state->base);
-	drm_crtc_vblank_reset(crtc);
 }
 
 static struct drm_crtc_state *
diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 89a226912de8..4d01c4af61cd 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -352,8 +352,7 @@ static void tidss_crtc_reset(struct drm_crtc *crtc)
 		return;
 	}
 
-	crtc->state = &tcrtc->base;
-	crtc->state->crtc = crtc;
+	__drm_atomic_helper_crtc_reset(crtc, &tcrtc->base);
 }
 
 static struct drm_crtc_state *tidss_crtc_duplicate_state(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 4b99e9fa84a5..e6ab59eed259 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -278,10 +278,6 @@ int tidss_modeset_init(struct tidss_device *tidss)
 	if (ret)
 		return ret;
 
-	/* Start with vertical blanking interrupt reporting disabled. */
-	for (i = 0; i < tidss->num_crtcs; ++i)
-		drm_crtc_vblank_reset(tidss->crtcs[i]);
-
 	drm_mode_config_reset(ddev);
 
 	dev_dbg(tidss->dev, "%s done\n", __func__);
-- 
2.26.2


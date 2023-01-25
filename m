Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03BE367BBBD
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Jan 2023 21:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236206AbjAYUE0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 25 Jan 2023 15:04:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234913AbjAYUEW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Jan 2023 15:04:22 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A17627D5F;
        Wed, 25 Jan 2023 12:04:20 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id B4D9421C4B;
        Wed, 25 Jan 2023 20:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674677058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7QAifpOjA13mngg9Yw0DhW101en3ZGhx9YvaI9c+EPQ=;
        b=HhqBGeDnUhRxh3xPggf8vMw9HOAb3DGx5rPqyh+P1XSZoslAhFlnmDlrMTJE7/xQO7pcBy
        KjCSHxmuBO6wsPEz/rQVSJFHlW1zPJdcJdfiHVq/Rnq3A5l9KUKIyHvNb994u/bxhoCB9U
        5QG2oz6K8WnNRkChyySVo72EvsAnZ70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674677058;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7QAifpOjA13mngg9Yw0DhW101en3ZGhx9YvaI9c+EPQ=;
        b=uh7ifza6aWcdK2yKw2PTuWPw76L0WWoO6T9du565ZKNlD8COJ50Hkpahowf1LRr8+8Wceg
        f7GP+FhrSoNAvBBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 739361339E;
        Wed, 25 Jan 2023 20:04:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id iFphG0KL0WMDeAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 25 Jan 2023 20:04:18 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 06/10] drm/fb-helper: Initialize fb-helper's preferred BPP in prepare function
Date:   Wed, 25 Jan 2023 21:04:11 +0100
Message-Id: <20230125200415.14123-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125200415.14123-1-tzimmermann@suse.de>
References: <20230125200415.14123-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Initialize the fb-helper's preferred_bpp field early from within
drm_fb_helper_prepare(); instead of the later client hot-plugging
callback. This simplifies the generic fbdev setup function.

No real changes, but all drivers' fbdev code has to be adapted.

v3:
	* build with CONFIG_DRM_FBDEV_EMULATION unset (kernel test bot)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/armada/armada_fbdev.c      |  4 ++--
 drivers/gpu/drm/drm_fb_helper.c            | 22 ++++++++++++++++++----
 drivers/gpu/drm/drm_fbdev_generic.c        | 19 ++-----------------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  4 ++--
 drivers/gpu/drm/gma500/framebuffer.c       |  4 ++--
 drivers/gpu/drm/i915/display/intel_fbdev.c | 11 ++++++-----
 drivers/gpu/drm/msm/msm_fbdev.c            |  4 ++--
 drivers/gpu/drm/omapdrm/omap_fbdev.c       |  4 ++--
 drivers/gpu/drm/radeon/radeon_fb.c         |  4 ++--
 drivers/gpu/drm/tegra/fb.c                 |  7 +++----
 include/drm/drm_fb_helper.h                | 11 ++++++-----
 11 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index 584cee123bd8..07e410c62b7a 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -129,7 +129,7 @@ int armada_fbdev_init(struct drm_device *dev)
 
 	priv->fbdev = fbh;
 
-	drm_fb_helper_prepare(dev, fbh, &armada_fb_helper_funcs);
+	drm_fb_helper_prepare(dev, fbh, 32, &armada_fb_helper_funcs);
 
 	ret = drm_fb_helper_init(dev, fbh);
 	if (ret) {
@@ -137,7 +137,7 @@ int armada_fbdev_init(struct drm_device *dev)
 		goto err_fb_helper;
 	}
 
-	ret = drm_fb_helper_initial_config(fbh, 32);
+	ret = drm_fb_helper_initial_config(fbh);
 	if (ret) {
 		DRM_ERROR("failed to set initial config\n");
 		goto err_fb_setup;
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 258103d317ac..28c428e9c530 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -416,14 +416,30 @@ static void drm_fb_helper_damage_work(struct work_struct *work)
  * drm_fb_helper_prepare - setup a drm_fb_helper structure
  * @dev: DRM device
  * @helper: driver-allocated fbdev helper structure to set up
+ * @preferred_bpp: Preferred bits per pixel for the device.
  * @funcs: pointer to structure of functions associate with this helper
  *
  * Sets up the bare minimum to make the framebuffer helper usable. This is
  * useful to implement race-free initialization of the polling helpers.
  */
 void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
+			   unsigned int preferred_bpp,
 			   const struct drm_fb_helper_funcs *funcs)
 {
+	/*
+	 * Pick a preferred bpp of 32 if no value has been given. This
+	 * will select XRGB8888 for the framebuffer formats. All drivers
+	 * have to support XRGB8888 for backwards compatibility with legacy
+	 * userspace, so it's the safe choice here.
+	 *
+	 * TODO: Replace struct drm_mode_config.preferred_depth and this
+	 *       bpp value with a preferred format that is given as struct
+	 *       drm_format_info. Then derive all other values from the
+	 *       format.
+	 */
+	if (!preferred_bpp)
+		preferred_bpp = 32;
+
 	INIT_LIST_HEAD(&helper->kernel_fb_list);
 	spin_lock_init(&helper->damage_lock);
 	INIT_WORK(&helper->resume_work, drm_fb_helper_resume_worker);
@@ -432,6 +448,7 @@ void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
 	mutex_init(&helper->lock);
 	helper->funcs = funcs;
 	helper->dev = dev;
+	helper->preferred_bpp = preferred_bpp;
 }
 EXPORT_SYMBOL(drm_fb_helper_prepare);
 
@@ -2183,7 +2200,6 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
 /**
  * drm_fb_helper_initial_config - setup a sane initial connector configuration
  * @fb_helper: fb_helper device struct
- * @bpp_sel: bpp value to use for the framebuffer configuration
  *
  * Scans the CRTCs and connectors and tries to put together an initial setup.
  * At the moment, this is a cloned configuration across all heads with
@@ -2221,15 +2237,13 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
  * RETURNS:
  * Zero if everything went ok, nonzero otherwise.
  */
-int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper, int bpp_sel)
+int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper)
 {
 	int ret;
 
 	if (!drm_fbdev_emulation)
 		return 0;
 
-	fb_helper->preferred_bpp = bpp_sel;
-
 	mutex_lock(&fb_helper->lock);
 	ret = __drm_fb_helper_initial_config_and_unlock(fb_helper);
 
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 63f66325a8a5..6ae014040df3 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -392,7 +392,7 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
 	if (!drm_drv_uses_atomic_modeset(dev))
 		drm_helper_disable_unused_functions(dev);
 
-	ret = drm_fb_helper_initial_config(fb_helper, fb_helper->preferred_bpp);
+	ret = drm_fb_helper_initial_config(fb_helper);
 	if (ret)
 		goto err_cleanup;
 
@@ -454,7 +454,7 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
 	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
 	if (!fb_helper)
 		return;
-	drm_fb_helper_prepare(dev, fb_helper, &drm_fb_helper_generic_funcs);
+	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fb_helper_generic_funcs);
 
 	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_client_funcs);
 	if (ret) {
@@ -462,21 +462,6 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
 		goto err_drm_client_init;
 	}
 
-	/*
-	 * Pick a preferred bpp of 32 if no value has been given. This
-	 * will select XRGB8888 for the framebuffer formats. All drivers
-	 * have to support XRGB8888 for backwards compatibility with legacy
-	 * userspace, so it's the safe choice here.
-	 *
-	 * TODO: Replace struct drm_mode_config.preferred_depth and this
-	 *       bpp value with a preferred format that is given as struct
-	 *       drm_format_info. Then derive all other values from the
-	 *       format.
-	 */
-	if (!preferred_bpp)
-		preferred_bpp = 32;
-	fb_helper->preferred_bpp = preferred_bpp;
-
 	ret = drm_fbdev_client_hotplug(&fb_helper->client);
 	if (ret)
 		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 55c92372fca0..b89e33af8da8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -163,7 +163,7 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
 
 	private->fb_helper = helper = &fbdev->drm_fb_helper;
 
-	drm_fb_helper_prepare(dev, helper, &exynos_drm_fb_helper_funcs);
+	drm_fb_helper_prepare(dev, helper, PREFERRED_BPP, &exynos_drm_fb_helper_funcs);
 
 	ret = drm_fb_helper_init(dev, helper);
 	if (ret < 0) {
@@ -172,7 +172,7 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
 		goto err_init;
 	}
 
-	ret = drm_fb_helper_initial_config(helper, PREFERRED_BPP);
+	ret = drm_fb_helper_initial_config(helper);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev->dev,
 			      "failed to set up hw configuration.\n");
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 52ae3ade9a61..1f04c07ee180 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -409,7 +409,7 @@ int psb_fbdev_init(struct drm_device *dev)
 
 	dev_priv->fb_helper = fb_helper;
 
-	drm_fb_helper_prepare(dev, fb_helper, &psb_fb_helper_funcs);
+	drm_fb_helper_prepare(dev, fb_helper, 32, &psb_fb_helper_funcs);
 
 	ret = drm_fb_helper_init(dev, fb_helper);
 	if (ret)
@@ -418,7 +418,7 @@ int psb_fbdev_init(struct drm_device *dev)
 	/* disable all the possible outputs/crtcs before entering KMS mode */
 	drm_helper_disable_unused_functions(dev);
 
-	ret = drm_fb_helper_initial_config(fb_helper, 32);
+	ret = drm_fb_helper_initial_config(fb_helper);
 	if (ret)
 		goto fini;
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 19f3b5d92a55..ed197db5861d 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -520,10 +520,12 @@ int intel_fbdev_init(struct drm_device *dev)
 		return -ENOMEM;
 
 	mutex_init(&ifbdev->hpd_lock);
-	drm_fb_helper_prepare(dev, &ifbdev->helper, &intel_fb_helper_funcs);
+	drm_fb_helper_prepare(dev, &ifbdev->helper, 32, &intel_fb_helper_funcs);
 
-	if (!intel_fbdev_init_bios(dev, ifbdev))
-		ifbdev->preferred_bpp = 32;
+	if (intel_fbdev_init_bios(dev, ifbdev))
+		ifbdev->helper.preferred_bpp = ifbdev->preferred_bpp;
+	else
+		ifbdev->preferred_bpp = ifbdev->helper.preferred_bpp;
 
 	ret = drm_fb_helper_init(dev, &ifbdev->helper);
 	if (ret) {
@@ -542,8 +544,7 @@ static void intel_fbdev_initial_config(void *data, async_cookie_t cookie)
 	struct intel_fbdev *ifbdev = data;
 
 	/* Due to peculiar init order wrt to hpd handling this is separate. */
-	if (drm_fb_helper_initial_config(&ifbdev->helper,
-					 ifbdev->preferred_bpp))
+	if (drm_fb_helper_initial_config(&ifbdev->helper))
 		intel_fbdev_unregister(to_i915(ifbdev->helper.dev));
 }
 
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 31e1e30cb52a..915b213f3a5c 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -146,7 +146,7 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 
 	helper = &fbdev->base;
 
-	drm_fb_helper_prepare(dev, helper, &msm_fb_helper_funcs);
+	drm_fb_helper_prepare(dev, helper, 32, &msm_fb_helper_funcs);
 
 	ret = drm_fb_helper_init(dev, helper);
 	if (ret) {
@@ -159,7 +159,7 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 	if (ret)
 		goto fini;
 
-	ret = drm_fb_helper_initial_config(helper, 32);
+	ret = drm_fb_helper_initial_config(helper);
 	if (ret)
 		goto fini;
 
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 98d8758048fc..fc5f52d567c6 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -239,13 +239,13 @@ void omap_fbdev_init(struct drm_device *dev)
 
 	helper = &fbdev->base;
 
-	drm_fb_helper_prepare(dev, helper, &omap_fb_helper_funcs);
+	drm_fb_helper_prepare(dev, helper, 32, &omap_fb_helper_funcs);
 
 	ret = drm_fb_helper_init(dev, helper);
 	if (ret)
 		goto fail;
 
-	ret = drm_fb_helper_initial_config(helper, 32);
+	ret = drm_fb_helper_initial_config(helper);
 	if (ret)
 		goto fini;
 
diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index fe4087bfdb3c..6e5eed0e157c 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -348,7 +348,7 @@ int radeon_fbdev_init(struct radeon_device *rdev)
 	rfbdev->rdev = rdev;
 	rdev->mode_info.rfbdev = rfbdev;
 
-	drm_fb_helper_prepare(rdev->ddev, &rfbdev->helper,
+	drm_fb_helper_prepare(rdev->ddev, &rfbdev->helper, bpp_sel,
 			      &radeon_fb_helper_funcs);
 
 	ret = drm_fb_helper_init(rdev->ddev, &rfbdev->helper);
@@ -358,7 +358,7 @@ int radeon_fbdev_init(struct radeon_device *rdev)
 	/* disable all the possible outputs/crtcs before entering KMS mode */
 	drm_helper_disable_unused_functions(rdev->ddev);
 
-	ret = drm_fb_helper_initial_config(&rfbdev->helper, bpp_sel);
+	ret = drm_fb_helper_initial_config(&rfbdev->helper);
 	if (ret)
 		goto fini;
 
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index a900300ae5bd..153c39c32c71 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -308,7 +308,7 @@ static struct tegra_fbdev *tegra_fbdev_create(struct drm_device *drm)
 		return ERR_PTR(-ENOMEM);
 	}
 
-	drm_fb_helper_prepare(drm, &fbdev->base, &tegra_fb_helper_funcs);
+	drm_fb_helper_prepare(drm, &fbdev->base, 32, &tegra_fb_helper_funcs);
 
 	return fbdev;
 }
@@ -319,7 +319,6 @@ static void tegra_fbdev_free(struct tegra_fbdev *fbdev)
 }
 
 static int tegra_fbdev_init(struct tegra_fbdev *fbdev,
-			    unsigned int preferred_bpp,
 			    unsigned int num_crtc,
 			    unsigned int max_connectors)
 {
@@ -333,7 +332,7 @@ static int tegra_fbdev_init(struct tegra_fbdev *fbdev,
 		return err;
 	}
 
-	err = drm_fb_helper_initial_config(&fbdev->base, preferred_bpp);
+	err = drm_fb_helper_initial_config(&fbdev->base);
 	if (err < 0) {
 		dev_err(drm->dev, "failed to set initial configuration: %d\n",
 			err);
@@ -396,7 +395,7 @@ int tegra_drm_fb_init(struct drm_device *drm)
 	struct tegra_drm *tegra = drm->dev_private;
 	int err;
 
-	err = tegra_fbdev_init(tegra->fbdev, 32, drm->mode_config.num_crtc,
+	err = tegra_fbdev_init(tegra->fbdev, drm->mode_config.num_crtc,
 			       drm->mode_config.num_connector);
 	if (err < 0)
 		return err;
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 39710c570a04..93bc8f29f5a4 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -229,6 +229,7 @@ drm_fb_helper_from_client(struct drm_client_dev *client)
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
+			   unsigned int preferred_bpp,
 			   const struct drm_fb_helper_funcs *funcs);
 void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helper);
 int drm_fb_helper_init(struct drm_device *dev, struct drm_fb_helper *helper);
@@ -284,7 +285,7 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
 			unsigned long arg);
 
 int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper);
-int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper, int bpp_sel);
+int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper);
 int drm_fb_helper_debug_enter(struct fb_info *info);
 int drm_fb_helper_debug_leave(struct fb_info *info);
 
@@ -292,8 +293,9 @@ void drm_fb_helper_lastclose(struct drm_device *dev);
 void drm_fb_helper_output_poll_changed(struct drm_device *dev);
 #else
 static inline void drm_fb_helper_prepare(struct drm_device *dev,
-					struct drm_fb_helper *helper,
-					const struct drm_fb_helper_funcs *funcs)
+					 struct drm_fb_helper *helper,
+					 unsigned int preferred_bpp,
+					 const struct drm_fb_helper_funcs *funcs)
 {
 }
 
@@ -455,8 +457,7 @@ static inline int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 	return 0;
 }
 
-static inline int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper,
-					       int bpp_sel)
+static inline int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper)
 {
 	return 0;
 }
-- 
2.39.0


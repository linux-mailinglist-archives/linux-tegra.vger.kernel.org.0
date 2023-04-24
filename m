Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 232EC6CFE72
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Mar 2023 10:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjC3IgU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 30 Mar 2023 04:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbjC3IgN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Mar 2023 04:36:13 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD26D59FC
        for <linux-tegra@vger.kernel.org>; Thu, 30 Mar 2023 01:36:10 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 5D2E01FE40;
        Thu, 30 Mar 2023 08:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680165369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/EU6h6Dsiu+n+4OWK8LFmV2yPf0DZhExmmr6TalEWRk=;
        b=lv3ArszGRKZGO7wx6myTMuf463ZoH3mpH/xnRRe6T0QJ5KgIitsNUZG29t3mnt9kJoaonO
        lRhpCDzPbIK/wEpBvg0DF1V6c9YKjuLtrNjZj4F+MrzhcnQ8aHVZtUvaJsXaD4yiyTCgAU
        uVvvD5Na4k/bmDfR/+zuqKSdsWjXHgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680165369;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/EU6h6Dsiu+n+4OWK8LFmV2yPf0DZhExmmr6TalEWRk=;
        b=XdpmRVM1h5Bm5KuU8IWvwNruwE93bQi+I9M9wMnLTuQeeJ2AjUYOU/ubYccBk62bA1oxaB
        1yhZU9jf1jRMZaDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2CFBC1390D;
        Thu, 30 Mar 2023 08:36:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ENH7CflJJWQHHAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 08:36:09 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/7] drm/tegra: Removed fb from struct tegra_fbdev
Date:   Thu, 30 Mar 2023 10:36:03 +0200
Message-Id: <20230330083607.12834-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330083607.12834-1-tzimmermann@suse.de>
References: <20230330083607.12834-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fbdev's struct fb_helper stores a pointer to the framebuffer. Remove
struct tegra_fbdev.fb, which contains the same value. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tegra/drm.h |  1 -
 drivers/gpu/drm/tegra/fb.c  | 23 ++++++++++++-----------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 845e60f144c7..8f8e5cda78da 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -32,7 +32,6 @@ struct reset_control;
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 struct tegra_fbdev {
 	struct drm_fb_helper base;
-	struct drm_framebuffer *fb;
 };
 #endif
 
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index bfebe2786d61..1ee4771b77d3 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -217,7 +217,6 @@ static const struct fb_ops tegra_fb_ops = {
 static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 			     struct drm_fb_helper_surface_size *sizes)
 {
-	struct tegra_fbdev *fbdev = to_tegra_fbdev(helper);
 	struct tegra_drm *tegra = helper->dev->dev_private;
 	struct drm_device *drm = helper->dev;
 	struct drm_mode_fb_cmd2 cmd = { 0 };
@@ -252,16 +251,15 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 		return PTR_ERR(info);
 	}
 
-	fbdev->fb = tegra_fb_alloc(drm, &cmd, &bo, 1);
-	if (IS_ERR(fbdev->fb)) {
-		err = PTR_ERR(fbdev->fb);
+	fb = tegra_fb_alloc(drm, &cmd, &bo, 1);
+	if (IS_ERR(fb)) {
+		err = PTR_ERR(fb);
 		dev_err(drm->dev, "failed to allocate DRM framebuffer: %d\n",
 			err);
 		drm_gem_object_put(&bo->gem);
-		return PTR_ERR(fbdev->fb);
+		return PTR_ERR(fb);
 	}
 
-	fb = fbdev->fb;
 	helper->fb = fb;
 	helper->info = info;
 
@@ -349,10 +347,13 @@ static int tegra_fbdev_init(struct tegra_fbdev *fbdev,
 
 static void tegra_fbdev_exit(struct tegra_fbdev *fbdev)
 {
-	drm_fb_helper_unregister_info(&fbdev->base);
+	struct drm_fb_helper *helper = &fbdev->base;
+	struct drm_framebuffer *fb = helper->fb;
 
-	if (fbdev->fb) {
-		struct tegra_bo *bo = tegra_fb_get_plane(fbdev->fb, 0);
+	drm_fb_helper_unregister_info(helper);
+
+	if (fb) {
+		struct tegra_bo *bo = tegra_fb_get_plane(fb, 0);
 
 		/* Undo the special mapping we made in fbdev probe. */
 		if (bo && bo->pages) {
@@ -360,10 +361,10 @@ static void tegra_fbdev_exit(struct tegra_fbdev *fbdev)
 			bo->vaddr = NULL;
 		}
 
-		drm_framebuffer_remove(fbdev->fb);
+		drm_framebuffer_remove(fb);
 	}
 
-	drm_fb_helper_fini(&fbdev->base);
+	drm_fb_helper_fini(helper);
 	tegra_fbdev_free(fbdev);
 }
 #endif
-- 
2.40.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6450C749C93
	for <lists+linux-tegra@lfdr.de>; Thu,  6 Jul 2023 14:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbjGFMuF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 6 Jul 2023 08:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232509AbjGFMt5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Jul 2023 08:49:57 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 187761FE9;
        Thu,  6 Jul 2023 05:49:37 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 91E422293B;
        Thu,  6 Jul 2023 12:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1688647749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rQb6IlG62XQo7ECKPZHeGs/kIp3cTj1XvxOVONelJVM=;
        b=XXyQO1r/oD0Gh0XUdYz+U+gz85uLqLFXL03MwkFp50tOFXs8i5coudsdv4Nt0Mc4Eo17t5
        pB8iRay+nnHv7XZzkzK6J5kZ7vW8PudikbFwrQAVSX8R9ufyhxMWslzrHLxSh1p1RMJ9L+
        jPswOesbieib183KG3Ral1DNsaEyO8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1688647749;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rQb6IlG62XQo7ECKPZHeGs/kIp3cTj1XvxOVONelJVM=;
        b=9tTAQk3bIAhHElprALzXZ726ggQd5qsc1YPG1O3Np/weCPKmMdrJME9h/Nm7od6TwqakF2
        hZdw9oY8kv4q2iBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 578A11390F;
        Thu,  6 Jul 2023 12:49:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id GCJSFEW4pmS7QgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 12:49:09 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 08/11] drm/omapdrm: Use GEM mmap for fbdev emulation
Date:   Thu,  6 Jul 2023 14:46:46 +0200
Message-ID: <20230706124905.15134-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706124905.15134-1-tzimmermann@suse.de>
References: <20230706124905.15134-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The fbdev emulation currently uses fbdev's default mmap code, which
has been written for I/O memory. Provide an mmap that uses GEM's mmap
infrastructure.

Utilize fine-grained fbdev macros to initialize struct fb_ops. The
macros set the read/write and the draw callbacks for DMA memory. Set
the fb_mmap callback to omapdrm's new mmap helper. Also select the
correct Kconfig token for fbdev's DMA helpers. Note that the DMA
helpers are the same as for system memory.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/Kconfig      |  2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 15 +++++++++++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index b4ac76c9f31b..d3c4877e465c 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -4,7 +4,7 @@ config DRM_OMAP
 	depends on DRM && OF
 	depends on ARCH_OMAP2PLUS
 	select DRM_KMS_HELPER
-	select FB_SYS_HELPERS if DRM_FBDEV_EMULATION
+	select FB_DMA_HELPERS if DRM_FBDEV_EMULATION
 	select VIDEOMODE_HELPERS
 	select HDMI
 	default n
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index b7ccce0704a3..b1a2d00ef52d 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -76,6 +76,15 @@ static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
 	return drm_fb_helper_pan_display(var, fbi);
 }
 
+static int omap_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
+{
+	struct drm_fb_helper *helper = info->par;
+	struct drm_framebuffer *fb = helper->fb;
+	struct drm_gem_object *bo = drm_gem_fb_get_obj(fb, 0);
+
+	return drm_gem_mmap_obj(bo, omap_gem_mmap_size(bo), vma);
+}
+
 static void omap_fbdev_fb_destroy(struct fb_info *info)
 {
 	struct drm_fb_helper *helper = info->par;
@@ -97,14 +106,16 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
 
 static const struct fb_ops omap_fb_ops = {
 	.owner = THIS_MODULE,
-	FB_DEFAULT_SYS_OPS,
+	__FB_DEFAULT_DMA_OPS_RDWR,
 	.fb_check_var	= drm_fb_helper_check_var,
 	.fb_set_par	= drm_fb_helper_set_par,
 	.fb_setcmap	= drm_fb_helper_setcmap,
 	.fb_blank	= drm_fb_helper_blank,
 	.fb_pan_display = omap_fbdev_pan_display,
+	__FB_DEFAULT_DMA_OPS_DRAW,
 	.fb_ioctl	= drm_fb_helper_ioctl,
-	.fb_destroy = omap_fbdev_fb_destroy,
+	.fb_mmap	= omap_fbdev_fb_mmap,
+	.fb_destroy	= omap_fbdev_fb_destroy,
 };
 
 static int omap_fbdev_create(struct drm_fb_helper *helper,
-- 
2.41.0


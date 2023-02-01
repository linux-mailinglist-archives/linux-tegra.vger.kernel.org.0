Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 551C2679977
	for <lists+linux-tegra@lfdr.de>; Tue, 24 Jan 2023 14:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234248AbjAXNkT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 24 Jan 2023 08:40:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234235AbjAXNkQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 08:40:16 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E853754A;
        Tue, 24 Jan 2023 05:40:15 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 5A73D1FE1E;
        Tue, 24 Jan 2023 13:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674567614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9gqTaZqFS9HwS2jeW+cjkUFXSUCIBmBtuf7BCu1wnbY=;
        b=HUewnAbn1RLyKfA/iHKoEXxS1Myeva8cXFf5CydhgdDqEs183LCCFvGWqfoaazy5iCEoRV
        /7r0D5MsHqNZtpG1Z50yOEBC4SLv/T7BDezeZKZO/lLB9UWbr8DE1IaETIZhzzMq2iHJRx
        0bwLc+0rsSFz+l2wPktb3fogcICSYiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674567614;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9gqTaZqFS9HwS2jeW+cjkUFXSUCIBmBtuf7BCu1wnbY=;
        b=ZjE8eRmjxS/tHvlbj5qstTSBdHOD1TL3wMGknGORmwkfEGtAqrnHb9k1W4rE/gPi2itC6F
        FBQ9Z3j89xX3GiBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 15F71139FF;
        Tue, 24 Jan 2023 13:40:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id +BJpBL7fz2PWZgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 24 Jan 2023 13:40:14 +0000
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
Subject: [PATCH v2 09/10] drm/fbdev-generic: Inline clean-up helpers into drm_fbdev_fb_destroy()
Date:   Tue, 24 Jan 2023 14:40:09 +0100
Message-Id: <20230124134010.30263-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124134010.30263-1-tzimmermann@suse.de>
References: <20230124134010.30263-1-tzimmermann@suse.de>
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

The fbdev framebuffer cleanup in drm_fbdev_fb_destroy() calls
drm_fbdev_release() and drm_fbdev_cleanup(). Inline both into the
caller. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fbdev_generic.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 9fe37903e3eb..13b31a95d434 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -43,8 +43,9 @@ static int drm_fbdev_fb_release(struct fb_info *info, int user)
 	return 0;
 }
 
-static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
+static void drm_fbdev_fb_destroy(struct fb_info *info)
 {
+	struct drm_fb_helper *fb_helper = info->par;
 	struct fb_info *fbi = fb_helper->info;
 	void *shadow = NULL;
 
@@ -64,24 +65,10 @@ static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
 		drm_client_buffer_vunmap(fb_helper->buffer);
 
 	drm_client_framebuffer_delete(fb_helper->buffer);
-}
-
-static void drm_fbdev_release(struct drm_fb_helper *fb_helper)
-{
-	drm_fbdev_cleanup(fb_helper);
 	drm_client_release(&fb_helper->client);
 	kfree(fb_helper);
 }
 
-/*
- * fb_ops.fb_destroy is called by the last put_fb_info() call at the end of
- * unregister_framebuffer() or fb_release().
- */
-static void drm_fbdev_fb_destroy(struct fb_info *info)
-{
-	drm_fbdev_release(info->par);
-}
-
 static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct drm_fb_helper *fb_helper = info->par;
-- 
2.39.0


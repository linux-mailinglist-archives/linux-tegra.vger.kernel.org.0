Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A243574AD1B
	for <lists+linux-tegra@lfdr.de>; Fri,  7 Jul 2023 10:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbjGGIeh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 7 Jul 2023 04:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232842AbjGGIec (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 04:34:32 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AEB7113;
        Fri,  7 Jul 2023 01:34:31 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id AD988227C6;
        Fri,  7 Jul 2023 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1688718869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pG2atEnU/fnP5AEZfc/l6A/pO+L/pdnmLd89LQ4Iezc=;
        b=z/1iK313cscssnSl3dukt9zaU/NvtiPYTbe1opqCaObgoeQyIYIu6KWiAKpUuSqep1JrwJ
        allC6ursXV8sNpzlEpZFp6UV9gDWqRTKHpVHJXhFoXDWC0vjGcjx5yBDWkMZKDtwMM3DwR
        3GH0D+J0Hr7NDnhSsXbgd/OkhPPGpX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1688718869;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pG2atEnU/fnP5AEZfc/l6A/pO+L/pdnmLd89LQ4Iezc=;
        b=zFeqG4PkIL07SuW6SJkGFssK3z7jLnXtgnpdYnTtVcIxMj8Nb97Q9jXvOSA32fm5x4vtNo
        rahxaezobqYQSzCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7BA681346D;
        Fri,  7 Jul 2023 08:34:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id EFvwHBXOp2RdQAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 07 Jul 2023 08:34:29 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 12/12] fbdev: Harmonize some comments in <linux/fb.h>
Date:   Fri,  7 Jul 2023 10:32:03 +0200
Message-ID: <20230707083422.18691-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707083422.18691-1-tzimmermann@suse.de>
References: <20230707083422.18691-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Make the comments for I/O, system and DMA memory say the same.
Makes the header file's structure more obvious.

Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 include/linux/fb.h | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index d370f84fbca9..c8ca9c265fda 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -529,7 +529,7 @@ extern int fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var);
 extern int fb_blank(struct fb_info *info, int blank);
 
 /*
- * Drawing operations where framebuffer is in I/O memory
+ * Helpers for framebuffers in I/O memory
  */
 
 extern void cfb_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
@@ -540,10 +540,6 @@ extern ssize_t fb_io_read(struct fb_info *info, char __user *buf,
 extern ssize_t fb_io_write(struct fb_info *info, const char __user *buf,
 			   size_t count, loff_t *ppos);
 
-/*
- * Initializes struct fb_ops for framebuffers in I/O memory.
- */
-
 #define __FB_DEFAULT_IO_OPS_RDWR \
 	.fb_read	= fb_io_read, \
 	.fb_write	= fb_io_write
@@ -562,7 +558,7 @@ extern ssize_t fb_io_write(struct fb_info *info, const char __user *buf,
 	__FB_DEFAULT_IO_OPS_MMAP
 
 /*
- * Drawing operations where framebuffer is in system RAM
+ * Helpers for framebuffers in system memory
  */
 
 extern void sys_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
@@ -573,10 +569,6 @@ extern ssize_t fb_sys_read(struct fb_info *info, char __user *buf,
 extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 			    size_t count, loff_t *ppos);
 
-/*
- * Initializes struct fb_ops for framebuffers in system memory.
- */
-
 #define __FB_DEFAULT_SYS_OPS_RDWR \
 	.fb_read	= fb_sys_read, \
 	.fb_write	= fb_sys_write
-- 
2.41.0


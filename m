Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE2B1749C8E
	for <lists+linux-tegra@lfdr.de>; Thu,  6 Jul 2023 14:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232373AbjGFMuE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 6 Jul 2023 08:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232502AbjGFMt4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Jul 2023 08:49:56 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8961E1FD8;
        Thu,  6 Jul 2023 05:49:36 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 97ED022938;
        Thu,  6 Jul 2023 12:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1688647747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cKR3ZnbG7MMz5F4/vJcdpyoOxU6C2g5Dy4H9g3Ktz+0=;
        b=sXc4YA8u8aTqZndLL8hSvqvUD9NqGTTAKcn8jrziX34ylRUlfDprk0iEOcfflc3VUb3t5o
        AI3wtRG3kY7rzdEFm0bYJTpeLWz/ZIYpuBPkGiofOnG22tRHeTCvpdZCyE3oUmyfjbC3kA
        eV8byS/dEP6hz/rQVjRBIXKgK/jSrkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1688647747;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cKR3ZnbG7MMz5F4/vJcdpyoOxU6C2g5Dy4H9g3Ktz+0=;
        b=3lacPbe3y9/72q/1mlWk1ASFMP6+e6rSoEwKwHycOsXsSnyeWKAanYjh3LCpJ5kyiVbbrM
        ZlTnLXRQ+w2S3JAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4FFAA138FC;
        Thu,  6 Jul 2023 12:49:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id wHSfEkO4pmS7QgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 12:49:07 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Helge Deller <deller@gmx.de>
Subject: [PATCH v2 01/11] fbdev: Add fb_ops init macros for framebuffers in DMA-able memory
Date:   Thu,  6 Jul 2023 14:46:39 +0200
Message-ID: <20230706124905.15134-2-tzimmermann@suse.de>
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

Add initializer macros for struct fb_ops for framebuffers in DMA-able
memory areas. Also add a corresponding Kconfig token. As of now, this
is equivalent to system framebuffers and mostly useful for labeling
drivers correctly.

A later patch may add a generic DMA-specific mmap operation. Linux
offers a number of dma_mmap_*() helpers for different use cases.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/Kconfig |  8 ++++++++
 include/linux/fb.h          | 13 +++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index cecf15418632..f14229757311 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -168,6 +168,14 @@ config FB_DEFERRED_IO
 	bool
 	depends on FB
 
+config FB_DMA_HELPERS
+	bool
+	depends on FB
+	select FB_SYS_COPYAREA
+	select FB_SYS_FILLRECT
+	select FB_SYS_FOPS
+	select FB_SYS_IMAGEBLIT
+
 config FB_IO_HELPERS
 	bool
 	depends on FB
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 1d5c13f34b09..1191a78c5289 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -594,6 +594,19 @@ extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 	__FB_DEFAULT_SYS_OPS_DRAW, \
 	__FB_DEFAULT_SYS_OPS_MMAP
 
+/*
+ * Helpers for framebuffers in DMA-able memory
+ */
+
+#define __FB_DEFAULT_DMA_OPS_RDWR \
+	.fb_read	= fb_sys_read, \
+	.fb_write	= fb_sys_write
+
+#define __FB_DEFAULT_DMA_OPS_DRAW \
+	.fb_fillrect	= sys_fillrect, \
+	.fb_copyarea	= sys_copyarea, \
+	.fb_imageblit	= sys_imageblit
+
 /* drivers/video/fbmem.c */
 extern int register_framebuffer(struct fb_info *fb_info);
 extern void unregister_framebuffer(struct fb_info *fb_info);
-- 
2.41.0


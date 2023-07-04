Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEFE47475D4
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Jul 2023 18:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbjGDQBj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Jul 2023 12:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbjGDQBi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Jul 2023 12:01:38 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C6810D9;
        Tue,  4 Jul 2023 09:01:36 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 685F71FDCE;
        Tue,  4 Jul 2023 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1688486495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9HNzFbkOxT3wYRs/yGJOSWV56VFROq6gaVSgPJPLezI=;
        b=CF/NsosiphT5TK8Gm/jnpeQW+5mJgGl2kBwo4m9jiUoqOtbGoCUfaTgU5P7OzFJ5evzkVX
        wiBTrnRuKz4CTqobiZHFNfKIBs0ALA3MBVkgGzYBaYtbxSoke/IRp0NC0Oj/Dn5yhEEtL4
        pz0fmnzVXTVuyynR1RdYMHlQbC8a+c0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1688486495;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9HNzFbkOxT3wYRs/yGJOSWV56VFROq6gaVSgPJPLezI=;
        b=VMsaooGl05z/fGaZ4w2m/1zddiga9OcnyIO0AhrgQW15PMrVEaMH/JhlC0FDqnkN5Z2gGR
        VaU9K7DdH0tvEgAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 33522139ED;
        Tue,  4 Jul 2023 16:01:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 6JOgC19CpGTzLwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 04 Jul 2023 16:01:35 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Helge Deller <deller@gmx.de>
Subject: [PATCH 01/10] fbdev: Add fb_ops init macros for framebuffers in DMA-able memory
Date:   Tue,  4 Jul 2023 17:49:58 +0200
Message-ID: <20230704160133.20261-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230704160133.20261-1-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
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

Add initializer macros for struct fb_ops for framebuffers in DMA-able
memory areas. Also add a corresponding Kconfig token. As of now, this
is equivalent to system framebuffers and mostly useful for labeling
drivers correctly.

A later patch may add a generic DMA-specific mmap operation. Linux
offers a number of dma_mmap_*() helpers for different use cases.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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


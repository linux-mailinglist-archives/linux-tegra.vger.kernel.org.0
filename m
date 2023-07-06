Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4E4D749C9B
	for <lists+linux-tegra@lfdr.de>; Thu,  6 Jul 2023 14:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232446AbjGFMuJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 6 Jul 2023 08:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbjGFMuC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Jul 2023 08:50:02 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCD6268B;
        Thu,  6 Jul 2023 05:49:43 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 212CC20294;
        Thu,  6 Jul 2023 12:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1688647750; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ekgUz+mjy+gWrvl+EnjksazPACAkT7jWIf87XY9ABXw=;
        b=olx54+XWmGLVFhTOKGZd3L46rrix4bw7jpzaYAP7IEFi3qU8HRq4GBTAPkJSBg+Ka6bWva
        qZfCOPFNcFzaEBaNjRZzj8S/PKBoSgR1wMxqOg4kKJXeGQf0KRUt4WU3+EjCL6qk+R3dEl
        JdvM85DLkAJd52CmsLQFY8ABqRVSeug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1688647750;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ekgUz+mjy+gWrvl+EnjksazPACAkT7jWIf87XY9ABXw=;
        b=Ebi7/BKUsiG77YF7XGCXzLHrLSFvBGI/ublCdwfvyedlSE5/FGA2AB9c7D5g0BX3+dxG3e
        79MZmSvXJj64VhDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9C29138FC;
        Thu,  6 Jul 2023 12:49:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ACS8M0W4pmS7QgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 12:49:09 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Helge Deller <deller@gmx.de>
Subject: [PATCH v2 10/11] fbdev: Remove FB_DEFAULT_SYS_OPS
Date:   Thu,  6 Jul 2023 14:46:48 +0200
Message-ID: <20230706124905.15134-11-tzimmermann@suse.de>
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

Remove the initializer macro FB_DEFAULT_SYS_OPS and its helper macro
__FB_DEFAULT_SYS_OPS_MMAP. There are no users.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Cc: Helge Deller <deller@gmx.de> (maintainer:FRAMEBUFFER LAYER)
---
 include/linux/fb.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 1191a78c5289..d370f84fbca9 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -586,14 +586,6 @@ extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 	.fb_copyarea	= sys_copyarea, \
 	.fb_imageblit	= sys_imageblit
 
-#define __FB_DEFAULT_SYS_OPS_MMAP \
-	.fb_mmap	= NULL /* default implementation */
-
-#define FB_DEFAULT_SYS_OPS \
-	__FB_DEFAULT_SYS_OPS_RDWR, \
-	__FB_DEFAULT_SYS_OPS_DRAW, \
-	__FB_DEFAULT_SYS_OPS_MMAP
-
 /*
  * Helpers for framebuffers in DMA-able memory
  */
-- 
2.41.0


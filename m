Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A24F374AD06
	for <lists+linux-tegra@lfdr.de>; Fri,  7 Jul 2023 10:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbjGGIec (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 7 Jul 2023 04:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232795AbjGGIea (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 04:34:30 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1E090;
        Fri,  7 Jul 2023 01:34:29 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id B524B227C2;
        Fri,  7 Jul 2023 08:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1688718867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eQNmIiu9FPrQ2iRFAnnWdhmaGOI2fQCKVb/yrH90NQ8=;
        b=VeGHrl+4naMUigWFJNgEaHbu8l+a60ndGxJ7jItht0CUySXoV8YHaBTfLYw/VdL86VZZsA
        QyjiDXEpl6KZjpPlCWAtMtGsTa+T6m+7ls1a9scipqZ48pGc7pK2QUU3/p5W7MQB2nDR9d
        +KiOZ68xCMpWx6v4n1I+dsM4ApWVXK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1688718867;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eQNmIiu9FPrQ2iRFAnnWdhmaGOI2fQCKVb/yrH90NQ8=;
        b=wo4WMPJab2ru9dl6PlbaSjWgsH22ME7eqg1cTwguI/1l937mvCouAwYLwLtIdouvLKn9qX
        sN755NhhPzcmpdBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7953813A18;
        Fri,  7 Jul 2023 08:34:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id QNhIHBPOp2RdQAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 07 Jul 2023 08:34:27 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v3 05/12] drm/tegra: Store pointer to vmap'ed framebuffer in screen_buffer
Date:   Fri,  7 Jul 2023 10:31:56 +0200
Message-ID: <20230707083422.18691-6-tzimmermann@suse.de>
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

Tegra uses DMA-able memory, which has to be acessed with CPU ops
for system-memory. Store the framebuffer's vmap address in struct
fb_info.screen_buffer. The currently used field 'screen_base' is
for I/O memory.

Suggested-by: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/fbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index d8460c5dc91e..0b55215d2b7e 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -133,7 +133,7 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 	}
 
 	info->flags |= FBINFO_VIRTFB;
-	info->screen_base = (void __iomem *)bo->vaddr + offset;
+	info->screen_buffer = bo->vaddr + offset;
 	info->screen_size = size;
 	info->fix.smem_start = (unsigned long)(bo->iova + offset);
 	info->fix.smem_len = size;
-- 
2.41.0


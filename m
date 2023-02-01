Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4A7767BBAF
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Jan 2023 21:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235506AbjAYUEW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 25 Jan 2023 15:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235303AbjAYUEU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Jan 2023 15:04:20 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 116E63A870;
        Wed, 25 Jan 2023 12:04:19 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id A7DD11FE94;
        Wed, 25 Jan 2023 20:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674677057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uCpLaX1oHpxByqh6QHj2bOLOrRtwHkCMazI2xMmVWyI=;
        b=NR//PvvwSYoCghCIGG8RQHxMnY6YdwArQ+QOofHLys/9ET35jsG4h0rwo6nWgF3gvMykxY
        PUySK/27ygXFcRwZb+u9l/67WXDozo8mI4+wclgN4aAfqT+UERwoMMFeHb7M4mKFZg8lEO
        5nhR7QgRfzmQMa99x4RSuvlwjFT+sO4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674677057;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uCpLaX1oHpxByqh6QHj2bOLOrRtwHkCMazI2xMmVWyI=;
        b=2hjxKN8bZ1NtccW76VLCPW7N2XXDDTGRdm7QHm8qovgS6fmeCa3Jfo7XzP2unSIjdCIfzp
        nSe8V3mwWUPEoiAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B54C1339E;
        Wed, 25 Jan 2023 20:04:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id WJd5GUGL0WMDeAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 25 Jan 2023 20:04:17 +0000
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
Subject: [PATCH v3 02/10] drm/client: Add hotplug_failed flag
Date:   Wed, 25 Jan 2023 21:04:07 +0100
Message-Id: <20230125200415.14123-3-tzimmermann@suse.de>
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

Signal failed hotplugging with a flag in struct drm_client_dev. If set,
the client helpers will not further try to set up the fbdev display.

This used to be signalled with a combination of cleared pointers in
struct drm_fb_helper, which prevents us from initializing these pointers
early after allocation.

The change also harmonizes behavior among DRM clients. Additional DRM
clients will now handle failed hotplugging like fbdev does.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_client.c        | 5 +++++
 drivers/gpu/drm/drm_fbdev_generic.c | 4 ----
 include/drm/drm_client.h            | 8 ++++++++
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 09ac191c202d..009e7b10455c 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -208,8 +208,13 @@ void drm_client_dev_hotplug(struct drm_device *dev)
 		if (!client->funcs || !client->funcs->hotplug)
 			continue;
 
+		if (client->hotplug_failed)
+			continue;
+
 		ret = client->funcs->hotplug(client);
 		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
+		if (ret)
+			client->hotplug_failed = true;
 	}
 	mutex_unlock(&dev->clientlist_mutex);
 }
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 3d455a2e3fb5..135d58b8007b 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -382,10 +382,6 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
 	struct drm_device *dev = client->dev;
 	int ret;
 
-	/* Setup is not retried if it has failed */
-	if (!fb_helper->dev && fb_helper->funcs)
-		return 0;
-
 	if (dev->fb_helper)
 		return drm_fb_helper_hotplug_event(dev->fb_helper);
 
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 4fc8018eddda..39482527a775 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -106,6 +106,14 @@ struct drm_client_dev {
 	 * @modesets: CRTC configurations
 	 */
 	struct drm_mode_set *modesets;
+
+	/**
+	 * @hotplug failed:
+	 *
+	 * Set by client hotplug helpers if the hotplugging failed
+	 * before. It is usually not tried again.
+	 */
+	bool hotplug_failed;
 };
 
 int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
-- 
2.39.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E63ADE3894
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439896AbfJXQqK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:10 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46203 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439894AbfJXQqK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:10 -0400
Received: by mail-wr1-f67.google.com with SMTP id n15so16071606wrw.13
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F4lRUdhvbauplkpd4/zSVY6YswIkikfBSoscbfTPm6A=;
        b=us02LvLyl9MstWWZI+3sQezky6sgukEOfdq9wVIaT3dAjByyV2942Jrzhjtl21DI7w
         SUnGEzvgbXAhyKIb/D5MaqmUPy4Og9oRmYO9v6WWnbuTEJOUEFH71bzHDoQ/9UTNI+A+
         qMUyxyavj3ZnVJzZWilqZbbplLyfy4ltlt2Z40czShEH3HivFXv89kF+VfpeZJMUHC9M
         8RrTl77Y304hFn2I5S/5jIr/llCQjd/WU88VBoBDxcWxa2ORcOWgG4BzBtz05nSXDcCD
         OhFDWpvxExMYgMPxOK6vQwuUzWRLWnjm3Gt8ALkXguSSe1z+ETJajoI+Vm67QEgIa6Uq
         H9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F4lRUdhvbauplkpd4/zSVY6YswIkikfBSoscbfTPm6A=;
        b=GeVnnZzxfzLcErTrG3l9H31EsoAKmPnxlXrnICrAQKbOc90LhgnXxa6Rjr92H7A8Nm
         4QQeXjlA8C9OeZ4ms9DXD1zR66DP8AlYFWsmN69UpmzrydQ/EYrW9BSEMSy/Ekj8iOXe
         w/RvDvEqlltdCZdMLdhEjFVVQ+cSRT+RM9cYuO9ZZBs44wPAkfuaFVwVBn/XgCP+aiXa
         NzertEEUs+u7BJ52aqhnpAteNu9xC9IUWfEmQCaa849t/4jpsrzmWVEjY8MDUPy+XnMo
         JiA3AWOETOgB0U/twaBRcD0kIKTUZH87Il6qX8FsTRl3C4yQc/xwsm5JrBrhxqACHBQT
         2V+g==
X-Gm-Message-State: APjAAAVxnBE/4RTNQxFRG1TL+NqOgJHfiAtrPoL7gREpOHwFKl/cdwCN
        mgsIShwujHqXrA9xLLed9Fk=
X-Google-Smtp-Source: APXvYqxghvX8VIL9TX0Ql3qna64+KUMLlY0Ct0J2y1K44HN6eoCXOu8q79Te3MUH6bA+ZQZdaU3Wew==
X-Received: by 2002:adf:fe10:: with SMTP id n16mr4995376wrr.288.1571935568004;
        Thu, 24 Oct 2019 09:46:08 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id u1sm2526372wmc.38.2019.10.24.09.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 14/32] drm/tegra: dp: Add drm_dp_link_choose() helper
Date:   Thu, 24 Oct 2019 18:45:16 +0200
Message-Id: <20191024164534.132764-15-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This helper chooses an appropriate configuration, according to the
bitrate requirements of the video mode and the capabilities of the
DisplayPort sink.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dp.c | 55 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/dp.h |  5 ++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index 638081b568f4..e9a5db77a2dc 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2015 Rob Clark
  */
 
+#include <drm/drm_crtc.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_print.h>
 
@@ -234,3 +235,57 @@ int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link)
 
 	return 0;
 }
+
+/**
+ * drm_dp_link_choose() - choose the lowest possible configuration for a mode
+ * @link: DRM DP link object
+ * @mode: DRM display mode
+ * @info: DRM display information
+ *
+ * According to the eDP specification, a source should select a configuration
+ * with the lowest number of lanes and the lowest possible link rate that can
+ * match the bitrate requirements of a video mode. However it must ensure not
+ * to exceed the capabilities of the sink.
+ *
+ * Returns: 0 on success or a negative error code on failure.
+ */
+int drm_dp_link_choose(struct drm_dp_link *link,
+		       const struct drm_display_mode *mode,
+		       const struct drm_display_info *info)
+{
+	/* available link symbol clock rates */
+	static const unsigned int rates[3] = { 162000, 270000, 540000 };
+	/* available number of lanes */
+	static const unsigned int lanes[3] = { 1, 2, 4 };
+	unsigned long requirement, capacity;
+	unsigned int rate = link->max_rate;
+	unsigned int i, j;
+
+	/* bandwidth requirement */
+	requirement = mode->clock * info->bpc * 3;
+
+	for (i = 0; i < ARRAY_SIZE(lanes) && lanes[i] <= link->max_lanes; i++) {
+		for (j = 0; j < ARRAY_SIZE(rates) && rates[j] <= rate; j++) {
+			/*
+			 * Capacity for this combination of lanes and rate,
+			 * factoring in the ANSI 8B/10B encoding.
+			 *
+			 * Link rates in the DRM DP helpers are really link
+			 * symbol frequencies, so a tenth of the actual rate
+			 * of the link.
+			 */
+			capacity = lanes[i] * (rates[j] * 10) * 8 / 10;
+
+			if (capacity >= requirement) {
+				DRM_DEBUG_KMS("using %u lanes at %u kHz (%lu/%lu kbps)\n",
+					      lanes[i], rates[j], requirement,
+					      capacity);
+				link->lanes = lanes[i];
+				link->rate = rates[j];
+				return 0;
+			}
+		}
+	}
+
+	return -ERANGE;
+}
diff --git a/drivers/gpu/drm/tegra/dp.h b/drivers/gpu/drm/tegra/dp.h
index 1fe2d4f45ba3..e07b9a1e43d8 100644
--- a/drivers/gpu/drm/tegra/dp.h
+++ b/drivers/gpu/drm/tegra/dp.h
@@ -9,6 +9,8 @@
 
 #include <linux/types.h>
 
+struct drm_display_info;
+struct drm_display_mode;
 struct drm_dp_aux;
 
 /**
@@ -91,5 +93,8 @@ int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link);
 int drm_dp_link_power_up(struct drm_dp_aux *aux, struct drm_dp_link *link);
 int drm_dp_link_power_down(struct drm_dp_aux *aux, struct drm_dp_link *link);
 int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link);
+int drm_dp_link_choose(struct drm_dp_link *link,
+		       const struct drm_display_mode *mode,
+		       const struct drm_display_info *info);
 
 #endif
-- 
2.23.0


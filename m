Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30DB7E3884
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436822AbfJXQps (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:45:48 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37456 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436833AbfJXQps (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:45:48 -0400
Received: by mail-wm1-f66.google.com with SMTP id q130so3101567wme.2
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vuQB447RCY7T9OAh1/C8xr8tJsfjrMuQRccaNwCozL4=;
        b=giwplgE6Njf9xrIo4JYAkmbD/4cqf5qg7dTt2vsQ6PGNwV6/Id0srPfBRfGuvfHbIJ
         xTl2Oo3BqO8bZJ0tJJVsPSTyHEUjhUWvz4+5nC+iX5UvHzs+FFU8NkfvO2T4bdrld9Ad
         rLjabR9tsTaOmfL40m6QmWB1W8/WfvSNmzvPg/9qw2OFFmYZseHY81aJU7afQdAC96Ki
         JcVV8IAc7dPgEN/eYWJytxdkTITjbBLhPSNg6QwypYgR2d4F8Ij6SOcRHN8i3OQz8jYm
         Q9gLkYdbjfxFap/fODF4+q1dRkanKd4A1ydhaFNZoWJkDulv6xxnq6JxpIERKDtiv+o2
         vNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vuQB447RCY7T9OAh1/C8xr8tJsfjrMuQRccaNwCozL4=;
        b=JKGqnjIxTcAkPQhBCnVnQakh26DcGfskNSjhZHA/oewqBiF64NLXBvbZiOpMaIstuh
         Ft/h/123VRCqm5MjqT6ojp5yOwfIUXIJqGhOHBVw/VuaoY9hRGKLd2cSlAk/UFP/ZJeS
         WyCSL/DcFj3o7aqC64xmcmHGY1Q7D56zEbf1LWFYIljJwbULleOXpTd1S2A7SiqNah7y
         yELLS/usT/BD+faDmzPj05tRBt1YJD5myu5QBNBNjbYRYxcZ7ebaXS4X5Wk859IBL2RR
         YxqV+6gk/6HlIL72ikTa3MgcCl6xEXEDAxC6iThZ2sdDY69AWh6z9UALCIob7mOC2ZjQ
         I0wA==
X-Gm-Message-State: APjAAAVW0sSlziAAi244JGfxOSp6ESUnrkglVczzFnIKdwiVkzRf6iF1
        W4aDqPs9aFQmk5DRdtcby9f59eoh
X-Google-Smtp-Source: APXvYqyvmPtF949Wop0T+AQEqCWUsYHr+vOlzGG1/ucpDB9JPLDUxkFpnc+ndRoXaV12ySvqPXchGg==
X-Received: by 2002:a7b:c94f:: with SMTP id i15mr6102293wml.31.1571935546207;
        Thu, 24 Oct 2019 09:45:46 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id l6sm3041725wmg.2.2019.10.24.09.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:45:44 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 04/32] drm/tegra: dp: Turn link capabilities into booleans
Date:   Thu, 24 Oct 2019 18:45:06 +0200
Message-Id: <20191024164534.132764-5-thierry.reding@gmail.com>
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

Rather than storing capabilities as flags in an integer, use a separate
boolean per capability. This simplifies the code that checks for these
capabilities.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dp.c  | 18 +++++++++++++++---
 drivers/gpu/drm/tegra/dp.h  | 22 +++++++++++++++++++---
 drivers/gpu/drm/tegra/sor.c |  4 ++--
 3 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index e55efd46a7d9..e7602fc39a4a 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -8,6 +8,17 @@
 
 #include "dp.h"
 
+static void drm_dp_link_caps_reset(struct drm_dp_link_caps *caps)
+{
+	caps->enhanced_framing = false;
+}
+
+void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
+			   const struct drm_dp_link_caps *src)
+{
+	dest->enhanced_framing = src->enhanced_framing;
+}
+
 static void drm_dp_link_reset(struct drm_dp_link *link)
 {
 	if (!link)
@@ -16,7 +27,8 @@ static void drm_dp_link_reset(struct drm_dp_link *link)
 	link->revision = 0;
 	link->max_rate = 0;
 	link->max_lanes = 0;
-	link->capabilities = 0;
+
+	drm_dp_link_caps_reset(&link->caps);
 
 	link->rate = 0;
 	link->lanes = 0;
@@ -49,7 +61,7 @@ int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
 	link->max_lanes = values[2] & DP_MAX_LANE_COUNT_MASK;
 
 	if (values[2] & DP_ENHANCED_FRAME_CAP)
-		link->capabilities |= DP_LINK_CAP_ENHANCED_FRAMING;
+		link->caps.enhanced_framing = true;
 
 	link->rate = link->max_rate;
 	link->lanes = link->max_lanes;
@@ -139,7 +151,7 @@ int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link)
 	values[0] = drm_dp_link_rate_to_bw_code(link->rate);
 	values[1] = link->lanes;
 
-	if (link->capabilities & DP_LINK_CAP_ENHANCED_FRAMING)
+	if (link->caps.enhanced_framing)
 		values[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
 
 	err = drm_dp_dpcd_write(aux, DP_LINK_BW_SET, values, sizeof(values));
diff --git a/drivers/gpu/drm/tegra/dp.h b/drivers/gpu/drm/tegra/dp.h
index ec0342d4c95e..6246f9afb5fe 100644
--- a/drivers/gpu/drm/tegra/dp.h
+++ b/drivers/gpu/drm/tegra/dp.h
@@ -7,16 +7,31 @@
 #ifndef DRM_TEGRA_DP_H
 #define DRM_TEGRA_DP_H 1
 
+#include <linux/types.h>
+
 struct drm_dp_aux;
 
-#define DP_LINK_CAP_ENHANCED_FRAMING (1 << 0)
+/**
+ * struct drm_dp_link_caps - DP link capabilities
+ */
+struct drm_dp_link_caps {
+	/**
+	 * @enhanced_framing:
+	 *
+	 * enhanced framing capability (mandatory as of DP 1.2)
+	 */
+	bool enhanced_framing;
+};
+
+void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
+			   const struct drm_dp_link_caps *src);
 
 /**
  * struct drm_dp_link - DP link capabilities and configuration
  * @revision: DP specification revision supported on the link
  * @max_rate: maximum clock rate supported on the link
  * @max_lanes: maximum number of lanes supported on the link
- * @capabilities: bitmask of capabilities supported on the link
+ * @caps: capabilities supported on the link (see &drm_dp_link_caps)
  * @rate: currently configured link rate
  * @lanes: currently configured number of lanes
  */
@@ -24,7 +39,8 @@ struct drm_dp_link {
 	unsigned char revision;
 	unsigned int max_rate;
 	unsigned int max_lanes;
-	unsigned long capabilities;
+
+	struct drm_dp_link_caps caps;
 
 	unsigned int rate;
 	unsigned int lanes;
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index dca71250d88c..dd118366455b 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -977,7 +977,7 @@ static int tegra_sor_compute_config(struct tegra_sor *sor,
 	num = ((mode->htotal - mode->hdisplay) - 7) * link_rate;
 	config->hblank_symbols = div_u64(num, pclk);
 
-	if (link->capabilities & DP_LINK_CAP_ENHANCED_FRAMING)
+	if (link->caps.enhanced_framing)
 		config->hblank_symbols -= 3;
 
 	config->hblank_symbols -= 12 / link->lanes;
@@ -1918,7 +1918,7 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 	value &= ~SOR_DP_LINKCTL_LANE_COUNT_MASK;
 	value |= SOR_DP_LINKCTL_LANE_COUNT(lanes);
 
-	if (link.capabilities & DP_LINK_CAP_ENHANCED_FRAMING)
+	if (link.caps.enhanced_framing)
 		value |= SOR_DP_LINKCTL_ENHANCED_FRAME;
 
 	tegra_sor_writel(sor, value, SOR_DP_LINKCTL0);
-- 
2.23.0


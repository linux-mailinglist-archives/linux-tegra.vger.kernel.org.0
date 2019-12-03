Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B57F1101FC
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Dec 2019 17:19:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfLCQT0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 3 Dec 2019 11:19:26 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34581 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfLCQT0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Dec 2019 11:19:26 -0500
Received: by mail-wm1-f68.google.com with SMTP id f4so2720681wmj.1
        for <linux-tegra@vger.kernel.org>; Tue, 03 Dec 2019 08:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ukbAySjSNMI0S+s3PZZPFOl6pszLEQLlgBTJCxk93hE=;
        b=p8AImqUvKPe7RcRTdaqBUPvOw2AwuTZBJifHfoT71eipePQVF3elFSVEDEDXXAxN8/
         lDYaDj555Vo2HTypIdFGy+G6zgIKRTJ4SNPgqNIhbEhWqgIZ9cgh/i8AEWy2C1W0mQJ9
         HRjmripn4yKt2iy9qUQ/67kL7m4Ia4TD6SndkgnxupanzaXqDQKppe6c82C8Sl7OffJk
         7jMKDcchpMUqcCY+etP2sS+R6ZFB+T7mMkgjXwTm9DmEA8J+UShOa3wMr3WmKvCaQIi4
         gKP5dd4ORA6mdc3TuZAp0kgiQ+G73ZQpiXCAJg8I6i18wD+6lKtdcfviGLW0p3JJisW2
         YGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ukbAySjSNMI0S+s3PZZPFOl6pszLEQLlgBTJCxk93hE=;
        b=JaW9gjH6MBdlA+AiIPMKT0IdPwKFTm6refEOISONu6kcsSTO/joXgqW9MAivJuh+yy
         UAxRll/2BY6+71bXT5xvtqyBlgqvtIEofFEayCDICo7LqFU2YEdq8XwDxkQmuWMGW6e4
         zSIxRCdCBmcxHB7YDwDjbkXxVjg36WL886uGtvBz1V4B/pTjlppKrQNydnKsl/YLTMPm
         znRfh2JqgCB//jJjMDqOdvXbPAnYyjrOS6r0KlnfcTCbyvJl1pp3QXVUxZ5qwYBSKSk8
         vyU4Ur1sgB6BBLcxZBhPXSvBwT5yd7RFTtKk9mRMQIxK2bsSZum1Xz8s4XYSEefLontn
         0wDQ==
X-Gm-Message-State: APjAAAUtgvammnXYrGm1cEcUFhVaPE6tTz+zPedI7ch+xcgcTTSsEHNG
        IrLIbWpxl0L7ChVHDYhWzYw=
X-Google-Smtp-Source: APXvYqzjma23PNGKsrRHGJ52wpi75A2EWA8HJoQhYk9dTPg/yLs/spOEQa0hVHdrIR9GSKVKKEQGJg==
X-Received: by 2002:a1c:4b0d:: with SMTP id y13mr28421590wma.134.1575389964363;
        Tue, 03 Dec 2019 08:19:24 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id d186sm3725722wmf.7.2019.12.03.08.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 08:19:23 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 4/9] drm/tegra: Use proper IOVA address for cursor image
Date:   Tue,  3 Dec 2019 17:19:09 +0100
Message-Id: <20191203161914.1312555-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203161914.1312555-1-thierry.reding@gmail.com>
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The IOVA address for the cursor is the result of mapping the buffer
object for the given display controller. Make sure to use the proper
IOVA address as stored in the cursor's plane state.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index d03b33c3b114..0a5f86b61fda 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -847,16 +847,15 @@ static int tegra_cursor_atomic_check(struct drm_plane *plane,
 static void tegra_cursor_atomic_update(struct drm_plane *plane,
 				       struct drm_plane_state *old_state)
 {
-	struct tegra_bo *bo = tegra_fb_get_plane(plane->state->fb, 0);
+	struct tegra_plane_state *state = to_tegra_plane_state(plane->state);
 	struct tegra_dc *dc = to_tegra_dc(plane->state->crtc);
-	struct drm_plane_state *state = plane->state;
 	u32 value = CURSOR_CLIP_DISPLAY;
 
 	/* rien ne va plus */
 	if (!plane->state->crtc || !plane->state->fb)
 		return;
 
-	switch (state->crtc_w) {
+	switch (plane->state->crtc_w) {
 	case 32:
 		value |= CURSOR_SIZE_32x32;
 		break;
@@ -874,16 +873,16 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
 		break;
 
 	default:
-		WARN(1, "cursor size %ux%u not supported\n", state->crtc_w,
-		     state->crtc_h);
+		WARN(1, "cursor size %ux%u not supported\n",
+		     plane->state->crtc_w, plane->state->crtc_h);
 		return;
 	}
 
-	value |= (bo->iova >> 10) & 0x3fffff;
+	value |= (state->iova[0] >> 10) & 0x3fffff;
 	tegra_dc_writel(dc, value, DC_DISP_CURSOR_START_ADDR);
 
 #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-	value = (bo->iova >> 32) & 0x3;
+	value = (state->iova[0] >> 32) & 0x3;
 	tegra_dc_writel(dc, value, DC_DISP_CURSOR_START_ADDR_HI);
 #endif
 
@@ -902,7 +901,8 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
 	tegra_dc_writel(dc, value, DC_DISP_BLEND_CURSOR_CONTROL);
 
 	/* position the cursor */
-	value = (state->crtc_y & 0x3fff) << 16 | (state->crtc_x & 0x3fff);
+	value = (plane->state->crtc_y & 0x3fff) << 16 |
+		(plane->state->crtc_x & 0x3fff);
 	tegra_dc_writel(dc, value, DC_DISP_CURSOR_POSITION);
 }
 
-- 
2.23.0


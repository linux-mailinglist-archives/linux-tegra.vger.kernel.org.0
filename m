Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2771C1F8A7B
	for <lists+linux-tegra@lfdr.de>; Sun, 14 Jun 2020 22:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbgFNUBv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 14 Jun 2020 16:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727877AbgFNUBs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Jun 2020 16:01:48 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C82C08C5C2;
        Sun, 14 Jun 2020 13:01:48 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id 9so16693623ljc.8;
        Sun, 14 Jun 2020 13:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1tlVNSxgPSIVY7njRp82EoP3y9oei5GEhi6LB4YQ4wY=;
        b=jQ4is4o3msNRctJPE8x/rXfdtxgqL+UaT5OUefWyjpSdGCCCRnJTJD8hwrAK+7dPak
         ccLE732RqdOIO/h1BblHTlMoyhV6snAr+fWgyjo2ypIIksW1HO090SR7hNyA74nKJ6/5
         am79uNqc5PvmxUBgiI7DxAt+1ki57FYP2g/LNw1/WiArCa6EES4f+ZwZaXqFbvM8WLiG
         73o+tLz0aSqAxnAUFfKgQQYFmlipvKHJWrOFKIsFuhb+NW/FS6TCteBvhKhFvRplnG7N
         QgdOsenUoIWC55wmJq6fPfYqWFpBf9CNRsDhakCSfMBa625Z6xw25OV8BPkh3+zeM+/v
         kJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1tlVNSxgPSIVY7njRp82EoP3y9oei5GEhi6LB4YQ4wY=;
        b=kdCeuT4FXG885jHJTjJsJk+44THbdqQd6WzJxks9dQq9YH1aHbJvskzTxZidDIOb44
         qxCYMICAlCfSodWTAcI+krdJs58H/EE3nfea+ddsl4nGGHO1mR/mpb1ivv/tpzN1UkDn
         rA/fcPcZoty3dLJPlTiZsOfYQaB6uopNPpS29EAyjyqxiteuGAZD2zSBx6hQYrYoa3kf
         T9dsSuYFeCMsukHQzYSvnhILHeeoV89RyZS/A1HmttgFLuV9A3zL9UILip0v0KYz1x2G
         NyMGKt8OJEii2613oDbEyPqmPOqeBPHHi09WVlHHsUTYd4wIKw1cyo5IsMEhoRQ1mBm0
         RPGA==
X-Gm-Message-State: AOAM530VnuzE9EhR0vUwKxUeUxYIGk+Ts8u+1zz8eTRDgjdMY/vMVVOM
        Z0bqHR1RlsmRcnQS5cOOrqY=
X-Google-Smtp-Source: ABdhPJwkjAohrFdbnjXNIyKjz2EOPAHBkTIDfMEzdvwoiExIpOvjnhuRzO8/1I+pHiLBdhjK8q9qyw==
X-Received: by 2002:a05:651c:1193:: with SMTP id w19mr11737184ljo.121.1592164906663;
        Sun, 14 Jun 2020 13:01:46 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id 144sm1422105lfm.87.2020.06.14.13.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 13:01:46 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Derek Basehore <dbasehore@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] =?UTF-8?q?drm/tegra:=20plane:=20Support=20180?= =?UTF-8?q?=C2=B0=20rotation?=
Date:   Sun, 14 Jun 2020 23:01:21 +0300
Message-Id: <20200614200121.14147-6-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200614200121.14147-1-digetx@gmail.com>
References: <20200614200121.14147-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Combining horizontal and vertical reflections gives us 180 degrees of
rotation.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index f31bca27cde4..ddd9b88f8fce 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -608,6 +608,7 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 {
 	struct tegra_plane_state *plane_state = to_tegra_plane_state(state);
 	unsigned int rotation = DRM_MODE_ROTATE_0 |
+				DRM_MODE_ROTATE_180 |
 				DRM_MODE_REFLECT_X |
 				DRM_MODE_REFLECT_Y;
 	struct tegra_bo_tiling *tiling = &plane_state->tiling;
@@ -659,6 +660,14 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 	else
 		plane_state->reflect_y = false;
 
+	if (tegra_fb_is_bottom_up(state->fb))
+		plane_state->reflect_y = true;
+
+	if (rotation & DRM_MODE_ROTATE_180) {
+		plane_state->reflect_x = !plane_state->reflect_x;
+		plane_state->reflect_y = !plane_state->reflect_y;
+	}
+
 	/*
 	 * Tegra doesn't support different strides for U and V planes so we
 	 * error out if the user tries to display a framebuffer with such a
@@ -720,7 +729,7 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 	window.dst.h = drm_rect_height(&plane->state->dst);
 	window.bits_per_pixel = fb->format->cpp[0] * 8;
 	window.reflect_x = state->reflect_x;
-	window.reflect_y = tegra_fb_is_bottom_up(fb) || state->reflect_y;
+	window.reflect_y = state->reflect_y;
 
 	/* copy from state */
 	window.zpos = plane->state->normalized_zpos;
@@ -806,6 +815,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
 						 DRM_MODE_ROTATE_0 |
+						 DRM_MODE_ROTATE_180 |
 						 DRM_MODE_REFLECT_X |
 						 DRM_MODE_REFLECT_Y);
 	if (err < 0)
@@ -1094,6 +1104,7 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
 						 DRM_MODE_ROTATE_0 |
+						 DRM_MODE_ROTATE_180 |
 						 DRM_MODE_REFLECT_X |
 						 DRM_MODE_REFLECT_Y);
 	if (err < 0)
-- 
2.26.0


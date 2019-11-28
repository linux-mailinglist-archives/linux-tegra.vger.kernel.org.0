Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 092DD10CBDA
	for <lists+linux-tegra@lfdr.de>; Thu, 28 Nov 2019 16:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbfK1Phx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 28 Nov 2019 10:37:53 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34329 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfK1Phx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Nov 2019 10:37:53 -0500
Received: by mail-wm1-f67.google.com with SMTP id j18so7697259wmk.1
        for <linux-tegra@vger.kernel.org>; Thu, 28 Nov 2019 07:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HrdYqIJ8Cxshs6Aa/bHGdGgDvlNcq34vR+c5j3HYNtA=;
        b=VfoW0WCZF+O9ztW6wTwsZMcCQ8NaJVc1t8TgojB5qpDu8Wi8cwhXomlYqyp7AlR06e
         eaWEng2jbKbaYA+K81DXFAfcC6m972l2XqOLYlgzrqXbf6DPCveZ7TNQMgT8tVk5sJlO
         BjMsUVLOE6h4OUQUsdzfYEE2iTL9FzXqylcoAvgpkW/fLJxCwO4r6DNXVZfkvYieAbcA
         4ojPNM7FuokCqYnzQ8RoFdFTuqAYZdCtv6gh4IP2ScJ2BbTtXOzbCqo+w5IlJROIGc1h
         YvunSypP2EUJEOlRbuAbcs8yHk6o7IQnQhKdlLVcGp9s2BLqMgsd+WKYjRwFCTgCL1Aq
         TcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HrdYqIJ8Cxshs6Aa/bHGdGgDvlNcq34vR+c5j3HYNtA=;
        b=p8QSSDj0eDX6ihQ3LZ2l0pjbkfNBUWw14T0mhnwmjSCHkb2v1mbrI0vkOlugu91lD2
         /o+nYuxcrX1nzkc1E3DS76Ph5m7Cr3zp6bPv+5VQJ5trNdhCDmClA5B8Q9NsSmPMsZH0
         /G+ZESPY+RepYhKEm3qeqFQ08ak2qS5d851rUt2cViDlwNebfVwUG0qVLQgNq/tlxNOO
         V4waZzLsYQ5GBb0oQhlevWNevoi4g1tWueYsg0pqqBgX7BWlvcImyrVZXQp2SSSOSImF
         7zHjK5pGRwbZv+iu/cHS1pkT0SkdxseoQXHga/OicJWHC0l5bTVFjU8e9CosleiDn7Bi
         S1pA==
X-Gm-Message-State: APjAAAXbVLBp5U73JLAVAf8jSPV339wgjq1UzhMSwxDyy5cz5dfLa6IX
        TdpbGWlkkT2X+cbwLpZ2PlM=
X-Google-Smtp-Source: APXvYqz8SKwAvHY3TytakMY5iSY6gVr7NcSbL5ZBcKy9HT6jLMl11Qps6inph4HJyMHNHUhNhtWFzg==
X-Received: by 2002:a7b:c004:: with SMTP id c4mr9913681wmb.45.1574955471094;
        Thu, 28 Nov 2019 07:37:51 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id s10sm2701711wrw.12.2019.11.28.07.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 07:37:50 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 4/9] drm/tegra: Use proper IOVA address for cursor image
Date:   Thu, 28 Nov 2019 16:37:36 +0100
Message-Id: <20191128153741.2380419-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128153741.2380419-1-thierry.reding@gmail.com>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
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


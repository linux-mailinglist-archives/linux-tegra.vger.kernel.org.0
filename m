Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 905253BCC17
	for <lists+linux-tegra@lfdr.de>; Tue,  6 Jul 2021 13:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232505AbhGFLS1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 6 Jul 2021 07:18:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:53524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232381AbhGFLSN (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 6 Jul 2021 07:18:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF09D61C52;
        Tue,  6 Jul 2021 11:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625570131;
        bh=BLKhPJn70wKsp1Y9XlgYKucJA7iNKkDdhIwj+zGU1UQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AdSAeuot+d34bTJiQ18g9IEtvsorcGgkO/PQubql7qfTNSKv2Cbcs3mUULopa20BN
         cW82+AnE92szmAuCSbYBEC6tE7JWCwxJWnFx65pEgyMSMkYXQVrrqvEqXhT12RqL3g
         BAGsGQ25tXl+Vr8cDDN1BuBSCqG5Ca+snJak5GW4GWlIJIpgUEfvLVM+mfZe8QzMby
         sFZyFNW4ng9QYDS6HVGQSLavylk4k/S+5fexO5+3uc1fzs92bcrCOJy7/NE8QurKNm
         5j91+GwjhLRs48boTzITpnwXR5TaPALSISbknzYPA12ABumYyvRIKXJbHYo1EVF3p9
         s+OVPXTd8WZoA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Thierry Reding <treding@nvidia.com>,
        Sasha Levin <sashal@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 058/189] drm/tegra: hub: Fix YUV support
Date:   Tue,  6 Jul 2021 07:11:58 -0400
Message-Id: <20210706111409.2058071-58-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

[ Upstream commit e16efff4e5f490ce34a8c60d9ae7297dca5eb616 ]

The driver currently exposes several YUV formats but fails to properly
program all the registers needed to display such formats. Add the right
programming sequences so that overlay windows can be used to accelerate
color format conversions in multimedia playback use-cases.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tegra/dc.c    |  2 +-
 drivers/gpu/drm/tegra/dc.h    |  7 +++++
 drivers/gpu/drm/tegra/hub.c   | 52 +++++++++++++++++++++++++++++++----
 drivers/gpu/drm/tegra/plane.c | 23 ++++++++++++++--
 drivers/gpu/drm/tegra/plane.h |  3 +-
 5 files changed, 78 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index f9120dc24682..c5ea88a686d1 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -348,7 +348,7 @@ static void tegra_dc_setup_window(struct tegra_plane *plane,
 	 * For YUV planar modes, the number of bytes per pixel takes into
 	 * account only the luma component and therefore is 1.
 	 */
-	yuv = tegra_plane_format_is_yuv(window->format, &planar);
+	yuv = tegra_plane_format_is_yuv(window->format, &planar, NULL);
 	if (!yuv)
 		bpp = window->bits_per_pixel / 8;
 	else
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 29f19c3c6149..455c3fdef8dc 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -696,6 +696,9 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 
 #define DC_WINBUF_START_ADDR_HI			0x80d
 
+#define DC_WINBUF_START_ADDR_HI_U		0x80f
+#define DC_WINBUF_START_ADDR_HI_V		0x811
+
 #define DC_WINBUF_CDE_CONTROL			0x82f
 #define  ENABLE_SURFACE (1 << 0)
 
@@ -720,6 +723,10 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_WIN_PLANAR_STORAGE			0x709
 #define PITCH(x) (((x) >> 6) & 0x1fff)
 
+#define DC_WIN_PLANAR_STORAGE_UV		0x70a
+#define  PITCH_U(x) ((((x) >> 6) & 0x1fff) <<  0)
+#define  PITCH_V(x) ((((x) >> 6) & 0x1fff) << 16)
+
 #define DC_WIN_SET_PARAMS			0x70d
 #define  CLAMP_BEFORE_BLEND (1 << 15)
 #define  DEGAMMA_NONE (0 << 13)
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index bfae8a02f55b..94e1ccfb6235 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -454,7 +454,9 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 	unsigned int zpos = new_state->normalized_zpos;
 	struct drm_framebuffer *fb = new_state->fb;
 	struct tegra_plane *p = to_tegra_plane(plane);
-	dma_addr_t base;
+	dma_addr_t base, addr_flag = 0;
+	unsigned int bpc;
+	bool yuv, planar;
 	u32 value;
 	int err;
 
@@ -473,6 +475,8 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 		return;
 	}
 
+	yuv = tegra_plane_format_is_yuv(tegra_plane_state->format, &planar, &bpc);
+
 	tegra_dc_assign_shared_plane(dc, p);
 
 	tegra_plane_writel(p, VCOUNTER, DC_WIN_CORE_ACT_CONTROL);
@@ -501,8 +505,6 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 	/* disable compression */
 	tegra_plane_writel(p, 0, DC_WINBUF_CDE_CONTROL);
 
-	base = tegra_plane_state->iova[0] + fb->offsets[0];
-
 #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
 	/*
 	 * Physical address bit 39 in Tegra194 is used as a switch for special
@@ -510,9 +512,12 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 	 * dGPU sector layout.
 	 */
 	if (tegra_plane_state->tiling.sector_layout == TEGRA_BO_SECTOR_LAYOUT_GPU)
-		base |= BIT_ULL(39);
+		addr_flag = BIT_ULL(39);
 #endif
 
+	base = tegra_plane_state->iova[0] + fb->offsets[0];
+	base |= addr_flag;
+
 	tegra_plane_writel(p, tegra_plane_state->format, DC_WIN_COLOR_DEPTH);
 	tegra_plane_writel(p, 0, DC_WIN_PRECOMP_WGRP_PARAMS);
 
@@ -535,7 +540,44 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 	value = PITCH(fb->pitches[0]);
 	tegra_plane_writel(p, value, DC_WIN_PLANAR_STORAGE);
 
-	value = CLAMP_BEFORE_BLEND | DEGAMMA_SRGB | INPUT_RANGE_FULL;
+	if (yuv && planar) {
+		base = tegra_plane_state->iova[1] + fb->offsets[1];
+		base |= addr_flag;
+
+		tegra_plane_writel(p, upper_32_bits(base), DC_WINBUF_START_ADDR_HI_U);
+		tegra_plane_writel(p, lower_32_bits(base), DC_WINBUF_START_ADDR_U);
+
+		base = tegra_plane_state->iova[2] + fb->offsets[2];
+		base |= addr_flag;
+
+		tegra_plane_writel(p, upper_32_bits(base), DC_WINBUF_START_ADDR_HI_V);
+		tegra_plane_writel(p, lower_32_bits(base), DC_WINBUF_START_ADDR_V);
+
+		value = PITCH_U(fb->pitches[2]) | PITCH_V(fb->pitches[2]);
+		tegra_plane_writel(p, value, DC_WIN_PLANAR_STORAGE_UV);
+	} else {
+		tegra_plane_writel(p, 0, DC_WINBUF_START_ADDR_U);
+		tegra_plane_writel(p, 0, DC_WINBUF_START_ADDR_HI_U);
+		tegra_plane_writel(p, 0, DC_WINBUF_START_ADDR_V);
+		tegra_plane_writel(p, 0, DC_WINBUF_START_ADDR_HI_V);
+		tegra_plane_writel(p, 0, DC_WIN_PLANAR_STORAGE_UV);
+	}
+
+	value = CLAMP_BEFORE_BLEND | INPUT_RANGE_FULL;
+
+	if (yuv) {
+		if (bpc < 12)
+			value |= DEGAMMA_YUV8_10;
+		else
+			value |= DEGAMMA_YUV12;
+
+		/* XXX parameterize */
+		value |= COLOR_SPACE_YUV_2020;
+	} else {
+		if (!tegra_plane_format_is_indexed(tegra_plane_state->format))
+			value |= DEGAMMA_SRGB;
+	}
+
 	tegra_plane_writel(p, value, DC_WIN_SET_PARAMS);
 
 	value = OFFSET_X(new_state->src_y >> 16) |
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 2e11b4b1f702..2e65b4075ce6 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -375,7 +375,20 @@ int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap)
 	return 0;
 }
 
-bool tegra_plane_format_is_yuv(unsigned int format, bool *planar)
+bool tegra_plane_format_is_indexed(unsigned int format)
+{
+	switch (format) {
+	case WIN_COLOR_DEPTH_P1:
+	case WIN_COLOR_DEPTH_P2:
+	case WIN_COLOR_DEPTH_P4:
+	case WIN_COLOR_DEPTH_P8:
+		return true;
+	}
+
+	return false;
+}
+
+bool tegra_plane_format_is_yuv(unsigned int format, bool *planar, unsigned int *bpc)
 {
 	switch (format) {
 	case WIN_COLOR_DEPTH_YCbCr422:
@@ -383,6 +396,9 @@ bool tegra_plane_format_is_yuv(unsigned int format, bool *planar)
 		if (planar)
 			*planar = false;
 
+		if (bpc)
+			*bpc = 8;
+
 		return true;
 
 	case WIN_COLOR_DEPTH_YCbCr420P:
@@ -396,6 +412,9 @@ bool tegra_plane_format_is_yuv(unsigned int format, bool *planar)
 		if (planar)
 			*planar = true;
 
+		if (bpc)
+			*bpc = 8;
+
 		return true;
 	}
 
@@ -421,7 +440,7 @@ static bool __drm_format_has_alpha(u32 format)
 static int tegra_plane_format_get_alpha(unsigned int opaque,
 					unsigned int *alpha)
 {
-	if (tegra_plane_format_is_yuv(opaque, NULL)) {
+	if (tegra_plane_format_is_yuv(opaque, NULL, NULL)) {
 		*alpha = opaque;
 		return 0;
 	}
diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/plane.h
index c691dd79b27b..1785c1559c0c 100644
--- a/drivers/gpu/drm/tegra/plane.h
+++ b/drivers/gpu/drm/tegra/plane.h
@@ -74,7 +74,8 @@ int tegra_plane_state_add(struct tegra_plane *plane,
 			  struct drm_plane_state *state);
 
 int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap);
-bool tegra_plane_format_is_yuv(unsigned int format, bool *planar);
+bool tegra_plane_format_is_indexed(unsigned int format);
+bool tegra_plane_format_is_yuv(unsigned int format, bool *planar, unsigned int *bpc);
 int tegra_plane_setup_legacy_state(struct tegra_plane *tegra,
 				   struct tegra_plane_state *state);
 
-- 
2.30.2


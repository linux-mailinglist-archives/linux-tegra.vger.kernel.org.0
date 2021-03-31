Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A61393463BE
	for <lists+linux-tegra@lfdr.de>; Tue, 23 Mar 2021 16:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232926AbhCWPzM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 23 Mar 2021 11:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232897AbhCWPyp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 11:54:45 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E22C2C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:44 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id w3so27931076ejc.4
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wjqZBUBZgIpVWVu9TObFdgUHN0Qr0dzrZ1VicN5V84s=;
        b=ohfMW5dlbfZwwZAoJXHJjJgmHZW79y4rCcTEkoHu+nYUv04GujFrDcpAaG0n3w9iTh
         DHXrSHKEssKncHBcztUpowwYjuzkcRP7cnaKh2rNoIPCvzHqXEZ6hWPRdvB984/n+Ex+
         2QU+FUzRhaYLAhf+nCCPUKReQcSxueh1w8WY+QkFpXt53YfTn/+AkdjXoCVXU73xfZdp
         TOFBCuMu4vFxQ2v5isg5uX1eWsIBmlZwqrc7uOOWtmX1TYa6CmEzXHJsDmT8RkTAl6L1
         VVRgwXAR1eLDOB+RNjp2njQAfyVjUITiNyf6a1aI0GQLBMVBziLOYeIMTrNcHPI8ijZK
         VB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wjqZBUBZgIpVWVu9TObFdgUHN0Qr0dzrZ1VicN5V84s=;
        b=IAJ1kAJc4qzG6d3gLWxunkWkxndaNQyM4H+w+aIYpaGkP2cLA73lGWRWjRuYjoHiNP
         cKeSfH+LeqvE0Eaj4NICfELgWBoreae8eKFdXXvwfUuEZ+1QV68n5Rm/R0Q+dP11I3gx
         AH2s/3wYCgWRsrOxSxYOPvnz/mdbwmhanYUtc4siaNH5b6i6upoUnihE9Jr2dy2m6NDa
         5b2331XDczamUGXI2RNFARNFQUBp8USwMkgWTBsIAwGS/Xw9H3BnNW6muzFXJf+G55u4
         ycA2uahhrbOL4gpC6gWiOkyXPfN7GUrGQyIvDHuf6pEfEobkaeIOKHlVuYbZZ9RryDtI
         Xh7w==
X-Gm-Message-State: AOAM5310RQylV/cNuXpGabMfHzvM2h9QB/l2Me4tkrhiMxweFVJ05IrZ
        lvnpLOKn3MqlMrFED5TCfQc=
X-Google-Smtp-Source: ABdhPJyRnzttmqkT/H/wVCyuX3ibNR9HLG6dbP5surBFhEaVKSpbgL17I0hjIQG3LaKejmyv/ZzwlQ==
X-Received: by 2002:a17:906:2504:: with SMTP id i4mr5644433ejb.115.1616514883658;
        Tue, 23 Mar 2021 08:54:43 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id cb17sm13299695edb.10.2021.03.23.08.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 08:54:42 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        James Jones <jajones@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 9/9] drm/tegra: Support sector layout on Tegra194
Date:   Tue, 23 Mar 2021 16:54:37 +0100
Message-Id: <20210323155437.513497-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323155437.513497-1-thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra194 has a special physical address bit that enables some memory
swizzling logic to support different sector layouts. Support the bit
that selects the sector layout which is passed in the framebuffer
modifier.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c    |  7 +++++++
 drivers/gpu/drm/tegra/dc.h    |  1 +
 drivers/gpu/drm/tegra/drm.h   |  3 +++
 drivers/gpu/drm/tegra/fb.c    |  9 +++++++++
 drivers/gpu/drm/tegra/gem.h   |  6 ++++++
 drivers/gpu/drm/tegra/hub.c   | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/plane.c | 24 ++++++++++++++++++++++++
 7 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 927e6f5a2c24..742608b30527 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2326,6 +2326,7 @@ static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
 	.supports_interlacing = false,
 	.supports_cursor = false,
 	.supports_block_linear = false,
+	.supports_sector_layout = false,
 	.has_legacy_blending = true,
 	.pitch_align = 8,
 	.has_powergate = false,
@@ -2345,6 +2346,7 @@ static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
 	.supports_interlacing = false,
 	.supports_cursor = false,
 	.supports_block_linear = false,
+	.supports_sector_layout = false,
 	.has_legacy_blending = true,
 	.pitch_align = 8,
 	.has_powergate = false,
@@ -2364,6 +2366,7 @@ static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
 	.supports_interlacing = false,
 	.supports_cursor = false,
 	.supports_block_linear = false,
+	.supports_sector_layout = false,
 	.has_legacy_blending = true,
 	.pitch_align = 64,
 	.has_powergate = true,
@@ -2383,6 +2386,7 @@ static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
 	.supports_interlacing = true,
 	.supports_cursor = true,
 	.supports_block_linear = true,
+	.supports_sector_layout = false,
 	.has_legacy_blending = false,
 	.pitch_align = 64,
 	.has_powergate = true,
@@ -2402,6 +2406,7 @@ static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
 	.supports_interlacing = true,
 	.supports_cursor = true,
 	.supports_block_linear = true,
+	.supports_sector_layout = false,
 	.has_legacy_blending = false,
 	.pitch_align = 64,
 	.has_powergate = true,
@@ -2455,6 +2460,7 @@ static const struct tegra_dc_soc_info tegra186_dc_soc_info = {
 	.supports_interlacing = true,
 	.supports_cursor = true,
 	.supports_block_linear = true,
+	.supports_sector_layout = false,
 	.has_legacy_blending = false,
 	.pitch_align = 64,
 	.has_powergate = false,
@@ -2503,6 +2509,7 @@ static const struct tegra_dc_soc_info tegra194_dc_soc_info = {
 	.supports_interlacing = true,
 	.supports_cursor = true,
 	.supports_block_linear = true,
+	.supports_sector_layout = true,
 	.has_legacy_blending = false,
 	.pitch_align = 64,
 	.has_powergate = false,
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 21074cd2ce5e..29f19c3c6149 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -52,6 +52,7 @@ struct tegra_dc_soc_info {
 	bool supports_interlacing;
 	bool supports_cursor;
 	bool supports_block_linear;
+	bool supports_sector_layout;
 	bool has_legacy_blending;
 	unsigned int pitch_align;
 	bool has_powergate;
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 9a089b93da24..fe1a37e95bfa 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -24,6 +24,9 @@
 #include "hub.h"
 #include "trace.h"
 
+/* XXX move to include/uapi/drm/drm_fourcc.h? */
+#define DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT BIT(22)
+
 struct reset_control;
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 350f33206076..c04dda8353fd 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -44,6 +44,15 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
 {
 	uint64_t modifier = framebuffer->modifier;
 
+	if (fourcc_mod_is_vendor(modifier, NVIDIA)) {
+		if ((modifier & DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT) == 0)
+			tiling->sector_layout = TEGRA_BO_SECTOR_LAYOUT_TEGRA;
+		else
+			tiling->sector_layout = TEGRA_BO_SECTOR_LAYOUT_GPU;
+
+		modifier &= ~DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT;
+	}
+
 	switch (modifier) {
 	case DRM_FORMAT_MOD_LINEAR:
 		tiling->mode = TEGRA_BO_TILING_MODE_PITCH;
diff --git a/drivers/gpu/drm/tegra/gem.h b/drivers/gpu/drm/tegra/gem.h
index fafb5724499b..c15fd99d6cb2 100644
--- a/drivers/gpu/drm/tegra/gem.h
+++ b/drivers/gpu/drm/tegra/gem.h
@@ -21,9 +21,15 @@ enum tegra_bo_tiling_mode {
 	TEGRA_BO_TILING_MODE_BLOCK,
 };
 
+enum tegra_bo_sector_layout {
+	TEGRA_BO_SECTOR_LAYOUT_TEGRA,
+	TEGRA_BO_SECTOR_LAYOUT_GPU,
+};
+
 struct tegra_bo_tiling {
 	enum tegra_bo_tiling_mode mode;
 	unsigned long value;
+	enum tegra_bo_sector_layout sector_layout;
 };
 
 struct tegra_bo {
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 500c9d37e654..79bff8b48271 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -55,6 +55,18 @@ static const u64 tegra_shared_plane_modifiers[] = {
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5),
+	/*
+	 * The GPU sector layout is only supported on Tegra194, but these will
+	 * be filtered out later on by ->format_mod_supported() on SoCs where
+	 * it isn't supported.
+	 */
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	/* sentinel */
 	DRM_FORMAT_MOD_INVALID
 };
 
@@ -366,6 +378,12 @@ static int tegra_shared_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	if (tiling->sector_layout == TEGRA_BO_SECTOR_LAYOUT_GPU &&
+	    !dc->soc->supports_sector_layout) {
+		DRM_ERROR("hardware doesn't support GPU sector layout\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * Tegra doesn't support different strides for U and V planes so we
 	 * error out if the user tries to display a framebuffer with such a
@@ -485,6 +503,16 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 
 	base = tegra_plane_state->iova[0] + fb->offsets[0];
 
+#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
+	/*
+	 * Physical address bit 39 in Tegra194 is used as a switch for special
+	 * logic that swizzles the memory using either the legacy Tegra or the
+	 * dGPU sector layout.
+	 */
+	if (tegra_plane_state->tiling.sector_layout == TEGRA_BO_SECTOR_LAYOUT_GPU)
+		base |= BIT(39);
+#endif
+
 	tegra_plane_writel(p, tegra_plane_state->format, DC_WIN_COLOR_DEPTH);
 	tegra_plane_writel(p, 0, DC_WIN_PRECOMP_WGRP_PARAMS);
 
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 793da5d675d2..1e0eae8b4342 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -83,6 +83,22 @@ static void tegra_plane_atomic_destroy_state(struct drm_plane *plane,
 	kfree(state);
 }
 
+static bool tegra_plane_supports_sector_layout(struct drm_plane *plane)
+{
+	struct drm_crtc *crtc;
+
+	drm_for_each_crtc(crtc, plane->dev) {
+		if (plane->possible_crtcs & drm_crtc_mask(crtc)) {
+			struct tegra_dc *dc = to_tegra_dc(crtc);
+
+			if (!dc->soc->supports_sector_layout)
+				return false;
+		}
+	}
+
+	return true;
+}
+
 static bool tegra_plane_format_mod_supported(struct drm_plane *plane,
 					     uint32_t format,
 					     uint64_t modifier)
@@ -92,6 +108,14 @@ static bool tegra_plane_format_mod_supported(struct drm_plane *plane,
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;
 
+	/* check for the sector layout bit */
+	if (fourcc_mod_is_vendor(modifier, NVIDIA)) {
+		if (modifier & DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT) {
+			if (!tegra_plane_supports_sector_layout(plane))
+				return false;
+		}
+	}
+
 	if (info->num_planes == 1)
 		return true;
 
-- 
2.30.2


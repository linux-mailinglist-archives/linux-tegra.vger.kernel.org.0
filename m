Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDE1E12211E
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Dec 2019 02:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbfLQAvd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Dec 2019 19:51:33 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:19739 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfLQAvc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Dec 2019 19:51:32 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5df8268a0000>; Mon, 16 Dec 2019 16:51:22 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 16 Dec 2019 16:51:31 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 16 Dec 2019 16:51:31 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Dec
 2019 00:51:30 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Dec
 2019 00:51:30 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 17 Dec 2019 00:51:30 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.42.105]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5df826920000>; Mon, 16 Dec 2019 16:51:30 -0800
From:   James Jones <jajones@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
        "James Jones" <jajones@nvidia.com>
Subject: [PATCH] drm/tegra: Use more descriptive format modifiers
Date:   Mon, 16 Dec 2019 16:52:05 -0800
Message-ID: <20191217005205.2573-1-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1576543882; bh=gb23ALcRpZkjT7Pr0byini7Uzhgr6JrwEUJBCiUk9EM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=Brby6r4tT40cMYC6l90ly2LDvvpjj4asMwnwX5f0kshV8lacqodOhnS9sT56rgyEg
         Z7HKZSLPtYuXdhisgun5qkM2N6pv/v23BbJv615C7Ww8myf5l0hsrRooukfhHnxAQ1
         HVdXCrykLjY1ojkuRkqfKnPyCuCPlV1Kag7v7n1LrEHWlaVko6TSh9IlA519ZGlgW+
         DT5Yn34gnkuMwNM+rfQhva18I3NFB3WKt/t18zV6b0PR/nGSmx0GFbLyDyt4INRDis
         r9L/uiRN15iA434pYAc2vp1aK6sM7/KseJxJxI8Pd+jmT5yC8GdNNl6jStH7Kk0q94
         CneeKeceYVqvA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Advertise and accept both the existing
DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()-based format
modifiers and the more descriptive
DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D()-based
format modifiers, preserving backwards
compatibility with existing userspace drivers, but
providing forwards compatibility with future
userspace drivers that also make use of the more
descriptive modifiers to enable differentiation
between desktop and tegra, as well as compressed
and non-compressed surfaces.

This patch depends on the "[PATCH v3] drm: Generalized NV Block Linear DRM
format mod" patch submitted to dri-devel.

Signed-off-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  | 10 ++++++++++
 drivers/gpu/drm/tegra/fb.c  | 14 +++++++-------
 drivers/gpu/drm/tegra/hub.c | 10 ++++++++++
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index fbf57bc3cdab..a2cc687dc2d8 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -588,6 +588,16 @@ static const u32 tegra124_primary_formats[] = {
 
 static const u64 tegra124_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 0),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 1),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 2),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 3),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 4),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 5),
+	/*
+	 * For backwards compatibility with older userspace that may have
+	 * baked in usage of the less-descriptive modifiers
+	 */
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index e34325c83d28..d04e0b1c61ea 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -44,7 +44,7 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
 {
 	uint64_t modifier = framebuffer->modifier;
 
-	switch (modifier) {
+	switch (drm_fourcc_canonicalize_nvidia_format_mod(modifier)) {
 	case DRM_FORMAT_MOD_LINEAR:
 		tiling->mode = TEGRA_BO_TILING_MODE_PITCH;
 		tiling->value = 0;
@@ -55,32 +55,32 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
 		tiling->value = 0;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 0):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 0;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 1):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 1;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 2):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 2;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 3):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 3;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 4):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 4;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 5):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 5;
 		break;
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 839b49c40e51..03c97b10b122 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -49,6 +49,16 @@ static const u32 tegra_shared_plane_formats[] = {
 
 static const u64 tegra_shared_plane_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 0),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 1),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 2),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 3),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 4),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 5),
+	/*
+	 * For backwards compatibility with older userspace that may have
+	 * baked in usage of the less-descriptive modifiers
+	 */
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
-- 
2.17.1


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33B88E7183
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Oct 2019 13:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389120AbfJ1Mhr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Oct 2019 08:37:47 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45644 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389093AbfJ1Mhr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Oct 2019 08:37:47 -0400
Received: by mail-wr1-f68.google.com with SMTP id q13so9675300wrs.12
        for <linux-tegra@vger.kernel.org>; Mon, 28 Oct 2019 05:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BVtc7jw7WhTJ+/y+/52Upjepj6jdz/+oV1yVXbshAuY=;
        b=giEOBhaqNlgnVww+O/bQbZJ5tR7V5vKEqHYMfYjDfp3lBZD5vgzQoR4i+gZSzuldP0
         46lcvslmmwqEH8368q87YMedF5xn17EVoPQYrma78FNaViBxWgB4yxM72anAVst7fQo2
         bxL1jxoRRYEpchccgU75GP4ad8STlzJ+0c/tvgnKxC48tiECZ8Air3L0E3VmChraHU6h
         HgexJiXJVRFDJYJ3FVNsPdAX45L3InQkNLzvVlBnznEbCEQuUYBybto0U+rHE+pJ1yAN
         EKwFU+wyNkUu8KzJ5ivx13pH281WwuWsPZGg1LAhghoNsWBd5QdmC9/QCjendF3wWZ7/
         rK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BVtc7jw7WhTJ+/y+/52Upjepj6jdz/+oV1yVXbshAuY=;
        b=cHmD9LBLoctvqGM83pyAAniqpZIqan0xt6g2IW0sVnaD1XddIPqvIfNksKWpKwJjVL
         ocKtmv6JkxMEqD6OLwUiHC21ou52+ESKjfk1GdU3boAov8gWU4xn3vGX5gcwc2xJ94wN
         6aPD/suKUSNDWHq44tqWW30m20btbNjD2AIYFUld9YjwyJikEypWDvME/x5xP6B81rL0
         X92NzUDh6TslQpYOIe576D5EpvKGblxRTzWWhav9v8oh1yOYRSFU6ONBzo7+ByElPpoq
         XSw8k9I1OlLtIAon8a44K3ap6lPbs3opeS1TBY6NWk4S29sX+zYPYZDAuc0fo5WRSWL3
         KiXQ==
X-Gm-Message-State: APjAAAUR+SAaygzPWYnlKrYRs43brmwoD3ja0GkRTSSP1Ai6wu6tIHJX
        EuieLOLk7oAy2ApPcXtWoJ6Dm0iU
X-Google-Smtp-Source: APXvYqwbzd9LkRkDaiccU0sZZrjK1OVg8h6TPjnG6yblTCKSWqDwhT/AY+z45vrsTMW/AYBOKQ3sJw==
X-Received: by 2002:a5d:4a81:: with SMTP id o1mr14642779wrq.225.1572266264388;
        Mon, 28 Oct 2019 05:37:44 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id t185sm15254147wmf.45.2019.10.28.05.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 05:37:43 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sachin Nikam <snikam@nvidia.com>,
        Puneet Saxena <puneets@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 11/12] drm/tegra: Support DMA API for display controllers
Date:   Mon, 28 Oct 2019 13:37:17 +0100
Message-Id: <20191028123718.3890217-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028123718.3890217-1-thierry.reding@gmail.com>
References: <20191028123718.3890217-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

If a display controller is not attached to an explicit IOMMU domain,
which usually means that it's connected to an IOMMU domain controlled by
the DMA API, make sure to map the framebuffer to the display controller
address space. This allows us to transparently handle setups where the
display controller is attached to an IOMMU or setups where it isn't. It
also allows the driver to work with a DMA API that is backed by an
IOMMU.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c    |   8 ++-
 drivers/gpu/drm/tegra/hub.c   |   6 +-
 drivers/gpu/drm/tegra/plane.c | 104 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/plane.h |   8 +++
 4 files changed, 120 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 36c36b295ab1..5b1f9ff97576 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -715,9 +715,7 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 	window.swap = state->swap;
 
 	for (i = 0; i < fb->format->num_planes; i++) {
-		struct tegra_bo *bo = tegra_fb_get_plane(fb, i);
-
-		window.base[i] = bo->iova + fb->offsets[i];
+		window.base[i] = state->iova[i] + fb->offsets[i];
 
 		/*
 		 * Tegra uses a shared stride for UV planes. Framebuffers are
@@ -732,6 +730,8 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs tegra_plane_helper_funcs = {
+	.prepare_fb = tegra_plane_prepare_fb,
+	.cleanup_fb = tegra_plane_cleanup_fb,
 	.atomic_check = tegra_plane_atomic_check,
 	.atomic_disable = tegra_plane_atomic_disable,
 	.atomic_update = tegra_plane_atomic_update,
@@ -914,6 +914,8 @@ static void tegra_cursor_atomic_disable(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs tegra_cursor_plane_helper_funcs = {
+	.prepare_fb = tegra_plane_prepare_fb,
+	.cleanup_fb = tegra_plane_cleanup_fb,
 	.atomic_check = tegra_cursor_atomic_check,
 	.atomic_update = tegra_cursor_atomic_update,
 	.atomic_disable = tegra_cursor_atomic_disable,
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 104115e42190..2b4082d0bc9e 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -413,7 +413,6 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 	unsigned int zpos = plane->state->normalized_zpos;
 	struct drm_framebuffer *fb = plane->state->fb;
 	struct tegra_plane *p = to_tegra_plane(plane);
-	struct tegra_bo *bo;
 	dma_addr_t base;
 	u32 value;
 
@@ -456,8 +455,7 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 	/* disable compression */
 	tegra_plane_writel(p, 0, DC_WINBUF_CDE_CONTROL);
 
-	bo = tegra_fb_get_plane(fb, 0);
-	base = bo->iova;
+	base = state->iova[0] + fb->offsets[0];
 
 	tegra_plane_writel(p, state->format, DC_WIN_COLOR_DEPTH);
 	tegra_plane_writel(p, 0, DC_WIN_PRECOMP_WGRP_PARAMS);
@@ -521,6 +519,8 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs tegra_shared_plane_helper_funcs = {
+	.prepare_fb = tegra_plane_prepare_fb,
+	.cleanup_fb = tegra_plane_cleanup_fb,
 	.atomic_check = tegra_shared_plane_atomic_check,
 	.atomic_update = tegra_shared_plane_atomic_update,
 	.atomic_disable = tegra_shared_plane_atomic_disable,
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 6bab71d6e81d..163b590be224 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -6,6 +6,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane_helper.h>
 
 #include "dc.h"
@@ -23,6 +24,7 @@ static void tegra_plane_reset(struct drm_plane *plane)
 {
 	struct tegra_plane *p = to_tegra_plane(plane);
 	struct tegra_plane_state *state;
+	unsigned int i;
 
 	if (plane->state)
 		__drm_atomic_helper_plane_destroy_state(plane->state);
@@ -36,6 +38,9 @@ static void tegra_plane_reset(struct drm_plane *plane)
 		plane->state->plane = plane;
 		plane->state->zpos = p->index;
 		plane->state->normalized_zpos = p->index;
+
+		for (i = 0; i < 3; i++)
+			state->iova[i] = DMA_MAPPING_ERROR;
 	}
 }
 
@@ -60,6 +65,11 @@ tegra_plane_atomic_duplicate_state(struct drm_plane *plane)
 	for (i = 0; i < 2; i++)
 		copy->blending[i] = state->blending[i];
 
+	for (i = 0; i < 3; i++) {
+		copy->iova[i] = DMA_MAPPING_ERROR;
+		copy->sgt[i] = NULL;
+	}
+
 	return &copy->base;
 }
 
@@ -95,6 +105,100 @@ const struct drm_plane_funcs tegra_plane_funcs = {
 	.format_mod_supported = tegra_plane_format_mod_supported,
 };
 
+static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
+{
+	unsigned int i;
+	int err;
+
+	for (i = 0; i < state->base.fb->format->num_planes; i++) {
+		struct tegra_bo *bo = tegra_fb_get_plane(state->base.fb, i);
+
+		if (!dc->client.group) {
+			struct sg_table *sgt;
+
+			sgt = host1x_bo_pin(dc->dev, &bo->base, NULL);
+			if (IS_ERR(sgt)) {
+				err = PTR_ERR(sgt);
+				goto unpin;
+			}
+
+			err = dma_map_sg(dc->dev, sgt->sgl, sgt->nents,
+					 DMA_TO_DEVICE);
+			if (err == 0) {
+				err = -ENOMEM;
+				goto unpin;
+			}
+
+			state->iova[i] = sg_dma_address(sgt->sgl);
+			state->sgt[i] = sgt;
+		} else {
+			state->iova[i] = bo->iova;
+		}
+	}
+
+	return 0;
+
+unpin:
+	dev_err(dc->dev, "failed to map plane %u: %d\n", i, err);
+
+	while (i--) {
+		struct tegra_bo *bo = tegra_fb_get_plane(state->base.fb, i);
+		struct sg_table *sgt = state->sgt[i];
+
+		dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents, DMA_TO_DEVICE);
+		host1x_bo_unpin(dc->dev, &bo->base, sgt);
+
+		state->iova[i] = DMA_MAPPING_ERROR;
+		state->sgt[i] = NULL;
+	}
+
+	return err;
+}
+
+static void tegra_dc_unpin(struct tegra_dc *dc, struct tegra_plane_state *state)
+{
+	unsigned int i;
+
+	for (i = 0; i < state->base.fb->format->num_planes; i++) {
+		struct tegra_bo *bo = tegra_fb_get_plane(state->base.fb, i);
+
+		if (!dc->client.group) {
+			struct sg_table *sgt = state->sgt[i];
+
+			if (sgt) {
+				dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents,
+					     DMA_TO_DEVICE);
+				host1x_bo_unpin(dc->dev, &bo->base, sgt);
+			}
+		}
+
+		state->iova[i] = DMA_MAPPING_ERROR;
+		state->sgt[i] = NULL;
+	}
+}
+
+int tegra_plane_prepare_fb(struct drm_plane *plane,
+			   struct drm_plane_state *state)
+{
+	struct tegra_dc *dc = to_tegra_dc(state->crtc);
+
+	if (!state->fb)
+		return 0;
+
+	drm_gem_fb_prepare_fb(plane, state);
+
+	return tegra_dc_pin(dc, to_tegra_plane_state(state));
+}
+
+void tegra_plane_cleanup_fb(struct drm_plane *plane,
+			    struct drm_plane_state *state)
+{
+	struct tegra_dc *dc = to_tegra_dc(state->crtc);
+
+	if (dc)
+		tegra_dc_unpin(dc, to_tegra_plane_state(state));
+}
+
 int tegra_plane_state_add(struct tegra_plane *plane,
 			  struct drm_plane_state *state)
 {
diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/plane.h
index 510c394e6d9a..a158a915109a 100644
--- a/drivers/gpu/drm/tegra/plane.h
+++ b/drivers/gpu/drm/tegra/plane.h
@@ -39,6 +39,9 @@ struct tegra_plane_legacy_blending_state {
 struct tegra_plane_state {
 	struct drm_plane_state base;
 
+	struct sg_table *sgt[3];
+	dma_addr_t iova[3];
+
 	struct tegra_bo_tiling tiling;
 	u32 format;
 	u32 swap;
@@ -61,6 +64,11 @@ to_tegra_plane_state(struct drm_plane_state *state)
 
 extern const struct drm_plane_funcs tegra_plane_funcs;
 
+int tegra_plane_prepare_fb(struct drm_plane *plane,
+			   struct drm_plane_state *state);
+void tegra_plane_cleanup_fb(struct drm_plane *plane,
+			    struct drm_plane_state *state);
+
 int tegra_plane_state_add(struct tegra_plane *plane,
 			  struct drm_plane_state *state);
 
-- 
2.23.0


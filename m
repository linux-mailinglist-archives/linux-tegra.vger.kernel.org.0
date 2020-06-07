Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5C31F0E55
	for <lists+linux-tegra@lfdr.de>; Sun,  7 Jun 2020 20:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730028AbgFGS6G (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 7 Jun 2020 14:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728902AbgFGS56 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 7 Jun 2020 14:57:58 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639ABC08C5C6;
        Sun,  7 Jun 2020 11:57:58 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id n23so17764777ljh.7;
        Sun, 07 Jun 2020 11:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g5mqbpBzD6LEO24ptRCxVhoelM6O5To/Ke8XQWMGAFw=;
        b=vgtfVEczac3//wSmlHNBu02rTskBpwz2jrj+M148Le/pHPklLULNhPxjP25AiGPUgc
         hPRwuWK6HylOborbAggvZsPUezZiRjYotQajv6kIUrMar7posTzPb89M13qeYpYCArDo
         ecuwx3GmQo5dHzp4HJCgsu+c0t+nZqZPCwRhN/X3r5F63dC082TReyIQ8Jq3dTl3Rmkk
         h9qSPFwT4dRgi9pkfn/m+f+d/D9Yh10nig/8fk1W3V+iK0wsGkj0fvKgyhgMyHRwlhVA
         3HQzn/5sXxqv9S3sWL+d6jvn7XpZA0Qhb9NdgtdE5qfNMJHhNRdUzi6RK/41rRgCCd8u
         145g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g5mqbpBzD6LEO24ptRCxVhoelM6O5To/Ke8XQWMGAFw=;
        b=eK2ai7aySLOGS1FfeVXfIa9vatSpi1VXWBz43OBRXGMpApl8ycaxcGGZPkG33FLxcc
         0l4W/9FM6otGfYHswne0uWu6FPkCKhh8RooTliuH48ipCKFiemAtF9qLAzn8J4SlRU9+
         oruNXfZbMb6xv2znBPEJTiJkfNDlBQMZNkGs8Ybb+rJ1lInSr0AUyHAPH1lsTNVmvo//
         qZn6lv4PhJ1LgMR8S6rndsVOjpuoH00rhy/EwAGHngL5Qtayww1kOPb2MXe+C04ZVsw0
         wn5D0QhvS0zrX/SZNGVPUH9eLw2lDY+kAv68/5YQGKZ4jCcMLaw6+3Ve8wTQDK0cuEfU
         RhkA==
X-Gm-Message-State: AOAM530z1lhJkXzbJhaAmhtFgml0ggTFpWNGwgMQTBoYvbNE7fIkWUWR
        jbsXwn5ExsodfCmd0Kn3LnE=
X-Google-Smtp-Source: ABdhPJyWnCIRU0mc9gwwnZ+/wr8FYuoYUhKNhXmvKbaGsqJ6n4uGjLr600vfQqVwPtgGBHw1LWy3ZQ==
X-Received: by 2002:a2e:b8ce:: with SMTP id s14mr8957731ljp.89.1591556276665;
        Sun, 07 Jun 2020 11:57:56 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 11:57:56 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 35/39] drm/tegra: dc: Support memory bandwidth management
Date:   Sun,  7 Jun 2020 21:55:26 +0300
Message-Id: <20200607185530.18113-36-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200607185530.18113-1-digetx@gmail.com>
References: <20200607185530.18113-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Display controller (DC) performs isochronous memory transfers, and thus,
has a requirement for a minimum memory bandwidth that shall be fulfilled,
otherwise framebuffer data can't be fetched fast enough and this results
in a DC's data-FIFO underflow that follows by a visual corruption.

The Memory Controller drivers provide facility for memory bandwidth
management via interconnect API. This patch wires up the interconnect
API support to the DC driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c    | 271 +++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/tegra/dc.h    |   8 +
 drivers/gpu/drm/tegra/drm.c   |  19 +++
 drivers/gpu/drm/tegra/plane.c |   1 +
 drivers/gpu/drm/tegra/plane.h |   4 +-
 5 files changed, 299 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 83f31c6e891c..12b318bb8475 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -519,6 +519,136 @@ static void tegra_dc_setup_window(struct tegra_plane *plane,
 		tegra_plane_setup_blending(plane, window);
 }
 
+static unsigned long
+tegra_plane_memory_bandwidth(struct drm_plane_state *state,
+			     struct tegra_dc_window *window,
+			     unsigned int num,
+			     unsigned int denum)
+{
+	struct tegra_plane_state *tegra_state;
+	struct drm_crtc_state *crtc_state;
+	const struct drm_format_info *fmt;
+	struct tegra_dc_window win;
+	unsigned long long bandwidth;
+	unsigned int bpp_plane;
+	unsigned int bpp;
+	unsigned int mul;
+	unsigned int i;
+
+	if (!state->fb || !state->visible)
+		return 0;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state->state, state->crtc);
+	tegra_state = to_tegra_plane_state(state);
+
+	if (!window)
+		window = &win;
+
+	window->src.w = drm_rect_width(&state->src) >> 16;
+	window->src.h = drm_rect_height(&state->src) >> 16;
+	window->dst.w = drm_rect_width(&state->dst);
+	window->dst.h = drm_rect_height(&state->dst);
+	window->tiling = tegra_state->tiling;
+
+	fmt = state->fb->format;
+
+	/*
+	 * Note that real memory bandwidth vary depending on format and
+	 * memory layout, we are not taking that into account because small
+	 * estimation error isn't important since bandwidth is rounded up
+	 * anyway.
+	 */
+	for (i = 0, bpp = 0; i < fmt->num_planes; i++) {
+		bpp_plane = fmt->cpp[i] * 8;
+
+		/*
+		 * Sub-sampling is relevant for chroma planes only and vertical
+		 * readouts are not cached, hence only horizontal sub-sampling
+		 * matters.
+		 */
+		if (i > 0)
+			bpp_plane /= fmt->hsub;
+
+		bpp += bpp_plane;
+	}
+
+	/*
+	 * Horizontal downscale takes extra bandwidth which roughly depends
+	 * on the scaled width.
+	 */
+	if (window->src.w > window->dst.w)
+		mul = (window->src.w - window->dst.w) * bpp / 2048 + 1;
+	else
+		mul = 1;
+
+	/*
+	 * Ignore cursor window if its width is small enough such that
+	 * data-prefetch FIFO will easily help to overcome temporal memory
+	 * pressure.
+	 *
+	 * Window A has a 128bit x 128 deep read FIFO, while windows B/C
+	 * have a 128bit x 64 deep read FIFO.
+	 *
+	 * This allows us to not overestimate memory frequency requirement.
+	 * Even if it will happen that cursor gets a temporal underflow, this
+	 * won't be fatal.
+	 */
+	if (state->plane->type == DRM_PLANE_TYPE_CURSOR &&
+	    mul == 1 && window->src.w * bpp <= 128 * 16)
+		return 0;
+
+	/* mode.clock in kHz, bandwidth in kbit/s */
+	bandwidth = kbps_to_icc(crtc_state->mode.clock * bpp * mul);
+
+	/* the requested bandwidth should be higher than required */
+	bandwidth *= num;
+	do_div(bandwidth, denum);
+
+	return min_t(u64, bandwidth, ULONG_MAX);
+}
+
+static unsigned long
+tegra20_plane_memory_bandwidth(struct drm_plane_state *state)
+{
+	return tegra_plane_memory_bandwidth(state, NULL, 29, 10);
+}
+
+static unsigned long
+tegra30_plane_memory_bandwidth(struct drm_plane_state *state)
+{
+	struct tegra_dc_window window;
+	unsigned long bandwidth;
+
+	bandwidth = tegra_plane_memory_bandwidth(state, &window, 29, 10);
+
+	/* x2: memory overfetch for tiled framebuffer and DDR3 */
+	if (window.tiling.mode == TEGRA_BO_TILING_MODE_TILED)
+		bandwidth *= 2;
+
+	return bandwidth;
+}
+
+static unsigned long
+tegra114_plane_memory_bandwidth(struct drm_plane_state *state)
+{
+	struct tegra_dc_window window;
+	unsigned long bandwidth;
+
+	bandwidth = tegra_plane_memory_bandwidth(state, &window, 12, 10);
+
+	/* x2: memory overfetch for tiled framebuffer and DDR3 */
+	if (window.tiling.mode == TEGRA_BO_TILING_MODE_TILED)
+		bandwidth *= 2;
+
+	return bandwidth;
+}
+
+static unsigned long
+tegra124_plane_memory_bandwidth(struct drm_plane_state *state)
+{
+	return tegra_plane_memory_bandwidth(state, NULL, 12, 10);
+}
+
 static const u32 tegra20_primary_formats[] = {
 	DRM_FORMAT_ARGB4444,
 	DRM_FORMAT_ARGB1555,
@@ -608,8 +738,10 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 	int err;
 
 	/* no need for further checks if the plane is being disabled */
-	if (!state->crtc)
+	if (!state->crtc) {
+		plane_state->memory_bandwidth = 0;
 		return 0;
+	}
 
 	err = tegra_plane_format(state->fb->format->format,
 				 &plane_state->format,
@@ -662,6 +794,8 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 	if (err < 0)
 		return err;
 
+	plane_state->memory_bandwidth = dc->soc->plane_memory_bandwidth(state);
+
 	return 0;
 }
 
@@ -1186,6 +1320,7 @@ tegra_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 	copy->pclk = state->pclk;
 	copy->div = state->div;
 	copy->planes = state->planes;
+	copy->memory_bandwidth = state->memory_bandwidth;
 
 	return &copy->base;
 }
@@ -1768,6 +1903,8 @@ static void tegra_crtc_atomic_disable(struct drm_crtc *crtc,
 	err = host1x_client_suspend(&dc->client);
 	if (err < 0)
 		dev_err(dc->dev, "failed to suspend: %d\n", err);
+
+	icc_set_bw(dc->icc_bandwidth, 0, 0);
 }
 
 static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
@@ -1779,6 +1916,9 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 	u32 value;
 	int err;
 
+	icc_set_bw(dc->icc_bandwidth, state->memory_bandwidth,
+		   state->memory_bandwidth);
+
 	err = host1x_client_resume(&dc->client);
 	if (err < 0) {
 		dev_err(dc->dev, "failed to resume: %d\n", err);
@@ -1892,6 +2032,9 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 static void tegra_crtc_atomic_begin(struct drm_crtc *crtc,
 				    struct drm_crtc_state *old_crtc_state)
 {
+	struct tegra_dc_state *dc_old_state = to_dc_state(old_crtc_state);
+	struct tegra_dc_state *dc_state = to_dc_state(crtc->state);
+	struct tegra_dc *dc = to_tegra_dc(crtc);
 	unsigned long flags;
 
 	if (crtc->state->event) {
@@ -1906,6 +2049,25 @@ static void tegra_crtc_atomic_begin(struct drm_crtc *crtc,
 
 		crtc->state->event = NULL;
 	}
+
+	if (old_crtc_state && old_crtc_state->active) {
+		/*
+		 * Raise memory bandwidth before changes take effect if it
+		 * goes from low to high.
+		 */
+		if (dc_old_state->memory_bandwidth < dc_state->memory_bandwidth)
+			icc_set_bw(dc->icc_bandwidth,
+				   dc_state->memory_bandwidth,
+				   dc_state->memory_bandwidth);
+	} else {
+		/*
+		 * Raise memory bandwidth before changes take effect if
+		 * CRTC is turning on.
+		 */
+		icc_set_bw(dc->icc_bandwidth,
+			   dc_state->memory_bandwidth,
+			   dc_state->memory_bandwidth);
+	}
 }
 
 static void tegra_crtc_atomic_flush(struct drm_crtc *crtc,
@@ -1924,7 +2086,80 @@ static void tegra_crtc_atomic_flush(struct drm_crtc *crtc,
 	value = tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
 }
 
+static bool
+tegra_plane_overlaps_other_plane(struct drm_crtc_state *state,
+				 const struct drm_plane_state *plane_state)
+{
+	const struct drm_plane_state *other_state;
+	struct drm_plane *plane;
+	struct drm_rect rect;
+
+	drm_atomic_crtc_state_for_each_plane_state(plane, other_state, state) {
+		rect = plane_state->dst;
+
+		if (other_state == plane_state)
+			continue;
+
+		if (!other_state->visible || !other_state->fb)
+			continue;
+
+		if (drm_rect_intersect(&rect, &other_state->dst))
+			return true;
+	}
+
+	return false;
+}
+
+static int tegra_crtc_atomic_check(struct drm_crtc *crtc,
+				   struct drm_crtc_state *state)
+{
+	struct tegra_dc_state *dc_state = to_dc_state(state);
+	const struct drm_plane_state *plane_state;
+	const struct tegra_plane_state *tegra;
+	unsigned long long bandwidth = 0;
+	struct drm_plane *plane;
+
+	/*
+	 * For overlapping planes pixel's data is fetched for each plane at
+	 * the same time, hence bandwidth is accumulated in this case.
+	 */
+	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, state) {
+		tegra = to_tegra_plane_state(plane_state);
+
+		if (tegra_plane_overlaps_other_plane(state, plane_state))
+			bandwidth += tegra->memory_bandwidth;
+		else
+			bandwidth = max_t(u64, bandwidth,
+					  tegra->memory_bandwidth);
+	}
+
+	dc_state->memory_bandwidth = min_t(u64, bandwidth, U32_MAX);
+
+	return 0;
+}
+
+void tegra_crtc_atomic_post_commit(struct drm_crtc *crtc,
+				   struct drm_crtc_state *old_crtc_state)
+{
+	struct tegra_dc_state *dc_old_state = to_dc_state(old_crtc_state);
+	struct tegra_dc_state *dc_state = to_dc_state(crtc->state);
+	struct tegra_dc *dc = to_tegra_dc(crtc);
+
+	if (!dc_old_state)
+		return;
+
+	/*
+	 * Drop memory bandwidth after changes take effect if it goes from
+	 * high to low.
+	 */
+	if (dc_old_state->memory_bandwidth > dc_state->memory_bandwidth)
+		icc_set_bw(dc->icc_bandwidth,
+			   dc_state->memory_bandwidth,
+			   dc_state->memory_bandwidth);
+}
+
 static const struct drm_crtc_helper_funcs tegra_crtc_helper_funcs = {
+	.atomic_check = tegra_crtc_atomic_check,
 	.atomic_begin = tegra_crtc_atomic_begin,
 	.atomic_flush = tegra_crtc_atomic_flush,
 	.atomic_enable = tegra_crtc_atomic_enable,
@@ -2216,6 +2451,7 @@ static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
 	.modifiers = tegra20_modifiers,
 	.has_win_a_without_filters = true,
 	.has_win_c_without_vert_filter = true,
+	.plane_memory_bandwidth = tegra20_plane_memory_bandwidth,
 };
 
 static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
@@ -2235,6 +2471,7 @@ static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
 	.modifiers = tegra20_modifiers,
 	.has_win_a_without_filters = false,
 	.has_win_c_without_vert_filter = false,
+	.plane_memory_bandwidth = tegra30_plane_memory_bandwidth,
 };
 
 static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
@@ -2254,6 +2491,7 @@ static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
 	.modifiers = tegra20_modifiers,
 	.has_win_a_without_filters = false,
 	.has_win_c_without_vert_filter = false,
+	.plane_memory_bandwidth = tegra114_plane_memory_bandwidth,
 };
 
 static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
@@ -2273,6 +2511,7 @@ static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
 	.modifiers = tegra124_modifiers,
 	.has_win_a_without_filters = false,
 	.has_win_c_without_vert_filter = false,
+	.plane_memory_bandwidth = tegra124_plane_memory_bandwidth,
 };
 
 static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
@@ -2292,6 +2531,7 @@ static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
 	.modifiers = tegra124_modifiers,
 	.has_win_a_without_filters = false,
 	.has_win_c_without_vert_filter = false,
+	.plane_memory_bandwidth = tegra124_plane_memory_bandwidth,
 };
 
 static const struct tegra_windowgroup_soc tegra186_dc_wgrps[] = {
@@ -2340,6 +2580,7 @@ static const struct tegra_dc_soc_info tegra186_dc_soc_info = {
 	.has_nvdisplay = true,
 	.wgrps = tegra186_dc_wgrps,
 	.num_wgrps = ARRAY_SIZE(tegra186_dc_wgrps),
+	.plane_memory_bandwidth = tegra124_plane_memory_bandwidth,
 };
 
 static const struct tegra_windowgroup_soc tegra194_dc_wgrps[] = {
@@ -2388,6 +2629,7 @@ static const struct tegra_dc_soc_info tegra194_dc_soc_info = {
 	.has_nvdisplay = true,
 	.wgrps = tegra194_dc_wgrps,
 	.num_wgrps = ARRAY_SIZE(tegra194_dc_wgrps),
+	.plane_memory_bandwidth = tegra124_plane_memory_bandwidth,
 };
 
 static const struct of_device_id tegra_dc_of_match[] = {
@@ -2494,6 +2736,7 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 
 static int tegra_dc_probe(struct platform_device *pdev)
 {
+	const char *level = KERN_ERR;
 	struct tegra_dc *dc;
 	int err;
 
@@ -2562,8 +2805,6 @@ static int tegra_dc_probe(struct platform_device *pdev)
 
 	err = tegra_dc_rgb_probe(dc);
 	if (err < 0 && err != -ENODEV) {
-		const char *level = KERN_ERR;
-
 		if (err == -EPROBE_DEFER)
 			level = KERN_DEBUG;
 
@@ -2572,6 +2813,25 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	/*
+	 * The display controller memory bandwidth management isn't trivial
+	 * because it requires the knowledge about the DC hardware state
+	 * in order to make a proper decisions. It's not easy to convey
+	 * that information to the ICC provider, so we will just use the
+	 * first interconnect path for the memory bandwidth management and
+	 * make all the decisions within the DC driver, for simplicity.
+	 */
+	dc->icc_bandwidth = of_icc_get(dc->dev, "display0a");
+	err = PTR_ERR_OR_ZERO(dc->icc_bandwidth);
+	if (err) {
+		if (err == -EPROBE_DEFER)
+			level = KERN_DEBUG;
+
+		dev_printk(level, dc->dev,
+			   "failed to get display0a interconnect: %d\n", err);
+		goto remove_rgb;
+	}
+
 	platform_set_drvdata(pdev, dc);
 	pm_runtime_enable(&pdev->dev);
 
@@ -2590,6 +2850,9 @@ static int tegra_dc_probe(struct platform_device *pdev)
 
 disable_pm:
 	pm_runtime_disable(&pdev->dev);
+	icc_put(dc->icc_bandwidth);
+
+remove_rgb:
 	tegra_dc_rgb_remove(dc);
 
 	return err;
@@ -2607,6 +2870,8 @@ static int tegra_dc_remove(struct platform_device *pdev)
 		return err;
 	}
 
+	icc_put(dc->icc_bandwidth);
+
 	err = tegra_dc_rgb_remove(dc);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to remove RGB output: %d\n", err);
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 3d8ddccd758f..3a0ff57c5169 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -8,6 +8,7 @@
 #define TEGRA_DC_H 1
 
 #include <linux/host1x.h>
+#include <linux/interconnect.h>
 
 #include <drm/drm_crtc.h>
 
@@ -23,6 +24,8 @@ struct tegra_dc_state {
 	unsigned int div;
 
 	u32 planes;
+
+	unsigned long memory_bandwidth;
 };
 
 static inline struct tegra_dc_state *to_dc_state(struct drm_crtc_state *state)
@@ -66,6 +69,7 @@ struct tegra_dc_soc_info {
 	const u64 *modifiers;
 	bool has_win_a_without_filters;
 	bool has_win_c_without_vert_filter;
+	unsigned long (*plane_memory_bandwidth)(struct drm_plane_state *state);
 };
 
 struct tegra_dc {
@@ -90,6 +94,8 @@ struct tegra_dc {
 	struct drm_info_list *debugfs_files;
 
 	const struct tegra_dc_soc_info *soc;
+
+	struct icc_path *icc_bandwidth;
 };
 
 static inline struct tegra_dc *
@@ -150,6 +156,8 @@ int tegra_dc_state_setup_clock(struct tegra_dc *dc,
 			       struct drm_crtc_state *crtc_state,
 			       struct clk *clk, unsigned long pclk,
 			       unsigned int div);
+void tegra_crtc_atomic_post_commit(struct drm_crtc *crtc,
+				   struct drm_crtc_state *old_crtc_state);
 
 /* from rgb.c */
 int tegra_dc_rgb_probe(struct tegra_dc *dc);
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 211906347f3f..81e58f90f5c9 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -20,6 +20,7 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_vblank.h>
 
+#include "dc.h"
 #include "drm.h"
 #include "gem.h"
 
@@ -59,6 +60,22 @@ static const struct drm_mode_config_funcs tegra_drm_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+static void tegra_atomic_post_commit(struct drm_device *drm,
+				     struct drm_atomic_state *old_state)
+{
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	struct drm_crtc *crtc;
+	unsigned int i;
+
+	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state,
+				      new_crtc_state, i) {
+		if (!new_crtc_state->active)
+			continue;
+
+		tegra_crtc_atomic_post_commit(crtc, old_crtc_state);
+	}
+}
+
 static void tegra_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *drm = old_state->dev;
@@ -75,6 +92,8 @@ static void tegra_atomic_commit_tail(struct drm_atomic_state *old_state)
 	} else {
 		drm_atomic_helper_commit_tail_rpm(old_state);
 	}
+
+	tegra_atomic_post_commit(drm, old_state);
 }
 
 static const struct drm_mode_config_helper_funcs
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 9ccfb56e9b01..f94925744105 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -63,6 +63,7 @@ tegra_plane_atomic_duplicate_state(struct drm_plane *plane)
 	copy->swap = state->swap;
 	copy->bottom_up = state->bottom_up;
 	copy->opaque = state->opaque;
+	copy->memory_bandwidth = state->memory_bandwidth;
 
 	for (i = 0; i < 2; i++)
 		copy->blending[i] = state->blending[i];
diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/plane.h
index a158a915109a..5227c7a9ad8b 100644
--- a/drivers/gpu/drm/tegra/plane.h
+++ b/drivers/gpu/drm/tegra/plane.h
@@ -51,10 +51,12 @@ struct tegra_plane_state {
 	/* used for legacy blending support only */
 	struct tegra_plane_legacy_blending_state blending[2];
 	bool opaque;
+
+	unsigned long memory_bandwidth;
 };
 
 static inline struct tegra_plane_state *
-to_tegra_plane_state(struct drm_plane_state *state)
+to_tegra_plane_state(const struct drm_plane_state *state)
 {
 	if (state)
 		return container_of(state, struct tegra_plane_state, base);
-- 
2.26.0


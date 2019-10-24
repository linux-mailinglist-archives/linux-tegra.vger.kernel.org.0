Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 098BAE3899
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439900AbfJXQqR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:17 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46218 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439894AbfJXQqR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:17 -0400
Received: by mail-wr1-f68.google.com with SMTP id n15so16071880wrw.13
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=joZo+BWPZThfhlDpKBzdXgwzEqvhDB4Lk+BS10COeWA=;
        b=E70YqYgU5PCSYUtPQSiG2KMOz64dncOipa29l7T1Yl/4NJ3pIxIspzO8Yn2XwCt0mQ
         +W70ldmjgk6pIdGWUm9JD14EW8P2qIM1TZFtgBhJXcYFIF+Ut7ynFfWTmxAtwxQ4Xkb/
         lUTosN1bbQTjkUAxwx0mxUxnn2t8T8GNzHsBuCPD79kORmxCjN1JMGZZ77ZcSZpwNfmY
         HGLPUwnKTMjVjBINQi+zaMmI9OeGTkR9dTNGqCAakLDPke37SEMEKqkacNj8cR+yBiXT
         vny45FXJ1pujQec3ZKVCRiU6Au9SeZLFrLczeGIkYvykVS3CVL0HUcef/aS8LcI2SWFq
         zhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=joZo+BWPZThfhlDpKBzdXgwzEqvhDB4Lk+BS10COeWA=;
        b=iNkXy75WZEDt5+vtala0T8knu86Z+WMqE65rAW0D6RuGb6Qd80chIFF1E5zy6tp1qk
         HUhtajq4aHRg2jT7tLfZxsrfasJFJR6MS57G+97fDF0HxoPP4dZkLru1htB2Gc/2tyOa
         EwmQdkNFE6iPft2gNRNaWYTEHgOfBqsgAhs4BJoEho31EMTsqZJp4uE6vvVO8vqzfRvR
         4xrv8qONFP9CcvUlPIEnaRTG+pxgHUtO8+hSKKgsAsAm3uLtQGrzn7EAXruGypMdG0u8
         +btYbYQsGlgdyEH9vCcm6GMaViGrZcI8RYN82ERxnqB4K7l+SDbcS9fAVb75KdLayT3R
         7IvQ==
X-Gm-Message-State: APjAAAW3qJw1LjCtEzijGnyDkB0RJVsCePH0n0EweFIg+ewdDu4M6zaX
        RKPiV/G1FuFdFUF8cPD/hCqhl0c3
X-Google-Smtp-Source: APXvYqwkz9er/GhH6UB4gPyOoVw5v+gKNFltNjnWjyMG0M9HlRp8R3/SfBp1DWCLyUm06LWse8J48A==
X-Received: by 2002:a5d:544b:: with SMTP id w11mr4744025wrv.205.1571935573338;
        Thu, 24 Oct 2019 09:46:13 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id r81sm3058153wme.16.2019.10.24.09.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 16/32] drm/tegra: dp: Add DisplayPort link training helper
Date:   Thu, 24 Oct 2019 18:45:18 +0200
Message-Id: <20191024164534.132764-17-thierry.reding@gmail.com>
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

Add a helper that will perform link training as described in the
DisplayPort specification.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dp.c | 456 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/dp.h |  68 ++++++
 2 files changed, 524 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index bcf9df965ef8..5b6765d653b4 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -334,6 +334,14 @@ int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link)
 	u8 values[2], value;
 	int err;
 
+	if (link->ops && link->ops->configure) {
+		err = link->ops->configure(link);
+		if (err < 0) {
+			DRM_ERROR("failed to configure DP link: %d\n", err);
+			return err;
+		}
+	}
+
 	values[0] = drm_dp_link_rate_to_bw_code(link->rate);
 	values[1] = link->lanes;
 
@@ -416,3 +424,451 @@ int drm_dp_link_choose(struct drm_dp_link *link,
 
 	return -ERANGE;
 }
+
+/**
+ * DOC: Link training
+ *
+ * These functions contain common logic and helpers to implement DisplayPort
+ * link training.
+ */
+
+/**
+ * drm_dp_link_train_init() - initialize DisplayPort link training state
+ * @train: DisplayPort link training state
+ */
+void drm_dp_link_train_init(struct drm_dp_link_train *train)
+{
+	struct drm_dp_link_train_set *request = &train->request;
+	struct drm_dp_link_train_set *adjust = &train->adjust;
+	unsigned int i;
+
+	for (i = 0; i < 4; i++) {
+		request->voltage_swing[i] = 0;
+		adjust->voltage_swing[i] = 0;
+
+		request->pre_emphasis[i] = 0;
+		adjust->pre_emphasis[i] = 0;
+
+		request->post_cursor[i] = 0;
+		adjust->post_cursor[i] = 0;
+	}
+
+	train->pattern = DP_TRAINING_PATTERN_DISABLE;
+	train->clock_recovered = false;
+	train->channel_equalized = false;
+}
+
+static bool drm_dp_link_train_valid(const struct drm_dp_link_train *train)
+{
+	return train->clock_recovered && train->channel_equalized;
+}
+
+static int drm_dp_link_apply_training(struct drm_dp_link *link)
+{
+	struct drm_dp_link_train_set *request = &link->train.request;
+	unsigned int lanes = link->lanes, *vs, *pe, *pc, i;
+	struct drm_dp_aux *aux = link->aux;
+	u8 values[4], pattern = 0;
+	int err;
+
+	err = link->ops->apply_training(link);
+	if (err < 0) {
+		DRM_ERROR("failed to apply link training: %d\n", err);
+		return err;
+	}
+
+	vs = request->voltage_swing;
+	pe = request->pre_emphasis;
+	pc = request->post_cursor;
+
+	/* write currently selected voltage-swing and pre-emphasis levels */
+	for (i = 0; i < lanes; i++)
+		values[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL(vs[i]) |
+			    DP_TRAIN_PRE_EMPHASIS_LEVEL(pe[i]);
+
+	err = drm_dp_dpcd_write(aux, DP_TRAINING_LANE0_SET, values, lanes);
+	if (err < 0) {
+		DRM_ERROR("failed to set training parameters: %d\n", err);
+		return err;
+	}
+
+	/* write currently selected post-cursor level (if supported) */
+	if (link->revision >= 0x12 && link->rate == 540000) {
+		values[0] = values[1] = 0;
+
+		for (i = 0; i < lanes; i++)
+			values[i / 2] |= DP_LANE_POST_CURSOR(i, pc[i]);
+
+		err = drm_dp_dpcd_write(aux, DP_TRAINING_LANE0_1_SET2, values,
+					DIV_ROUND_UP(lanes, 2));
+		if (err < 0) {
+			DRM_ERROR("failed to set post-cursor: %d\n", err);
+			return err;
+		}
+	}
+
+	/* write link pattern */
+	if (link->train.pattern != DP_TRAINING_PATTERN_DISABLE)
+		pattern |= DP_LINK_SCRAMBLING_DISABLE;
+
+	pattern |= link->train.pattern;
+
+	err = drm_dp_dpcd_writeb(aux, DP_TRAINING_PATTERN_SET, pattern);
+	if (err < 0) {
+		DRM_ERROR("failed to set training pattern: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static void drm_dp_link_train_wait(struct drm_dp_link *link)
+{
+	unsigned long min = 0;
+
+	switch (link->train.pattern) {
+	case DP_TRAINING_PATTERN_1:
+		min = link->aux_rd_interval.cr;
+		break;
+
+	case DP_TRAINING_PATTERN_2:
+	case DP_TRAINING_PATTERN_3:
+		min = link->aux_rd_interval.ce;
+		break;
+
+	default:
+		break;
+	}
+
+	if (min > 0)
+		usleep_range(min, 2 * min);
+}
+
+static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
+					u8 status[DP_LINK_STATUS_SIZE])
+{
+	struct drm_dp_link_train_set *adjust = &link->train.adjust;
+	unsigned int i;
+
+	for (i = 0; i < link->lanes; i++) {
+		adjust->voltage_swing[i] =
+			drm_dp_get_adjust_request_voltage(status, i) >>
+				DP_TRAIN_VOLTAGE_SWING_SHIFT;
+
+		adjust->pre_emphasis[i] =
+			drm_dp_get_adjust_request_pre_emphasis(status, i) >>
+				DP_TRAIN_PRE_EMPHASIS_SHIFT;
+
+		adjust->post_cursor[i] =
+			drm_dp_get_adjust_request_post_cursor(status, i);
+	}
+}
+
+static void drm_dp_link_train_adjust(struct drm_dp_link_train *train)
+{
+	struct drm_dp_link_train_set *request = &train->request;
+	struct drm_dp_link_train_set *adjust = &train->adjust;
+	unsigned int i;
+
+	for (i = 0; i < 4; i++)
+		if (request->voltage_swing[i] != adjust->voltage_swing[i])
+			request->voltage_swing[i] = adjust->voltage_swing[i];
+
+	for (i = 0; i < 4; i++)
+		if (request->pre_emphasis[i] != adjust->pre_emphasis[i])
+			request->pre_emphasis[i] = adjust->pre_emphasis[i];
+
+	for (i = 0; i < 4; i++)
+		if (request->post_cursor[i] != adjust->post_cursor[i])
+			request->post_cursor[i] = adjust->post_cursor[i];
+}
+
+static int drm_dp_link_recover_clock(struct drm_dp_link *link)
+{
+	u8 status[DP_LINK_STATUS_SIZE];
+	int err;
+
+	err = drm_dp_link_apply_training(link);
+	if (err < 0)
+		return err;
+
+	drm_dp_link_train_wait(link);
+
+	err = drm_dp_dpcd_read_link_status(link->aux, status);
+	if (err < 0) {
+		DRM_ERROR("failed to read link status: %d\n", err);
+		return err;
+	}
+
+	if (!drm_dp_clock_recovery_ok(status, link->lanes))
+		drm_dp_link_get_adjustments(link, status);
+	else
+		link->train.clock_recovered = true;
+
+	return 0;
+}
+
+static int drm_dp_link_clock_recovery(struct drm_dp_link *link)
+{
+	unsigned int repeat;
+	int err;
+
+	/* start clock recovery using training pattern 1 */
+	link->train.pattern = DP_TRAINING_PATTERN_1;
+
+	for (repeat = 1; repeat < 5; repeat++) {
+		err = drm_dp_link_recover_clock(link);
+		if (err < 0) {
+			DRM_ERROR("failed to recover clock: %d\n", err);
+			return err;
+		}
+
+		drm_dp_link_train_adjust(&link->train);
+
+		if (link->train.clock_recovered)
+			break;
+	}
+
+	return 0;
+}
+
+static int drm_dp_link_equalize_channel(struct drm_dp_link *link)
+{
+	struct drm_dp_aux *aux = link->aux;
+	u8 status[DP_LINK_STATUS_SIZE];
+	int err;
+
+	err = drm_dp_link_apply_training(link);
+	if (err < 0)
+		return err;
+
+	drm_dp_link_train_wait(link);
+
+	err = drm_dp_dpcd_read_link_status(aux, status);
+	if (err < 0) {
+		DRM_ERROR("failed to read link status: %d\n", err);
+		return err;
+	}
+
+	if (!drm_dp_clock_recovery_ok(status, link->lanes)) {
+		DRM_ERROR("clock recovery lost while equalizing channel\n");
+		link->train.clock_recovered = false;
+		return 0;
+	}
+
+	if (!drm_dp_channel_eq_ok(status, link->lanes))
+		drm_dp_link_get_adjustments(link, status);
+	else
+		link->train.channel_equalized = true;
+
+	return 0;
+}
+
+static int drm_dp_link_channel_equalization(struct drm_dp_link *link)
+{
+	unsigned int repeat;
+	int err;
+
+	/* start channel equalization using pattern 2 or 3 */
+	if (link->caps.tps3_supported)
+		link->train.pattern = DP_TRAINING_PATTERN_3;
+	else
+		link->train.pattern = DP_TRAINING_PATTERN_2;
+
+	for (repeat = 1; repeat < 5; repeat++) {
+		err = drm_dp_link_equalize_channel(link);
+		if (err < 0) {
+			DRM_ERROR("failed to equalize channel: %d\n", err);
+			return err;
+		}
+
+		drm_dp_link_train_adjust(&link->train);
+
+		if (link->train.channel_equalized)
+			break;
+	}
+
+	return 0;
+}
+
+static int drm_dp_link_downgrade(struct drm_dp_link *link)
+{
+	switch (link->rate) {
+	case 162000:
+		return -EINVAL;
+
+	case 270000:
+		link->rate = 162000;
+		break;
+
+	case 540000:
+		link->rate = 270000;
+		return 0;
+	}
+
+	return 0;
+}
+
+static void drm_dp_link_train_disable(struct drm_dp_link *link)
+{
+	int err;
+
+	link->train.pattern = DP_TRAINING_PATTERN_DISABLE;
+
+	err = drm_dp_link_apply_training(link);
+	if (err < 0)
+		DRM_ERROR("failed to disable link training: %d\n", err);
+}
+
+static int drm_dp_link_train_full(struct drm_dp_link *link)
+{
+	int err;
+
+retry:
+	DRM_DEBUG_KMS("full-training link: %u lane%s at %u MHz\n",
+		      link->lanes, (link->lanes > 1) ? "s" : "",
+		      link->rate / 100);
+
+	err = drm_dp_link_configure(link->aux, link);
+	if (err < 0) {
+		DRM_ERROR("failed to configure DP link: %d\n", err);
+		return err;
+	}
+
+	err = drm_dp_link_clock_recovery(link);
+	if (err < 0) {
+		DRM_ERROR("clock recovery failed: %d\n", err);
+		goto out;
+	}
+
+	if (!link->train.clock_recovered) {
+		DRM_ERROR("clock recovery failed, downgrading link\n");
+
+		err = drm_dp_link_downgrade(link);
+		if (err < 0)
+			goto out;
+
+		goto retry;
+	}
+
+	DRM_DEBUG_KMS("clock recovery succeeded\n");
+
+	err = drm_dp_link_channel_equalization(link);
+	if (err < 0) {
+		DRM_ERROR("channel equalization failed: %d\n", err);
+		goto out;
+	}
+
+	if (!link->train.channel_equalized) {
+		DRM_ERROR("channel equalization failed, downgrading link\n");
+
+		err = drm_dp_link_downgrade(link);
+		if (err < 0)
+			goto out;
+
+		goto retry;
+	}
+
+	DRM_DEBUG_KMS("channel equalization succeeded\n");
+
+out:
+	drm_dp_link_train_disable(link);
+	return err;
+}
+
+static int drm_dp_link_train_fast(struct drm_dp_link *link)
+{
+	u8 status[DP_LINK_STATUS_SIZE];
+	int err;
+
+	DRM_DEBUG_KMS("fast-training link: %u lane%s at %u MHz\n",
+		      link->lanes, (link->lanes > 1) ? "s" : "",
+		      link->rate / 100);
+
+	err = drm_dp_link_configure(link->aux, link);
+	if (err < 0) {
+		DRM_ERROR("failed to configure DP link: %d\n", err);
+		return err;
+	}
+
+	/* transmit training pattern 1 for 500 microseconds */
+	link->train.pattern = DP_TRAINING_PATTERN_1;
+
+	err = drm_dp_link_apply_training(link);
+	if (err < 0)
+		goto out;
+
+	usleep_range(500, 1000);
+
+	/* transmit training pattern 2 or 3 for 500 microseconds */
+	if (link->caps.tps3_supported)
+		link->train.pattern = DP_TRAINING_PATTERN_3;
+	else
+		link->train.pattern = DP_TRAINING_PATTERN_2;
+
+	err = drm_dp_link_apply_training(link);
+	if (err < 0)
+		goto out;
+
+	usleep_range(500, 1000);
+
+	err = drm_dp_dpcd_read_link_status(link->aux, status);
+	if (err < 0) {
+		DRM_ERROR("failed to read link status: %d\n", err);
+		goto out;
+	}
+
+	if (!drm_dp_clock_recovery_ok(status, link->lanes)) {
+		DRM_ERROR("clock recovery failed\n");
+		err = -EIO;
+	}
+
+	if (!drm_dp_channel_eq_ok(status, link->lanes)) {
+		DRM_ERROR("channel equalization failed\n");
+		err = -EIO;
+	}
+
+out:
+	drm_dp_link_train_disable(link);
+	return err;
+}
+
+/**
+ * drm_dp_link_train() - perform DisplayPort link training
+ * @link: a DP link object
+ *
+ * Uses the context stored in the DP link object to perform link training. It
+ * is expected that drivers will call drm_dp_link_probe() to obtain the link
+ * capabilities before performing link training.
+ *
+ * If the sink supports fast link training (no AUX CH handshake) and valid
+ * training settings are available, this function will try to perform fast
+ * link training and fall back to full link training on failure.
+ *
+ * Returns: 0 on success or a negative error code on failure.
+ */
+int drm_dp_link_train(struct drm_dp_link *link)
+{
+	int err;
+
+	if (link->caps.fast_training) {
+		if (drm_dp_link_train_valid(&link->train)) {
+			err = drm_dp_link_train_fast(link);
+			if (err < 0)
+				DRM_ERROR("fast link training failed: %d\n",
+					  err);
+			else
+				return 0;
+		} else {
+			DRM_DEBUG_KMS("training parameters not available\n");
+		}
+	} else {
+		DRM_DEBUG_KMS("fast link training not supported\n");
+	}
+
+	err = drm_dp_link_train_full(link);
+	if (err < 0)
+		DRM_ERROR("full link training failed: %d\n", err);
+
+	return err;
+}
diff --git a/drivers/gpu/drm/tegra/dp.h b/drivers/gpu/drm/tegra/dp.h
index a20ee9f1f1b6..cb12ed0c54e7 100644
--- a/drivers/gpu/drm/tegra/dp.h
+++ b/drivers/gpu/drm/tegra/dp.h
@@ -12,6 +12,7 @@
 struct drm_display_info;
 struct drm_display_mode;
 struct drm_dp_aux;
+struct drm_dp_link;
 
 /**
  * struct drm_dp_link_caps - DP link capabilities
@@ -56,6 +57,55 @@ struct drm_dp_link_caps {
 void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
 			   const struct drm_dp_link_caps *src);
 
+/**
+ * struct drm_dp_link_ops - DP link operations
+ */
+struct drm_dp_link_ops {
+	/**
+	 * @apply_training:
+	 */
+	int (*apply_training)(struct drm_dp_link *link);
+
+	/**
+	 * @configure:
+	 */
+	int (*configure)(struct drm_dp_link *link);
+};
+
+#define DP_TRAIN_VOLTAGE_SWING_LEVEL(x) ((x) << 0)
+#define DP_TRAIN_PRE_EMPHASIS_LEVEL(x) ((x) << 3)
+#define DP_LANE_POST_CURSOR(i, x) (((x) & 0x3) << (((i) & 1) << 2))
+
+/**
+ * struct drm_dp_link_train_set - link training settings
+ * @voltage_swing: per-lane voltage swing
+ * @pre_emphasis: per-lane pre-emphasis
+ * @post_cursor: per-lane post-cursor
+ */
+struct drm_dp_link_train_set {
+	unsigned int voltage_swing[4];
+	unsigned int pre_emphasis[4];
+	unsigned int post_cursor[4];
+};
+
+/**
+ * struct drm_dp_link_train - link training state information
+ * @request: currently requested settings
+ * @adjust: adjustments requested by sink
+ * @pattern: currently requested training pattern
+ * @clock_recovered: flag to track if clock recovery has completed
+ * @channel_equalized: flag to track if channel equalization has completed
+ */
+struct drm_dp_link_train {
+	struct drm_dp_link_train_set request;
+	struct drm_dp_link_train_set adjust;
+
+	unsigned int pattern;
+
+	bool clock_recovered;
+	bool channel_equalized;
+};
+
 /**
  * struct drm_dp_link - DP link capabilities and configuration
  * @revision: DP specification revision supported on the link
@@ -92,6 +142,21 @@ struct drm_dp_link {
 
 	unsigned long rates[DP_MAX_SUPPORTED_RATES];
 	unsigned int num_rates;
+
+	/**
+	 * @ops: DP link operations
+	 */
+	const struct drm_dp_link_ops *ops;
+
+	/**
+	 * @aux: DP AUX channel
+	 */
+	struct drm_dp_aux *aux;
+
+	/**
+	 * @train: DP link training state
+	 */
+	struct drm_dp_link_train train;
 };
 
 int drm_dp_link_add_rate(struct drm_dp_link *link, unsigned long rate);
@@ -106,4 +171,7 @@ int drm_dp_link_choose(struct drm_dp_link *link,
 		       const struct drm_display_mode *mode,
 		       const struct drm_display_info *info);
 
+void drm_dp_link_train_init(struct drm_dp_link_train *train);
+int drm_dp_link_train(struct drm_dp_link *link);
+
 #endif
-- 
2.23.0


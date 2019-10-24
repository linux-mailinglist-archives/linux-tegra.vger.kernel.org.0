Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD8CFE3882
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436823AbfJXQpr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:45:47 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34227 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436822AbfJXQpr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:45:47 -0400
Received: by mail-wr1-f66.google.com with SMTP id t16so21732739wrr.1
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mmTEcYYOmMVHIgwlChAlJWnry5CbvcEzASf8WlmOdH8=;
        b=rZMG/4BaNuz8+ClmCKXMj58pw7SG855zvpbJZgbGHdcLErwPuIipT9j7mIW5zzJapT
         kKPpi6C68hGR7U+OFiXo0rutEu/Hw+MbkOcSYpkAX0Vr3xINuArUvqZIKJ72r9z4dWy6
         wWt1wC8Qa4xAB8HjRNjJRyYQoePJXp6x8su3ijlOXKBpl2fkr0KAHXCyIiVULpPk7Njj
         KVJ5mm+rxKkHvVZQOUKfNAmJuGhtX3NIdjvb9qFxzGepoNqMbvYJjEzMV+RTYserOcpq
         hwTKKpDDHU/6KzZr5089azRe4dj3DaKOJK1QIPuvV/SfP+kdL8YUvyl4EWMYwv2BgX01
         v+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mmTEcYYOmMVHIgwlChAlJWnry5CbvcEzASf8WlmOdH8=;
        b=ME86iIUb7Ip84IpzIF9dwAp/1eM14QZQHX8gE+oIjUGF0n1WfpCE0rqvnRb4CblvG1
         PgjR72Y9ukjv/uF6/8KQzrVYOfpCD+qYiAXgpzE8rjCq22ihMS+YjFaKQrnw9Ik16S/u
         qijs8rGCH990aG0epaGiG5RFPo/AaqbjbCE9BWfsVbYbjPgvGoTOtOquqlQesQnl/1oy
         3fUhCFrD8+SM9k0BwRrfqiyaM38MtYPKsjPQcGkIH0m0fhT0wdTcHD0HsPWg+2OlkkCl
         aEycZYBIuJNC+PATht4Aop+LjrwjqKt0VocCvWBV8Qka48EgttIeV0B/YRHNds1bOdUV
         SuhQ==
X-Gm-Message-State: APjAAAUTqXtqKpppHNYTUyQm7DBddNFMlUAUCM3/IXDafSvDCE1kIH3p
        Oj5OosbsvhBNAcPky3QHIYM=
X-Google-Smtp-Source: APXvYqztzQhFZ0jCrnFjNG5K/u0QloolIVfKSzI5/Asqw55Zi+2J0kMPh5AJXMUmHCD7ibJjy27bPA==
X-Received: by 2002:adf:ffc5:: with SMTP id x5mr4759973wrs.93.1571935543980;
        Thu, 24 Oct 2019 09:45:43 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id d2sm3453994wmd.2.2019.10.24.09.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:45:42 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 03/32] drm/tegra: dp: Track link capabilities alongside settings
Date:   Thu, 24 Oct 2019 18:45:05 +0200
Message-Id: <20191024164534.132764-4-thierry.reding@gmail.com>
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

Store capabilities in max_* fields and add separate fields for the
currently selected settings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dp.c    | 16 +++++++++++-----
 drivers/gpu/drm/tegra/dp.h    | 15 ++++++++++-----
 drivers/gpu/drm/tegra/dpaux.c |  8 ++++----
 drivers/gpu/drm/tegra/sor.c   | 28 ++++++++++++++--------------
 4 files changed, 39 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index c19060b8753a..e55efd46a7d9 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -14,9 +14,12 @@ static void drm_dp_link_reset(struct drm_dp_link *link)
 		return;
 
 	link->revision = 0;
-	link->rate = 0;
-	link->num_lanes = 0;
+	link->max_rate = 0;
+	link->max_lanes = 0;
 	link->capabilities = 0;
+
+	link->rate = 0;
+	link->lanes = 0;
 }
 
 /**
@@ -42,12 +45,15 @@ int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
 		return err;
 
 	link->revision = values[0];
-	link->rate = drm_dp_bw_code_to_link_rate(values[1]);
-	link->num_lanes = values[2] & DP_MAX_LANE_COUNT_MASK;
+	link->max_rate = drm_dp_bw_code_to_link_rate(values[1]);
+	link->max_lanes = values[2] & DP_MAX_LANE_COUNT_MASK;
 
 	if (values[2] & DP_ENHANCED_FRAME_CAP)
 		link->capabilities |= DP_LINK_CAP_ENHANCED_FRAMING;
 
+	link->rate = link->max_rate;
+	link->lanes = link->max_lanes;
+
 	return 0;
 }
 
@@ -131,7 +137,7 @@ int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link)
 	int err;
 
 	values[0] = drm_dp_link_rate_to_bw_code(link->rate);
-	values[1] = link->num_lanes;
+	values[1] = link->lanes;
 
 	if (link->capabilities & DP_LINK_CAP_ENHANCED_FRAMING)
 		values[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
diff --git a/drivers/gpu/drm/tegra/dp.h b/drivers/gpu/drm/tegra/dp.h
index 1cf252e7309a..ec0342d4c95e 100644
--- a/drivers/gpu/drm/tegra/dp.h
+++ b/drivers/gpu/drm/tegra/dp.h
@@ -12,17 +12,22 @@ struct drm_dp_aux;
 #define DP_LINK_CAP_ENHANCED_FRAMING (1 << 0)
 
 /**
- * struct drm_dp_link - DP link capabilities
+ * struct drm_dp_link - DP link capabilities and configuration
  * @revision: DP specification revision supported on the link
- * @rate: maximum clock rate supported on the link
- * @num_lanes: maximum number of lanes supported on the link
+ * @max_rate: maximum clock rate supported on the link
+ * @max_lanes: maximum number of lanes supported on the link
  * @capabilities: bitmask of capabilities supported on the link
+ * @rate: currently configured link rate
+ * @lanes: currently configured number of lanes
  */
 struct drm_dp_link {
 	unsigned char revision;
-	unsigned int rate;
-	unsigned int num_lanes;
+	unsigned int max_rate;
+	unsigned int max_lanes;
 	unsigned long capabilities;
+
+	unsigned int rate;
+	unsigned int lanes;
 };
 
 int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link);
diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 883ed2f025c3..bd3361cea49b 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -849,14 +849,14 @@ int drm_dp_aux_train(struct drm_dp_aux *aux, struct drm_dp_link *link,
 	if (tp == DP_TRAINING_PATTERN_DISABLE)
 		return 0;
 
-	for (i = 0; i < link->num_lanes; i++)
+	for (i = 0; i < link->lanes; i++)
 		values[i] = DP_TRAIN_MAX_PRE_EMPHASIS_REACHED |
 			    DP_TRAIN_PRE_EMPH_LEVEL_0 |
 			    DP_TRAIN_MAX_SWING_REACHED |
 			    DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
 
 	err = drm_dp_dpcd_write(aux, DP_TRAINING_LANE0_SET, values,
-				link->num_lanes);
+				link->lanes);
 	if (err < 0)
 		return err;
 
@@ -868,13 +868,13 @@ int drm_dp_aux_train(struct drm_dp_aux *aux, struct drm_dp_link *link,
 
 	switch (tp) {
 	case DP_TRAINING_PATTERN_1:
-		if (!drm_dp_clock_recovery_ok(status, link->num_lanes))
+		if (!drm_dp_clock_recovery_ok(status, link->lanes))
 			return -EAGAIN;
 
 		break;
 
 	case DP_TRAINING_PATTERN_2:
-		if (!drm_dp_channel_eq_ok(status, link->num_lanes))
+		if (!drm_dp_channel_eq_ok(status, link->lanes))
 			return -EAGAIN;
 
 		break;
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 91d5c5041d2c..dca71250d88c 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -650,7 +650,7 @@ static int tegra_sor_dp_train_fast(struct tegra_sor *sor,
 	if (err < 0)
 		return err;
 
-	for (i = 0, value = 0; i < link->num_lanes; i++) {
+	for (i = 0, value = 0; i < link->lanes; i++) {
 		unsigned long lane = SOR_DP_TPG_CHANNEL_CODING |
 				     SOR_DP_TPG_SCRAMBLER_NONE |
 				     SOR_DP_TPG_PATTERN_TRAIN1;
@@ -671,7 +671,7 @@ static int tegra_sor_dp_train_fast(struct tegra_sor *sor,
 	value |= SOR_DP_SPARE_MACRO_SOR_CLK;
 	tegra_sor_writel(sor, value, SOR_DP_SPARE0);
 
-	for (i = 0, value = 0; i < link->num_lanes; i++) {
+	for (i = 0, value = 0; i < link->lanes; i++) {
 		unsigned long lane = SOR_DP_TPG_CHANNEL_CODING |
 				     SOR_DP_TPG_SCRAMBLER_NONE |
 				     SOR_DP_TPG_PATTERN_TRAIN2;
@@ -686,7 +686,7 @@ static int tegra_sor_dp_train_fast(struct tegra_sor *sor,
 	if (err < 0)
 		return err;
 
-	for (i = 0, value = 0; i < link->num_lanes; i++) {
+	for (i = 0, value = 0; i < link->lanes; i++) {
 		unsigned long lane = SOR_DP_TPG_CHANNEL_CODING |
 				     SOR_DP_TPG_SCRAMBLER_GALIOS |
 				     SOR_DP_TPG_PATTERN_NONE;
@@ -913,11 +913,11 @@ static int tegra_sor_compute_config(struct tegra_sor *sor,
 	u32 num_syms_per_line;
 	unsigned int i;
 
-	if (!link_rate || !link->num_lanes || !pclk || !config->bits_per_pixel)
+	if (!link_rate || !link->lanes || !pclk || !config->bits_per_pixel)
 		return -EINVAL;
 
-	output = link_rate * 8 * link->num_lanes;
 	input = pclk * config->bits_per_pixel;
+	output = link_rate * 8 * link->lanes;
 
 	if (input >= output)
 		return -ERANGE;
@@ -960,7 +960,7 @@ static int tegra_sor_compute_config(struct tegra_sor *sor,
 	watermark = div_u64(watermark + params.error, f);
 	config->watermark = watermark + (config->bits_per_pixel / 8) + 2;
 	num_syms_per_line = (mode->hdisplay * config->bits_per_pixel) *
-			    (link->num_lanes * 8);
+			    (link->lanes * 8);
 
 	if (config->watermark > 30) {
 		config->watermark = 30;
@@ -980,12 +980,12 @@ static int tegra_sor_compute_config(struct tegra_sor *sor,
 	if (link->capabilities & DP_LINK_CAP_ENHANCED_FRAMING)
 		config->hblank_symbols -= 3;
 
-	config->hblank_symbols -= 12 / link->num_lanes;
+	config->hblank_symbols -= 12 / link->lanes;
 
 	/* compute the number of symbols per vertical blanking interval */
 	num = (mode->hdisplay - 25) * link_rate;
 	config->vblank_symbols = div_u64(num, pclk);
-	config->vblank_symbols -= 36 / link->num_lanes + 4;
+	config->vblank_symbols -= 36 / link->lanes + 4;
 
 	dev_dbg(sor->dev, "blank symbols: H:%u V:%u\n", config->hblank_symbols,
 		config->vblank_symbols);
@@ -1831,17 +1831,17 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 	/* power DP lanes */
 	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
 
-	if (link.num_lanes <= 2)
+	if (link.lanes <= 2)
 		value &= ~(SOR_DP_PADCTL_PD_TXD_3 | SOR_DP_PADCTL_PD_TXD_2);
 	else
 		value |= SOR_DP_PADCTL_PD_TXD_3 | SOR_DP_PADCTL_PD_TXD_2;
 
-	if (link.num_lanes <= 1)
+	if (link.lanes <= 1)
 		value &= ~SOR_DP_PADCTL_PD_TXD_1;
 	else
 		value |= SOR_DP_PADCTL_PD_TXD_1;
 
-	if (link.num_lanes == 0)
+	if (link.lanes == 0)
 		value &= ~SOR_DP_PADCTL_PD_TXD_0;
 	else
 		value |= SOR_DP_PADCTL_PD_TXD_0;
@@ -1850,7 +1850,7 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 
 	value = tegra_sor_readl(sor, SOR_DP_LINKCTL0);
 	value &= ~SOR_DP_LINKCTL_LANE_COUNT_MASK;
-	value |= SOR_DP_LINKCTL_LANE_COUNT(link.num_lanes);
+	value |= SOR_DP_LINKCTL_LANE_COUNT(link.lanes);
 	tegra_sor_writel(sor, value, SOR_DP_LINKCTL0);
 
 	/* start lane sequencer */
@@ -1907,7 +1907,7 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 		dev_err(sor->dev, "failed to configure eDP link: %d\n", err);
 
 	rate = drm_dp_link_rate_to_bw_code(link.rate);
-	lanes = link.num_lanes;
+	lanes = link.lanes;
 
 	value = tegra_sor_readl(sor, SOR_CLK_CNTRL);
 	value &= ~SOR_CLK_CNTRL_DP_LINK_SPEED_MASK;
@@ -1925,7 +1925,7 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 
 	/* disable training pattern generator */
 
-	for (i = 0; i < link.num_lanes; i++) {
+	for (i = 0; i < link.lanes; i++) {
 		unsigned long lane = SOR_DP_TPG_CHANNEL_CODING |
 				     SOR_DP_TPG_SCRAMBLER_GALIOS |
 				     SOR_DP_TPG_PATTERN_NONE;
-- 
2.23.0


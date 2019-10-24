Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A05DEE389C
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439897AbfJXQqW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:22 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42234 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439899AbfJXQqW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:22 -0400
Received: by mail-wr1-f66.google.com with SMTP id r1so17063015wrs.9
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FwEnjHtFTF7OfFXzKxcCarHlZ61ccQuW3KuS1NZQB7o=;
        b=g+bw5X7qGub6UzajTmDJyZL1qqTbzRA0r6jrKGWPWSBoyN8AGZ90rmDfkDdkkIvIs2
         R7AbTE6y3P7kEm7wEb3XfJok4+n8VFW+KjPFbxeWvW0FTcRrOrO64PfvVJVMjJrorR4f
         PJrZVpCM1YtghuthN7C1v9JCgl+baRS4Ge1n0apNeMXswK6PRGzazXijj4utZlnTybtv
         yHceM1oT30n8+vlMc6LBQFXMQvgrx5Hg4OKqcHsMMLd7bMQ2uAfmNMu0ELvxSdneW9Z8
         fuoyCaNyRRvEHuRzeDE9ndvNYWQiMxPvS9FlXVuOxny9F+yybh9vFK43losmGXId87HQ
         n0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FwEnjHtFTF7OfFXzKxcCarHlZ61ccQuW3KuS1NZQB7o=;
        b=uIMUBHEmM5pzlbInqrBrv0jqOOtQlsLaeS1YF80qu/zhpeb0WqxywYnt9yDyvFySGP
         DZUOqbFcSXicBIOZfk4Z2xUyOR5nLLbqV8yKXwjEqjISh50JL8wPs4Y6F9MSzyDddBED
         x3R8QO+cn22Xx7GkyJJem3i/EI8IuMW35jvxRAkH+RUbtwNdm2LOVS1G8ebYT/0uHmTc
         kQ9QvZ2L6w9qzwHSTskVfe1Ln4OrCyA1FBEXqzPA4OokJkIkCQJBV5eEt0SjUdPAhV1F
         SW+msiEs8vdN1z3yLR2vwMZeLFIL6IzfXEFIimo/eSo80XM5Iihw0EGc0tBECZfJZ1N9
         TstQ==
X-Gm-Message-State: APjAAAXILHH4WN46h0BS8x81J2tjn0ofeXbsPmgtWHCRhDT/oGOESIf+
        hpzio/O6yiY+NUXCfkXOzWg=
X-Google-Smtp-Source: APXvYqyOuCZoBjskl22RukB62w3+EHcKgDKE67MZ7FesatSL6fwml5CzeFJ8AE6ZT0TsbYfonvWtQQ==
X-Received: by 2002:adf:c641:: with SMTP id u1mr4772049wrg.361.1571935575780;
        Thu, 24 Oct 2019 09:46:15 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id b7sm11010352wrn.53.2019.10.24.09.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:14 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 17/32] drm/tegra: sor: Use DP link training helpers
Date:   Thu, 24 Oct 2019 18:45:19 +0200
Message-Id: <20191024164534.132764-18-thierry.reding@gmail.com>
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

Make use of the DP link training helpers to implement full and fast link
training. While at it, refactor some of the code and remove various code
sequences that are not necessary.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dpaux.c |  69 ----
 drivers/gpu/drm/tegra/drm.h   |   5 -
 drivers/gpu/drm/tegra/sor.c   | 684 +++++++++++++++++++++++-----------
 drivers/gpu/drm/tegra/sor.h   |   2 +
 4 files changed, 470 insertions(+), 290 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index bd3361cea49b..622cdf1ad246 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -821,72 +821,3 @@ int drm_dp_aux_disable(struct drm_dp_aux *aux)
 
 	return 0;
 }
-
-int drm_dp_aux_prepare(struct drm_dp_aux *aux, u8 encoding)
-{
-	int err;
-
-	err = drm_dp_dpcd_writeb(aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
-				 encoding);
-	if (err < 0)
-		return err;
-
-	return 0;
-}
-
-int drm_dp_aux_train(struct drm_dp_aux *aux, struct drm_dp_link *link,
-		     u8 pattern)
-{
-	u8 tp = pattern & DP_TRAINING_PATTERN_MASK;
-	u8 status[DP_LINK_STATUS_SIZE], values[4];
-	unsigned int i;
-	int err;
-
-	err = drm_dp_dpcd_writeb(aux, DP_TRAINING_PATTERN_SET, pattern);
-	if (err < 0)
-		return err;
-
-	if (tp == DP_TRAINING_PATTERN_DISABLE)
-		return 0;
-
-	for (i = 0; i < link->lanes; i++)
-		values[i] = DP_TRAIN_MAX_PRE_EMPHASIS_REACHED |
-			    DP_TRAIN_PRE_EMPH_LEVEL_0 |
-			    DP_TRAIN_MAX_SWING_REACHED |
-			    DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
-
-	err = drm_dp_dpcd_write(aux, DP_TRAINING_LANE0_SET, values,
-				link->lanes);
-	if (err < 0)
-		return err;
-
-	usleep_range(500, 1000);
-
-	err = drm_dp_dpcd_read_link_status(aux, status);
-	if (err < 0)
-		return err;
-
-	switch (tp) {
-	case DP_TRAINING_PATTERN_1:
-		if (!drm_dp_clock_recovery_ok(status, link->lanes))
-			return -EAGAIN;
-
-		break;
-
-	case DP_TRAINING_PATTERN_2:
-		if (!drm_dp_channel_eq_ok(status, link->lanes))
-			return -EAGAIN;
-
-		break;
-
-	default:
-		dev_err(aux->dev, "unsupported training pattern %u\n", tp);
-		return -EINVAL;
-	}
-
-	err = drm_dp_dpcd_writeb(aux, DP_EDP_CONFIGURATION_SET, 0);
-	if (err < 0)
-		return err;
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 6a06d636e930..8b812bb52e5b 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -153,17 +153,12 @@ void tegra_output_connector_destroy(struct drm_connector *connector);
 void tegra_output_encoder_destroy(struct drm_encoder *encoder);
 
 /* from dpaux.c */
-struct drm_dp_link;
-
 struct drm_dp_aux *drm_dp_aux_find_by_of_node(struct device_node *np);
 enum drm_connector_status drm_dp_aux_detect(struct drm_dp_aux *aux);
 int drm_dp_aux_attach(struct drm_dp_aux *aux, struct tegra_output *output);
 int drm_dp_aux_detach(struct drm_dp_aux *aux);
 int drm_dp_aux_enable(struct drm_dp_aux *aux);
 int drm_dp_aux_disable(struct drm_dp_aux *aux);
-int drm_dp_aux_prepare(struct drm_dp_aux *aux, u8 encoding);
-int drm_dp_aux_train(struct drm_dp_aux *aux, struct drm_dp_link *link,
-		     u8 pattern);
 
 /* from fb.c */
 struct tegra_bo *tegra_fb_get_plane(struct drm_framebuffer *framebuffer,
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index dd118366455b..636807e047f0 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -383,6 +383,12 @@ struct tegra_sor_soc {
 	unsigned int num_settings;
 
 	const u8 *xbar_cfg;
+	const u8 *lane_map;
+
+	const u8 (*voltage_swing)[4][4];
+	const u8 (*pre_emphasis)[4][4];
+	const u8 (*post_cursor)[4][4];
+	const u8 (*tx_pu)[4][4];
 };
 
 struct tegra_sor;
@@ -413,6 +419,7 @@ struct tegra_sor {
 
 	u8 xbar_cfg[5];
 
+	struct drm_dp_link link;
 	struct drm_dp_aux *aux;
 
 	struct drm_info_list *debugfs_files;
@@ -598,112 +605,316 @@ static struct clk *tegra_clk_sor_pad_register(struct tegra_sor *sor,
 	return clk;
 }
 
-static int tegra_sor_dp_train_fast(struct tegra_sor *sor,
-				   struct drm_dp_link *link)
+static int tegra_sor_power_up_lanes(struct tegra_sor *sor, unsigned int lanes)
 {
-	unsigned int i;
-	u8 pattern;
+	unsigned long timeout;
 	u32 value;
-	int err;
 
-	/* setup lane parameters */
-	value = SOR_LANE_DRIVE_CURRENT_LANE3(0x40) |
-		SOR_LANE_DRIVE_CURRENT_LANE2(0x40) |
-		SOR_LANE_DRIVE_CURRENT_LANE1(0x40) |
-		SOR_LANE_DRIVE_CURRENT_LANE0(0x40);
-	tegra_sor_writel(sor, value, SOR_LANE_DRIVE_CURRENT0);
+	/*
+	 * Clear or set the PD_TXD bit corresponding to each lane, depending
+	 * on whether it is used or not.
+	 */
+	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
 
-	value = SOR_LANE_PREEMPHASIS_LANE3(0x0f) |
-		SOR_LANE_PREEMPHASIS_LANE2(0x0f) |
-		SOR_LANE_PREEMPHASIS_LANE1(0x0f) |
-		SOR_LANE_PREEMPHASIS_LANE0(0x0f);
-	tegra_sor_writel(sor, value, SOR_LANE_PREEMPHASIS0);
+	if (lanes <= 2)
+		value &= ~(SOR_DP_PADCTL_PD_TXD(sor->soc->lane_map[3]) |
+			   SOR_DP_PADCTL_PD_TXD(sor->soc->lane_map[2]));
+	else
+		value |= SOR_DP_PADCTL_PD_TXD(sor->soc->lane_map[3]) |
+			 SOR_DP_PADCTL_PD_TXD(sor->soc->lane_map[2]);
+
+	if (lanes <= 1)
+		value &= ~SOR_DP_PADCTL_PD_TXD(sor->soc->lane_map[1]);
+	else
+		value |= SOR_DP_PADCTL_PD_TXD(sor->soc->lane_map[1]);
+
+	if (lanes == 0)
+		value &= ~SOR_DP_PADCTL_PD_TXD(sor->soc->lane_map[0]);
+	else
+		value |= SOR_DP_PADCTL_PD_TXD(sor->soc->lane_map[0]);
+
+	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
+
+	/* start lane sequencer */
+	value = SOR_LANE_SEQ_CTL_TRIGGER | SOR_LANE_SEQ_CTL_SEQUENCE_DOWN |
+		SOR_LANE_SEQ_CTL_POWER_STATE_UP;
+	tegra_sor_writel(sor, value, SOR_LANE_SEQ_CTL);
+
+	timeout = jiffies + msecs_to_jiffies(250);
+
+	while (time_before(jiffies, timeout)) {
+		value = tegra_sor_readl(sor, SOR_LANE_SEQ_CTL);
+		if ((value & SOR_LANE_SEQ_CTL_TRIGGER) == 0)
+			break;
+
+		usleep_range(250, 1000);
+	}
+
+	if ((value & SOR_LANE_SEQ_CTL_TRIGGER) != 0)
+		return -ETIMEDOUT;
 
-	value = SOR_LANE_POSTCURSOR_LANE3(0x00) |
-		SOR_LANE_POSTCURSOR_LANE2(0x00) |
-		SOR_LANE_POSTCURSOR_LANE1(0x00) |
-		SOR_LANE_POSTCURSOR_LANE0(0x00);
-	tegra_sor_writel(sor, value, SOR_LANE_POSTCURSOR0);
+	return 0;
+}
 
-	/* disable LVDS mode */
-	tegra_sor_writel(sor, 0, SOR_LVDS);
+static int tegra_sor_power_down_lanes(struct tegra_sor *sor)
+{
+	unsigned long timeout;
+	u32 value;
 
+	/* power down all lanes */
 	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
-	value |= SOR_DP_PADCTL_TX_PU_ENABLE;
-	value &= ~SOR_DP_PADCTL_TX_PU_MASK;
-	value |= SOR_DP_PADCTL_TX_PU(2); /* XXX: don't hardcode? */
+	value &= ~(SOR_DP_PADCTL_PD_TXD_3 | SOR_DP_PADCTL_PD_TXD_0 |
+		   SOR_DP_PADCTL_PD_TXD_1 | SOR_DP_PADCTL_PD_TXD_2);
 	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
 
+	/* start lane sequencer */
+	value = SOR_LANE_SEQ_CTL_TRIGGER | SOR_LANE_SEQ_CTL_SEQUENCE_UP |
+		SOR_LANE_SEQ_CTL_POWER_STATE_DOWN;
+	tegra_sor_writel(sor, value, SOR_LANE_SEQ_CTL);
+
+	timeout = jiffies + msecs_to_jiffies(250);
+
+	while (time_before(jiffies, timeout)) {
+		value = tegra_sor_readl(sor, SOR_LANE_SEQ_CTL);
+		if ((value & SOR_LANE_SEQ_CTL_TRIGGER) == 0)
+			break;
+
+		usleep_range(25, 100);
+	}
+
+	if ((value & SOR_LANE_SEQ_CTL_TRIGGER) != 0)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static void tegra_sor_dp_precharge(struct tegra_sor *sor, unsigned int lanes)
+{
+	u32 value;
+
+	/* pre-charge all used lanes */
 	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
-	value |= SOR_DP_PADCTL_CM_TXD_3 | SOR_DP_PADCTL_CM_TXD_2 |
-		 SOR_DP_PADCTL_CM_TXD_1 | SOR_DP_PADCTL_CM_TXD_0;
+
+	if (lanes <= 2)
+		value &= ~(SOR_DP_PADCTL_CM_TXD(sor->soc->lane_map[3]) |
+			   SOR_DP_PADCTL_CM_TXD(sor->soc->lane_map[2]));
+	else
+		value |= SOR_DP_PADCTL_CM_TXD(sor->soc->lane_map[3]) |
+			 SOR_DP_PADCTL_CM_TXD(sor->soc->lane_map[2]);
+
+	if (lanes <= 1)
+		value &= ~SOR_DP_PADCTL_CM_TXD(sor->soc->lane_map[1]);
+	else
+		value |= SOR_DP_PADCTL_CM_TXD(sor->soc->lane_map[1]);
+
+	if (lanes == 0)
+		value &= ~SOR_DP_PADCTL_CM_TXD(sor->soc->lane_map[0]);
+	else
+		value |= SOR_DP_PADCTL_CM_TXD(sor->soc->lane_map[0]);
+
 	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
 
-	usleep_range(10, 100);
+	usleep_range(15, 100);
 
 	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
 	value &= ~(SOR_DP_PADCTL_CM_TXD_3 | SOR_DP_PADCTL_CM_TXD_2 |
 		   SOR_DP_PADCTL_CM_TXD_1 | SOR_DP_PADCTL_CM_TXD_0);
 	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
+}
 
-	err = drm_dp_aux_prepare(sor->aux, DP_SET_ANSI_8B10B);
-	if (err < 0)
-		return err;
+static void tegra_sor_dp_term_calibrate(struct tegra_sor *sor)
+{
+	u32 mask = 0x08, adj = 0, value;
+
+	/* enable pad calibration logic */
+	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
+	value &= ~SOR_DP_PADCTL_PAD_CAL_PD;
+	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
+
+	value = tegra_sor_readl(sor, sor->soc->regs->pll1);
+	value |= SOR_PLL1_TMDS_TERM;
+	tegra_sor_writel(sor, value, sor->soc->regs->pll1);
+
+	while (mask) {
+		adj |= mask;
+
+		value = tegra_sor_readl(sor, sor->soc->regs->pll1);
+		value &= ~SOR_PLL1_TMDS_TERMADJ_MASK;
+		value |= SOR_PLL1_TMDS_TERMADJ(adj);
+		tegra_sor_writel(sor, value, sor->soc->regs->pll1);
 
-	for (i = 0, value = 0; i < link->lanes; i++) {
-		unsigned long lane = SOR_DP_TPG_CHANNEL_CODING |
-				     SOR_DP_TPG_SCRAMBLER_NONE |
-				     SOR_DP_TPG_PATTERN_TRAIN1;
-		value = (value << 8) | lane;
+		usleep_range(100, 200);
+
+		value = tegra_sor_readl(sor, sor->soc->regs->pll1);
+		if (value & SOR_PLL1_TERM_COMPOUT)
+			adj &= ~mask;
+
+		mask >>= 1;
 	}
 
-	tegra_sor_writel(sor, value, SOR_DP_TPG);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll1);
+	value &= ~SOR_PLL1_TMDS_TERMADJ_MASK;
+	value |= SOR_PLL1_TMDS_TERMADJ(adj);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll1);
 
-	pattern = DP_TRAINING_PATTERN_1;
+	/* disable pad calibration logic */
+	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
+	value |= SOR_DP_PADCTL_PAD_CAL_PD;
+	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
+}
 
-	err = drm_dp_aux_train(sor->aux, link, pattern);
-	if (err < 0)
-		return err;
+static int tegra_sor_dp_link_apply_training(struct drm_dp_link *link)
+{
+	struct tegra_sor *sor = container_of(link, struct tegra_sor, link);
+	u32 voltage_swing = 0, pre_emphasis = 0, post_cursor = 0;
+	const struct tegra_sor_soc *soc = sor->soc;
+	u32 pattern = 0, tx_pu = 0, value;
+	unsigned int i;
 
-	value = tegra_sor_readl(sor, SOR_DP_SPARE0);
-	value |= SOR_DP_SPARE_SEQ_ENABLE;
-	value &= ~SOR_DP_SPARE_PANEL_INTERNAL;
-	value |= SOR_DP_SPARE_MACRO_SOR_CLK;
-	tegra_sor_writel(sor, value, SOR_DP_SPARE0);
+	for (value = 0, i = 0; i < link->lanes; i++) {
+		u8 vs = link->train.request.voltage_swing[i];
+		u8 pe = link->train.request.pre_emphasis[i];
+		u8 pc = link->train.request.post_cursor[i];
+		u8 shift = sor->soc->lane_map[i] << 3;
+
+		voltage_swing |= soc->voltage_swing[pc][vs][pe] << shift;
+		pre_emphasis |= soc->pre_emphasis[pc][vs][pe] << shift;
+		post_cursor |= soc->post_cursor[pc][vs][pe] << shift;
+
+		if (sor->soc->tx_pu[pc][vs][pe] > tx_pu)
+			tx_pu = sor->soc->tx_pu[pc][vs][pe];
+
+		switch (link->train.pattern) {
+		case DP_TRAINING_PATTERN_DISABLE:
+			value = SOR_DP_TPG_SCRAMBLER_GALIOS |
+				SOR_DP_TPG_PATTERN_NONE;
+			break;
+
+		case DP_TRAINING_PATTERN_1:
+			value = SOR_DP_TPG_SCRAMBLER_NONE |
+				SOR_DP_TPG_PATTERN_TRAIN1;
+			break;
+
+		case DP_TRAINING_PATTERN_2:
+			value = SOR_DP_TPG_SCRAMBLER_NONE |
+				SOR_DP_TPG_PATTERN_TRAIN2;
+			break;
 
-	for (i = 0, value = 0; i < link->lanes; i++) {
-		unsigned long lane = SOR_DP_TPG_CHANNEL_CODING |
-				     SOR_DP_TPG_SCRAMBLER_NONE |
-				     SOR_DP_TPG_PATTERN_TRAIN2;
-		value = (value << 8) | lane;
+		case DP_TRAINING_PATTERN_3:
+			value = SOR_DP_TPG_SCRAMBLER_NONE |
+				SOR_DP_TPG_PATTERN_TRAIN3;
+			break;
+
+		default:
+			return -EINVAL;
+		}
+
+		if (link->caps.channel_coding)
+			value |= SOR_DP_TPG_CHANNEL_CODING;
+
+		pattern = pattern << 8 | value;
 	}
 
-	tegra_sor_writel(sor, value, SOR_DP_TPG);
+	tegra_sor_writel(sor, voltage_swing, SOR_LANE_DRIVE_CURRENT0);
+	tegra_sor_writel(sor, pre_emphasis, SOR_LANE_PREEMPHASIS0);
 
-	pattern = DP_LINK_SCRAMBLING_DISABLE | DP_TRAINING_PATTERN_2;
+	if (link->caps.tps3_supported)
+		tegra_sor_writel(sor, post_cursor, SOR_LANE_POSTCURSOR0);
 
-	err = drm_dp_aux_train(sor->aux, link, pattern);
-	if (err < 0)
-		return err;
+	tegra_sor_writel(sor, pattern, SOR_DP_TPG);
+
+	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
+	value &= ~SOR_DP_PADCTL_TX_PU_MASK;
+	value |= SOR_DP_PADCTL_TX_PU_ENABLE;
+	value |= SOR_DP_PADCTL_TX_PU(tx_pu);
+	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
+
+	usleep_range(20, 100);
 
-	for (i = 0, value = 0; i < link->lanes; i++) {
-		unsigned long lane = SOR_DP_TPG_CHANNEL_CODING |
-				     SOR_DP_TPG_SCRAMBLER_GALIOS |
-				     SOR_DP_TPG_PATTERN_NONE;
-		value = (value << 8) | lane;
+	return 0;
+}
+
+static int tegra_sor_dp_link_configure(struct drm_dp_link *link)
+{
+	struct tegra_sor *sor = container_of(link, struct tegra_sor, link);
+	unsigned int rate, lanes;
+	u32 value;
+	int err;
+
+	rate = drm_dp_link_rate_to_bw_code(link->rate);
+	lanes = link->lanes;
+
+	/* configure link speed and lane count */
+	value = tegra_sor_readl(sor, SOR_CLK_CNTRL);
+	value &= ~SOR_CLK_CNTRL_DP_LINK_SPEED_MASK;
+	value |= SOR_CLK_CNTRL_DP_LINK_SPEED(rate);
+	tegra_sor_writel(sor, value, SOR_CLK_CNTRL);
+
+	value = tegra_sor_readl(sor, SOR_DP_LINKCTL0);
+	value &= ~SOR_DP_LINKCTL_LANE_COUNT_MASK;
+	value |= SOR_DP_LINKCTL_LANE_COUNT(lanes);
+
+	if (link->caps.enhanced_framing)
+		value |= SOR_DP_LINKCTL_ENHANCED_FRAME;
+
+	tegra_sor_writel(sor, value, SOR_DP_LINKCTL0);
+
+	usleep_range(400, 1000);
+
+	/* configure load pulse position adjustment */
+	value = tegra_sor_readl(sor, sor->soc->regs->pll1);
+	value &= ~SOR_PLL1_LOADADJ_MASK;
+
+	switch (rate) {
+	case DP_LINK_BW_1_62:
+		value |= SOR_PLL1_LOADADJ(0x3);
+		break;
+
+	case DP_LINK_BW_2_7:
+		value |= SOR_PLL1_LOADADJ(0x4);
+		break;
+
+	case DP_LINK_BW_5_4:
+		value |= SOR_PLL1_LOADADJ(0x6);
+		break;
 	}
 
-	tegra_sor_writel(sor, value, SOR_DP_TPG);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll1);
 
-	pattern = DP_TRAINING_PATTERN_DISABLE;
+	/* use alternate scrambler reset for eDP */
+	value = tegra_sor_readl(sor, SOR_DP_SPARE0);
 
-	err = drm_dp_aux_train(sor->aux, link, pattern);
-	if (err < 0)
+	if (link->edp == 0)
+		value &= ~SOR_DP_SPARE_PANEL_INTERNAL;
+	else
+		value |= SOR_DP_SPARE_PANEL_INTERNAL;
+
+	tegra_sor_writel(sor, value, SOR_DP_SPARE0);
+
+	err = tegra_sor_power_down_lanes(sor);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to power down lanes: %d\n", err);
+		return err;
+	}
+
+	/* power up and pre-charge lanes */
+	err = tegra_sor_power_up_lanes(sor, lanes);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to power up %u lane%s: %d\n",
+			lanes, (lanes != 1) ? "s" : "", err);
 		return err;
+	}
+
+	tegra_sor_dp_precharge(sor, lanes);
 
 	return 0;
 }
 
+static const struct drm_dp_link_ops tegra_sor_dp_link_ops = {
+	.apply_training = tegra_sor_dp_link_apply_training,
+	.configure = tegra_sor_dp_link_configure,
+};
+
 static void tegra_sor_super_update(struct tegra_sor *sor)
 {
 	tegra_sor_writel(sor, 0, SOR_SUPER_STATE0);
@@ -1201,29 +1412,6 @@ static int tegra_sor_power_down(struct tegra_sor *sor)
 		return err;
 	}
 
-	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
-	value &= ~(SOR_DP_PADCTL_PD_TXD_3 | SOR_DP_PADCTL_PD_TXD_0 |
-		   SOR_DP_PADCTL_PD_TXD_1 | SOR_DP_PADCTL_PD_TXD_2);
-	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
-
-	/* stop lane sequencer */
-	value = SOR_LANE_SEQ_CTL_TRIGGER | SOR_LANE_SEQ_CTL_SEQUENCE_UP |
-		SOR_LANE_SEQ_CTL_POWER_STATE_DOWN;
-	tegra_sor_writel(sor, value, SOR_LANE_SEQ_CTL);
-
-	timeout = jiffies + msecs_to_jiffies(250);
-
-	while (time_before(jiffies, timeout)) {
-		value = tegra_sor_readl(sor, SOR_LANE_SEQ_CTL);
-		if ((value & SOR_LANE_SEQ_CTL_TRIGGER) == 0)
-			break;
-
-		usleep_range(25, 100);
-	}
-
-	if ((value & SOR_LANE_SEQ_CTL_TRIGGER) != 0)
-		return -ETIMEDOUT;
-
 	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
 	value |= SOR_PLL2_PORT_POWERDOWN;
 	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
@@ -1603,17 +1791,11 @@ static void tegra_sor_edp_disable(struct drm_encoder *encoder)
 	tegra_sor_writel(sor, 0, SOR_STATE1);
 	tegra_sor_update(sor);
 
-	/*
-	 * The following accesses registers of the display controller, so make
-	 * sure it's only executed when the output is attached to one.
-	 */
-	if (dc) {
-		value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
-		value &= ~SOR_ENABLE(0);
-		tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
+	value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
+	value &= ~SOR_ENABLE(0);
+	tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
 
-		tegra_dc_commit(dc);
-	}
+	tegra_dc_commit(dc);
 
 	err = tegra_sor_power_down(sor);
 	if (err < 0)
@@ -1679,19 +1861,20 @@ static int calc_h_ref_to_sync(const struct drm_display_mode *mode,
 
 static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 {
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_dc *dc = to_tegra_dc(encoder->crtc);
 	struct tegra_sor *sor = to_sor(output);
 	struct tegra_sor_config config;
 	struct tegra_sor_state *state;
-	struct drm_dp_link link;
-	u8 rate, lanes;
+	struct drm_display_mode *mode;
+	struct drm_display_info *info;
 	unsigned int i;
-	int err = 0;
 	u32 value;
+	int err;
 
 	state = to_sor_state(output->connector.state);
+	mode = &encoder->crtc->state->adjusted_mode;
+	info = &output->connector.display_info;
 
 	pm_runtime_get_sync(sor->dev);
 
@@ -1702,7 +1885,7 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 	if (err < 0)
 		dev_err(sor->dev, "failed to enable DP: %d\n", err);
 
-	err = drm_dp_link_probe(sor->aux, &link);
+	err = drm_dp_link_probe(sor->aux, &sor->link);
 	if (err < 0) {
 		dev_err(sor->dev, "failed to probe eDP link: %d\n", err);
 		return;
@@ -1713,13 +1896,6 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 	if (err < 0)
 		dev_err(sor->dev, "failed to set safe parent clock: %d\n", err);
 
-	memset(&config, 0, sizeof(config));
-	config.bits_per_pixel = state->bpc * 3;
-
-	err = tegra_sor_compute_config(sor, mode, &config, &link);
-	if (err < 0)
-		dev_err(sor->dev, "failed to compute configuration: %d\n", err);
-
 	value = tegra_sor_readl(sor, SOR_CLK_CNTRL);
 	value &= ~SOR_CLK_CNTRL_DP_CLK_SEL_MASK;
 	value |= SOR_CLK_CNTRL_DP_CLK_SEL_SINGLE_DPCLK;
@@ -1828,117 +2004,44 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 	if (err < 0)
 		dev_err(sor->dev, "failed to set parent clock: %d\n", err);
 
-	/* power DP lanes */
-	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
-
-	if (link.lanes <= 2)
-		value &= ~(SOR_DP_PADCTL_PD_TXD_3 | SOR_DP_PADCTL_PD_TXD_2);
-	else
-		value |= SOR_DP_PADCTL_PD_TXD_3 | SOR_DP_PADCTL_PD_TXD_2;
-
-	if (link.lanes <= 1)
-		value &= ~SOR_DP_PADCTL_PD_TXD_1;
-	else
-		value |= SOR_DP_PADCTL_PD_TXD_1;
-
-	if (link.lanes == 0)
-		value &= ~SOR_DP_PADCTL_PD_TXD_0;
-	else
-		value |= SOR_DP_PADCTL_PD_TXD_0;
-
-	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
-
-	value = tegra_sor_readl(sor, SOR_DP_LINKCTL0);
-	value &= ~SOR_DP_LINKCTL_LANE_COUNT_MASK;
-	value |= SOR_DP_LINKCTL_LANE_COUNT(link.lanes);
-	tegra_sor_writel(sor, value, SOR_DP_LINKCTL0);
-
-	/* start lane sequencer */
-	value = SOR_LANE_SEQ_CTL_TRIGGER | SOR_LANE_SEQ_CTL_SEQUENCE_DOWN |
-		SOR_LANE_SEQ_CTL_POWER_STATE_UP;
-	tegra_sor_writel(sor, value, SOR_LANE_SEQ_CTL);
-
-	while (true) {
-		value = tegra_sor_readl(sor, SOR_LANE_SEQ_CTL);
-		if ((value & SOR_LANE_SEQ_CTL_TRIGGER) == 0)
-			break;
-
-		usleep_range(250, 1000);
-	}
-
-	/* set link bandwidth */
-	value = tegra_sor_readl(sor, SOR_CLK_CNTRL);
-	value &= ~SOR_CLK_CNTRL_DP_LINK_SPEED_MASK;
-	value |= drm_dp_link_rate_to_bw_code(link.rate) << 2;
-	tegra_sor_writel(sor, value, SOR_CLK_CNTRL);
-
-	tegra_sor_apply_config(sor, &config);
+	/* use DP-A protocol */
+	value = tegra_sor_readl(sor, SOR_STATE1);
+	value &= ~SOR_STATE_ASY_PROTOCOL_MASK;
+	value |= SOR_STATE_ASY_PROTOCOL_DP_A;
+	tegra_sor_writel(sor, value, SOR_STATE1);
 
-	/* enable link */
+	/* enable port */
 	value = tegra_sor_readl(sor, SOR_DP_LINKCTL0);
 	value |= SOR_DP_LINKCTL_ENABLE;
-	value |= SOR_DP_LINKCTL_ENHANCED_FRAME;
 	tegra_sor_writel(sor, value, SOR_DP_LINKCTL0);
 
-	for (i = 0, value = 0; i < 4; i++) {
-		unsigned long lane = SOR_DP_TPG_CHANNEL_CODING |
-				     SOR_DP_TPG_SCRAMBLER_GALIOS |
-				     SOR_DP_TPG_PATTERN_NONE;
-		value = (value << 8) | lane;
-	}
-
-	tegra_sor_writel(sor, value, SOR_DP_TPG);
+	/* calibrate termination resistance (XXX do this only on HPD) */
+	tegra_sor_dp_term_calibrate(sor);
 
-	/* enable pad calibration logic */
-	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
-	value |= SOR_DP_PADCTL_PAD_CAL_PD;
-	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
-
-	err = drm_dp_link_probe(sor->aux, &link);
+	err = drm_dp_link_train(&sor->link);
 	if (err < 0)
-		dev_err(sor->dev, "failed to probe eDP link: %d\n", err);
-
-	err = drm_dp_link_power_up(sor->aux, &link);
-	if (err < 0)
-		dev_err(sor->dev, "failed to power up eDP link: %d\n", err);
-
-	err = drm_dp_link_configure(sor->aux, &link);
-	if (err < 0)
-		dev_err(sor->dev, "failed to configure eDP link: %d\n", err);
-
-	rate = drm_dp_link_rate_to_bw_code(link.rate);
-	lanes = link.lanes;
-
-	value = tegra_sor_readl(sor, SOR_CLK_CNTRL);
-	value &= ~SOR_CLK_CNTRL_DP_LINK_SPEED_MASK;
-	value |= SOR_CLK_CNTRL_DP_LINK_SPEED(rate);
-	tegra_sor_writel(sor, value, SOR_CLK_CNTRL);
-
-	value = tegra_sor_readl(sor, SOR_DP_LINKCTL0);
-	value &= ~SOR_DP_LINKCTL_LANE_COUNT_MASK;
-	value |= SOR_DP_LINKCTL_LANE_COUNT(lanes);
-
-	if (link.caps.enhanced_framing)
-		value |= SOR_DP_LINKCTL_ENHANCED_FRAME;
-
-	tegra_sor_writel(sor, value, SOR_DP_LINKCTL0);
-
-	/* disable training pattern generator */
+		dev_err(sor->dev, "link training failed: %d\n", err);
+	else
+		dev_dbg(sor->dev, "link training succeeded\n");
 
-	for (i = 0; i < link.lanes; i++) {
-		unsigned long lane = SOR_DP_TPG_CHANNEL_CODING |
-				     SOR_DP_TPG_SCRAMBLER_GALIOS |
-				     SOR_DP_TPG_PATTERN_NONE;
-		value = (value << 8) | lane;
+	err = drm_dp_link_power_up(sor->aux, &sor->link);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to power up eDP link: %d\n",
+			err);
+		return;
 	}
 
-	tegra_sor_writel(sor, value, SOR_DP_TPG);
+	/* compute configuration */
+	memset(&config, 0, sizeof(config));
+	config.bits_per_pixel = state->bpc * 3;
 
-	err = tegra_sor_dp_train_fast(sor, &link);
-	if (err < 0)
-		dev_err(sor->dev, "DP fast link training failed: %d\n", err);
+	err = tegra_sor_compute_config(sor, mode, &config, &sor->link);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to compute configuration: %d\n", err);
+		return;
+	}
 
-	dev_dbg(sor->dev, "fast link training succeeded\n");
+	tegra_sor_apply_config(sor, &config);
 
 	err = tegra_sor_power_up(sor, 250);
 	if (err < 0)
@@ -2842,6 +2945,9 @@ static int tegra_sor_init(struct host1x_client *client)
 			connector = DRM_MODE_CONNECTOR_DisplayPort;
 			encoder = DRM_MODE_ENCODER_TMDS;
 		}
+
+		sor->link.ops = &tegra_sor_dp_link_ops;
+		sor->link.aux = sor->aux;
 	}
 
 	sor->output.dev = sor->dev;
@@ -3042,6 +3148,107 @@ static const struct tegra_sor_regs tegra124_sor_regs = {
 	.dp_padctl2 = 0x73,
 };
 
+/* Tegra124 and Tegra132 have lanes 0 and 2 swapped. */
+static const u8 tegra124_sor_lane_map[4] = {
+	2, 1, 0, 3,
+};
+
+static const u8 tegra124_sor_voltage_swing[4][4][4] = {
+	{
+		{ 0x13, 0x19, 0x1e, 0x28 },
+		{ 0x1e, 0x25, 0x2d, },
+		{ 0x28, 0x32, },
+		{ 0x3c, },
+	}, {
+		{ 0x12, 0x17, 0x1b, 0x25 },
+		{ 0x1c, 0x23, 0x2a, },
+		{ 0x25, 0x2f, },
+		{ 0x39, }
+	}, {
+		{ 0x12, 0x16, 0x1a, 0x22 },
+		{ 0x1b, 0x20, 0x27, },
+		{ 0x24, 0x2d, },
+		{ 0x36, },
+	}, {
+		{ 0x11, 0x14, 0x17, 0x1f },
+		{ 0x19, 0x1e, 0x24, },
+		{ 0x22, 0x2a, },
+		{ 0x32, },
+	},
+};
+
+static const u8 tegra124_sor_pre_emphasis[4][4][4] = {
+	{
+		{ 0x00, 0x09, 0x13, 0x25 },
+		{ 0x00, 0x0f, 0x1e, },
+		{ 0x00, 0x14, },
+		{ 0x00, },
+	}, {
+		{ 0x00, 0x0a, 0x14, 0x28 },
+		{ 0x00, 0x0f, 0x1e, },
+		{ 0x00, 0x14, },
+		{ 0x00 },
+	}, {
+		{ 0x00, 0x0a, 0x14, 0x28 },
+		{ 0x00, 0x0f, 0x1e, },
+		{ 0x00, 0x14, },
+		{ 0x00, },
+	}, {
+		{ 0x00, 0x0a, 0x14, 0x28 },
+		{ 0x00, 0x0f, 0x1e, },
+		{ 0x00, 0x14, },
+		{ 0x00, },
+	},
+};
+
+static const u8 tegra124_sor_post_cursor[4][4][4] = {
+	{
+		{ 0x00, 0x00, 0x00, 0x00 },
+		{ 0x00, 0x00, 0x00, },
+		{ 0x00, 0x00, },
+		{ 0x00, },
+	}, {
+		{ 0x02, 0x02, 0x04, 0x05 },
+		{ 0x02, 0x04, 0x05, },
+		{ 0x04, 0x05, },
+		{ 0x05, },
+	}, {
+		{ 0x04, 0x05, 0x08, 0x0b },
+		{ 0x05, 0x09, 0x0b, },
+		{ 0x08, 0x0a, },
+		{ 0x0b, },
+	}, {
+		{ 0x05, 0x09, 0x0b, 0x12 },
+		{ 0x09, 0x0d, 0x12, },
+		{ 0x0b, 0x0f, },
+		{ 0x12, },
+	},
+};
+
+static const u8 tegra124_sor_tx_pu[4][4][4] = {
+	{
+		{ 0x20, 0x30, 0x40, 0x60 },
+		{ 0x30, 0x40, 0x60, },
+		{ 0x40, 0x60, },
+		{ 0x60, },
+	}, {
+		{ 0x20, 0x20, 0x30, 0x50 },
+		{ 0x30, 0x40, 0x50, },
+		{ 0x40, 0x50, },
+		{ 0x60, },
+	}, {
+		{ 0x20, 0x20, 0x30, 0x40, },
+		{ 0x30, 0x30, 0x40, },
+		{ 0x40, 0x50, },
+		{ 0x60, },
+	}, {
+		{ 0x20, 0x20, 0x20, 0x40, },
+		{ 0x30, 0x30, 0x40, },
+		{ 0x40, 0x40, },
+		{ 0x60, },
+	},
+};
+
 static const struct tegra_sor_soc tegra124_sor = {
 	.supports_edp = true,
 	.supports_lvds = true,
@@ -3050,6 +3257,50 @@ static const struct tegra_sor_soc tegra124_sor = {
 	.regs = &tegra124_sor_regs,
 	.has_nvdisplay = false,
 	.xbar_cfg = tegra124_sor_xbar_cfg,
+	.lane_map = tegra124_sor_lane_map,
+	.voltage_swing = tegra124_sor_voltage_swing,
+	.pre_emphasis = tegra124_sor_pre_emphasis,
+	.post_cursor = tegra124_sor_post_cursor,
+	.tx_pu = tegra124_sor_tx_pu,
+};
+
+static const u8 tegra132_sor_pre_emphasis[4][4][4] = {
+	{
+		{ 0x00, 0x08, 0x12, 0x24 },
+		{ 0x01, 0x0e, 0x1d, },
+		{ 0x01, 0x13, },
+		{ 0x00, },
+	}, {
+		{ 0x00, 0x08, 0x12, 0x24 },
+		{ 0x00, 0x0e, 0x1d, },
+		{ 0x00, 0x13, },
+		{ 0x00 },
+	}, {
+		{ 0x00, 0x08, 0x12, 0x24 },
+		{ 0x00, 0x0e, 0x1d, },
+		{ 0x00, 0x13, },
+		{ 0x00, },
+	}, {
+		{ 0x00, 0x08, 0x12, 0x24 },
+		{ 0x00, 0x0e, 0x1d, },
+		{ 0x00, 0x13, },
+		{ 0x00, },
+	},
+};
+
+static const struct tegra_sor_soc tegra132_sor = {
+	.supports_edp = true,
+	.supports_lvds = true,
+	.supports_hdmi = false,
+	.supports_dp = false,
+	.regs = &tegra124_sor_regs,
+	.has_nvdisplay = false,
+	.xbar_cfg = tegra124_sor_xbar_cfg,
+	.lane_map = tegra124_sor_lane_map,
+	.voltage_swing = tegra124_sor_voltage_swing,
+	.pre_emphasis = tegra132_sor_pre_emphasis,
+	.post_cursor = tegra124_sor_post_cursor,
+	.tx_pu = tegra124_sor_tx_pu,
 };
 
 static const struct tegra_sor_regs tegra210_sor_regs = {
@@ -3067,18 +3318,20 @@ static const struct tegra_sor_regs tegra210_sor_regs = {
 	.dp_padctl2 = 0x73,
 };
 
+static const u8 tegra210_sor_xbar_cfg[5] = {
+	2, 1, 0, 3, 4
+};
+
 static const struct tegra_sor_soc tegra210_sor = {
 	.supports_edp = true,
 	.supports_lvds = false,
 	.supports_hdmi = false,
 	.supports_dp = false,
+
 	.regs = &tegra210_sor_regs,
 	.has_nvdisplay = false,
-	.xbar_cfg = tegra124_sor_xbar_cfg,
-};
 
-static const u8 tegra210_sor_xbar_cfg[5] = {
-	2, 1, 0, 3, 4
+	.xbar_cfg = tegra210_sor_xbar_cfg,
 };
 
 static const struct tegra_sor_soc tegra210_sor1 = {
@@ -3092,7 +3345,6 @@ static const struct tegra_sor_soc tegra210_sor1 = {
 
 	.num_settings = ARRAY_SIZE(tegra210_sor_hdmi_defaults),
 	.settings = tegra210_sor_hdmi_defaults,
-
 	.xbar_cfg = tegra210_sor_xbar_cfg,
 };
 
@@ -3134,7 +3386,6 @@ static const struct tegra_sor_soc tegra186_sor1 = {
 
 	.num_settings = ARRAY_SIZE(tegra186_sor_hdmi_defaults),
 	.settings = tegra186_sor_hdmi_defaults,
-
 	.xbar_cfg = tegra124_sor_xbar_cfg,
 };
 
@@ -3174,6 +3425,7 @@ static const struct of_device_id tegra_sor_of_match[] = {
 	{ .compatible = "nvidia,tegra186-sor", .data = &tegra186_sor },
 	{ .compatible = "nvidia,tegra210-sor1", .data = &tegra210_sor1 },
 	{ .compatible = "nvidia,tegra210-sor", .data = &tegra210_sor },
+	{ .compatible = "nvidia,tegra132-sor", .data = &tegra132_sor },
 	{ .compatible = "nvidia,tegra124-sor", .data = &tegra124_sor },
 	{ },
 };
diff --git a/drivers/gpu/drm/tegra/sor.h b/drivers/gpu/drm/tegra/sor.h
index f8efd8be4b7c..5333406c0401 100644
--- a/drivers/gpu/drm/tegra/sor.h
+++ b/drivers/gpu/drm/tegra/sor.h
@@ -283,10 +283,12 @@
 #define  SOR_DP_PADCTL_CM_TXD_2		(1 << 6)
 #define  SOR_DP_PADCTL_CM_TXD_1		(1 << 5)
 #define  SOR_DP_PADCTL_CM_TXD_0		(1 << 4)
+#define  SOR_DP_PADCTL_CM_TXD(x)	(1 << (4 + (x)))
 #define  SOR_DP_PADCTL_PD_TXD_3		(1 << 3)
 #define  SOR_DP_PADCTL_PD_TXD_0		(1 << 2)
 #define  SOR_DP_PADCTL_PD_TXD_1		(1 << 1)
 #define  SOR_DP_PADCTL_PD_TXD_2		(1 << 0)
+#define  SOR_DP_PADCTL_PD_TXD(x)	(1 << (0 + (x)))
 
 #define SOR_DP_PADCTL1 0x5d
 
-- 
2.23.0


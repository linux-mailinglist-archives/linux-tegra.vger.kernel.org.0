Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCBCE38AA
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439917AbfJXQq1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:27 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34313 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439902AbfJXQq1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:27 -0400
Received: by mail-wr1-f66.google.com with SMTP id t16so21734895wrr.1
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q25ZJl137b/SORn0mDotYa8yjt0AhGCjxkBhz1BPsmk=;
        b=LeKAMvsdLdZlQqFxOqzsc+PuhLelqKO+78Zyu9/GYb3/xekpdE8KxIo+bXTeAm3VAn
         ZKMe/gMBNovmeDD/g/lHVKl+4vLdjsVdIuS04XMTPz1h++ZNt/O3ssWi07LGqRIeNfhM
         rLIePpdEH2BP2oAvfkyC7cKc0A4F/REFDPTBg8kZs42/QcETjuRu7LqVV292hC00O0SD
         RT19TfoRu8TVqt6aB1xR4dnEQEcQzJnizDPLhKdfB0CleAgYsy8CVHcHDToZzocRWV4N
         Zop66RfUYUWhRthD0sQ0EKjOqBoNKAY2Kx6Ee9im+WtbuZJRozcAtJCmbh74wFXNzmB9
         IKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q25ZJl137b/SORn0mDotYa8yjt0AhGCjxkBhz1BPsmk=;
        b=iJSSFa+vDuBg8T10ySpVvFEySWJ0O+++nU8j9Rk60yLwtZApUHPcgqHg8RcStehAaQ
         xAX8KN7zh0yd6na/5bgLBHHXl/imchUubS6Mh+N81ctpL6G9T/VO4+tU8HSOHqYSDGRw
         NPtO94B1xEWcmddqi51iQC5q8k13CkCgdRq/uDpE6f+0dfC/OxfEqXuNQMPzhpY1pqXl
         WXiUAsoYCgfsI//6Rk7fU+40aJW7NrcrOP547t144XE278Ij/lAZtTAlbcLAmr9UaZ5H
         lhABLJWclr3VH//SCLtuuOUqEabeCSK2OK7umf6hivax8v/4SDlQJIVJlTEzsnQHhFA0
         jKzw==
X-Gm-Message-State: APjAAAVK3jQJVAoApX13d4KaXqdpwpnGBBDPbI48m/nB7eX4ikDbFmUj
        0SXdNiud0Lx1XlDHaE57gbY=
X-Google-Smtp-Source: APXvYqxpwKyjyumAN/Hw1VskeeAx/ghYPpNBAPe1IxywObQk5k9tNgcXpXylq5snKnsY9JlQwdUO8Q==
X-Received: by 2002:adf:8068:: with SMTP id 95mr2738248wrk.249.1571935584623;
        Thu, 24 Oct 2019 09:46:24 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id f18sm2489983wmh.43.2019.10.24.09.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:23 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 21/32] drm/tegra: sor: Add DisplayPort support
Date:   Thu, 24 Oct 2019 18:45:23 +0200
Message-Id: <20191024164534.132764-22-thierry.reding@gmail.com>
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

Add support for regular DisplayPort on Tegra210 and Tegra186.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dp.c  |  10 +-
 drivers/gpu/drm/tegra/sor.c | 343 +++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/tegra/sor.h |   1 +
 3 files changed, 348 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index 5b6765d653b4..70dfb7d1dec5 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -623,10 +623,10 @@ static int drm_dp_link_clock_recovery(struct drm_dp_link *link)
 			return err;
 		}
 
-		drm_dp_link_train_adjust(&link->train);
-
 		if (link->train.clock_recovered)
 			break;
+
+		drm_dp_link_train_adjust(&link->train);
 	}
 
 	return 0;
@@ -682,10 +682,10 @@ static int drm_dp_link_channel_equalization(struct drm_dp_link *link)
 			return err;
 		}
 
-		drm_dp_link_train_adjust(&link->train);
-
 		if (link->train.channel_equalized)
 			break;
+
+		drm_dp_link_train_adjust(&link->train);
 	}
 
 	return 0;
@@ -851,6 +851,8 @@ int drm_dp_link_train(struct drm_dp_link *link)
 {
 	int err;
 
+	drm_dp_link_train_init(&link->train);
+
 	if (link->caps.fast_training) {
 		if (drm_dp_link_train_valid(&link->train)) {
 			err = drm_dp_link_train_fast(link);
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 9e6a1ab7ef65..9cf008d7c67b 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2904,6 +2904,236 @@ static const struct drm_encoder_helper_funcs tegra_sor_hdmi_helpers = {
 	.atomic_check = tegra_sor_encoder_atomic_check,
 };
 
+static void tegra_sor_dp_disable(struct drm_encoder *encoder)
+{
+	struct tegra_output *output = encoder_to_output(encoder);
+	struct tegra_dc *dc = to_tegra_dc(encoder->crtc);
+	struct tegra_sor *sor = to_sor(output);
+	u32 value;
+	int err;
+
+	err = drm_dp_link_power_down(sor->aux, &sor->link);
+	if (err < 0)
+		dev_err(sor->dev, "failed to power down link: %d\n", err);
+
+	err = tegra_sor_detach(sor);
+	if (err < 0)
+		dev_err(sor->dev, "failed to detach SOR: %d\n", err);
+
+	tegra_sor_writel(sor, 0, SOR_STATE1);
+	tegra_sor_update(sor);
+
+	value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
+
+	if (!sor->soc->has_nvdisplay)
+		value &= ~(SOR1_TIMING_CYA | SOR_ENABLE(1));
+	else
+		value &= ~SOR_ENABLE(sor->index);
+
+	tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
+	tegra_dc_commit(dc);
+
+	value = tegra_sor_readl(sor, SOR_STATE1);
+	value &= ~SOR_STATE_ASY_PROTOCOL_MASK;
+	value &= ~SOR_STATE_ASY_SUBOWNER_MASK;
+	value &= ~SOR_STATE_ASY_OWNER_MASK;
+	tegra_sor_writel(sor, value, SOR_STATE1);
+	tegra_sor_update(sor);
+
+	/* switch to safe parent clock */
+	err = tegra_sor_set_parent_clock(sor, sor->clk_safe);
+	if (err < 0)
+		dev_err(sor->dev, "failed to set safe clock: %d\n", err);
+
+	err = tegra_sor_power_down(sor);
+	if (err < 0)
+		dev_err(sor->dev, "failed to power down SOR: %d\n", err);
+
+	err = tegra_io_pad_power_disable(sor->pad);
+	if (err < 0)
+		dev_err(sor->dev, "failed to power off I/O pad: %d\n", err);
+
+	err = drm_dp_aux_disable(sor->aux);
+	if (err < 0)
+		dev_err(sor->dev, "failed disable DPAUX: %d\n", err);
+
+	pm_runtime_put(sor->dev);
+}
+
+static void tegra_sor_dp_enable(struct drm_encoder *encoder)
+{
+	struct tegra_output *output = encoder_to_output(encoder);
+	struct tegra_dc *dc = to_tegra_dc(encoder->crtc);
+	struct tegra_sor *sor = to_sor(output);
+	struct tegra_sor_config config;
+	struct tegra_sor_state *state;
+	struct drm_display_mode *mode;
+	struct drm_display_info *info;
+	unsigned int i;
+	u32 value;
+	int err;
+
+	state = to_sor_state(output->connector.state);
+	mode = &encoder->crtc->state->adjusted_mode;
+	info = &output->connector.display_info;
+
+	pm_runtime_get_sync(sor->dev);
+
+	/* switch to safe parent clock */
+	err = tegra_sor_set_parent_clock(sor, sor->clk_safe);
+	if (err < 0)
+		dev_err(sor->dev, "failed to set safe parent clock: %d\n", err);
+
+	err = tegra_io_pad_power_enable(sor->pad);
+	if (err < 0)
+		dev_err(sor->dev, "failed to power on LVDS rail: %d\n", err);
+
+	usleep_range(20, 100);
+
+	err = drm_dp_aux_enable(sor->aux);
+	if (err < 0)
+		dev_err(sor->dev, "failed to enable DPAUX: %d\n", err);
+
+	err = drm_dp_link_probe(sor->aux, &sor->link);
+	if (err < 0)
+		dev_err(sor->dev, "failed to probe DP link: %d\n", err);
+
+	err = drm_dp_link_choose(&sor->link, mode, info);
+	if (err < 0)
+		dev_err(sor->dev, "failed to choose link: %d\n", err);
+
+	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
+	value &= ~SOR_PLL2_BANDGAP_POWERDOWN;
+	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
+
+	usleep_range(20, 40);
+
+	value = tegra_sor_readl(sor, sor->soc->regs->pll3);
+	value |= SOR_PLL3_PLL_VDD_MODE_3V3;
+	tegra_sor_writel(sor, value, sor->soc->regs->pll3);
+
+	value = tegra_sor_readl(sor, sor->soc->regs->pll0);
+	value &= ~(SOR_PLL0_VCOPD | SOR_PLL0_PWR);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll0);
+
+	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
+	value &= ~SOR_PLL2_SEQ_PLLCAPPD_ENFORCE;
+	value |= SOR_PLL2_SEQ_PLLCAPPD;
+	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
+
+	usleep_range(200, 400);
+
+	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
+	value &= ~SOR_PLL2_POWERDOWN_OVERRIDE;
+	value &= ~SOR_PLL2_PORT_POWERDOWN;
+	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
+
+	value = tegra_sor_readl(sor, SOR_CLK_CNTRL);
+	value &= ~SOR_CLK_CNTRL_DP_CLK_SEL_MASK;
+	value |= SOR_CLK_CNTRL_DP_CLK_SEL_DIFF_DPCLK;
+	tegra_sor_writel(sor, value, SOR_CLK_CNTRL);
+
+	usleep_range(200, 400);
+
+	value = tegra_sor_readl(sor, SOR_DP_SPARE0);
+	/* XXX not in TRM */
+	value &= ~SOR_DP_SPARE_PANEL_INTERNAL;
+	value |= SOR_DP_SPARE_SEQ_ENABLE;
+	tegra_sor_writel(sor, value, SOR_DP_SPARE0);
+
+	/* XXX not in TRM */
+	tegra_sor_writel(sor, 0, SOR_LVDS);
+
+	value = tegra_sor_readl(sor, sor->soc->regs->pll0);
+	value &= ~SOR_PLL0_ICHPMP_MASK;
+	value &= ~SOR_PLL0_VCOCAP_MASK;
+	value |= SOR_PLL0_ICHPMP(0x1);
+	value |= SOR_PLL0_VCOCAP(0x3);
+	value |= SOR_PLL0_RESISTOR_EXT;
+	tegra_sor_writel(sor, value, sor->soc->regs->pll0);
+
+	/* XXX not in TRM */
+	for (value = 0, i = 0; i < 5; i++)
+		value |= SOR_XBAR_CTRL_LINK0_XSEL(i, sor->soc->xbar_cfg[i]) |
+			 SOR_XBAR_CTRL_LINK1_XSEL(i, i);
+
+	tegra_sor_writel(sor, 0x00000000, SOR_XBAR_POL);
+	tegra_sor_writel(sor, value, SOR_XBAR_CTRL);
+
+	/* switch to DP parent clock */
+	err = tegra_sor_set_parent_clock(sor, sor->clk_pad);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to switch to pad clock: %d\n", err);
+		return;
+	}
+
+	err = clk_set_parent(sor->clk, sor->clk_parent);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to switch to parent clock: %d\n", err);
+		return;
+	}
+
+	/* use DP-A protocol */
+	value = tegra_sor_readl(sor, SOR_STATE1);
+	value &= ~SOR_STATE_ASY_PROTOCOL_MASK;
+	value |= SOR_STATE_ASY_PROTOCOL_DP_A;
+	tegra_sor_writel(sor, value, SOR_STATE1);
+
+	/* enable port */
+	value = tegra_sor_readl(sor, SOR_DP_LINKCTL0);
+	value |= SOR_DP_LINKCTL_ENABLE;
+	tegra_sor_writel(sor, value, SOR_DP_LINKCTL0);
+
+	tegra_sor_dp_term_calibrate(sor);
+
+	err = drm_dp_link_train(&sor->link);
+	if (err < 0)
+		dev_err(sor->dev, "link training failed: %d\n", err);
+	else
+		dev_dbg(sor->dev, "link training succeeded\n");
+
+	err = drm_dp_link_power_up(sor->aux, &sor->link);
+	if (err < 0)
+		dev_err(sor->dev, "failed to power up DP link: %d\n", err);
+
+	/* compute configuration */
+	memset(&config, 0, sizeof(config));
+	config.bits_per_pixel = state->bpc * 3;
+
+	err = tegra_sor_compute_config(sor, mode, &config, &sor->link);
+	if (err < 0)
+		dev_err(sor->dev, "failed to compute configuration: %d\n", err);
+
+	tegra_sor_apply_config(sor, &config);
+	tegra_sor_mode_set(sor, mode, state);
+	tegra_sor_update(sor);
+
+	err = tegra_sor_power_up(sor, 250);
+	if (err < 0)
+		dev_err(sor->dev, "failed to power up SOR: %d\n", err);
+
+	/* attach and wake up */
+	err = tegra_sor_attach(sor);
+	if (err < 0)
+		dev_err(sor->dev, "failed to attach SOR: %d\n", err);
+
+	value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
+	value |= SOR_ENABLE(sor->index);
+	tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
+
+	tegra_dc_commit(dc);
+
+	err = tegra_sor_wakeup(sor);
+	if (err < 0)
+		dev_err(sor->dev, "failed to wakeup SOR: %d\n", err);
+}
+
+static const struct drm_encoder_helper_funcs tegra_sor_dp_helpers = {
+	.disable = tegra_sor_dp_disable,
+	.enable = tegra_sor_dp_enable,
+	.atomic_check = tegra_sor_encoder_atomic_check,
+};
+
 static int tegra_sor_init(struct host1x_client *client)
 {
 	struct drm_device *drm = dev_get_drvdata(client->parent);
@@ -2930,6 +3160,7 @@ static int tegra_sor_init(struct host1x_client *client)
 		} else if (sor->soc->supports_dp) {
 			connector = DRM_MODE_CONNECTOR_DisplayPort;
 			encoder = DRM_MODE_ENCODER_TMDS;
+			helpers = &tegra_sor_dp_helpers;
 		}
 
 		sor->link.ops = &tegra_sor_dp_link_ops;
@@ -3115,6 +3346,43 @@ static const struct tegra_sor_ops tegra_sor_hdmi_ops = {
 	.remove = tegra_sor_hdmi_remove,
 };
 
+static int tegra_sor_dp_probe(struct tegra_sor *sor)
+{
+	int err;
+
+	sor->avdd_io_supply = devm_regulator_get(sor->dev, "avdd-io-hdmi-dp");
+	if (IS_ERR(sor->avdd_io_supply))
+		return PTR_ERR(sor->avdd_io_supply);
+
+	err = regulator_enable(sor->avdd_io_supply);
+	if (err < 0)
+		return err;
+
+	sor->vdd_pll_supply = devm_regulator_get(sor->dev, "vdd-hdmi-dp-pll");
+	if (IS_ERR(sor->vdd_pll_supply))
+		return PTR_ERR(sor->vdd_pll_supply);
+
+	err = regulator_enable(sor->vdd_pll_supply);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static int tegra_sor_dp_remove(struct tegra_sor *sor)
+{
+	regulator_disable(sor->vdd_pll_supply);
+	regulator_disable(sor->avdd_io_supply);
+
+	return 0;
+}
+
+static const struct tegra_sor_ops tegra_sor_dp_ops = {
+	.name = "DP",
+	.probe = tegra_sor_dp_probe,
+	.remove = tegra_sor_dp_remove,
+};
+
 static const u8 tegra124_sor_xbar_cfg[5] = {
 	0, 1, 2, 3, 4
 };
@@ -3308,6 +3576,10 @@ static const u8 tegra210_sor_xbar_cfg[5] = {
 	2, 1, 0, 3, 4
 };
 
+static const u8 tegra210_sor_lane_map[4] = {
+	0, 1, 2, 3,
+};
+
 static const struct tegra_sor_soc tegra210_sor = {
 	.supports_edp = true,
 	.supports_lvds = false,
@@ -3318,6 +3590,11 @@ static const struct tegra_sor_soc tegra210_sor = {
 	.has_nvdisplay = false,
 
 	.xbar_cfg = tegra210_sor_xbar_cfg,
+	.lane_map = tegra210_sor_lane_map,
+	.voltage_swing = tegra124_sor_voltage_swing,
+	.pre_emphasis = tegra124_sor_pre_emphasis,
+	.post_cursor = tegra124_sor_post_cursor,
+	.tx_pu = tegra124_sor_tx_pu,
 };
 
 static const struct tegra_sor_soc tegra210_sor1 = {
@@ -3332,6 +3609,11 @@ static const struct tegra_sor_soc tegra210_sor1 = {
 	.num_settings = ARRAY_SIZE(tegra210_sor_hdmi_defaults),
 	.settings = tegra210_sor_hdmi_defaults,
 	.xbar_cfg = tegra210_sor_xbar_cfg,
+	.lane_map = tegra210_sor_lane_map,
+	.voltage_swing = tegra124_sor_voltage_swing,
+	.pre_emphasis = tegra124_sor_pre_emphasis,
+	.post_cursor = tegra124_sor_post_cursor,
+	.tx_pu = tegra124_sor_tx_pu,
 };
 
 static const struct tegra_sor_regs tegra186_sor_regs = {
@@ -3349,6 +3631,54 @@ static const struct tegra_sor_regs tegra186_sor_regs = {
 	.dp_padctl2 = 0x16a,
 };
 
+static const u8 tegra186_sor_voltage_swing[4][4][4] = {
+	{
+		{ 0x13, 0x19, 0x1e, 0x28 },
+		{ 0x1e, 0x25, 0x2d, },
+		{ 0x28, 0x32, },
+		{ 0x39, },
+	}, {
+		{ 0x12, 0x16, 0x1b, 0x25 },
+		{ 0x1c, 0x23, 0x2a, },
+		{ 0x25, 0x2f, },
+		{ 0x37, }
+	}, {
+		{ 0x12, 0x16, 0x1a, 0x22 },
+		{ 0x1b, 0x20, 0x27, },
+		{ 0x24, 0x2d, },
+		{ 0x35, },
+	}, {
+		{ 0x11, 0x14, 0x17, 0x1f },
+		{ 0x19, 0x1e, 0x24, },
+		{ 0x22, 0x2a, },
+		{ 0x32, },
+	},
+};
+
+static const u8 tegra186_sor_pre_emphasis[4][4][4] = {
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
+		{ 0x00, 0x08, 0x14, 0x24 },
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
 static const struct tegra_sor_soc tegra186_sor = {
 	.supports_edp = false,
 	.supports_lvds = false,
@@ -3359,6 +3689,11 @@ static const struct tegra_sor_soc tegra186_sor = {
 	.has_nvdisplay = true,
 
 	.xbar_cfg = tegra124_sor_xbar_cfg,
+	.lane_map = tegra124_sor_lane_map,
+	.voltage_swing = tegra186_sor_voltage_swing,
+	.pre_emphasis = tegra186_sor_pre_emphasis,
+	.post_cursor = tegra124_sor_post_cursor,
+	.tx_pu = tegra124_sor_tx_pu,
 };
 
 static const struct tegra_sor_soc tegra186_sor1 = {
@@ -3373,6 +3708,11 @@ static const struct tegra_sor_soc tegra186_sor1 = {
 	.num_settings = ARRAY_SIZE(tegra186_sor_hdmi_defaults),
 	.settings = tegra186_sor_hdmi_defaults,
 	.xbar_cfg = tegra124_sor_xbar_cfg,
+	.lane_map = tegra124_sor_lane_map,
+	.voltage_swing = tegra186_sor_voltage_swing,
+	.pre_emphasis = tegra186_sor_pre_emphasis,
+	.post_cursor = tegra124_sor_post_cursor,
+	.tx_pu = tegra124_sor_tx_pu,
 };
 
 static const struct tegra_sor_regs tegra194_sor_regs = {
@@ -3530,8 +3870,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 			sor->ops = &tegra_sor_edp_ops;
 			sor->pad = TEGRA_IO_PAD_LVDS;
 		} else if (sor->soc->supports_dp) {
-			dev_err(&pdev->dev, "DisplayPort not supported yet\n");
-			return -ENODEV;
+			sor->ops = &tegra_sor_dp_ops;
 		} else {
 			dev_err(&pdev->dev, "unknown (DP) support\n");
 			return -ENODEV;
diff --git a/drivers/gpu/drm/tegra/sor.h b/drivers/gpu/drm/tegra/sor.h
index 5333406c0401..00e09d5dca30 100644
--- a/drivers/gpu/drm/tegra/sor.h
+++ b/drivers/gpu/drm/tegra/sor.h
@@ -39,6 +39,7 @@
 #define  SOR_STATE_ASY_CRC_MODE_NON_ACTIVE	(0x2 << 6)
 #define  SOR_STATE_ASY_CRC_MODE_COMPLETE	(0x1 << 6)
 #define  SOR_STATE_ASY_CRC_MODE_ACTIVE		(0x0 << 6)
+#define  SOR_STATE_ASY_SUBOWNER_MASK		(0x3 << 4)
 #define  SOR_STATE_ASY_OWNER_MASK		0xf
 #define  SOR_STATE_ASY_OWNER(x)			(((x) & 0xf) << 0)
 
-- 
2.23.0


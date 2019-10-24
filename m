Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6A0E38BA
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406140AbfJXQqq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:46 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34334 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405923AbfJXQqq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:46 -0400
Received: by mail-wm1-f67.google.com with SMTP id v3so2389582wmh.1
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JRd+EeKsrdPkPHAoa/K4vedud6vOnZI24UldnRJuL1o=;
        b=YMeLv7yawSgBBZoszFFBTVksesBuapiBWzHyCHSZhEu4WMy6aHBQ3Q99lujgQOTSFm
         V/Y6szr5WZ/SXYN3jfbEOfaustTjZrpRyJoB9FQJ1PLKMH6keA/p/BBF00xlHsKZjCxQ
         0Osy9DZDN0XfebYrPCNp8wcGV6vtJ2LrnoR0Km8/teYRQ8drJeg3NWUprZOZUGX4tKlF
         OmZotQGMGJGm8TXSjB/ceWl5+JtDlLgOxQGBIKSVpM0tzktrPWprq4mu/cbailDEJaBl
         0VW6Hs3/plvVHE02KBZ4S2y394P1jEYSTD6wXj8jvS9hhYMEW61mTySBTTZuGvlDfjlS
         mhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JRd+EeKsrdPkPHAoa/K4vedud6vOnZI24UldnRJuL1o=;
        b=IaajVtJ1NWpYfmBSn25yK0IRtYymxK7VnWk1iPUIl0KW4Migqwx9H9NeJ4sPQfpXAq
         zSbpAIOqJESRg7KCUgZdwuHY1TwAKd1P0UyI2EIN42vzXqaJCEbg6K7+b0PcHXOvCRL3
         hvteqcnGxG9qoFCdiupzsS6AVdetm9ebyrEsFFjmiFCWztgN5LDVweF2TRlMsLVcxTEa
         18O/s7w2/4SLPCHVFBl0ZVu4kkofKGzxmKI/v59t6n5t5A08nunwBXlCLKuBPClBvz1e
         vbUDGeIef+EUvUkiLB+hunSC+xB5CgOrtjmhRrtec9ZQKplpebE/X4KV+rZabgEgxnky
         JRuA==
X-Gm-Message-State: APjAAAU0eRW3BZvPwJZONNVss2DMkuT0asMey4w4wJyVdtB0W6sfGkj3
        bLgCYVVUKmivpW1um+MPc3s=
X-Google-Smtp-Source: APXvYqxWyKKQZOh8WvkcRPW/UWPlWq4kPtg4dR10MQ56wdE3BdMsocjBWjzg/prv7qySAP192JCkBg==
X-Received: by 2002:a7b:c1d1:: with SMTP id a17mr5359295wmj.74.1571935602491;
        Thu, 24 Oct 2019 09:46:42 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id d4sm33410024wrc.54.2019.10.24.09.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:41 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 29/32] drm/tegra: sor: Unify eDP and DP support
Date:   Thu, 24 Oct 2019 18:45:31 +0200
Message-Id: <20191024164534.132764-30-thierry.reding@gmail.com>
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

The SOR0 on Tegra210 does, contrary to what was previously assumed, in
fact support DisplayPort. The difference between SOR0 and SOR1 is that
the latter supports audio and HDCP over DP, whereas the former doesn't.

The code for eDP and DP is now almost identical and the differences can
easily be parameterized based on the presence of a panel. There is no
need any longer to duplicate the code.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 421 +++++++-----------------------------
 1 file changed, 74 insertions(+), 347 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index bf2e31199166..63831c37ad35 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -371,10 +371,11 @@ struct tegra_sor_regs {
 };
 
 struct tegra_sor_soc {
-	bool supports_edp;
 	bool supports_lvds;
 	bool supports_hdmi;
 	bool supports_dp;
+	bool supports_audio;
+	bool supports_hdcp;
 
 	const struct tegra_sor_regs *regs;
 	bool has_nvdisplay;
@@ -1806,306 +1807,6 @@ static const struct drm_encoder_funcs tegra_sor_encoder_funcs = {
 	.destroy = tegra_output_encoder_destroy,
 };
 
-static void tegra_sor_edp_disable(struct drm_encoder *encoder)
-{
-	struct tegra_output *output = encoder_to_output(encoder);
-	struct tegra_dc *dc = to_tegra_dc(encoder->crtc);
-	struct tegra_sor *sor = to_sor(output);
-	u32 value;
-	int err;
-
-	if (output->panel)
-		drm_panel_disable(output->panel);
-
-	err = tegra_sor_detach(sor);
-	if (err < 0)
-		dev_err(sor->dev, "failed to detach SOR: %d\n", err);
-
-	tegra_sor_writel(sor, 0, SOR_STATE1);
-	tegra_sor_update(sor);
-
-	value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
-	value &= ~SOR_ENABLE(0);
-	tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
-
-	tegra_dc_commit(dc);
-
-	err = tegra_sor_power_down(sor);
-	if (err < 0)
-		dev_err(sor->dev, "failed to power down SOR: %d\n", err);
-
-	if (sor->aux) {
-		err = drm_dp_aux_disable(sor->aux);
-		if (err < 0)
-			dev_err(sor->dev, "failed to disable DP: %d\n", err);
-	}
-
-	err = tegra_io_pad_power_disable(sor->pad);
-	if (err < 0)
-		dev_err(sor->dev, "failed to power off I/O pad: %d\n", err);
-
-	if (output->panel)
-		drm_panel_unprepare(output->panel);
-
-	pm_runtime_put(sor->dev);
-}
-
-#if 0
-static int calc_h_ref_to_sync(const struct drm_display_mode *mode,
-			      unsigned int *value)
-{
-	unsigned int hfp, hsw, hbp, a = 0, b;
-
-	hfp = mode->hsync_start - mode->hdisplay;
-	hsw = mode->hsync_end - mode->hsync_start;
-	hbp = mode->htotal - mode->hsync_end;
-
-	pr_info("hfp: %u, hsw: %u, hbp: %u\n", hfp, hsw, hbp);
-
-	b = hfp - 1;
-
-	pr_info("a: %u, b: %u\n", a, b);
-	pr_info("a + hsw + hbp = %u\n", a + hsw + hbp);
-
-	if (a + hsw + hbp <= 11) {
-		a = 1 + 11 - hsw - hbp;
-		pr_info("a: %u\n", a);
-	}
-
-	if (a > b)
-		return -EINVAL;
-
-	if (hsw < 1)
-		return -EINVAL;
-
-	if (mode->hdisplay < 16)
-		return -EINVAL;
-
-	if (value) {
-		if (b > a && a % 2)
-			*value = a + 1;
-		else
-			*value = a;
-	}
-
-	return 0;
-}
-#endif
-
-static void tegra_sor_edp_enable(struct drm_encoder *encoder)
-{
-	struct tegra_output *output = encoder_to_output(encoder);
-	struct tegra_dc *dc = to_tegra_dc(encoder->crtc);
-	struct tegra_sor *sor = to_sor(output);
-	struct tegra_sor_config config;
-	struct tegra_sor_state *state;
-	struct drm_display_mode *mode;
-	struct drm_display_info *info;
-	unsigned int i;
-	u32 value;
-	int err;
-
-	state = to_sor_state(output->connector.state);
-	mode = &encoder->crtc->state->adjusted_mode;
-	info = &output->connector.display_info;
-
-	pm_runtime_get_sync(sor->dev);
-
-	/* switch to safe parent clock */
-	err = tegra_sor_set_parent_clock(sor, sor->clk_safe);
-	if (err < 0)
-		dev_err(sor->dev, "failed to set safe parent clock: %d\n", err);
-
-	err = tegra_io_rail_power_on(TEGRA_IO_RAIL_LVDS);
-	if (err < 0)
-		dev_err(sor->dev, "failed to power on LVDS rail: %d\n", err);
-
-	usleep_range(20, 100);
-
-	err = drm_dp_aux_enable(sor->aux);
-	if (err < 0)
-		dev_err(sor->dev, "failed to enable DPAUX: %d\n", err);
-
-	err = drm_dp_link_probe(sor->aux, &sor->link);
-	if (err < 0)
-		dev_err(sor->dev, "failed to probe eDP link: %d\n", err);
-
-	tegra_sor_filter_rates(sor);
-
-	err = drm_dp_link_choose(&sor->link, mode, info);
-	if (err < 0)
-		dev_err(sor->dev, "failed to choose link: %d\n", err);
-
-	if (output->panel)
-		drm_panel_prepare(output->panel);
-
-	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
-	value &= ~SOR_PLL2_BANDGAP_POWERDOWN;
-	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
-
-	usleep_range(20, 40);
-
-	value = tegra_sor_readl(sor, sor->soc->regs->pll3);
-	value |= SOR_PLL3_PLL_VDD_MODE_3V3;
-	tegra_sor_writel(sor, value, sor->soc->regs->pll3);
-
-	value = tegra_sor_readl(sor, sor->soc->regs->pll0);
-	value &= ~(SOR_PLL0_VCOPD | SOR_PLL0_PWR);
-	tegra_sor_writel(sor, value, sor->soc->regs->pll0);
-
-	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
-	value &= ~SOR_PLL2_SEQ_PLLCAPPD_ENFORCE;
-	value |= SOR_PLL2_SEQ_PLLCAPPD;
-	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
-
-	usleep_range(200, 400);
-
-	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
-	value &= ~SOR_PLL2_POWERDOWN_OVERRIDE;
-	value &= ~SOR_PLL2_PORT_POWERDOWN;
-	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
-
-	value = tegra_sor_readl(sor, SOR_CLK_CNTRL);
-	value &= ~SOR_CLK_CNTRL_DP_CLK_SEL_MASK;
-	value |= SOR_CLK_CNTRL_DP_CLK_SEL_SINGLE_DPCLK;
-	tegra_sor_writel(sor, value, SOR_CLK_CNTRL);
-
-	value = tegra_sor_readl(sor, SOR_DP_SPARE0);
-	/* XXX not in TRM */
-	value |= SOR_DP_SPARE_PANEL_INTERNAL;
-	value |= SOR_DP_SPARE_SEQ_ENABLE;
-	tegra_sor_writel(sor, value, SOR_DP_SPARE0);
-
-	/* XXX not in TRM */
-	tegra_sor_writel(sor, 0, SOR_LVDS);
-
-	value = tegra_sor_readl(sor, sor->soc->regs->pll0);
-	value &= ~SOR_PLL0_ICHPMP_MASK;
-	value &= ~SOR_PLL0_VCOCAP_MASK;
-	value |= SOR_PLL0_ICHPMP(0x1);
-	value |= SOR_PLL0_VCOCAP(0x3);
-	value |= SOR_PLL0_RESISTOR_EXT;
-	tegra_sor_writel(sor, value, sor->soc->regs->pll0);
-
-	/* XXX not in TRM */
-	for (value = 0, i = 0; i < 5; i++)
-		value |= SOR_XBAR_CTRL_LINK0_XSEL(i, sor->xbar_cfg[i]) |
-			 SOR_XBAR_CTRL_LINK1_XSEL(i, i);
-
-	tegra_sor_writel(sor, 0x00000000, SOR_XBAR_POL);
-	tegra_sor_writel(sor, value, SOR_XBAR_CTRL);
-
-	/*
-	 * Switch the pad clock to the DP clock. Note that we cannot actually
-	 * do this because Tegra186 and later don't support clk_set_parent()
-	 * on the sorX_pad_clkout clocks. We already do the equivalent above
-	 * using the DP_CLK_SEL mux of the SOR_CLK_CNTRL register.
-	 */
-#if 0
-	err = clk_set_parent(sor->clk_pad, sor->clk_dp);
-	if (err < 0) {
-		dev_err(sor->dev, "failed to select pad parent clock: %d\n",
-			err);
-		return;
-	}
-#endif
-
-	/* switch the SOR clock to the pad clock */
-	err = tegra_sor_set_parent_clock(sor, sor->clk_pad);
-	if (err < 0) {
-		dev_err(sor->dev, "failed to select SOR parent clock: %d\n",
-			err);
-		return;
-	}
-
-	/* switch the output clock to the parent pixel clock */
-	err = clk_set_parent(sor->clk, sor->clk_parent);
-	if (err < 0) {
-		dev_err(sor->dev, "failed to select output parent clock: %d\n",
-			err);
-		return;
-	}
-
-	/* use DP-A protocol */
-	value = tegra_sor_readl(sor, SOR_STATE1);
-	value &= ~SOR_STATE_ASY_PROTOCOL_MASK;
-	value |= SOR_STATE_ASY_PROTOCOL_DP_A;
-	tegra_sor_writel(sor, value, SOR_STATE1);
-
-	/* enable port */
-	value = tegra_sor_readl(sor, SOR_DP_LINKCTL0);
-	value |= SOR_DP_LINKCTL_ENABLE;
-	tegra_sor_writel(sor, value, SOR_DP_LINKCTL0);
-
-	tegra_sor_dp_term_calibrate(sor);
-
-	err = drm_dp_link_train(&sor->link);
-	if (err < 0)
-		dev_err(sor->dev, "link training failed: %d\n", err);
-	else
-		dev_dbg(sor->dev, "link training succeeded\n");
-
-	err = drm_dp_link_power_up(sor->aux, &sor->link);
-	if (err < 0)
-		dev_err(sor->dev, "failed to power up eDP link: %d\n", err);
-
-	/* compute configuration */
-	memset(&config, 0, sizeof(config));
-	config.bits_per_pixel = state->bpc * 3;
-
-	err = tegra_sor_compute_config(sor, mode, &config, &sor->link);
-	if (err < 0)
-		dev_err(sor->dev, "failed to compute configuration: %d\n", err);
-
-	tegra_sor_apply_config(sor, &config);
-
-	err = tegra_sor_power_up(sor, 250);
-	if (err < 0)
-		dev_err(sor->dev, "failed to power up SOR: %d\n", err);
-
-	/* CSTM (LVDS, link A/B, upper) */
-	value = SOR_CSTM_LVDS | SOR_CSTM_LINK_ACT_A | SOR_CSTM_LINK_ACT_B |
-		SOR_CSTM_UPPER;
-	tegra_sor_writel(sor, value, SOR_CSTM);
-
-	/* use DP-A protocol */
-	value = tegra_sor_readl(sor, SOR_STATE1);
-	value &= ~SOR_STATE_ASY_PROTOCOL_MASK;
-	value |= SOR_STATE_ASY_PROTOCOL_DP_A;
-	tegra_sor_writel(sor, value, SOR_STATE1);
-
-	tegra_sor_mode_set(sor, mode, state);
-
-	/* PWM setup */
-	err = tegra_sor_setup_pwm(sor, 250);
-	if (err < 0)
-		dev_err(sor->dev, "failed to setup PWM: %d\n", err);
-
-	tegra_sor_update(sor);
-
-	err = tegra_sor_power_up(sor, 250);
-	if (err < 0)
-		dev_err(sor->dev, "failed to power up SOR: %d\n", err);
-
-	/* attach and wake up */
-	err = tegra_sor_attach(sor);
-	if (err < 0)
-		dev_err(sor->dev, "failed to attach SOR: %d\n", err);
-
-	value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
-	value |= SOR_ENABLE(0);
-	tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
-
-	tegra_dc_commit(dc);
-
-	err = tegra_sor_wakeup(sor);
-	if (err < 0)
-		dev_err(sor->dev, "failed to wakeup SOR: %d\n", err);
-
-	if (output->panel)
-		drm_panel_enable(output->panel);
-}
-
 static int
 tegra_sor_encoder_atomic_check(struct drm_encoder *encoder,
 			       struct drm_crtc_state *crtc_state,
@@ -2155,12 +1856,6 @@ tegra_sor_encoder_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
-static const struct drm_encoder_helper_funcs tegra_sor_edp_helpers = {
-	.disable = tegra_sor_edp_disable,
-	.enable = tegra_sor_edp_enable,
-	.atomic_check = tegra_sor_encoder_atomic_check,
-};
-
 static inline u32 tegra_sor_hdmi_subpack(const u8 *ptr, size_t size)
 {
 	u32 value = 0;
@@ -2535,9 +2230,9 @@ static void tegra_sor_hdmi_disable(struct drm_encoder *encoder)
 	value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
 
 	if (!sor->soc->has_nvdisplay)
-		value &= ~(SOR1_TIMING_CYA | SOR_ENABLE(1));
-	else
-		value &= ~SOR_ENABLE(sor->index);
+		value &= ~SOR1_TIMING_CYA;
+
+	value &= ~SOR_ENABLE(sor->index);
 
 	tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
 
@@ -2928,9 +2623,9 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 	value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
 
 	if (!sor->soc->has_nvdisplay)
-		value |= SOR_ENABLE(1) | SOR1_TIMING_CYA;
-	else
-		value |= SOR_ENABLE(sor->index);
+		value |= SOR1_TIMING_CYA;
+
+	value |= SOR_ENABLE(sor->index);
 
 	tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
 
@@ -2965,6 +2660,9 @@ static void tegra_sor_dp_disable(struct drm_encoder *encoder)
 	u32 value;
 	int err;
 
+	if (output->panel)
+		drm_panel_disable(output->panel);
+
 	err = drm_dp_link_power_down(sor->aux, &sor->link);
 	if (err < 0)
 		dev_err(sor->dev, "failed to power down link: %d\n", err);
@@ -2977,12 +2675,7 @@ static void tegra_sor_dp_disable(struct drm_encoder *encoder)
 	tegra_sor_update(sor);
 
 	value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
-
-	if (!sor->soc->has_nvdisplay)
-		value &= ~(SOR1_TIMING_CYA | SOR_ENABLE(1));
-	else
-		value &= ~SOR_ENABLE(sor->index);
-
+	value &= ~SOR_ENABLE(sor->index);
 	tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
 	tegra_dc_commit(dc);
 
@@ -3010,6 +2703,9 @@ static void tegra_sor_dp_disable(struct drm_encoder *encoder)
 	if (err < 0)
 		dev_err(sor->dev, "failed disable DPAUX: %d\n", err);
 
+	if (output->panel)
+		drm_panel_unprepare(output->panel);
+
 	pm_runtime_put(sor->dev);
 }
 
@@ -3051,10 +2747,15 @@ static void tegra_sor_dp_enable(struct drm_encoder *encoder)
 	if (err < 0)
 		dev_err(sor->dev, "failed to probe DP link: %d\n", err);
 
+	tegra_sor_filter_rates(sor);
+
 	err = drm_dp_link_choose(&sor->link, mode, info);
 	if (err < 0)
 		dev_err(sor->dev, "failed to choose link: %d\n", err);
 
+	if (output->panel)
+		drm_panel_prepare(output->panel);
+
 	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
 	value &= ~SOR_PLL2_BANDGAP_POWERDOWN;
 	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
@@ -3083,14 +2784,23 @@ static void tegra_sor_dp_enable(struct drm_encoder *encoder)
 
 	value = tegra_sor_readl(sor, SOR_CLK_CNTRL);
 	value &= ~SOR_CLK_CNTRL_DP_CLK_SEL_MASK;
-	value |= SOR_CLK_CNTRL_DP_CLK_SEL_DIFF_DPCLK;
+
+	if (output->panel)
+		value |= SOR_CLK_CNTRL_DP_CLK_SEL_SINGLE_DPCLK;
+	else
+		value |= SOR_CLK_CNTRL_DP_CLK_SEL_DIFF_DPCLK;
+
 	tegra_sor_writel(sor, value, SOR_CLK_CNTRL);
 
 	usleep_range(200, 400);
 
 	value = tegra_sor_readl(sor, SOR_DP_SPARE0);
 	/* XXX not in TRM */
-	value &= ~SOR_DP_SPARE_PANEL_INTERNAL;
+	if (output->panel)
+		value |= SOR_DP_SPARE_PANEL_INTERNAL;
+	else
+		value &= ~SOR_DP_SPARE_PANEL_INTERNAL;
+
 	value |= SOR_DP_SPARE_SEQ_ENABLE;
 	tegra_sor_writel(sor, value, SOR_DP_SPARE0);
 
@@ -3177,6 +2887,19 @@ static void tegra_sor_dp_enable(struct drm_encoder *encoder)
 
 	tegra_sor_apply_config(sor, &config);
 	tegra_sor_mode_set(sor, mode, state);
+
+	if (output->panel) {
+		/* CSTM (LVDS, link A/B, upper) */
+		value = SOR_CSTM_LVDS | SOR_CSTM_LINK_ACT_A | SOR_CSTM_LINK_ACT_B |
+			SOR_CSTM_UPPER;
+		tegra_sor_writel(sor, value, SOR_CSTM);
+
+		/* PWM setup */
+		err = tegra_sor_setup_pwm(sor, 250);
+		if (err < 0)
+			dev_err(sor->dev, "failed to setup PWM: %d\n", err);
+	}
+
 	tegra_sor_update(sor);
 
 	err = tegra_sor_power_up(sor, 250);
@@ -3197,6 +2920,9 @@ static void tegra_sor_dp_enable(struct drm_encoder *encoder)
 	err = tegra_sor_wakeup(sor);
 	if (err < 0)
 		dev_err(sor->dev, "failed to wakeup SOR: %d\n", err);
+
+	if (output->panel)
+		drm_panel_enable(output->panel);
 }
 
 static const struct drm_encoder_helper_funcs tegra_sor_dp_helpers = {
@@ -3205,10 +2931,6 @@ static const struct drm_encoder_helper_funcs tegra_sor_dp_helpers = {
 	.atomic_check = tegra_sor_encoder_atomic_check,
 };
 
-static const struct tegra_sor_ops tegra_sor_edp_ops = {
-	.name = "eDP",
-};
-
 static int tegra_sor_hdmi_probe(struct tegra_sor *sor)
 {
 	int err;
@@ -3330,10 +3052,10 @@ static int tegra_sor_init(struct host1x_client *client)
 			encoder = DRM_MODE_ENCODER_LVDS;
 		}
 	} else {
-		if (sor->ops == &tegra_sor_edp_ops) {
+		if (sor->output.panel) {
 			connector = DRM_MODE_CONNECTOR_eDP;
 			encoder = DRM_MODE_ENCODER_TMDS;
-			helpers = &tegra_sor_edp_helpers;
+			helpers = &tegra_sor_dp_helpers;
 		} else {
 			connector = DRM_MODE_CONNECTOR_DisplayPort;
 			encoder = DRM_MODE_ENCODER_TMDS;
@@ -3575,10 +3297,11 @@ static const u8 tegra124_sor_tx_pu[4][4][4] = {
 };
 
 static const struct tegra_sor_soc tegra124_sor = {
-	.supports_edp = true,
 	.supports_lvds = true,
 	.supports_hdmi = false,
-	.supports_dp = false,
+	.supports_dp = true,
+	.supports_audio = false,
+	.supports_hdcp = false,
 	.regs = &tegra124_sor_regs,
 	.has_nvdisplay = false,
 	.xbar_cfg = tegra124_sor_xbar_cfg,
@@ -3614,10 +3337,11 @@ static const u8 tegra132_sor_pre_emphasis[4][4][4] = {
 };
 
 static const struct tegra_sor_soc tegra132_sor = {
-	.supports_edp = true,
 	.supports_lvds = true,
 	.supports_hdmi = false,
-	.supports_dp = false,
+	.supports_dp = true,
+	.supports_audio = false,
+	.supports_hdcp = false,
 	.regs = &tegra124_sor_regs,
 	.has_nvdisplay = false,
 	.xbar_cfg = tegra124_sor_xbar_cfg,
@@ -3652,10 +3376,11 @@ static const u8 tegra210_sor_lane_map[4] = {
 };
 
 static const struct tegra_sor_soc tegra210_sor = {
-	.supports_edp = true,
 	.supports_lvds = false,
 	.supports_hdmi = false,
-	.supports_dp = false,
+	.supports_dp = true,
+	.supports_audio = false,
+	.supports_hdcp = false,
 
 	.regs = &tegra210_sor_regs,
 	.has_nvdisplay = false,
@@ -3669,10 +3394,11 @@ static const struct tegra_sor_soc tegra210_sor = {
 };
 
 static const struct tegra_sor_soc tegra210_sor1 = {
-	.supports_edp = false,
 	.supports_lvds = false,
 	.supports_hdmi = true,
 	.supports_dp = true,
+	.supports_audio = true,
+	.supports_hdcp = true,
 
 	.regs = &tegra210_sor_regs,
 	.has_nvdisplay = false,
@@ -3751,10 +3477,11 @@ static const u8 tegra186_sor_pre_emphasis[4][4][4] = {
 };
 
 static const struct tegra_sor_soc tegra186_sor = {
-	.supports_edp = false,
 	.supports_lvds = false,
 	.supports_hdmi = true,
 	.supports_dp = true,
+	.supports_audio = true,
+	.supports_hdcp = true,
 
 	.regs = &tegra186_sor_regs,
 	.has_nvdisplay = true,
@@ -3785,10 +3512,11 @@ static const struct tegra_sor_regs tegra194_sor_regs = {
 };
 
 static const struct tegra_sor_soc tegra194_sor = {
-	.supports_edp = true,
 	.supports_lvds = false,
 	.supports_hdmi = true,
 	.supports_dp = true,
+	.supports_audio = true,
+	.supports_hdcp = true,
 
 	.regs = &tegra194_sor_regs,
 	.has_nvdisplay = true,
@@ -3836,7 +3564,7 @@ static int tegra_sor_parse_dt(struct tegra_sor *sor)
 		 */
 		sor->pad = TEGRA_IO_PAD_HDMI_DP0 + sor->index;
 	} else {
-		if (sor->soc->supports_edp)
+		if (!sor->soc->supports_audio)
 			sor->index = 0;
 		else
 			sor->index = 1;
@@ -3929,16 +3657,15 @@ static int tegra_sor_probe(struct platform_device *pdev)
 			return -ENODEV;
 		}
 	} else {
-		if (sor->soc->supports_edp) {
-			sor->ops = &tegra_sor_edp_ops;
-			sor->pad = TEGRA_IO_PAD_LVDS;
-		} else if (sor->soc->supports_dp) {
-			sor->ops = &tegra_sor_dp_ops;
-			sor->pad = TEGRA_IO_PAD_LVDS;
-		} else {
-			dev_err(&pdev->dev, "unknown (DP) support\n");
-			return -ENODEV;
-		}
+		np = of_parse_phandle(pdev->dev.of_node, "nvidia,panel", 0);
+		/*
+		 * No need to keep this around since we only use it as a check
+		 * to see if a panel is connected (eDP) or not (DP).
+		 */
+		of_node_put(np);
+
+		sor->ops = &tegra_sor_dp_ops;
+		sor->pad = TEGRA_IO_PAD_LVDS;
 	}
 
 	err = tegra_sor_parse_dt(sor);
-- 
2.23.0


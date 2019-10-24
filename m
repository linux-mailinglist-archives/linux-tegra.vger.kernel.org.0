Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6671E38A7
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439903AbfJXQqX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:23 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40025 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439894AbfJXQqX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:23 -0400
Received: by mail-wm1-f67.google.com with SMTP id w9so2096794wmm.5
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ttT3si52DDrLe8rV2q4VCFEdVpWo5U+DWjczyNb5rNc=;
        b=UNIkA8bpA50Dxy7/OKcXV6PnS6z/MQqhkDXYqura3mEtmgaBM3jKh2X3GDf1T4bd2j
         Xrtn8qelu9G2lsyx9P1XXmoxaNZ3Tegl6jN3MB8caGCjf+3ilsACNNGhQTjqIErJ8Q/s
         RyMXuruGhJDecOfI4Eu5AHy2hdVjS7pnSOAgkhD/sQoXmax2DdHFSkrwiKKmOonejw7k
         kSH0jd5dSzNG7g2lc+MJ4ESZbqIk+gxh9p8ccmSFcPAfr8VIClJ8v7cLcIdo7SUtGIii
         mgzbF+8pf701SN0Ep+xemEciCPL1Ifl67rS3ZmHDo41CnblX9lbSnuxYQTpqL+cQlxil
         wYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ttT3si52DDrLe8rV2q4VCFEdVpWo5U+DWjczyNb5rNc=;
        b=me5kun+RMCpqsLzoYx+lNHKFRoMx4dBFAWUR3Wx5wt0hZeMKKibEMIpZ7ECIJfsTsM
         nc2D1gNI25YPvaGVqnHfx0T0DrdVJIwpkCb/msnO1lahUjCTvFCdSaKB5QZmsCyBR9fq
         zKv6UmtU5BZytYfmGBwhv82A+qbT/FDAUUTK798hpsxWnI4CxZVLGuCNEYSa7hmNnhit
         l7Rt+6Rt3FJEDLcKZSd7ibCR6Zfk+gxuu4EtvRDPHar3+LvtN2e8n/Zv2eoX9Jzg7US2
         +BSZWENtCr6SDD9Axiyi85In1XZSzlDwjMbLg7ZibVYIovUxtSdI4p3TE6SxAZk/RQpC
         INmg==
X-Gm-Message-State: APjAAAXcFhBvl3VWLGcVqkzlJLFD3H4SqPNzGbRDEYaSrf8kS1qZM7Uf
        VczXaKnywZZysM9vwCukWbslnLWz
X-Google-Smtp-Source: APXvYqzVNNv01TzzHYZ3HhrvpfPbLREUJSHb0h+1SF2prDrc/YOq+hj2nDhyqWK+9K4sdKhH+dtJag==
X-Received: by 2002:a1c:6386:: with SMTP id x128mr5633205wmb.41.1571935580516;
        Thu, 24 Oct 2019 09:46:20 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id y13sm37631421wrg.8.2019.10.24.09.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:19 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 19/32] drm/tegra: sor: Stabilize eDP
Date:   Thu, 24 Oct 2019 18:45:21 +0200
Message-Id: <20191024164534.132764-20-thierry.reding@gmail.com>
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

Rework eDP code to correspond more closely to what's documented. This
also improves the reliability of modesets.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 138 +++++++++++++-----------------------
 1 file changed, 49 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 6f979c5fff7b..2023244ad328 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1878,119 +1878,80 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 
 	pm_runtime_get_sync(sor->dev);
 
-	if (output->panel)
-		drm_panel_prepare(output->panel);
+	/* switch to safe parent clock */
+	err = tegra_sor_set_parent_clock(sor, sor->clk_safe);
+	if (err < 0)
+		dev_err(sor->dev, "failed to set safe parent clock: %d\n", err);
+
+	err = tegra_io_rail_power_on(TEGRA_IO_RAIL_LVDS);
+	if (err < 0)
+		dev_err(sor->dev, "failed to power on LVDS rail: %d\n", err);
+
+	usleep_range(20, 100);
 
 	err = drm_dp_aux_enable(sor->aux);
 	if (err < 0)
-		dev_err(sor->dev, "failed to enable DP: %d\n", err);
+		dev_err(sor->dev, "failed to enable DPAUX: %d\n", err);
 
 	err = drm_dp_link_probe(sor->aux, &sor->link);
-	if (err < 0) {
+	if (err < 0)
 		dev_err(sor->dev, "failed to probe eDP link: %d\n", err);
-		return;
-	}
 
-	/* switch to safe parent clock */
-	err = tegra_sor_set_parent_clock(sor, sor->clk_safe);
+	err = drm_dp_link_choose(&sor->link, mode, info);
 	if (err < 0)
-		dev_err(sor->dev, "failed to set safe parent clock: %d\n", err);
+		dev_err(sor->dev, "failed to choose link: %d\n", err);
 
-	value = tegra_sor_readl(sor, SOR_CLK_CNTRL);
-	value &= ~SOR_CLK_CNTRL_DP_CLK_SEL_MASK;
-	value |= SOR_CLK_CNTRL_DP_CLK_SEL_SINGLE_DPCLK;
-	tegra_sor_writel(sor, value, SOR_CLK_CNTRL);
+	if (output->panel)
+		drm_panel_prepare(output->panel);
 
 	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
 	value &= ~SOR_PLL2_BANDGAP_POWERDOWN;
 	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
-	usleep_range(20, 100);
+
+	usleep_range(20, 40);
 
 	value = tegra_sor_readl(sor, sor->soc->regs->pll3);
 	value |= SOR_PLL3_PLL_VDD_MODE_3V3;
 	tegra_sor_writel(sor, value, sor->soc->regs->pll3);
 
-	value = SOR_PLL0_ICHPMP(0xf) | SOR_PLL0_VCOCAP_RST |
-		SOR_PLL0_PLLREG_LEVEL_V45 | SOR_PLL0_RESISTOR_EXT;
+	value = tegra_sor_readl(sor, sor->soc->regs->pll0);
+	value &= ~(SOR_PLL0_VCOPD | SOR_PLL0_PWR);
 	tegra_sor_writel(sor, value, sor->soc->regs->pll0);
 
 	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
-	value |= SOR_PLL2_SEQ_PLLCAPPD;
 	value &= ~SOR_PLL2_SEQ_PLLCAPPD_ENFORCE;
-	value |= SOR_PLL2_LVDS_ENABLE;
+	value |= SOR_PLL2_SEQ_PLLCAPPD;
 	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
 
-	value = SOR_PLL1_TERM_COMPOUT | SOR_PLL1_TMDS_TERM;
-	tegra_sor_writel(sor, value, sor->soc->regs->pll1);
-
-	while (true) {
-		value = tegra_sor_readl(sor, sor->soc->regs->pll2);
-		if ((value & SOR_PLL2_SEQ_PLLCAPPD_ENFORCE) == 0)
-			break;
-
-		usleep_range(250, 1000);
-	}
+	usleep_range(200, 400);
 
 	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
 	value &= ~SOR_PLL2_POWERDOWN_OVERRIDE;
 	value &= ~SOR_PLL2_PORT_POWERDOWN;
 	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
 
-	/*
-	 * power up
-	 */
-
-	/* set safe link bandwidth (1.62 Gbps) */
 	value = tegra_sor_readl(sor, SOR_CLK_CNTRL);
-	value &= ~SOR_CLK_CNTRL_DP_LINK_SPEED_MASK;
-	value |= SOR_CLK_CNTRL_DP_LINK_SPEED_G1_62;
+	value &= ~SOR_CLK_CNTRL_DP_CLK_SEL_MASK;
+	value |= SOR_CLK_CNTRL_DP_CLK_SEL_SINGLE_DPCLK;
 	tegra_sor_writel(sor, value, SOR_CLK_CNTRL);
 
-	/* step 1 */
-	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
-	value |= SOR_PLL2_SEQ_PLLCAPPD_ENFORCE | SOR_PLL2_PORT_POWERDOWN |
-		 SOR_PLL2_BANDGAP_POWERDOWN;
-	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
-
-	value = tegra_sor_readl(sor, sor->soc->regs->pll0);
-	value |= SOR_PLL0_VCOPD | SOR_PLL0_PWR;
-	tegra_sor_writel(sor, value, sor->soc->regs->pll0);
-
-	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
-	value &= ~SOR_DP_PADCTL_PAD_CAL_PD;
-	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
-
-	/* step 2 */
-	err = tegra_io_pad_power_enable(sor->pad);
-	if (err < 0)
-		dev_err(sor->dev, "failed to power on I/O pad: %d\n", err);
-
-	usleep_range(5, 100);
-
-	/* step 3 */
-	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
-	value &= ~SOR_PLL2_BANDGAP_POWERDOWN;
-	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
+	value = tegra_sor_readl(sor, SOR_DP_SPARE0);
+	/* XXX not in TRM */
+	value |= SOR_DP_SPARE_PANEL_INTERNAL;
+	value |= SOR_DP_SPARE_SEQ_ENABLE;
+	tegra_sor_writel(sor, value, SOR_DP_SPARE0);
 
-	usleep_range(20, 100);
+	/* XXX not in TRM */
+	tegra_sor_writel(sor, 0, SOR_LVDS);
 
-	/* step 4 */
 	value = tegra_sor_readl(sor, sor->soc->regs->pll0);
-	value &= ~SOR_PLL0_VCOPD;
-	value &= ~SOR_PLL0_PWR;
+	value &= ~SOR_PLL0_ICHPMP_MASK;
+	value &= ~SOR_PLL0_VCOCAP_MASK;
+	value |= SOR_PLL0_ICHPMP(0x1);
+	value |= SOR_PLL0_VCOCAP(0x3);
+	value |= SOR_PLL0_RESISTOR_EXT;
 	tegra_sor_writel(sor, value, sor->soc->regs->pll0);
 
-	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
-	value &= ~SOR_PLL2_SEQ_PLLCAPPD_ENFORCE;
-	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
-
-	usleep_range(200, 1000);
-
-	/* step 5 */
-	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
-	value &= ~SOR_PLL2_PORT_POWERDOWN;
-	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
-
 	/* XXX not in TRM */
 	for (value = 0, i = 0; i < 5; i++)
 		value |= SOR_XBAR_CTRL_LINK0_XSEL(i, sor->xbar_cfg[i]) |
@@ -2015,7 +1976,6 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 	value |= SOR_DP_LINKCTL_ENABLE;
 	tegra_sor_writel(sor, value, SOR_DP_LINKCTL0);
 
-	/* calibrate termination resistance (XXX do this only on HPD) */
 	tegra_sor_dp_term_calibrate(sor);
 
 	err = drm_dp_link_train(&sor->link);
@@ -2025,21 +1985,16 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 		dev_dbg(sor->dev, "link training succeeded\n");
 
 	err = drm_dp_link_power_up(sor->aux, &sor->link);
-	if (err < 0) {
-		dev_err(sor->dev, "failed to power up eDP link: %d\n",
-			err);
-		return;
-	}
+	if (err < 0)
+		dev_err(sor->dev, "failed to power up eDP link: %d\n", err);
 
 	/* compute configuration */
 	memset(&config, 0, sizeof(config));
 	config.bits_per_pixel = state->bpc * 3;
 
 	err = tegra_sor_compute_config(sor, mode, &config, &sor->link);
-	if (err < 0) {
+	if (err < 0)
 		dev_err(sor->dev, "failed to compute configuration: %d\n", err);
-		return;
-	}
 
 	tegra_sor_apply_config(sor, &config);
 
@@ -2067,19 +2022,24 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 
 	tegra_sor_update(sor);
 
+	err = tegra_sor_power_up(sor, 250);
+	if (err < 0)
+		dev_err(sor->dev, "failed to power up SOR: %d\n", err);
+
+	/* attach and wake up */
+	err = tegra_sor_attach(sor);
+	if (err < 0)
+		dev_err(sor->dev, "failed to attach SOR: %d\n", err);
+
 	value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
 	value |= SOR_ENABLE(0);
 	tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
 
 	tegra_dc_commit(dc);
 
-	err = tegra_sor_attach(sor);
-	if (err < 0)
-		dev_err(sor->dev, "failed to attach SOR: %d\n", err);
-
 	err = tegra_sor_wakeup(sor);
 	if (err < 0)
-		dev_err(sor->dev, "failed to enable DC: %d\n", err);
+		dev_err(sor->dev, "failed to wakeup SOR: %d\n", err);
 
 	if (output->panel)
 		drm_panel_enable(output->panel);
-- 
2.23.0


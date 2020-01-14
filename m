Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 855BF13A1C6
	for <lists+linux-tegra@lfdr.de>; Tue, 14 Jan 2020 08:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729173AbgANHYt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Jan 2020 02:24:49 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13926 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728927AbgANHYs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Jan 2020 02:24:48 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e1d6ca90000>; Mon, 13 Jan 2020 23:24:25 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 13 Jan 2020 23:24:45 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 13 Jan 2020 23:24:45 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Jan
 2020 07:24:45 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 14 Jan 2020 07:24:45 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.169.242]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e1d6cbc0000>; Mon, 13 Jan 2020 23:24:45 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <digetx@gmail.com>, <mperttunen@nvidia.com>,
        <gregkh@linuxfoundation.org>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <spujar@nvidia.com>, <josephl@nvidia.com>,
        <daniel.lezcano@linaro.org>, <mmaddireddy@nvidia.com>,
        <markz@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 20/22] clk: tegra: Remove tegra_pmc_clk_init along with clk ids
Date:   Mon, 13 Jan 2020 23:24:25 -0800
Message-ID: <1578986667-16041-21-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1578986666; bh=IIKzLAIwRv7hz1NVeZfrWGWpINvFcOxl4tNERV11k9o=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=kEvQPwJDDxgzeFS3heawT2nlydurXtF1BZQnRr6CkfeOmMcZr49NCURp/3NEvNl9c
         1aatMRgrxUtDCjVtADRpz1/Nyo0+/9cBQq2GZFsHMhJGrbkx5PWKF4C/DEXxyu9JHt
         D5WlFQn68ymnbFxAd2S59GBExsMGVY+L/pSSMwUEdxRTVq43RXQ8QJQ0RuT1CcmTwh
         Ug49xsoU6u86SetAsUTKtm2zW/hqXhbdJkJG1Cl+WkknU6CRIqHdyyqCbnJ93rnjWh
         4oc0ASeRicKwJqESuiMuVr+Ax4z82ybP9ttlnI6uC8HY54MJ9HeahG/EA5eKJbhLDs
         Cod9HF/6H4VZw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Current Tegra clock driver registers PMC clocks clk_out_1, clk_out_2,
clk_out_3 and 32KHz blink output in tegra_pmc_init() which does direct
PMC register access during clk_ops and these PMC register read and write
access will not happen when PMC is in secure mode.

Any direct PMC register access from non-secure world will not go
through.

All the PMC clocks are moved to Tegra PMC driver with PMC as a clock
provider.

This patch removes tegra_pmc_clk_init along with corresponding clk ids
from Tegra clock driver.

Tested-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/Makefile        |   1 -
 drivers/clk/tegra/clk-id.h        |   7 ---
 drivers/clk/tegra/clk-tegra-pmc.c | 122 --------------------------------------
 drivers/clk/tegra/clk-tegra114.c  |  17 +-----
 drivers/clk/tegra/clk-tegra124.c  |  33 ++++-------
 drivers/clk/tegra/clk-tegra20.c   |   4 --
 drivers/clk/tegra/clk-tegra210.c  |  17 +-----
 drivers/clk/tegra/clk-tegra30.c   |  18 +-----
 drivers/clk/tegra/clk.h           |   1 -
 9 files changed, 19 insertions(+), 201 deletions(-)
 delete mode 100644 drivers/clk/tegra/clk-tegra-pmc.c

diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
index df966ca06788..1f7c30f87ece 100644
--- a/drivers/clk/tegra/Makefile
+++ b/drivers/clk/tegra/Makefile
@@ -12,7 +12,6 @@ obj-y					+= clk-sdmmc-mux.o
 obj-y					+= clk-super.o
 obj-y					+= clk-tegra-audio.o
 obj-y					+= clk-tegra-periph.o
-obj-y					+= clk-tegra-pmc.o
 obj-y					+= clk-tegra-fixed.o
 obj-y					+= clk-tegra-super-gen4.o
 obj-$(CONFIG_TEGRA_CLK_EMC)		+= clk-emc.o
diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index cf42e5995794..ff7da2d3e94d 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -32,7 +32,6 @@ enum clk_id {
 	tegra_clk_audio4,
 	tegra_clk_audio4_2x,
 	tegra_clk_audio4_mux,
-	tegra_clk_blink,
 	tegra_clk_bsea,
 	tegra_clk_bsev,
 	tegra_clk_cclk_g,
@@ -47,12 +46,6 @@ enum clk_id {
 	tegra_clk_osc,
 	tegra_clk_osc_div2,
 	tegra_clk_osc_div4,
-	tegra_clk_clk_out_1,
-	tegra_clk_clk_out_1_mux,
-	tegra_clk_clk_out_2,
-	tegra_clk_clk_out_2_mux,
-	tegra_clk_clk_out_3,
-	tegra_clk_clk_out_3_mux,
 	tegra_clk_cml0,
 	tegra_clk_cml1,
 	tegra_clk_csi,
diff --git a/drivers/clk/tegra/clk-tegra-pmc.c b/drivers/clk/tegra/clk-tegra-pmc.c
deleted file mode 100644
index 5e044ba1ae36..000000000000
--- a/drivers/clk/tegra/clk-tegra-pmc.c
+++ /dev/null
@@ -1,122 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2012, 2013, NVIDIA CORPORATION.  All rights reserved.
- */
-
-#include <linux/io.h>
-#include <linux/clk-provider.h>
-#include <linux/clkdev.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/delay.h>
-#include <linux/export.h>
-#include <linux/clk/tegra.h>
-
-#include "clk.h"
-#include "clk-id.h"
-
-#define PMC_CLK_OUT_CNTRL 0x1a8
-#define PMC_DPD_PADS_ORIDE 0x1c
-#define PMC_DPD_PADS_ORIDE_BLINK_ENB 20
-#define PMC_CTRL 0
-#define PMC_CTRL_BLINK_ENB 7
-#define PMC_BLINK_TIMER 0x40
-
-struct pmc_clk_init_data {
-	char *mux_name;
-	char *gate_name;
-	const char **parents;
-	int num_parents;
-	int mux_id;
-	int gate_id;
-	char *dev_name;
-	u8 mux_shift;
-	u8 gate_shift;
-};
-
-#define PMC_CLK(_num, _mux_shift, _gate_shift)\
-	{\
-		.mux_name = "clk_out_" #_num "_mux",\
-		.gate_name = "clk_out_" #_num,\
-		.parents = clk_out ##_num ##_parents,\
-		.num_parents = ARRAY_SIZE(clk_out ##_num ##_parents),\
-		.mux_id = tegra_clk_clk_out_ ##_num ##_mux,\
-		.gate_id = tegra_clk_clk_out_ ##_num,\
-		.dev_name = "extern" #_num,\
-		.mux_shift = _mux_shift,\
-		.gate_shift = _gate_shift,\
-	}
-
-static DEFINE_SPINLOCK(clk_out_lock);
-
-static const char *clk_out1_parents[] = { "osc", "osc_div2",
-	"osc_div4", "extern1",
-};
-
-static const char *clk_out2_parents[] = { "osc", "osc_div2",
-	"osc_div4", "extern2",
-};
-
-static const char *clk_out3_parents[] = { "osc", "osc_div2",
-	"osc_div4", "extern3",
-};
-
-static struct pmc_clk_init_data pmc_clks[] = {
-	PMC_CLK(1, 6, 2),
-	PMC_CLK(2, 14, 10),
-	PMC_CLK(3, 22, 18),
-};
-
-void __init tegra_pmc_clk_init(void __iomem *pmc_base,
-				struct tegra_clk *tegra_clks)
-{
-	struct clk *clk;
-	struct clk **dt_clk;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(pmc_clks); i++) {
-		struct pmc_clk_init_data *data;
-
-		data = pmc_clks + i;
-
-		dt_clk = tegra_lookup_dt_id(data->mux_id, tegra_clks);
-		if (!dt_clk)
-			continue;
-
-		clk = clk_register_mux(NULL, data->mux_name, data->parents,
-				data->num_parents,
-				CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
-				pmc_base + PMC_CLK_OUT_CNTRL, data->mux_shift,
-				3, 0, &clk_out_lock);
-		*dt_clk = clk;
-
-
-		dt_clk = tegra_lookup_dt_id(data->gate_id, tegra_clks);
-		if (!dt_clk)
-			continue;
-
-		clk = clk_register_gate(NULL, data->gate_name, data->mux_name,
-					CLK_SET_RATE_PARENT,
-					pmc_base + PMC_CLK_OUT_CNTRL,
-					data->gate_shift, 0, &clk_out_lock);
-		*dt_clk = clk;
-		clk_register_clkdev(clk, data->dev_name, data->gate_name);
-	}
-
-	/* blink */
-	writel_relaxed(0, pmc_base + PMC_BLINK_TIMER);
-	clk = clk_register_gate(NULL, "blink_override", "clk_32k", 0,
-				pmc_base + PMC_DPD_PADS_ORIDE,
-				PMC_DPD_PADS_ORIDE_BLINK_ENB, 0, NULL);
-
-	dt_clk = tegra_lookup_dt_id(tegra_clk_blink, tegra_clks);
-	if (!dt_clk)
-		return;
-
-	clk = clk_register_gate(NULL, "blink", "blink_override", 0,
-				pmc_base + PMC_CTRL,
-				PMC_CTRL_BLINK_ENB, 0, NULL);
-	clk_register_clkdev(clk, "blink", NULL);
-	*dt_clk = clk;
-}
-
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 180ddc2abfd2..c138ef75480b 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -779,10 +779,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_audio3] = { .dt_id = TEGRA114_CLK_AUDIO3, .present = true },
 	[tegra_clk_audio4] = { .dt_id = TEGRA114_CLK_AUDIO4, .present = true },
 	[tegra_clk_spdif] = { .dt_id = TEGRA114_CLK_SPDIF, .present = true },
-	[tegra_clk_clk_out_1] = { .dt_id = TEGRA114_CLK_CLK_OUT_1, .present = true },
-	[tegra_clk_clk_out_2] = { .dt_id = TEGRA114_CLK_CLK_OUT_2, .present = true },
-	[tegra_clk_clk_out_3] = { .dt_id = TEGRA114_CLK_CLK_OUT_3, .present = true },
-	[tegra_clk_blink] = { .dt_id = TEGRA114_CLK_BLINK, .present = true },
 	[tegra_clk_xusb_host_src] = { .dt_id = TEGRA114_CLK_XUSB_HOST_SRC, .present = true },
 	[tegra_clk_xusb_falcon_src] = { .dt_id = TEGRA114_CLK_XUSB_FALCON_SRC, .present = true },
 	[tegra_clk_xusb_fs_src] = { .dt_id = TEGRA114_CLK_XUSB_FS_SRC, .present = true },
@@ -804,9 +800,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_audio3_mux] = { .dt_id = TEGRA114_CLK_AUDIO3_MUX, .present = true },
 	[tegra_clk_audio4_mux] = { .dt_id = TEGRA114_CLK_AUDIO4_MUX, .present = true },
 	[tegra_clk_spdif_mux] = { .dt_id = TEGRA114_CLK_SPDIF_MUX, .present = true },
-	[tegra_clk_clk_out_1_mux] = { .dt_id = TEGRA114_CLK_CLK_OUT_1_MUX, .present = true },
-	[tegra_clk_clk_out_2_mux] = { .dt_id = TEGRA114_CLK_CLK_OUT_2_MUX, .present = true },
-	[tegra_clk_clk_out_3_mux] = { .dt_id = TEGRA114_CLK_CLK_OUT_3_MUX, .present = true },
 	[tegra_clk_dsia_mux] = { .dt_id = TEGRA114_CLK_DSIA_MUX, .present = true },
 	[tegra_clk_dsib_mux] = { .dt_id = TEGRA114_CLK_DSIB_MUX, .present = true },
 	[tegra_clk_cec] = { .dt_id = TEGRA114_CLK_CEC, .present = true },
@@ -865,10 +858,9 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "audio3_2x", .dt_id = TEGRA114_CLK_AUDIO3_2X },
 	{ .con_id = "audio4_2x", .dt_id = TEGRA114_CLK_AUDIO4_2X },
 	{ .con_id = "spdif_2x", .dt_id = TEGRA114_CLK_SPDIF_2X },
-	{ .con_id = "extern1", .dev_id = "clk_out_1", .dt_id = TEGRA114_CLK_EXTERN1 },
-	{ .con_id = "extern2", .dev_id = "clk_out_2", .dt_id = TEGRA114_CLK_EXTERN2 },
-	{ .con_id = "extern3", .dev_id = "clk_out_3", .dt_id = TEGRA114_CLK_EXTERN3 },
-	{ .con_id = "blink", .dt_id = TEGRA114_CLK_BLINK },
+	{ .con_id = "extern1", .dt_id = TEGRA114_CLK_EXTERN1 },
+	{ .con_id = "extern2", .dt_id = TEGRA114_CLK_EXTERN2 },
+	{ .con_id = "extern3", .dt_id = TEGRA114_CLK_EXTERN3 },
 	{ .con_id = "cclk_g", .dt_id = TEGRA114_CLK_CCLK_G },
 	{ .con_id = "cclk_lp", .dt_id = TEGRA114_CLK_CCLK_LP },
 	{ .con_id = "sclk", .dt_id = TEGRA114_CLK_SCLK },
@@ -1147,8 +1139,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA114_CLK_PLL_A, TEGRA114_CLK_CLK_MAX, 564480000, 1 },
 	{ TEGRA114_CLK_PLL_A_OUT0, TEGRA114_CLK_CLK_MAX, 11289600, 1 },
 	{ TEGRA114_CLK_EXTERN1, TEGRA114_CLK_PLL_A_OUT0, 0, 1 },
-	{ TEGRA114_CLK_CLK_OUT_1_MUX, TEGRA114_CLK_EXTERN1, 0, 1 },
-	{ TEGRA114_CLK_CLK_OUT_1, TEGRA114_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA114_CLK_I2S0, TEGRA114_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA114_CLK_I2S1, TEGRA114_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA114_CLK_I2S2, TEGRA114_CLK_PLL_A_OUT0, 11289600, 0 },
@@ -1350,7 +1340,6 @@ static void __init tegra114_clock_init(struct device_node *np)
 	tegra_audio_clk_init(clk_base, pmc_base, tegra114_clks,
 			     tegra114_audio_plls,
 			     ARRAY_SIZE(tegra114_audio_plls), 24000000);
-	tegra_pmc_clk_init(pmc_base, tegra114_clks);
 	tegra_super_clk_gen4_init(clk_base, pmc_base, tegra114_clks,
 					&pll_x_params);
 
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 7a16e50eb20f..54cac77deaa3 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -903,10 +903,6 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_audio3] = { .dt_id = TEGRA124_CLK_AUDIO3, .present = true },
 	[tegra_clk_audio4] = { .dt_id = TEGRA124_CLK_AUDIO4, .present = true },
 	[tegra_clk_spdif] = { .dt_id = TEGRA124_CLK_SPDIF, .present = true },
-	[tegra_clk_clk_out_1] = { .dt_id = TEGRA124_CLK_CLK_OUT_1, .present = true },
-	[tegra_clk_clk_out_2] = { .dt_id = TEGRA124_CLK_CLK_OUT_2, .present = true },
-	[tegra_clk_clk_out_3] = { .dt_id = TEGRA124_CLK_CLK_OUT_3, .present = true },
-	[tegra_clk_blink] = { .dt_id = TEGRA124_CLK_BLINK, .present = true },
 	[tegra_clk_xusb_host_src] = { .dt_id = TEGRA124_CLK_XUSB_HOST_SRC, .present = true },
 	[tegra_clk_xusb_falcon_src] = { .dt_id = TEGRA124_CLK_XUSB_FALCON_SRC, .present = true },
 	[tegra_clk_xusb_fs_src] = { .dt_id = TEGRA124_CLK_XUSB_FS_SRC, .present = true },
@@ -932,9 +928,6 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_audio3_mux] = { .dt_id = TEGRA124_CLK_AUDIO3_MUX, .present = true },
 	[tegra_clk_audio4_mux] = { .dt_id = TEGRA124_CLK_AUDIO4_MUX, .present = true },
 	[tegra_clk_spdif_mux] = { .dt_id = TEGRA124_CLK_SPDIF_MUX, .present = true },
-	[tegra_clk_clk_out_1_mux] = { .dt_id = TEGRA124_CLK_CLK_OUT_1_MUX, .present = true },
-	[tegra_clk_clk_out_2_mux] = { .dt_id = TEGRA124_CLK_CLK_OUT_2_MUX, .present = true },
-	[tegra_clk_clk_out_3_mux] = { .dt_id = TEGRA124_CLK_CLK_OUT_3_MUX, .present = true },
 	[tegra_clk_cec] = { .dt_id = TEGRA124_CLK_CEC, .present = true },
 };
 
@@ -990,10 +983,9 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "audio3_2x", .dt_id = TEGRA124_CLK_AUDIO3_2X },
 	{ .con_id = "audio4_2x", .dt_id = TEGRA124_CLK_AUDIO4_2X },
 	{ .con_id = "spdif_2x", .dt_id = TEGRA124_CLK_SPDIF_2X },
-	{ .con_id = "extern1", .dev_id = "clk_out_1", .dt_id = TEGRA124_CLK_EXTERN1 },
-	{ .con_id = "extern2", .dev_id = "clk_out_2", .dt_id = TEGRA124_CLK_EXTERN2 },
-	{ .con_id = "extern3", .dev_id = "clk_out_3", .dt_id = TEGRA124_CLK_EXTERN3 },
-	{ .con_id = "blink", .dt_id = TEGRA124_CLK_BLINK },
+	{ .con_id = "extern1", .dt_id = TEGRA124_CLK_EXTERN1 },
+	{ .con_id = "extern2", .dt_id = TEGRA124_CLK_EXTERN2 },
+	{ .con_id = "extern3", .dt_id = TEGRA124_CLK_EXTERN3 },
 	{ .con_id = "cclk_g", .dt_id = TEGRA124_CLK_CCLK_G },
 	{ .con_id = "cclk_lp", .dt_id = TEGRA124_CLK_CCLK_LP },
 	{ .con_id = "sclk", .dt_id = TEGRA124_CLK_SCLK },
@@ -1303,8 +1295,6 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
 	{ TEGRA124_CLK_PLL_A, TEGRA124_CLK_CLK_MAX, 564480000, 1 },
 	{ TEGRA124_CLK_PLL_A_OUT0, TEGRA124_CLK_CLK_MAX, 11289600, 1 },
 	{ TEGRA124_CLK_EXTERN1, TEGRA124_CLK_PLL_A_OUT0, 0, 1 },
-	{ TEGRA124_CLK_CLK_OUT_1_MUX, TEGRA124_CLK_EXTERN1, 0, 1 },
-	{ TEGRA124_CLK_CLK_OUT_1, TEGRA124_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA124_CLK_I2S0, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA124_CLK_I2S1, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA124_CLK_I2S2, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
@@ -1459,11 +1449,9 @@ static void __init tegra132_clock_apply_init_table(void)
  * tegra124_132_clock_init_pre - clock initialization preamble for T124/T132
  * @np: struct device_node * of the DT node for the SoC CAR IP block
  *
- * Register most of the clocks controlled by the CAR IP block, along
- * with a few clocks controlled by the PMC IP block.  Everything in
- * this function should be common to Tegra124 and Tegra132.  XXX The
- * PMC clock initialization should probably be moved to PMC-specific
- * driver code.  No return value.
+ * Register most of the clocks controlled by the CAR IP block.
+ * Everything in this function should be common to Tegra124 and Tegra132.
+ * No return value.
  */
 static void __init tegra124_132_clock_init_pre(struct device_node *np)
 {
@@ -1506,7 +1494,6 @@ static void __init tegra124_132_clock_init_pre(struct device_node *np)
 	tegra_audio_clk_init(clk_base, pmc_base, tegra124_clks,
 			     tegra124_audio_plls,
 			     ARRAY_SIZE(tegra124_audio_plls), 24576000);
-	tegra_pmc_clk_init(pmc_base, tegra124_clks);
 
 	/* For Tegra124 & Tegra132, PLLD is the only source for DSIA & DSIB */
 	plld_base = readl(clk_base + PLLD_BASE);
@@ -1518,11 +1505,11 @@ static void __init tegra124_132_clock_init_pre(struct device_node *np)
  * tegra124_132_clock_init_post - clock initialization postamble for T124/T132
  * @np: struct device_node * of the DT node for the SoC CAR IP block
  *
- * Register most of the along with a few clocks controlled by the PMC
- * IP block.  Everything in this function should be common to Tegra124
+ * Register most of the clocks controlled by the CAR IP block.
+ * Everything in this function should be common to Tegra124
  * and Tegra132.  This function must be called after
- * tegra124_132_clock_init_pre(), otherwise clk_base and pmc_base will
- * not be set.  No return value.
+ * tegra124_132_clock_init_pre(), otherwise clk_base will not be set.
+ * No return value.
  */
 static void __init tegra124_132_clock_init_post(struct device_node *np)
 {
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 4d8222f5c638..fe536f1d770d 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -458,7 +458,6 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "cdev1", .dt_id = TEGRA20_CLK_CDEV1 },
 	{ .con_id = "cdev2", .dt_id = TEGRA20_CLK_CDEV2 },
 	{ .con_id = "clk_32k", .dt_id = TEGRA20_CLK_CLK_32K },
-	{ .con_id = "blink", .dt_id = TEGRA20_CLK_BLINK },
 	{ .con_id = "clk_m", .dt_id = TEGRA20_CLK_CLK_M },
 	{ .con_id = "pll_ref", .dt_id = TEGRA20_CLK_PLL_REF },
 	{ .dev_id = "tegra20-i2s.0", .dt_id = TEGRA20_CLK_I2S1 },
@@ -537,7 +536,6 @@ static struct tegra_clk tegra20_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_csi] = { .dt_id = TEGRA20_CLK_CSI, .present = true },
 	[tegra_clk_isp] = { .dt_id = TEGRA20_CLK_ISP, .present = true },
 	[tegra_clk_clk_32k] = { .dt_id = TEGRA20_CLK_CLK_32K, .present = true },
-	[tegra_clk_blink] = { .dt_id = TEGRA20_CLK_BLINK, .present = true },
 	[tegra_clk_hclk] = { .dt_id = TEGRA20_CLK_HCLK, .present = true },
 	[tegra_clk_pclk] = { .dt_id = TEGRA20_CLK_PCLK, .present = true },
 	[tegra_clk_pll_p_out1] = { .dt_id = TEGRA20_CLK_PLL_P_OUT1, .present = true },
@@ -1034,7 +1032,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA20_CLK_PLL_A, TEGRA20_CLK_CLK_MAX, 56448000, 1 },
 	{ TEGRA20_CLK_PLL_A_OUT0, TEGRA20_CLK_CLK_MAX, 11289600, 1 },
 	{ TEGRA20_CLK_CDEV1, TEGRA20_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA20_CLK_BLINK, TEGRA20_CLK_CLK_MAX, 32768, 1 },
 	{ TEGRA20_CLK_I2S1, TEGRA20_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA20_CLK_I2S2, TEGRA20_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA20_CLK_SDMMC1, TEGRA20_CLK_PLL_P, 48000000, 0 },
@@ -1148,7 +1145,6 @@ static void __init tegra20_clock_init(struct device_node *np)
 	tegra_super_clk_gen4_init(clk_base, pmc_base, tegra20_clks, NULL);
 	tegra20_periph_clk_init();
 	tegra20_audio_clk_init();
-	tegra_pmc_clk_init(pmc_base, tegra20_clks);
 
 	tegra_init_dup_clks(tegra_clk_duplicates, clks, TEGRA20_CLK_CLK_MAX);
 
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 45d54ead30bc..d2f1e9c0ed25 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2418,10 +2418,6 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_audio3] = { .dt_id = TEGRA210_CLK_AUDIO3, .present = true },
 	[tegra_clk_audio4] = { .dt_id = TEGRA210_CLK_AUDIO4, .present = true },
 	[tegra_clk_spdif] = { .dt_id = TEGRA210_CLK_SPDIF, .present = true },
-	[tegra_clk_clk_out_1] = { .dt_id = TEGRA210_CLK_CLK_OUT_1, .present = true },
-	[tegra_clk_clk_out_2] = { .dt_id = TEGRA210_CLK_CLK_OUT_2, .present = true },
-	[tegra_clk_clk_out_3] = { .dt_id = TEGRA210_CLK_CLK_OUT_3, .present = true },
-	[tegra_clk_blink] = { .dt_id = TEGRA210_CLK_BLINK, .present = true },
 	[tegra_clk_xusb_gate] = { .dt_id = TEGRA210_CLK_XUSB_GATE, .present = true },
 	[tegra_clk_xusb_host_src_8] = { .dt_id = TEGRA210_CLK_XUSB_HOST_SRC, .present = true },
 	[tegra_clk_xusb_falcon_src_8] = { .dt_id = TEGRA210_CLK_XUSB_FALCON_SRC, .present = true },
@@ -2453,9 +2449,6 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_audio3_mux] = { .dt_id = TEGRA210_CLK_AUDIO3_MUX, .present = true },
 	[tegra_clk_audio4_mux] = { .dt_id = TEGRA210_CLK_AUDIO4_MUX, .present = true },
 	[tegra_clk_spdif_mux] = { .dt_id = TEGRA210_CLK_SPDIF_MUX, .present = true },
-	[tegra_clk_clk_out_1_mux] = { .dt_id = TEGRA210_CLK_CLK_OUT_1_MUX, .present = true },
-	[tegra_clk_clk_out_2_mux] = { .dt_id = TEGRA210_CLK_CLK_OUT_2_MUX, .present = true },
-	[tegra_clk_clk_out_3_mux] = { .dt_id = TEGRA210_CLK_CLK_OUT_3_MUX, .present = true },
 	[tegra_clk_maud] = { .dt_id = TEGRA210_CLK_MAUD, .present = true },
 	[tegra_clk_mipibif] = { .dt_id = TEGRA210_CLK_MIPIBIF, .present = true },
 	[tegra_clk_qspi] = { .dt_id = TEGRA210_CLK_QSPI, .present = true },
@@ -2542,10 +2535,9 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "audio4", .dt_id = TEGRA210_CLK_AUDIO4 },
 	{ .con_id = "spdif", .dt_id = TEGRA210_CLK_SPDIF },
 	{ .con_id = "spdif_2x", .dt_id = TEGRA210_CLK_SPDIF_2X },
-	{ .con_id = "extern1", .dev_id = "clk_out_1", .dt_id = TEGRA210_CLK_EXTERN1 },
-	{ .con_id = "extern2", .dev_id = "clk_out_2", .dt_id = TEGRA210_CLK_EXTERN2 },
-	{ .con_id = "extern3", .dev_id = "clk_out_3", .dt_id = TEGRA210_CLK_EXTERN3 },
-	{ .con_id = "blink", .dt_id = TEGRA210_CLK_BLINK },
+	{ .con_id = "extern1", .dt_id = TEGRA210_CLK_EXTERN1 },
+	{ .con_id = "extern2", .dt_id = TEGRA210_CLK_EXTERN2 },
+	{ .con_id = "extern3", .dt_id = TEGRA210_CLK_EXTERN3 },
 	{ .con_id = "cclk_g", .dt_id = TEGRA210_CLK_CCLK_G },
 	{ .con_id = "cclk_lp", .dt_id = TEGRA210_CLK_CCLK_LP },
 	{ .con_id = "sclk", .dt_id = TEGRA210_CLK_SCLK },
@@ -3453,8 +3445,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA210_CLK_PLL_A, TEGRA210_CLK_CLK_MAX, 564480000, 1 },
 	{ TEGRA210_CLK_PLL_A_OUT0, TEGRA210_CLK_CLK_MAX, 11289600, 1 },
 	{ TEGRA210_CLK_EXTERN1, TEGRA210_CLK_PLL_A_OUT0, 0, 1 },
-	{ TEGRA210_CLK_CLK_OUT_1_MUX, TEGRA210_CLK_EXTERN1, 0, 1 },
-	{ TEGRA210_CLK_CLK_OUT_1, TEGRA210_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA210_CLK_I2S0, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA210_CLK_I2S1, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA210_CLK_I2S2, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0 },
@@ -3695,7 +3685,6 @@ static void __init tegra210_clock_init(struct device_node *np)
 	tegra_audio_clk_init(clk_base, pmc_base, tegra210_clks,
 			     tegra210_audio_plls,
 			     ARRAY_SIZE(tegra210_audio_plls), 24576000);
-	tegra_pmc_clk_init(pmc_base, tegra210_clks);
 
 	/* For Tegra210, PLLD is the only source for DSIA & DSIB */
 	value = readl(clk_base + PLLD_BASE);
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index ddc5ab66d09e..5732fdbe20db 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -569,10 +569,9 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "audio3_2x", .dt_id = TEGRA30_CLK_AUDIO3_2X },
 	{ .con_id = "audio4_2x", .dt_id = TEGRA30_CLK_AUDIO4_2X },
 	{ .con_id = "spdif_2x", .dt_id = TEGRA30_CLK_SPDIF_2X },
-	{ .con_id = "extern1", .dev_id = "clk_out_1", .dt_id = TEGRA30_CLK_EXTERN1 },
-	{ .con_id = "extern2", .dev_id = "clk_out_2", .dt_id = TEGRA30_CLK_EXTERN2 },
-	{ .con_id = "extern3", .dev_id = "clk_out_3", .dt_id = TEGRA30_CLK_EXTERN3 },
-	{ .con_id = "blink", .dt_id = TEGRA30_CLK_BLINK },
+	{ .con_id = "extern1", .dt_id = TEGRA30_CLK_EXTERN1 },
+	{ .con_id = "extern2", .dt_id = TEGRA30_CLK_EXTERN2 },
+	{ .con_id = "extern3", .dt_id = TEGRA30_CLK_EXTERN3 },
 	{ .con_id = "cclk_g", .dt_id = TEGRA30_CLK_CCLK_G },
 	{ .con_id = "cclk_lp", .dt_id = TEGRA30_CLK_CCLK_LP },
 	{ .con_id = "sclk", .dt_id = TEGRA30_CLK_SCLK },
@@ -713,13 +712,6 @@ static struct tegra_clk tegra30_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_audio3_2x] = { .dt_id = TEGRA30_CLK_AUDIO3_2X, .present = true },
 	[tegra_clk_audio4_2x] = { .dt_id = TEGRA30_CLK_AUDIO4_2X, .present = true },
 	[tegra_clk_spdif_2x] = { .dt_id = TEGRA30_CLK_SPDIF_2X, .present = true },
-	[tegra_clk_clk_out_1] = { .dt_id = TEGRA30_CLK_CLK_OUT_1, .present = true },
-	[tegra_clk_clk_out_2] = { .dt_id = TEGRA30_CLK_CLK_OUT_2, .present = true },
-	[tegra_clk_clk_out_3] = { .dt_id = TEGRA30_CLK_CLK_OUT_3, .present = true },
-	[tegra_clk_blink] = { .dt_id = TEGRA30_CLK_BLINK, .present = true },
-	[tegra_clk_clk_out_1_mux] = { .dt_id = TEGRA30_CLK_CLK_OUT_1_MUX, .present = true },
-	[tegra_clk_clk_out_2_mux] = { .dt_id = TEGRA30_CLK_CLK_OUT_2_MUX, .present = true },
-	[tegra_clk_clk_out_3_mux] = { .dt_id = TEGRA30_CLK_CLK_OUT_3_MUX, .present = true },
 	[tegra_clk_hclk] = { .dt_id = TEGRA30_CLK_HCLK, .present = true },
 	[tegra_clk_pclk] = { .dt_id = TEGRA30_CLK_PCLK, .present = true },
 	[tegra_clk_i2s0] = { .dt_id = TEGRA30_CLK_I2S0, .present = true },
@@ -1232,9 +1224,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA30_CLK_PLL_A, TEGRA30_CLK_CLK_MAX, 564480000, 1 },
 	{ TEGRA30_CLK_PLL_A_OUT0, TEGRA30_CLK_CLK_MAX, 11289600, 1 },
 	{ TEGRA30_CLK_EXTERN1, TEGRA30_CLK_PLL_A_OUT0, 0, 1 },
-	{ TEGRA30_CLK_CLK_OUT_1_MUX, TEGRA30_CLK_EXTERN1, 0, 0 },
-	{ TEGRA30_CLK_CLK_OUT_1, TEGRA30_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA30_CLK_BLINK, TEGRA30_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA30_CLK_I2S0, TEGRA30_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA30_CLK_I2S1, TEGRA30_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA30_CLK_I2S2, TEGRA30_CLK_PLL_A_OUT0, 11289600, 0 },
@@ -1366,7 +1355,6 @@ static void __init tegra30_clock_init(struct device_node *np)
 	tegra_audio_clk_init(clk_base, pmc_base, tegra30_clks,
 			     tegra30_audio_plls,
 			     ARRAY_SIZE(tegra30_audio_plls), 24000000);
-	tegra_pmc_clk_init(pmc_base, tegra30_clks);
 
 	tegra_init_dup_clks(tegra_clk_duplicates, clks, TEGRA30_CLK_CLK_MAX);
 
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 416a6b09f6a3..2c9a68302e02 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -854,7 +854,6 @@ void tegra_periph_clk_init(void __iomem *clk_base, void __iomem *pmc_base,
 			struct tegra_clk *tegra_clks,
 			struct tegra_clk_pll_params *pll_params);
 
-void tegra_pmc_clk_init(void __iomem *pmc_base, struct tegra_clk *tegra_clks);
 void tegra_fixed_clk_init(struct tegra_clk *tegra_clks);
 int tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
 		       unsigned long *input_freqs, unsigned int num,
-- 
2.7.4


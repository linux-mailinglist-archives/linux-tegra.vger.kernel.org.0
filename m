Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5FC12362A
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Dec 2019 21:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727767AbfLQUEQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 17 Dec 2019 15:04:16 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:1803 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727241AbfLQUEO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Dec 2019 15:04:14 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5df934b30000>; Tue, 17 Dec 2019 12:04:03 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 17 Dec 2019 12:04:12 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 17 Dec 2019 12:04:12 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Dec
 2019 20:04:11 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 17 Dec 2019 20:04:11 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.174.101]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5df934bb0001>; Tue, 17 Dec 2019 12:04:11 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <digetx@gmail.com>,
        <mperttunen@nvidia.com>, <gregkh@linuxfoundation.org>,
        <sboyd@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <spujar@nvidia.com>, <josephl@nvidia.com>,
        <daniel.lezcano@linaro.org>, <mmaddireddy@nvidia.com>,
        <markz@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 02/19] clk: tegra: Change CLK_M_DIV clocks to OSC_DIV clocks
Date:   Tue, 17 Dec 2019 12:03:49 -0800
Message-ID: <1576613046-17159-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
References: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1576613043; bh=dpCKHZkUeHoGdxVWrCoIUS9pzAgDFVOXow9W7hsrOUM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=MJTPXAVUbNwgYvnWwAfqwbXcUoQc92eQH8gbruKBMDoa2Rgyk3rp7R8X29rnnRSrB
         z6R8pmXyI6OF6vWbSSrtj9xtwJJ3U+hCT3cvdZDha+AyFGvjLG2fhaoE8Uj//oOj6J
         KNUX7kagY9xcbPYzCO411FSWF1LGYQSrt1EM8WAA1lRd8ZRZ/mP5ddo1/00APWJtog
         zHlF2vVts9hZZOCy0PU84CFa4cPdjnsYd5RChVvGz/ddXXORGePinzToc4FXwxtcaF
         L6DBeB+O2IMwE3cDrc/syn1v47+oIV3UvVCuFXODzfKzIijJdtAnoUB3UXvwRbb59a
         F3AFTg6/BaJBw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra has no CLK_M_DIV2 and CLK_M_DIV4 clocks from CLK_M and instead
it has OSC_DIV2 and OSC_DIV4 clocks from OSC pads.

This patch removes CLK_M_DIV2 and CLK_M_DIV4 fixed clocks and adds
OSC_DIV2 and OSC_DIV4 fixed clocks with OSC as parent for Tegra30
through Tegra210 clock drivers.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-id.h          |  4 ++--
 drivers/clk/tegra/clk-tegra-fixed.c | 32 ++++++++++++++++----------------
 drivers/clk/tegra/clk-tegra114.c    | 19 ++++---------------
 drivers/clk/tegra/clk-tegra124.c    |  8 ++++----
 drivers/clk/tegra/clk-tegra210.c    |  8 ++++----
 drivers/clk/tegra/clk-tegra30.c     |  8 ++++----
 6 files changed, 34 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index c4faebd32760..1bf21766d3e8 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -44,8 +44,8 @@ enum clk_id {
 	tegra_clk_clk72Mhz,
 	tegra_clk_clk72Mhz_8,
 	tegra_clk_clk_m,
-	tegra_clk_clk_m_div2,
-	tegra_clk_clk_m_div4,
+	tegra_clk_osc_div2,
+	tegra_clk_osc_div4,
 	tegra_clk_clk_out_1,
 	tegra_clk_clk_out_1_mux,
 	tegra_clk_clk_out_2,
diff --git a/drivers/clk/tegra/clk-tegra-fixed.c b/drivers/clk/tegra/clk-tegra-fixed.c
index 7c6c8abfcde6..8304f8cf9dd2 100644
--- a/drivers/clk/tegra/clk-tegra-fixed.c
+++ b/drivers/clk/tegra/clk-tegra-fixed.c
@@ -56,6 +56,22 @@ int __init tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
 					0, 1, clk_m_div);
 	*dt_clk = clk;
 
+	/* osc_div2 */
+	dt_clk = tegra_lookup_dt_id(tegra_clk_osc_div2, clks);
+	if (dt_clk) {
+		clk = clk_register_fixed_factor(NULL, "osc_div2", "osc",
+						0, 1, 2);
+		*dt_clk = clk;
+	}
+
+	/* osc_div4 */
+	dt_clk = tegra_lookup_dt_id(tegra_clk_osc_div4, clks);
+	if (dt_clk) {
+		clk = clk_register_fixed_factor(NULL, "osc_div4", "osc",
+						0, 1, 4);
+		*dt_clk = clk;
+	}
+
 	/* pll_ref */
 	val = (val >> OSC_CTRL_PLL_REF_DIV_SHIFT) & 3;
 	pll_ref_div = 1 << val;
@@ -84,22 +100,6 @@ void __init tegra_fixed_clk_init(struct tegra_clk *tegra_clks)
 		clk = clk_register_fixed_rate(NULL, "clk_32k", NULL, 0, 32768);
 		*dt_clk = clk;
 	}
-
-	/* clk_m_div2 */
-	dt_clk = tegra_lookup_dt_id(tegra_clk_clk_m_div2, tegra_clks);
-	if (dt_clk) {
-		clk = clk_register_fixed_factor(NULL, "clk_m_div2", "clk_m",
-					CLK_SET_RATE_PARENT, 1, 2);
-		*dt_clk = clk;
-	}
-
-	/* clk_m_div4 */
-	dt_clk = tegra_lookup_dt_id(tegra_clk_clk_m_div4, tegra_clks);
-	if (dt_clk) {
-		clk = clk_register_fixed_factor(NULL, "clk_m_div4", "clk_m",
-					CLK_SET_RATE_PARENT, 1, 4);
-		*dt_clk = clk;
-	}
 }
 
 void tegra_clk_osc_resume(void __iomem *clk_base)
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 4efcaaf51b3a..9d2ca387114c 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -735,8 +735,8 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_fuse_burn] = { .dt_id = TEGRA114_CLK_FUSE_BURN, .present = true },
 	[tegra_clk_clk_32k] = { .dt_id = TEGRA114_CLK_CLK_32K, .present = true },
 	[tegra_clk_clk_m] = { .dt_id = TEGRA114_CLK_CLK_M, .present = true },
-	[tegra_clk_clk_m_div2] = { .dt_id = TEGRA114_CLK_CLK_M_DIV2, .present = true },
-	[tegra_clk_clk_m_div4] = { .dt_id = TEGRA114_CLK_CLK_M_DIV4, .present = true },
+	[tegra_clk_osc_div2] = { .dt_id = TEGRA114_CLK_OSC_DIV2, .present = true },
+	[tegra_clk_osc_div4] = { .dt_id = TEGRA114_CLK_OSC_DIV4, .present = true },
 	[tegra_clk_pll_ref] = { .dt_id = TEGRA114_CLK_PLL_REF, .present = true },
 	[tegra_clk_pll_c] = { .dt_id = TEGRA114_CLK_PLL_C, .present = true },
 	[tegra_clk_pll_c_out1] = { .dt_id = TEGRA114_CLK_PLL_C_OUT1, .present = true },
@@ -815,8 +815,8 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "clk_m", .dt_id = TEGRA114_CLK_CLK_M },
 	{ .con_id = "pll_ref", .dt_id = TEGRA114_CLK_PLL_REF },
 	{ .con_id = "clk_32k", .dt_id = TEGRA114_CLK_CLK_32K },
-	{ .con_id = "clk_m_div2", .dt_id = TEGRA114_CLK_CLK_M_DIV2 },
-	{ .con_id = "clk_m_div4", .dt_id = TEGRA114_CLK_CLK_M_DIV4 },
+	{ .con_id = "osc_div2", .dt_id = TEGRA114_CLK_OSC_DIV2 },
+	{ .con_id = "osc_div4", .dt_id = TEGRA114_CLK_OSC_DIV4 },
 	{ .con_id = "pll_c", .dt_id = TEGRA114_CLK_PLL_C },
 	{ .con_id = "pll_c_out1", .dt_id = TEGRA114_CLK_PLL_C_OUT1 },
 	{ .con_id = "pll_c2", .dt_id = TEGRA114_CLK_PLL_C2 },
@@ -900,17 +900,6 @@ static void __init tegra114_fixed_clk_init(void __iomem *clk_base)
 	/* clk_32k */
 	clk = clk_register_fixed_rate(NULL, "clk_32k", NULL, 0, 32768);
 	clks[TEGRA114_CLK_CLK_32K] = clk;
-
-	/* clk_m_div2 */
-	clk = clk_register_fixed_factor(NULL, "clk_m_div2", "clk_m",
-					CLK_SET_RATE_PARENT, 1, 2);
-	clks[TEGRA114_CLK_CLK_M_DIV2] = clk;
-
-	/* clk_m_div4 */
-	clk = clk_register_fixed_factor(NULL, "clk_m_div4", "clk_m",
-					CLK_SET_RATE_PARENT, 1, 4);
-	clks[TEGRA114_CLK_CLK_M_DIV4] = clk;
-
 }
 
 static void __init tegra114_pll_init(void __iomem *clk_base,
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index b3110d5b5a6c..15f42718f4cb 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -860,8 +860,8 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_fuse_burn] = { .dt_id = TEGRA124_CLK_FUSE_BURN, .present = true },
 	[tegra_clk_clk_32k] = { .dt_id = TEGRA124_CLK_CLK_32K, .present = true },
 	[tegra_clk_clk_m] = { .dt_id = TEGRA124_CLK_CLK_M, .present = true },
-	[tegra_clk_clk_m_div2] = { .dt_id = TEGRA124_CLK_CLK_M_DIV2, .present = true },
-	[tegra_clk_clk_m_div4] = { .dt_id = TEGRA124_CLK_CLK_M_DIV4, .present = true },
+	[tegra_clk_osc_div2] = { .dt_id = TEGRA124_CLK_OSC_DIV2, .present = true },
+	[tegra_clk_osc_div4] = { .dt_id = TEGRA124_CLK_OSC_DIV4, .present = true },
 	[tegra_clk_pll_ref] = { .dt_id = TEGRA124_CLK_PLL_REF, .present = true },
 	[tegra_clk_pll_c] = { .dt_id = TEGRA124_CLK_PLL_C, .present = true },
 	[tegra_clk_pll_c_out1] = { .dt_id = TEGRA124_CLK_PLL_C_OUT1, .present = true },
@@ -941,8 +941,8 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "clk_m", .dt_id = TEGRA124_CLK_CLK_M },
 	{ .con_id = "pll_ref", .dt_id = TEGRA124_CLK_PLL_REF },
 	{ .con_id = "clk_32k", .dt_id = TEGRA124_CLK_CLK_32K },
-	{ .con_id = "clk_m_div2", .dt_id = TEGRA124_CLK_CLK_M_DIV2 },
-	{ .con_id = "clk_m_div4", .dt_id = TEGRA124_CLK_CLK_M_DIV4 },
+	{ .con_id = "osc_div2", .dt_id = TEGRA124_CLK_OSC_DIV2 },
+	{ .con_id = "osc_div4", .dt_id = TEGRA124_CLK_OSC_DIV4 },
 	{ .con_id = "pll_c", .dt_id = TEGRA124_CLK_PLL_C },
 	{ .con_id = "pll_c_out1", .dt_id = TEGRA124_CLK_PLL_C_OUT1 },
 	{ .con_id = "pll_c2", .dt_id = TEGRA124_CLK_PLL_C2 },
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 762cd186f714..5687fcda620e 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2371,8 +2371,8 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_fuse_burn] = { .dt_id = TEGRA210_CLK_FUSE_BURN, .present = true },
 	[tegra_clk_clk_32k] = { .dt_id = TEGRA210_CLK_CLK_32K, .present = true },
 	[tegra_clk_clk_m] = { .dt_id = TEGRA210_CLK_CLK_M, .present = true },
-	[tegra_clk_clk_m_div2] = { .dt_id = TEGRA210_CLK_CLK_M_DIV2, .present = true },
-	[tegra_clk_clk_m_div4] = { .dt_id = TEGRA210_CLK_CLK_M_DIV4, .present = true },
+	[tegra_clk_osc_div2] = { .dt_id = TEGRA210_CLK_OSC_DIV2, .present = true },
+	[tegra_clk_osc_div4] = { .dt_id = TEGRA210_CLK_OSC_DIV4, .present = true },
 	[tegra_clk_pll_ref] = { .dt_id = TEGRA210_CLK_PLL_REF, .present = true },
 	[tegra_clk_pll_c] = { .dt_id = TEGRA210_CLK_PLL_C, .present = true },
 	[tegra_clk_pll_c_out1] = { .dt_id = TEGRA210_CLK_PLL_C_OUT1, .present = true },
@@ -2497,8 +2497,8 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "clk_m", .dt_id = TEGRA210_CLK_CLK_M },
 	{ .con_id = "pll_ref", .dt_id = TEGRA210_CLK_PLL_REF },
 	{ .con_id = "clk_32k", .dt_id = TEGRA210_CLK_CLK_32K },
-	{ .con_id = "clk_m_div2", .dt_id = TEGRA210_CLK_CLK_M_DIV2 },
-	{ .con_id = "clk_m_div4", .dt_id = TEGRA210_CLK_CLK_M_DIV4 },
+	{ .con_id = "osc_div2", .dt_id = TEGRA210_CLK_OSC_DIV2 },
+	{ .con_id = "osc_div4", .dt_id = TEGRA210_CLK_OSC_DIV4 },
 	{ .con_id = "pll_c", .dt_id = TEGRA210_CLK_PLL_C },
 	{ .con_id = "pll_c_out1", .dt_id = TEGRA210_CLK_PLL_C_OUT1 },
 	{ .con_id = "pll_c2", .dt_id = TEGRA210_CLK_PLL_C2 },
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index c8bc18e4d7e5..1322188edb72 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -581,8 +581,8 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "twd", .dt_id = TEGRA30_CLK_TWD },
 	{ .con_id = "emc", .dt_id = TEGRA30_CLK_EMC },
 	{ .con_id = "clk_32k", .dt_id = TEGRA30_CLK_CLK_32K },
-	{ .con_id = "clk_m_div2", .dt_id = TEGRA30_CLK_CLK_M_DIV2 },
-	{ .con_id = "clk_m_div4", .dt_id = TEGRA30_CLK_CLK_M_DIV4 },
+	{ .con_id = "osc_div2", .dt_id = TEGRA30_CLK_OSC_DIV2 },
+	{ .con_id = "osc_div4", .dt_id = TEGRA30_CLK_OSC_DIV4 },
 	{ .con_id = "cml0", .dt_id = TEGRA30_CLK_CML0 },
 	{ .con_id = "cml1", .dt_id = TEGRA30_CLK_CML1 },
 	{ .con_id = "clk_m", .dt_id = TEGRA30_CLK_CLK_M },
@@ -683,8 +683,8 @@ static struct tegra_devclk devclks[] __initdata = {
 static struct tegra_clk tegra30_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_clk_32k] = { .dt_id = TEGRA30_CLK_CLK_32K, .present = true },
 	[tegra_clk_clk_m] = { .dt_id = TEGRA30_CLK_CLK_M, .present = true },
-	[tegra_clk_clk_m_div2] = { .dt_id = TEGRA30_CLK_CLK_M_DIV2, .present = true },
-	[tegra_clk_clk_m_div4] = { .dt_id = TEGRA30_CLK_CLK_M_DIV4, .present = true },
+	[tegra_clk_osc_div2] = { .dt_id = TEGRA30_CLK_OSC_DIV2, .present = true },
+	[tegra_clk_osc_div4] = { .dt_id = TEGRA30_CLK_OSC_DIV4, .present = true },
 	[tegra_clk_pll_ref] = { .dt_id = TEGRA30_CLK_PLL_REF, .present = true },
 	[tegra_clk_spdif_in_sync] = { .dt_id = TEGRA30_CLK_SPDIF_IN_SYNC, .present = true },
 	[tegra_clk_i2s0_sync] = { .dt_id = TEGRA30_CLK_I2S0_SYNC, .present = true },
-- 
2.7.4


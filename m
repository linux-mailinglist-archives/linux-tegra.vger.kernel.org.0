Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED7B749B57
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Jun 2019 09:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728993AbfFRHqz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Jun 2019 03:46:55 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9704 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728840AbfFRHqx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Jun 2019 03:46:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0896eb0000>; Tue, 18 Jun 2019 00:46:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 00:46:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Jun 2019 00:46:51 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 07:46:51 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 07:46:51 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 18 Jun 2019 07:46:51 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.217]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d0896e80002>; Tue, 18 Jun 2019 00:46:51 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <marc.zyngier@arm.com>, <linus.walleij@linaro.org>,
        <stefan@agner.ch>, <mark.rutland@arm.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <jckuo@nvidia.com>,
        <josephl@nvidia.com>, <talho@nvidia.com>, <skomatineni@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <digetx@gmail.com>, <devicetree@vger.kernel.org>
Subject: [PATCH V3 06/17] clk: tegra: pll: save and restore pll context
Date:   Tue, 18 Jun 2019 00:46:20 -0700
Message-ID: <1560843991-24123-7-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560844011; bh=rv36G1StpVw38zPplJcIr82dyfD5o7fnQYcI5YUInQk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=MItmjHHNwWANMr7tsbOe/PKtUMY7Mq3EAtnd7lKg+AgoM3SDmtg8NUU32kfo4UICU
         XBdJnnQICRAIYqFWu1il2PpBjF3wF1inReHmwIJCudPMuKDUO2c/sy63M1y1W2FnEE
         /npS+gQ+VqTBu1/ooy5UjFQ12ZacXt8o5Q/LJNfm/ThUAFTpKIseWLwmIPN+zUySNH
         6mDK55arv7A0XE8tsQuq2hCVDeGVLyuS+0j0KiapAgXjehn6fUBxiZKpvP99nOtd3K
         0JFwwTzyqK2xd9aH4sdi7tUBNEemH0+UBgqGMnDRV8qb8E+fI2MSOxPybBntmQv2e0
         eQ1ZW4/RRc0yw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch implements save and restore of pll context.

During system suspend, core power goes off and looses the settings
of the Tegra CAR controller registers.

So during suspend entry pll rate is stored and on resume it is
restored back along with its state.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 115 ++++++++++++++++++++++++++++++++------------
 drivers/clk/tegra/clk.h     |   6 ++-
 2 files changed, 88 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 1583f5fc992f..4b0ed8fc6268 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1008,6 +1008,54 @@ static unsigned long clk_plle_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
+void tegra_clk_sync_state_pll(struct clk_hw *hw)
+{
+	if (!__clk_get_enable_count(hw->clk))
+		clk_pll_disable(hw);
+	else
+		clk_pll_enable(hw);
+}
+
+static int tegra_clk_pll_save_context(struct clk_hw *hw)
+{
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
+
+	pll->rate = clk_hw_get_rate(hw);
+
+	if (!strcmp(__clk_get_name(hw->clk), "pll_mb"))
+		pll->pllbase_ctx = pll_readl_base(pll);
+	else if (!strcmp(__clk_get_name(hw->clk), "pll_re_vco"))
+		pll->pllbase_ctx = pll_readl_base(pll) & (0xf << 16);
+
+	return 0;
+}
+
+static void tegra_clk_pll_restore_context(struct clk_hw *hw)
+{
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
+	u32 val;
+
+	if (clk_pll_is_enabled(hw))
+		return;
+
+	if (!strcmp(__clk_get_name(hw->clk), "pll_mb")) {
+		pll_writel_base(pll->pllbase_ctx, pll);
+	} else if (!strcmp(__clk_get_name(hw->clk), "pll_re_vco")) {
+		val = pll_readl_base(pll);
+		val &= ~(0xf << 16);
+		pll_writel_base(pll->pllbase_ctx | val, pll);
+	}
+
+	if (pll->params->set_defaults)
+		pll->params->set_defaults(pll);
+
+	clk_set_rate(hw->clk, pll->rate);
+
+	/* do not sync pllx state here. pllx is sync'd after dfll resume */
+	if (strcmp(__clk_get_name(hw->clk), "pll_x"))
+		tegra_clk_sync_state_pll(hw);
+}
+
 const struct clk_ops tegra_clk_pll_ops = {
 	.is_enabled = clk_pll_is_enabled,
 	.enable = clk_pll_enable,
@@ -1015,6 +1063,8 @@ const struct clk_ops tegra_clk_pll_ops = {
 	.recalc_rate = clk_pll_recalc_rate,
 	.round_rate = clk_pll_round_rate,
 	.set_rate = clk_pll_set_rate,
+	.save_context = tegra_clk_pll_save_context,
+	.restore_context = tegra_clk_pll_restore_context,
 };
 
 const struct clk_ops tegra_clk_plle_ops = {
@@ -1802,6 +1852,27 @@ static int clk_pllu_tegra114_enable(struct clk_hw *hw)
 
 	return ret;
 }
+
+static void _clk_plle_tegra_init_parent(struct tegra_clk_pll *pll)
+{
+	u32 val, val_aux;
+
+	/* ensure parent is set to pll_ref */
+	val = pll_readl_base(pll);
+	val_aux = pll_readl(pll->params->aux_reg, pll);
+
+	if (val & PLL_BASE_ENABLE) {
+		if ((val_aux & PLLE_AUX_PLLRE_SEL) ||
+		    (val_aux & PLLE_AUX_PLLP_SEL))
+			WARN(1, "pll_e enabled with unsupported parent %s\n",
+			     (val_aux & PLLE_AUX_PLLP_SEL) ? "pllp_out0" :
+			     "pll_re_vco");
+	} else {
+		val_aux &= ~(PLLE_AUX_PLLRE_SEL | PLLE_AUX_PLLP_SEL);
+		pll_writel(val_aux, pll->params->aux_reg, pll);
+		fence_udelay(1, pll->clk_base);
+	}
+}
 #endif
 
 static struct tegra_clk_pll *_tegra_init_pll(void __iomem *clk_base,
@@ -2214,27 +2285,12 @@ struct clk *tegra_clk_register_plle_tegra114(const char *name,
 {
 	struct tegra_clk_pll *pll;
 	struct clk *clk;
-	u32 val, val_aux;
 
 	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
-	/* ensure parent is set to pll_re_vco */
-
-	val = pll_readl_base(pll);
-	val_aux = pll_readl(pll_params->aux_reg, pll);
-
-	if (val & PLL_BASE_ENABLE) {
-		if ((val_aux & PLLE_AUX_PLLRE_SEL) ||
-			(val_aux & PLLE_AUX_PLLP_SEL))
-			WARN(1, "pll_e enabled with unsupported parent %s\n",
-			  (val_aux & PLLE_AUX_PLLP_SEL) ? "pllp_out0" :
-					"pll_re_vco");
-	} else {
-		val_aux &= ~(PLLE_AUX_PLLRE_SEL | PLLE_AUX_PLLP_SEL);
-		pll_writel(val_aux, pll_params->aux_reg, pll);
-	}
+	_clk_plle_tegra_init_parent(pll);
 
 	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
 				      &tegra_clk_plle_tegra114_ops);
@@ -2276,6 +2332,8 @@ static const struct clk_ops tegra_clk_pllss_ops = {
 	.recalc_rate = clk_pll_recalc_rate,
 	.round_rate = clk_pll_ramp_round_rate,
 	.set_rate = clk_pllxc_set_rate,
+	.save_context = tegra_clk_pll_save_context,
+	.restore_context = tegra_clk_pll_restore_context,
 };
 
 struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
@@ -2520,11 +2578,19 @@ static void clk_plle_tegra210_disable(struct clk_hw *hw)
 		spin_unlock_irqrestore(pll->lock, flags);
 }
 
+static void tegra_clk_plle_t210_restore_context(struct clk_hw *hw)
+{
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
+
+	_clk_plle_tegra_init_parent(pll);
+}
+
 static const struct clk_ops tegra_clk_plle_tegra210_ops = {
 	.is_enabled =  clk_plle_tegra210_is_enabled,
 	.enable = clk_plle_tegra210_enable,
 	.disable = clk_plle_tegra210_disable,
 	.recalc_rate = clk_pll_recalc_rate,
+	.restore_context = tegra_clk_plle_t210_restore_context,
 };
 
 struct clk *tegra_clk_register_plle_tegra210(const char *name,
@@ -2535,27 +2601,12 @@ struct clk *tegra_clk_register_plle_tegra210(const char *name,
 {
 	struct tegra_clk_pll *pll;
 	struct clk *clk;
-	u32 val, val_aux;
 
 	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
-	/* ensure parent is set to pll_re_vco */
-
-	val = pll_readl_base(pll);
-	val_aux = pll_readl(pll_params->aux_reg, pll);
-
-	if (val & PLLE_BASE_ENABLE) {
-		if ((val_aux & PLLE_AUX_PLLRE_SEL) ||
-			(val_aux & PLLE_AUX_PLLP_SEL))
-			WARN(1, "pll_e enabled with unsupported parent %s\n",
-			  (val_aux & PLLE_AUX_PLLP_SEL) ? "pllp_out0" :
-					"pll_re_vco");
-	} else {
-		val_aux &= ~(PLLE_AUX_PLLRE_SEL | PLLE_AUX_PLLP_SEL);
-		pll_writel(val_aux, pll_params->aux_reg, pll);
-	}
+	_clk_plle_tegra_init_parent(pll);
 
 	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
 				      &tegra_clk_plle_tegra210_ops);
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index b47f373c35ad..581deb4f3ac0 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -310,6 +310,8 @@ struct tegra_clk_pll_params {
  * @pmc:	address of PMC, required to read override bits
  * @lock:	register lock
  * @params:	PLL parameters
+ * @rate:	rate during system suspend and resume
+ * @pllbase_ctx: pll base register value during suspend and resume
  */
 struct tegra_clk_pll {
 	struct clk_hw	hw;
@@ -317,6 +319,8 @@ struct tegra_clk_pll {
 	void __iomem	*pmc;
 	spinlock_t	*lock;
 	struct tegra_clk_pll_params	*params;
+	unsigned long	rate;
+	unsigned int	pllbase_ctx;
 };
 
 #define to_clk_pll(_hw) container_of(_hw, struct tegra_clk_pll, hw)
@@ -834,7 +838,7 @@ u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsigned long input_rate);
 int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
 int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
 		 u8 frac_width, u8 flags);
-
+void tegra_clk_sync_state_pll(struct clk_hw *hw);
 
 /* Combined read fence with delay */
 #define fence_udelay(delay, reg)	\
-- 
2.7.4


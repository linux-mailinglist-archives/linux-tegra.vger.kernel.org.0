Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F35411019C6
	for <lists+linux-tegra@lfdr.de>; Tue, 19 Nov 2019 07:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727841AbfKSGvq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 19 Nov 2019 01:51:46 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:8300 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727762AbfKSGvO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Nov 2019 01:51:14 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dd390da0000>; Mon, 18 Nov 2019 22:51:06 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 18 Nov 2019 22:51:05 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 18 Nov 2019 22:51:05 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 06:51:05 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Nov 2019 06:51:05 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.175.254]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5dd390d70000>; Mon, 18 Nov 2019 22:51:04 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <digetx@gmail.com>,
        <mperttunen@nvidia.com>, <gregkh@linuxfoundation.org>,
        <sboyd@kernel.org>, <tglx@linutronix.de>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>
CC:     <allison@lohutok.net>, <pdeschrijver@nvidia.com>,
        <pgaikwad@nvidia.com>, <mturquette@baylibre.com>,
        <horms+renesas@verge.net.au>, <Jisheng.Zhang@synaptics.com>,
        <krzk@kernel.org>, <arnd@arndb.de>, <spujar@nvidia.com>,
        <josephl@nvidia.com>, <vidyas@nvidia.com>,
        <daniel.lezcano@linaro.org>, <mmaddireddy@nvidia.com>,
        <markz@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 09/17] clk: tegra: Remove PMC base references from clock registration
Date:   Mon, 18 Nov 2019 22:50:26 -0800
Message-ID: <1574146234-3871-10-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
References: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1574146266; bh=lI9AKvWEf5kpwBnd+uteHfLngsPm/tISe8XuxR2DNow=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=JMfOIweL0k0SO4AXn9C2E7/zvyFgWnJQwyqRUk1xbk+wUyBpi5J5TWe95iXRD8ooa
         6Pq3AIJMT5t8UXQ7U7WKGwjlrgEeIheHS0hXa40vZZGa5SOoL1uirZxiW9czAtF04G
         /XN8v4JspymWM6NnUUxuYWlMmuiZkYjVmyEg5poGdfSHIhNGnb1T8+3FCuFsD1bN3A
         zq5+768YXJDJBV0Y7KLdNAqAzPECFW40ZEdcxCrcaX7SmwcmXxT/OOs877DoPu1wTV
         W1gS+LYOGtY0aPgRzOUvMnSIf8LDHLpnkxkh6IkSLDg1pThq09IVU2qGQWb6vpAJZO
         c7hBdK9qgaDwQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra clock driver uses helper functions from Tegra PMC driver.

This patch removes PMC base references from all clocks registration.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c              | 60 ++++++++++++++------------------
 drivers/clk/tegra/clk-tegra-audio.c      |  4 +--
 drivers/clk/tegra/clk-tegra-periph.c     |  8 ++---
 drivers/clk/tegra/clk-tegra-super-gen4.c | 11 +++---
 drivers/clk/tegra/clk-tegra114.c         | 33 ++++++++----------
 drivers/clk/tegra/clk-tegra124.c         | 34 ++++++++----------
 drivers/clk/tegra/clk-tegra20.c          |  6 ++--
 drivers/clk/tegra/clk-tegra210.c         | 34 ++++++++----------
 drivers/clk/tegra/clk-tegra30.c          | 19 +++++-----
 drivers/clk/tegra/clk.h                  | 37 ++++++++------------
 10 files changed, 108 insertions(+), 138 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 4ae9e282e7be..6a9b4be8ef2a 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1801,7 +1801,7 @@ static void _clk_plle_tegra_init_parent(struct tegra_clk_pll *pll)
 #endif
 
 static struct tegra_clk_pll *_tegra_init_pll(void __iomem *clk_base,
-		void __iomem *pmc, struct tegra_clk_pll_params *pll_params,
+		struct tegra_clk_pll_params *pll_params,
 		spinlock_t *lock)
 {
 	struct tegra_clk_pll *pll;
@@ -1811,7 +1811,6 @@ static struct tegra_clk_pll *_tegra_init_pll(void __iomem *clk_base,
 		return ERR_PTR(-ENOMEM);
 
 	pll->clk_base = clk_base;
-	pll->pmc = pmc;
 
 	pll->params = pll_params;
 	pll->lock = lock;
@@ -1852,8 +1851,8 @@ static struct clk *_tegra_clk_register_pll(struct tegra_clk_pll *pll,
 }
 
 struct clk *tegra_clk_register_pll(const char *name, const char *parent_name,
-		void __iomem *clk_base, void __iomem *pmc,
-		unsigned long flags, struct tegra_clk_pll_params *pll_params,
+		void __iomem *clk_base, unsigned long flags,
+		struct tegra_clk_pll_params *pll_params,
 		spinlock_t *lock)
 {
 	struct tegra_clk_pll *pll;
@@ -1861,7 +1860,7 @@ struct clk *tegra_clk_register_pll(const char *name, const char *parent_name,
 
 	pll_params->flags |= TEGRA_PLL_BYPASS;
 
-	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
+	pll = _tegra_init_pll(clk_base, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
@@ -1883,8 +1882,8 @@ static struct div_nmp pll_e_nmp = {
 };
 
 struct clk *tegra_clk_register_plle(const char *name, const char *parent_name,
-		void __iomem *clk_base, void __iomem *pmc,
-		unsigned long flags, struct tegra_clk_pll_params *pll_params,
+		void __iomem *clk_base, unsigned long flags,
+		struct tegra_clk_pll_params *pll_params,
 		spinlock_t *lock)
 {
 	struct tegra_clk_pll *pll;
@@ -1895,7 +1894,7 @@ struct clk *tegra_clk_register_plle(const char *name, const char *parent_name,
 	if (!pll_params->div_nmp)
 		pll_params->div_nmp = &pll_e_nmp;
 
-	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
+	pll = _tegra_init_pll(clk_base, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
@@ -1916,7 +1915,7 @@ struct clk *tegra_clk_register_pllu(const char *name, const char *parent_name,
 
 	pll_params->flags |= TEGRA_PLLU;
 
-	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
+	pll = _tegra_init_pll(clk_base, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
@@ -1974,8 +1973,7 @@ static const struct clk_ops tegra_clk_pllu_tegra114_ops = {
 };
 
 struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
-			  void __iomem *clk_base, void __iomem *pmc,
-			  unsigned long flags,
+			  void __iomem *clk_base, unsigned long flags,
 			  struct tegra_clk_pll_params *pll_params,
 			  spinlock_t *lock)
 {
@@ -2025,7 +2023,7 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
 		}
 	}
 
-	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
+	pll = _tegra_init_pll(clk_base, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
@@ -2038,8 +2036,7 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
 }
 
 struct clk *tegra_clk_register_pllre(const char *name, const char *parent_name,
-			  void __iomem *clk_base, void __iomem *pmc,
-			  unsigned long flags,
+			  void __iomem *clk_base, unsigned long flags,
 			  struct tegra_clk_pll_params *pll_params,
 			  spinlock_t *lock, unsigned long parent_rate)
 {
@@ -2053,7 +2050,7 @@ struct clk *tegra_clk_register_pllre(const char *name, const char *parent_name,
 		pll_params->vco_min = pll_params->adjust_vco(pll_params,
 							     parent_rate);
 
-	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
+	pll = _tegra_init_pll(clk_base, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
@@ -2087,8 +2084,7 @@ struct clk *tegra_clk_register_pllre(const char *name, const char *parent_name,
 }
 
 struct clk *tegra_clk_register_pllm(const char *name, const char *parent_name,
-			  void __iomem *clk_base, void __iomem *pmc,
-			  unsigned long flags,
+			  void __iomem *clk_base, unsigned long flags,
 			  struct tegra_clk_pll_params *pll_params,
 			  spinlock_t *lock)
 {
@@ -2116,7 +2112,7 @@ struct clk *tegra_clk_register_pllm(const char *name, const char *parent_name,
 
 	pll_params->flags |= TEGRA_PLL_BYPASS;
 	pll_params->flags |= TEGRA_PLLM;
-	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
+	pll = _tegra_init_pll(clk_base, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
@@ -2129,8 +2125,7 @@ struct clk *tegra_clk_register_pllm(const char *name, const char *parent_name,
 }
 
 struct clk *tegra_clk_register_pllc(const char *name, const char *parent_name,
-			  void __iomem *clk_base, void __iomem *pmc,
-			  unsigned long flags,
+			  void __iomem *clk_base, unsigned long flags,
 			  struct tegra_clk_pll_params *pll_params,
 			  spinlock_t *lock)
 {
@@ -2155,7 +2150,7 @@ struct clk *tegra_clk_register_pllc(const char *name, const char *parent_name,
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
 	pll_params->flags |= TEGRA_PLL_BYPASS;
-	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
+	pll = _tegra_init_pll(clk_base, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
@@ -2211,7 +2206,7 @@ struct clk *tegra_clk_register_plle_tegra114(const char *name,
 	struct tegra_clk_pll *pll;
 	struct clk *clk;
 
-	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
+	pll = _tegra_init_pll(clk_base, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
@@ -2236,7 +2231,7 @@ tegra_clk_register_pllu_tegra114(const char *name, const char *parent_name,
 
 	pll_params->flags |= TEGRA_PLLU;
 
-	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
+	pll = _tegra_init_pll(clk_base, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
@@ -2282,7 +2277,7 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
 		return ERR_PTR(-EINVAL);
 	}
 
-	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
+	pll = _tegra_init_pll(clk_base, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
@@ -2344,7 +2339,7 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 struct clk *tegra_clk_register_pllre_tegra210(const char *name,
 			  const char *parent_name, void __iomem *clk_base,
-			  void __iomem *pmc, unsigned long flags,
+			  unsigned long flags,
 			  struct tegra_clk_pll_params *pll_params,
 			  spinlock_t *lock, unsigned long parent_rate)
 {
@@ -2357,7 +2352,7 @@ struct clk *tegra_clk_register_pllre_tegra210(const char *name,
 		pll_params->vco_min = pll_params->adjust_vco(pll_params,
 							     parent_rate);
 
-	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
+	pll = _tegra_init_pll(clk_base, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
@@ -2526,7 +2521,7 @@ struct clk *tegra_clk_register_plle_tegra210(const char *name,
 	struct tegra_clk_pll *pll;
 	struct clk *clk;
 
-	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
+	pll = _tegra_init_pll(clk_base, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
@@ -2542,7 +2537,7 @@ struct clk *tegra_clk_register_plle_tegra210(const char *name,
 
 struct clk *tegra_clk_register_pllc_tegra210(const char *name,
 			const char *parent_name, void __iomem *clk_base,
-			void __iomem *pmc, unsigned long flags,
+			unsigned long flags,
 			struct tegra_clk_pll_params *pll_params,
 			spinlock_t *lock)
 {
@@ -2570,7 +2565,7 @@ struct clk *tegra_clk_register_pllc_tegra210(const char *name,
 							     parent_rate);
 
 	pll_params->flags |= TEGRA_PLL_BYPASS;
-	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
+	pll = _tegra_init_pll(clk_base, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
@@ -2618,7 +2613,7 @@ struct clk *tegra_clk_register_pllss_tegra210(const char *name,
 							     parent_rate);
 
 	pll_params->flags |= TEGRA_PLL_BYPASS;
-	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
+	pll = _tegra_init_pll(clk_base, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
@@ -2632,8 +2627,7 @@ struct clk *tegra_clk_register_pllss_tegra210(const char *name,
 }
 
 struct clk *tegra_clk_register_pllmb(const char *name, const char *parent_name,
-			  void __iomem *clk_base, void __iomem *pmc,
-			  unsigned long flags,
+			  void __iomem *clk_base, unsigned long flags,
 			  struct tegra_clk_pll_params *pll_params,
 			  spinlock_t *lock)
 {
@@ -2661,7 +2655,7 @@ struct clk *tegra_clk_register_pllmb(const char *name, const char *parent_name,
 
 	pll_params->flags |= TEGRA_PLL_BYPASS;
 	pll_params->flags |= TEGRA_PLLMB;
-	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
+	pll = _tegra_init_pll(clk_base, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
diff --git a/drivers/clk/tegra/clk-tegra-audio.c b/drivers/clk/tegra/clk-tegra-audio.c
index c99e34d69711..1c813a7b89e7 100644
--- a/drivers/clk/tegra/clk-tegra-audio.c
+++ b/drivers/clk/tegra/clk-tegra-audio.c
@@ -161,7 +161,7 @@ static void __init tegra_audio_sync_clk_init(void __iomem *clk_base,
 }
 
 void __init tegra_audio_clk_init(void __iomem *clk_base,
-			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
+			struct tegra_clk *tegra_clks,
 			struct tegra_audio_clk_info *audio_info,
 			unsigned int num_plls, unsigned long sync_max_rate)
 {
@@ -181,7 +181,7 @@ void __init tegra_audio_clk_init(void __iomem *clk_base,
 		dt_clk = tegra_lookup_dt_id(info->clk_id, tegra_clks);
 		if (dt_clk) {
 			clk = tegra_clk_register_pll(info->name, info->parent,
-					clk_base, pmc_base, 0, info->pll_params,
+					clk_base, 0, info->pll_params,
 					NULL);
 			*dt_clk = clk;
 		}
diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 0d07c0ba49b6..e2979b972526 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -936,7 +936,7 @@ static void __init div_clk_init(void __iomem *clk_base,
 	}
 }
 
-static void __init init_pllp(void __iomem *clk_base, void __iomem *pmc_base,
+static void __init init_pllp(void __iomem *clk_base,
 				struct tegra_clk *tegra_clks,
 				struct tegra_clk_pll_params *pll_params)
 {
@@ -948,7 +948,7 @@ static void __init init_pllp(void __iomem *clk_base, void __iomem *pmc_base,
 	if (dt_clk) {
 		/* PLLP */
 		clk = tegra_clk_register_pll("pll_p", "pll_ref", clk_base,
-					pmc_base, 0, pll_params, NULL);
+					     0, pll_params, NULL);
 		clk_register_clkdev(clk, "pll_p", NULL);
 		*dt_clk = clk;
 	}
@@ -1020,10 +1020,10 @@ static void __init init_pllp(void __iomem *clk_base, void __iomem *pmc_base,
 }
 
 void __init tegra_periph_clk_init(void __iomem *clk_base,
-			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
+			struct tegra_clk *tegra_clks,
 			struct tegra_clk_pll_params *pll_params)
 {
-	init_pllp(clk_base, pmc_base, tegra_clks, pll_params);
+	init_pllp(clk_base, tegra_clks, pll_params);
 	periph_clk_init(clk_base, tegra_clks);
 	gate_clk_init(clk_base, tegra_clks);
 	div_clk_init(clk_base, tegra_clks);
diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
index 5760c978bef7..26c9bc606228 100644
--- a/drivers/clk/tegra/clk-tegra-super-gen4.c
+++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
@@ -163,7 +163,6 @@ static void __init tegra_sclk_init(void __iomem *clk_base,
 }
 
 static void __init tegra_super_clk_init(void __iomem *clk_base,
-				void __iomem *pmc_base,
 				struct tegra_clk *tegra_clks,
 				struct tegra_clk_pll_params *params,
 				const struct tegra_super_gen_info *gen_info)
@@ -231,11 +230,11 @@ static void __init tegra_super_clk_init(void __iomem *clk_base,
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	if (gen_info->gen == gen5)
 		clk = tegra_clk_register_pllc_tegra210("pll_x", "pll_ref",
-			clk_base, pmc_base, CLK_IGNORE_UNUSED, params, NULL);
+			clk_base, CLK_IGNORE_UNUSED, params, NULL);
 	else
 #endif
 		clk = tegra_clk_register_pllxc("pll_x", "pll_ref", clk_base,
-				pmc_base, CLK_IGNORE_UNUSED, params, NULL);
+				CLK_IGNORE_UNUSED, params, NULL);
 
 	*dt_clk = clk;
 
@@ -251,19 +250,17 @@ static void __init tegra_super_clk_init(void __iomem *clk_base,
 }
 
 void __init tegra_super_clk_gen4_init(void __iomem *clk_base,
-				void __iomem *pmc_base,
 				struct tegra_clk *tegra_clks,
 				struct tegra_clk_pll_params *params)
 {
-	tegra_super_clk_init(clk_base, pmc_base, tegra_clks, params,
+	tegra_super_clk_init(clk_base, tegra_clks, params,
 			     &tegra_super_gen_info_gen4);
 }
 
 void __init tegra_super_clk_gen5_init(void __iomem *clk_base,
-				void __iomem *pmc_base,
 				struct tegra_clk *tegra_clks,
 				struct tegra_clk_pll_params *params)
 {
-	tegra_super_clk_init(clk_base, pmc_base, tegra_clks, params,
+	tegra_super_clk_init(clk_base, tegra_clks, params,
 			     &tegra_super_gen_info_gen5);
 }
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 77904334b6f0..e7c4af928da3 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -904,14 +904,13 @@ static void __init tegra114_fixed_clk_init(void __iomem *clk_base)
 
 }
 
-static void __init tegra114_pll_init(void __iomem *clk_base,
-				     void __iomem *pmc)
+static void __init tegra114_pll_init(void __iomem *clk_base)
 {
 	struct clk *clk;
 
 	/* PLLC */
 	clk = tegra_clk_register_pllxc("pll_c", "pll_ref", clk_base,
-			pmc, 0, &pll_c_params, NULL);
+				       0, &pll_c_params, NULL);
 	clks[TEGRA114_CLK_PLL_C] = clk;
 
 	/* PLLC_OUT1 */
@@ -924,17 +923,17 @@ static void __init tegra114_pll_init(void __iomem *clk_base,
 	clks[TEGRA114_CLK_PLL_C_OUT1] = clk;
 
 	/* PLLC2 */
-	clk = tegra_clk_register_pllc("pll_c2", "pll_ref", clk_base, pmc, 0,
+	clk = tegra_clk_register_pllc("pll_c2", "pll_ref", clk_base, 0,
 			     &pll_c2_params, NULL);
 	clks[TEGRA114_CLK_PLL_C2] = clk;
 
 	/* PLLC3 */
-	clk = tegra_clk_register_pllc("pll_c3", "pll_ref", clk_base, pmc, 0,
+	clk = tegra_clk_register_pllc("pll_c3", "pll_ref", clk_base, 0,
 			     &pll_c3_params, NULL);
 	clks[TEGRA114_CLK_PLL_C3] = clk;
 
 	/* PLLM */
-	clk = tegra_clk_register_pllm("pll_m", "pll_ref", clk_base, pmc,
+	clk = tegra_clk_register_pllm("pll_m", "pll_ref", clk_base,
 			     CLK_SET_RATE_GATE, &pll_m_params, NULL);
 	clks[TEGRA114_CLK_PLL_M] = clk;
 
@@ -978,7 +977,7 @@ static void __init tegra114_pll_init(void __iomem *clk_base,
 	clks[TEGRA114_CLK_PLL_U_12M] = clk;
 
 	/* PLLD */
-	clk = tegra_clk_register_pll("pll_d", "pll_ref", clk_base, pmc, 0,
+	clk = tegra_clk_register_pll("pll_d", "pll_ref", clk_base, 0,
 			    &pll_d_params, &pll_d_lock);
 	clks[TEGRA114_CLK_PLL_D] = clk;
 
@@ -988,7 +987,7 @@ static void __init tegra114_pll_init(void __iomem *clk_base,
 	clks[TEGRA114_CLK_PLL_D_OUT0] = clk;
 
 	/* PLLD2 */
-	clk = tegra_clk_register_pll("pll_d2", "pll_ref", clk_base, pmc, 0,
+	clk = tegra_clk_register_pll("pll_d2", "pll_ref", clk_base, 0,
 			    &pll_d2_params, &pll_d2_lock);
 	clks[TEGRA114_CLK_PLL_D2] = clk;
 
@@ -998,7 +997,7 @@ static void __init tegra114_pll_init(void __iomem *clk_base,
 	clks[TEGRA114_CLK_PLL_D2_OUT0] = clk;
 
 	/* PLLRE */
-	clk = tegra_clk_register_pllre("pll_re_vco", "pll_ref", clk_base, pmc,
+	clk = tegra_clk_register_pllre("pll_re_vco", "pll_ref", clk_base,
 			     0, &pll_re_vco_params, &pll_re_lock, pll_ref_freq);
 	clks[TEGRA114_CLK_PLL_RE_VCO] = clk;
 
@@ -1019,8 +1018,7 @@ static struct tegra_periph_init_data tegra_periph_clk_list[] = {
 	MUX8("vi_sensor", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_VI_SENSOR, 20, TEGRA_PERIPH_NO_RESET, TEGRA114_CLK_VI_SENSOR),
 };
 
-static __init void tegra114_periph_clk_init(void __iomem *clk_base,
-					    void __iomem *pmc_base)
+static __init void tegra114_periph_clk_init(void __iomem *clk_base)
 {
 	struct clk *clk;
 	struct tegra_periph_init_data *data;
@@ -1075,8 +1073,7 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 		clks[data->clk_id] = clk;
 	}
 
-	tegra_periph_clk_init(clk_base, pmc_base, tegra114_clks,
-				&pll_p_params);
+	tegra_periph_clk_init(clk_base, tegra114_clks, &pll_p_params);
 }
 
 /* Tegra114 CPU clock and reset control functions */
@@ -1345,14 +1342,12 @@ static void __init tegra114_clock_init(struct device_node *np)
 		return;
 
 	tegra114_fixed_clk_init(clk_base);
-	tegra114_pll_init(clk_base, pmc_base);
-	tegra114_periph_clk_init(clk_base, pmc_base);
-	tegra_audio_clk_init(clk_base, pmc_base, tegra114_clks,
-			     tegra114_audio_plls,
+	tegra114_pll_init(clk_base);
+	tegra114_periph_clk_init(clk_base);
+	tegra_audio_clk_init(clk_base, tegra114_clks, tegra114_audio_plls,
 			     ARRAY_SIZE(tegra114_audio_plls), 24000000);
 	tegra_pmc_clk_init(pmc_base, tegra114_clks);
-	tegra_super_clk_gen4_init(clk_base, pmc_base, tegra114_clks,
-					&pll_x_params);
+	tegra_super_clk_gen4_init(clk_base, tegra114_clks, &pll_x_params);
 
 	tegra_add_of_provider(np, of_clk_src_onecell_get);
 	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 010daac53ea7..0b7532857a58 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1019,8 +1019,7 @@ static struct tegra_periph_init_data tegra124_periph[] = {
 
 static struct clk **clks;
 
-static __init void tegra124_periph_clk_init(void __iomem *clk_base,
-					    void __iomem *pmc_base)
+static __init void tegra124_periph_clk_init(void __iomem *clk_base)
 {
 	struct clk *clk;
 	unsigned int i;
@@ -1078,17 +1077,16 @@ static __init void tegra124_periph_clk_init(void __iomem *clk_base,
 		*clkp = clk;
 	}
 
-	tegra_periph_clk_init(clk_base, pmc_base, tegra124_clks, &pll_p_params);
+	tegra_periph_clk_init(clk_base, tegra124_clks, &pll_p_params);
 }
 
-static void __init tegra124_pll_init(void __iomem *clk_base,
-				     void __iomem *pmc)
+static void __init tegra124_pll_init(void __iomem *clk_base)
 {
 	struct clk *clk;
 
 	/* PLLC */
 	clk = tegra_clk_register_pllxc("pll_c", "pll_ref", clk_base,
-			pmc, 0, &pll_c_params, NULL);
+				       0, &pll_c_params, NULL);
 	clk_register_clkdev(clk, "pll_c", NULL);
 	clks[TEGRA124_CLK_PLL_C] = clk;
 
@@ -1109,19 +1107,19 @@ static void __init tegra124_pll_init(void __iomem *clk_base,
 	clks[TEGRA124_CLK_PLL_C_UD] = clk;
 
 	/* PLLC2 */
-	clk = tegra_clk_register_pllc("pll_c2", "pll_ref", clk_base, pmc, 0,
+	clk = tegra_clk_register_pllc("pll_c2", "pll_ref", clk_base, 0,
 			     &pll_c2_params, NULL);
 	clk_register_clkdev(clk, "pll_c2", NULL);
 	clks[TEGRA124_CLK_PLL_C2] = clk;
 
 	/* PLLC3 */
-	clk = tegra_clk_register_pllc("pll_c3", "pll_ref", clk_base, pmc, 0,
+	clk = tegra_clk_register_pllc("pll_c3", "pll_ref", clk_base, 0,
 			     &pll_c3_params, NULL);
 	clk_register_clkdev(clk, "pll_c3", NULL);
 	clks[TEGRA124_CLK_PLL_C3] = clk;
 
 	/* PLLM */
-	clk = tegra_clk_register_pllm("pll_m", "pll_ref", clk_base, pmc,
+	clk = tegra_clk_register_pllm("pll_m", "pll_ref", clk_base,
 			     CLK_SET_RATE_GATE, &pll_m_params, NULL);
 	clk_register_clkdev(clk, "pll_m", NULL);
 	clks[TEGRA124_CLK_PLL_M] = clk;
@@ -1174,7 +1172,7 @@ static void __init tegra124_pll_init(void __iomem *clk_base,
 	clks[TEGRA124_CLK_PLL_U_12M] = clk;
 
 	/* PLLD */
-	clk = tegra_clk_register_pll("pll_d", "pll_ref", clk_base, pmc, 0,
+	clk = tegra_clk_register_pll("pll_d", "pll_ref", clk_base, 0,
 			    &pll_d_params, &pll_d_lock);
 	clk_register_clkdev(clk, "pll_d", NULL);
 	clks[TEGRA124_CLK_PLL_D] = clk;
@@ -1186,7 +1184,7 @@ static void __init tegra124_pll_init(void __iomem *clk_base,
 	clks[TEGRA124_CLK_PLL_D_OUT0] = clk;
 
 	/* PLLRE */
-	clk = tegra_clk_register_pllre("pll_re_vco", "pll_ref", clk_base, pmc,
+	clk = tegra_clk_register_pllre("pll_re_vco", "pll_ref", clk_base,
 			     0, &pll_re_vco_params, &pll_re_lock, pll_ref_freq);
 	clk_register_clkdev(clk, "pll_re_vco", NULL);
 	clks[TEGRA124_CLK_PLL_RE_VCO] = clk;
@@ -1491,10 +1489,9 @@ static void __init tegra124_132_clock_init_pre(struct device_node *np)
 		return;
 
 	tegra_fixed_clk_init(tegra124_clks);
-	tegra124_pll_init(clk_base, pmc_base);
-	tegra124_periph_clk_init(clk_base, pmc_base);
-	tegra_audio_clk_init(clk_base, pmc_base, tegra124_clks,
-			     tegra124_audio_plls,
+	tegra124_pll_init(clk_base);
+	tegra124_periph_clk_init(clk_base);
+	tegra_audio_clk_init(clk_base, tegra124_clks, tegra124_audio_plls,
 			     ARRAY_SIZE(tegra124_audio_plls), 24576000);
 	tegra_pmc_clk_init(pmc_base, tegra124_clks);
 
@@ -1511,13 +1508,12 @@ static void __init tegra124_132_clock_init_pre(struct device_node *np)
  * Register most of the along with a few clocks controlled by the PMC
  * IP block.  Everything in this function should be common to Tegra124
  * and Tegra132.  This function must be called after
- * tegra124_132_clock_init_pre(), otherwise clk_base and pmc_base will
- * not be set.  No return value.
+ * tegra124_132_clock_init_pre(), otherwise clk_base will not be set.
+ * No return value.
  */
 static void __init tegra124_132_clock_init_post(struct device_node *np)
 {
-	tegra_super_clk_gen4_init(clk_base, pmc_base, tegra124_clks,
-				  &pll_x_params);
+	tegra_super_clk_gen4_init(clk_base, tegra124_clks, &pll_x_params);
 	tegra_init_special_resets(1, tegra124_reset_assert,
 				  tegra124_reset_deassert);
 	tegra_add_of_provider(np, of_clk_src_onecell_get);
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 4d8222f5c638..5cf33c99976d 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -687,7 +687,7 @@ static void tegra20_pll_init(void)
 	clks[TEGRA20_CLK_PLL_A_OUT0] = clk;
 
 	/* PLLE */
-	clk = tegra_clk_register_plle("pll_e", "pll_ref", clk_base, pmc_base,
+	clk = tegra_clk_register_plle("pll_e", "pll_ref", clk_base,
 			     0, &pll_e_params, NULL);
 	clks[TEGRA20_CLK_PLL_E] = clk;
 }
@@ -853,7 +853,7 @@ static void __init tegra20_periph_clk_init(void)
 		clks[data->clk_id] = clk;
 	}
 
-	tegra_periph_clk_init(clk_base, pmc_base, tegra20_clks, &pll_p_params);
+	tegra_periph_clk_init(clk_base, tegra20_clks, &pll_p_params);
 }
 
 static void __init tegra20_osc_clk_init(void)
@@ -1145,7 +1145,7 @@ static void __init tegra20_clock_init(struct device_node *np)
 	tegra_fixed_clk_init(tegra20_clks);
 	tegra20_pll_init();
 	tegra20_super_clk_init();
-	tegra_super_clk_gen4_init(clk_base, pmc_base, tegra20_clks, NULL);
+	tegra_super_clk_gen4_init(clk_base, tegra20_clks, NULL);
 	tegra20_periph_clk_init();
 	tegra20_audio_clk_init();
 	tegra_pmc_clk_init(pmc_base, tegra20_clks);
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 63f8a778821f..86d0b847be0d 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2993,8 +2993,7 @@ static const char * const la_parents[] = {
 static struct tegra_clk_periph tegra210_la =
 	TEGRA_CLK_PERIPH(29, 7, 9, 0, 8, 1, TEGRA_DIVIDER_ROUND_UP, 76, 0, NULL, 0);
 
-static __init void tegra210_periph_clk_init(void __iomem *clk_base,
-					    void __iomem *pmc_base)
+static __init void tegra210_periph_clk_init(void __iomem *clk_base)
 {
 	struct clk *clk;
 	unsigned int i;
@@ -3090,17 +3089,16 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 		*clkp = clk;
 	}
 
-	tegra_periph_clk_init(clk_base, pmc_base, tegra210_clks, &pll_p_params);
+	tegra_periph_clk_init(clk_base, tegra210_clks, &pll_p_params);
 }
 
-static void __init tegra210_pll_init(void __iomem *clk_base,
-				     void __iomem *pmc)
+static void __init tegra210_pll_init(void __iomem *clk_base)
 {
 	struct clk *clk;
 
 	/* PLLC */
 	clk = tegra_clk_register_pllc_tegra210("pll_c", "pll_ref", clk_base,
-			pmc, 0, &pll_c_params, NULL);
+					       0, &pll_c_params, NULL);
 	if (!WARN_ON(IS_ERR(clk)))
 		clk_register_clkdev(clk, "pll_c", NULL);
 	clks[TEGRA210_CLK_PLL_C] = clk;
@@ -3123,24 +3121,24 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 
 	/* PLLC2 */
 	clk = tegra_clk_register_pllc_tegra210("pll_c2", "pll_ref", clk_base,
-			     pmc, 0, &pll_c2_params, NULL);
+					       0, &pll_c2_params, NULL);
 	clk_register_clkdev(clk, "pll_c2", NULL);
 	clks[TEGRA210_CLK_PLL_C2] = clk;
 
 	/* PLLC3 */
 	clk = tegra_clk_register_pllc_tegra210("pll_c3", "pll_ref", clk_base,
-			     pmc, 0, &pll_c3_params, NULL);
+					       0, &pll_c3_params, NULL);
 	clk_register_clkdev(clk, "pll_c3", NULL);
 	clks[TEGRA210_CLK_PLL_C3] = clk;
 
 	/* PLLM */
-	clk = tegra_clk_register_pllm("pll_m", "osc", clk_base, pmc,
+	clk = tegra_clk_register_pllm("pll_m", "osc", clk_base,
 			     CLK_SET_RATE_GATE, &pll_m_params, NULL);
 	clk_register_clkdev(clk, "pll_m", NULL);
 	clks[TEGRA210_CLK_PLL_M] = clk;
 
 	/* PLLMB */
-	clk = tegra_clk_register_pllmb("pll_mb", "osc", clk_base, pmc,
+	clk = tegra_clk_register_pllmb("pll_mb", "osc", clk_base,
 			     CLK_SET_RATE_GATE, &pll_mb_params, NULL);
 	clk_register_clkdev(clk, "pll_mb", NULL);
 	clks[TEGRA210_CLK_PLL_MB] = clk;
@@ -3210,7 +3208,7 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 	clks[TEGRA210_CLK_PLL_U_48M] = clk;
 
 	/* PLLD */
-	clk = tegra_clk_register_pll("pll_d", "pll_ref", clk_base, pmc, 0,
+	clk = tegra_clk_register_pll("pll_d", "pll_ref", clk_base, 0,
 			    &pll_d_params, &pll_d_lock);
 	clk_register_clkdev(clk, "pll_d", NULL);
 	clks[TEGRA210_CLK_PLL_D] = clk;
@@ -3223,7 +3221,7 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 
 	/* PLLRE */
 	clk = tegra_clk_register_pllre_tegra210("pll_re_vco", "pll_ref",
-						clk_base, pmc, 0,
+						clk_base, 0,
 						&pll_re_vco_params,
 						&pll_re_lock, pll_ref_freq);
 	clk_register_clkdev(clk, "pll_re_vco", NULL);
@@ -3251,7 +3249,7 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 	clks[TEGRA210_CLK_PLL_E] = clk;
 
 	/* PLLC4 */
-	clk = tegra_clk_register_pllre("pll_c4_vco", "pll_ref", clk_base, pmc,
+	clk = tegra_clk_register_pllre("pll_c4_vco", "pll_ref", clk_base,
 			     0, &pll_c4_vco_params, NULL, pll_ref_freq);
 	clk_register_clkdev(clk, "pll_c4_vco", NULL);
 	clks[TEGRA210_CLK_PLL_C4] = clk;
@@ -3680,10 +3678,9 @@ static void __init tegra210_clock_init(struct device_node *np)
 		return;
 
 	tegra_fixed_clk_init(tegra210_clks);
-	tegra210_pll_init(clk_base, pmc_base);
-	tegra210_periph_clk_init(clk_base, pmc_base);
-	tegra_audio_clk_init(clk_base, pmc_base, tegra210_clks,
-			     tegra210_audio_plls,
+	tegra210_pll_init(clk_base);
+	tegra210_periph_clk_init(clk_base);
+	tegra_audio_clk_init(clk_base, tegra210_clks, tegra210_audio_plls,
 			     ARRAY_SIZE(tegra210_audio_plls), 24576000);
 	tegra_pmc_clk_init(pmc_base, tegra210_clks);
 
@@ -3694,8 +3691,7 @@ static void __init tegra210_clock_init(struct device_node *np)
 
 	tegra_clk_apply_init_table = tegra210_clock_apply_init_table;
 
-	tegra_super_clk_gen5_init(clk_base, pmc_base, tegra210_clks,
-				  &pll_x_params);
+	tegra_super_clk_gen5_init(clk_base, tegra210_clks, &pll_x_params);
 	tegra_init_special_resets(2, tegra210_reset_assert,
 				  tegra210_reset_deassert);
 
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index e3b64c66acdc..d65e7edf0cfd 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -809,7 +809,7 @@ static void __init tegra30_pll_init(void)
 	struct clk *clk;
 
 	/* PLLC */
-	clk = tegra_clk_register_pll("pll_c", "pll_ref", clk_base, pmc_base, 0,
+	clk = tegra_clk_register_pll("pll_c", "pll_ref", clk_base, 0,
 				     &pll_c_params, NULL);
 	clks[TEGRA30_CLK_PLL_C] = clk;
 
@@ -823,7 +823,7 @@ static void __init tegra30_pll_init(void)
 	clks[TEGRA30_CLK_PLL_C_OUT1] = clk;
 
 	/* PLLM */
-	clk = tegra_clk_register_pll("pll_m", "pll_ref", clk_base, pmc_base,
+	clk = tegra_clk_register_pll("pll_m", "pll_ref", clk_base,
 			    CLK_SET_RATE_GATE, &pll_m_params, NULL);
 	clks[TEGRA30_CLK_PLL_M] = clk;
 
@@ -837,7 +837,7 @@ static void __init tegra30_pll_init(void)
 	clks[TEGRA30_CLK_PLL_M_OUT1] = clk;
 
 	/* PLLX */
-	clk = tegra_clk_register_pll("pll_x", "pll_ref", clk_base, pmc_base, 0,
+	clk = tegra_clk_register_pll("pll_x", "pll_ref", clk_base, 0,
 			    &pll_x_params, NULL);
 	clks[TEGRA30_CLK_PLL_X] = clk;
 
@@ -852,7 +852,7 @@ static void __init tegra30_pll_init(void)
 	clks[TEGRA30_CLK_PLL_U] = clk;
 
 	/* PLLD */
-	clk = tegra_clk_register_pll("pll_d", "pll_ref", clk_base, pmc_base, 0,
+	clk = tegra_clk_register_pll("pll_d", "pll_ref", clk_base, 0,
 			    &pll_d_params, &pll_d_lock);
 	clks[TEGRA30_CLK_PLL_D] = clk;
 
@@ -862,7 +862,7 @@ static void __init tegra30_pll_init(void)
 	clks[TEGRA30_CLK_PLL_D_OUT0] = clk;
 
 	/* PLLD2 */
-	clk = tegra_clk_register_pll("pll_d2", "pll_ref", clk_base, pmc_base, 0,
+	clk = tegra_clk_register_pll("pll_d2", "pll_ref", clk_base, 0,
 			    &pll_d2_params, NULL);
 	clks[TEGRA30_CLK_PLL_D2] = clk;
 
@@ -876,7 +876,7 @@ static void __init tegra30_pll_init(void)
 			       ARRAY_SIZE(pll_e_parents),
 			       CLK_SET_RATE_NO_REPARENT,
 			       clk_base + PLLE_AUX, 2, 1, 0, NULL);
-	clk = tegra_clk_register_plle("pll_e", "pll_e_mux", clk_base, pmc_base,
+	clk = tegra_clk_register_plle("pll_e", "pll_e_mux", clk_base
 			     CLK_GET_RATE_NOCACHE, &pll_e_params, NULL);
 	clks[TEGRA30_CLK_PLL_E] = clk;
 }
@@ -980,7 +980,7 @@ static void __init tegra30_super_clk_init(void)
 					CLK_SET_RATE_PARENT, 1, 2);
 	clks[TEGRA30_CLK_TWD] = clk;
 
-	tegra_super_clk_gen4_init(clk_base, pmc_base, tegra30_clks, NULL);
+	tegra_super_clk_gen4_init(clk_base, tegra30_clks, NULL);
 }
 
 static const char *mux_pllacp_clkm[] = { "pll_a_out0", "unused", "pll_p",
@@ -1067,7 +1067,7 @@ static void __init tegra30_periph_clk_init(void)
 		clks[data->clk_id] = clk;
 	}
 
-	tegra_periph_clk_init(clk_base, pmc_base, tegra30_clks, &pll_p_params);
+	tegra_periph_clk_init(clk_base, tegra30_clks, &pll_p_params);
 }
 
 /* Tegra30 CPU clock and reset control functions */
@@ -1353,8 +1353,7 @@ static void __init tegra30_clock_init(struct device_node *np)
 	tegra30_pll_init();
 	tegra30_super_clk_init();
 	tegra30_periph_clk_init();
-	tegra_audio_clk_init(clk_base, pmc_base, tegra30_clks,
-			     tegra30_audio_plls,
+	tegra_audio_clk_init(clk_base, tegra30_clks, tegra30_audio_plls,
 			     ARRAY_SIZE(tegra30_audio_plls), 24000000);
 	tegra_pmc_clk_init(pmc_base, tegra30_clks);
 
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 9a4473f94fe0..cd79b7fc4e5e 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -354,14 +354,12 @@ struct tegra_clk_pll_params {
  *
  * @hw:		handle between common and hardware-specifix interfaces
  * @clk_base:	address of CAR controller
- * @pmc:	address of PMC, required to read override bits
  * @lock:	register lock
  * @params:	PLL parameters
  */
 struct tegra_clk_pll {
 	struct clk_hw	hw;
 	void __iomem	*clk_base;
-	void __iomem	*pmc;
 	spinlock_t	*lock;
 	struct tegra_clk_pll_params	*params;
 };
@@ -386,42 +384,38 @@ struct tegra_audio_clk_info {
 extern const struct clk_ops tegra_clk_pll_ops;
 extern const struct clk_ops tegra_clk_plle_ops;
 struct clk *tegra_clk_register_pll(const char *name, const char *parent_name,
-		void __iomem *clk_base, void __iomem *pmc,
-		unsigned long flags, struct tegra_clk_pll_params *pll_params,
+		void __iomem *clk_base, unsigned long flags,
+		struct tegra_clk_pll_params *pll_params,
 		spinlock_t *lock);
 
 struct clk *tegra_clk_register_plle(const char *name, const char *parent_name,
-		void __iomem *clk_base, void __iomem *pmc,
-		unsigned long flags, struct tegra_clk_pll_params *pll_params,
+		void __iomem *clk_base, unsigned long flags,
+		struct tegra_clk_pll_params *pll_params,
 		spinlock_t *lock);
 
 struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
-			    void __iomem *clk_base, void __iomem *pmc,
-			    unsigned long flags,
+			    void __iomem *clk_base, unsigned long flags,
 			    struct tegra_clk_pll_params *pll_params,
 			    spinlock_t *lock);
 
 struct clk *tegra_clk_register_pllm(const char *name, const char *parent_name,
-			   void __iomem *clk_base, void __iomem *pmc,
-			   unsigned long flags,
+			   void __iomem *clk_base, unsigned long flags,
 			   struct tegra_clk_pll_params *pll_params,
 			   spinlock_t *lock);
 
 struct clk *tegra_clk_register_pllc(const char *name, const char *parent_name,
-			   void __iomem *clk_base, void __iomem *pmc,
-			   unsigned long flags,
+			   void __iomem *clk_base, unsigned long flags,
 			   struct tegra_clk_pll_params *pll_params,
 			   spinlock_t *lock);
 
 struct clk *tegra_clk_register_pllre(const char *name, const char *parent_name,
-			   void __iomem *clk_base, void __iomem *pmc,
-			   unsigned long flags,
+			   void __iomem *clk_base, unsigned long flags,
 			   struct tegra_clk_pll_params *pll_params,
 			   spinlock_t *lock, unsigned long parent_rate);
 
 struct clk *tegra_clk_register_pllre_tegra210(const char *name,
 			   const char *parent_name, void __iomem *clk_base,
-			   void __iomem *pmc, unsigned long flags,
+			   unsigned long flags,
 			   struct tegra_clk_pll_params *pll_params,
 			   spinlock_t *lock, unsigned long parent_rate);
 
@@ -439,7 +433,7 @@ struct clk *tegra_clk_register_plle_tegra210(const char *name,
 
 struct clk *tegra_clk_register_pllc_tegra210(const char *name,
 				const char *parent_name, void __iomem *clk_base,
-				void __iomem *pmc, unsigned long flags,
+				unsigned long flags,
 				struct tegra_clk_pll_params *pll_params,
 				spinlock_t *lock);
 
@@ -455,8 +449,7 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
 			   spinlock_t *lock);
 
 struct clk *tegra_clk_register_pllmb(const char *name, const char *parent_name,
-			   void __iomem *clk_base, void __iomem *pmc,
-			   unsigned long flags,
+			   void __iomem *clk_base, unsigned long flags,
 			   struct tegra_clk_pll_params *pll_params,
 			   spinlock_t *lock);
 
@@ -836,11 +829,11 @@ void tegra_add_of_provider(struct device_node *np, void *clk_src_onecell_get);
 void tegra_register_devclks(struct tegra_devclk *dev_clks, int num);
 
 void tegra_audio_clk_init(void __iomem *clk_base,
-			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
+			struct tegra_clk *tegra_clks,
 			struct tegra_audio_clk_info *audio_info,
 			unsigned int num_plls, unsigned long sync_max_rate);
 
-void tegra_periph_clk_init(void __iomem *clk_base, void __iomem *pmc_base,
+void tegra_periph_clk_init(void __iomem *clk_base,
 			struct tegra_clk *tegra_clks,
 			struct tegra_clk_pll_params *pll_params);
 
@@ -851,10 +844,10 @@ int tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
 		       unsigned int clk_m_div, unsigned long *osc_freq,
 		       unsigned long *pll_ref_freq);
 void tegra_super_clk_gen4_init(void __iomem *clk_base,
-			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
+			struct tegra_clk *tegra_clks,
 			struct tegra_clk_pll_params *pll_params);
 void tegra_super_clk_gen5_init(void __iomem *clk_base,
-			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
+			struct tegra_clk *tegra_clks,
 			struct tegra_clk_pll_params *pll_params);
 
 #ifdef CONFIG_TEGRA_CLK_EMC
-- 
2.7.4


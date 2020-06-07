Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196251F0EC5
	for <lists+linux-tegra@lfdr.de>; Sun,  7 Jun 2020 21:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbgFGTAY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 7 Jun 2020 15:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728201AbgFGS5T (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 7 Jun 2020 14:57:19 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C528C061A0E;
        Sun,  7 Jun 2020 11:57:19 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a25so17770312ljp.3;
        Sun, 07 Jun 2020 11:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WiLQsvwlVoBru+A4MaoGlZvPeG4/0vnYAqFUXXDBgCw=;
        b=J/MlERcEe3CazDhMgDpyk/bAQVh7AHf+mV2vtrFT/DD01ffZd9y9xpsFX6lhWpzcYy
         oM+POewYG0MHhtwJDzZmRbbVAJoDUVhDcl9lB5Y+NNMIb2Yuu2fay9ESbmPL/ssF+JYh
         b8qLq13B3fHS4DQlBwCjtao3AE37uMzd1QCFcSKqYL7An3Q+KDeI7F0MTZrkdlZgoseK
         hio1nYk3VXqtO5DDGjaPTkediBxOFtrg6tJy/j7PYvuoha0fCK7owajk0yh9mf/AXTTC
         gOWMsI9RZ7+dvkZMYdQY1OGY9QCAru4puGa7p8iafy8Of0vPEZ0FDIizNirV0RZkPlsb
         9sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WiLQsvwlVoBru+A4MaoGlZvPeG4/0vnYAqFUXXDBgCw=;
        b=mfL5Aw+lq37+zsS4kIA4x2RZ/LtBr+PitCekxvymJBfOHHBYCsv6nzDgugNF36fpuZ
         n28bGQTxSf0nWppgoOXMaGvaMyCXLWTt4gS27A7B0nv2FtHodiH9ivNhceO54VPk7Pam
         ifCFuQmzrC6n10EF6xJyU+Ex5aawsCKJ3+XiwHl2fhZF8usb55awtxye2zjbdukYd9Q6
         z9etO7CEYrBX9FXarQ3kI+GDglRW4jfrGniVpWFqFf4GCcFdmo5whOhl4XCqzEnAGkJE
         Dr+G4lsGn0yZ34Z3GoeZoIUYMzCmN/G/ug3i0cBXYJdo+AUqaF9wk2TLUFTzh6D7dMdW
         32kQ==
X-Gm-Message-State: AOAM531FDcgGAfpmZwx3mB9/5rqshDFw8iBntc0VG+20abCz4hmGhT/m
        0I4sUxXVLDurbJGYO/EP4SA=
X-Google-Smtp-Source: ABdhPJz+0URI+/PoLFtM5uPGb39DBkxG4GzjjnXPHEzjPvOlvu/xJmzDgDOAu1LQrkM+M03SCDCb4g==
X-Received: by 2002:a2e:584e:: with SMTP id x14mr8749727ljd.380.1591556237422;
        Sun, 07 Jun 2020 11:57:17 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 11:57:16 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 06/39] memory: tegra124-emc: Make driver modular
Date:   Sun,  7 Jun 2020 21:54:57 +0300
Message-Id: <20200607185530.18113-7-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200607185530.18113-1-digetx@gmail.com>
References: <20200607185530.18113-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch adds modularization support to the Tegra124 EMC driver. Driver
now can be compiled as a loadable kernel module.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra124-emc.c | 63 +++++++++++++++++-----------
 drivers/clk/tegra/clk-tegra124.c     |  3 +-
 drivers/clk/tegra/clk.h              | 12 ------
 drivers/memory/tegra/Kconfig         |  2 +-
 drivers/memory/tegra/tegra124-emc.c  | 31 +++++++++-----
 include/linux/clk/tegra.h            | 11 +++++
 include/soc/tegra/emc.h              | 16 -------
 7 files changed, 72 insertions(+), 66 deletions(-)
 delete mode 100644 include/soc/tegra/emc.h

diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
index 745f9faa98d8..4d8b8f1ba7cd 100644
--- a/drivers/clk/tegra/clk-tegra124-emc.c
+++ b/drivers/clk/tegra/clk-tegra124-emc.c
@@ -11,7 +11,9 @@
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
+#include <linux/clk/tegra.h>
 #include <linux/delay.h>
+#include <linux/export.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -21,10 +23,10 @@
 #include <linux/string.h>
 
 #include <soc/tegra/fuse.h>
-#include <soc/tegra/emc.h>
 
 #include "clk.h"
 
+#define CLK_BASE 0x60006000
 #define CLK_SOURCE_EMC 0x19c
 
 #define CLK_SOURCE_EMC_EMC_2X_CLK_DIVISOR_SHIFT 0
@@ -79,7 +81,9 @@ struct tegra_clk_emc {
 
 	int num_timings;
 	struct emc_timing *timings;
-	spinlock_t *lock;
+
+	tegra124_emc_prepare_timing_change_cb *prepare_timing_change;
+	tegra124_emc_complete_timing_change_cb *complete_timing_change;
 };
 
 /* Common clock framework callback implementations */
@@ -98,7 +102,7 @@ static unsigned long emc_recalc_rate(struct clk_hw *hw,
 	 */
 	parent_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
 
-	val = readl(tegra->clk_regs + CLK_SOURCE_EMC);
+	val = readl(tegra->clk_regs);
 	div = val & CLK_SOURCE_EMC_EMC_2X_CLK_DIVISOR_MASK;
 
 	return parent_rate / (div + 2) * 2;
@@ -163,7 +167,7 @@ static u8 emc_get_parent(struct clk_hw *hw)
 
 	tegra = container_of(hw, struct tegra_clk_emc, hw);
 
-	val = readl(tegra->clk_regs + CLK_SOURCE_EMC);
+	val = readl(tegra->clk_regs);
 
 	return (val >> CLK_SOURCE_EMC_EMC_2X_CLK_SRC_SHIFT)
 		& CLK_SOURCE_EMC_EMC_2X_CLK_SRC_MASK;
@@ -204,7 +208,6 @@ static int emc_set_timing(struct tegra_clk_emc *tegra,
 	int err;
 	u8 div;
 	u32 car_value;
-	unsigned long flags = 0;
 	struct tegra_emc *emc = emc_ensure_emc_driver(tegra);
 
 	if (!emc)
@@ -241,13 +244,11 @@ static int emc_set_timing(struct tegra_clk_emc *tegra,
 
 	div = timing->parent_rate / (timing->rate / 2) - 2;
 
-	err = tegra_emc_prepare_timing_change(emc, timing->rate);
+	err = tegra->prepare_timing_change(emc, timing->rate);
 	if (err)
 		return err;
 
-	spin_lock_irqsave(tegra->lock, flags);
-
-	car_value = readl(tegra->clk_regs + CLK_SOURCE_EMC);
+	car_value = readl(tegra->clk_regs);
 
 	car_value &= ~CLK_SOURCE_EMC_EMC_2X_CLK_SRC(~0);
 	car_value |= CLK_SOURCE_EMC_EMC_2X_CLK_SRC(timing->parent_index);
@@ -255,11 +256,9 @@ static int emc_set_timing(struct tegra_clk_emc *tegra,
 	car_value &= ~CLK_SOURCE_EMC_EMC_2X_CLK_DIVISOR(~0);
 	car_value |= CLK_SOURCE_EMC_EMC_2X_CLK_DIVISOR(div);
 
-	writel(car_value, tegra->clk_regs + CLK_SOURCE_EMC);
-
-	spin_unlock_irqrestore(tegra->lock, flags);
+	writel(car_value, tegra->clk_regs);
 
-	tegra_emc_complete_timing_change(emc, timing->rate);
+	tegra->complete_timing_change(emc, timing->rate);
 
 	clk_hw_reparent(&tegra->hw, __clk_get_hw(timing->parent));
 	clk_disable_unprepare(tegra->prev_parent);
@@ -473,12 +472,15 @@ static const struct clk_ops tegra_clk_emc_ops = {
 	.get_parent = emc_get_parent,
 };
 
-struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
-				   spinlock_t *lock)
+struct clk *
+tegra124_clk_register_emc(struct device_node *emc_np,
+			  tegra124_emc_prepare_timing_change_cb *prep_cb,
+			  tegra124_emc_complete_timing_change_cb *complete_cb)
 {
 	struct tegra_clk_emc *tegra;
 	struct clk_init_data init;
 	struct device_node *node;
+	struct resource res;
 	u32 node_ram_code;
 	struct clk *clk;
 	int err;
@@ -487,12 +489,21 @@ struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
 	if (!tegra)
 		return ERR_PTR(-ENOMEM);
 
-	tegra->clk_regs = base;
-	tegra->lock = lock;
+	res.start = CLK_BASE + CLK_SOURCE_EMC;
+	res.end = res.start + 3;
+	res.flags = IORESOURCE_MEM;
 
-	tegra->num_timings = 0;
+	tegra->clk_regs = ioremap(res.start, resource_size(&res));
+	if (!tegra->clk_regs) {
+		pr_err("failed to map CLK_SOURCE_EMC\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	tegra->emc_node = emc_np;
+	tegra->prepare_timing_change = prep_cb;
+	tegra->complete_timing_change = complete_cb;
 
-	for_each_child_of_node(np, node) {
+	for_each_child_of_node(emc_np, node) {
 		err = of_property_read_u32(node, "nvidia,ram-code",
 					   &node_ram_code);
 		if (err)
@@ -512,11 +523,6 @@ struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
 	if (tegra->num_timings == 0)
 		pr_warn("%s: no memory timings registered\n", __func__);
 
-	tegra->emc_node = of_parse_phandle(np,
-			"nvidia,external-memory-controller", 0);
-	if (!tegra->emc_node)
-		pr_warn("%s: couldn't find node for EMC driver\n", __func__);
-
 	init.name = "emc";
 	init.ops = &tegra_clk_emc_ops;
 	init.flags = CLK_IS_CRITICAL;
@@ -536,5 +542,12 @@ struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
 	/* Allow debugging tools to see the EMC clock */
 	clk_register_clkdev(clk, "emc", "tegra-clk-debug");
 
+	/*
+	 * Don't allow the kernel module to be unloaded, unloading is not
+	 * supported by the EMC driver.
+	 */
+	try_module_get(THIS_MODULE);
+
 	return clk;
-};
+}
+EXPORT_SYMBOL_GPL(tegra124_clk_register_emc);
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 0c956e14b9ca..228d87367ac6 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -928,6 +928,7 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_audio4_mux] = { .dt_id = TEGRA124_CLK_AUDIO4_MUX, .present = true },
 	[tegra_clk_spdif_mux] = { .dt_id = TEGRA124_CLK_SPDIF_MUX, .present = true },
 	[tegra_clk_cec] = { .dt_id = TEGRA124_CLK_CEC, .present = true },
+	[tegra_clk_emc] = { .dt_id = TEGRA124_CLK_EMC, .present = false },
 };
 
 static struct tegra_devclk devclks[] __initdata = {
@@ -1516,8 +1517,6 @@ static void __init tegra124_132_clock_init_post(struct device_node *np)
 				  tegra124_reset_deassert);
 	tegra_add_of_provider(np, of_clk_src_onecell_get);
 
-	clks[TEGRA124_CLK_EMC] = tegra_clk_register_emc(clk_base, np, NULL);
-
 	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
 
 	tegra_cpu_car_ops = &tegra124_cpu_car_ops;
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 5ed8b95d331c..11a8bbe650c5 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -881,18 +881,6 @@ void tegra_super_clk_gen5_init(void __iomem *clk_base,
 			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
 			struct tegra_clk_pll_params *pll_params);
 
-#ifdef CONFIG_TEGRA124_EMC
-struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
-				   spinlock_t *lock);
-#else
-static inline struct clk *tegra_clk_register_emc(void __iomem *base,
-						 struct device_node *np,
-						 spinlock_t *lock)
-{
-	return NULL;
-}
-#endif
-
 void tegra114_clock_tune_cpu_trimmers_high(void);
 void tegra114_clock_tune_cpu_trimmers_low(void);
 void tegra114_clock_tune_cpu_trimmers_init(void);
diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index bd453de9d446..c1cad4ce6251 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -28,7 +28,7 @@ config TEGRA30_EMC
 	  external memory.
 
 config TEGRA124_EMC
-	bool "NVIDIA Tegra124 External Memory Controller driver"
+	tristate "NVIDIA Tegra124 External Memory Controller driver"
 	default y
 	depends on TEGRA_MC && ARCH_TEGRA_124_SOC
 	help
diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index d19fb7ae230d..95afb0fa4a06 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -9,16 +9,17 @@
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
+#include <linux/clk/tegra.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/sort.h>
 #include <linux/string.h>
 
-#include <soc/tegra/emc.h>
 #include <soc/tegra/fuse.h>
 #include <soc/tegra/mc.h>
 
@@ -562,8 +563,8 @@ static struct emc_timing *tegra_emc_find_timing(struct tegra_emc *emc,
 	return timing;
 }
 
-int tegra_emc_prepare_timing_change(struct tegra_emc *emc,
-				    unsigned long rate)
+static int tegra_emc_prepare_timing_change(struct tegra_emc *emc,
+					   unsigned long rate)
 {
 	struct emc_timing *timing = tegra_emc_find_timing(emc, rate);
 	struct emc_timing *last = &emc->last_timing;
@@ -790,8 +791,8 @@ int tegra_emc_prepare_timing_change(struct tegra_emc *emc,
 	return 0;
 }
 
-void tegra_emc_complete_timing_change(struct tegra_emc *emc,
-				      unsigned long rate)
+static void tegra_emc_complete_timing_change(struct tegra_emc *emc,
+					     unsigned long rate)
 {
 	struct emc_timing *timing = tegra_emc_find_timing(emc, rate);
 	struct emc_timing *last = &emc->last_timing;
@@ -986,6 +987,7 @@ static const struct of_device_id tegra_emc_of_match[] = {
 	{ .compatible = "nvidia,tegra124-emc" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, tegra_emc_of_match);
 
 static struct device_node *
 tegra_emc_find_node_by_ram_code(struct device_node *node, u32 ram_code)
@@ -1251,9 +1253,20 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, emc);
 
+	tegra124_clk_register_emc(pdev->dev.of_node,
+				  tegra_emc_prepare_timing_change,
+				  tegra_emc_complete_timing_change);
+
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		emc_debugfs_init(&pdev->dev, emc);
 
+	/*
+	 * Don't allow the kernel module to be unloaded. Unloading adds some
+	 * extra complexity which doesn't really worth the effort in a case of
+	 * this driver.
+	 */
+	try_module_get(THIS_MODULE);
+
 	return 0;
 };
 
@@ -1265,9 +1278,7 @@ static struct platform_driver tegra_emc_driver = {
 		.suppress_bind_attrs = true,
 	},
 };
+module_platform_driver(tegra_emc_driver);
 
-static int tegra_emc_init(void)
-{
-	return platform_driver_register(&tegra_emc_driver);
-}
-subsys_initcall(tegra_emc_init);
+MODULE_DESCRIPTION("NVIDIA Tegra124 EMC driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index 3f01d43f0598..797b8bde18de 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -136,6 +136,8 @@ extern void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value);
 extern void tegra210_clk_emc_update_setting(u32 emc_src_value);
 
 struct clk;
+struct device_node;
+struct tegra_emc;
 
 typedef long (tegra20_clk_emc_round_cb)(unsigned long rate,
 					unsigned long min_rate,
@@ -146,6 +148,15 @@ void tegra20_clk_set_emc_round_callback(tegra20_clk_emc_round_cb *round_cb,
 					void *cb_arg);
 int tegra20_clk_prepare_emc_mc_same_freq(struct clk *emc_clk, bool same);
 
+typedef int (tegra124_emc_prepare_timing_change_cb)(struct tegra_emc *emc,
+						    unsigned long rate);
+typedef void (tegra124_emc_complete_timing_change_cb)(struct tegra_emc *emc,
+						      unsigned long rate);
+struct clk *
+tegra124_clk_register_emc(struct device_node *emc_np,
+			  tegra124_emc_prepare_timing_change_cb *prep_cb,
+			  tegra124_emc_complete_timing_change_cb *complete_cb);
+
 struct tegra210_clk_emc_config {
 	unsigned long rate;
 	bool same_freq;
diff --git a/include/soc/tegra/emc.h b/include/soc/tegra/emc.h
deleted file mode 100644
index 05199a97ccf4..000000000000
--- a/include/soc/tegra/emc.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2014 NVIDIA Corporation. All rights reserved.
- */
-
-#ifndef __SOC_TEGRA_EMC_H__
-#define __SOC_TEGRA_EMC_H__
-
-struct tegra_emc;
-
-int tegra_emc_prepare_timing_change(struct tegra_emc *emc,
-				    unsigned long rate);
-void tegra_emc_complete_timing_change(struct tegra_emc *emc,
-				      unsigned long rate);
-
-#endif /* __SOC_TEGRA_EMC_H__ */
-- 
2.26.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B52B7E3F3F
	for <lists+linux-tegra@lfdr.de>; Fri, 25 Oct 2019 00:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731393AbfJXWTB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 18:19:01 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38646 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730438AbfJXWRr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 18:17:47 -0400
Received: by mail-lj1-f195.google.com with SMTP id q78so374626lje.5;
        Thu, 24 Oct 2019 15:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BK4txBT97LVoKJGJW9u4O6HXGB3uLuHGQDSLu0eTgG0=;
        b=LCTZFVlV1bGcWCOuhdsELVseJPCNorhZlVk8S1c53+oKnquTHQNBVxtQO0MyVKmfmd
         soDjmsNgfAShqrOKLlg08ooxARm1T4GuIAzV0OPB9TJ3ExEjnUtC21WKd3bbvBh1c/L+
         ahu1sxQOw/YME16OytUUg/YEw087hXlCo0rK2jZKu3UlVYVqnV6HxNJfuM76iCxUrDZV
         frzeWXeibCY4hwolaE1dMAXsr8pDupfnYZItsbCnykL7MRi/shFvHE6nOEMl+5SpDj3F
         JGb0W6qRtjXmaiCPvN/L1zqoLZbjj8KKGjlrIwZjq5TsxopqZr4AgHhOgc7ggbCyqYlR
         JCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BK4txBT97LVoKJGJW9u4O6HXGB3uLuHGQDSLu0eTgG0=;
        b=GeNmNkH1VY/YvLQwwbeOdUxXbANCJQw/uQcIia/x53b7IeR1FK/brH7ci85mWBaBdr
         rNQkzAxIFvgBFFATFx34x5b53U3+bRK5yERViAi/2P8PKUMjjJfwA/S1lBihAtMfh7xi
         zlMM4XsKqvduPnIvYmuXw4ixtwfP0GaRShKzxCRcntbvoAgJGLpsQPvp1t4M2wyFbPzc
         WEgU/8GcacsQDsOtB1GdbxNV9IxJlFSGyx5ery2DXMBAaAVsS10YrnLULkCXIvfxOBgv
         eXPMp672H1MpsXaJSMhC1tx4UtLCcIHbDPxy/yofIT1vn9RFLrhHZDtFEF+zU8feeRX1
         J9kg==
X-Gm-Message-State: APjAAAUqOIq9Wxrq1GeyaZLOrQZsu/SoTJb+6/ZWjoF37JRBwtk+5Y6W
        NPq1062/s2om04YUWlfEruw=
X-Google-Smtp-Source: APXvYqx7mFP/8GdvubEnBV81csGcTe5kgdG1yPVa3QMw/h5SggaNNlomtkxra3aLf7i/Axo2tsZ3oA==
X-Received: by 2002:a2e:505e:: with SMTP id v30mr42559ljd.244.1571955463392;
        Thu, 24 Oct 2019 15:17:43 -0700 (PDT)
Received: from localhost.localdomain (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.gmail.com with ESMTPSA id i6sm11338765lfo.83.2019.10.24.15.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 15:17:42 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/17] cpufreq: tegra20: Use generic cpufreq-dt driver (Tegra30 supported now)
Date:   Fri, 25 Oct 2019 01:14:06 +0300
Message-Id: <20191024221416.14197-8-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024221416.14197-1-digetx@gmail.com>
References: <20191024221416.14197-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Re-parenting to intermediate clock is supported now by the clock driver
and thus there is no need in a customized CPUFreq driver, all that code
is common for both Tegra20 and Tegra30. The available CPU freqs are now
specified in device-tree in a form of OPPs, all users should update their
device-trees.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/cpufreq/Kconfig.arm          |   6 +-
 drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
 drivers/cpufreq/tegra20-cpufreq.c    | 211 +++++++--------------------
 3 files changed, 55 insertions(+), 164 deletions(-)

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index 3858d86cf409..92a6a5089979 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -295,11 +295,11 @@ config ARM_TANGO_CPUFREQ
 	default y
 
 config ARM_TEGRA20_CPUFREQ
-	tristate "Tegra20 CPUFreq support"
-	depends on ARCH_TEGRA
+	tristate "Tegra20/30 CPUFreq support"
+	depends on ARCH_TEGRA && CPUFREQ_DT
 	default y
 	help
-	  This adds the CPUFreq driver support for Tegra20 SOCs.
+	  This adds the CPUFreq driver support for Tegra20/30 SOCs.
 
 config ARM_TEGRA124_CPUFREQ
 	bool "Tegra124 CPUFreq support"
diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index f1d170dcf4d3..aba591d57c67 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -121,6 +121,8 @@ static const struct of_device_id blacklist[] __initconst = {
 	{ .compatible = "mediatek,mt8176", },
 	{ .compatible = "mediatek,mt8183", },
 
+	{ .compatible = "nvidia,tegra20", },
+	{ .compatible = "nvidia,tegra30", },
 	{ .compatible = "nvidia,tegra124", },
 	{ .compatible = "nvidia,tegra210", },
 
diff --git a/drivers/cpufreq/tegra20-cpufreq.c b/drivers/cpufreq/tegra20-cpufreq.c
index f84ecd22f488..527cd9686220 100644
--- a/drivers/cpufreq/tegra20-cpufreq.c
+++ b/drivers/cpufreq/tegra20-cpufreq.c
@@ -7,201 +7,90 @@
  *	Based on arch/arm/plat-omap/cpu-omap.c, (C) 2005 Nokia Corporation
  */
 
-#include <linux/clk.h>
-#include <linux/cpufreq.h>
+#include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/types.h>
 
-static struct cpufreq_frequency_table freq_table[] = {
-	{ .frequency = 216000 },
-	{ .frequency = 312000 },
-	{ .frequency = 456000 },
-	{ .frequency = 608000 },
-	{ .frequency = 760000 },
-	{ .frequency = 816000 },
-	{ .frequency = 912000 },
-	{ .frequency = 1000000 },
-	{ .frequency = CPUFREQ_TABLE_END },
-};
-
-struct tegra20_cpufreq {
-	struct device *dev;
-	struct cpufreq_driver driver;
-	struct clk *cpu_clk;
-	struct clk *pll_x_clk;
-	struct clk *pll_p_clk;
-	bool pll_x_prepared;
-};
+#include <soc/tegra/common.h>
+#include <soc/tegra/fuse.h>
 
-static unsigned int tegra_get_intermediate(struct cpufreq_policy *policy,
-					   unsigned int index)
+static bool cpu0_node_has_opp_v2_prop(void)
 {
-	struct tegra20_cpufreq *cpufreq = cpufreq_get_driver_data();
-	unsigned int ifreq = clk_get_rate(cpufreq->pll_p_clk) / 1000;
-
-	/*
-	 * Don't switch to intermediate freq if:
-	 * - we are already at it, i.e. policy->cur == ifreq
-	 * - index corresponds to ifreq
-	 */
-	if (freq_table[index].frequency == ifreq || policy->cur == ifreq)
-		return 0;
-
-	return ifreq;
-}
+	struct device_node *np = of_cpu_device_node_get(0);
+	bool ret = false;
 
-static int tegra_target_intermediate(struct cpufreq_policy *policy,
-				     unsigned int index)
-{
-	struct tegra20_cpufreq *cpufreq = cpufreq_get_driver_data();
-	int ret;
-
-	/*
-	 * Take an extra reference to the main pll so it doesn't turn
-	 * off when we move the cpu off of it as enabling it again while we
-	 * switch to it from tegra_target() would take additional time.
-	 *
-	 * When target-freq is equal to intermediate freq we don't need to
-	 * switch to an intermediate freq and so this routine isn't called.
-	 * Also, we wouldn't be using pll_x anymore and must not take extra
-	 * reference to it, as it can be disabled now to save some power.
-	 */
-	clk_prepare_enable(cpufreq->pll_x_clk);
-
-	ret = clk_set_parent(cpufreq->cpu_clk, cpufreq->pll_p_clk);
-	if (ret)
-		clk_disable_unprepare(cpufreq->pll_x_clk);
-	else
-		cpufreq->pll_x_prepared = true;
+	if (of_get_property(np, "operating-points-v2", NULL))
+		ret = true;
 
+	of_node_put(np);
 	return ret;
 }
 
-static int tegra_target(struct cpufreq_policy *policy, unsigned int index)
-{
-	struct tegra20_cpufreq *cpufreq = cpufreq_get_driver_data();
-	unsigned long rate = freq_table[index].frequency;
-	unsigned int ifreq = clk_get_rate(cpufreq->pll_p_clk) / 1000;
-	int ret;
-
-	/*
-	 * target freq == pll_p, don't need to take extra reference to pll_x_clk
-	 * as it isn't used anymore.
-	 */
-	if (rate == ifreq)
-		return clk_set_parent(cpufreq->cpu_clk, cpufreq->pll_p_clk);
-
-	ret = clk_set_rate(cpufreq->pll_x_clk, rate * 1000);
-	/* Restore to earlier frequency on error, i.e. pll_x */
-	if (ret)
-		dev_err(cpufreq->dev, "Failed to change pll_x to %lu\n", rate);
-
-	ret = clk_set_parent(cpufreq->cpu_clk, cpufreq->pll_x_clk);
-	/* This shouldn't fail while changing or restoring */
-	WARN_ON(ret);
-
-	/*
-	 * Drop count to pll_x clock only if we switched to intermediate freq
-	 * earlier while transitioning to a target frequency.
-	 */
-	if (cpufreq->pll_x_prepared) {
-		clk_disable_unprepare(cpufreq->pll_x_clk);
-		cpufreq->pll_x_prepared = false;
-	}
-
-	return ret;
-}
-
-static int tegra_cpu_init(struct cpufreq_policy *policy)
-{
-	struct tegra20_cpufreq *cpufreq = cpufreq_get_driver_data();
-
-	clk_prepare_enable(cpufreq->cpu_clk);
-
-	/* FIXME: what's the actual transition time? */
-	cpufreq_generic_init(policy, freq_table, 300 * 1000);
-	policy->clk = cpufreq->cpu_clk;
-	policy->suspend_freq = freq_table[0].frequency;
-	return 0;
-}
-
-static int tegra_cpu_exit(struct cpufreq_policy *policy)
-{
-	struct tegra20_cpufreq *cpufreq = cpufreq_get_driver_data();
-
-	clk_disable_unprepare(cpufreq->cpu_clk);
-	return 0;
-}
-
 static int tegra20_cpufreq_probe(struct platform_device *pdev)
 {
-	struct tegra20_cpufreq *cpufreq;
+	struct platform_device *cpufreq_dt;
+	struct opp_table *opp_table;
+	u32 versions[2];
 	int err;
 
-	cpufreq = devm_kzalloc(&pdev->dev, sizeof(*cpufreq), GFP_KERNEL);
-	if (!cpufreq)
-		return -ENOMEM;
+	if (!cpu0_node_has_opp_v2_prop()) {
+		dev_err(&pdev->dev, "operating points not found\n");
+		dev_err(&pdev->dev, "please update your device tree\n");
+		return -ENODEV;
+	}
+
+	if (of_machine_is_compatible("nvidia,tegra20")) {
+		versions[0] = BIT(tegra_sku_info.cpu_process_id);
+		versions[1] = BIT(tegra_sku_info.soc_speedo_id);
+	} else {
+		versions[0] = BIT(tegra_sku_info.cpu_process_id);
+		versions[1] = BIT(tegra_sku_info.cpu_speedo_id);
+	}
 
-	cpufreq->cpu_clk = clk_get_sys(NULL, "cclk");
-	if (IS_ERR(cpufreq->cpu_clk))
-		return PTR_ERR(cpufreq->cpu_clk);
+	dev_info(&pdev->dev, "hardware version 0x%x 0x%x\n",
+		 versions[0], versions[1]);
 
-	cpufreq->pll_x_clk = clk_get_sys(NULL, "pll_x");
-	if (IS_ERR(cpufreq->pll_x_clk)) {
-		err = PTR_ERR(cpufreq->pll_x_clk);
-		goto put_cpu;
+	opp_table = dev_pm_opp_set_supported_hw(get_cpu_device(0), versions, 2);
+	err = PTR_ERR_OR_ZERO(opp_table);
+	if (err) {
+		dev_err(&pdev->dev, "failed to set supported hw: %d\n", err);
+		return err;
 	}
 
-	cpufreq->pll_p_clk = clk_get_sys(NULL, "pll_p");
-	if (IS_ERR(cpufreq->pll_p_clk)) {
-		err = PTR_ERR(cpufreq->pll_p_clk);
-		goto put_pll_x;
+	cpufreq_dt = platform_device_register_simple("cpufreq-dt", -1, NULL, 0);
+	err = PTR_ERR_OR_ZERO(cpufreq_dt);
+	if (err) {
+		dev_err(&pdev->dev,
+			"failed to create cpufreq-dt device: %d\n", err);
+		goto err_put_supported_hw;
 	}
 
-	cpufreq->dev = &pdev->dev;
-	cpufreq->driver.get = cpufreq_generic_get;
-	cpufreq->driver.attr = cpufreq_generic_attr;
-	cpufreq->driver.init = tegra_cpu_init;
-	cpufreq->driver.exit = tegra_cpu_exit;
-	cpufreq->driver.flags = CPUFREQ_NEED_INITIAL_FREQ_CHECK;
-	cpufreq->driver.verify = cpufreq_generic_frequency_table_verify;
-	cpufreq->driver.suspend = cpufreq_generic_suspend;
-	cpufreq->driver.driver_data = cpufreq;
-	cpufreq->driver.target_index = tegra_target;
-	cpufreq->driver.get_intermediate = tegra_get_intermediate;
-	cpufreq->driver.target_intermediate = tegra_target_intermediate;
-	snprintf(cpufreq->driver.name, CPUFREQ_NAME_LEN, "tegra");
-
-	err = cpufreq_register_driver(&cpufreq->driver);
-	if (err)
-		goto put_pll_p;
-
-	platform_set_drvdata(pdev, cpufreq);
+	platform_set_drvdata(pdev, cpufreq_dt);
 
 	return 0;
 
-put_pll_p:
-	clk_put(cpufreq->pll_p_clk);
-put_pll_x:
-	clk_put(cpufreq->pll_x_clk);
-put_cpu:
-	clk_put(cpufreq->cpu_clk);
+err_put_supported_hw:
+	dev_pm_opp_put_supported_hw(opp_table);
 
 	return err;
 }
 
 static int tegra20_cpufreq_remove(struct platform_device *pdev)
 {
-	struct tegra20_cpufreq *cpufreq = platform_get_drvdata(pdev);
+	struct platform_device *cpufreq_dt;
+	struct opp_table *opp_table;
 
-	cpufreq_unregister_driver(&cpufreq->driver);
+	cpufreq_dt = platform_get_drvdata(pdev);
+	platform_device_unregister(cpufreq_dt);
 
-	clk_put(cpufreq->pll_p_clk);
-	clk_put(cpufreq->pll_x_clk);
-	clk_put(cpufreq->cpu_clk);
+	opp_table = dev_pm_opp_get_opp_table(get_cpu_device(0));
+	dev_pm_opp_put_supported_hw(opp_table);
+	dev_pm_opp_put_opp_table(opp_table);
 
 	return 0;
 }
-- 
2.23.0


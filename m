Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 512C02BFD8B
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Nov 2020 01:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727131AbgKWAba (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 22 Nov 2020 19:31:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbgKWAb2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 22 Nov 2020 19:31:28 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC967C061A4A;
        Sun, 22 Nov 2020 16:31:27 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id u18so21416496lfd.9;
        Sun, 22 Nov 2020 16:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+IS3ngzw+o8R0wZFe8WaLWpimXmP1vEtTVJ8S/5JdtM=;
        b=iGuYsNHySAVwKTZwS4KgkZMnvFCNSLCnYsCDijl711gu6/Q2GhH1g4QViwDL4iaA4k
         Z524MMgKQA/mgOUJ1a5oi5KtdSqgmlOm0iNuUVKgxYpIspsCzroSGy46SzhyTl32SWNT
         81vtwDNMIgzMaf+uDY4wEafEkdGQwRAz+8M2s0yDKs5+8MjTXxyN9a8qXdgNXrSb76kY
         j1gl5c8LLY1m4VUCQKpiuMVKJFA9lQS2ofjZPglTHr+OlWx5uiPzXY3TCI8a7nofedzn
         ou+rmpFw6kvZ5DU0F6vJ61goUs35av6KR2GnTsTvuAajy6lk1gzxDqAWgEoF3737CauI
         IriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+IS3ngzw+o8R0wZFe8WaLWpimXmP1vEtTVJ8S/5JdtM=;
        b=IpRI1u17WZl6r6NfUB1rdO3RgQXRgf4GhsYJwct/GZ+UeWmy4xMzWViv5mAU3kiVAI
         WwjrgnI2nAzywXJ0SX/fkuA9vyEmQlpqzG18hafF+1aEdYFHRWkXNU5D+LFQn0K9vnSC
         wGb7Bf8NsfmqA+6AoS35ANnMhWwf8233cqyqLJHUyWE4XU9V0UI9SnF3LXgRVwHmrrH4
         QxejPILkWOShMaSAIpHNFQF+xjrSszV0zaDeIhEgLzscA7KfbCxUPhsTS7GhxfN6DUW8
         scsMOscfr0x7UAQzFnJX+1t/O5Ell/0ipU7ZqTGN7Qsd+E4GHENpnTJTQRiLnVosgxeG
         6b/A==
X-Gm-Message-State: AOAM532frj/7sG0YZaWkyAbqNXF5FPqi3UPHiaaOZodtcKypJV+RO5A0
        FI5RT6bCFC46wFB7f3imDD8=
X-Google-Smtp-Source: ABdhPJzItnrptp4yn9IUMfMYjUECZMVt5vrQzBSw+PRx6LNLvtL5L1zgyEwznjH03oiZHoiWjj09hQ==
X-Received: by 2002:a19:c8d3:: with SMTP id y202mr11968996lff.454.1606091486275;
        Sun, 22 Nov 2020 16:31:26 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru. [109.252.193.159])
        by smtp.gmail.com with ESMTPSA id r27sm1225823lfn.290.2020.11.22.16.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 16:31:25 -0800 (PST)
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
        Mikko Perttunen <cyndis@kapsi.fi>,
        Viresh Kumar <vireshk@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v10 11/19] PM / devfreq: tegra20: Deprecate in a favor of emc-stat based driver
Date:   Mon, 23 Nov 2020 03:27:15 +0300
Message-Id: <20201123002723.28463-12-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123002723.28463-1-digetx@gmail.com>
References: <20201123002723.28463-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Remove tegra20-devfreq in order to replace it with a EMC_STAT based
devfreq driver. Previously we were going to use MC_STAT based
tegra20-devfreq driver because EMC_STAT wasn't working properly, but
now that problem is resolved. This resolves complications imposed by
the removed driver since it was depending on both EMC and MC drivers
simultaneously.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 MAINTAINERS                       |   1 -
 drivers/devfreq/Kconfig           |  10 --
 drivers/devfreq/Makefile          |   1 -
 drivers/devfreq/tegra20-devfreq.c | 210 ------------------------------
 4 files changed, 222 deletions(-)
 delete mode 100644 drivers/devfreq/tegra20-devfreq.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f10105cac6f..56c560320f00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11370,7 +11370,6 @@ L:	linux-pm@vger.kernel.org
 L:	linux-tegra@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git
 S:	Maintained
-F:	drivers/devfreq/tegra20-devfreq.c
 F:	drivers/devfreq/tegra30-devfreq.c
 
 MEMORY MANAGEMENT
diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index 0ee36ae2fa79..00704efe6398 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -121,16 +121,6 @@ config ARM_TEGRA_DEVFREQ
 	  It reads ACTMON counters of memory controllers and adjusts the
 	  operating frequencies and voltages with OPP support.
 
-config ARM_TEGRA20_DEVFREQ
-	tristate "NVIDIA Tegra20 DEVFREQ Driver"
-	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
-	depends on COMMON_CLK
-	select DEVFREQ_GOV_SIMPLE_ONDEMAND
-	help
-	  This adds the DEVFREQ driver for the Tegra20 family of SoCs.
-	  It reads Memory Controller counters and adjusts the operating
-	  frequencies and voltages with OPP support.
-
 config ARM_RK3399_DMC_DEVFREQ
 	tristate "ARM RK3399 DMC DEVFREQ Driver"
 	depends on (ARCH_ROCKCHIP && HAVE_ARM_SMCCC) || \
diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
index 3ca1ad0ecb97..a16333ea7034 100644
--- a/drivers/devfreq/Makefile
+++ b/drivers/devfreq/Makefile
@@ -13,7 +13,6 @@ obj-$(CONFIG_ARM_IMX_BUS_DEVFREQ)	+= imx-bus.o
 obj-$(CONFIG_ARM_IMX8M_DDRC_DEVFREQ)	+= imx8m-ddrc.o
 obj-$(CONFIG_ARM_RK3399_DMC_DEVFREQ)	+= rk3399_dmc.o
 obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+= tegra30-devfreq.o
-obj-$(CONFIG_ARM_TEGRA20_DEVFREQ)	+= tegra20-devfreq.o
 
 # DEVFREQ Event Drivers
 obj-$(CONFIG_PM_DEVFREQ_EVENT)		+= event/
diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
deleted file mode 100644
index fd801534771d..000000000000
--- a/drivers/devfreq/tegra20-devfreq.c
+++ /dev/null
@@ -1,210 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * NVIDIA Tegra20 devfreq driver
- *
- * Copyright (C) 2019 GRATE-DRIVER project
- */
-
-#include <linux/clk.h>
-#include <linux/devfreq.h>
-#include <linux/io.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/of_device.h>
-#include <linux/platform_device.h>
-#include <linux/pm_opp.h>
-#include <linux/slab.h>
-
-#include <soc/tegra/mc.h>
-
-#include "governor.h"
-
-#define MC_STAT_CONTROL				0x90
-#define MC_STAT_EMC_CLOCK_LIMIT			0xa0
-#define MC_STAT_EMC_CLOCKS			0xa4
-#define MC_STAT_EMC_CONTROL			0xa8
-#define MC_STAT_EMC_COUNT			0xb8
-
-#define EMC_GATHER_CLEAR			(1 << 8)
-#define EMC_GATHER_ENABLE			(3 << 8)
-
-struct tegra_devfreq {
-	struct devfreq *devfreq;
-	struct clk *emc_clock;
-	void __iomem *regs;
-};
-
-static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
-				u32 flags)
-{
-	struct tegra_devfreq *tegra = dev_get_drvdata(dev);
-	struct devfreq *devfreq = tegra->devfreq;
-	struct dev_pm_opp *opp;
-	unsigned long rate;
-	int err;
-
-	opp = devfreq_recommended_opp(dev, freq, flags);
-	if (IS_ERR(opp))
-		return PTR_ERR(opp);
-
-	rate = dev_pm_opp_get_freq(opp);
-	dev_pm_opp_put(opp);
-
-	err = clk_set_min_rate(tegra->emc_clock, rate);
-	if (err)
-		return err;
-
-	err = clk_set_rate(tegra->emc_clock, 0);
-	if (err)
-		goto restore_min_rate;
-
-	return 0;
-
-restore_min_rate:
-	clk_set_min_rate(tegra->emc_clock, devfreq->previous_freq);
-
-	return err;
-}
-
-static int tegra_devfreq_get_dev_status(struct device *dev,
-					struct devfreq_dev_status *stat)
-{
-	struct tegra_devfreq *tegra = dev_get_drvdata(dev);
-
-	/*
-	 * EMC_COUNT returns number of memory events, that number is lower
-	 * than the number of clocks. Conversion ratio of 1/8 results in a
-	 * bit higher bandwidth than actually needed, it is good enough for
-	 * the time being because drivers don't support requesting minimum
-	 * needed memory bandwidth yet.
-	 *
-	 * TODO: adjust the ratio value once relevant drivers will support
-	 * memory bandwidth management.
-	 */
-	stat->busy_time = readl_relaxed(tegra->regs + MC_STAT_EMC_COUNT);
-	stat->total_time = readl_relaxed(tegra->regs + MC_STAT_EMC_CLOCKS) / 8;
-	stat->current_frequency = clk_get_rate(tegra->emc_clock);
-
-	writel_relaxed(EMC_GATHER_CLEAR, tegra->regs + MC_STAT_CONTROL);
-	writel_relaxed(EMC_GATHER_ENABLE, tegra->regs + MC_STAT_CONTROL);
-
-	return 0;
-}
-
-static struct devfreq_dev_profile tegra_devfreq_profile = {
-	.polling_ms	= 500,
-	.target		= tegra_devfreq_target,
-	.get_dev_status	= tegra_devfreq_get_dev_status,
-};
-
-static struct tegra_mc *tegra_get_memory_controller(void)
-{
-	struct platform_device *pdev;
-	struct device_node *np;
-	struct tegra_mc *mc;
-
-	np = of_find_compatible_node(NULL, NULL, "nvidia,tegra20-mc-gart");
-	if (!np)
-		return ERR_PTR(-ENOENT);
-
-	pdev = of_find_device_by_node(np);
-	of_node_put(np);
-	if (!pdev)
-		return ERR_PTR(-ENODEV);
-
-	mc = platform_get_drvdata(pdev);
-	if (!mc)
-		return ERR_PTR(-EPROBE_DEFER);
-
-	return mc;
-}
-
-static int tegra_devfreq_probe(struct platform_device *pdev)
-{
-	struct tegra_devfreq *tegra;
-	struct tegra_mc *mc;
-	unsigned long max_rate;
-	unsigned long rate;
-	int err;
-
-	mc = tegra_get_memory_controller();
-	if (IS_ERR(mc)) {
-		err = PTR_ERR(mc);
-		dev_err(&pdev->dev, "failed to get memory controller: %d\n",
-			err);
-		return err;
-	}
-
-	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
-	if (!tegra)
-		return -ENOMEM;
-
-	/* EMC is a system-critical clock that is always enabled */
-	tegra->emc_clock = devm_clk_get(&pdev->dev, "emc");
-	if (IS_ERR(tegra->emc_clock))
-		return dev_err_probe(&pdev->dev, PTR_ERR(tegra->emc_clock),
-				     "failed to get emc clock\n");
-
-	tegra->regs = mc->regs;
-
-	max_rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
-
-	for (rate = 0; rate <= max_rate; rate++) {
-		rate = clk_round_rate(tegra->emc_clock, rate);
-
-		err = dev_pm_opp_add(&pdev->dev, rate, 0);
-		if (err) {
-			dev_err(&pdev->dev, "failed to add opp: %d\n", err);
-			goto remove_opps;
-		}
-	}
-
-	/*
-	 * Reset statistic gathers state, select global bandwidth for the
-	 * statistics collection mode and set clocks counter saturation
-	 * limit to maximum.
-	 */
-	writel_relaxed(0x00000000, tegra->regs + MC_STAT_CONTROL);
-	writel_relaxed(0x00000000, tegra->regs + MC_STAT_EMC_CONTROL);
-	writel_relaxed(0xffffffff, tegra->regs + MC_STAT_EMC_CLOCK_LIMIT);
-
-	platform_set_drvdata(pdev, tegra);
-
-	tegra->devfreq = devfreq_add_device(&pdev->dev, &tegra_devfreq_profile,
-					    DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
-	if (IS_ERR(tegra->devfreq)) {
-		err = PTR_ERR(tegra->devfreq);
-		goto remove_opps;
-	}
-
-	return 0;
-
-remove_opps:
-	dev_pm_opp_remove_all_dynamic(&pdev->dev);
-
-	return err;
-}
-
-static int tegra_devfreq_remove(struct platform_device *pdev)
-{
-	struct tegra_devfreq *tegra = platform_get_drvdata(pdev);
-
-	devfreq_remove_device(tegra->devfreq);
-	dev_pm_opp_remove_all_dynamic(&pdev->dev);
-
-	return 0;
-}
-
-static struct platform_driver tegra_devfreq_driver = {
-	.probe		= tegra_devfreq_probe,
-	.remove		= tegra_devfreq_remove,
-	.driver		= {
-		.name	= "tegra20-devfreq",
-	},
-};
-module_platform_driver(tegra_devfreq_driver);
-
-MODULE_ALIAS("platform:tegra20-devfreq");
-MODULE_AUTHOR("Dmitry Osipenko <digetx@gmail.com>");
-MODULE_DESCRIPTION("NVIDIA Tegra20 devfreq driver");
-MODULE_LICENSE("GPL v2");
-- 
2.29.2


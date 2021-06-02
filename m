Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22805399001
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Jun 2021 18:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhFBQdw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Jun 2021 12:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbhFBQdw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 12:33:52 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D424C06174A
        for <linux-tegra@vger.kernel.org>; Wed,  2 Jun 2021 09:31:53 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id b17so3737174ede.0
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 09:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+qKue6U7UtlOxNkkTzpg7z2vu2fhSX6WrgUeDwEvxC8=;
        b=C/hvUHuUkmaa6HxrpDruLVlcLgEOFkryfwJ2R/CKR8NCgV/qj/zuVIFkk89Np96nT8
         554V9fnZnzfHJYDaN6M1VXOjS3smMtP3DrLIy/wfhxDqKlCRa49/KVfuPhJxQXS/fLm7
         FVjbbnfRNoUfWsk9plVWCSIvR1Q/yumU8JG6g71OLP4Uu2aj+bdW0VxjK5nCWSN1B5NL
         1p0Km0OSGNA6Bovb8+AMERJkaw28SZbm8VY69KaursLihQlxvtrZ2TIxr5DrRyO1mmyu
         +KiO4jye0cnbdxfxibBlHhV8NBCzUq7VXOphlbERo7DGOPkMLH5jThLQNiIG9JRdn/gq
         K5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+qKue6U7UtlOxNkkTzpg7z2vu2fhSX6WrgUeDwEvxC8=;
        b=o61GiXinxqj496ErjBuvk1dWGTj4+1puPe6EoQOLASegSVxn22YSjAXwAE9KjIqxMK
         vJNJw0Z9F/qNBfpTmk+PI1Smcg1OxzpRYaTeZRlG9cKrVe7BpeyE9E8raK+5jG8hakUU
         twAGExLQxq1elrvB/5mIZcI4nFfdEvdMbj/JQQqH8qGkhs5p2GsggiihAsFOmUMwE+by
         B4DD/Y69PAnIivbDdsWLneGEz27MMoCdCU8YuN0Pgog9hmJPxAOtCSWap9zkdVW9Xf0H
         ACzUSQMb8gpUUM0AI181iLiVu0ScUEuwx4KGbocj3UzLGf/3a1oDwA2f7OE69MXKbHrn
         T9LA==
X-Gm-Message-State: AOAM533ahs0dolsuNXTajbqrGuG3w7AQKDHGU5Xb298YpeZOq7lC01mS
        sNpFg7lktDf1tHFpq97mU6Y=
X-Google-Smtp-Source: ABdhPJyzT7eDRKtrcHCdrLl3cdkzpKg2FG+cSBsoLezIT72cb0OJhP6pHFsEgH63GX+sfkVRu5oSfQ==
X-Received: by 2002:a05:6402:35c4:: with SMTP id z4mr38993077edc.362.1622651512039;
        Wed, 02 Jun 2021 09:31:52 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id t18sm244943edw.47.2021.06.02.09.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:31:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 10/12] memory: tegra: Unify drivers
Date:   Wed,  2 Jun 2021 18:33:00 +0200
Message-Id: <20210602163302.120041-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602163302.120041-1-thierry.reding@gmail.com>
References: <20210602163302.120041-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra210 (and earlier) driver now supports all the functionality
that the Tegra186 (and later) driver does, so they can be unified.

Note that previously the Tegra186 (and later) driver could be unloaded,
even if that was perhaps not very useful. Older chips don't support that
yet, but once they do this code can be reenabled.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- remove commented-out code for partial driver removal support

 drivers/memory/tegra/Makefile   |   6 +-
 drivers/memory/tegra/mc.c       |   8 ++-
 drivers/memory/tegra/mc.h       |   8 +++
 drivers/memory/tegra/tegra186.c | 117 +++++++-------------------------
 include/soc/tegra/mc.h          |   1 +
 5 files changed, 45 insertions(+), 95 deletions(-)

diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
index 6c1a2ecc6628..1af0fefacdda 100644
--- a/drivers/memory/tegra/Makefile
+++ b/drivers/memory/tegra/Makefile
@@ -7,6 +7,8 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_114_SOC) += tegra114.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_124_SOC) += tegra124.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_132_SOC) += tegra124.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
+tegra-mc-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o
+tegra-mc-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186.o
 
 obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
 
@@ -15,7 +17,7 @@ obj-$(CONFIG_TEGRA30_EMC)  += tegra30-emc.o
 obj-$(CONFIG_TEGRA124_EMC) += tegra124-emc.o
 obj-$(CONFIG_TEGRA210_EMC_TABLE) += tegra210-emc-table.o
 obj-$(CONFIG_TEGRA210_EMC) += tegra210-emc.o
-obj-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o tegra186-emc.o
-obj-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186.o tegra186-emc.o
+obj-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186-emc.o
+obj-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186-emc.o
 
 tegra210-emc-y := tegra210-emc-core.o tegra210-emc-cc-r21021.o
diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 4aa17bdd6392..11b83de9361c 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -39,7 +39,13 @@ static const struct of_device_id tegra_mc_of_match[] = {
 #ifdef CONFIG_ARCH_TEGRA_210_SOC
 	{ .compatible = "nvidia,tegra210-mc", .data = &tegra210_mc_soc },
 #endif
-	{ }
+#ifdef CONFIG_ARCH_TEGRA_186_SOC
+	{ .compatible = "nvidia,tegra186-mc", .data = &tegra186_mc_soc },
+#endif
+#ifdef CONFIG_ARCH_TEGRA_194_SOC
+	{ .compatible = "nvidia,tegra194-mc", .data = &tegra194_mc_soc },
+#endif
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
 
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 83c605e42e9a..24f95e06d18a 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -129,6 +129,14 @@ extern const struct tegra_mc_soc tegra132_mc_soc;
 extern const struct tegra_mc_soc tegra210_mc_soc;
 #endif
 
+#ifdef CONFIG_ARCH_TEGRA_186_SOC
+extern const struct tegra_mc_soc tegra186_mc_soc;
+#endif
+
+#ifdef CONFIG_ARCH_TEGRA_194_SOC
+extern const struct tegra_mc_soc tegra194_mc_soc;
+#endif
+
 #if defined(CONFIG_ARCH_TEGRA_3x_SOC) || \
     defined(CONFIG_ARCH_TEGRA_114_SOC) || \
     defined(CONFIG_ARCH_TEGRA_124_SOC) || \
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 9d3fdb609d55..20efbbea587b 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2017 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2017-2021 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/io.h>
@@ -45,6 +45,24 @@ static void tegra186_mc_program_sid(struct tegra_mc *mc)
 	}
 }
 
+static int tegra186_mc_probe(struct tegra_mc *mc)
+{
+	int err;
+
+	err = of_platform_populate(mc->dev->of_node, NULL, NULL, mc->dev);
+	if (err < 0)
+		return err;
+
+	tegra186_mc_program_sid(mc);
+
+	return 0;
+}
+
+static void tegra186_mc_remove(struct tegra_mc *mc)
+{
+	of_platform_depopulate(mc->dev);
+}
+
 static int tegra186_mc_resume(struct tegra_mc *mc)
 {
 	tegra186_mc_program_sid(mc);
@@ -53,6 +71,8 @@ static int tegra186_mc_resume(struct tegra_mc *mc)
 }
 
 static const struct tegra_mc_ops tegra186_mc_ops = {
+	.probe = tegra186_mc_probe,
+	.remove = tegra186_mc_remove,
 	.resume = tegra186_mc_resume,
 };
 
@@ -709,9 +729,10 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 	},
 };
 
-static const struct tegra_mc_soc tegra186_mc_soc = {
+const struct tegra_mc_soc tegra186_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra186_mc_clients),
 	.clients = tegra186_mc_clients,
+	.num_address_bits = 40,
 	.ops = &tegra186_mc_ops,
 };
 #endif
@@ -1918,98 +1939,10 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 	},
 };
 
-static const struct tegra_mc_soc tegra194_mc_soc = {
+const struct tegra_mc_soc tegra194_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra194_mc_clients),
 	.clients = tegra194_mc_clients,
+	.num_address_bits = 40,
 	.ops = &tegra186_mc_ops,
 };
 #endif
-
-static int tegra186_mc_probe(struct platform_device *pdev)
-{
-	struct resource *res;
-	struct tegra_mc *mc;
-	int err;
-
-	mc = devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
-	if (!mc)
-		return -ENOMEM;
-
-	mc->soc = of_device_get_match_data(&pdev->dev);
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mc->regs = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(mc->regs))
-		return PTR_ERR(mc->regs);
-
-	mc->dev = &pdev->dev;
-
-	err = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
-	if (err < 0)
-		return err;
-
-	platform_set_drvdata(pdev, mc);
-	tegra186_mc_program_sid(mc);
-
-	return 0;
-}
-
-static int tegra186_mc_remove(struct platform_device *pdev)
-{
-	struct tegra_mc *mc = platform_get_drvdata(pdev);
-
-	of_platform_depopulate(mc->dev);
-
-	return 0;
-}
-
-static const struct of_device_id tegra186_mc_of_match[] = {
-#if defined(CONFIG_ARCH_TEGRA_186_SOC)
-	{ .compatible = "nvidia,tegra186-mc", .data = &tegra186_mc_soc },
-#endif
-#if defined(CONFIG_ARCH_TEGRA_194_SOC)
-	{ .compatible = "nvidia,tegra194-mc", .data = &tegra194_mc_soc },
-#endif
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, tegra186_mc_of_match);
-
-static int __maybe_unused tegra_mc_suspend(struct device *dev)
-{
-	struct tegra_mc *mc = dev_get_drvdata(dev);
-
-	if (mc->soc->ops && mc->soc->ops->suspend)
-		return mc->soc->ops->suspend(mc);
-
-	return 0;
-}
-
-static int __maybe_unused tegra_mc_resume(struct device *dev)
-{
-	struct tegra_mc *mc = dev_get_drvdata(dev);
-
-	if (mc->soc->ops && mc->soc->ops->resume)
-		return mc->soc->ops->resume(mc);
-
-	return 0;
-}
-
-static const struct dev_pm_ops tegra186_mc_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(tegra_mc_suspend, tegra_mc_resume)
-};
-
-static struct platform_driver tegra186_mc_driver = {
-	.driver = {
-		.name = "tegra186-mc",
-		.of_match_table = tegra186_mc_of_match,
-		.pm = &tegra186_mc_pm_ops,
-		.suppress_bind_attrs = true,
-	},
-	.probe = tegra186_mc_probe,
-	.remove = tegra186_mc_remove,
-};
-module_platform_driver(tegra186_mc_driver);
-
-MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
-MODULE_DESCRIPTION("NVIDIA Tegra186 Memory Controller driver");
-MODULE_LICENSE("GPL v2");
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 87668ebab2a1..1bd5aed81868 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -176,6 +176,7 @@ struct tegra_mc_ops {
 	 * after basic, common set up that is done by the SoC-agnostic bits.
 	 */
 	int (*probe)(struct tegra_mc *mc);
+	void (*remove)(struct tegra_mc *mc);
 	int (*suspend)(struct tegra_mc *mc);
 	int (*resume)(struct tegra_mc *mc);
 	irqreturn_t (*handle_irq)(int irq, void *data);
-- 
2.31.1


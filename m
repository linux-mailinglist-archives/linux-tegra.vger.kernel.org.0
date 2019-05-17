Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC21721881
	for <lists+linux-tegra@lfdr.de>; Fri, 17 May 2019 14:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728789AbfEQMlU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 May 2019 08:41:20 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:6684 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728474AbfEQMlU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 May 2019 08:41:20 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdeabf40000>; Fri, 17 May 2019 05:41:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 17 May 2019 05:41:17 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 17 May 2019 05:41:17 -0700
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 May
 2019 12:41:17 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 17 May 2019 12:41:17 +0000
Received: from vidyas-desktop.nvidia.com (Not Verified[10.24.37.38]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cdeabe70000>; Fri, 17 May 2019 05:41:17 -0700
From:   Vidya Sagar <vidyas@nvidia.com>
To:     <lorenzo.pieralisi@arm.com>, <bhelgaas@google.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <kishon@ti.com>, <catalin.marinas@arm.com>, <will.deacon@arm.com>,
        <jingoohan1@gmail.com>, <gustavo.pimentel@synopsys.com>
CC:     <mperttunen@nvidia.com>, <linux-pci@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kthota@nvidia.com>,
        <mmaddireddy@nvidia.com>, <vidyas@nvidia.com>, <sagar.tv@gmail.com>
Subject: [PATCH V7 13/15] phy: tegra: Add PCIe PIPE2UPHY support
Date:   Fri, 17 May 2019 18:08:44 +0530
Message-ID: <20190517123846.3708-14-vidyas@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517123846.3708-1-vidyas@nvidia.com>
References: <20190517123846.3708-1-vidyas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558096884; bh=ZW8IGPScpMHdaXmZBYnxcCNOtw5lRrCLGi3OCgfeBuY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=hpmFKy14xuvmzvkCqp2SA/pHH4K62Q1QCHO4VQu9yIkYHAkFwBvJ1WoBuQC9vNl7v
         I7fdkP3TgyXtNjGCFJ5PFvahAHHavvdxWggCvyA9bCExPHXhjgqnA4EQyFql5gCdFG
         qUicCNWMtEtZIT6qOCjgQn0fdB/7QI/icnco6T7lWhNpLCH1pT0nDO/jAer1sXr7nk
         kKVj6nEBXnxUT4LfX9u28vAgMrszAs8w9ZpghSEBsH4cLs2AdMthEFf8RdmTP2DCZ/
         dbxnIsuQOhNCIC4Au0LHbUIQ9I1iQIbaO/vxSp/Wh6S3wAGeMrVKAnLVautvLoShac
         v4NwGKndAKaFA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Synopsys DesignWare core based PCIe controllers in Tegra 194 SoC interface
with Universal PHY (UPHY) module through a PIPE2UPHY (P2U) module.
For each PCIe lane of a controller, there is a P2U unit instantiated at
hardware level. This driver provides support for the programming required
for each P2U that is going to be used for a PCIe controller.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
Changes since [v6]:
* None

Changes since [v5]:
* Addressed review comments from Thierry

Changes since [v4]:
* None

Changes since [v3]:
* Rebased on top of linux-next top of the tree

Changes since [v2]:
* Replaced spaces with tabs in Kconfig file
* Sorted header file inclusion alphabetically

Changes since [v1]:
* Added COMPILE_TEST in Kconfig
* Removed empty phy_ops implementations
* Modified code according to DT documentation file modifications

 drivers/phy/tegra/Kconfig             |   7 ++
 drivers/phy/tegra/Makefile            |   1 +
 drivers/phy/tegra/pcie-p2u-tegra194.c | 109 ++++++++++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 drivers/phy/tegra/pcie-p2u-tegra194.c

diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
index a3b1de953fb7..06d423fa85b4 100644
--- a/drivers/phy/tegra/Kconfig
+++ b/drivers/phy/tegra/Kconfig
@@ -6,3 +6,10 @@ config PHY_TEGRA_XUSB
 
 	  To compile this driver as a module, choose M here: the module will
 	  be called phy-tegra-xusb.
+
+config PHY_TEGRA194_PCIE_P2U
+	tristate "NVIDIA Tegra P2U PHY Driver"
+	depends on ARCH_TEGRA || COMPILE_TEST
+	select GENERIC_PHY
+	help
+	  Enable this to support the P2U (PIPE to UPHY) that is part of Tegra 19x SOCs.
diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
index a93cd9a499b2..1aaca794f40c 100644
--- a/drivers/phy/tegra/Makefile
+++ b/drivers/phy/tegra/Makefile
@@ -5,3 +5,4 @@ phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_124_SOC) += xusb-tegra124.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_132_SOC) += xusb-tegra124.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_210_SOC) += xusb-tegra210.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_186_SOC) += xusb-tegra186.o
+obj-$(CONFIG_PHY_TEGRA194_PCIE_P2U) += pcie-p2u-tegra194.o
diff --git a/drivers/phy/tegra/pcie-p2u-tegra194.c b/drivers/phy/tegra/pcie-p2u-tegra194.c
new file mode 100644
index 000000000000..fae2afe1a1aa
--- /dev/null
+++ b/drivers/phy/tegra/pcie-p2u-tegra194.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * P2U (PIPE to UPHY) driver for Tegra T194 SoC
+ *
+ * Copyright (C) 2019 NVIDIA Corporation.
+ *
+ * Author: Vidya Sagar <vidyas@nvidia.com>
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/phy/phy.h>
+
+#define P2U_PERIODIC_EQ_CTRL_GEN3	0xc0
+#define P2U_PERIODIC_EQ_CTRL_GEN3_PERIODIC_EQ_EN		BIT(0)
+#define P2U_PERIODIC_EQ_CTRL_GEN3_INIT_PRESET_EQ_TRAIN_EN	BIT(1)
+#define P2U_PERIODIC_EQ_CTRL_GEN4	0xc4
+#define P2U_PERIODIC_EQ_CTRL_GEN4_INIT_PRESET_EQ_TRAIN_EN	BIT(1)
+
+#define P2U_RX_DEBOUNCE_TIME				0xa4
+#define P2U_RX_DEBOUNCE_TIME_DEBOUNCE_TIMER_MASK	0xffff
+#define P2U_RX_DEBOUNCE_TIME_DEBOUNCE_TIMER_VAL		160
+
+struct tegra_p2u {
+	void __iomem *base;
+};
+
+static int tegra_p2u_power_on(struct phy *x)
+{
+	struct tegra_p2u *phy = phy_get_drvdata(x);
+	u32 val;
+
+	val = readl(phy->base + P2U_PERIODIC_EQ_CTRL_GEN3);
+	val &= ~P2U_PERIODIC_EQ_CTRL_GEN3_PERIODIC_EQ_EN;
+	val |= P2U_PERIODIC_EQ_CTRL_GEN3_INIT_PRESET_EQ_TRAIN_EN;
+	writel(val, phy->base + P2U_PERIODIC_EQ_CTRL_GEN3);
+
+	val = readl(phy->base + P2U_PERIODIC_EQ_CTRL_GEN4);
+	val |= P2U_PERIODIC_EQ_CTRL_GEN4_INIT_PRESET_EQ_TRAIN_EN;
+	writel(val, phy->base + P2U_PERIODIC_EQ_CTRL_GEN4);
+
+	val = readl(phy->base + P2U_RX_DEBOUNCE_TIME);
+	val &= ~P2U_RX_DEBOUNCE_TIME_DEBOUNCE_TIMER_MASK;
+	val |= P2U_RX_DEBOUNCE_TIME_DEBOUNCE_TIMER_VAL;
+	writel(val, phy->base + P2U_RX_DEBOUNCE_TIME);
+
+	return 0;
+}
+
+static const struct phy_ops ops = {
+	.power_on = tegra_p2u_power_on,
+	.owner = THIS_MODULE,
+};
+
+static int tegra_p2u_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct phy *generic_phy;
+	struct tegra_p2u *phy;
+	struct resource *res;
+
+	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ctl");
+	phy->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(phy->base))
+		return PTR_ERR_OR_ZERO(phy->base);
+
+	platform_set_drvdata(pdev, phy);
+
+	generic_phy = devm_phy_create(dev, NULL, &ops);
+	if (IS_ERR(generic_phy))
+		return PTR_ERR_OR_ZERO(generic_phy);
+
+	phy_set_drvdata(generic_phy, phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider))
+		return PTR_ERR_OR_ZERO(phy_provider);
+
+	return 0;
+}
+
+static const struct of_device_id tegra_p2u_id_table[] = {
+	{
+		.compatible = "nvidia,tegra194-p2u",
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, tegra_p2u_id_table);
+
+static struct platform_driver tegra_p2u_driver = {
+	.probe = tegra_p2u_probe,
+	.driver = {
+		.name = "tegra194-p2u",
+		.of_match_table = tegra_p2u_id_table,
+	},
+};
+module_platform_driver(tegra_p2u_driver);
+
+MODULE_AUTHOR("Vidya Sagar <vidyas@nvidia.com>");
+MODULE_DESCRIPTION("NVIDIA Tegra PIPE2UPHY PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1


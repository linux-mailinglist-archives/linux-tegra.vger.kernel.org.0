Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4811FEF8
	for <lists+linux-tegra@lfdr.de>; Thu, 16 May 2019 07:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfEPFxi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 May 2019 01:53:38 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:8915 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbfEPFxi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 May 2019 01:53:38 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdcfae60000>; Wed, 15 May 2019 22:53:42 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 15 May 2019 22:53:35 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 15 May 2019 22:53:35 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 May
 2019 05:53:35 +0000
Received: from manikanta-bm2.nvidia.com (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 16 May 2019 05:53:32 +0000
From:   Manikanta Maddireddy <mmaddireddy@nvidia.com>
To:     <thierry.reding@gmail.com>, <bhelgaas@google.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <jonathanh@nvidia.com>, <lorenzo.pieralisi@arm.com>,
        <vidyas@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V4 06/28] PCI: tegra: Add PCIe Gen2 link speed support
Date:   Thu, 16 May 2019 11:22:45 +0530
Message-ID: <20190516055307.25737-7-mmaddireddy@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516055307.25737-1-mmaddireddy@nvidia.com>
References: <20190516055307.25737-1-mmaddireddy@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557986022; bh=/0i47jZIURS0+sx1zJ0Nhi9/E+jRmSm86XvBHfmIg38=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=OlhKAfcBf48oXB7oWW5o8pngkIG18av2/FtLV16YMK/y+WUZwA2pGPHen3+IxpAvl
         EIOhZA+GDSGhGU6hWr5lgZlagp9MjdkHhA8vGOC9k2HRrnjsMpMGpTnbGshjwW1xrP
         yR0EDW8eRpU4uOR9QZSLqvO+2YvMb1fDTTFFkezqI/tiP1OoayhmEi4+1Yx1hjL1D3
         UvuVciTFoBgXakeLRL6jxo7gkQLFjJWfp68xh8LqfyxdkGLl0sKaTZiwS+CCGgo7s5
         lVKitrrMb7yxbUk3HWdqefjf3p7YAec0ARUZdHVRdKriPwFFxmidDB/INIEOq0ePMS
         5bYZSeaFNia8g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra124, Tegra132, Tegra210 and Tegra186 support Gen2 link speed. After
PCIe link is up in Gen1, set target link speed as Gen2 and retrain link.
Link switches to Gen2 speed if Gen2 capable end point is connected, else
link stays in Gen1.

Per PCIe 4.0r0.9 sec 7.6.3.7 implementation note, driver need to wait for
PCIe LTSSM to come back from recovery before retraining the link.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
V4: No change

V3: Added blank line after each while loop.

V2: Changed "for loop" to "while", to make it compact and handled coding
style comments.

 drivers/pci/controller/pci-tegra.c | 64 ++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 015add4e345b..cd542a8af618 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -191,6 +191,8 @@
 #define  RP_LINK_CONTROL_STATUS_DL_LINK_ACTIVE	0x20000000
 #define  RP_LINK_CONTROL_STATUS_LINKSTAT_MASK	0x3fff0000
 
+#define RP_LINK_CONTROL_STATUS_2		0x000000b0
+
 #define PADS_CTL_SEL		0x0000009c
 
 #define PADS_CTL		0x000000a0
@@ -226,6 +228,7 @@
 #define PADS_REFCLK_CFG_DRVI_SHIFT		12 /* 15:12 */
 
 #define PME_ACK_TIMEOUT 10000
+#define LINK_RETRAIN_TIMEOUT 100000 /* in usec */
 
 struct tegra_msi {
 	struct msi_controller chip;
@@ -2089,6 +2092,64 @@ static bool tegra_pcie_port_check_link(struct tegra_pcie_port *port)
 	return false;
 }
 
+static void tegra_pcie_change_link_speed(struct tegra_pcie *pcie)
+{
+	struct device *dev = pcie->dev;
+	struct tegra_pcie_port *port, *tmp;
+	ktime_t deadline;
+	u32 value;
+
+	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
+		/*
+		 * "Supported Link Speeds Vector" in "Link Capabilities 2"
+		 * is not supported by Tegra. tegra_pcie_change_link_speed()
+		 * is called only for Tegra chips which support Gen2.
+		 * So there no harm if supported link speed is not verified.
+		 */
+		value = readl(port->base + RP_LINK_CONTROL_STATUS_2);
+		value &= ~PCI_EXP_LNKSTA_CLS;
+		value |= PCI_EXP_LNKSTA_CLS_5_0GB;
+		writel(value, port->base + RP_LINK_CONTROL_STATUS_2);
+
+		/*
+		 * Poll until link comes back from recovery to avoid race
+		 * condition.
+		 */
+		deadline = ktime_add_us(ktime_get(), LINK_RETRAIN_TIMEOUT);
+
+		while (ktime_before(ktime_get(), deadline)) {
+			value = readl(port->base + RP_LINK_CONTROL_STATUS);
+			if ((value & PCI_EXP_LNKSTA_LT) == 0)
+				break;
+
+			usleep_range(2000, 3000);
+		}
+
+		if (value & PCI_EXP_LNKSTA_LT)
+			dev_warn(dev, "PCIe port %u link is in recovery\n",
+				 port->index);
+
+		/* Retrain the link */
+		value = readl(port->base + RP_LINK_CONTROL_STATUS);
+		value |= PCI_EXP_LNKCTL_RL;
+		writel(value, port->base + RP_LINK_CONTROL_STATUS);
+
+		deadline = ktime_add_us(ktime_get(), LINK_RETRAIN_TIMEOUT);
+
+		while (ktime_before(ktime_get(), deadline)) {
+			value = readl(port->base + RP_LINK_CONTROL_STATUS);
+			if ((value & PCI_EXP_LNKSTA_LT) == 0)
+				break;
+
+			usleep_range(2000, 3000);
+		}
+
+		if (value & PCI_EXP_LNKSTA_LT)
+			dev_err(dev, "failed to retrain link of port %u\n",
+				port->index);
+	}
+}
+
 static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
@@ -2113,6 +2174,9 @@ static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
 		tegra_pcie_port_disable(port);
 		tegra_pcie_port_free(port);
 	}
+
+	if (pcie->soc->has_gen2)
+		tegra_pcie_change_link_speed(pcie);
 }
 
 static void tegra_pcie_disable_ports(struct tegra_pcie *pcie)
-- 
2.17.1


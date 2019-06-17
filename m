Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1306B48A66
	for <lists+linux-tegra@lfdr.de>; Mon, 17 Jun 2019 19:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728166AbfFQRkW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 17 Jun 2019 13:40:22 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:17047 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfFQRkW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jun 2019 13:40:22 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d07d0840000>; Mon, 17 Jun 2019 10:40:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 17 Jun 2019 10:40:19 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 17 Jun 2019 10:40:19 -0700
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 17 Jun
 2019 17:40:19 +0000
Received: from manikanta-bm2.nvidia.com (10.124.1.5) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Mon, 17 Jun 2019 17:40:16 +0000
From:   Manikanta Maddireddy <mmaddireddy@nvidia.com>
To:     <thierry.reding@gmail.com>, <bhelgaas@google.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <jonathanh@nvidia.com>, <lorenzo.pieralisi@arm.com>,
        <vidyas@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V5 06/27] PCI: tegra: Add PCIe Gen2 link speed support
Date:   Mon, 17 Jun 2019 23:09:31 +0530
Message-ID: <20190617173952.29363-7-mmaddireddy@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617173952.29363-1-mmaddireddy@nvidia.com>
References: <20190617173952.29363-1-mmaddireddy@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560793220; bh=I9g8S6i36JLsfwSYH2wGAHJGoGPyGwTF6SFjzPUpsOo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=J3b0kCMuh42UpAaVIonDqrZBwcXf1a5UuJ8hN1B+NtKAOB2YHWzLIsZjZfQwj2x8q
         Cw5za4syOyLtOH3+hrseX7LbiSDtVk3St60jvV3R8YWD+86mGdZ/EAYKiACXc7NQ9e
         MVYIaCA4Mhkq3hnjsYLy1oiy6ZxAFnwTW/nVXZpLNSl1pdU9Sko3hqDPT1M6gi0+X+
         fAkcp8G6cueUhE0JPTOKTCmx7JO4TDrGOrfnD9/MWM/za4AAtrWKQTs6eNr1nJLjMw
         tFgdpu01w/mRQxgkdZo7/IN020QGcyYy8lSeTCgbHVou4JKlVZ2XcfEg1zhWSkTB1b
         jSlVO4vn/ik0g==
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
V5: No change

V4: No change

V3: Added blank line after each while loop.

V2: Changed "for loop" to "while", to make it compact and handled coding
style comments.

 drivers/pci/controller/pci-tegra.c | 64 ++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 5e9fcef5f8eb..5d19067f7193 100644
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


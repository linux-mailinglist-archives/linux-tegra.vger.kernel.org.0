Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FEB8298729
	for <lists+linux-tegra@lfdr.de>; Mon, 26 Oct 2020 08:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1770823AbgJZGz3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 26 Oct 2020 02:55:29 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18194 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1768361AbgJZGz2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Oct 2020 02:55:28 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f9672cb0001>; Sun, 25 Oct 2020 23:55:07 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Oct
 2020 06:55:27 +0000
Received: from vidyas-desktop.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Mon, 26 Oct 2020 06:55:24 +0000
From:   Vidya Sagar <vidyas@nvidia.com>
To:     <lorenzo.pieralisi@arm.com>, <robh+dt@kernel.org>,
        <bhelgaas@google.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <amanharitsh123@gmail.com>,
        <dinghao.liu@zju.edu.cn>, <kw@linux.com>
CC:     <linux-pci@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kthota@nvidia.com>,
        <mmaddireddy@nvidia.com>, <vidyas@nvidia.com>, <sagar.tv@gmail.com>
Subject: [PATCH 4/4] PCI: tegra: Handle error conditions properly
Date:   Mon, 26 Oct 2020 12:24:59 +0530
Message-ID: <20201026065459.28509-5-vidyas@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201026065459.28509-1-vidyas@nvidia.com>
References: <20201026065459.28509-1-vidyas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603695307; bh=HrV4xUNlix0+NHaugkAxqshy+cP+yr3y7m2Ah0m5Bm4=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=N9n11gZBT59QymATtceA9DjmvE/3DqzMVKCho1o57vf2Rn3jWDpwl0/Bsqui1XJ7S
         XhEzWZ7Ws+jARojcHgpdGbZ/H2Q0+S20r4GzLQdWYFgDDpCU+9E3rVKwZyO9j9f2SK
         jeuWrfV4H2aLJmQwvbIvS7slQJ++oFVBVZO9utB4+f3h2a4YnzSf2U+XEg9naWPBn1
         zW0HkCJUbIc/5jxDZn2GBIMcklZtcrMOYvtnZ+MhUWDJgJUh29mE02f5pqu7CZy+RH
         Y71qTQmNHhMhvo9Oz2pMK+13NOuku05BmbtommHXbjhQwp8E5JtHnlf/xHwpgFPorG
         9W7f5vchmwRbw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Currently the driver checks for error value of different APIs during the
uninitialization sequence. It just returns from there if there is any error
observed for one of those calls. Comparatively it is better to continue the
uninitialization sequence irrespective of whether some of them are
returning error. That way, it is more closer to complete uninitialization.
It also adds checking return value for error for a cleaner exit path.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 45 ++++++++++------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 253d91033bc3..8c08998b9ce1 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1422,43 +1422,32 @@ static int tegra_pcie_config_controller(struct tegra_pcie_dw *pcie,
 	return ret;
 }
 
-static int __deinit_controller(struct tegra_pcie_dw *pcie)
+static void tegra_pcie_unconfig_controller(struct tegra_pcie_dw *pcie)
 {
 	int ret;
 
 	ret = reset_control_assert(pcie->core_rst);
-	if (ret) {
-		dev_err(pcie->dev, "Failed to assert \"core\" reset: %d\n",
-			ret);
-		return ret;
-	}
+	if (ret)
+		dev_err(pcie->dev, "Failed to assert \"core\" reset: %d\n", ret);
 
 	tegra_pcie_disable_phy(pcie);
 
 	ret = reset_control_assert(pcie->core_apb_rst);
-	if (ret) {
+	if (ret)
 		dev_err(pcie->dev, "Failed to assert APB reset: %d\n", ret);
-		return ret;
-	}
 
 	clk_disable_unprepare(pcie->core_clk);
 
 	ret = regulator_disable(pcie->pex_ctl_supply);
-	if (ret) {
+	if (ret)
 		dev_err(pcie->dev, "Failed to disable regulator: %d\n", ret);
-		return ret;
-	}
 
 	tegra_pcie_disable_slot_regulators(pcie);
 
 	ret = tegra_pcie_bpmp_set_ctrl_state(pcie, false);
-	if (ret) {
+	if (ret)
 		dev_err(pcie->dev, "Failed to disable controller %d: %d\n",
 			pcie->cid, ret);
-		return ret;
-	}
-
-	return ret;
 }
 
 static int tegra_pcie_init_controller(struct tegra_pcie_dw *pcie)
@@ -1482,7 +1471,8 @@ static int tegra_pcie_init_controller(struct tegra_pcie_dw *pcie)
 	return 0;
 
 fail_host_init:
-	return __deinit_controller(pcie);
+	tegra_pcie_unconfig_controller(pcie);
+	return ret;
 }
 
 static int tegra_pcie_try_link_l2(struct tegra_pcie_dw *pcie)
@@ -1551,13 +1541,12 @@ static void tegra_pcie_dw_pme_turnoff(struct tegra_pcie_dw *pcie)
 	appl_writel(pcie, data, APPL_PINMUX);
 }
 
-static int tegra_pcie_deinit_controller(struct tegra_pcie_dw *pcie)
+static void tegra_pcie_deinit_controller(struct tegra_pcie_dw *pcie)
 {
 	tegra_pcie_downstream_dev_to_D0(pcie);
 	dw_pcie_host_deinit(&pcie->pci.pp);
 	tegra_pcie_dw_pme_turnoff(pcie);
-
-	return __deinit_controller(pcie);
+	tegra_pcie_unconfig_controller(pcie);
 }
 
 static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
@@ -1590,7 +1579,11 @@ static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
 		goto fail_pm_get_sync;
 	}
 
-	tegra_pcie_init_controller(pcie);
+	ret = tegra_pcie_init_controller(pcie);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize controller: %d\n", ret);
+		goto fail_pm_get_sync;
+	}
 
 	pcie->link_state = tegra_pcie_dw_link_up(&pcie->pci);
 	if (!pcie->link_state) {
@@ -2238,8 +2231,9 @@ static int tegra_pcie_dw_suspend_noirq(struct device *dev)
 					       PORT_LOGIC_MSI_CTRL_INT_0_EN);
 	tegra_pcie_downstream_dev_to_D0(pcie);
 	tegra_pcie_dw_pme_turnoff(pcie);
+	tegra_pcie_unconfig_controller(pcie);
 
-	return __deinit_controller(pcie);
+	return 0;
 }
 
 static int tegra_pcie_dw_resume_noirq(struct device *dev)
@@ -2267,7 +2261,8 @@ static int tegra_pcie_dw_resume_noirq(struct device *dev)
 	return 0;
 
 fail_host_init:
-	return __deinit_controller(pcie);
+	tegra_pcie_unconfig_controller(pcie);
+	return ret;
 }
 
 static int tegra_pcie_dw_resume_early(struct device *dev)
@@ -2305,7 +2300,7 @@ static void tegra_pcie_dw_shutdown(struct platform_device *pdev)
 		disable_irq(pcie->pci.pp.msi_irq);
 
 	tegra_pcie_dw_pme_turnoff(pcie);
-	__deinit_controller(pcie);
+	tegra_pcie_unconfig_controller(pcie);
 }
 
 static const struct tegra_pcie_dw_of_data tegra_pcie_dw_rc_of_data = {
-- 
2.17.1


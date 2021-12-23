Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19CDD47DCB3
	for <lists+linux-tegra@lfdr.de>; Thu, 23 Dec 2021 02:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346017AbhLWBMg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 22 Dec 2021 20:12:36 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:57976 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345744AbhLWBLs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Dec 2021 20:11:48 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 26721CE1EFE;
        Thu, 23 Dec 2021 01:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDD3C36AEA;
        Thu, 23 Dec 2021 01:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640221904;
        bh=da32GrMecsebm7SuUZ0AlEjEM3Ft5LJCscRUp1dqa5k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lTtQcUxZ2HtjZgjoF/k2NFaPD6uIqgXcHu4AtA2ERmd9+DcDpo+/gSTfCZPVQOe0p
         qKTAXDnMDkn7PpWY9xjUY/TZnZhPNqUPCC4273XWJMIYcX2UoPzx9/gsekD69jblkx
         ZCqPxEWgsv7Gabwllx1jfwpBPNJTqzRbpn3s4b/fQTwAKTszqWHp6pnE/nuGBvMlsT
         xq/iYhKsL0NkCKurUHdsZr1IcpWUFLlrLOEf2d18OvuNLpZCA70o/RMXY5XFmIxnhe
         4ygrQfLb7cKuBWLBPalG/i58EnDUdJ95MelaWzMEBpbHubLnNAhEE5buxrYhlK5U8O
         rrrxx+eEKoaLw==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     linux-pci@vger.kernel.org, Fan Fei <ffclaire1224@gmail.com>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 19/23] PCI: tegra194: Rename tegra_pcie_dw to tegra194_pcie
Date:   Wed, 22 Dec 2021 19:10:50 -0600
Message-Id: <20211223011054.1227810-20-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223011054.1227810-1-helgaas@kernel.org>
References: <20211223011054.1227810-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Fan Fei <ffclaire1224@gmail.com>

Rename tegra_pcie_dw to tegra194_pcie to match the convention of
<driver>_pcie. No functional change intended.

[bhelgaas: rename functions similarly]
Signed-off-by: Fan Fei <ffclaire1224@gmail.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 222 ++++++++++-----------
 1 file changed, 111 insertions(+), 111 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 904976913081..b1b5f836a806 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -245,7 +245,7 @@ static const unsigned int pcie_gen_freq[] = {
 	GEN4_CORE_CLK_FREQ
 };
 
-struct tegra_pcie_dw {
+struct tegra194_pcie {
 	struct device *dev;
 	struct resource *appl_res;
 	struct resource *dbi_res;
@@ -289,22 +289,22 @@ struct tegra_pcie_dw {
 	int ep_state;
 };
 
-struct tegra_pcie_dw_of_data {
+struct tegra194_pcie_of_data {
 	enum dw_pcie_device_mode mode;
 };
 
-static inline struct tegra_pcie_dw *to_tegra_pcie(struct dw_pcie *pci)
+static inline struct tegra194_pcie *to_tegra_pcie(struct dw_pcie *pci)
 {
-	return container_of(pci, struct tegra_pcie_dw, pci);
+	return container_of(pci, struct tegra194_pcie, pci);
 }
 
-static inline void appl_writel(struct tegra_pcie_dw *pcie, const u32 value,
+static inline void appl_writel(struct tegra194_pcie *pcie, const u32 value,
 			       const u32 reg)
 {
 	writel_relaxed(value, pcie->appl_base + reg);
 }
 
-static inline u32 appl_readl(struct tegra_pcie_dw *pcie, const u32 reg)
+static inline u32 appl_readl(struct tegra194_pcie *pcie, const u32 reg)
 {
 	return readl_relaxed(pcie->appl_base + reg);
 }
@@ -316,7 +316,7 @@ struct tegra_pcie_soc {
 static void apply_bad_link_workaround(struct pcie_port *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
+	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
 	u32 current_link_width;
 	u16 val;
 
@@ -349,7 +349,7 @@ static void apply_bad_link_workaround(struct pcie_port *pp)
 
 static irqreturn_t tegra_pcie_rp_irq_handler(int irq, void *arg)
 {
-	struct tegra_pcie_dw *pcie = arg;
+	struct tegra194_pcie *pcie = arg;
 	struct dw_pcie *pci = &pcie->pci;
 	struct pcie_port *pp = &pci->pp;
 	u32 val, tmp;
@@ -420,7 +420,7 @@ static irqreturn_t tegra_pcie_rp_irq_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static void pex_ep_event_hot_rst_done(struct tegra_pcie_dw *pcie)
+static void pex_ep_event_hot_rst_done(struct tegra194_pcie *pcie)
 {
 	u32 val;
 
@@ -448,7 +448,7 @@ static void pex_ep_event_hot_rst_done(struct tegra_pcie_dw *pcie)
 
 static irqreturn_t tegra_pcie_ep_irq_thread(int irq, void *arg)
 {
-	struct tegra_pcie_dw *pcie = arg;
+	struct tegra194_pcie *pcie = arg;
 	struct dw_pcie *pci = &pcie->pci;
 	u32 val, speed;
 
@@ -494,7 +494,7 @@ static irqreturn_t tegra_pcie_ep_irq_thread(int irq, void *arg)
 
 static irqreturn_t tegra_pcie_ep_hard_irq(int irq, void *arg)
 {
-	struct tegra_pcie_dw *pcie = arg;
+	struct tegra194_pcie *pcie = arg;
 	struct dw_pcie_ep *ep = &pcie->pci.ep;
 	int spurious = 1;
 	u32 status_l0, status_l1, link_status;
@@ -537,7 +537,7 @@ static irqreturn_t tegra_pcie_ep_hard_irq(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static int tegra_pcie_dw_rd_own_conf(struct pci_bus *bus, u32 devfn, int where,
+static int tegra194_pcie_rd_own_conf(struct pci_bus *bus, u32 devfn, int where,
 				     int size, u32 *val)
 {
 	/*
@@ -554,7 +554,7 @@ static int tegra_pcie_dw_rd_own_conf(struct pci_bus *bus, u32 devfn, int where,
 	return pci_generic_config_read(bus, devfn, where, size, val);
 }
 
-static int tegra_pcie_dw_wr_own_conf(struct pci_bus *bus, u32 devfn, int where,
+static int tegra194_pcie_wr_own_conf(struct pci_bus *bus, u32 devfn, int where,
 				     int size, u32 val)
 {
 	/*
@@ -571,8 +571,8 @@ static int tegra_pcie_dw_wr_own_conf(struct pci_bus *bus, u32 devfn, int where,
 
 static struct pci_ops tegra_pci_ops = {
 	.map_bus = dw_pcie_own_conf_map_bus,
-	.read = tegra_pcie_dw_rd_own_conf,
-	.write = tegra_pcie_dw_wr_own_conf,
+	.read = tegra194_pcie_rd_own_conf,
+	.write = tegra194_pcie_wr_own_conf,
 };
 
 #if defined(CONFIG_PCIEASPM)
@@ -594,7 +594,7 @@ static const u32 event_cntr_data_offset[] = {
 	0x1dc
 };
 
-static void disable_aspm_l11(struct tegra_pcie_dw *pcie)
+static void disable_aspm_l11(struct tegra194_pcie *pcie)
 {
 	u32 val;
 
@@ -603,7 +603,7 @@ static void disable_aspm_l11(struct tegra_pcie_dw *pcie)
 	dw_pcie_writel_dbi(&pcie->pci, pcie->cfg_link_cap_l1sub, val);
 }
 
-static void disable_aspm_l12(struct tegra_pcie_dw *pcie)
+static void disable_aspm_l12(struct tegra194_pcie *pcie)
 {
 	u32 val;
 
@@ -612,7 +612,7 @@ static void disable_aspm_l12(struct tegra_pcie_dw *pcie)
 	dw_pcie_writel_dbi(&pcie->pci, pcie->cfg_link_cap_l1sub, val);
 }
 
-static inline u32 event_counter_prog(struct tegra_pcie_dw *pcie, u32 event)
+static inline u32 event_counter_prog(struct tegra194_pcie *pcie, u32 event)
 {
 	u32 val;
 
@@ -629,7 +629,7 @@ static inline u32 event_counter_prog(struct tegra_pcie_dw *pcie, u32 event)
 
 static int aspm_state_cnt(struct seq_file *s, void *data)
 {
-	struct tegra_pcie_dw *pcie = (struct tegra_pcie_dw *)
+	struct tegra194_pcie *pcie = (struct tegra194_pcie *)
 				     dev_get_drvdata(s->private);
 	u32 val;
 
@@ -660,7 +660,7 @@ static int aspm_state_cnt(struct seq_file *s, void *data)
 	return 0;
 }
 
-static void init_host_aspm(struct tegra_pcie_dw *pcie)
+static void init_host_aspm(struct tegra194_pcie *pcie)
 {
 	struct dw_pcie *pci = &pcie->pci;
 	u32 val;
@@ -688,22 +688,22 @@ static void init_host_aspm(struct tegra_pcie_dw *pcie)
 	dw_pcie_writel_dbi(pci, PCIE_PORT_AFR, val);
 }
 
-static void init_debugfs(struct tegra_pcie_dw *pcie)
+static void init_debugfs(struct tegra194_pcie *pcie)
 {
 	debugfs_create_devm_seqfile(pcie->dev, "aspm_state_cnt", pcie->debugfs,
 				    aspm_state_cnt);
 }
 #else
-static inline void disable_aspm_l12(struct tegra_pcie_dw *pcie) { return; }
-static inline void disable_aspm_l11(struct tegra_pcie_dw *pcie) { return; }
-static inline void init_host_aspm(struct tegra_pcie_dw *pcie) { return; }
-static inline void init_debugfs(struct tegra_pcie_dw *pcie) { return; }
+static inline void disable_aspm_l12(struct tegra194_pcie *pcie) { return; }
+static inline void disable_aspm_l11(struct tegra194_pcie *pcie) { return; }
+static inline void init_host_aspm(struct tegra194_pcie *pcie) { return; }
+static inline void init_debugfs(struct tegra194_pcie *pcie) { return; }
 #endif
 
 static void tegra_pcie_enable_system_interrupts(struct pcie_port *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
+	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
 	u32 val;
 	u16 val_w;
 
@@ -741,7 +741,7 @@ static void tegra_pcie_enable_system_interrupts(struct pcie_port *pp)
 static void tegra_pcie_enable_legacy_interrupts(struct pcie_port *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
+	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
 	u32 val;
 
 	/* Enable legacy interrupt generation */
@@ -762,7 +762,7 @@ static void tegra_pcie_enable_legacy_interrupts(struct pcie_port *pp)
 static void tegra_pcie_enable_msi_interrupts(struct pcie_port *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
+	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
 	u32 val;
 
 	/* Enable MSI interrupt generation */
@@ -775,7 +775,7 @@ static void tegra_pcie_enable_msi_interrupts(struct pcie_port *pp)
 static void tegra_pcie_enable_interrupts(struct pcie_port *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
+	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
 
 	/* Clear interrupt statuses before enabling interrupts */
 	appl_writel(pcie, 0xFFFFFFFF, APPL_INTR_STATUS_L0);
@@ -800,7 +800,7 @@ static void tegra_pcie_enable_interrupts(struct pcie_port *pp)
 		tegra_pcie_enable_msi_interrupts(pp);
 }
 
-static void config_gen3_gen4_eq_presets(struct tegra_pcie_dw *pcie)
+static void config_gen3_gen4_eq_presets(struct tegra194_pcie *pcie)
 {
 	struct dw_pcie *pci = &pcie->pci;
 	u32 val, offset, i;
@@ -853,10 +853,10 @@ static void config_gen3_gen4_eq_presets(struct tegra_pcie_dw *pcie)
 	dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, val);
 }
 
-static int tegra_pcie_dw_host_init(struct pcie_port *pp)
+static int tegra194_pcie_host_init(struct pcie_port *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
+	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
 	u32 val;
 
 	pp->bridge->ops = &tegra_pci_ops;
@@ -914,10 +914,10 @@ static int tegra_pcie_dw_host_init(struct pcie_port *pp)
 	return 0;
 }
 
-static int tegra_pcie_dw_start_link(struct dw_pcie *pci)
+static int tegra194_pcie_start_link(struct dw_pcie *pci)
 {
 	u32 val, offset, speed, tmp;
-	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
+	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
 	struct pcie_port *pp = &pci->pp;
 	bool retry = true;
 
@@ -982,7 +982,7 @@ static int tegra_pcie_dw_start_link(struct dw_pcie *pci)
 		val &= ~PCI_DLF_EXCHANGE_ENABLE;
 		dw_pcie_writel_dbi(pci, offset, val);
 
-		tegra_pcie_dw_host_init(pp);
+		tegra194_pcie_host_init(pp);
 		dw_pcie_setup_rc(pp);
 
 		retry = false;
@@ -998,32 +998,32 @@ static int tegra_pcie_dw_start_link(struct dw_pcie *pci)
 	return 0;
 }
 
-static int tegra_pcie_dw_link_up(struct dw_pcie *pci)
+static int tegra194_pcie_link_up(struct dw_pcie *pci)
 {
-	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
+	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
 	u32 val = dw_pcie_readw_dbi(pci, pcie->pcie_cap_base + PCI_EXP_LNKSTA);
 
 	return !!(val & PCI_EXP_LNKSTA_DLLLA);
 }
 
-static void tegra_pcie_dw_stop_link(struct dw_pcie *pci)
+static void tegra194_pcie_stop_link(struct dw_pcie *pci)
 {
-	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
+	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
 
 	disable_irq(pcie->pex_rst_irq);
 }
 
 static const struct dw_pcie_ops tegra_dw_pcie_ops = {
-	.link_up = tegra_pcie_dw_link_up,
-	.start_link = tegra_pcie_dw_start_link,
-	.stop_link = tegra_pcie_dw_stop_link,
+	.link_up = tegra194_pcie_link_up,
+	.start_link = tegra194_pcie_start_link,
+	.stop_link = tegra194_pcie_stop_link,
 };
 
-static const struct dw_pcie_host_ops tegra_pcie_dw_host_ops = {
-	.host_init = tegra_pcie_dw_host_init,
+static const struct dw_pcie_host_ops tegra194_pcie_host_ops = {
+	.host_init = tegra194_pcie_host_init,
 };
 
-static void tegra_pcie_disable_phy(struct tegra_pcie_dw *pcie)
+static void tegra_pcie_disable_phy(struct tegra194_pcie *pcie)
 {
 	unsigned int phy_count = pcie->phy_count;
 
@@ -1033,7 +1033,7 @@ static void tegra_pcie_disable_phy(struct tegra_pcie_dw *pcie)
 	}
 }
 
-static int tegra_pcie_enable_phy(struct tegra_pcie_dw *pcie)
+static int tegra_pcie_enable_phy(struct tegra194_pcie *pcie)
 {
 	unsigned int i;
 	int ret;
@@ -1060,7 +1060,7 @@ static int tegra_pcie_enable_phy(struct tegra_pcie_dw *pcie)
 	return ret;
 }
 
-static int tegra_pcie_dw_parse_dt(struct tegra_pcie_dw *pcie)
+static int tegra194_pcie_parse_dt(struct tegra194_pcie *pcie)
 {
 	struct platform_device *pdev = to_platform_device(pcie->dev);
 	struct device_node *np = pcie->dev->of_node;
@@ -1156,7 +1156,7 @@ static int tegra_pcie_dw_parse_dt(struct tegra_pcie_dw *pcie)
 	return 0;
 }
 
-static int tegra_pcie_bpmp_set_ctrl_state(struct tegra_pcie_dw *pcie,
+static int tegra_pcie_bpmp_set_ctrl_state(struct tegra194_pcie *pcie,
 					  bool enable)
 {
 	struct mrq_uphy_response resp;
@@ -1184,7 +1184,7 @@ static int tegra_pcie_bpmp_set_ctrl_state(struct tegra_pcie_dw *pcie,
 	return tegra_bpmp_transfer(pcie->bpmp, &msg);
 }
 
-static int tegra_pcie_bpmp_set_pll_state(struct tegra_pcie_dw *pcie,
+static int tegra_pcie_bpmp_set_pll_state(struct tegra194_pcie *pcie,
 					 bool enable)
 {
 	struct mrq_uphy_response resp;
@@ -1212,7 +1212,7 @@ static int tegra_pcie_bpmp_set_pll_state(struct tegra_pcie_dw *pcie,
 	return tegra_bpmp_transfer(pcie->bpmp, &msg);
 }
 
-static void tegra_pcie_downstream_dev_to_D0(struct tegra_pcie_dw *pcie)
+static void tegra_pcie_downstream_dev_to_D0(struct tegra194_pcie *pcie)
 {
 	struct pcie_port *pp = &pcie->pci.pp;
 	struct pci_bus *child, *root_bus = NULL;
@@ -1250,7 +1250,7 @@ static void tegra_pcie_downstream_dev_to_D0(struct tegra_pcie_dw *pcie)
 	}
 }
 
-static int tegra_pcie_get_slot_regulators(struct tegra_pcie_dw *pcie)
+static int tegra_pcie_get_slot_regulators(struct tegra194_pcie *pcie)
 {
 	pcie->slot_ctl_3v3 = devm_regulator_get_optional(pcie->dev, "vpcie3v3");
 	if (IS_ERR(pcie->slot_ctl_3v3)) {
@@ -1271,7 +1271,7 @@ static int tegra_pcie_get_slot_regulators(struct tegra_pcie_dw *pcie)
 	return 0;
 }
 
-static int tegra_pcie_enable_slot_regulators(struct tegra_pcie_dw *pcie)
+static int tegra_pcie_enable_slot_regulators(struct tegra194_pcie *pcie)
 {
 	int ret;
 
@@ -1309,7 +1309,7 @@ static int tegra_pcie_enable_slot_regulators(struct tegra_pcie_dw *pcie)
 	return ret;
 }
 
-static void tegra_pcie_disable_slot_regulators(struct tegra_pcie_dw *pcie)
+static void tegra_pcie_disable_slot_regulators(struct tegra194_pcie *pcie)
 {
 	if (pcie->slot_ctl_12v)
 		regulator_disable(pcie->slot_ctl_12v);
@@ -1317,7 +1317,7 @@ static void tegra_pcie_disable_slot_regulators(struct tegra_pcie_dw *pcie)
 		regulator_disable(pcie->slot_ctl_3v3);
 }
 
-static int tegra_pcie_config_controller(struct tegra_pcie_dw *pcie,
+static int tegra_pcie_config_controller(struct tegra194_pcie *pcie,
 					bool en_hw_hot_rst)
 {
 	int ret;
@@ -1414,7 +1414,7 @@ static int tegra_pcie_config_controller(struct tegra_pcie_dw *pcie,
 	return ret;
 }
 
-static void tegra_pcie_unconfig_controller(struct tegra_pcie_dw *pcie)
+static void tegra_pcie_unconfig_controller(struct tegra194_pcie *pcie)
 {
 	int ret;
 
@@ -1442,7 +1442,7 @@ static void tegra_pcie_unconfig_controller(struct tegra_pcie_dw *pcie)
 			pcie->cid, ret);
 }
 
-static int tegra_pcie_init_controller(struct tegra_pcie_dw *pcie)
+static int tegra_pcie_init_controller(struct tegra194_pcie *pcie)
 {
 	struct dw_pcie *pci = &pcie->pci;
 	struct pcie_port *pp = &pci->pp;
@@ -1452,7 +1452,7 @@ static int tegra_pcie_init_controller(struct tegra_pcie_dw *pcie)
 	if (ret < 0)
 		return ret;
 
-	pp->ops = &tegra_pcie_dw_host_ops;
+	pp->ops = &tegra194_pcie_host_ops;
 
 	ret = dw_pcie_host_init(pp);
 	if (ret < 0) {
@@ -1467,11 +1467,11 @@ static int tegra_pcie_init_controller(struct tegra_pcie_dw *pcie)
 	return ret;
 }
 
-static int tegra_pcie_try_link_l2(struct tegra_pcie_dw *pcie)
+static int tegra_pcie_try_link_l2(struct tegra194_pcie *pcie)
 {
 	u32 val;
 
-	if (!tegra_pcie_dw_link_up(&pcie->pci))
+	if (!tegra194_pcie_link_up(&pcie->pci))
 		return 0;
 
 	val = appl_readl(pcie, APPL_RADM_STATUS);
@@ -1483,12 +1483,12 @@ static int tegra_pcie_try_link_l2(struct tegra_pcie_dw *pcie)
 				 1, PME_ACK_TIMEOUT);
 }
 
-static void tegra_pcie_dw_pme_turnoff(struct tegra_pcie_dw *pcie)
+static void tegra194_pcie_pme_turnoff(struct tegra194_pcie *pcie)
 {
 	u32 data;
 	int err;
 
-	if (!tegra_pcie_dw_link_up(&pcie->pci)) {
+	if (!tegra194_pcie_link_up(&pcie->pci)) {
 		dev_dbg(pcie->dev, "PCIe link is not up...!\n");
 		return;
 	}
@@ -1545,15 +1545,15 @@ static void tegra_pcie_dw_pme_turnoff(struct tegra_pcie_dw *pcie)
 	appl_writel(pcie, data, APPL_PINMUX);
 }
 
-static void tegra_pcie_deinit_controller(struct tegra_pcie_dw *pcie)
+static void tegra_pcie_deinit_controller(struct tegra194_pcie *pcie)
 {
 	tegra_pcie_downstream_dev_to_D0(pcie);
 	dw_pcie_host_deinit(&pcie->pci.pp);
-	tegra_pcie_dw_pme_turnoff(pcie);
+	tegra194_pcie_pme_turnoff(pcie);
 	tegra_pcie_unconfig_controller(pcie);
 }
 
-static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
+static int tegra_pcie_config_rp(struct tegra194_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
 	char *name;
@@ -1580,7 +1580,7 @@ static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
 		goto fail_pm_get_sync;
 	}
 
-	pcie->link_state = tegra_pcie_dw_link_up(&pcie->pci);
+	pcie->link_state = tegra194_pcie_link_up(&pcie->pci);
 	if (!pcie->link_state) {
 		ret = -ENOMEDIUM;
 		goto fail_host_init;
@@ -1605,7 +1605,7 @@ static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
 	return ret;
 }
 
-static void pex_ep_event_pex_rst_assert(struct tegra_pcie_dw *pcie)
+static void pex_ep_event_pex_rst_assert(struct tegra194_pcie *pcie)
 {
 	u32 val;
 	int ret;
@@ -1644,7 +1644,7 @@ static void pex_ep_event_pex_rst_assert(struct tegra_pcie_dw *pcie)
 	dev_dbg(pcie->dev, "Uninitialization of endpoint is completed\n");
 }
 
-static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
+static void pex_ep_event_pex_rst_deassert(struct tegra194_pcie *pcie)
 {
 	struct dw_pcie *pci = &pcie->pci;
 	struct dw_pcie_ep *ep = &pci->ep;
@@ -1809,7 +1809,7 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
 
 static irqreturn_t tegra_pcie_ep_pex_rst_irq(int irq, void *arg)
 {
-	struct tegra_pcie_dw *pcie = arg;
+	struct tegra194_pcie *pcie = arg;
 
 	if (gpiod_get_value(pcie->pex_rst_gpiod))
 		pex_ep_event_pex_rst_assert(pcie);
@@ -1819,7 +1819,7 @@ static irqreturn_t tegra_pcie_ep_pex_rst_irq(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static int tegra_pcie_ep_raise_legacy_irq(struct tegra_pcie_dw *pcie, u16 irq)
+static int tegra_pcie_ep_raise_legacy_irq(struct tegra194_pcie *pcie, u16 irq)
 {
 	/* Tegra194 supports only INTA */
 	if (irq > 1)
@@ -1831,7 +1831,7 @@ static int tegra_pcie_ep_raise_legacy_irq(struct tegra_pcie_dw *pcie, u16 irq)
 	return 0;
 }
 
-static int tegra_pcie_ep_raise_msi_irq(struct tegra_pcie_dw *pcie, u16 irq)
+static int tegra_pcie_ep_raise_msi_irq(struct tegra194_pcie *pcie, u16 irq)
 {
 	if (unlikely(irq > 31))
 		return -EINVAL;
@@ -1841,7 +1841,7 @@ static int tegra_pcie_ep_raise_msi_irq(struct tegra_pcie_dw *pcie, u16 irq)
 	return 0;
 }
 
-static int tegra_pcie_ep_raise_msix_irq(struct tegra_pcie_dw *pcie, u16 irq)
+static int tegra_pcie_ep_raise_msix_irq(struct tegra194_pcie *pcie, u16 irq)
 {
 	struct dw_pcie_ep *ep = &pcie->pci.ep;
 
@@ -1855,7 +1855,7 @@ static int tegra_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 				   u16 interrupt_num)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
+	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
 
 	switch (type) {
 	case PCI_EPC_IRQ_LEGACY:
@@ -1896,7 +1896,7 @@ static const struct dw_pcie_ep_ops pcie_ep_ops = {
 	.get_features = tegra_pcie_ep_get_features,
 };
 
-static int tegra_pcie_config_ep(struct tegra_pcie_dw *pcie,
+static int tegra_pcie_config_ep(struct tegra194_pcie *pcie,
 				struct platform_device *pdev)
 {
 	struct dw_pcie *pci = &pcie->pci;
@@ -1957,12 +1957,12 @@ static int tegra_pcie_config_ep(struct tegra_pcie_dw *pcie,
 	return 0;
 }
 
-static int tegra_pcie_dw_probe(struct platform_device *pdev)
+static int tegra194_pcie_probe(struct platform_device *pdev)
 {
-	const struct tegra_pcie_dw_of_data *data;
+	const struct tegra194_pcie_of_data *data;
 	struct device *dev = &pdev->dev;
 	struct resource *atu_dma_res;
-	struct tegra_pcie_dw *pcie;
+	struct tegra194_pcie *pcie;
 	struct pcie_port *pp;
 	struct dw_pcie *pci;
 	struct phy **phys;
@@ -1988,7 +1988,7 @@ static int tegra_pcie_dw_probe(struct platform_device *pdev)
 	pcie->dev = &pdev->dev;
 	pcie->mode = (enum dw_pcie_device_mode)data->mode;
 
-	ret = tegra_pcie_dw_parse_dt(pcie);
+	ret = tegra194_pcie_parse_dt(pcie);
 	if (ret < 0) {
 		const char *level = KERN_ERR;
 
@@ -2146,9 +2146,9 @@ static int tegra_pcie_dw_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tegra_pcie_dw_remove(struct platform_device *pdev)
+static int tegra194_pcie_remove(struct platform_device *pdev)
 {
-	struct tegra_pcie_dw *pcie = platform_get_drvdata(pdev);
+	struct tegra194_pcie *pcie = platform_get_drvdata(pdev);
 
 	if (!pcie->link_state)
 		return 0;
@@ -2164,9 +2164,9 @@ static int tegra_pcie_dw_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_pcie_dw_suspend_late(struct device *dev)
+static int tegra194_pcie_suspend_late(struct device *dev)
 {
-	struct tegra_pcie_dw *pcie = dev_get_drvdata(dev);
+	struct tegra194_pcie *pcie = dev_get_drvdata(dev);
 	u32 val;
 
 	if (!pcie->link_state)
@@ -2182,9 +2182,9 @@ static int tegra_pcie_dw_suspend_late(struct device *dev)
 	return 0;
 }
 
-static int tegra_pcie_dw_suspend_noirq(struct device *dev)
+static int tegra194_pcie_suspend_noirq(struct device *dev)
 {
-	struct tegra_pcie_dw *pcie = dev_get_drvdata(dev);
+	struct tegra194_pcie *pcie = dev_get_drvdata(dev);
 
 	if (!pcie->link_state)
 		return 0;
@@ -2193,15 +2193,15 @@ static int tegra_pcie_dw_suspend_noirq(struct device *dev)
 	pcie->msi_ctrl_int = dw_pcie_readl_dbi(&pcie->pci,
 					       PORT_LOGIC_MSI_CTRL_INT_0_EN);
 	tegra_pcie_downstream_dev_to_D0(pcie);
-	tegra_pcie_dw_pme_turnoff(pcie);
+	tegra194_pcie_pme_turnoff(pcie);
 	tegra_pcie_unconfig_controller(pcie);
 
 	return 0;
 }
 
-static int tegra_pcie_dw_resume_noirq(struct device *dev)
+static int tegra194_pcie_resume_noirq(struct device *dev)
 {
-	struct tegra_pcie_dw *pcie = dev_get_drvdata(dev);
+	struct tegra194_pcie *pcie = dev_get_drvdata(dev);
 	int ret;
 
 	if (!pcie->link_state)
@@ -2211,7 +2211,7 @@ static int tegra_pcie_dw_resume_noirq(struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	ret = tegra_pcie_dw_host_init(&pcie->pci.pp);
+	ret = tegra194_pcie_host_init(&pcie->pci.pp);
 	if (ret < 0) {
 		dev_err(dev, "Failed to init host: %d\n", ret);
 		goto fail_host_init;
@@ -2219,7 +2219,7 @@ static int tegra_pcie_dw_resume_noirq(struct device *dev)
 
 	dw_pcie_setup_rc(&pcie->pci.pp);
 
-	ret = tegra_pcie_dw_start_link(&pcie->pci);
+	ret = tegra194_pcie_start_link(&pcie->pci);
 	if (ret < 0)
 		goto fail_host_init;
 
@@ -2234,9 +2234,9 @@ static int tegra_pcie_dw_resume_noirq(struct device *dev)
 	return ret;
 }
 
-static int tegra_pcie_dw_resume_early(struct device *dev)
+static int tegra194_pcie_resume_early(struct device *dev)
 {
-	struct tegra_pcie_dw *pcie = dev_get_drvdata(dev);
+	struct tegra194_pcie *pcie = dev_get_drvdata(dev);
 	u32 val;
 
 	if (pcie->mode == DW_PCIE_EP_TYPE) {
@@ -2259,9 +2259,9 @@ static int tegra_pcie_dw_resume_early(struct device *dev)
 	return 0;
 }
 
-static void tegra_pcie_dw_shutdown(struct platform_device *pdev)
+static void tegra194_pcie_shutdown(struct platform_device *pdev)
 {
-	struct tegra_pcie_dw *pcie = platform_get_drvdata(pdev);
+	struct tegra194_pcie *pcie = platform_get_drvdata(pdev);
 
 	if (!pcie->link_state)
 		return;
@@ -2273,50 +2273,50 @@ static void tegra_pcie_dw_shutdown(struct platform_device *pdev)
 	if (IS_ENABLED(CONFIG_PCI_MSI))
 		disable_irq(pcie->pci.pp.msi_irq);
 
-	tegra_pcie_dw_pme_turnoff(pcie);
+	tegra194_pcie_pme_turnoff(pcie);
 	tegra_pcie_unconfig_controller(pcie);
 }
 
-static const struct tegra_pcie_dw_of_data tegra_pcie_dw_rc_of_data = {
+static const struct tegra194_pcie_of_data tegra194_pcie_rc_of_data = {
 	.mode = DW_PCIE_RC_TYPE,
 };
 
-static const struct tegra_pcie_dw_of_data tegra_pcie_dw_ep_of_data = {
+static const struct tegra194_pcie_of_data tegra194_pcie_ep_of_data = {
 	.mode = DW_PCIE_EP_TYPE,
 };
 
-static const struct of_device_id tegra_pcie_dw_of_match[] = {
+static const struct of_device_id tegra194_pcie_of_match[] = {
 	{
 		.compatible = "nvidia,tegra194-pcie",
-		.data = &tegra_pcie_dw_rc_of_data,
+		.data = &tegra194_pcie_rc_of_data,
 	},
 	{
 		.compatible = "nvidia,tegra194-pcie-ep",
-		.data = &tegra_pcie_dw_ep_of_data,
+		.data = &tegra194_pcie_ep_of_data,
 	},
 	{},
 };
 
-static const struct dev_pm_ops tegra_pcie_dw_pm_ops = {
-	.suspend_late = tegra_pcie_dw_suspend_late,
-	.suspend_noirq = tegra_pcie_dw_suspend_noirq,
-	.resume_noirq = tegra_pcie_dw_resume_noirq,
-	.resume_early = tegra_pcie_dw_resume_early,
+static const struct dev_pm_ops tegra194_pcie_pm_ops = {
+	.suspend_late = tegra194_pcie_suspend_late,
+	.suspend_noirq = tegra194_pcie_suspend_noirq,
+	.resume_noirq = tegra194_pcie_resume_noirq,
+	.resume_early = tegra194_pcie_resume_early,
 };
 
-static struct platform_driver tegra_pcie_dw_driver = {
-	.probe = tegra_pcie_dw_probe,
-	.remove = tegra_pcie_dw_remove,
-	.shutdown = tegra_pcie_dw_shutdown,
+static struct platform_driver tegra194_pcie_driver = {
+	.probe = tegra194_pcie_probe,
+	.remove = tegra194_pcie_remove,
+	.shutdown = tegra194_pcie_shutdown,
 	.driver = {
 		.name	= "tegra194-pcie",
-		.pm = &tegra_pcie_dw_pm_ops,
-		.of_match_table = tegra_pcie_dw_of_match,
+		.pm = &tegra194_pcie_pm_ops,
+		.of_match_table = tegra194_pcie_of_match,
 	},
 };
-module_platform_driver(tegra_pcie_dw_driver);
+module_platform_driver(tegra194_pcie_driver);
 
-MODULE_DEVICE_TABLE(of, tegra_pcie_dw_of_match);
+MODULE_DEVICE_TABLE(of, tegra194_pcie_of_match);
 
 MODULE_AUTHOR("Vidya Sagar <vidyas@nvidia.com>");
 MODULE_DESCRIPTION("NVIDIA PCIe host controller driver");
-- 
2.25.1


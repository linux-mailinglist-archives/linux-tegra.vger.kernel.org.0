Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2066F2A88B6
	for <lists+linux-tegra@lfdr.de>; Thu,  5 Nov 2020 22:12:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732367AbgKEVM3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 5 Nov 2020 16:12:29 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38477 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732250AbgKEVM3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 Nov 2020 16:12:29 -0500
Received: by mail-oi1-f195.google.com with SMTP id 9so3183067oir.5;
        Thu, 05 Nov 2020 13:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vgOVB7AFIv6XiowVBvShjE3tbQpqnvEkIeeJL20ooNM=;
        b=HATZSuOqDCH9WMAPVrINU89OSiI8lt8Vh0kCOSIJwwB7mD6l1gLr8IvGhKXuhbZymA
         RVYotzSrJBAjAhhR5VUd59cfE6jEtPoo39B011t8e4HmQtUYPDwhP+tN+kaqjT1TuxYT
         JSeJDaVvYbAQtzNjo7NTmRkx+KkFHdaSsDtxUyFZ8g3sU+cXVCwxWabk3DVxoll3l4sw
         qqEK7IXs62dtXutl3mDNXOhfLPTnsmKY8g2l0HDWhhwZUJoinqEvUnNwYh58x0mBbozM
         ZreUgD50+DOpyOuSksxkDt+Ws2/4Z0cqMPC8SLRISLZcJ5k4NZg0Qwg61xnv9cZVWh92
         2Lbw==
X-Gm-Message-State: AOAM531yUukiUqnDw9Mn55zRfizL0ihjlB0/lj0UzTRLJvY8QwRDtFnx
        VggjYe50KgXbWSU5IX27TO/0ha+6z/x2
X-Google-Smtp-Source: ABdhPJxJwJQBPQVeRbzO4wHIcCFwCVwE8sSeftvdcY4UgqcKXeAPg/3iE1vvyAKYwKy1iHAYgoCBvQ==
X-Received: by 2002:aca:5a43:: with SMTP id o64mr794992oib.89.1604610747588;
        Thu, 05 Nov 2020 13:12:27 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id z19sm622549ooi.32.2020.11.05.13.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 13:12:26 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
Cc:     linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 16/16] PCI: dwc: Detect number of iATU windows
Date:   Thu,  5 Nov 2020 15:11:59 -0600
Message-Id: <20201105211159.1814485-17-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105211159.1814485-1-robh@kernel.org>
References: <20201105211159.1814485-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Currently the number of inbound and outbound iATU windows are determined
from DT properties. Unfortunately, there's 'num-viewport' for RC mode
and 'num-ib-windows' and 'num-ob-windows' for EP mode, yet the number of
windows is not mode dependent. Also, 'num-viewport' is not clear whether
that's inbound, outbound or both. We can probably assume it's outbound
windows as that's all RC mode uses.

However, using DT properties isn't really needed as the number of
regions can be detected at runtime by poking the iATU registers. The
basic algorithm is just writing a target address and reading back what
we wrote. In the unrolled ATU case, we have to take care not to go
past the mapped region.

With this, we can drop num_viewport in favor of num_ob_windows instead.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - new patch

 .../pci/controller/dwc/pcie-designware-ep.c   | 20 ----
 .../pci/controller/dwc/pcie-designware-host.c | 14 +--
 drivers/pci/controller/dwc/pcie-designware.c  | 93 +++++++++++++++++--
 drivers/pci/controller/dwc/pcie-designware.h  |  2 +-
 drivers/pci/controller/dwc/pcie-intel-gw.c    |  8 --
 drivers/pci/controller/dwc/pcie-tegra194.c    |  1 +
 6 files changed, 93 insertions(+), 45 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 79b998982e41..bcd1cd9ba8c8 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -714,26 +714,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	ep->phys_base = res->start;
 	ep->addr_size = resource_size(res);

-	ret = of_property_read_u32(np, "num-ib-windows", &pci->num_ib_windows);
-	if (ret < 0) {
-		dev_err(dev, "Unable to read *num-ib-windows* property\n");
-		return ret;
-	}
-	if (pci->num_ib_windows > MAX_IATU_IN) {
-		dev_err(dev, "Invalid *num-ib-windows*\n");
-		return -EINVAL;
-	}
-
-	ret = of_property_read_u32(np, "num-ob-windows", &pci->num_ob_windows);
-	if (ret < 0) {
-		dev_err(dev, "Unable to read *num-ob-windows* property\n");
-		return ret;
-	}
-	if (pci->num_ob_windows > MAX_IATU_OUT) {
-		dev_err(dev, "Invalid *num-ob-windows*\n");
-		return -EINVAL;
-	}
-
 	ep->ib_window_map = devm_kcalloc(dev,
 					 BITS_TO_LONGS(pci->num_ib_windows),
 					 sizeof(long),
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index f2b0a15ad72b..99ef808a40a9 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -356,10 +356,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		}
 	}

-	ret = of_property_read_u32(np, "num-viewport", &pci->num_viewport);
-	if (ret)
-		pci->num_viewport = 2;
-
 	if (pci->link_gen < 1)
 		pci->link_gen = of_pci_get_max_link_speed(np);

@@ -598,7 +594,7 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
 	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);

 	/* Ensure all outbound windows are disabled so there are multiple matches */
-	for (i = 0; i < pci->num_viewport; i++)
+	for (i = 0; i < pci->num_ob_windows; i++)
 		dw_pcie_disable_atu(pci, i, DW_PCIE_REGION_OUTBOUND);

 	/*
@@ -615,7 +611,7 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
 			if (resource_type(entry->res) != IORESOURCE_MEM)
 				continue;

-			if (pci->num_viewport <= ++atu_idx)
+			if (pci->num_ob_windows <= ++atu_idx)
 				break;

 			dw_pcie_prog_outbound_atu(pci, atu_idx,
@@ -625,7 +621,7 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
 		}

 		if (pp->io_size) {
-			if (pci->num_viewport > ++atu_idx)
+			if (pci->num_ob_windows > ++atu_idx)
 				dw_pcie_prog_outbound_atu(pci, atu_idx,
 							  PCIE_ATU_TYPE_IO, pp->io_base,
 							  pp->io_bus_addr, pp->io_size);
@@ -633,9 +629,9 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
 				pci->io_cfg_atu_shared = true;
 		}

-		if (pci->num_viewport <= atu_idx)
+		if (pci->num_ob_windows <= atu_idx)
 			dev_warn(pci->dev, "Resources exceed number of ATU entries (%d)",
-				 pci->num_viewport);
+				 pci->num_ob_windows);
 	}

 	dw_pcie_writel_dbi(pci, PCI_BASE_ADDRESS_0, 0);
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index c2dea8fc97c8..f4242ec13320 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -544,6 +544,70 @@ static u8 dw_pcie_iatu_unroll_enabled(struct dw_pcie *pci)
 	return 0;
 }

+static void dw_pcie_iatu_detect_regions_unroll(struct dw_pcie *pci)
+{
+	int max_region, i, ob = 0, ib = 0;
+	u32 val;
+
+	max_region = min((int)pci->atu_size / 512, 256);
+
+	for (i = 0; i < max_region; i++) {
+		dw_pcie_writel_ob_unroll(pci, i, PCIE_ATU_UNR_LOWER_TARGET,
+					0x11110000);
+
+		val = dw_pcie_readl_ob_unroll(pci, i, PCIE_ATU_UNR_LOWER_TARGET);
+		if (val == 0x11110000)
+			ob++;
+		else
+			break;
+	}
+
+	for (i = 0; i < max_region; i++) {
+		dw_pcie_writel_ib_unroll(pci, i, PCIE_ATU_UNR_LOWER_TARGET,
+					0x11110000);
+
+		val = dw_pcie_readl_ib_unroll(pci, i, PCIE_ATU_UNR_LOWER_TARGET);
+		if (val == 0x11110000)
+			ib++;
+		else
+			break;
+	}
+	pci->num_ib_windows = ib;
+	pci->num_ob_windows = ob;
+}
+
+static void dw_pcie_iatu_detect_regions(struct dw_pcie *pci)
+{
+	int max_region, i, ob = 0, ib = 0;
+	u32 val;
+
+	dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT, 0xFF);
+	max_region = dw_pcie_readl_dbi(pci, PCIE_ATU_VIEWPORT) + 1;
+
+	for (i = 0; i < max_region; i++) {
+		dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT, PCIE_ATU_REGION_OUTBOUND | i);
+		dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_TARGET, 0x11110000);
+		val = dw_pcie_readl_dbi(pci, PCIE_ATU_LOWER_TARGET);
+		if (val == 0x11110000)
+			ob++;
+		else
+			break;
+	}
+
+	for (i = 0; i < max_region; i++) {
+		dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT, PCIE_ATU_REGION_INBOUND | i);
+		dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_TARGET, 0x11110000);
+		val = dw_pcie_readl_dbi(pci, PCIE_ATU_LOWER_TARGET);
+		if (val == 0x11110000)
+			ib++;
+		else
+			break;
+	}
+
+	pci->num_ib_windows = ib;
+	pci->num_ob_windows = ob;
+}
+
 void dw_pcie_setup(struct dw_pcie *pci)
 {
 	u32 val;
@@ -554,15 +618,30 @@ void dw_pcie_setup(struct dw_pcie *pci)
 	if (pci->version >= 0x480A || (!pci->version &&
 				       dw_pcie_iatu_unroll_enabled(pci))) {
 		pci->iatu_unroll_enabled = true;
-		if (!pci->atu_base)
-			pci->atu_base =
-			    devm_platform_ioremap_resource_byname(pdev, "atu");
-		if (IS_ERR(pci->atu_base))
-			pci->atu_base = pci->dbi_base + DEFAULT_DBI_ATU_OFFSET;
-	}
-	dev_dbg(pci->dev, "iATU unroll: %s\n", pci->iatu_unroll_enabled ?
+		if (!pci->atu_base) {
+			struct resource *res =
+				platform_get_resource_byname(pdev, IORESOURCE_MEM, "atu");
+			if (res)
+				pci->atu_size = resource_size(res);
+			pci->atu_base = devm_ioremap_resource(dev, res);
+			if (IS_ERR(pci->atu_base))
+				pci->atu_base = pci->dbi_base + DEFAULT_DBI_ATU_OFFSET;
+		}
+
+		if (!pci->atu_size)
+			/* Pick a minimal default, enough for 8 in and 8 out windows */
+			pci->atu_size = SZ_4K;
+
+		dw_pcie_iatu_detect_regions_unroll(pci);
+	} else
+		dw_pcie_iatu_detect_regions(pci);
+
+	dev_info(pci->dev, "iATU unroll: %s\n", pci->iatu_unroll_enabled ?
 		"enabled" : "disabled");

+	dev_info(pci->dev, "Detected iATU regions: %u outbound, %u inbound",
+		 pci->num_ob_windows, pci->num_ib_windows);
+
 	if (pci->link_gen > 0)
 		dw_pcie_link_set_max_speed(pci, pci->link_gen);

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index e4f964e6cabe..ddf1bc733c08 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -260,7 +260,7 @@ struct dw_pcie {
 	void __iomem		*dbi_base2;
 	/* Used when iatu_unroll_enabled is true */
 	void __iomem		*atu_base;
-	u32			num_viewport;
+	size_t			atu_size;
 	u32			num_ib_windows;
 	u32			num_ob_windows;
 	struct pcie_port	pp;
diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index 292b9de86532..0cedd1f95f37 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -58,7 +58,6 @@

 struct intel_pcie_soc {
 	unsigned int	pcie_ver;
-	u32		num_viewport;
 };

 struct intel_pcie_port {
@@ -400,7 +399,6 @@ static const struct dw_pcie_host_ops intel_pcie_dw_ops = {

 static const struct intel_pcie_soc pcie_data = {
 	.pcie_ver =		0x520A,
-	.num_viewport =		3,
 };

 static int intel_pcie_probe(struct platform_device *pdev)
@@ -443,12 +441,6 @@ static int intel_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}

-	/*
-	 * Intel PCIe doesn't configure IO region, so set viewport
-	 * to not perform IO region access.
-	 */
-	pci->num_viewport = data->num_viewport;
-
 	return 0;
 }

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 84f3e0bb4c7a..fa54d9aaa430 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -2075,6 +2075,7 @@ static int tegra_pcie_dw_probe(struct platform_device *pdev)
 	}
 	pcie->atu_dma_res = atu_dma_res;

+	pci->atu_size = resource_size(atu_dma_res);
 	pci->atu_base = devm_ioremap_resource(dev, atu_dma_res);
 	if (IS_ERR(pci->atu_base))
 		return PTR_ERR(pci->atu_base);
--
2.25.1

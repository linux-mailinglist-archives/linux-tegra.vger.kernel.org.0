Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB7A0870E5
	for <lists+linux-tegra@lfdr.de>; Fri,  9 Aug 2019 06:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405478AbfHIErL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 9 Aug 2019 00:47:11 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:5575 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405189AbfHIErL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Aug 2019 00:47:11 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d4cfad00001>; Thu, 08 Aug 2019 21:47:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 08 Aug 2019 21:47:11 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 08 Aug 2019 21:47:11 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 9 Aug
 2019 04:47:10 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 9 Aug
 2019 04:47:10 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 9 Aug 2019 04:47:10 +0000
Received: from vidyas-desktop.nvidia.com (Not Verified[10.24.37.38]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d4cfac90001>; Thu, 08 Aug 2019 21:47:10 -0700
From:   Vidya Sagar <vidyas@nvidia.com>
To:     <lorenzo.pieralisi@arm.com>, <bhelgaas@google.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <kishon@ti.com>, <catalin.marinas@arm.com>, <will.deacon@arm.com>,
        <jingoohan1@gmail.com>, <gustavo.pimentel@synopsys.com>
CC:     <digetx@gmail.com>, <mperttunen@nvidia.com>,
        <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kthota@nvidia.com>,
        <mmaddireddy@nvidia.com>, <vidyas@nvidia.com>, <sagar.tv@gmail.com>
Subject: [PATCH V15 08/13] PCI: dwc: Add support to enable CDM register check
Date:   Fri, 9 Aug 2019 10:16:04 +0530
Message-ID: <20190809044609.20401-9-vidyas@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190809044609.20401-1-vidyas@nvidia.com>
References: <20190809044609.20401-1-vidyas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1565326032; bh=7Q+575sH/I89eCp70ErWoxV/STR4HCiv5hFcvnUuxUI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=XGBVbXHZrvYBFWjlGEwmBP/eXstTvTd2wNogo7UkSsBpFb9La/+h2PXk0T0Otv7/k
         b8YIfsQqCpKEAmWmM5d7yRPyeLqaQjPVJRjc5GT43Q/alkd4WjHxxXcqcKCN/p/Zn7
         7c4FUkOQad3/KCR/uP7Oi23qxKm6KFxn8zm5ATTqsqehEaJzJDthJ+VN41BhkoBpDS
         JWLLfOE8Sf8fJ2xiD6yEktgsbJ4wvRIYGk50ZdgNJNidytQHHbsbSJ+ggUHeMl7Atm
         hq6BKDR2ajWW3P5Xm5JFx9V5cA2eAj6kC9ZJA+TDbBnrwQoBfcAqAhFs/DtmjVuC08
         FPJipfS36R8nQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add support to enable CDM (Configuration Dependent Module) register check
for any data corruption based on the device-tree flag 'snps,enable-cdm-check'.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
Acked-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
---
V15:
* None

V14:
* None

V13:
* None

V12:
* None

V11:
* None

V10:
* None

V9:
* None

V8:
* None

V7:
* Changed "enable-cdm-check" to "snps,enable-cdm-check"

V6:
* None

V5:
* None

V4:
* None

V3:
* Changed code and commit description to reflect change in flag from
  'cdm-check' to 'enable-cdm-check'

V2:
* This is a new patch in v2 series

 drivers/pci/controller/dwc/pcie-designware.c | 7 +++++++
 drivers/pci/controller/dwc/pcie-designware.h | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 1d87e823de21..59eaeeb21dbe 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -547,4 +547,11 @@ void dw_pcie_setup(struct dw_pcie *pci)
 		break;
 	}
 	dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, val);
+
+	if (of_property_read_bool(np, "snps,enable-cdm-check")) {
+		val = dw_pcie_readl_dbi(pci, PCIE_PL_CHK_REG_CONTROL_STATUS);
+		val |= PCIE_PL_CHK_REG_CHK_REG_CONTINUOUS |
+		       PCIE_PL_CHK_REG_CHK_REG_START;
+		dw_pcie_writel_dbi(pci, PCIE_PL_CHK_REG_CONTROL_STATUS, val);
+	}
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 11c223471416..5a18e94e52c8 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -86,6 +86,15 @@
 #define PCIE_MISC_CONTROL_1_OFF		0x8BC
 #define PCIE_DBI_RO_WR_EN		BIT(0)
 
+#define PCIE_PL_CHK_REG_CONTROL_STATUS			0xB20
+#define PCIE_PL_CHK_REG_CHK_REG_START			BIT(0)
+#define PCIE_PL_CHK_REG_CHK_REG_CONTINUOUS		BIT(1)
+#define PCIE_PL_CHK_REG_CHK_REG_COMPARISON_ERROR	BIT(16)
+#define PCIE_PL_CHK_REG_CHK_REG_LOGIC_ERROR		BIT(17)
+#define PCIE_PL_CHK_REG_CHK_REG_COMPLETE		BIT(18)
+
+#define PCIE_PL_CHK_REG_ERR_ADDR			0xB28
+
 /*
  * iATU Unroll-specific register definitions
  * From 4.80 core version the address translation will be made by unroll
-- 
2.17.1


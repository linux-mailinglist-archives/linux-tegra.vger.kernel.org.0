Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50E775053E
	for <lists+linux-tegra@lfdr.de>; Mon, 24 Jun 2019 11:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728241AbfFXJPO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 24 Jun 2019 05:15:14 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14455 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbfFXJPO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Jun 2019 05:15:14 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d10949f0000>; Mon, 24 Jun 2019 02:15:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 24 Jun 2019 02:15:13 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 24 Jun 2019 02:15:13 -0700
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Jun
 2019 09:15:12 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 24 Jun 2019 09:15:12 +0000
Received: from vidyas-desktop.nvidia.com (Not Verified[10.24.37.38]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d10949b0007>; Mon, 24 Jun 2019 02:15:12 -0700
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
Subject: [PATCH V11 00/12] Add Tegra194 PCIe support
Date:   Mon, 24 Jun 2019 14:44:53 +0530
Message-ID: <20190624091505.1711-1-vidyas@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561367711; bh=eIWxppGSTnV4Bg5jQzxQ2aAppXDLJD5gPIXPXCDXths=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=CbjVQIZC9w+lU8Q4fI5NrxfBUSoIlnu2LIv53L9KlpONxrvUhgeoH5hVBGE6ooixp
         EvjKQuU6xA0WPJf3lfU1WHpzB43d4agXPC6zuQddgkQ9sCG4R+ckXOs4qJ4pBv6TcC
         S5DPjKms/ZQVaHzrcw712ZzlhfEsNdX1ABQN12IRj92N8wMoT8APzdnsAeJFgyMjiF
         vY2lEjX35XCNtSnsyEUM6giR3h2RmL4SDX9CY0DrPqlvIdCbsoN+zp/htlNKP0MDcm
         q6ZbWuIN8yxxFAACCdPuKX9NSoyBtVYuLHmZlCAeSrBC50Twuxy7ZK/zBYu6W6uqkD
         e0HlNZzczqQLQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra194 has six PCIe controllers based on Synopsys DesignWare core.
There are two Universal PHY (UPHY) blocks with each supporting 12(HSIO:
Hisg Speed IO) and 8(NVHS: NVIDIA High Speed) lanes respectively.
Controllers:0~4 use UPHY lanes from HSIO brick whereas Controller:5 uses
UPHY lanes from NVHS brick. Lane mapping in HSIO UPHY brick to each PCIe
controller (0~4) is controlled in XBAR module by BPMP-FW. Since PCIe
core has PIPE interface, a glue module called PIPE-to-UPHY (P2U) is used
to connect each UPHY lane (applicable to both HSIO and NVHS UPHY bricks)
to PCIe controller
This patch series
- Adds support for P2U PHY driver
- Adds support for PCIe host controller
- Adds device tree nodes each PCIe controllers
- Enables nodes applicable to p2972-0000 platform
- Adds helper APIs in Designware core driver to get capability regs offset
- Adds defines for new feature registers of PCIe spec revision 4
- Makes changes in DesignWare core driver to get Tegra194 PCIe working

Testing done on P2972-0000 platform
- Able to get PCIe link up with on-board Marvel eSATA controller
- Able to get PCIe link up with NVMe cards connected to M.2 Key-M slot
- Able to do data transfers with both SATA drives and NVMe cards

Note
- Enabling x8 slot on P2972-0000 platform requires pinmux driver for Tegra194.
  It is being worked on currently and hence Controller:5 (i.e. x8 slot) is
  disabled in this patch series. A future patch series would enable this.
- This series is based on top of the following series
  Jisheng's patches to add support to .remove() in Designware sub-system
  https://patchwork.kernel.org/project/linux-pci/list/?series=98559
  (Jisheng's patches are now accepted and applied for v5.2)
  My patches made on top of Jisheng's patches to export various symbols
  http://patchwork.ozlabs.org/project/linux-pci/list/?series=115671

Changes since [v10]:
* Removed device-tree patches from the series as they are applied to relevant
  Tegra specific trees by Thierry Reding.
* Included older Tegra chips to extend quirk that disables MSI interrupt being
  used for Tegra PCIe root ports.
* Addressed review comments in P2U driver file.

Changes since [v9]:
* Used _relaxed() versions of readl() & writel()

Changes since [v8]:
* Made the drivers dependent on ARCH_TEGRA_194_SOC directly
* Addressed review comments from Dmitry

Changes since [v7]:
* Changed P2U driver file name from pcie-p2u-tegra194.c to phy-tegra194-p2u.c
* Addressed review comments from Thierry and Rob

Changes since [v6]:
* Took care of review comments from Rob
* Added a quirk to disable MSI for root ports
* Removed using pcie_pme_disable_msi() API in host controller driver

Changes since [v5]:
* Removed patch that exports pcie_bus_config symbol
* Took care of review comments from Thierry and Rob

Changes since [v4]:
* Removed redundant APIs in pcie-designware-ep.c file after moving them
  to pcie-designware.c file based on Bjorn's review comments

Changes since [v3]:
* Rebased on top of linux-next top of the tree
* Addressed Gustavo's comments and added his Ack for some of the changes.

Changes since [v2]:
* Addressed review comments from Thierry

Changes since [v1]:
* Addressed review comments from Bjorn, Thierry, Jonathan, Rob & Kishon
* Added more patches in v2 series

Vidya Sagar (12):
  PCI: Add #defines for some of PCIe spec r4.0 features
  PCI: Disable MSI for Tegra root ports
  PCI: dwc: Perform dbi regs write lock towards the end
  PCI: dwc: Move config space capability search API
  PCI: dwc: Add ext config space capability search API
  dt-bindings: PCI: designware: Add binding for CDM register check
  PCI: dwc: Add support to enable CDM register check
  dt-bindings: Add PCIe supports-clkreq property
  dt-bindings: PCI: tegra: Add device tree support for Tegra194
  dt-bindings: PHY: P2U: Add Tegra194 P2U block
  phy: tegra: Add PCIe PIPE2UPHY support
  PCI: tegra: Add Tegra194 PCIe support

 .../bindings/pci/designware-pcie.txt          |    5 +
 .../bindings/pci/nvidia,tegra194-pcie.txt     |  155 ++
 Documentation/devicetree/bindings/pci/pci.txt |    5 +
 .../bindings/phy/phy-tegra194-p2u.txt         |   28 +
 drivers/pci/controller/dwc/Kconfig            |   10 +
 drivers/pci/controller/dwc/Makefile           |    1 +
 .../pci/controller/dwc/pcie-designware-ep.c   |   37 +-
 .../pci/controller/dwc/pcie-designware-host.c |   14 +-
 drivers/pci/controller/dwc/pcie-designware.c  |   87 +
 drivers/pci/controller/dwc/pcie-designware.h  |   12 +
 drivers/pci/controller/dwc/pcie-tegra194.c    | 1635 +++++++++++++++++
 drivers/pci/quirks.c                          |   53 +
 drivers/phy/tegra/Kconfig                     |    7 +
 drivers/phy/tegra/Makefile                    |    1 +
 drivers/phy/tegra/phy-tegra194-p2u.c          |  120 ++
 include/uapi/linux/pci_regs.h                 |   22 +-
 16 files changed, 2150 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
 create mode 100644 drivers/pci/controller/dwc/pcie-tegra194.c
 create mode 100644 drivers/phy/tegra/phy-tegra194-p2u.c

-- 
2.17.1


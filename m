Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB1FB2183D
	for <lists+linux-tegra@lfdr.de>; Fri, 17 May 2019 14:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbfEQMjJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 May 2019 08:39:09 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:18913 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728169AbfEQMjJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 May 2019 08:39:09 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdeab660000>; Fri, 17 May 2019 05:39:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 17 May 2019 05:39:06 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 17 May 2019 05:39:06 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 May
 2019 12:39:06 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 17 May 2019 12:39:06 +0000
Received: from vidyas-desktop.nvidia.com (Not Verified[10.24.37.38]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cdeab640002>; Fri, 17 May 2019 05:39:06 -0700
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
Subject: [PATCH V7 00/15] Add Tegra194 PCIe support
Date:   Fri, 17 May 2019 18:08:31 +0530
Message-ID: <20190517123846.3708-1-vidyas@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558096742; bh=u/4AQVGziCNrQ2xZIY5ClKkgupD/qrSZhq0/kL2pPfY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=RlvE92GtZrhBCY5g6Zd8L8lpTh6FL8fuplUsYjbi5BSy9ScwKBrvN11R3mRdl9HdH
         7iQRI8frfo7GYejfKff64JwMbMRDXL1k7B+jHH1coNx4EGm13piclFjAyZC+7+lsVX
         wW815Q800kLvqm9T30tPDnAnsbcheqr0gR9NPHOcwkDb669Sy3fhhw2eoF8ceI7+3S
         URa8bN6CYWnfs3RViOT8gzSB6BFtbApcy54NhmIAo/PZw1I1p+eguHOHQ4LJbKp4oI
         1bPYzm4K21l/5jW7Qhj5jnPNkkdpTvdifqT7FQQmQWA+Qgmp9ahc+LFM/NdblLQLuj
         FZOyNnlbTjqAA==
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
  https://patchwork.kernel.org/project/linux-pci/list/?series=101259

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

Vidya Sagar (15):
  PCI: Add #defines for some of PCIe spec r4.0 features
  PCI: Disable MSI for Tegra194 root port
  PCI: dwc: Perform dbi regs write lock towards the end
  PCI: dwc: Move config space capability search API
  PCI: dwc: Add ext config space capability search API
  dt-bindings: PCI: designware: Add binding for CDM register check
  PCI: dwc: Add support to enable CDM register check
  dt-bindings: Add PCIe supports-clkreq property
  dt-bindings: PCI: tegra: Add device tree support for Tegra194
  dt-bindings: PHY: P2U: Add Tegra194 P2U block
  arm64: tegra: Add P2U and PCIe controller nodes to Tegra194 DT
  arm64: tegra: Enable PCIe slots in P2972-0000 board
  phy: tegra: Add PCIe PIPE2UPHY support
  PCI: tegra: Add Tegra194 PCIe support
  arm64: Add Tegra194 PCIe driver to defconfig

 .../bindings/pci/designware-pcie.txt          |    5 +
 .../bindings/pci/nvidia,tegra194-pcie.txt     |  158 ++
 Documentation/devicetree/bindings/pci/pci.txt |    5 +
 .../bindings/phy/phy-tegra194-p2u.txt         |   28 +
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |    2 +-
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   |   41 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  437 +++++
 arch/arm64/configs/defconfig                  |    1 +
 drivers/pci/controller/dwc/Kconfig            |   10 +
 drivers/pci/controller/dwc/Makefile           |    1 +
 .../pci/controller/dwc/pcie-designware-ep.c   |   37 +-
 .../pci/controller/dwc/pcie-designware-host.c |   14 +-
 drivers/pci/controller/dwc/pcie-designware.c  |   88 +
 drivers/pci/controller/dwc/pcie-designware.h  |   12 +
 drivers/pci/controller/dwc/pcie-tegra194.c    | 1620 +++++++++++++++++
 drivers/pci/quirks.c                          |   14 +
 drivers/phy/tegra/Kconfig                     |    7 +
 drivers/phy/tegra/Makefile                    |    1 +
 drivers/phy/tegra/pcie-p2u-tegra194.c         |  109 ++
 include/uapi/linux/pci_regs.h                 |   22 +-
 20 files changed, 2569 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
 create mode 100644 drivers/pci/controller/dwc/pcie-tegra194.c
 create mode 100644 drivers/phy/tegra/pcie-p2u-tegra194.c

-- 
2.17.1


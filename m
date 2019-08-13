Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D94FA8B741
	for <lists+linux-tegra@lfdr.de>; Tue, 13 Aug 2019 13:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbfHMLh5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 13 Aug 2019 07:37:57 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:18791 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbfHMLh4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Aug 2019 07:37:56 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d52a1160000>; Tue, 13 Aug 2019 04:37:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 13 Aug 2019 04:37:56 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 13 Aug 2019 04:37:56 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 13 Aug
 2019 11:37:55 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 13 Aug 2019 11:37:55 +0000
Received: from vidyas-desktop.nvidia.com (Not Verified[10.24.37.38]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d52a10e0000>; Tue, 13 Aug 2019 04:37:55 -0700
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
Subject: [PATCH V16 11/13] dt-bindings: PHY: P2U: Add Tegra194 P2U block
Date:   Tue, 13 Aug 2019 17:06:25 +0530
Message-ID: <20190813113627.27251-12-vidyas@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190813113627.27251-1-vidyas@nvidia.com>
References: <20190813113627.27251-1-vidyas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1565696278; bh=Vdd2VSumfzaEhairOxY7KEXJ0QuJYlnQSwYQFm9/8EM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=rEa6SXAc3bYcFletBkvqGLd0zScjdN+AfzTYKey4H8ATdpZnz7HtfYRG316QN9Hth
         bbg9NAbAIekxjwoKdVku7DYfonlv7EM96EsHKyoqZe3KjCj6CoMcyr3xjoGFy8F4s/
         0EYWiqBUh2XBxY0HA/FwA+X7Qf8tDQunEnJKdUz+SwkgPawB7lN9xtRphA8w+JzbsG
         4LDGisASWYbxQDDTkUcIYO+SEaxXw9fQa8i3CqP/HoyUaI07e+kdzl5wl8T5h0z5VI
         ohbrhxmAbThNuUuSMCVSWdfsH/Hq7ljQZGCmQ7LV1iscRmuxBMIskaVhsYy+OAEgJg
         AUVwwyfXu+W1w==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add support for Tegra194 P2U (PIPE to UPHY) module block which is a glue
module instantiated one for each PCIe lane between Synopsys DesignWare core
based PCIe IP and Universal PHY block.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Thierry Reding <treding@nvidia.com>
Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
---
V16:
* None

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
* None

V6:
* Added Sob
* Changed node name from "p2u@xxxxxxxx" to "phy@xxxxxxxx"

V5:
* None

V4:
* None

V3:
* Changed node label to reflect new format that includes either 'hsio' or
  'nvhs' in its name to reflect which UPHY brick they belong to

V2:
* This is a new patch in v2 series

 .../bindings/phy/phy-tegra194-p2u.txt         | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt b/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
new file mode 100644
index 000000000000..d23ff90baad5
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
@@ -0,0 +1,28 @@
+NVIDIA Tegra194 P2U binding
+
+Tegra194 has two PHY bricks namely HSIO (High Speed IO) and NVHS (NVIDIA High
+Speed) each interfacing with 12 and 8 P2U instances respectively.
+A P2U instance is a glue logic between Synopsys DesignWare Core PCIe IP's PIPE
+interface and PHY of HSIO/NVHS bricks. Each P2U instance represents one PCIe
+lane.
+
+Required properties:
+- compatible: For Tegra19x, must contain "nvidia,tegra194-p2u".
+- reg: Should be the physical address space and length of respective each P2U
+       instance.
+- reg-names: Must include the entry "ctl".
+
+Required properties for PHY port node:
+- #phy-cells: Defined by generic PHY bindings.  Must be 0.
+
+Refer to phy/phy-bindings.txt for the generic PHY binding properties.
+
+Example:
+
+p2u_hsio_0: phy@3e10000 {
+	compatible = "nvidia,tegra194-p2u";
+	reg = <0x03e10000 0x10000>;
+	reg-names = "ctl";
+
+	#phy-cells = <0>;
+};
-- 
2.17.1


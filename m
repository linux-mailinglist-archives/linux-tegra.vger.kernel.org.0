Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6002F12B475
	for <lists+linux-tegra@lfdr.de>; Fri, 27 Dec 2019 13:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbfL0MTN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 27 Dec 2019 07:19:13 -0500
Received: from mga01.intel.com ([192.55.52.88]:58377 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbfL0MTM (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Dec 2019 07:19:12 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Dec 2019 04:19:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,363,1571727600"; 
   d="scan'208";a="419706942"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Dec 2019 04:19:10 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1ikoaD-0000Cc-Un; Fri, 27 Dec 2019 20:19:09 +0800
Date:   Fri, 27 Dec 2019 20:18:51 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Palmer Dabbelt <palmer@sifive.com>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        Bjorn Helgaas <helgaas@kernel.org>,
        Michal Simek <monstr@monstr.eu>,
        Thierry Reding <thierry.reding@gmail.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andrew Murray <andrew.murray@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org
Subject: [PATCH] PCI: fix ptr_ret.cocci warnings
Message-ID: <20191227121851.gpmaugxrysxejmpy@4978f4969bb8>
References: <201912272041.iVxC623g%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201912272041.iVxC623g%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: kbuild test robot <lkp@intel.com>

drivers/pci/controller/pci-tegra.c:1365:1-3: WARNING: PTR_ERR_OR_ZERO can be used


 Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

Generated by: scripts/coccinelle/api/ptr_ret.cocci

Fixes: 191d6f91f283 ("PCI: Remove PCI_MSI_IRQ_DOMAIN architecture whitelist")
CC: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: kbuild test robot <lkp@intel.com>
---

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   46cf053efec6a3a5f343fead837777efe8252a46
commit: 191d6f91f283dfb007499bb8529d54c3ac434bd7 PCI: Remove PCI_MSI_IRQ_DOMAIN architecture whitelist

 pci-tegra.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -1362,10 +1362,7 @@ static int tegra_pcie_resets_get(struct
 		return PTR_ERR(pcie->afi_rst);
 
 	pcie->pcie_xrst = devm_reset_control_get_exclusive(dev, "pcie_x");
-	if (IS_ERR(pcie->pcie_xrst))
-		return PTR_ERR(pcie->pcie_xrst);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(pcie->pcie_xrst);
 }
 
 static int tegra_pcie_phys_get_legacy(struct tegra_pcie *pcie)

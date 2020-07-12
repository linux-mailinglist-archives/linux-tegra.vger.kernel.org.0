Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AAFB21C894
	for <lists+linux-tegra@lfdr.de>; Sun, 12 Jul 2020 12:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbgGLKdx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 12 Jul 2020 06:33:53 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6221 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727777AbgGLKdx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Jul 2020 06:33:53 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0ae6a20000>; Sun, 12 Jul 2020 03:32:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 12 Jul 2020 03:33:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 12 Jul 2020 03:33:53 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 12 Jul
 2020 10:33:52 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 12 Jul 2020 10:33:52 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.75.246]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0ae7100000>; Sun, 12 Jul 2020 03:33:52 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] memory: tegra: Fix KCONFIG variables for Tegra186 and Tegra194
Date:   Sun, 12 Jul 2020 11:33:47 +0100
Message-ID: <20200712103347.25070-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594549922; bh=XXLpNASfBPd/iAWcJVC9NU/Ga5s++KsUtoAlq667T9Y=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=T8/XJdb58N3LIRUXURjR1/qNGWJAmdR+ptDsm5er//eEIwGCoNVIHIRuaQVyZpfJE
         6EGwHSlj0wvmA9v2G25YLyfGDgYRGcEYZZsoyHTAHO2+KJUbE72V/C2Ot7e/hL9+G4
         Z3FECcRnhUdoRTqluM2DxYTLQbWMC5sGj2cWR9GmP2sbZ86A0iGKUfOX+GlLVyNV7e
         W6UB2wxXLznaSGCNQh/KitgE7FOF9z12PZ1zxr3aLh5oBIUXiWihlwuD9b1O/EUSI0
         hRfIIohfmrU3QcHgaz33BSCsQlPLWyLQwBVVl+8lC02egYhw1l6ogb6JXBuYuV2ybG
         NEWVKdJzqgqBA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit a127e690b051 ("memory: tegra: Add support for the Tegra194 memory
controller") and commit 4e04b88633ae ("memory: tegra: Only include
support for enabled SoCs") incorrectly added the KCONFIG variables
CONFIG_ARCH_TEGRA186_SOC and CONFIG_ARCH_TEGRA194_SOC to the Tegra EMC
driver. These KCONFIG variables do not exist and prevent the EMC driver
from being probed on Tegra186 and Tegra194. These KCONFIG variable
names are simply missing one underscore and so fix this by adding the
necessary underscore to the variable names.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/memory/tegra/tegra186-emc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index 9333ebe4c918..1d0a12164fe7 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -268,10 +268,10 @@ static int tegra186_emc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra186_emc_of_match[] = {
-#if defined(CONFIG_ARCH_TEGRA186_SOC)
+#if defined(CONFIG_ARCH_TEGRA_186_SOC)
 	{ .compatible = "nvidia,tegra186-emc" },
 #endif
-#if defined(CONFIG_ARCH_TEGRA194_SOC)
+#if defined(CONFIG_ARCH_TEGRA_194_SOC)
 	{ .compatible = "nvidia,tegra194-emc" },
 #endif
 	{ /* sentinel */ }
-- 
2.17.1


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E44E1A3221
	for <lists+linux-tegra@lfdr.de>; Thu,  9 Apr 2020 11:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgDIJzs (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 9 Apr 2020 05:55:48 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:6186 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgDIJzr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Apr 2020 05:55:47 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8ef0ee0000>; Thu, 09 Apr 2020 02:54:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 09 Apr 2020 02:55:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 09 Apr 2020 02:55:47 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Apr
 2020 09:55:47 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 9 Apr 2020 09:55:47 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.73.58]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e8ef1210001>; Thu, 09 Apr 2020 02:55:47 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vidya Sagar <vidyas@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: defconfig: Re-enable Tegra PCIe Host driver
Date:   Thu, 9 Apr 2020 10:55:30 +0100
Message-ID: <20200409095530.12004-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586426094; bh=LC+xdxWnqrjeSuG6FbiFd91p56RmdIaWaTsvY+88hs0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=d+NFzngmRDCjLzZ/7jgwMohEtEFfkoWEYCBhmwabkTUgkH4OZY90wDi4yXlpdmc9w
         00tJIGVHH40hDZKXDwtlYmjsGk+3j+KaJFx90W13XdqW3wRTuCAzD1zprXKMTyFAOK
         2PAyY0JfiuUbkx49MWMKtvEV7ajugZRggGUenD0e6MCfR24Qj15nPpE8NJXYqLpYg+
         U7vSsKs2oSjz/sYFfYrUQOEIKvb0nQdIsGocOk+IhiS7bX+cwqSfw9zwvb1mqYKjwY
         5uQTMY8PVXi8IITDDGpdmxo9fmrwMoJw/6A3ogNJCs9i9Yri3eOsW8aVb7f5wyNzc9
         3iHJK/qyCGQ+A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit c57247f940e8 ("PCI: tegra: Add support for PCIe endpoint mode in
Tegra194") updated the Tegra PCIe Kconfig symbol for building the Tegra
PCIe host controller driver. Following this change the Tegra PCIe host
controller driver is no longer built by default and so no works without
updating the arm64 defconfig. Fix this by updating the Kconfig symbol
in the arm64 for the Tegra PCIe host controller so that again it is
built by default.

Fixes: c57247f940e8 ("PCI: tegra: Add support for PCIe endpoint mode in Tegra194")

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Please note that this is needed as a fix for v5.7.

 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 24e534d85045..266ad7b5ce91 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -208,7 +208,7 @@ CONFIG_PCIE_QCOM=y
 CONFIG_PCIE_ARMADA_8K=y
 CONFIG_PCIE_KIRIN=y
 CONFIG_PCIE_HISI_STB=y
-CONFIG_PCIE_TEGRA194=m
+CONFIG_PCIE_TEGRA194_HOST=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y
-- 
2.17.1


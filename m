Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5872B11A23
	for <lists+linux-tegra@lfdr.de>; Thu,  2 May 2019 15:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbfEBN1g (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 2 May 2019 09:27:36 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:17192 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbfEBN1g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 May 2019 09:27:36 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ccaf04e0000>; Thu, 02 May 2019 06:27:42 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 02 May 2019 06:27:35 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 02 May 2019 06:27:35 -0700
Received: from HQMAIL112.nvidia.com (172.18.146.18) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 May
 2019 13:27:35 +0000
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL112.nvidia.com
 (172.18.146.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 May
 2019 13:27:34 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 2 May 2019 13:27:34 +0000
Received: from moonraker.nvidia.com (Not Verified[10.21.132.148]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ccaf0450000>; Thu, 02 May 2019 06:27:34 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Will Deacon <will.deacon@arm.com>,
        Douglas Anderson <dianders@chromium.org>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Fix insecure SMMU users for Tegra186
Date:   Thu, 2 May 2019 14:27:21 +0100
Message-ID: <1556803641-22305-1-git-send-email-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1556803662; bh=+aH9/Je9oFGA1kQ26AoBccTyj0n7RzynDWAo6IIw0uo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:Content-Type;
        b=MrrZGV6GGhCihPEZUmAQEk1/QgOXSU4J37gY/lv0pEz4teBo9ymsaMICxlLujHrxU
         e16YA4xfXy66wofgDPMHnxXkYFDu84JPnPL6Q1EZPKfxMERoV0JJbCKKsIM3NL6fuQ
         Eg7Lme76Txm4gRuzMJDHE9UdRIkm9XqSTPnn3N0N7S8ET2ibSOUdsBuF67qRkKoCI6
         NnWQA/JMCI5wjWhY4/5VMK+uHhDBTnu7P6gcIZylL36uY4nCNiZGs960x5DaHOJGU2
         ZD1D3jCa7VYK1GV0ge5MEfdbTwnEBX+eDOz78SanKQFje8vribhkfe8y3RI4MwNCkx
         CIqeC0Getfp9A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Jonathan Hunter <jonathanh@nvidia.com>

Commit 954a03be033c ("iommu/arm-smmu: Break insecure users by disabling
bypass by default") intentionally breaks all devices using the SMMU in
bypass mode. This is breaking various devices on Tegra186 which include
the ethernet, BPMP and HDA device. Fix this by populating the SMMU node
for these devices with their stream ID.

Fixes: 954a03be033c ("iommu/arm-smmu: Break insecure users by disabling bypass by default")

Signed-off-by: Jonathan Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index f0bb6ced4976..3fb60f6f3a93 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -60,6 +60,7 @@
 		clock-names = "master_bus", "slave_bus", "rx", "tx", "ptp_ref";
 		resets = <&bpmp TEGRA186_RESET_EQOS>;
 		reset-names = "eqos";
+		iommus = <&smmu TEGRA186_SID_EQOS>;
 		status = "disabled";
 
 		snps,write-requests = <1>;
@@ -338,6 +339,7 @@
 			 <&bpmp TEGRA186_RESET_HDA2CODEC_2X>;
 		reset-names = "hda", "hda2hdmi", "hda2codec_2x";
 		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
+		iommus = <&smmu TEGRA186_SID_HDA>;
 		status = "disabled";
 	};
 
@@ -1158,6 +1160,7 @@
 
 	bpmp: bpmp {
 		compatible = "nvidia,tegra186-bpmp";
+		iommus = <&smmu TEGRA186_SID_BPMP>;
 		mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB
 				    TEGRA_HSP_DB_MASTER_BPMP>;
 		shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
-- 
1.9.1


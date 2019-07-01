Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCFA14937
	for <lists+linux-tegra@lfdr.de>; Mon,  6 May 2019 13:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbfEFL6h (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 6 May 2019 07:58:37 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:18880 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfEFL6g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 May 2019 07:58:36 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd021710000>; Mon, 06 May 2019 04:58:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 06 May 2019 04:58:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 06 May 2019 04:58:34 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 May
 2019 11:58:34 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 6 May 2019 11:58:34 +0000
Received: from linux.nvidia.com (Not Verified[10.24.34.185]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cd021670002>; Mon, 06 May 2019 04:58:33 -0700
From:   Sameer Pujar <spujar@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 1/2] arm64: tegra: add ACONNECT, ADMA and AGIC nodes
Date:   Mon, 6 May 2019 17:28:27 +0530
Message-ID: <1557143908-5850-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557143921; bh=iEl3bweIliucr2ZYq6qkgeGG+bz2hS15qxHGGPsi6WA=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:Content-Type;
        b=dTlm8se5G86M+S6X3D4OdUWy4GDwFRxo4XBhRuGcAAnY8Y30sJ21WCsO2VtsVOmef
         ptWutsbbhZ/HZcNyZvQ+IgUoi1t4dJ2AYrJR1C06/1WZRudOo1zKtbTTZsiHcJjFqv
         2lxmNdIpQ+dZCqeJA+WP+xMvS+MaxHS2GeE0mNKt/prP4e0Zprzn9MEVZeLqPbWJzG
         x/XPe9rVAu7/6wTm8OP6SjScUxjY9mzHD8Gw2r1Jj8vFWXy8wPXyXAWQwfsLFXabVX
         9CoxIPz3/GtCGU5u8oVzVdHXdUEtg2H+Gx8NlTBgEktbbm3/j7oWYU+nXx7vQUAZ3+
         IzniDFqmE19Jw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add DT nodes for following devices on Tegra186 and Tegra194
 * ACONNECT
 * ADMA
 * AGIC

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 67 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 67 ++++++++++++++++++++++++++++++++
 2 files changed, 134 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 6e2b6ce..2c432c9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1153,4 +1153,71 @@
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-parent = <&gic>;
 	};
+
+	aconnect@2a41000 {
+		compatible = "nvidia,tegra210-aconnect";
+		clocks = <&bpmp TEGRA186_CLK_APE>,
+			 <&bpmp TEGRA186_CLK_APB2APE>;
+		clock-names = "ape", "apb2ape";
+		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_AUD>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+
+		dma@2930000 {
+			compatible = "nvidia,tegra186-adma";
+			reg = <0x0 0x02930000 0x0 0x50000>;
+			interrupt-parent = <&agic>;
+			interrupts =  <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH 0>;
+			#dma-cells = <1>;
+			clocks = <&bpmp TEGRA186_CLK_AHUB>;
+			clock-names = "d_audio";
+			status = "disabled";
+		};
+
+		agic: agic@2a41000 {
+			compatible = "nvidia,tegra210-agic";
+			#interrupt-cells = <4>;
+			interrupt-controller;
+			reg = <0x0 0x02a41000 0x0 0x1000>,
+			      <0x0 0x02a42000 0x0 0x1000>;
+			interrupts = <GIC_SPI 145 (GIC_CPU_MASK_SIMPLE(4) |
+					IRQ_TYPE_LEVEL_HIGH)>;
+			clocks = <&bpmp TEGRA186_CLK_APE>;
+			clock-names = "clk";
+			status = "disabled";
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index c77ca21..dcab504 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1054,4 +1054,71 @@
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-parent = <&gic>;
 	};
+
+	aconnect@2a41000 {
+		compatible = "nvidia,tegra210-aconnect";
+		clocks = <&bpmp TEGRA194_CLK_APE>,
+			 <&bpmp TEGRA194_CLK_APB2APE>;
+		clock-names = "ape", "apb2ape";
+		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_AUD>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+
+		dma@2930000 {
+			compatible = "nvidia,tegra186-adma";
+			reg = <0x0 0x02930000 0x0 0x50000>;
+			interrupt-parent = <&agic>;
+			interrupts =  <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH 0>,
+				      <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH 0>;
+			#dma-cells = <1>;
+			clocks = <&bpmp TEGRA194_CLK_AHUB>;
+			clock-names = "d_audio";
+			status = "disabled";
+		};
+
+		agic: agic@2a41000 {
+			compatible = "nvidia,tegra210-agic";
+			#interrupt-cells = <4>;
+			interrupt-controller;
+			reg = <0x0 0x02a41000 0x0 0x1000>,
+			      <0x0 0x02a42000 0x0 0x1000>;
+			interrupts = <GIC_SPI 145 (GIC_CPU_MASK_SIMPLE(4) |
+					IRQ_TYPE_LEVEL_HIGH)>;
+			clocks = <&bpmp TEGRA194_CLK_APE>;
+			clock-names = "clk";
+			status = "disabled";
+		};
+	};
 };
-- 
2.7.4


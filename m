Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A03420BE9F
	for <lists+linux-tegra@lfdr.de>; Sat, 27 Jun 2020 06:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgF0E4T (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 27 Jun 2020 00:56:19 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17444 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgF0E4Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Jun 2020 00:56:16 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ef6d15e0000>; Fri, 26 Jun 2020 21:55:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 26 Jun 2020 21:56:10 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 26 Jun 2020 21:56:10 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 27 Jun
 2020 04:56:10 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 27 Jun 2020 04:56:10 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ef6d1650000>; Fri, 26 Jun 2020 21:56:09 -0700
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <digetx@gmail.com>, <alsa-devel@alsa-project.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v4 21/23] arm64: tegra: Add DT binding for AHUB components
Date:   Sat, 27 Jun 2020 10:23:43 +0530
Message-ID: <1593233625-14961-22-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593233758; bh=X3YyiK0xpYPzFF+dnaYm2FoSIykjXVI8tc3lmHIk50k=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:Content-Type;
        b=n9oUvbNfy0GcZ8p0PRJJEigWOs3D6Px3wDjZ18Say+v2klDKuPGtD3WE23gAwBRWP
         0x7P3Zb8/M6YEfHsDGzVSi/C23b50YSbhYaBuHG8GfMpn/feK/aC6FzCGzHggpgoCs
         HX4d0F2eQHBySX7WgfBnuRaFJBXCYJD045rgGnvkDke4HiM2Ob1zQKhdmq63Ekbzpy
         iojFA3N+DCSjlorl5xIl25dUch1AVB+lc7W5bSB8VT6NQI/CtBu1gy25ZdUtTBEUQa
         pxRlQ200uZzYr5sieAMaGI6sSJZgvAv5q9LJmx/+Jr7lGtcZ0qGrWAZn8xgOyGtm95
         NoW+AWfLvCeeQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch adds few AHUB modules for Tegra210, Tegra186 and Tegra194.
Bindings for following modules are added.
 * AHUB added as a child node under ACONNECT
 * AHUB includes many HW accelerators and below components are added
   as its children.
   * ADMAIF
   * I2S
   * DMIC
   * DSPK (added for Tegra186 and Tegra194 only, since Tegra210 does
     not have this module)

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 231 ++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 239 ++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 152 +++++++++++++++++++-
 3 files changed, 619 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 34d249d..01bae88 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -85,7 +85,7 @@
 		ranges = <0x02900000 0x0 0x02900000 0x200000>;
 		status = "disabled";
 
-		dma-controller@2930000 {
+		adma: dma-controller@2930000 {
 			compatible = "nvidia,tegra186-adma";
 			reg = <0x02930000 0x20000>;
 			interrupt-parent = <&agic>;
@@ -140,6 +140,235 @@
 			clock-names = "clk";
 			status = "disabled";
 		};
+
+		tegra_ahub: ahub@2900800 {
+			compatible = "nvidia,tegra186-ahub";
+			reg = <0x02900800 0x800>;
+			clocks = <&bpmp TEGRA186_CLK_AHUB>;
+			clock-names = "ahub";
+			assigned-clocks = <&bpmp TEGRA186_CLK_AHUB>;
+			assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x02900800 0x02900800 0x11800>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+
+			tegra_admaif: admaif@290f000 {
+				compatible = "nvidia,tegra186-admaif";
+				reg = <0x0290f000 0x1000>;
+				dmas = <&adma 1>, <&adma 1>,
+				       <&adma 2>, <&adma 2>,
+				       <&adma 3>, <&adma 3>,
+				       <&adma 4>, <&adma 4>,
+				       <&adma 5>, <&adma 5>,
+				       <&adma 6>, <&adma 6>,
+				       <&adma 7>, <&adma 7>,
+				       <&adma 8>, <&adma 8>,
+				       <&adma 9>, <&adma 9>,
+				       <&adma 10>, <&adma 10>,
+				       <&adma 11>, <&adma 11>,
+				       <&adma 12>, <&adma 12>,
+				       <&adma 13>, <&adma 13>,
+				       <&adma 14>, <&adma 14>,
+				       <&adma 15>, <&adma 15>,
+				       <&adma 16>, <&adma 16>,
+				       <&adma 17>, <&adma 17>,
+				       <&adma 18>, <&adma 18>,
+				       <&adma 19>, <&adma 19>,
+				       <&adma 20>, <&adma 20>;
+				dma-names = "rx1", "tx1",
+					    "rx2", "tx2",
+					    "rx3", "tx3",
+					    "rx4", "tx4",
+					    "rx5", "tx5",
+					    "rx6", "tx6",
+					    "rx7", "tx7",
+					    "rx8", "tx8",
+					    "rx9", "tx9",
+					    "rx10", "tx10",
+					    "rx11", "tx11",
+					    "rx12", "tx12",
+					    "rx13", "tx13",
+					    "rx14", "tx14",
+					    "rx15", "tx15",
+					    "rx16", "tx16",
+					    "rx17", "tx17",
+					    "rx18", "tx18",
+					    "rx19", "tx19",
+					    "rx20", "tx20";
+				#sound-dai-cells = <1>;
+				status = "disabled";
+			};
+
+			tegra_i2s1: i2s@2901000 {
+				compatible = "nvidia,tegra186-i2s",
+					     "nvidia,tegra210-i2s";
+				reg = <0x2901000 0x100>;
+				clocks = <&bpmp TEGRA186_CLK_I2S1>,
+					 <&bpmp TEGRA186_CLK_I2S1_SYNC_INPUT>;
+				clock-names = "i2s", "sync_input";
+				assigned-clocks = <&bpmp TEGRA186_CLK_I2S1>;
+				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <1536000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "I2S1";
+				status = "disabled";
+			};
+
+			tegra_i2s2: i2s@2901100 {
+				compatible = "nvidia,tegra186-i2s",
+					     "nvidia,tegra210-i2s";
+				reg = <0x2901100 0x100>;
+				clocks = <&bpmp TEGRA186_CLK_I2S2>,
+					 <&bpmp TEGRA186_CLK_I2S2_SYNC_INPUT>;
+				clock-names = "i2s", "sync_input";
+				assigned-clocks = <&bpmp TEGRA186_CLK_I2S2>;
+				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <1536000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "I2S2";
+				status = "disabled";
+			};
+
+			tegra_i2s3: i2s@2901200 {
+				compatible = "nvidia,tegra186-i2s",
+					     "nvidia,tegra210-i2s";
+				reg = <0x2901200 0x100>;
+				clocks = <&bpmp TEGRA186_CLK_I2S3>,
+					 <&bpmp TEGRA186_CLK_I2S3_SYNC_INPUT>;
+				clock-names = "i2s", "sync_input";
+				assigned-clocks = <&bpmp TEGRA186_CLK_I2S3>;
+				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <1536000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "I2S3";
+				status = "disabled";
+			};
+
+			tegra_i2s4: i2s@2901300 {
+				compatible = "nvidia,tegra186-i2s",
+					     "nvidia,tegra210-i2s";
+				reg = <0x2901300 0x100>;
+				clocks = <&bpmp TEGRA186_CLK_I2S4>,
+					 <&bpmp TEGRA186_CLK_I2S4_SYNC_INPUT>;
+				clock-names = "i2s", "sync_input";
+				assigned-clocks = <&bpmp TEGRA186_CLK_I2S4>;
+				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <1536000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "I2S4";
+				status = "disabled";
+			};
+
+			tegra_i2s5: i2s@2901400 {
+				compatible = "nvidia,tegra186-i2s",
+					     "nvidia,tegra210-i2s";
+				reg = <0x2901400 0x100>;
+				clocks = <&bpmp TEGRA186_CLK_I2S5>,
+					 <&bpmp TEGRA186_CLK_I2S5_SYNC_INPUT>;
+				clock-names = "i2s", "sync_input";
+				assigned-clocks = <&bpmp TEGRA186_CLK_I2S5>;
+				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <1536000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "I2S5";
+				status = "disabled";
+			};
+
+			tegra_i2s6: i2s@2901500 {
+				compatible = "nvidia,tegra186-i2s",
+					     "nvidia,tegra210-i2s";
+				reg = <0x2901500 0x100>;
+				clocks = <&bpmp TEGRA186_CLK_I2S6>,
+					 <&bpmp TEGRA186_CLK_I2S6_SYNC_INPUT>;
+				clock-names = "i2s", "sync_input";
+				assigned-clocks = <&bpmp TEGRA186_CLK_I2S6>;
+				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <1536000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "I2S6";
+				status = "disabled";
+			};
+
+			tegra_dmic1: dmic@2904000 {
+				compatible = "nvidia,tegra210-dmic";
+				reg = <0x2904000 0x100>;
+				clocks = <&bpmp TEGRA186_CLK_DMIC1>;
+				clock-names = "dmic";
+				assigned-clocks = <&bpmp TEGRA186_CLK_DMIC1>;
+				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <3072000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "DMIC1";
+				status = "disabled";
+			};
+
+			tegra_dmic2: dmic@2904100 {
+				compatible = "nvidia,tegra210-dmic";
+				reg = <0x2904100 0x100>;
+				clocks = <&bpmp TEGRA186_CLK_DMIC2>;
+				clock-names = "dmic";
+				assigned-clocks = <&bpmp TEGRA186_CLK_DMIC2>;
+				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <3072000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "DMIC2";
+				status = "disabled";
+			};
+
+			tegra_dmic3: dmic@2904200 {
+				compatible = "nvidia,tegra210-dmic";
+				reg = <0x2904200 0x100>;
+				clocks = <&bpmp TEGRA186_CLK_DMIC3>;
+				clock-names = "dmic";
+				assigned-clocks = <&bpmp TEGRA186_CLK_DMIC3>;
+				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <3072000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "DMIC3";
+				status = "disabled";
+			};
+
+			tegra_dmic4: dmic@2904300 {
+				compatible = "nvidia,tegra210-dmic";
+				reg = <0x2904300 0x100>;
+				clocks = <&bpmp TEGRA186_CLK_DMIC4>;
+				clock-names = "dmic";
+				assigned-clocks = <&bpmp TEGRA186_CLK_DMIC4>;
+				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <3072000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "DMIC4";
+				status = "disabled";
+			};
+
+			tegra_dspk1: dspk@2905000 {
+				compatible = "nvidia,tegra186-dspk";
+				reg = <0x2905000 0x100>;
+				clocks = <&bpmp TEGRA186_CLK_DSPK1>;
+				clock-names = "dspk";
+				assigned-clocks = <&bpmp TEGRA186_CLK_DSPK1>;
+				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <12288000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "DSPK1";
+				status = "disabled";
+			};
+
+			tegra_dspk2: dspk@2905100 {
+				compatible = "nvidia,tegra186-dspk";
+				reg = <0x2905100 0x100>;
+				clocks = <&bpmp TEGRA186_CLK_DSPK2>;
+				clock-names = "dspk";
+				assigned-clocks = <&bpmp TEGRA186_CLK_DSPK2>;
+				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <12288000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "DSPK2";
+				status = "disabled";
+			};
+		};
 	};
 
 	mc: memory-controller@2c00000 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index ea629da..7fa3873 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -83,7 +83,7 @@
 			ranges = <0x02900000 0x02900000 0x200000>;
 			status = "disabled";
 
-			dma-controller@2930000 {
+			adma: dma-controller@2930000 {
 				compatible = "nvidia,tegra194-adma",
 					     "nvidia,tegra186-adma";
 				reg = <0x02930000 0x20000>;
@@ -140,6 +140,243 @@
 				clock-names = "clk";
 				status = "disabled";
 			};
+
+			tegra_ahub: ahub@2900800 {
+				compatible = "nvidia,tegra194-ahub",
+					     "nvidia,tegra186-ahub";
+				reg = <0x02900800 0x800>;
+				clocks = <&bpmp TEGRA194_CLK_AHUB>;
+				clock-names = "ahub";
+				assigned-clocks = <&bpmp TEGRA194_CLK_AHUB>;
+				assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x02900800 0x02900800 0x11800>;
+				#sound-dai-cells = <1>;
+				status = "disabled";
+
+				tegra_admaif: admaif@290f000 {
+					compatible = "nvidia,tegra194-admaif",
+						     "nvidia,tegra186-admaif";
+					reg = <0x0290f000 0x1000>;
+					dmas = <&adma 1>, <&adma 1>,
+					       <&adma 2>, <&adma 2>,
+					       <&adma 3>, <&adma 3>,
+					       <&adma 4>, <&adma 4>,
+					       <&adma 5>, <&adma 5>,
+					       <&adma 6>, <&adma 6>,
+					       <&adma 7>, <&adma 7>,
+					       <&adma 8>, <&adma 8>,
+					       <&adma 9>, <&adma 9>,
+					       <&adma 10>, <&adma 10>,
+					       <&adma 11>, <&adma 11>,
+					       <&adma 12>, <&adma 12>,
+					       <&adma 13>, <&adma 13>,
+					       <&adma 14>, <&adma 14>,
+					       <&adma 15>, <&adma 15>,
+					       <&adma 16>, <&adma 16>,
+					       <&adma 17>, <&adma 17>,
+					       <&adma 18>, <&adma 18>,
+					       <&adma 19>, <&adma 19>,
+					       <&adma 20>, <&adma 20>;
+					dma-names = "rx1", "tx1",
+						    "rx2", "tx2",
+						    "rx3", "tx3",
+						    "rx4", "tx4",
+						    "rx5", "tx5",
+						    "rx6", "tx6",
+						    "rx7", "tx7",
+						    "rx8", "tx8",
+						    "rx9", "tx9",
+						    "rx10", "tx10",
+						    "rx11", "tx11",
+						    "rx12", "tx12",
+						    "rx13", "tx13",
+						    "rx14", "tx14",
+						    "rx15", "tx15",
+						    "rx16", "tx16",
+						    "rx17", "tx17",
+						    "rx18", "tx18",
+						    "rx19", "tx19",
+						    "rx20", "tx20";
+					#sound-dai-cells = <1>;
+					status = "disabled";
+				};
+
+				tegra_i2s1: i2s@2901000 {
+					compatible = "nvidia,tegra194-i2s",
+						     "nvidia,tegra210-i2s";
+					reg = <0x2901000 0x100>;
+					clocks = <&bpmp TEGRA194_CLK_I2S1>,
+						 <&bpmp TEGRA194_CLK_I2S1_SYNC_INPUT>;
+					clock-names = "i2s", "sync_input";
+					assigned-clocks = <&bpmp TEGRA194_CLK_I2S1>;
+					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
+					assigned-clock-rates = <1536000>;
+					#sound-dai-cells = <1>;
+					sound-name-prefix = "I2S1";
+					status = "disabled";
+				};
+
+				tegra_i2s2: i2s@2901100 {
+					compatible = "nvidia,tegra194-i2s",
+						     "nvidia,tegra210-i2s";
+					reg = <0x2901100 0x100>;
+					clocks = <&bpmp TEGRA194_CLK_I2S2>,
+						 <&bpmp TEGRA194_CLK_I2S2_SYNC_INPUT>;
+					clock-names = "i2s", "sync_input";
+					assigned-clocks = <&bpmp TEGRA194_CLK_I2S2>;
+					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
+					assigned-clock-rates = <1536000>;
+					#sound-dai-cells = <1>;
+					sound-name-prefix = "I2S2";
+					status = "disabled";
+				};
+
+				tegra_i2s3: i2s@2901200 {
+					compatible = "nvidia,tegra194-i2s",
+						     "nvidia,tegra210-i2s";
+					reg = <0x2901200 0x100>;
+					clocks = <&bpmp TEGRA194_CLK_I2S3>,
+						 <&bpmp TEGRA194_CLK_I2S3_SYNC_INPUT>;
+					clock-names = "i2s", "sync_input";
+					assigned-clocks = <&bpmp TEGRA194_CLK_I2S3>;
+					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
+					assigned-clock-rates = <1536000>;
+					#sound-dai-cells = <1>;
+					sound-name-prefix = "I2S3";
+					status = "disabled";
+				};
+
+				tegra_i2s4: i2s@2901300 {
+					compatible = "nvidia,tegra194-i2s",
+						     "nvidia,tegra210-i2s";
+					reg = <0x2901300 0x100>;
+					clocks = <&bpmp TEGRA194_CLK_I2S4>,
+						 <&bpmp TEGRA194_CLK_I2S4_SYNC_INPUT>;
+					clock-names = "i2s", "sync_input";
+					assigned-clocks = <&bpmp TEGRA194_CLK_I2S4>;
+					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
+					assigned-clock-rates = <1536000>;
+					#sound-dai-cells = <1>;
+					sound-name-prefix = "I2S4";
+					status = "disabled";
+				};
+
+				tegra_i2s5: i2s@2901400 {
+					compatible = "nvidia,tegra194-i2s",
+						     "nvidia,tegra210-i2s";
+					reg = <0x2901400 0x100>;
+					clocks = <&bpmp TEGRA194_CLK_I2S5>,
+						 <&bpmp TEGRA194_CLK_I2S5_SYNC_INPUT>;
+					clock-names = "i2s", "sync_input";
+					assigned-clocks = <&bpmp TEGRA194_CLK_I2S5>;
+					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
+					assigned-clock-rates = <1536000>;
+					#sound-dai-cells = <1>;
+					sound-name-prefix = "I2S5";
+					status = "disabled";
+				};
+
+				tegra_i2s6: i2s@2901500 {
+					compatible = "nvidia,tegra194-i2s",
+						     "nvidia,tegra210-i2s";
+					reg = <0x2901500 0x100>;
+					clocks = <&bpmp TEGRA194_CLK_I2S6>,
+						 <&bpmp TEGRA194_CLK_I2S6_SYNC_INPUT>;
+					clock-names = "i2s", "sync_input";
+					assigned-clocks = <&bpmp TEGRA194_CLK_I2S6>;
+					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
+					assigned-clock-rates = <1536000>;
+					#sound-dai-cells = <1>;
+					sound-name-prefix = "I2S6";
+					status = "disabled";
+				};
+
+				tegra_dmic1: dmic@2904000 {
+					compatible = "nvidia,tegra194-dmic",
+						     "nvidia,tegra210-dmic";
+					reg = <0x2904000 0x100>;
+					clocks = <&bpmp TEGRA194_CLK_DMIC1>;
+					clock-names = "dmic";
+					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC1>;
+					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
+					assigned-clock-rates = <3072000>;
+					#sound-dai-cells = <1>;
+					sound-name-prefix = "DMIC1";
+					status = "disabled";
+				};
+
+				tegra_dmic2: dmic@2904100 {
+					compatible = "nvidia,tegra194-dmic",
+						     "nvidia,tegra210-dmic";
+					reg = <0x2904100 0x100>;
+					clocks = <&bpmp TEGRA194_CLK_DMIC2>;
+					clock-names = "dmic";
+					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC2>;
+					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
+					assigned-clock-rates = <3072000>;
+					#sound-dai-cells = <1>;
+					sound-name-prefix = "DMIC2";
+					status = "disabled";
+				};
+
+				tegra_dmic3: dmic@2904200 {
+					compatible = "nvidia,tegra194-dmic",
+						     "nvidia,tegra210-dmic";
+					reg = <0x2904200 0x100>;
+					clocks = <&bpmp TEGRA194_CLK_DMIC3>;
+					clock-names = "dmic";
+					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC3>;
+					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
+					assigned-clock-rates = <3072000>;
+					#sound-dai-cells = <1>;
+					sound-name-prefix = "DMIC3";
+					status = "disabled";
+				};
+
+				tegra_dmic4: dmic@2904300 {
+					compatible = "nvidia,tegra194-dmic",
+						     "nvidia,tegra210-dmic";
+					reg = <0x2904300 0x100>;
+					clocks = <&bpmp TEGRA194_CLK_DMIC4>;
+					clock-names = "dmic";
+					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC4>;
+					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
+					assigned-clock-rates = <3072000>;
+					#sound-dai-cells = <1>;
+					sound-name-prefix = "DMIC4";
+					status = "disabled";
+				};
+
+				tegra_dspk1: dspk@2905000 {
+					compatible = "nvidia,tegra194-dspk",
+						     "nvidia,tegra186-dspk";
+					reg = <0x2905000 0x100>;
+					clocks = <&bpmp TEGRA194_CLK_DSPK1>;
+					clock-names = "dspk";
+					assigned-clocks = <&bpmp TEGRA194_CLK_DSPK1>;
+					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
+					assigned-clock-rates = <12288000>;
+					#sound-dai-cells = <1>;
+					sound-name-prefix = "DSPK1";
+					status = "disabled";
+				};
+
+				tegra_dspk2: dspk@2905100 {
+					compatible = "nvidia,tegra194-dspk",
+						     "nvidia,tegra186-dspk";
+					reg = <0x2905100 0x100>;
+					clocks = <&bpmp TEGRA194_CLK_DSPK2>;
+					clock-names = "dspk";
+					assigned-clocks = <&bpmp TEGRA194_CLK_DSPK2>;
+					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
+					assigned-clock-rates = <12288000>;
+					#sound-dai-cells = <1>;
+					sound-name-prefix = "DSPK2";
+					status = "disabled";
+				};
+			};
 		};
 
 		pinmux: pinmux@2430000 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index f4e0cc2..73ae58f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1323,7 +1323,7 @@
 		ranges = <0x702c0000 0x0 0x702c0000 0x00040000>;
 		status = "disabled";
 
-		adma: dma@702e2000 {
+		adma: dma-controller@702e2000 {
 			compatible = "nvidia,tegra210-adma";
 			reg = <0x702e2000 0x2000>;
 			interrupt-parent = <&agic>;
@@ -1366,6 +1366,156 @@
 			clock-names = "clk";
 			status = "disabled";
 		};
+
+		tegra_ahub: ahub@702d0800 {
+			compatible = "nvidia,tegra210-ahub";
+			reg = <0x702d0800 0x800>;
+			clocks = <&tegra_car TEGRA210_CLK_D_AUDIO>;
+			clock-names = "ahub";
+			assigned-clocks = <&tegra_car TEGRA210_CLK_D_AUDIO>;
+			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x702d0000 0x702d0000 0x0000e400>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+
+			tegra_admaif: admaif@702d0000 {
+				compatible = "nvidia,tegra210-admaif";
+				reg = <0x702d0000 0x800>;
+				dmas = <&adma 1>,  <&adma 1>,
+				       <&adma 2>,  <&adma 2>,
+				       <&adma 3>,  <&adma 3>,
+				       <&adma 4>,  <&adma 4>,
+				       <&adma 5>,  <&adma 5>,
+				       <&adma 6>,  <&adma 6>,
+				       <&adma 7>,  <&adma 7>,
+				       <&adma 8>,  <&adma 8>,
+				       <&adma 9>,  <&adma 9>,
+				       <&adma 10>, <&adma 10>;
+				dma-names = "rx1",  "tx1",
+					    "rx2",  "tx2",
+					    "rx3",  "tx3",
+					    "rx4",  "tx4",
+					    "rx5",  "tx5",
+					    "rx6",  "tx6",
+					    "rx7",  "tx7",
+					    "rx8",  "tx8",
+					    "rx9",  "tx9",
+					    "rx10", "tx10";
+				#sound-dai-cells = <1>;
+				status = "disabled";
+			};
+
+			tegra_i2s1: i2s@702d1000 {
+				compatible = "nvidia,tegra210-i2s";
+				reg = <0x702d1000 0x100>;
+				clocks = <&tegra_car TEGRA210_CLK_I2S0>,
+					 <&tegra_car TEGRA210_CLK_I2S0_SYNC>;
+				clock-names = "i2s", "sync_input";
+				assigned-clocks = <&tegra_car TEGRA210_CLK_I2S0>;
+				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <1536000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "I2S1";
+				status = "disabled";
+			};
+
+			tegra_i2s2: i2s@702d1100 {
+				compatible = "nvidia,tegra210-i2s";
+				reg = <0x702d1100 0x100>;
+				clocks = <&tegra_car TEGRA210_CLK_I2S1>,
+					 <&tegra_car TEGRA210_CLK_I2S1_SYNC>;
+				clock-names = "i2s", "sync_input";
+				assigned-clocks = <&tegra_car TEGRA210_CLK_I2S1>;
+				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <1536000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "I2S2";
+				status = "disabled";
+			};
+
+			tegra_i2s3: i2s@702d1200 {
+				compatible = "nvidia,tegra210-i2s";
+				reg = <0x702d1200 0x100>;
+				clocks = <&tegra_car TEGRA210_CLK_I2S2>,
+					 <&tegra_car TEGRA210_CLK_I2S2_SYNC>;
+				clock-names = "i2s", "sync_input";
+				assigned-clocks = <&tegra_car TEGRA210_CLK_I2S2>;
+				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <1536000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "I2S3";
+				status = "disabled";
+			};
+
+			tegra_i2s4: i2s@702d1300 {
+				compatible = "nvidia,tegra210-i2s";
+				reg = <0x702d1300 0x100>;
+				clocks = <&tegra_car TEGRA210_CLK_I2S3>,
+					 <&tegra_car TEGRA210_CLK_I2S3_SYNC>;
+				clock-names = "i2s", "sync_input";
+				assigned-clocks = <&tegra_car TEGRA210_CLK_I2S3>;
+				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <1536000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "I2S4";
+				status = "disabled";
+			};
+
+			tegra_i2s5: i2s@702d1400 {
+				compatible = "nvidia,tegra210-i2s";
+				reg = <0x702d1400 0x100>;
+				clocks = <&tegra_car TEGRA210_CLK_I2S4>,
+					 <&tegra_car TEGRA210_CLK_I2S4_SYNC>;
+				clock-names = "i2s", "sync_input";
+				assigned-clocks = <&tegra_car TEGRA210_CLK_I2S4>;
+				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <1536000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "I2S5";
+				status = "disabled";
+			};
+
+			tegra_dmic1: dmic@702d4000 {
+				compatible = "nvidia,tegra210-dmic";
+				reg = <0x702d4000 0x100>;
+				clocks = <&tegra_car TEGRA210_CLK_DMIC1>;
+				clock-names = "dmic";
+				assigned-clocks = <&tegra_car TEGRA210_CLK_DMIC1>;
+				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <3072000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "DMIC1";
+				status = "disabled";
+			};
+
+			tegra_dmic2: dmic@702d4100 {
+				compatible = "nvidia,tegra210-dmic";
+				reg = <0x702d4100 0x100>;
+				clocks = <&tegra_car TEGRA210_CLK_DMIC2>;
+				clock-names = "dmic";
+				assigned-clocks = <&tegra_car TEGRA210_CLK_DMIC2>;
+				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <3072000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "DMIC2";
+				status = "disabled";
+			};
+
+			tegra_dmic3: dmic@702d4200 {
+				compatible = "nvidia,tegra210-dmic";
+				reg = <0x702d4200 0x100>;
+				clocks = <&tegra_car TEGRA210_CLK_DMIC3>;
+				clock-names = "dmic";
+				assigned-clocks = <&tegra_car TEGRA210_CLK_DMIC3>;
+				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+				assigned-clock-rates = <3072000>;
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "DMIC3";
+				status = "disabled";
+			};
+		};
 	};
 
 	spi@70410000 {
-- 
2.7.4


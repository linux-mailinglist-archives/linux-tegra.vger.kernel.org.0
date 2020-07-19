Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70F5F224F8D
	for <lists+linux-tegra@lfdr.de>; Sun, 19 Jul 2020 07:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgGSFCl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 19 Jul 2020 01:02:41 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18048 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgGSFCl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Jul 2020 01:02:41 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f13d3e40000>; Sat, 18 Jul 2020 22:02:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 18 Jul 2020 22:02:40 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 18 Jul 2020 22:02:40 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 19 Jul
 2020 05:02:40 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 19 Jul 2020 05:02:40 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f13d3eb0004>; Sat, 18 Jul 2020 22:02:39 -0700
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
Subject: [PATCH v5 11/11] arm64: tegra: Add DT binding for AHUB components
Date:   Sun, 19 Jul 2020 10:31:30 +0530
Message-ID: <1595134890-16470-12-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
References: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595134948; bh=7hv4613VABhKKxhR6h6UzhMnF0WGUULidg8AGs+toY4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=iNUnFVd1KKBlfvw0T1/RKZR9OF4y8DROpdUY+yayIMy0pYW8ljeCHYJt1EqSTR+0x
         ZdQsP8Ua7TpbYuffeuaOsMvRUjRpKH2ngNEKNK2WZhlwhaG/2yTOQsURem1IVJBBDp
         tWMmr+JpkkpvO4eT9DKL8pRYbNK9/nrespusKuONsUKnV6FC5iULGxVPV8Qf+kz/T5
         h8X1fLjOeCbzF/w0+fy5uYAfEltaqoQweg1JNmkQwntkwlqlp27fb0eC5lomqeD5V0
         ufNi48I0HpqSt3ZOv3APLnaMPLnpr0A64K+Oerp8yj+RU829dZ+rkGjBxVadLC6Mx8
         eEmuTCN8llPzw==
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
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 217 ++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 225 ++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 140 +++++++++++++++++++
 3 files changed, 580 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 34d249d..7869aec 100644
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
@@ -140,6 +140,221 @@
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
+				sound-name-prefix = "DSPK2";
+				status = "disabled";
+			};
+		};
 	};
 
 	mc: memory-controller@2c00000 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index ea629da..bdef4b8 100644
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
@@ -140,6 +140,229 @@
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
+					sound-name-prefix = "DSPK2";
+					status = "disabled";
+				};
+			};
 		};
 
 		pinmux: pinmux@2430000 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index f4e0cc2..4f2853e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1366,6 +1366,146 @@
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
+				sound-name-prefix = "DMIC3";
+				status = "disabled";
+			};
+		};
 	};
 
 	spi@70410000 {
-- 
2.7.4


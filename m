Return-Path: <linux-tegra+bounces-6000-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 984FFA94690
	for <lists+linux-tegra@lfdr.de>; Sun, 20 Apr 2025 05:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3CB43B9778
	for <lists+linux-tegra@lfdr.de>; Sun, 20 Apr 2025 03:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0051E7DA93;
	Sun, 20 Apr 2025 03:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S92Asl8X"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07F6F9C1;
	Sun, 20 Apr 2025 03:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745119847; cv=none; b=MaEeDXh059kVOOsN8XAG2cq30N4DJ9pUmk9tKIpf0Arf78CZ9VDBKPr5SZXe3algzfDnMGxzCI1PAatEjX4izHz+tlcIQK5bRbAvDYLKdl/S4WeP4sAq/5HUpcwEy4j62h05fQQanQSwO8s5r6u47BBr3cUGvoRHLKa/x9BELxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745119847; c=relaxed/simple;
	bh=Pc01IytnMhKNpIarCvrWkUqTFqR9OkNN6LC2YjXLRJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JMK0e6rEEgphx443NVrFb6BVQSc2rJwHV8+aKEAP8D3eQuiFbJ4wKzpNGKHNEP8BPdsjd28uL462TEf8XQi05N+7vAFjjyVosfcixtstGbShq4g1p18Kmd7zvaGVNb+SHp/qtJKWLBBkKHgao4eBx57Lv7AvhI1tIRJ2uZTv9Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S92Asl8X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31AE6C4CEEB;
	Sun, 20 Apr 2025 03:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745119847;
	bh=Pc01IytnMhKNpIarCvrWkUqTFqR9OkNN6LC2YjXLRJM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=S92Asl8X0jsp4k0iW6CSzt+pJrlpShqbCjhYOolrc3ewFCY3SRHyUEqGhETqfyMnw
	 4QDTjJrRU3ak5BHLzQRrkPFjJ6Cwd528ycnFKpRJvCKVrDaCVmr9sCVFmxHJnfjP5U
	 Ug3CmQWihLYQfzu3a1tVYa+6cCib+Y6WYZYvaOQuwuzUUdb02gmmQ/2Ew6xLthXpDj
	 GVhyjB6DOMlPa+t9MaT7fk6yb9tBvWZHX7zWBwPmyHtBXi4o5zaRi0e26CHacz1S3R
	 xD+hn0FOWCBB0Lem13YX7bFDxRxdPWB5ViOg/yHUCOh4laoBRoJAmB7At511skJQGw
	 X/MSAAxc8F6SA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25ECDC369C2;
	Sun, 20 Apr 2025 03:30:47 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 19 Apr 2025 22:30:31 -0500
Subject: [PATCH] arm64: tegra: Bump #address-cells and #size-cells on
 Tegra186
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-tegra186-host1x-addr-size-v1-1-a7493882248d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFZqBGgC/x3MPQ6DMAxA4asgz7UUpyT9uQrqYBEDXqCyEUIg7
 t6o4ze8d4KLqTi8mxNMNnVd5gq6NdBPPI+CWqohhphCSy9cZTSmZ8Zp8ZV25FIMXQ/BzDHQ456
 GlBlq/zUZdP+/u891/QD1ZpuFawAAAA==
X-Change-ID: 20250419-tegra186-host1x-addr-size-6a201735f56a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745119846; l=18473;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=2ovufkrZweXMh6oMHqP1zE+eX1nOSkeC4VJ4Y+9l2yU=;
 b=vkyeGli4u1JIhHR4yOxLKUvDp5+IqlomWTcac8PA+FQOSMyHVzKUhz+ma3U59AKkwQjh+yPqJ
 aeB8r3Mzr2MDjcnP54BhqD/TITIcPdZK008It3SvFQt18PEonwqaFYn
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

This was done for Tegra194 and Tegra234 in 2838cfd, but Tegra186 was not
part of that change. The same reasoning for that commit also applies to
Tegra186, plus keeping the archs as close to each other as possible makes
it easier to compare between them and support features concurrently.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 134 +++++++++++++++----------------
 1 file changed, 67 insertions(+), 67 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 2b3bb5d0af17bd521f87db0484fcbe943dd1a797..aa0c801eaaeb8e89630df3cc6de4a00882c0263c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -124,28 +124,28 @@ aconnect@2900000 {
 			 <&bpmp TEGRA186_CLK_APB2APE>;
 		clock-names = "ape", "apb2ape";
 		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_AUD>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x02900000 0x0 0x02900000 0x200000>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x02900000 0x0 0x02900000 0x0 0x200000>;
 		status = "disabled";
 
 		tegra_ahub: ahub@2900800 {
 			compatible = "nvidia,tegra186-ahub";
-			reg = <0x02900800 0x800>;
+			reg = <0x0 0x02900800 0x0 0x800>;
 			clocks = <&bpmp TEGRA186_CLK_AHUB>;
 			clock-names = "ahub";
 			assigned-clocks = <&bpmp TEGRA186_CLK_AHUB>;
 			assigned-clock-parents = <&bpmp TEGRA186_CLK_PLLP_OUT0>;
 			assigned-clock-rates = <81600000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0x02900800 0x02900800 0x11800>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x02900800 0x0 0x02900800 0x0 0x11800>;
 			status = "disabled";
 
 			tegra_i2s1: i2s@2901000 {
 				compatible = "nvidia,tegra186-i2s",
 					     "nvidia,tegra210-i2s";
-				reg = <0x2901000 0x100>;
+				reg = <0x0 0x2901000 0x0 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_I2S1>,
 					 <&bpmp TEGRA186_CLK_I2S1_SYNC_INPUT>;
 				clock-names = "i2s", "sync_input";
@@ -159,7 +159,7 @@ tegra_i2s1: i2s@2901000 {
 			tegra_i2s2: i2s@2901100 {
 				compatible = "nvidia,tegra186-i2s",
 					     "nvidia,tegra210-i2s";
-				reg = <0x2901100 0x100>;
+				reg = <0x0 0x2901100 0x0 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_I2S2>,
 					 <&bpmp TEGRA186_CLK_I2S2_SYNC_INPUT>;
 				clock-names = "i2s", "sync_input";
@@ -173,7 +173,7 @@ tegra_i2s2: i2s@2901100 {
 			tegra_i2s3: i2s@2901200 {
 				compatible = "nvidia,tegra186-i2s",
 					     "nvidia,tegra210-i2s";
-				reg = <0x2901200 0x100>;
+				reg = <0x0 0x2901200 0x0 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_I2S3>,
 					 <&bpmp TEGRA186_CLK_I2S3_SYNC_INPUT>;
 				clock-names = "i2s", "sync_input";
@@ -187,7 +187,7 @@ tegra_i2s3: i2s@2901200 {
 			tegra_i2s4: i2s@2901300 {
 				compatible = "nvidia,tegra186-i2s",
 					     "nvidia,tegra210-i2s";
-				reg = <0x2901300 0x100>;
+				reg = <0x0 0x2901300 0x0 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_I2S4>,
 					 <&bpmp TEGRA186_CLK_I2S4_SYNC_INPUT>;
 				clock-names = "i2s", "sync_input";
@@ -201,7 +201,7 @@ tegra_i2s4: i2s@2901300 {
 			tegra_i2s5: i2s@2901400 {
 				compatible = "nvidia,tegra186-i2s",
 					     "nvidia,tegra210-i2s";
-				reg = <0x2901400 0x100>;
+				reg = <0x0 0x2901400 0x0 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_I2S5>,
 					 <&bpmp TEGRA186_CLK_I2S5_SYNC_INPUT>;
 				clock-names = "i2s", "sync_input";
@@ -215,7 +215,7 @@ tegra_i2s5: i2s@2901400 {
 			tegra_i2s6: i2s@2901500 {
 				compatible = "nvidia,tegra186-i2s",
 					     "nvidia,tegra210-i2s";
-				reg = <0x2901500 0x100>;
+				reg = <0x0 0x2901500 0x0 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_I2S6>,
 					 <&bpmp TEGRA186_CLK_I2S6_SYNC_INPUT>;
 				clock-names = "i2s", "sync_input";
@@ -229,7 +229,7 @@ tegra_i2s6: i2s@2901500 {
 			tegra_sfc1: sfc@2902000 {
 				compatible = "nvidia,tegra186-sfc",
 					     "nvidia,tegra210-sfc";
-				reg = <0x2902000 0x200>;
+				reg = <0x0 0x2902000 0x0 0x200>;
 				sound-name-prefix = "SFC1";
 				status = "disabled";
 			};
@@ -237,7 +237,7 @@ tegra_sfc1: sfc@2902000 {
 			tegra_sfc2: sfc@2902200 {
 				compatible = "nvidia,tegra186-sfc",
 					     "nvidia,tegra210-sfc";
-				reg = <0x2902200 0x200>;
+				reg = <0x0 0x2902200 0x0 0x200>;
 				sound-name-prefix = "SFC2";
 				status = "disabled";
 			};
@@ -245,7 +245,7 @@ tegra_sfc2: sfc@2902200 {
 			tegra_sfc3: sfc@2902400 {
 				compatible = "nvidia,tegra186-sfc",
 					     "nvidia,tegra210-sfc";
-				reg = <0x2902400 0x200>;
+				reg = <0x0 0x2902400 0x0 0x200>;
 				sound-name-prefix = "SFC3";
 				status = "disabled";
 			};
@@ -253,7 +253,7 @@ tegra_sfc3: sfc@2902400 {
 			tegra_sfc4: sfc@2902600 {
 				compatible = "nvidia,tegra186-sfc",
 					     "nvidia,tegra210-sfc";
-				reg = <0x2902600 0x200>;
+				reg = <0x0 0x2902600 0x0 0x200>;
 				sound-name-prefix = "SFC4";
 				status = "disabled";
 			};
@@ -261,7 +261,7 @@ tegra_sfc4: sfc@2902600 {
 			tegra_amx1: amx@2903000 {
 				compatible = "nvidia,tegra186-amx",
 					     "nvidia,tegra210-amx";
-				reg = <0x2903000 0x100>;
+				reg = <0x0 0x2903000 0x0 0x100>;
 				sound-name-prefix = "AMX1";
 				status = "disabled";
 			};
@@ -269,7 +269,7 @@ tegra_amx1: amx@2903000 {
 			tegra_amx2: amx@2903100 {
 				compatible = "nvidia,tegra186-amx",
 					     "nvidia,tegra210-amx";
-				reg = <0x2903100 0x100>;
+				reg = <0x0 0x2903100 0x0 0x100>;
 				sound-name-prefix = "AMX2";
 				status = "disabled";
 			};
@@ -277,7 +277,7 @@ tegra_amx2: amx@2903100 {
 			tegra_amx3: amx@2903200 {
 				compatible = "nvidia,tegra186-amx",
 					     "nvidia,tegra210-amx";
-				reg = <0x2903200 0x100>;
+				reg = <0x0 0x2903200 0x0 0x100>;
 				sound-name-prefix = "AMX3";
 				status = "disabled";
 			};
@@ -285,7 +285,7 @@ tegra_amx3: amx@2903200 {
 			tegra_amx4: amx@2903300 {
 				compatible = "nvidia,tegra186-amx",
 					     "nvidia,tegra210-amx";
-				reg = <0x2903300 0x100>;
+				reg = <0x0 0x2903300 0x0 0x100>;
 				sound-name-prefix = "AMX4";
 				status = "disabled";
 			};
@@ -293,7 +293,7 @@ tegra_amx4: amx@2903300 {
 			tegra_adx1: adx@2903800 {
 				compatible = "nvidia,tegra186-adx",
 					     "nvidia,tegra210-adx";
-				reg = <0x2903800 0x100>;
+				reg = <0x0 0x2903800 0x0 0x100>;
 				sound-name-prefix = "ADX1";
 				status = "disabled";
 			};
@@ -301,7 +301,7 @@ tegra_adx1: adx@2903800 {
 			tegra_adx2: adx@2903900 {
 				compatible = "nvidia,tegra186-adx",
 					     "nvidia,tegra210-adx";
-				reg = <0x2903900 0x100>;
+				reg = <0x0 0x2903900 0x0 0x100>;
 				sound-name-prefix = "ADX2";
 				status = "disabled";
 			};
@@ -309,7 +309,7 @@ tegra_adx2: adx@2903900 {
 			tegra_adx3: adx@2903a00 {
 				compatible = "nvidia,tegra186-adx",
 					     "nvidia,tegra210-adx";
-				reg = <0x2903a00 0x100>;
+				reg = <0x0 0x2903a00 0x0 0x100>;
 				sound-name-prefix = "ADX3";
 				status = "disabled";
 			};
@@ -317,14 +317,14 @@ tegra_adx3: adx@2903a00 {
 			tegra_adx4: adx@2903b00 {
 				compatible = "nvidia,tegra186-adx",
 					     "nvidia,tegra210-adx";
-				reg = <0x2903b00 0x100>;
+				reg = <0x0 0x2903b00 0x0 0x100>;
 				sound-name-prefix = "ADX4";
 				status = "disabled";
 			};
 
 			tegra_dmic1: dmic@2904000 {
 				compatible = "nvidia,tegra210-dmic";
-				reg = <0x2904000 0x100>;
+				reg = <0x0 0x2904000 0x0 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_DMIC1>;
 				clock-names = "dmic";
 				assigned-clocks = <&bpmp TEGRA186_CLK_DMIC1>;
@@ -336,7 +336,7 @@ tegra_dmic1: dmic@2904000 {
 
 			tegra_dmic2: dmic@2904100 {
 				compatible = "nvidia,tegra210-dmic";
-				reg = <0x2904100 0x100>;
+				reg = <0x0 0x2904100 0x0 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_DMIC2>;
 				clock-names = "dmic";
 				assigned-clocks = <&bpmp TEGRA186_CLK_DMIC2>;
@@ -348,7 +348,7 @@ tegra_dmic2: dmic@2904100 {
 
 			tegra_dmic3: dmic@2904200 {
 				compatible = "nvidia,tegra210-dmic";
-				reg = <0x2904200 0x100>;
+				reg = <0x0 0x2904200 0x0 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_DMIC3>;
 				clock-names = "dmic";
 				assigned-clocks = <&bpmp TEGRA186_CLK_DMIC3>;
@@ -360,7 +360,7 @@ tegra_dmic3: dmic@2904200 {
 
 			tegra_dmic4: dmic@2904300 {
 				compatible = "nvidia,tegra210-dmic";
-				reg = <0x2904300 0x100>;
+				reg = <0x0 0x2904300 0x0 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_DMIC4>;
 				clock-names = "dmic";
 				assigned-clocks = <&bpmp TEGRA186_CLK_DMIC4>;
@@ -372,7 +372,7 @@ tegra_dmic4: dmic@2904300 {
 
 			tegra_dspk1: dspk@2905000 {
 				compatible = "nvidia,tegra186-dspk";
-				reg = <0x2905000 0x100>;
+				reg = <0x0 0x2905000 0x0 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_DSPK1>;
 				clock-names = "dspk";
 				assigned-clocks = <&bpmp TEGRA186_CLK_DSPK1>;
@@ -384,7 +384,7 @@ tegra_dspk1: dspk@2905000 {
 
 			tegra_dspk2: dspk@2905100 {
 				compatible = "nvidia,tegra186-dspk";
-				reg = <0x2905100 0x100>;
+				reg = <0x0 0x2905100 0x0 0x100>;
 				clocks = <&bpmp TEGRA186_CLK_DSPK2>;
 				clock-names = "dspk";
 				assigned-clocks = <&bpmp TEGRA186_CLK_DSPK2>;
@@ -397,9 +397,9 @@ tegra_dspk2: dspk@2905100 {
 			tegra_ope1: processing-engine@2908000 {
 				compatible = "nvidia,tegra186-ope",
 					     "nvidia,tegra210-ope";
-				reg = <0x2908000 0x100>;
-				#address-cells = <1>;
-				#size-cells = <1>;
+				reg = <0x0 0x2908000 0x0 0x100>;
+				#address-cells = <2>;
+				#size-cells = <2>;
 				ranges;
 				sound-name-prefix = "OPE1";
 				status = "disabled";
@@ -407,20 +407,20 @@ tegra_ope1: processing-engine@2908000 {
 				equalizer@2908100 {
 					compatible = "nvidia,tegra186-peq",
 						     "nvidia,tegra210-peq";
-					reg = <0x2908100 0x100>;
+					reg = <0x0 0x2908100 0x0 0x100>;
 				};
 
 				dynamic-range-compressor@2908200 {
 					compatible = "nvidia,tegra186-mbdrc",
 						     "nvidia,tegra210-mbdrc";
-					reg = <0x2908200 0x200>;
+					reg = <0x0 0x2908200 0x0 0x200>;
 				};
 			};
 
 			tegra_mvc1: mvc@290a000 {
 				compatible = "nvidia,tegra186-mvc",
 					     "nvidia,tegra210-mvc";
-				reg = <0x290a000 0x200>;
+				reg = <0x0 0x290a000 0x0 0x200>;
 				sound-name-prefix = "MVC1";
 				status = "disabled";
 			};
@@ -428,7 +428,7 @@ tegra_mvc1: mvc@290a000 {
 			tegra_mvc2: mvc@290a200 {
 				compatible = "nvidia,tegra186-mvc",
 					     "nvidia,tegra210-mvc";
-				reg = <0x290a200 0x200>;
+				reg = <0x0 0x290a200 0x0 0x200>;
 				sound-name-prefix = "MVC2";
 				status = "disabled";
 			};
@@ -436,14 +436,14 @@ tegra_mvc2: mvc@290a200 {
 			tegra_amixer: amixer@290bb00 {
 				compatible = "nvidia,tegra186-amixer",
 					     "nvidia,tegra210-amixer";
-				reg = <0x290bb00 0x800>;
+				reg = <0x0 0x290bb00 0x0 0x800>;
 				sound-name-prefix = "MIXER1";
 				status = "disabled";
 			};
 
 			tegra_admaif: admaif@290f000 {
 				compatible = "nvidia,tegra186-admaif";
-				reg = <0x0290f000 0x1000>;
+				reg = <0x0 0x0290f000 0x0 0x1000>;
 				dmas = <&adma 1>, <&adma 1>,
 				       <&adma 2>, <&adma 2>,
 				       <&adma 3>, <&adma 3>,
@@ -489,7 +489,7 @@ tegra_admaif: admaif@290f000 {
 
 			tegra_asrc: asrc@2910000 {
 				compatible = "nvidia,tegra186-asrc";
-				reg = <0x2910000 0x2000>;
+				reg = <0x0 0x2910000 0x0 0x2000>;
 				sound-name-prefix = "ASRC1";
 				status = "disabled";
 			};
@@ -497,7 +497,7 @@ tegra_asrc: asrc@2910000 {
 
 		adma: dma-controller@2930000 {
 			compatible = "nvidia,tegra186-adma";
-			reg = <0x02930000 0x20000>;
+			reg = <0x0 0x02930000 0x0 0x20000>;
 			interrupt-parent = <&agic>;
 			interrupts =  <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
 				      <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
@@ -542,8 +542,8 @@ agic: interrupt-controller@2a40000 {
 				     "nvidia,tegra210-agic";
 			#interrupt-cells = <3>;
 			interrupt-controller;
-			reg = <0x02a41000 0x1000>,
-			      <0x02a42000 0x2000>;
+			reg = <0x0 0x02a41000 0x0 0x1000>,
+			      <0x0 0x02a42000 0x0 0x2000>;
 			interrupts = <GIC_SPI 145
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 			clocks = <&bpmp TEGRA186_CLK_APE>;
@@ -1511,10 +1511,10 @@ host1x@13e00000 {
 		resets = <&bpmp TEGRA186_RESET_HOST1X>;
 		reset-names = "host1x";
 
-		#address-cells = <1>;
-		#size-cells = <1>;
+		#address-cells = <2>;
+		#size-cells = <2>;
 
-		ranges = <0x15000000 0x0 0x15000000 0x01000000>;
+		ranges = <0x0 0x15000000 0x0 0x15000000 0x0 0x01000000>;
 
 		interconnects = <&mc TEGRA186_MEMORY_CLIENT_HOST1XDMAR &emc>;
 		interconnect-names = "dma-mem";
@@ -1533,7 +1533,7 @@ host1x@13e00000 {
 
 		dpaux1: dpaux@15040000 {
 			compatible = "nvidia,tegra186-dpaux";
-			reg = <0x15040000 0x10000>;
+			reg = <0x0 0x15040000 0x0 0x10000>;
 			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA186_CLK_DPAUX1>,
 				 <&bpmp TEGRA186_CLK_PLLDP>;
@@ -1567,7 +1567,7 @@ i2c-bus {
 
 		display-hub@15200000 {
 			compatible = "nvidia,tegra186-display";
-			reg = <0x15200000 0x00040000>;
+			reg = <0x0 0x15200000 0x0 0x00040000>;
 			resets = <&bpmp TEGRA186_RESET_NVDISPLAY0_MISC>,
 				 <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP0>,
 				 <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP1>,
@@ -1585,14 +1585,14 @@ display-hub@15200000 {
 
 			power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
 
-			#address-cells = <1>;
-			#size-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <2>;
 
-			ranges = <0x15200000 0x15200000 0x40000>;
+			ranges = <0x0 0x15200000 0x0 0x15200000 0x0 0x40000>;
 
 			display@15200000 {
 				compatible = "nvidia,tegra186-dc";
-				reg = <0x15200000 0x10000>;
+				reg = <0x0 0x15200000 0x0 0x10000>;
 				interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&bpmp TEGRA186_CLK_NVDISPLAY_P0>;
 				clock-names = "dc";
@@ -1611,7 +1611,7 @@ display@15200000 {
 
 			display@15210000 {
 				compatible = "nvidia,tegra186-dc";
-				reg = <0x15210000 0x10000>;
+				reg = <0x0 0x15210000 0x0 0x10000>;
 				interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&bpmp TEGRA186_CLK_NVDISPLAY_P1>;
 				clock-names = "dc";
@@ -1630,7 +1630,7 @@ display@15210000 {
 
 			display@15220000 {
 				compatible = "nvidia,tegra186-dc";
-				reg = <0x15220000 0x10000>;
+				reg = <0x0 0x15220000 0x0 0x10000>;
 				interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&bpmp TEGRA186_CLK_NVDISPLAY_P2>;
 				clock-names = "dc";
@@ -1650,7 +1650,7 @@ display@15220000 {
 
 		dsia: dsi@15300000 {
 			compatible = "nvidia,tegra186-dsi";
-			reg = <0x15300000 0x10000>;
+			reg = <0x0 0x15300000 0x0 0x10000>;
 			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA186_CLK_DSI>,
 				 <&bpmp TEGRA186_CLK_DSIA_LP>,
@@ -1665,7 +1665,7 @@ dsia: dsi@15300000 {
 
 		vic@15340000 {
 			compatible = "nvidia,tegra186-vic";
-			reg = <0x15340000 0x40000>;
+			reg = <0x0 0x15340000 0x0 0x40000>;
 			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA186_CLK_VIC>;
 			clock-names = "vic";
@@ -1681,7 +1681,7 @@ vic@15340000 {
 
 		nvjpg@15380000 {
 			compatible = "nvidia,tegra186-nvjpg";
-			reg = <0x15380000 0x40000>;
+			reg = <0x0 0x15380000 0x0 0x40000>;
 			clocks = <&bpmp TEGRA186_CLK_NVJPG>;
 			clock-names = "nvjpg";
 			resets = <&bpmp TEGRA186_RESET_NVJPG>;
@@ -1696,7 +1696,7 @@ nvjpg@15380000 {
 
 		dsib: dsi@15400000 {
 			compatible = "nvidia,tegra186-dsi";
-			reg = <0x15400000 0x10000>;
+			reg = <0x0 0x15400000 0x0 0x10000>;
 			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA186_CLK_DSIB>,
 				 <&bpmp TEGRA186_CLK_DSIB_LP>,
@@ -1711,7 +1711,7 @@ dsib: dsi@15400000 {
 
 		nvdec@15480000 {
 			compatible = "nvidia,tegra186-nvdec";
-			reg = <0x15480000 0x40000>;
+			reg = <0x0 0x15480000 0x0 0x40000>;
 			clocks = <&bpmp TEGRA186_CLK_NVDEC>;
 			clock-names = "nvdec";
 			resets = <&bpmp TEGRA186_RESET_NVDEC>;
@@ -1727,7 +1727,7 @@ nvdec@15480000 {
 
 		nvenc@154c0000 {
 			compatible = "nvidia,tegra186-nvenc";
-			reg = <0x154c0000 0x40000>;
+			reg = <0x0 0x154c0000 0x0 0x40000>;
 			clocks = <&bpmp TEGRA186_CLK_NVENC>;
 			clock-names = "nvenc";
 			resets = <&bpmp TEGRA186_RESET_NVENC>;
@@ -1742,7 +1742,7 @@ nvenc@154c0000 {
 
 		sor0: sor@15540000 {
 			compatible = "nvidia,tegra186-sor";
-			reg = <0x15540000 0x10000>;
+			reg = <0x0 0x15540000 0x0 0x10000>;
 			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA186_CLK_SOR0>,
 				 <&bpmp TEGRA186_CLK_SOR0_OUT>,
@@ -1766,7 +1766,7 @@ sor0: sor@15540000 {
 
 		sor1: sor@15580000 {
 			compatible = "nvidia,tegra186-sor";
-			reg = <0x15580000 0x10000>;
+			reg = <0x0 0x15580000 0x0 0x10000>;
 			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA186_CLK_SOR1>,
 				 <&bpmp TEGRA186_CLK_SOR1_OUT>,
@@ -1790,7 +1790,7 @@ sor1: sor@15580000 {
 
 		dpaux: dpaux@155c0000 {
 			compatible = "nvidia,tegra186-dpaux";
-			reg = <0x155c0000 0x10000>;
+			reg = <0x0 0x155c0000 0x0 0x10000>;
 			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA186_CLK_DPAUX>,
 				 <&bpmp TEGRA186_CLK_PLLDP>;
@@ -1824,7 +1824,7 @@ i2c-bus {
 
 		padctl@15880000 {
 			compatible = "nvidia,tegra186-dsi-padctl";
-			reg = <0x15880000 0x10000>;
+			reg = <0x0 0x15880000 0x0 0x10000>;
 			resets = <&bpmp TEGRA186_RESET_DSI>;
 			reset-names = "dsi";
 			status = "disabled";
@@ -1832,7 +1832,7 @@ padctl@15880000 {
 
 		dsic: dsi@15900000 {
 			compatible = "nvidia,tegra186-dsi";
-			reg = <0x15900000 0x10000>;
+			reg = <0x0 0x15900000 0x0 0x10000>;
 			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA186_CLK_DSIC>,
 				 <&bpmp TEGRA186_CLK_DSIC_LP>,
@@ -1847,7 +1847,7 @@ dsic: dsi@15900000 {
 
 		dsid: dsi@15940000 {
 			compatible = "nvidia,tegra186-dsi";
-			reg = <0x15940000 0x10000>;
+			reg = <0x0 0x15940000 0x0 0x10000>;
 			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA186_CLK_DSID>,
 				 <&bpmp TEGRA186_CLK_DSID_LP>,

---
base-commit: 119009db267415049182774196e3cce9e13b52ef
change-id: 20250419-tegra186-host1x-addr-size-6a201735f56a

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>




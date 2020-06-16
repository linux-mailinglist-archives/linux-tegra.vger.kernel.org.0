Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 308CE1FB2C7
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbgFPNy4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728997AbgFPNyu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:50 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91D7C06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:49 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id r7so20898954wro.1
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JGNoF52WDvOHsoVJOA+5In3kneL7744swJ6p7qfJ/lo=;
        b=m6zchlZs8tchsR1QAHIFAYL2clTbSvxh79v7oChz0+H+Pkom8ktXE0CqENJE9sjN5a
         /eLrJaF3R+E96iWZ7fwgglVw8z2kb5/uO5mqeZd5GtULoU0OvNwVCf984W7g+iQMlSLz
         2YCgim9dI/8QIFpj7JVd5IoUYvHrnuXY3CQqDWYvxVxF1/bpO5eI4V4hOsmFuaUGuyly
         ebf17Ro2YnmJE1DKHILITCXpd/SYxwIPbADy/nDiiTOdceZnnBjB7No+cZz9vFCqErFX
         8vxzyIzCr7h2EQDJEoMRWUiBi0/AUHEpgxEAjQsIfw1FpOIsy5085k+BH2WBdaLirs1R
         CRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JGNoF52WDvOHsoVJOA+5In3kneL7744swJ6p7qfJ/lo=;
        b=BJpT7nT9aAdDdAfl3SwnxXpmgx+LMr5f258FgK1LSLFm9fz+wCmzvo/0PfYU43UfjO
         EAhYSeoaYqsRr0UujoU08gM6e3Lx7N0JdzUyDbtJk90xC8s5dXJtu5932dEcD4/XOdm4
         arL3xKY9vXkYydbrs0Ii3zoNqKnTf1lvBuUNdIA/G8AMxzfFKVkCdEgMAQTh+aM8SGaA
         FsNJJos6QoGxjrze8qGseBAJFxF5S9qxYGxJgP1vuzLybA9XMoRmkpmK9Vq5YbGNpNzb
         ZbLM+yhgKBjX2MBhuZyraQMGIN6zBYDjD9j3UAHw3TEMK99skNJyUegvwzMRYTOc09Fk
         /ScA==
X-Gm-Message-State: AOAM533CP/us+2gq84skBYZqwYl9S55W0obWDhOe3m1inZVo2P7vS0Lz
        NdRl5eMWYm0bNWq/kIyIP4U=
X-Google-Smtp-Source: ABdhPJzKfhcu7s7tvxmwswuXVVOTC36tlY8saUFwxp9A1xO3uf6rcIHjrrFp1yrhYCbZS2YuMdRuag==
X-Received: by 2002:adf:f789:: with SMTP id q9mr3425478wrp.251.1592315688261;
        Tue, 16 Jun 2020 06:54:48 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id s18sm35893062wra.85.2020.06.16.06.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:46 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 49/73] arm64: tegra: Rename sdhci nodes to mmc
Date:   Tue, 16 Jun 2020 15:52:14 +0200
Message-Id: <20200616135238.3001888-50-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200616135238.3001888-1-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The new json-schema based validation tools require SD/MMC controller
nodes to be named mmc. Rename all references to them.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |  6 +++---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |  8 ++++----
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  2 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     | 10 +++++-----
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  8 ++++----
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  8 ++++----
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  6 +++---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi     |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  8 ++++----
 15 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index d0d03cc30197..e6fe62e5c234 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -894,12 +894,12 @@ pmc@7000e400 {
 	};
 
 	/* WIFI/BT module */
-	sdhci@700b0000 {
+	mmc@700b0000 {
 		status = "disabled";
 	};
 
 	/* external SD/MMC */
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
 		power-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
 		wp-gpios = <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_HIGH>;
@@ -909,7 +909,7 @@ sdhci@700b0400 {
 	};
 
 	/* EMMC 4.51 */
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 4fc34c5ec2dc..8558ad38b69c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -691,7 +691,7 @@ utmi-2 {
 		};
 	};
 
-	sdhci@700b0000 {
+	mmc@700b0000 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0000 0x0 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
@@ -702,7 +702,7 @@ sdhci@700b0000 {
 		status = "disabled";
 	};
 
-	sdhci@700b0200 {
+	mmc@700b0200 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0200 0x0 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
@@ -713,7 +713,7 @@ sdhci@700b0200 {
 		status = "disabled";
 	};
 
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0400 0x0 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -724,7 +724,7 @@ sdhci@700b0400 {
 		status = "disabled";
 	};
 
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0600 0x0 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index f35b0ba29cb5..37ec15a14c77 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -103,7 +103,7 @@ exp2: gpio@77 {
 	};
 
 	/* SDMMC1 (SD/MMC) */
-	sdhci@3400000 {
+	mmc@3400000 {
 		status = "okay";
 
 		vmmc-supply = <&vdd_sd>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 7b5b9bb332cf..d1ed7eee949a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -9,8 +9,8 @@ / {
 
 	aliases {
 		ethernet0 = "/ethernet@2490000";
-		sdhci0 = "/sdhci@3460000";
-		sdhci1 = "/sdhci@3400000";
+		mmc0 = "/mmc@3460000";
+		mmc1 = "/mmc@3400000";
 		serial0 = &uarta;
 		i2c0 = "/bpmp/i2c";
 		i2c1 = "/i2c@3160000";
@@ -135,7 +135,7 @@ i2c@31e0000 {
 	};
 
 	/* SDMMC1 (SD/MMC) */
-	sdhci@3400000 {
+	mmc@3400000 {
 		cd-gpios = <&gpio TEGRA186_MAIN_GPIO(P, 5) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA186_MAIN_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
 
@@ -143,12 +143,12 @@ sdhci@3400000 {
 	};
 
 	/* SDMMC3 (SDIO) */
-	sdhci@3440000 {
+	mmc@3440000 {
 		status = "okay";
 	};
 
 	/* SDMMC4 (eMMC) */
-	sdhci@3460000 {
+	mmc@3460000 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index e86b682f8645..927c646620cb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -333,7 +333,7 @@ gen9_i2c: i2c@31e0000 {
 		status = "disabled";
 	};
 
-	sdmmc1: sdhci@3400000 {
+	sdmmc1: mmc@3400000 {
 		compatible = "nvidia,tegra186-sdhci";
 		reg = <0x0 0x03400000 0x0 0x10000>;
 		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
@@ -362,7 +362,7 @@ sdmmc1: sdhci@3400000 {
 		status = "disabled";
 	};
 
-	sdmmc2: sdhci@3420000 {
+	sdmmc2: mmc@3420000 {
 		compatible = "nvidia,tegra186-sdhci";
 		reg = <0x0 0x03420000 0x0 0x10000>;
 		interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
@@ -386,7 +386,7 @@ sdmmc2: sdhci@3420000 {
 		status = "disabled";
 	};
 
-	sdmmc3: sdhci@3440000 {
+	sdmmc3: mmc@3440000 {
 		compatible = "nvidia,tegra186-sdhci";
 		reg = <0x0 0x03440000 0x0 0x10000>;
 		interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
@@ -412,7 +412,7 @@ sdmmc3: sdhci@3440000 {
 		status = "disabled";
 	};
 
-	sdmmc4: sdhci@3460000 {
+	sdmmc4: mmc@3460000 {
 		compatible = "nvidia,tegra186-sdhci";
 		reg = <0x0 0x03460000 0x0 0x10000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index f3781e86f321..442e333ac13f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -9,8 +9,8 @@ / {
 
 	aliases {
 		ethernet0 = "/cbb@0/ethernet@2490000";
-		sdhci0 = "/cbb@0/sdhci@3460000";
-		sdhci1 = "/cbb@0/sdhci@3400000";
+		mmc0 = "/cbb@0/mmc@3460000";
+		mmc1 = "/cbb@0/mmc@3400000";
 		serial0 = &tcu;
 		i2c0 = "/bpmp/i2c";
 		i2c1 = "/cbb@0/i2c@3160000";
@@ -58,12 +58,12 @@ serial@3110000 {
 		};
 
 		/* SDMMC1 (SD/MMC) */
-		sdhci@3400000 {
+		mmc@3400000 {
 			cd-gpios = <&gpio TEGRA194_MAIN_GPIO(A, 0) GPIO_ACTIVE_LOW>;
 		};
 
 		/* SDMMC4 (eMMC) */
-		sdhci@3460000 {
+		mmc@3460000 {
 			status = "okay";
 			bus-width = <8>;
 			non-removable;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 9a7d136b467f..0f9868b6fd6b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -28,7 +28,7 @@ ddc: i2c@31c0000 {
 		};
 
 		/* SDMMC1 (SD/MMC) */
-		sdhci@3400000 {
+		mmc@3400000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index f056158a2634..d5246c75b782 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -456,7 +456,7 @@ pwm8: pwm@32f0000 {
 			#pwm-cells = <2>;
 		};
 
-		sdmmc1: sdhci@3400000 {
+		sdmmc1: mmc@3400000 {
 			compatible = "nvidia,tegra194-sdhci";
 			reg = <0x03400000 0x10000>;
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
@@ -481,7 +481,7 @@ sdmmc1: sdhci@3400000 {
 			status = "disabled";
 		};
 
-		sdmmc3: sdhci@3440000 {
+		sdmmc3: mmc@3440000 {
 			compatible = "nvidia,tegra194-sdhci";
 			reg = <0x03440000 0x10000>;
 			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
@@ -507,7 +507,7 @@ sdmmc3: sdhci@3440000 {
 			status = "disabled";
 		};
 
-		sdmmc4: sdhci@3460000 {
+		sdmmc4: mmc@3460000 {
 			compatible = "nvidia,tegra194-sdhci";
 			reg = <0x03460000 0x10000>;
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 751775357d51..251c6099482a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -293,7 +293,7 @@ pmc@7000e400 {
 	};
 
 	/* eMMC */
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
index 9ace2d9ea085..f9158dc943f9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
@@ -34,7 +34,7 @@ pmc@7000e400 {
 	};
 
 	/* eMMC */
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index f72afdf547ee..fb0db05647c4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1500,7 +1500,7 @@ usb3-1 {
 	};
 
 	/* MMC/SD */
-	sdhci@700b0000 {
+	mmc@700b0000 {
 		status = "okay";
 		bus-width = <4>;
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
index 615a8f5a6cf2..579d5b8a757d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
@@ -1580,7 +1580,7 @@ pmc@7000e400 {
 		status = "okay";
 	};
 
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		bus-width = <8>;
 		non-removable;
 		status = "okay";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index e6f4a36efa73..4a354f5293fc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -535,7 +535,7 @@ usb3-0 {
 		};
 	};
 
-	sdhci@700b0000 {
+	mmc@700b0000 {
 		status = "okay";
 		bus-width = <4>;
 
@@ -553,7 +553,7 @@ usb@700d0000 {
 		hvdd-usb-supply = <&vdd_1v8>;
 	};
 
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		status = "okay";
 		bus-width = <4>;
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 0b5b6ffbff43..d32053934f3c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1693,7 +1693,7 @@ usb3-0 {
 		};
 	};
 
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		bus-width = <8>;
 		non-removable;
 		status = "okay";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 41ffa0531cd8..1f7dc518b394 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1175,7 +1175,7 @@ usb3-3 {
 		};
 	};
 
-	sdhci@700b0000 {
+	mmc@700b0000 {
 		compatible = "nvidia,tegra210-sdhci";
 		reg = <0x0 0x700b0000 0x0 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
@@ -1203,7 +1203,7 @@ sdhci@700b0000 {
 		status = "disabled";
 	};
 
-	sdhci@700b0200 {
+	mmc@700b0200 {
 		compatible = "nvidia,tegra210-sdhci";
 		reg = <0x0 0x700b0200 0x0 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
@@ -1220,7 +1220,7 @@ sdhci@700b0200 {
 		status = "disabled";
 	};
 
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		compatible = "nvidia,tegra210-sdhci";
 		reg = <0x0 0x700b0400 0x0 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -1243,7 +1243,7 @@ sdhci@700b0400 {
 		status = "disabled";
 	};
 
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		compatible = "nvidia,tegra210-sdhci";
 		reg = <0x0 0x700b0600 0x0 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.24.1


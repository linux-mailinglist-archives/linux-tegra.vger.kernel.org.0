Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E855445FF41
	for <lists+linux-tegra@lfdr.de>; Sat, 27 Nov 2021 15:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355178AbhK0Obv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 27 Nov 2021 09:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244126AbhK0O3u (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Nov 2021 09:29:50 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C9D3C061748;
        Sat, 27 Nov 2021 06:26:35 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id b40so31512934lfv.10;
        Sat, 27 Nov 2021 06:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KTDKIIwU+lNg+ofLZ+wFLs1ooEITwnI/Z+NzLRiKKPc=;
        b=P0zOdK+08dWElfrrC/KxcBcMN5YA+/fQT5QlTE2s5ZlbudL3FVSYy0ZbDC7Cg7Y2lB
         t0AbnHxWFPnRxUjKvOO1eSEUhTLmZJ3smygluJ3f+1K/sJsAWg0ONyv+2guftTH/Zi3R
         dxF6rdSma9zPsDrEgWryKqXvhrdj0dJ4b1F+vynBLYU3vDTrv/y5ggzGYuIh7xSMBkhk
         1AiJYiGUNxFIVJmhft6lWqf/BN6zHh7ygLrOLYOeNSSmRXG6BeqGHCGkfBXHWlOkC+8x
         PEKzmB5rljYWFGd2Ae9JdI3r2si9wtttzo4LFE9jYauTMVt2dIa4opCAy89pAWXMZFKc
         YsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KTDKIIwU+lNg+ofLZ+wFLs1ooEITwnI/Z+NzLRiKKPc=;
        b=grA3ZbMIltuWoSbwUQUctA1eJgLKLC9R0/+OPI2eaN65thrb2cwheCK/o0n8Qv4wYs
         EwqKextgqXAMAhLtilWbCbEDY13IkupD/+GL2Vw38EMnsKv88WEGZRjfipXXPp3euNpI
         aY3bk1Pwe+FgR0XoayNlYWrbMinxceyNqO4KzS9K0j7yJS3B02hvWeoqu05hy0F9ZCmK
         ITCuJ6QriM6uYn01D+bLU3V2KNyI7rhSUu6UHLIJUabMPiGJK44Dadq0+kP8+KQc7Xqr
         diF05w78tH1NJzkmcjYw3PL/SLPuSdg+gXNkh/IGfOTyVOfNnNMD/lWVe4h+F5Ar7xEw
         mZDQ==
X-Gm-Message-State: AOAM531HBGRMFKkVwaNXXRCTjfre7mwFW4D0nGWU1gFlZn0o4/ZeCXnt
        M5uUUnhVtpIWV22z1SxqM9s=
X-Google-Smtp-Source: ABdhPJwnoiSs6bvSCSag0jdN9rA1ZsPu2lFj/uCafpim2yysCq9FVmV5QvU8s8CV8Tvbx9T9D5p35w==
X-Received: by 2002:a05:6512:3192:: with SMTP id i18mr34844563lfe.569.1638023193843;
        Sat, 27 Nov 2021 06:26:33 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t22sm812382ljg.83.2021.11.27.06.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 06:26:33 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Anton Bambura <jenneron@protonmail.com>,
        Antoni Aloy Torrens <aaloytorrens@gmail.com>,
        Nikola Milosavljevic <mnidza@outlook.com>,
        Ion Agorria <ion@agorria.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        Thomas Graichen <thomas.graichen@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/14] ARM: tegra: Add labels to tegra114.dtsi
Date:   Sat, 27 Nov 2021 17:23:16 +0300
Message-Id: <20211127142327.17692-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211127142327.17692-1-digetx@gmail.com>
References: <20211127142327.17692-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Anton Bambura <jenneron@protonmail.com>

Add more labels in order to use label reference in device-specific
dts files. Labels make device-trees more readable and prevent typos
that are difficult to notice.

Signed-off-by: Anton Bambura <jenneron@protonmail.com>
---
 arch/arm/boot/dts/tegra114.dtsi | 52 ++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 546272e396b4..563ee262f41d 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -93,7 +93,7 @@ rgb {
 			};
 		};
 
-		hdmi@54280000 {
+		hdmi: hdmi@54280000 {
 			compatible = "nvidia,tegra114-hdmi";
 			reg = <0x54280000 0x00040000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
@@ -105,7 +105,7 @@ hdmi@54280000 {
 			status = "disabled";
 		};
 
-		dsi@54300000 {
+		dsia: dsi@54300000 {
 			compatible = "nvidia,tegra114-dsi";
 			reg = <0x54300000 0x00040000>;
 			clocks = <&tegra_car TEGRA114_CLK_DSIA>,
@@ -121,7 +121,7 @@ dsi@54300000 {
 			#size-cells = <0>;
 		};
 
-		dsi@54400000 {
+		dsib: dsi@54400000 {
 			compatible = "nvidia,tegra114-dsi";
 			reg = <0x54400000 0x00040000>;
 			clocks = <&tegra_car TEGRA114_CLK_DSIB>,
@@ -335,7 +335,7 @@ pwm: pwm@7000a000 {
 		status = "disabled";
 	};
 
-	i2c@7000c000 {
+	i2c1: i2c@7000c000 {
 		compatible = "nvidia,tegra114-i2c";
 		reg = <0x7000c000 0x100>;
 		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
@@ -350,7 +350,7 @@ i2c@7000c000 {
 		status = "disabled";
 	};
 
-	i2c@7000c400 {
+	i2c2: i2c@7000c400 {
 		compatible = "nvidia,tegra114-i2c";
 		reg = <0x7000c400 0x100>;
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
@@ -365,7 +365,7 @@ i2c@7000c400 {
 		status = "disabled";
 	};
 
-	i2c@7000c500 {
+	i2c3: i2c@7000c500 {
 		compatible = "nvidia,tegra114-i2c";
 		reg = <0x7000c500 0x100>;
 		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
@@ -380,7 +380,7 @@ i2c@7000c500 {
 		status = "disabled";
 	};
 
-	i2c@7000c700 {
+	i2c4: i2c@7000c700 {
 		compatible = "nvidia,tegra114-i2c";
 		reg = <0x7000c700 0x100>;
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
@@ -395,7 +395,7 @@ i2c@7000c700 {
 		status = "disabled";
 	};
 
-	i2c@7000d000 {
+	i2c5: i2c@7000d000 {
 		compatible = "nvidia,tegra114-i2c";
 		reg = <0x7000d000 0x100>;
 		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
@@ -410,7 +410,7 @@ i2c@7000d000 {
 		status = "disabled";
 	};
 
-	spi@7000d400 {
+	spi1: spi@7000d400 {
 		compatible = "nvidia,tegra114-spi";
 		reg = <0x7000d400 0x200>;
 		interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
@@ -425,7 +425,7 @@ spi@7000d400 {
 		status = "disabled";
 	};
 
-	spi@7000d600 {
+	spi2: spi@7000d600 {
 		compatible = "nvidia,tegra114-spi";
 		reg = <0x7000d600 0x200>;
 		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
@@ -440,7 +440,7 @@ spi@7000d600 {
 		status = "disabled";
 	};
 
-	spi@7000d800 {
+	spi3: spi@7000d800 {
 		compatible = "nvidia,tegra114-spi";
 		reg = <0x7000d800 0x200>;
 		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
@@ -455,7 +455,7 @@ spi@7000d800 {
 		status = "disabled";
 	};
 
-	spi@7000da00 {
+	spi4: spi@7000da00 {
 		compatible = "nvidia,tegra114-spi";
 		reg = <0x7000da00 0x200>;
 		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
@@ -470,7 +470,7 @@ spi@7000da00 {
 		status = "disabled";
 	};
 
-	spi@7000dc00 {
+	spi5: spi@7000dc00 {
 		compatible = "nvidia,tegra114-spi";
 		reg = <0x7000dc00 0x200>;
 		interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
@@ -485,7 +485,7 @@ spi@7000dc00 {
 		status = "disabled";
 	};
 
-	spi@7000de00 {
+	spi6: spi@7000de00 {
 		compatible = "nvidia,tegra114-spi";
 		reg = <0x7000de00 0x200>;
 		interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
@@ -500,14 +500,14 @@ spi@7000de00 {
 		status = "disabled";
 	};
 
-	rtc@7000e000 {
+	tegra_rtc: rtc@7000e000 {
 		compatible = "nvidia,tegra114-rtc", "nvidia,tegra20-rtc";
 		reg = <0x7000e000 0x100>;
 		interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_RTC>;
 	};
 
-	kbc@7000e200 {
+	tegra_kbc: kbc@7000e200 {
 		compatible = "nvidia,tegra114-kbc";
 		reg = <0x7000e200 0x100>;
 		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
@@ -646,7 +646,7 @@ mipi: mipi@700e3000 {
 		#nvidia,mipi-calibrate-cells = <1>;
 	};
 
-	mmc@78000000 {
+	sdmmc1: mmc@78000000 {
 		compatible = "nvidia,tegra114-sdhci";
 		reg = <0x78000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
@@ -657,7 +657,7 @@ mmc@78000000 {
 		status = "disabled";
 	};
 
-	mmc@78000200 {
+	sdmmc2: mmc@78000200 {
 		compatible = "nvidia,tegra114-sdhci";
 		reg = <0x78000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
@@ -668,7 +668,7 @@ mmc@78000200 {
 		status = "disabled";
 	};
 
-	mmc@78000400 {
+	sdmmc3: mmc@78000400 {
 		compatible = "nvidia,tegra114-sdhci";
 		reg = <0x78000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -679,7 +679,7 @@ mmc@78000400 {
 		status = "disabled";
 	};
 
-	mmc@78000600 {
+	sdmmc4: mmc@78000600 {
 		compatible = "nvidia,tegra114-sdhci";
 		reg = <0x78000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
@@ -690,7 +690,7 @@ mmc@78000600 {
 		status = "disabled";
 	};
 
-	usb@7d000000 {
+	usb1: usb@7d000000 {
 		compatible = "nvidia,tegra114-ehci", "nvidia,tegra30-ehci";
 		reg = <0x7d000000 0x4000>;
 		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
@@ -698,11 +698,11 @@ usb@7d000000 {
 		clocks = <&tegra_car TEGRA114_CLK_USBD>;
 		resets = <&tegra_car 22>;
 		reset-names = "usb";
-		nvidia,phy = <&phy1>;
+		nvidia,phy = <&usb1_phy>;
 		status = "disabled";
 	};
 
-	phy1: usb-phy@7d000000 {
+	usb1_phy: usb-phy@7d000000 {
 		compatible = "nvidia,tegra114-usb-phy", "nvidia,tegra30-usb-phy";
 		reg = <0x7d000000 0x4000>,
 		      <0x7d000000 0x4000>;
@@ -730,7 +730,7 @@ phy1: usb-phy@7d000000 {
 		status = "disabled";
 	};
 
-	usb@7d008000 {
+	usb3: usb@7d008000 {
 		compatible = "nvidia,tegra114-ehci", "nvidia,tegra30-ehci";
 		reg = <0x7d008000 0x4000>;
 		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
@@ -738,11 +738,11 @@ usb@7d008000 {
 		clocks = <&tegra_car TEGRA114_CLK_USB3>;
 		resets = <&tegra_car 59>;
 		reset-names = "usb";
-		nvidia,phy = <&phy3>;
+		nvidia,phy = <&usb3_phy>;
 		status = "disabled";
 	};
 
-	phy3: usb-phy@7d008000 {
+	usb3_phy: usb-phy@7d008000 {
 		compatible = "nvidia,tegra114-usb-phy", "nvidia,tegra30-usb-phy";
 		reg = <0x7d008000 0x4000>,
 		      <0x7d000000 0x4000>;
-- 
2.33.1


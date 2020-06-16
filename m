Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 305CE1FB28B
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgFPNww (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728740AbgFPNwv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:52:51 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B653CC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:52:50 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j10so20857986wrw.8
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f3prHd9Q/Czt5Wr9tMzhipXs+Ow+XohzXCYh5U8lEv8=;
        b=s93KSWIYZQqcvK1+nIrdCJjlSuu7gHxdgNix0DgLqCDovbi9k0cFYBmAFg8nqrLrXu
         zaNgNFCVsDssO3DstT+Egowe5kdlcZkOZ3HMfQ3PzWhnkF3cf0Pb8IFFe63biC+zzKuk
         JdlJQtStQnZDzkPH9sCN6hYo8nDd2maUMEsuhrif6aGvvGDuGdggaP0Xq0G+lxoRBySV
         5rWKmteYT3riBxW62IXfOfVSpvv8wJrOE0hWQHD2kQFaWMBOMjZ5r7+x1dX1q7f/Fqbu
         laYgS+bOg1q/jAfQ2TILdaujFyMjsgiVBCoXgeTNNRuvgQqmVMmFC5Hr0/FUJLwg3lo3
         GR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f3prHd9Q/Czt5Wr9tMzhipXs+Ow+XohzXCYh5U8lEv8=;
        b=DeZLUZqm9IuMoBgVA90ALJeAjZXRWBYq0gObsP/K4WXcC6C6wriqL8TCwpLciNKsrG
         N1d9LZRrqwQlluwqdRji1u7Y23NzY35sByDMXX74pNNFoyU5hSif/3YkQqi1XgRST+Gd
         9J29DL3sdO0oGExV5sGVvSwbI+YhIB3scUmc4fGDQVP1lG8I0Cf/i1nNxDFdt1/XEyb7
         CqpFkhsLGoI0+XjYSvniG0L53vBPZ0uNXO0ZWqrn1xbvc8zbwoIM4D0IX38bN26dTkfH
         RtWM8Aody3swTvvgFDiZqTp4cHgMRU4n1RS/Z08SUh5QadRfmMk8dOuu+CHCWVsYRjgc
         Tojg==
X-Gm-Message-State: AOAM531vvEQ35itVUYuo35Pjqw3x3L9b5HaRCI6lQq8Vig9eAWjy/pTe
        IrmF510oBYraliZ9yMGIrI4=
X-Google-Smtp-Source: ABdhPJyDrtc0HtUwrJUnhtT25oS8QkN5ylu5f0Boa7Pbxj25NVWXijUIMb4Ob417bppMviE5ajaJ3w==
X-Received: by 2002:adf:fd41:: with SMTP id h1mr3362823wrs.374.1592315569176;
        Tue, 16 Jun 2020 06:52:49 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f11sm28730557wrj.2.2020.06.16.06.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:52:47 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 02/73] ARM: tegra: Remove simple clocks bus
Date:   Tue, 16 Jun 2020 15:51:27 +0200
Message-Id: <20200616135238.3001888-3-thierry.reding@gmail.com>
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

The standard way to do this is to list out the clocks at the top-level.
Adopt the standard way to fix validation.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114-dalmore.dts    | 15 ++++-----------
 arch/arm/boot/dts/tegra114-roth.dts       | 15 ++++-----------
 arch/arm/boot/dts/tegra114-tn7.dts        | 15 ++++-----------
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 15 ++++-----------
 arch/arm/boot/dts/tegra124-nyan.dtsi      | 15 ++++-----------
 arch/arm/boot/dts/tegra124-venice2.dts    | 15 ++++-----------
 arch/arm/boot/dts/tegra20-harmony.dts     | 15 ++++-----------
 arch/arm/boot/dts/tegra20-paz00.dts       | 15 ++++-----------
 arch/arm/boot/dts/tegra20-seaboard.dts    | 15 ++++-----------
 arch/arm/boot/dts/tegra20-trimslice.dts   | 19 ++++++-------------
 arch/arm/boot/dts/tegra20-ventana.dts     | 15 ++++-----------
 arch/arm/boot/dts/tegra30-beaver.dts      | 15 ++++-----------
 arch/arm/boot/dts/tegra30-cardhu.dtsi     | 15 ++++-----------
 13 files changed, 54 insertions(+), 145 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 08be733ee2cd..04adfcb30cd7 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -1152,17 +1152,10 @@ backlight: backlight {
 		default-brightness-level = <6>;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
index 3d3835591cd2..73b83d51b59b 100644
--- a/arch/arm/boot/dts/tegra114-roth.dts
+++ b/arch/arm/boot/dts/tegra114-roth.dts
@@ -1016,17 +1016,10 @@ backlight: backlight {
 		enable-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm/boot/dts/tegra114-tn7.dts b/arch/arm/boot/dts/tegra114-tn7.dts
index bfdd1bf61816..94e801b7986e 100644
--- a/arch/arm/boot/dts/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/tegra114-tn7.dts
@@ -273,17 +273,10 @@ backlight: backlight {
 		power-supply = <&lcd_bl_en>;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 3bce7a1b288a..51b217a6507d 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1855,17 +1855,10 @@ usb-phy@7d008000 {
 		vbus-supply = <&vdd_usb3_vbus>;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	cpus {
diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index 9cb5921bb1fa..4555d01094b5 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -575,17 +575,10 @@ backlight: backlight {
 			 256>;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	cpus {
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 710a68c5d4c7..6a7a31c831c5 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -1057,17 +1057,10 @@ backlight: backlight {
 		default-brightness-level = <6>;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index 02cd67ea2503..bdfbe26fa26a 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -640,17 +640,10 @@ backlight: backlight {
 		default-brightness-level = <6>;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index cce3a3fb82ed..bfc9625a6c72 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -569,17 +569,10 @@ backlight: backlight {
 		backlight-boot-off;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index 376ecb6435f4..28dcff3b7d7e 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -792,17 +792,10 @@ backlight: backlight {
 		default-brightness-level = <6>;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 8debd3d3c20d..5b26482a55b7 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -366,30 +366,23 @@ usb-phy@c5008000 {
 		status = "okay";
 	};
 
-	sdhci@c8000000 {
+	mmc@c8000000 {
 		status = "okay";
 		broken-cd;
 		bus-width = <4>;
 	};
 
-	sdhci@c8000600 {
+	mmc@c8000600 {
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(P, 1) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
 		bus-width = <4>;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index 022649119821..59998d3708a1 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -586,17 +586,10 @@ backlight: backlight {
 		default-brightness-level = <6>;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index 6b6fd8a8058f..ef3ea08f8d19 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1965,17 +1965,10 @@ usb-phy@7d008000 {
 		status = "okay";
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	gpio-leds {
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index 5ee5d141bd81..c166967b6c3f 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -418,17 +418,10 @@ backlight: backlight {
 		default-brightness-level = <6>;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	panel: panel {
-- 
2.24.1


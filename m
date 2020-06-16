Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415851FB299
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728869AbgFPNxY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728931AbgFPNxS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:18 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32562C06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:18 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id d128so3175091wmc.1
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VTwp+SL8wRQTyOOTKUYQ+dBw7W7OX6eyhOvU2Jiqj48=;
        b=TIbYcttZLmwQaeERRyl1KzmNNgEPU+xZOkoXAPsmip7EVDbnHQ4yksXyTBfSWeCoZC
         aEP7CllNhmhsk77cdoYTbVz+CI/zZmRVJoZomLKHjNIM/RfSEchSGtIUOYuyw7k/0hF0
         m06mgmHMFGvCwuPAuno4waYWkHl1KOsQ9r9sRdC6TmyzOH/cIZc5cA0JjE+DVtKqTaJM
         K6xpm42b0BEBYlQTb7noexs0G71Cbj5qQcVzgmOix3xcuk0+6kZT3SgKMK4oLgYCeKU5
         uJCqOaSnJRXpRim0cv/dIVX75lWbEfgy32s29LSKVlFPyc1guLOstEUuI20aWDz+koac
         7r+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VTwp+SL8wRQTyOOTKUYQ+dBw7W7OX6eyhOvU2Jiqj48=;
        b=mOPJk9mTkrPbGfKeha6XVwOPJ3A3v+P0tJR6HkfE9M1EuG7lkClifvJ63dAcLO1GeG
         hns5G10DBYyyqv3xYAcaz9//95q8PJQzihUfu9CBeu7mBTN4UB510ML+nruF9E8/NXh9
         imOdUHmPmCsKpKj394kJ7UHh8k0GLGr0CwlPqeZ2vEQE/hEGzrDWhpUGAW1HLuTokLmE
         zk7hCSxwvQoAu7Hhj7/l6qXZm452rolJrdGPVPnoiAntBnzOszzfjTr8iP6fTLAaH/Xp
         PynR+haa+w2jCcmhDHQV7d7xAq0RNXoUJJo2uw9JWS2Dgeu65j+6DKJ9WwYXKJhMmZ2j
         9jTw==
X-Gm-Message-State: AOAM530hizhgiPY9tOgTjwV7hez4f/THJydJh0ncF7CsJGEA5sLEhoVz
        fWexfpVhmh98+TUt1ZbA2ps=
X-Google-Smtp-Source: ABdhPJyuRFvADTf750utQfeuKdmdHkHFOHLAPSihUcOv65ui9vATLCxAldOZ5N02qcNwNT6ZRi3ysg==
X-Received: by 2002:a1c:df04:: with SMTP id w4mr3608421wmg.152.1592315596653;
        Tue, 16 Jun 2020 06:53:16 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v19sm4090072wml.26.2020.06.16.06.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Philippe Schenker <philippe.schenker@toradex.com>
Subject: [PATCH 13/73] ARM: tegra: Rename sdhci nodes to mmc
Date:   Tue, 16 Jun 2020 15:51:38 +0200
Message-Id: <20200616135238.3001888-14-thierry.reding@gmail.com>
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

Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: Philippe Schenker <philippe.schenker@toradex.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114-dalmore.dts          | 4 ++--
 arch/arm/boot/dts/tegra114-roth.dts             | 4 ++--
 arch/arm/boot/dts/tegra114-tn7.dts              | 2 +-
 arch/arm/boot/dts/tegra114.dtsi                 | 8 ++++----
 arch/arm/boot/dts/tegra124-apalis-eval.dts      | 4 ++--
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts | 4 ++--
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi     | 2 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi          | 2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts       | 4 ++--
 arch/arm/boot/dts/tegra124-nyan-big.dts         | 2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi            | 6 +++---
 arch/arm/boot/dts/tegra124-venice2.dts          | 4 ++--
 arch/arm/boot/dts/tegra124.dtsi                 | 8 ++++----
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts   | 2 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts      | 2 +-
 arch/arm/boot/dts/tegra20-harmony.dts           | 4 ++--
 arch/arm/boot/dts/tegra20-paz00.dts             | 4 ++--
 arch/arm/boot/dts/tegra20-seaboard.dts          | 6 +++---
 arch/arm/boot/dts/tegra20-ventana.dts           | 6 +++---
 arch/arm/boot/dts/tegra20.dtsi                  | 8 ++++----
 arch/arm/boot/dts/tegra30-apalis-eval.dts       | 4 ++--
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts  | 4 ++--
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi      | 2 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi           | 2 +-
 arch/arm/boot/dts/tegra30-beaver.dts            | 4 ++--
 arch/arm/boot/dts/tegra30-cardhu.dtsi           | 4 ++--
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts   | 2 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi          | 2 +-
 arch/arm/boot/dts/tegra30.dtsi                  | 8 ++++----
 29 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 584db54cd750..c04162ddec3c 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -1108,14 +1108,14 @@ i2s@70080400 {
 		};
 	};
 
-	sdhci@78000400 {
+	mmc@78000400 {
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_HIGH>;
 		bus-width = <4>;
 		status = "okay";
 	};
 
-	sdhci@78000600 {
+	mmc@78000600 {
 		bus-width = <8>;
 		status = "okay";
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
index 7378b5d6f2fa..07960171fabe 100644
--- a/arch/arm/boot/dts/tegra114-roth.dts
+++ b/arch/arm/boot/dts/tegra114-roth.dts
@@ -962,7 +962,7 @@ pmc@7000e400 {
 	};
 
 	/* SD card */
-	sdhci@78000400 {
+	mmc@78000400 {
 		status = "okay";
 		bus-width = <4>;
 		vqmmc-supply = <&vddio_sdmmc3>;
@@ -971,7 +971,7 @@ sdhci@78000400 {
 	};
 
 	/* eMMC */
-	sdhci@78000600 {
+	mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra114-tn7.dts b/arch/arm/boot/dts/tegra114-tn7.dts
index 0e520ae1109d..745d234b105b 100644
--- a/arch/arm/boot/dts/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/tegra114-tn7.dts
@@ -242,7 +242,7 @@ pmc@7000e400 {
 	};
 
 	/* eMMC */
-	sdhci@78000600 {
+	mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 23df7a5f37d3..69e0e3eeffb4 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -644,7 +644,7 @@ mipi: mipi@700e3000 {
 		#nvidia,mipi-calibrate-cells = <1>;
 	};
 
-	sdhci@78000000 {
+	mmc@78000000 {
 		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
 		reg = <0x78000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
@@ -655,7 +655,7 @@ sdhci@78000000 {
 		status = "disabled";
 	};
 
-	sdhci@78000200 {
+	mmc@78000200 {
 		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
 		reg = <0x78000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
@@ -666,7 +666,7 @@ sdhci@78000200 {
 		status = "disabled";
 	};
 
-	sdhci@78000400 {
+	mmc@78000400 {
 		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
 		reg = <0x78000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -677,7 +677,7 @@ sdhci@78000400 {
 		status = "disabled";
 	};
 
-	sdhci@78000600 {
+	mmc@78000600 {
 		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
 		reg = <0x78000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts b/arch/arm/boot/dts/tegra124-apalis-eval.dts
index ceb3f6388c7d..28c29b6813a7 100644
--- a/arch/arm/boot/dts/tegra124-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
@@ -130,7 +130,7 @@ usb@70090000 {
 	};
 
 	/* Apalis MMC1 */
-	sdhci@700b0000 {
+	mmc@700b0000 {
 		status = "okay";
 		bus-width = <4>;
 		/* MMC1_CD# */
@@ -139,7 +139,7 @@ sdhci@700b0000 {
 	};
 
 	/* Apalis SD1 */
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		status = "okay";
 		bus-width = <4>;
 		/* SD1_CD# */
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
index 826b776fbe6f..f3afde410615 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
@@ -132,7 +132,7 @@ usb@70090000 {
 	};
 
 	/* Apalis MMC1 */
-	sdhci@700b0000 {
+	mmc@700b0000 {
 		status = "okay";
 		bus-width = <4>;
 		/* MMC1_CD# */
@@ -141,7 +141,7 @@ sdhci@700b0000 {
 	};
 
 	/* Apalis SD1 */
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		status = "okay";
 		bus-width = <4>;
 		/* SD1_CD# */
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 1cc080fd062e..3fdc6ff32b0c 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1909,7 +1909,7 @@ usb3-1 {
 	};
 
 	/* eMMC */
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index f2b243d98c7c..29ceeba1e7b1 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1901,7 +1901,7 @@ usb3-1 {
 	};
 
 	/* eMMC */
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index e97943871fd8..289bf6e99041 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1797,7 +1797,7 @@ usb3-0 {
 	};
 
 	/* SD card */
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
 		power-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
@@ -1807,7 +1807,7 @@ sdhci@700b0400 {
 	};
 
 	/* eMMC */
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
index d97791b98958..4d14dec21af6 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
@@ -20,7 +20,7 @@ panel: panel {
 		ddc-i2c-bus = <&dpaux>;
 	};
 
-	sdhci@700b0400 { /* SD Card on this bus */
+	mmc@700b0400 { /* SD Card on this bus */
 		wp-gpios = <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_LOW>;
 	};
 
diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index b3b5c12cbda9..41a3db6649c5 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -491,7 +491,7 @@ sdhci0_pwrseq: sdhci0_pwrseq {
 		reset-gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
 	};
 
-	sdhci@700b0000 { /* WiFi/BT on this bus */
+	mmc@700b0000 { /* WiFi/BT on this bus */
 		status = "okay";
 		bus-width = <4>;
 		no-1-8-v;
@@ -502,7 +502,7 @@ sdhci@700b0000 { /* WiFi/BT on this bus */
 		keep-power-in-suspend;
 	};
 
-	sdhci@700b0400 { /* SD Card on this bus */
+	mmc@700b0400 { /* SD Card on this bus */
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
 		power-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
@@ -511,7 +511,7 @@ sdhci@700b0400 { /* SD Card on this bus */
 		vqmmc-supply = <&vddio_sdmmc3>;
 	};
 
-	sdhci@700b0600 { /* eMMC on this bus */
+	mmc@700b0600 { /* eMMC on this bus */
 		status = "okay";
 		bus-width = <8>;
 		no-1-8-v;
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index effdb303c7f7..584a3b2125cd 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -998,7 +998,7 @@ usb3-1 {
 		};
 	};
 
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
 		power-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
 		wp-gpios = <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_LOW>;
@@ -1007,7 +1007,7 @@ sdhci@700b0400 {
 		vqmmc-supply = <&vddio_sdmmc3>;
 	};
 
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 2c992e8e3594..76c1ef923213 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -833,7 +833,7 @@ usb3-1 {
 		};
 	};
 
-	sdhci@700b0000 {
+	mmc@700b0000 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0000 0x0 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
@@ -843,7 +843,7 @@ sdhci@700b0000 {
 		status = "disabled";
 	};
 
-	sdhci@700b0200 {
+	mmc@700b0200 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0200 0x0 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
@@ -853,7 +853,7 @@ sdhci@700b0200 {
 		status = "disabled";
 	};
 
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0400 0x0 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -863,7 +863,7 @@ sdhci@700b0400 {
 		status = "disabled";
 	};
 
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0600 0x0 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
index 37ad508b61d9..a05fb3853da8 100644
--- a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
@@ -183,7 +183,7 @@ can@0 {
 	};
 
 	/* SD/MMC */
-	sdhci@c8000600 {
+	mmc@c8000600 {
 		status = "okay";
 		bus-width = <4>;
 		cd-gpios = <&gpio TEGRA_GPIO(C, 7) GPIO_ACTIVE_LOW>; /* MMCD */
diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index af4740847769..425494b9ed54 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -171,7 +171,7 @@ spi@7000da00 {
 	};
 
 	/* SD/MMC */
-	sdhci@c8000600 {
+	mmc@c8000600 {
 		status = "okay";
 		bus-width = <4>;
 		cd-gpios = <&gpio TEGRA_GPIO(C, 7) GPIO_ACTIVE_LOW>; /* MMCD */
diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index b051d75d4642..86494cb4d5a1 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -613,7 +613,7 @@ usb-phy@c5008000 {
 		status = "okay";
 	};
 
-	sdhci@c8000200 {
+	mmc@c8000200 {
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
@@ -621,7 +621,7 @@ sdhci@c8000200 {
 		bus-width = <4>;
 	};
 
-	sdhci@c8000600 {
+	mmc@c8000600 {
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 2a0e5754f50f..91b6bb82e960 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -543,7 +543,7 @@ usb-phy@c5008000 {
 		status = "okay";
 	};
 
-	sdhci@c8000000 {
+	mmc@c8000000 {
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(V, 5) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
@@ -551,7 +551,7 @@ sdhci@c8000000 {
 		bus-width = <4>;
 	};
 
-	sdhci@c8000600 {
+	mmc@c8000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index 9a1ab4bd43e0..f1baf16c5010 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -760,14 +760,14 @@ usb-phy@c5008000 {
 		status = "okay";
 	};
 
-	sdhci@c8000000 {
+	mmc@c8000000 {
 		status = "okay";
 		power-gpios = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
 		bus-width = <4>;
 		keep-power-in-suspend;
 	};
 
-	sdhci@c8000400 {
+	mmc@c8000400 {
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
@@ -775,7 +775,7 @@ sdhci@c8000400 {
 		bus-width = <4>;
 	};
 
-	sdhci@c8000600 {
+	mmc@c8000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index ccc24674be03..b158771ac0b7 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -554,14 +554,14 @@ usb-phy@c5008000 {
 		status = "okay";
 	};
 
-	sdhci@c8000000 {
+	mmc@c8000000 {
 		status = "okay";
 		power-gpios = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
 		bus-width = <4>;
 		keep-power-in-suspend;
 	};
 
-	sdhci@c8000400 {
+	mmc@c8000400 {
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
@@ -569,7 +569,7 @@ sdhci@c8000400 {
 		bus-width = <4>;
 	};
 
-	sdhci@c8000600 {
+	mmc@c8000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 8b6909839f59..9e71ed84bf28 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -805,7 +805,7 @@ phy3: usb-phy@c5008000 {
 		status = "disabled";
 	};
 
-	sdhci@c8000000 {
+	mmc@c8000000 {
 		compatible = "nvidia,tegra20-sdhci";
 		reg = <0xc8000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
@@ -815,7 +815,7 @@ sdhci@c8000000 {
 		status = "disabled";
 	};
 
-	sdhci@c8000200 {
+	mmc@c8000200 {
 		compatible = "nvidia,tegra20-sdhci";
 		reg = <0xc8000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
@@ -825,7 +825,7 @@ sdhci@c8000200 {
 		status = "disabled";
 	};
 
-	sdhci@c8000400 {
+	mmc@c8000400 {
 		compatible = "nvidia,tegra20-sdhci";
 		reg = <0xc8000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -835,7 +835,7 @@ sdhci@c8000400 {
 		status = "disabled";
 	};
 
-	sdhci@c8000600 {
+	mmc@c8000600 {
 		compatible = "nvidia,tegra20-sdhci";
 		reg = <0xc8000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index b39c26806bf2..9f653ef41da4 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -120,7 +120,7 @@ spi@7000dc00 {
 	};
 
 	/* Apalis SD1 */
-	sdhci@78000000 {
+	mmc@78000000 {
 		status = "okay";
 		bus-width = <4>;
 		/* SD1_CD# */
@@ -129,7 +129,7 @@ sdhci@78000000 {
 	};
 
 	/* Apalis MMC1 */
-	sdhci@78000400 {
+	mmc@78000400 {
 		status = "okay";
 		bus-width = <8>;
 		/* MMC1_CD# */
diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
index e29dca92ba0a..dc633e529822 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
@@ -121,7 +121,7 @@ spi@7000dc00 {
 	};
 
 	/* Apalis SD1 */
-	sdhci@78000000 {
+	mmc@78000000 {
 		status = "okay";
 		bus-width = <4>;
 		/* SD1_CD# */
@@ -130,7 +130,7 @@ sdhci@78000000 {
 	};
 
 	/* Apalis MMC1 */
-	sdhci@78000400 {
+	mmc@78000400 {
 		status = "okay";
 		bus-width = <8>;
 		/* MMC1_CD# */
diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
index 387b17458e22..9421063cd86c 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
@@ -1112,7 +1112,7 @@ i2s@70080500 {
 	};
 
 	/* eMMC */
-	sdhci@78000600 {
+	mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 6648506f3aa4..d13f6b0c7c0c 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -1094,7 +1094,7 @@ i2s@70080500 {
 	};
 
 	/* eMMC */
-	sdhci@78000600 {
+	mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index 3211c61f956c..e0624b74fb50 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1922,7 +1922,7 @@ i2s@70080400 {
 		};
 	};
 
-	sdhci@78000000 {
+	mmc@78000000 {
 		status = "okay";
 		vqmmc-supply = <&ldo5_reg>;
 		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
@@ -1931,7 +1931,7 @@ sdhci@78000000 {
 		bus-width = <4>;
 	};
 
-	sdhci@78000600 {
+	mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index c8dc3b6ab2f6..dab9989fa760 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -384,7 +384,7 @@ i2s@70080400 {
 		};
 	};
 
-	sdhci@78000000 {
+	mmc@78000000 {
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(T, 3) GPIO_ACTIVE_HIGH>;
@@ -392,7 +392,7 @@ sdhci@78000000 {
 		bus-width = <4>;
 	};
 
-	sdhci@78000600 {
+	mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index 8e106e784dce..7d4a6ca4936a 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -98,7 +98,7 @@ can@0 {
 	};
 
 	/* SD/MMC */
-	sdhci@78000200 {
+	mmc@78000200 {
 		status = "okay";
 		bus-width = <4>;
 		cd-gpios = <&gpio TEGRA_GPIO(C, 7) GPIO_ACTIVE_LOW>; /* MMCD */
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index adba554381c7..a7bfe26f038d 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -933,7 +933,7 @@ i2s@70080500 {
 	};
 
 	/* eMMC */
-	sdhci@78000600 {
+	mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 23fedb76e5ae..536cc5629440 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -851,7 +851,7 @@ tegra_i2s4: i2s@70080700 {
 		};
 	};
 
-	sdhci@78000000 {
+	mmc@78000000 {
 		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
 		reg = <0x78000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
@@ -861,7 +861,7 @@ sdhci@78000000 {
 		status = "disabled";
 	};
 
-	sdhci@78000200 {
+	mmc@78000200 {
 		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
 		reg = <0x78000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
@@ -871,7 +871,7 @@ sdhci@78000200 {
 		status = "disabled";
 	};
 
-	sdhci@78000400 {
+	mmc@78000400 {
 		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
 		reg = <0x78000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -881,7 +881,7 @@ sdhci@78000400 {
 		status = "disabled";
 	};
 
-	sdhci@78000600 {
+	mmc@78000600 {
 		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
 		reg = <0x78000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.24.1


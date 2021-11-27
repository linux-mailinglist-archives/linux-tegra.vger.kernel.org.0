Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2BBB45FF44
	for <lists+linux-tegra@lfdr.de>; Sat, 27 Nov 2021 15:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235822AbhK0OcE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 27 Nov 2021 09:32:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbhK0O3v (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Nov 2021 09:29:51 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43A6C06174A;
        Sat, 27 Nov 2021 06:26:36 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id t11so24582552ljh.6;
        Sat, 27 Nov 2021 06:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OlBP06rQay7DVAAUC6wiBfUmyrcwsLWrQweIR2WC/v4=;
        b=B1c4QUEsEk6bYCFrGPjhBUhEMwGajC8Q95XJfC1/rF9WeRBNY2UI1wEyB53A1gM6BL
         IywnIJ1wcQ4e9VESWnwFdSJQ/bhCmSBJ/aCDu6gA1uMStqVjhUQA577QEXQRzl/8mhLe
         MbANn4cYC6dNWS1LJiXCmQnSlaafYvu0lvZJREm5xH9ZUwxGRcLMX1DiFtVTjsYakRGz
         9SAeWjMvcXEu/dwd9y27AJE50ODJwavO7cgCT4FkIjXFTht1jtRFa2RsGEsCWF0jeZT/
         Q9u4b1uQT+sZApasS3y56G91BV9ESGNFW6nASW51tjgOVCzFjStAgwyFLZF36VFfzYJU
         sjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OlBP06rQay7DVAAUC6wiBfUmyrcwsLWrQweIR2WC/v4=;
        b=QElX8z2JE56Xt5vrZxW+jk/vRwfsb1/XmVXVBr0cEBvtfHhEkmL6D8+/AkpMbbDec5
         fcA+RNrsCp0ibRZ3C/6JnJ3urKKNPrkQhkf3uI7yQhQLrVD0VlLbeHMVFgD/zlpbztdg
         AbR+zIfPt+ssJbo9Tdx0DEjXjUcxH4yEpIySdy/CeK48iGW3AXUvAQCGR1sPMEQ5tJ/7
         XMEuovb6NU2LZr9Rd7wBGeu+i+wJ2zRgIGPS9QsmRZ3aYtsBiTK17R81px1DSxlBB7/f
         KY2RcaKCQSBep7o/ki35zNEKy3rh6PUnGckQFHr/EFuylvkep3f6J3ihPuoAQ3ByqPsy
         ogdQ==
X-Gm-Message-State: AOAM531hVOkLkun0CBOK38JVzUPHPKvkX/HJU6T3Z7f0AjdVpeH5bfbq
        fPtUvsReaHyM+AbdXpUpHx4=
X-Google-Smtp-Source: ABdhPJw4v8hoBK/0qre18sdLwgpBoNX8fo1whOcj1KzdSrxn47zSBe2DpcsU9x/0I6efhwEWILCB8g==
X-Received: by 2002:a2e:8015:: with SMTP id j21mr29258193ljg.226.1638023194871;
        Sat, 27 Nov 2021 06:26:34 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t22sm812382ljg.83.2021.11.27.06.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 06:26:34 -0800 (PST)
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
Subject: [PATCH v3 04/14] ARM: tegra: Add device-tree for ASUS Transformer EeePad TF101
Date:   Sat, 27 Nov 2021 17:23:17 +0300
Message-Id: <20211127142327.17692-5-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211127142327.17692-1-digetx@gmail.com>
References: <20211127142327.17692-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Nikola Milosavljevic <mnidza@outlook.com>

Add device-tree for Tegra20-based ASUS Transformer EeePad TF101.

Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Co-developed-by: Antoni Aloy Torrens <aaloytorrens@gmail.com>
Signed-off-by: Antoni Aloy Torrens <aaloytorrens@gmail.com>
Signed-off-by: Nikola Milosavljevic <mnidza@outlook.com>
Co-developed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/Makefile               |    1 +
 arch/arm/boot/dts/tegra20-asus-tf101.dts | 1191 ++++++++++++++++++++++
 2 files changed, 1192 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra20-asus-tf101.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8a2dfdf01ce3..8fdebf7c1afe 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1304,6 +1304,7 @@ dtb-$(CONFIG_MACH_SUNIV) += \
 	suniv-f1c100s-licheepi-nano.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += \
 	tegra20-acer-a500-picasso.dtb \
+	tegra20-asus-tf101.dtb \
 	tegra20-harmony.dtb \
 	tegra20-colibri-eval-v3.dtb \
 	tegra20-colibri-iris.dtb \
diff --git a/arch/arm/boot/dts/tegra20-asus-tf101.dts b/arch/arm/boot/dts/tegra20-asus-tf101.dts
new file mode 100644
index 000000000000..4dc0722c28f5
--- /dev/null
+++ b/arch/arm/boot/dts/tegra20-asus-tf101.dts
@@ -0,0 +1,1191 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include <dt-bindings/input/atmel-maxtouch.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/thermal/thermal.h>
+
+#include "tegra20.dtsi"
+#include "tegra20-cpu-opp.dtsi"
+#include "tegra20-cpu-opp-microvolt.dtsi"
+
+/ {
+	model = "ASUS EeePad Transformer TF101";
+	compatible = "asus,tf101", "nvidia,tegra20";
+	chassis-type = "convertible";
+
+	aliases {
+		mmc0 = &sdmmc4; /* eMMC */
+		mmc1 = &sdmmc3; /* MicroSD */
+		mmc2 = &sdmmc1; /* WiFi */
+
+		rtc0 = &pmic;
+		rtc1 = "/rtc@7000e000";
+
+		serial0 = &uartd;
+		serial1 = &uartc; /* Bluetooth */
+		serial2 = &uartb; /* GPS */
+	};
+
+	/*
+	 * The decompressor and also some bootloaders rely on a
+	 * pre-existing /chosen node to be available to insert the
+	 * command line and merge other ATAGS info.
+	 */
+	chosen {};
+
+	memory@0 {
+		reg = <0x00000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		ramoops@2ffe0000 {
+			compatible = "ramoops";
+			reg = <0x2ffe0000 0x10000>;	/* 64kB */
+			console-size = <0x8000>;	/* 32kB */
+			record-size = <0x400>;		/*  1kB */
+			ecc-size = <16>;
+		};
+
+		linux,cma@30000000 {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x30000000 0x10000000>;
+			size = <0x10000000>; /* 256MiB */
+			linux,cma-default;
+			reusable;
+		};
+	};
+
+	host1x@50000000 {
+		dc@54200000 {
+			rgb {
+				status = "okay";
+
+				port@0 {
+					lcd_output: endpoint {
+						remote-endpoint = <&lvds_encoder_input>;
+						bus-width = <18>;
+					};
+				};
+			};
+		};
+
+		hdmi@54280000 {
+			status = "okay";
+
+			vdd-supply = <&hdmi_vdd_reg>;
+			pll-supply = <&hdmi_pll_reg>;
+			hdmi-supply = <&vdd_hdmi_en>;
+
+			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
+				GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	gpio@6000d000 {
+		charging-enable-hog {
+			gpio-hog;
+			gpios = <TEGRA_GPIO(R, 6) GPIO_ACTIVE_HIGH>;
+			output-low;
+		};
+	};
+
+	pinmux@70000014 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&state_default>;
+
+		state_default: pinmux {
+			ata {
+				nvidia,pins = "ata";
+				nvidia,function = "ide";
+			};
+			atb {
+				nvidia,pins = "atb", "gma", "gme";
+				nvidia,function = "sdio4";
+			};
+			atc {
+				nvidia,pins = "atc";
+				nvidia,function = "nand";
+			};
+			atd {
+				nvidia,pins = "atd", "ate", "gmb", "spia",
+					"spib", "spic";
+				nvidia,function = "gmi";
+			};
+			cdev1 {
+				nvidia,pins = "cdev1";
+				nvidia,function = "plla_out";
+			};
+			cdev2 {
+				nvidia,pins = "cdev2";
+				nvidia,function = "pllp_out4";
+			};
+			crtp {
+				nvidia,pins = "crtp";
+				nvidia,function = "crt";
+			};
+			lm1 {
+				nvidia,pins = "lm1";
+				nvidia,function = "rsvd3";
+			};
+			csus {
+				nvidia,pins = "csus";
+				nvidia,function = "vi_sensor_clk";
+			};
+			dap1 {
+				nvidia,pins = "dap1";
+				nvidia,function = "dap1";
+			};
+			dap2 {
+				nvidia,pins = "dap2";
+				nvidia,function = "dap2";
+			};
+			dap3 {
+				nvidia,pins = "dap3";
+				nvidia,function = "dap3";
+			};
+			dap4 {
+				nvidia,pins = "dap4";
+				nvidia,function = "dap4";
+			};
+			dta {
+				nvidia,pins = "dta", "dtb", "dtc", "dtd", "dte";
+				nvidia,function = "vi";
+			};
+			dtf {
+				nvidia,pins = "dtf";
+				nvidia,function = "i2c3";
+			};
+			gmc {
+				nvidia,pins = "gmc";
+				nvidia,function = "uartd";
+			};
+			gmd {
+				nvidia,pins = "gmd";
+				nvidia,function = "sflash";
+			};
+			gpu {
+				nvidia,pins = "gpu";
+				nvidia,function = "pwm";
+			};
+			gpu7 {
+				nvidia,pins = "gpu7";
+				nvidia,function = "rtck";
+			};
+			gpv {
+				nvidia,pins = "gpv", "slxa";
+				nvidia,function = "pcie";
+			};
+			hdint {
+				nvidia,pins = "hdint";
+				nvidia,function = "hdmi";
+			};
+			i2cp {
+				nvidia,pins = "i2cp";
+				nvidia,function = "i2cp";
+			};
+			irrx {
+				nvidia,pins = "irrx", "irtx";
+				nvidia,function = "uartb";
+			};
+			kbca {
+				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
+					"kbce", "kbcf";
+				nvidia,function = "kbc";
+			};
+			lcsn {
+				nvidia,pins = "lcsn", "ldc", "lm0", "lpw1",
+					"lsdi", "lvp0";
+				nvidia,function = "rsvd4";
+			};
+			ld0 {
+				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
+					"ld5", "ld6", "ld7", "ld8", "ld9",
+					"ld10", "ld11", "ld12", "ld13", "ld14",
+					"ld15", "ld16", "ld17", "ldi", "lhp0",
+					"lhp1", "lhp2", "lhs", "lpp", "lpw0",
+					"lpw2", "lsc0", "lsc1", "lsck", "lsda",
+					"lspi", "lvp1", "lvs";
+				nvidia,function = "displaya";
+			};
+			owc {
+				nvidia,pins = "owc", "spdi", "spdo", "uac";
+				nvidia,function = "rsvd2";
+			};
+			pmc {
+				nvidia,pins = "pmc";
+				nvidia,function = "pwr_on";
+			};
+			rm {
+				nvidia,pins = "rm";
+				nvidia,function = "i2c1";
+			};
+			sdb {
+				nvidia,pins = "sdb", "sdc", "sdd", "slxc", "slxk";
+				nvidia,function = "sdio3";
+			};
+			sdio1 {
+				nvidia,pins = "sdio1";
+				nvidia,function = "sdio1";
+			};
+			slxd {
+				nvidia,pins = "slxd";
+				nvidia,function = "spdif";
+			};
+			spid {
+				nvidia,pins = "spid", "spie", "spif";
+				nvidia,function = "spi1";
+			};
+			spig {
+				nvidia,pins = "spig", "spih";
+				nvidia,function = "spi2_alt";
+			};
+			uaa {
+				nvidia,pins = "uaa", "uab", "uda";
+				nvidia,function = "ulpi";
+			};
+			uad {
+				nvidia,pins = "uad";
+				nvidia,function = "irda";
+			};
+			uca {
+				nvidia,pins = "uca", "ucb";
+				nvidia,function = "uartc";
+			};
+			conf_ata {
+				nvidia,pins = "ata", "atb", "atc", "atd",
+					"cdev1", "cdev2", "dap1", "dap4",
+					"dte", "ddc", "dtf", "gma", "gmc",
+					"gme", "gpu", "gpu7", "gpv", "i2cp",
+					"irrx", "irtx", "pta", "rm", "sdc",
+					"sdd", "slxc", "slxd", "slxk", "spdi",
+					"spdo", "uac", "uad",
+					"uda", "csus";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+			conf_ate {
+				nvidia,pins = "ate", "dap2", "dap3", "gmb", "gmd",
+					"owc", "spia", "spib", "spic",
+					"spid", "spie", "spig", "slxa";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+			conf_ck32 {
+				nvidia,pins = "ck32", "ddrc", "pmca", "pmcb",
+					"pmcc", "pmcd", "pmce", "xm2c", "xm2d";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			};
+			conf_crtp {
+				nvidia,pins = "crtp", "spih";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+			conf_dta {
+				nvidia,pins = "dta", "dtb", "dtc", "dtd";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+			conf_spif {
+				nvidia,pins = "spif";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+			conf_hdint {
+				nvidia,pins = "hdint", "lcsn", "ldc", "lm1",
+					"lpw1", "lsck", "lsda", "lsdi", "lvp0";
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+			conf_kbca {
+				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
+					"kbce", "kbcf", "sdio1", "uaa", "uab",
+					"uca", "ucb";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+			conf_lc {
+				nvidia,pins = "lc", "ls";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			};
+			conf_ld0 {
+				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
+					"ld5", "ld6", "ld7", "ld8", "ld9",
+					"ld10", "ld11", "ld12", "ld13", "ld14",
+					"ld15", "ld16", "ld17", "ldi", "lhp0",
+					"lhp1", "lhp2", "lhs", "lm0", "lpp",
+					"lpw0", "lpw2", "lsc0", "lsc1", "lspi",
+					"lvp1", "lvs", "pmc", "sdb";
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+			conf_ld17_0 {
+				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
+					"ld23_22";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			};
+			drive_sdio1 {
+				nvidia,pins = "drive_sdio1", "drive_ddc", "drive_vi1";
+				nvidia,high-speed-mode = <TEGRA_PIN_DISABLE>;
+				nvidia,schmitt = <TEGRA_PIN_ENABLE>;
+				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_1>;
+				nvidia,pull-down-strength = <31>;
+				nvidia,pull-up-strength = <31>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
+			};
+			drive_csus {
+				nvidia,pins = "drive_csus";
+				nvidia,high-speed-mode = <TEGRA_PIN_DISABLE>;
+				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_1>;
+				nvidia,pull-down-strength = <31>;
+				nvidia,pull-up-strength = <31>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
+			};
+		};
+
+		state_i2cmux_ddc: pinmux_i2cmux_ddc {
+			ddc {
+				nvidia,pins = "ddc";
+				nvidia,function = "i2c2";
+			};
+			pta {
+				nvidia,pins = "pta";
+				nvidia,function = "rsvd4";
+			};
+		};
+
+		state_i2cmux_pta: pinmux_i2cmux_pta {
+			ddc {
+				nvidia,pins = "ddc";
+				nvidia,function = "rsvd4";
+			};
+			pta {
+				nvidia,pins = "pta";
+				nvidia,function = "i2c2";
+			};
+		};
+
+		state_i2cmux_idle: pinmux_i2cmux_idle {
+			ddc {
+				nvidia,pins = "ddc";
+				nvidia,function = "rsvd4";
+			};
+			pta {
+				nvidia,pins = "pta";
+				nvidia,function = "rsvd4";
+			};
+		};
+	};
+
+	i2s@70002800 {
+		status = "okay";
+	};
+
+	uartb: serial@70006040 {
+		compatible = "nvidia,tegra20-hsuart";
+		/* GPS BCM4751 */
+	};
+
+	uartc: serial@70006200 {
+		compatible = "nvidia,tegra20-hsuart";
+		status = "okay";
+
+		/* Azurewave AW-NH615 BCM4329B1 */
+		bluetooth {
+			compatible = "brcm,bcm4329-bt";
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "host-wakeup";
+
+			/* PLLP 216MHz / 16 / 4 */
+			max-speed = <3375000>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
+			clock-names = "txco";
+
+			vbat-supply  = <&vdd_3v3_sys>;
+			vddio-supply = <&vdd_1v8_sys>;
+
+			device-wakeup-gpios = <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
+			shutdown-gpios =      <&gpio TEGRA_GPIO(U, 0) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	serial@70006300 {
+		status = "okay";
+	};
+
+	pwm: pwm@7000a000 {
+		status = "okay";
+	};
+
+	i2c@7000c000 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		/* Aichi AMI306 digital compass */
+		magnetometer@e {
+			compatible = "asahi-kasei,ak8974";
+			reg = <0xe>;
+
+			avdd-supply = <&vdd_3v3_sys>;
+			dvdd-supply = <&vdd_1v8_sys>;
+
+			mount-matrix = "-1",  "0",  "0",
+					"0",  "1",  "0",
+					"0",  "0", "-1";
+		};
+
+		wm8903: audio-codec@1a {
+			compatible = "wlf,wm8903";
+			reg = <0x1a>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(X, 1) IRQ_TYPE_EDGE_BOTH>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			micdet-cfg = <0x83>;
+			micdet-delay = <100>;
+
+			gpio-cfg = <
+				0xffffffff /* don't touch */
+				0xffffffff /* don't touch */
+				0x00000000 /* Speaker-enable GPIO, output, low */
+				0x00000400 /* Mic bias current detect */
+				0xffffffff /* don't touch */
+			>;
+
+			AVDD-supply  = <&vdd_1v8_sys>;
+			CPVDD-supply = <&vdd_1v8_sys>;
+			DBVDD-supply = <&vdd_1v8_sys>;
+			DCVDD-supply = <&vdd_1v8_sys>;
+		};
+
+		/* Atmel MXT1386 Touchscreen */
+		touchscreen@5b {
+			compatible = "atmel,maxtouch";
+			reg = <0x5b>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(V, 6) IRQ_TYPE_LEVEL_LOW>;
+
+			reset-gpios = <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_LOW>;
+
+			vdda-supply = <&vdd_3v3_sys>;
+			vdd-supply  = <&vdd_3v3_sys>;
+
+			atmel,wakeup-method = <ATMEL_MXT_WAKEUP_I2C_SCL>;
+		};
+
+		gyroscope@68 {
+			compatible = "invensense,mpu3050";
+			reg = <0x68>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(Z, 4) IRQ_TYPE_EDGE_RISING>;
+
+			vdd-supply    = <&vdd_3v3_sys>;
+			vlogic-supply = <&vdd_1v8_sys>;
+
+			mount-matrix =	 "0",  "1",  "0",
+					"-1",  "0",  "0",
+					 "0",  "0",  "1";
+
+			i2c-gate {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				accelerometer@f {
+					compatible = "kionix,kxtf9";
+					reg = <0xf>;
+
+					interrupt-parent = <&gpio>;
+					interrupts = <TEGRA_GPIO(N, 4) IRQ_TYPE_EDGE_RISING>;
+
+					vdd-supply = <&vdd_1v8_sys>;
+					vddio-supply = <&vdd_1v8_sys>;
+
+					mount-matrix =	 "1",  "0",  "0",
+							 "0",  "1",  "0",
+							 "0",  "0",  "1";
+				};
+			};
+		};
+	};
+
+	i2c2: i2c@7000c400 {
+		status = "okay";
+		clock-frequency = <100000>;
+	};
+
+	i2cmux {
+		compatible = "i2c-mux-pinctrl";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c-parent = <&i2c2>;
+
+		pinctrl-names = "ddc", "pta", "idle";
+		pinctrl-0 = <&state_i2cmux_ddc>;
+		pinctrl-1 = <&state_i2cmux_pta>;
+		pinctrl-2 = <&state_i2cmux_idle>;
+
+		hdmi_ddc: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		lvds_ddc: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			smart-battery@b {
+				compatible = "ti,bq20z75", "sbs,sbs-battery";
+				reg = <0xb>;
+				sbs,i2c-retry-count = <2>;
+				sbs,poll-retry-count = <10>;
+				power-supplies = <&mains>;
+			};
+		};
+	};
+
+	i2c@7000c500 {
+		status = "okay";
+		clock-frequency = <400000>;
+	};
+
+	i2c@7000d000 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		pmic: pmic@34 {
+			compatible = "ti,tps6586x";
+			reg = <0x34>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+
+			ti,system-power-controller;
+
+			#gpio-cells = <2>;
+			gpio-controller;
+
+			sys-supply = <&vdd_5v0_sys>;
+			vin-sm0-supply = <&sys_reg>;
+			vin-sm1-supply = <&sys_reg>;
+			vin-sm2-supply = <&sys_reg>;
+			vinldo01-supply = <&sm2_reg>;
+			vinldo23-supply = <&sm2_reg>;
+			vinldo4-supply = <&sm2_reg>;
+			vinldo678-supply = <&sm2_reg>;
+			vinldo9-supply = <&sm2_reg>;
+
+			regulators {
+				sys_reg: sys {
+					regulator-name = "vdd_sys";
+					regulator-always-on;
+				};
+
+				vdd_core: sm0 {
+					regulator-name = "vdd_sm0,vdd_core";
+					regulator-min-microvolt = <950000>;
+					regulator-max-microvolt = <1300000>;
+					regulator-coupled-with = <&rtc_vdd &vdd_cpu>;
+					regulator-coupled-max-spread = <170000 550000>;
+					regulator-always-on;
+					regulator-boot-on;
+
+					nvidia,tegra-core-regulator;
+				};
+
+				vdd_cpu: sm1 {
+					regulator-name = "vdd_sm1,vdd_cpu";
+					regulator-min-microvolt = <750000>;
+					regulator-max-microvolt = <1125000>;
+					regulator-coupled-with = <&vdd_core &rtc_vdd>;
+					regulator-coupled-max-spread = <550000 550000>;
+					regulator-always-on;
+					regulator-boot-on;
+
+					nvidia,tegra-cpu-regulator;
+				};
+
+				sm2_reg: sm2 {
+					regulator-name = "vdd_sm2,vin_ldo*";
+					regulator-min-microvolt = <3700000>;
+					regulator-max-microvolt = <3700000>;
+					regulator-always-on;
+				};
+
+				/* LDO0 is not connected to anything */
+
+				ldo1 {
+					regulator-name = "vdd_ldo1,avdd_pll*";
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+					regulator-always-on;
+				};
+
+				rtc_vdd: ldo2 {
+					regulator-name = "vdd_ldo2,vdd_rtc";
+					regulator-min-microvolt = <950000>;
+					regulator-max-microvolt = <1300000>;
+					regulator-coupled-with = <&vdd_core &vdd_cpu>;
+					regulator-coupled-max-spread = <170000 550000>;
+					regulator-always-on;
+					regulator-boot-on;
+
+					nvidia,tegra-rtc-regulator;
+				};
+
+				ldo3 {
+					regulator-name = "vdd_ldo3,avdd_usb*";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+				};
+
+				ldo4 {
+					regulator-name = "vdd_ldo4,avdd_osc,vddio_sys";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				vcore_emmc: ldo5 {
+					regulator-name = "vdd_ldo5,vcore_mmc";
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+					regulator-always-on;
+				};
+
+				ldo6 {
+					regulator-name = "vdd_ldo6,avdd_vdac";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				hdmi_vdd_reg: ldo7 {
+					regulator-name = "vdd_ldo7,avdd_hdmi,vdd_fuse";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				hdmi_pll_reg: ldo8 {
+					regulator-name = "vdd_ldo8,avdd_hdmi_pll";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				ldo9 {
+					regulator-name = "vdd_ldo9,avdd_2v85,vdd_ddr_rx";
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+					regulator-always-on;
+				};
+
+				ldo_rtc {
+					regulator-name = "vdd_rtc_out,vdd_cell";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+				};
+			};
+		};
+
+		nct1008: temperature-sensor@4c {
+			compatible = "onnn,nct1008";
+			reg = <0x4c>;
+			vcc-supply = <&vdd_3v3_sys>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(N, 6) IRQ_TYPE_EDGE_FALLING>;
+
+			#thermal-sensor-cells = <1>;
+		};
+	};
+
+	pmc@7000e400 {
+		nvidia,invert-interrupt;
+		nvidia,suspend-mode = <1>;
+		nvidia,cpu-pwr-good-time = <2000>;
+		nvidia,cpu-pwr-off-time = <100>;
+		nvidia,core-pwr-good-time = <3845 3845>;
+		nvidia,core-pwr-off-time = <458>;
+		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
+	};
+
+	/* Peripheral USB via ASUS connector */
+	usb@c5000000 {
+		compatible = "nvidia,tegra20-udc";
+		status = "okay";
+		dr_mode = "peripheral";
+	};
+
+	usb-phy@c5000000 {
+		status = "okay";
+		dr_mode = "peripheral";
+		nvidia,xcvr-setup-use-fuses;
+		nvidia,xcvr-lsfslew = <2>;
+		nvidia,xcvr-lsrslew = <2>;
+		vbus-supply = <&vdd_5v0_sys>;
+	};
+
+	/* Dock's USB port */
+	usb@c5008000 {
+		status = "okay";
+	};
+
+	usb-phy@c5008000 {
+		status = "okay";
+		nvidia,xcvr-setup-use-fuses;
+		vbus-supply = <&vdd_5v0_sys>;
+	};
+
+	brcm_wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+
+		clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
+		clock-names = "ext_clock";
+
+		reset-gpios = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <200>;
+		power-off-delay-us = <200>;
+	};
+
+	sdmmc1: mmc@c8000000 {
+		status = "okay";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		assigned-clocks = <&tegra_car TEGRA20_CLK_SDMMC1>;
+		assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_C>;
+		assigned-clock-rates = <40000000>;
+
+		max-frequency = <40000000>;
+		keep-power-in-suspend;
+		bus-width = <4>;
+		non-removable;
+
+		mmc-pwrseq = <&brcm_wifi_pwrseq>;
+		vmmc-supply = <&vdd_3v3_sys>;
+		vqmmc-supply = <&vdd_3v3_sys>;
+
+		/* Azurewave AW-NH615 BCM4329B1 */
+		wifi@1 {
+			compatible = "brcm,bcm4329-fmac";
+			reg = <1>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(S, 0) IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "host-wake";
+		};
+	};
+
+	sdmmc3: mmc@c8000400 {
+		status = "okay";
+		bus-width = <4>;
+		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
+		wp-gpios = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
+		power-gpios = <&gpio TEGRA_GPIO(I, 6) GPIO_ACTIVE_HIGH>;
+		vmmc-supply = <&vdd_3v3_sys>;
+		vqmmc-supply = <&vdd_3v3_sys>;
+	};
+
+	sdmmc4: mmc@c8000600 {
+		status = "okay";
+		bus-width = <8>;
+		vmmc-supply = <&vcore_emmc>;
+		vqmmc-supply = <&vdd_3v3_sys>;
+		non-removable;
+	};
+
+	mains: ac-adapter-detect {
+		compatible = "gpio-charger";
+		charger-type = "mains";
+		gpios = <&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_LOW>;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+
+		enable-gpios = <&gpio TEGRA_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
+		power-supply = <&vdd_3v3_sys>;
+		pwms = <&pwm 2 4000000>;
+
+		brightness-levels = <7 255>;
+		num-interpolated-steps = <248>;
+		default-brightness-level = <20>;
+	};
+
+	/* PMIC has a built-in 32KHz oscillator which is used by PMC */
+	clk32k_in: clock-32k-in {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
+	};
+
+	cpus {
+		cpu0: cpu@0 {
+			cpu-supply = <&vdd_cpu>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
+		};
+
+		cpu1: cpu@1 {
+			cpu-supply = <&vdd_cpu>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		dock-hall-sensor {
+			label = "Lid";
+			gpios = <&gpio TEGRA_GPIO(S, 4) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			debounce-interval = <500>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		power {
+			label = "Power";
+			gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		volume-up {
+			label = "Volume Up";
+			gpios = <&gpio TEGRA_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		volume-down {
+			label = "Volume Down";
+			gpios = <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+	};
+
+	lvds-encoder {
+		compatible = "ti,sn75lvds83", "lvds-encoder";
+
+		powerdown-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_LOW>;
+		power-supply = <&vdd_3v3_sys>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lvds_encoder_input: endpoint {
+					remote-endpoint = <&lcd_output>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lvds_encoder_output: endpoint {
+					remote-endpoint = <&panel_input>;
+				};
+			};
+		};
+	};
+
+	display-panel {
+		compatible = "panel-lvds";
+
+		/* AUO B101EW05 using custom timings */
+
+		backlight = <&backlight>;
+		ddc-i2c-bus = <&lvds_ddc>;
+		power-supply = <&vdd_pnl_reg>;
+
+		width-mm = <218>;
+		height-mm = <135>;
+
+		data-mapping = "jeida-18";
+
+		panel-timing {
+			clock-frequency = <71200000>;
+			hactive = <1280>;
+			vactive = <800>;
+			hfront-porch = <8>;
+			hback-porch = <18>;
+			hsync-len = <184>;
+			vsync-len = <3>;
+			vfront-porch = <4>;
+			vback-porch = <8>;
+		};
+
+		port {
+			panel_input: endpoint {
+				remote-endpoint = <&lvds_encoder_output>;
+			};
+		};
+	};
+
+	vdd_5v0_sys: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	vdd_3v3_sys: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3_vs";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	regulator-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "pcie_vdd";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+	};
+
+	vdd_pnl_reg: regulator-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_pnl";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vdd_1v8_sys: regulator-4 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_vs";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	vdd_hdmi_en: regulator-5 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0_hdmi_en";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&vdd_5v0_sys>;
+		gpio = <&gpio TEGRA_GPIO(V, 5) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	sound {
+		compatible = "asus,tegra-audio-wm8903-tf101",
+			     "nvidia,tegra-audio-wm8903";
+		nvidia,model = "Asus EeePad Transformer WM8903";
+
+		nvidia,audio-routing =
+			"Headphone Jack", "HPOUTR",
+			"Headphone Jack", "HPOUTL",
+			"Int Spk", "ROP",
+			"Int Spk", "RON",
+			"Int Spk", "LOP",
+			"Int Spk", "LON",
+			"Mic Jack", "MICBIAS",
+			"IN1L", "Mic Jack";
+
+		nvidia,i2s-controller = <&tegra_i2s1>;
+		nvidia,audio-codec = <&wm8903>;
+
+		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
+		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
+		nvidia,headset;
+
+		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA20_CLK_CDEV1>;
+		clock-names = "pll_a", "pll_a_out0", "mclk";
+	};
+
+	thermal-zones {
+		skin-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <0>; /* milliseconds */
+
+			thermal-sensors = <&nct1008 0>;
+		};
+
+		cpu-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&nct1008 1>;
+
+			trips {
+				trip0: cpu-alert0 {
+					/* start throttling at 50C */
+					temperature = <50000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+
+				trip1: cpu-crit {
+					/* shut down at 60C */
+					temperature = <60000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&trip0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
+	memory-controller@7000f400 {
+		nvidia,use-ram-code;
+
+		emc-tables@3 {
+			reg = <0x3>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			lpddr2 {
+				compatible = "elpida,B8132B2PB-6D-F", "jedec,lpddr2-s4";
+				revision-id1 = <1>;
+				density = <2048>;
+				io-width = <16>;
+			};
+
+			emc-table@25000 {
+				reg = <25000>;
+				compatible = "nvidia,tegra20-emc-table";
+				clock-frequency = <25000>;
+				nvidia,emc-registers = <0x00000002 0x00000006
+					0x00000003 0x00000003 0x00000006 0x00000004
+					0x00000002 0x00000009 0x00000003 0x00000003
+					0x00000002 0x00000002 0x00000002 0x00000004
+					0x00000003 0x00000008 0x0000000b 0x0000004d
+					0x00000000 0x00000003 0x00000003 0x00000003
+					0x00000008 0x00000001 0x0000000a 0x00000004
+					0x00000003 0x00000008 0x00000004 0x00000006
+					0x00000002 0x00000068 0x00000000 0x00000003
+					0x00000000 0x00000000 0x00000282 0xa0ae04ae
+					0x00070000 0x00000000 0x00000000 0x00000003
+					0x00000000 0x00000000 0x00000000 0x00000000>;
+			};
+
+			emc-table@50000 {
+				reg = <50000>;
+				compatible = "nvidia,tegra20-emc-table";
+				clock-frequency = <50000>;
+				nvidia,emc-registers = <0x00000003 0x00000007
+					0x00000003 0x00000003 0x00000006 0x00000004
+					0x00000002 0x00000009 0x00000003 0x00000003
+					0x00000002 0x00000002 0x00000002 0x00000005
+					0x00000003 0x00000008 0x0000000b 0x0000009f
+					0x00000000 0x00000003 0x00000003 0x00000003
+					0x00000008 0x00000001 0x0000000a 0x00000007
+					0x00000003 0x00000008 0x00000004 0x00000006
+					0x00000002 0x000000d0 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000282 0xa0ae04ae
+					0x00070000 0x00000000 0x00000000 0x00000005
+					0x00000000 0x00000000 0x00000000 0x00000000>;
+			};
+
+			emc-table@75000 {
+				reg = <75000>;
+				compatible = "nvidia,tegra20-emc-table";
+				clock-frequency = <75000>;
+				nvidia,emc-registers = <0x00000005 0x0000000a
+					0x00000004 0x00000003 0x00000006 0x00000004
+					0x00000002 0x00000009 0x00000003 0x00000003
+					0x00000002 0x00000002 0x00000002 0x00000005
+					0x00000003 0x00000008 0x0000000b 0x000000ff
+					0x00000000 0x00000003 0x00000003 0x00000003
+					0x00000008 0x00000001 0x0000000a 0x0000000b
+					0x00000003 0x00000008 0x00000004 0x00000006
+					0x00000002 0x00000138 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000282 0xa0ae04ae
+					0x00070000 0x00000000 0x00000000 0x00000007
+					0x00000000 0x00000000 0x00000000 0x00000000>;
+			};
+
+			emc-table@150000 {
+				reg = <150000>;
+				compatible = "nvidia,tegra20-emc-table";
+				clock-frequency = <150000>;
+				nvidia,emc-registers = <0x00000009 0x00000014
+					0x00000007 0x00000003 0x00000006 0x00000004
+					0x00000002 0x00000009 0x00000003 0x00000003
+					0x00000002 0x00000002 0x00000002 0x00000005
+					0x00000003 0x00000008 0x0000000b 0x0000021f
+					0x00000000 0x00000003 0x00000003 0x00000003
+					0x00000008 0x00000001 0x0000000a 0x00000015
+					0x00000003 0x00000008 0x00000004 0x00000006
+					0x00000002 0x00000270 0x00000000 0x00000001
+					0x00000000 0x00000000 0x00000282 0xa07c04ae
+					0x007dc010 0x00000000 0x00000000 0x0000000e
+					0x00000000 0x00000000 0x00000000 0x00000000>;
+			};
+
+			emc-table@300000 {
+				reg = <300000>;
+				compatible = "nvidia,tegra20-emc-table";
+				clock-frequency = <300000>;
+				nvidia,emc-registers = <0x00000012 0x00000027
+					0x0000000d 0x00000006 0x00000007 0x00000005
+					0x00000003 0x00000009 0x00000006 0x00000006
+					0x00000003 0x00000003 0x00000002 0x00000006
+					0x00000003 0x00000009 0x0000000c 0x0000045f
+					0x00000000 0x00000004 0x00000004 0x00000006
+					0x00000008 0x00000001 0x0000000e 0x0000002a
+					0x00000003 0x0000000f 0x00000007 0x00000005
+					0x00000002 0x000004e0 0x00000005 0x00000002
+					0x00000000 0x00000000 0x00000282 0xe059048b
+					0x007e0010 0x00000000 0x00000000 0x0000001b
+					0x00000000 0x00000000 0x00000000 0x00000000>;
+			};
+		};
+	};
+};
+
+&emc_icc_dvfs_opp_table {
+	/delete-node/ opp-666000000;
+	/delete-node/ opp-760000000;
+};
-- 
2.33.1


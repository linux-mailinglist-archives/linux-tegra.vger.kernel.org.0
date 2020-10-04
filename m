Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8AF5282B08
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Oct 2020 15:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgJDNff (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Oct 2020 09:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbgJDNfe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Oct 2020 09:35:34 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27FD0C0613CE;
        Sun,  4 Oct 2020 06:35:34 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id a4so7000688qth.0;
        Sun, 04 Oct 2020 06:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4T62KxRZULgnwcA21OBiKce4+rHee4SRx29OAoZCZCs=;
        b=SdiKWMuFLxG6hqgdcFVMrlSvGb64q4B85gW62hAbABjXh9FpPL3PnwMHsPiRt5ccSb
         37eiSjSI3oKTPKA5uAP8I/rqIvIl2j7fQwg0bwRx10WkzMKACC/uk0rehOXgd/wv4nNS
         IC1OD+QOK4iqLrYMYzKuk81CiuHETZ0Oszx8aOKs80A9eL+YDCyFZ4mMQqwHXej9hF1S
         9gsI17jXo4rYspUh5jpJmvYsnbQZrTbRlkObmtZc+tAvw5QLNPkjW98eHJOAw7R+cSHK
         6WGlH//Ce4Wo6OaF6w1s1V2vf8NriV+4/iMWrLG08c2POs9yX6B1CJuvR57YCzL2OFZo
         OcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4T62KxRZULgnwcA21OBiKce4+rHee4SRx29OAoZCZCs=;
        b=OlG2aSNvklDhMJcwfV0ecZ2tRsnusD9GpfltQ4UsHUrPYYM6f6H7jcpBnPh8hAb/Rf
         DA3p1gFMhZqrqL0+ugJ+N5HlIv9/48g4CorJa5Gy770D8Kunli/+VhBCdokop6aGxLmk
         bimu4q7DWjUS8v8RZaO38jAo1/3u+CYPk2yIljZErNVByHsr0j49Yxohaf3jgkZfTIfI
         wa2zsUhvDwZQNT16Qp8xdIm+98c3UqrqlaQKIoF7SGohgiwmziYoXMVYPqoiud5nT3sm
         oxirTQ8vHDIkICVL/kItvtOF2ryRNOq3m0o/8zi5sE22XGpKxtgna9ishHhr5PLejWeV
         VOzQ==
X-Gm-Message-State: AOAM531LUV0NWM9uXkupBpnO5XbTa5sVoppv1IAf5ZdZD69Vg6n+bT/Q
        eR8QchY2RMkMtIVDB2PYL8Htyw6+jkPya+iO
X-Google-Smtp-Source: ABdhPJwr2KcNpQcG1HMFZWitf+2O9fNSOLBLM3dHu0b5lJ9hWInc7Tl8/1mOU8RJG9C9FaZ6FCZzdw==
X-Received: by 2002:ac8:39c5:: with SMTP id v63mr9918626qte.12.1601818532343;
        Sun, 04 Oct 2020 06:35:32 -0700 (PDT)
Received: from rockpro64.hsd1.md.comcast.net ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id b9sm5539369qta.39.2020.10.04.06.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 06:35:31 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH v3 1/3] ARM: tegra: Add device-tree for Ouya
Date:   Sun,  4 Oct 2020 13:31:12 +0000
Message-Id: <20201004133114.845230-2-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201004133114.845230-1-pgwipeout@gmail.com>
References: <20201004133114.845230-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Ouya was the sole device produced by Ouya Inc in 2013.
It was a game console originally running Android 5 on top of Linux 3.1.10.

This patch adds the device tree supporting the Ouya.
It has been tested on the original variant with Samsung ram.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 arch/arm/boot/dts/Makefile         |    3 +-
 arch/arm/boot/dts/tegra30-ouya.dts | 4511 ++++++++++++++++++++++++++++
 2 files changed, 4513 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/tegra30-ouya.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 4a4e92d12395..8611d6aeb1c4 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1228,7 +1228,8 @@ dtb-$(CONFIG_ARCH_TEGRA_3x_SOC) += \
 	tegra30-beaver.dtb \
 	tegra30-cardhu-a02.dtb \
 	tegra30-cardhu-a04.dtb \
-	tegra30-colibri-eval-v3.dtb
+	tegra30-colibri-eval-v3.dtb \
+	tegra30-ouya.dtb
 dtb-$(CONFIG_ARCH_TEGRA_114_SOC) += \
 	tegra114-dalmore.dtb \
 	tegra114-roth.dtb \
diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
new file mode 100644
index 000000000000..a5f16ad6c8f4
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-ouya.dts
@@ -0,0 +1,4511 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/thermal/thermal.h>
+
+#include "tegra30.dtsi"
+#include "tegra30-cpu-opp.dtsi"
+#include "tegra30-cpu-opp-microvolt.dtsi"
+
+/ {
+	model = "Ouya Game Console";
+	compatible = "ouya,ouya", "nvidia,tegra30";
+
+	aliases {
+		mmc0 = &sdmmc4; /* eMMC */
+		mmc1 = &sdmmc3; /* WiFi */
+		rtc0 = &pmic;
+		rtc1 = "/rtc@7000e000";
+		serial0 = &uartd; /* Debug Port */
+		serial1 = &uartc; /* Bluetooth */
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		reg = <0x80000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,cma@80000000 {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x80000000 0x30000000>;
+			size = <0x10000000>; /* 256MiB */
+			linux,cma-default;
+			reusable;
+		};
+
+		ramoops@bfdf0000 {
+			compatible = "ramoops";
+			reg = <0xbfdf0000 0x10000>;	/* 64kB */
+			console-size = <0x8000>;	/* 32kB */
+			record-size = <0x400>;		/*  1kB */
+			ecc-size = <16>;
+		};
+
+		trustzone@bfe00000 {
+			reg = <0xbfe00000 0x200000>;
+			no-map;
+		};
+	};
+
+	host1x@50000000 {
+		hdmi@54280000 {
+			status = "okay";
+			vdd-supply = <&vdd_vid_reg>;
+			pll-supply = <&ldo7_reg>;
+			hdmi-supply = <&sys_3v3_reg>;
+			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	gpio: gpio@6000d000 {
+		gpio-ranges = <&pinmux 0 0 248>;
+		#reset-cells = <1>;
+	};
+
+	pinmux@70000868 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&state_default>;
+		state_default: pinmux {
+			/* located at $state_default below */
+		};
+	};
+
+	uartc: serial@70006200 {
+		status = "okay";
+		compatible = "nvidia,tegra30-hsuart";
+
+		nvidia,adjust-baud-rates = <0 9600 100>,
+					   <9600 115200 200>,
+					   <1000000 4000000 136>;
+
+		/* Azurewave AW-NH660 BCM4330B1 */
+		bluetooth {
+			compatible = "brcm,bcm4330-bt";
+
+			max-speed = <4000000>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
+			clock-names = "txco";
+
+			vbat-supply  = <&sys_3v3_reg>;
+			vddio-supply = <&vdd_1v8>;
+
+			shutdown-gpios = <&gpio TEGRA_GPIO(U, 0) GPIO_ACTIVE_HIGH>;
+			device-wakeup-gpios = <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
+			host-wakeup-gpios = <&gpio TEGRA_GPIO(U, 6) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	uartd: serial@70006300 {
+		status = "okay";
+	};
+
+	hdmi_ddc: i2c@7000c700 {
+		status = "okay";
+		clock-frequency = <100000>;
+	};
+
+	i2c@7000d000 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		cpu_temp: nct1008@4c {
+			compatible = "onnn,nct1008";
+			reg = <0x4c>;
+			vcc-supply = <&sys_3v3_reg>;
+			#thermal-sensor-cells = <1>;
+/*
+ *			The interrupt is bugged, once triggered it never clears.
+ *			interrupt-parent = <&gpio>;
+ *			interrupts = <TEGRA_GPIO(CC, 2) IRQ_TYPE_LEVEL_LOW>;
+ */
+		};
+
+		pmic: pmic@2d {
+			compatible = "ti,tps65911";
+			reg = <0x2d>;
+
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+
+			ti,en-gpio-sleep = <0 1 1 1 1 1 0 0 1>;
+			ti,system-power-controller;
+			ti,sleep-keep-ck32k;
+			ti,sleep-enable;
+
+			#gpio-cells = <2>;
+			gpio-controller;
+
+			vcc1-supply = <&vdd_5v0_reg>;
+			vcc2-supply = <&vdd_5v0_reg>;
+			vcc3-supply = <&vdd_1v8>;
+			vcc4-supply = <&vdd_5v0_reg>;
+			vcc5-supply = <&vdd_5v0_reg>;
+			vcc6-supply = <&vdd2_reg>;
+			vcc7-supply = <&vdd_5v0_reg>;
+			vccio-supply = <&vdd_5v0_reg>;
+
+			regulators {
+				vdd1_reg: vdd1 {
+					regulator-name = "vddio_ddr_1v2";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+				};
+
+				vdd2_reg: vdd2 {
+					regulator-name = "vdd_1v5_gen";
+					regulator-min-microvolt = <1500000>;
+					regulator-max-microvolt = <1500000>;
+					regulator-always-on;
+				};
+
+				vdd_cpu: vddctrl {
+					regulator-name = "vdd_cpu,vdd_sys";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1270000>;
+					regulator-coupled-with = <&vdd_core>;
+					regulator-coupled-max-spread = <300000>;
+					regulator-max-step-microvolt = <100000>;
+					regulator-always-on;
+
+					nvidia,tegra-cpu-regulator;
+				};
+
+				vdd_1v8: vio {
+					regulator-name = "vdd_1v8_gen";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				ldo1_reg: ldo1 {
+					regulator-name = "vdd_pexa,vdd_pexb";
+					regulator-min-microvolt = <1050000>;
+					regulator-max-microvolt = <1050000>;
+					regulator-always-on;
+				};
+
+				ldo2_reg: ldo2 {
+					regulator-name = "vdd_sata,avdd_plle";
+					regulator-min-microvolt = <1050000>;
+					regulator-max-microvolt = <1050000>;
+					regulator-always-on;
+				};
+
+				/* LDO3 is not connected to anything */
+
+				ldo4_reg: ldo4 {
+					regulator-name = "vdd_rtc";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+				};
+
+				ldo5_reg: ldo5 {
+					regulator-name = "vddio_sdmmc,avdd_vdac";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+				};
+
+				ldo6_reg: ldo6 {
+					regulator-name = "avdd_dsi_csi,pwrdet_mipi";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+				};
+
+				ldo7_reg: ldo7 {
+					regulator-name = "vdd_pllm,x,u,a_p_c_s";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+				};
+
+				ldo8_reg: ldo8 {
+					regulator-name = "vdd_ddr_hs";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+				};
+			};
+		};
+
+		vdd_core: tps62361@60 {
+			compatible = "ti,tps62361";
+			reg = <0x60>;
+
+			regulator-name = "vdd_core";
+			regulator-min-microvolt = <950000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-coupled-with = <&vdd_cpu>;
+			regulator-coupled-max-spread = <300000>;
+			regulator-max-step-microvolt = <100000>;
+			regulator-boot-on;
+			regulator-always-on;
+			ti,vsel0-state-high;
+			ti,vsel1-state-high;
+			ti,enable-vout-discharge;
+
+			nvidia,tegra-core-regulator;
+		};
+	};
+
+	pmc@7000e400 {
+		status = "okay";
+		nvidia,invert-interrupt;
+		nvidia,suspend-mode = <1>;
+		nvidia,cpu-pwr-good-time = <2000>;
+		nvidia,cpu-pwr-off-time = <200>;
+		nvidia,core-pwr-good-time = <3845 3845>;
+		nvidia,core-pwr-off-time = <458>;
+		nvidia,core-power-req-active-high;
+		nvidia,sys-clock-req-active-high;
+	};
+
+	mc_timings: memory-controller@7000f000 {
+		/* timings located at &mc_timings below */
+	};
+
+	emc_timings: memory-controller@7000f400 {
+		/* timings located at &emc_timings below */
+	};
+
+	hda@70030000 {
+		status = "okay";
+	};
+
+	wifi_pwrseq: wifi_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+
+		clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
+		clock-names = "ext_clock";
+
+		reset-gpios = <&gpio TEGRA_GPIO(D, 3) GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <300>;
+		power-off-delay-us = <300>;
+	};
+
+	sdmmc3: mmc@78000400 {
+		status = "okay";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		assigned-clocks = <&tegra_car TEGRA30_CLK_SDMMC3>;
+		assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_C>;
+		assigned-clock-rates = <50000000>;
+
+		max-frequency = <50000000>;
+		keep-power-in-suspend;
+
+		bus-width = <4>;
+		non-removable;
+
+		mmc-pwrseq = <&wifi_pwrseq>;
+		vmmc-supply = <&sdmmc_3v3_reg>;
+		vqmmc-supply = <&vdd_1v8>;
+
+		/* Azurewave AW-NH660 BCM4330 */
+		brcmf: wifi@1 {
+			reg = <1>;
+			compatible = "brcm,bcm4329-fmac";
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(O, 4) IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "host-wake";
+		};
+	};
+
+	sdmmc4: mmc@78000600 {
+		status = "okay";
+
+		keep-power-in-suspend;
+		bus-width = <8>;
+		non-removable;
+		vmmc-supply = <&sys_3v3_reg>;
+		vqmmc-supply = <&vdd_1v8>;
+		nvidia,default-tap = <0x0F>;
+		max-frequency = <25500000>;
+	};
+
+	usb@7d000000 {
+		compatible = "nvidia,tegra30-udc";
+		status = "okay";
+	};
+
+	usb-phy@7d000000 {
+		status = "okay";
+		dr_mode = "peripheral";
+	};
+
+	usb@7d004000 {
+		status = "okay";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		smsc@2 { /* SMSC 10/100T Ethernet Controller */
+			compatible = "usb424,9e00";
+			reg = <2>;
+			local-mac-address = [00 11 22 33 44 55];
+		};
+	};
+
+	usb-phy@7d004000 {
+		vbus-supply = <&vdd_smsc>;
+		status = "okay";
+	};
+
+	usb@7d008000 {
+		status = "okay";
+	};
+
+	usb-phy@7d008000 {
+		vbus-supply = <&usb3_vbus_reg>;
+		status = "okay";
+	};
+
+	/* PMIC has a built-in 32KHz oscillator which is used by PMC */
+	clk32k_in: clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "pmic-oscillator";
+	};
+
+	cpus {
+		cpu0: cpu@0 {
+			operating-points-v2 = <&cpu0_opp_table>;
+			cpu-supply = <&vdd_cpu>;
+			#cooling-cells = <2>;
+		};
+		cpu@1 {
+			operating-points-v2 = <&cpu0_opp_table>;
+			cpu-supply = <&vdd_cpu>;
+		};
+
+		cpu@2 {
+			operating-points-v2 = <&cpu0_opp_table>;
+			cpu-supply = <&vdd_cpu>;
+		};
+
+		cpu@3 {
+			operating-points-v2 = <&cpu0_opp_table>;
+			cpu-supply = <&vdd_cpu>;
+		};
+	};
+
+	firmware {
+		trusted-foundations {
+			compatible = "tlm,trusted-foundations";
+			tlm,version-major = <0x0>;
+			tlm,version-minor = <0x0>;
+		};
+	};
+
+	fan: gpio_fan {
+		compatible = "gpio-fan";
+		gpios = <&gpio TEGRA_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
+		gpio-fan,speed-map = <0    0
+				      4500 1>;
+		#cooling-cells = <2>;
+	};
+
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay = <5000>;
+			polling-delay-passive = <5000>;
+
+			thermal-sensors = <&cpu_temp 1>;
+
+			trips {
+				cpu_alert0: cpu-alert0 {
+					temperature = <50000>;
+					hysteresis = <10000>;
+					type = "active";
+				};
+				cpu_alert1: cpu-alert1 {
+					temperature = <70000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+				cpu_crit: cpu-crit {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert0>;
+					cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+				map1 {
+					trip = <&cpu_alert1>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
+	vdd_12v_in: vdd_12v_in {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_12v_in";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+	};
+
+	sdmmc_3v3_reg: sdmmc_3v3_reg {
+		compatible = "regulator-fixed";
+		regulator-name = "sdmmc_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		regulator-always-on;
+		gpio = <&gpio TEGRA_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
+		vin-supply = <&sys_3v3_reg>;
+	};
+
+	vdd_fuse_3v3_reg: vdd_fuse_3v3_reg {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_fuse_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(L, 6) GPIO_ACTIVE_HIGH>;
+		vin-supply = <&sys_3v3_reg>;
+		regulator-always-on;
+	};
+
+	vdd_vid_reg: vdd_vid_reg {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio_vid";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(T, 0) GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vdd_5v0_reg>;
+		regulator-boot-on;
+	};
+
+	ddr_reg: ddr_reg {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_ddr";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+		enable-active-high;
+		gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		vin-supply = <&vdd_12v_in>;
+	};
+
+	sys_3v3_reg: sys_3v3_reg {
+		compatible = "regulator-fixed";
+		regulator-name = "sys_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vdd_12v_in>;
+	};
+
+	vdd_5v0_reg: vdd_5v0_reg {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vdd_12v_in>;
+	};
+
+	vdd_smsc: vdd_smsc {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_smsc";
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(DD, 5) GPIO_ACTIVE_HIGH>;
+	};
+
+	usb3_vbus_reg: usb3_vbus_reg {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(DD, 4) GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vdd_5v0_reg>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		power {
+			gpios = <&gpio TEGRA_GPIO(V, 0) GPIO_ACTIVE_LOW>;
+			debounce-interval = <10>;
+			linux,code = <KEY_POWER>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+	};
+
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-power {
+			label = "power-led";
+			gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+			linux,default-trigger = "heartbeat";
+			retain-state-suspended;
+		};
+	};
+};
+&mc_timings {
+	emc-timings-0 {
+		nvidia,ram-code = <0>; /* Samsung RAM */
+		timing-25500000 {
+			clock-frequency = <25500000>;
+			nvidia,emem-configuration = <
+				0x00030003 /* MC_EMEM_ARB_CFG */
+				0xc0000010 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+				0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+				0x00000001 /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+				0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+				0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+				0x75830303 /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+		timing-51000000 {
+			clock-frequency = <51000000>;
+			nvidia,emem-configuration = <
+				0x00010003 /* MC_EMEM_ARB_CFG */
+				0xc0000010 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+				0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+				0x00000001 /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+				0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+				0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+				0x74630303 /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+		timing-102000000 {
+			clock-frequency = <102000000>;
+			nvidia,emem-configuration = <
+				0x00000003 /* MC_EMEM_ARB_CFG */
+				0xc0000018 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RC */
+				0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+				0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+				0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+				0x000a0503 /* MC_EMEM_ARB_DA_COVERS */
+				0x73c30504 /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+		timing-204000000 {
+			clock-frequency = <204000000>;
+			nvidia,emem-configuration = <
+				0x00000006 /* MC_EMEM_ARB_CFG */
+				0xc0000025 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000005 /* MC_EMEM_ARB_TIMING_RC */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RAS */
+				0x00000004 /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+				0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+				0x000a0505 /* MC_EMEM_ARB_DA_COVERS */
+				0x73840a06 /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+		timing-400000000 {
+			clock-frequency = <400000000>;
+			nvidia,emem-configuration = <
+				0x0000000c /* MC_EMEM_ARB_CFG */
+				0xc0000048 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000009 /* MC_EMEM_ARB_TIMING_RC */
+				0x00000005 /* MC_EMEM_ARB_TIMING_RAS */
+				0x00000007 /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+				0x06030202 /* MC_EMEM_ARB_DA_TURNS */
+				0x000d0709 /* MC_EMEM_ARB_DA_COVERS */
+				0x7086120a /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+		timing-800000000 {
+			clock-frequency = <800000000>;
+			nvidia,emem-configuration = <
+				0x00000018 /* MC_EMEM_ARB_CFG */
+				0xc0000090 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000004 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000005 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000013 /* MC_EMEM_ARB_TIMING_RC */
+				0x0000000c /* MC_EMEM_ARB_TIMING_RAS */
+				0x0000000f /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x0000000c /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000008 /* MC_EMEM_ARB_TIMING_W2R */
+				0x08040202 /* MC_EMEM_ARB_DA_TURNS */
+				0x00160d13 /* MC_EMEM_ARB_DA_COVERS */
+				0x712c2414 /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+	};
+	emc-timings-1 {
+		nvidia,ram-code = <1>; /* Hynix M RAM */
+		timing-25500000 {
+			clock-frequency = <25500000>;
+			nvidia,emem-configuration = <
+				0x00030003 /* MC_EMEM_ARB_CFG */
+				0xc0000010 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+				0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+				0x00000001 /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+				0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+				0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+				0x75830303 /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+		timing-51000000 {
+			clock-frequency = <51000000>;
+			nvidia,emem-configuration = <
+				0x00010003 /* MC_EMEM_ARB_CFG */
+				0xc0000010 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+				0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+				0x00000001 /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+				0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+				0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+				0x74630303 /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+		timing-102000000 {
+			clock-frequency = <102000000>;
+			nvidia,emem-configuration = <
+				0x00000003 /* MC_EMEM_ARB_CFG */
+				0xc0000018 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RC */
+				0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+				0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+				0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+				0x000a0503 /* MC_EMEM_ARB_DA_COVERS */
+				0x73c30504 /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+		timing-204000000 {
+			clock-frequency = <204000000>;
+			nvidia,emem-configuration = <
+				0x00000006 /* MC_EMEM_ARB_CFG */
+				0xc0000025 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000005 /* MC_EMEM_ARB_TIMING_RC */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RAS */
+				0x00000004 /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+				0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+				0x000a0505 /* MC_EMEM_ARB_DA_COVERS */
+				0x73840a06 /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+		timing-400000000 {
+			clock-frequency = <400000000>;
+			nvidia,emem-configuration = <
+				0x0000000c /* MC_EMEM_ARB_CFG */
+				0xc0000048 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000009 /* MC_EMEM_ARB_TIMING_RC */
+				0x00000005 /* MC_EMEM_ARB_TIMING_RAS */
+				0x00000007 /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+				0x06030202 /* MC_EMEM_ARB_DA_TURNS */
+				0x000d0709 /* MC_EMEM_ARB_DA_COVERS */
+				0x7086120a /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+		timing-800000000 {
+			clock-frequency = <800000000>;
+			nvidia,emem-configuration = <
+				0x00000018 /* MC_EMEM_ARB_CFG */
+				0xc0000090 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000004 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000005 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000013 /* MC_EMEM_ARB_TIMING_RC */
+				0x0000000c /* MC_EMEM_ARB_TIMING_RAS */
+				0x0000000f /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x0000000c /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000008 /* MC_EMEM_ARB_TIMING_W2R */
+				0x08040202 /* MC_EMEM_ARB_DA_TURNS */
+				0x00160d13 /* MC_EMEM_ARB_DA_COVERS */
+				0x712c2414 /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+	};
+	emc-timings-2 {
+		nvidia,ram-code = <2>; /* Hynix A RAM */
+		timing-25500000 {
+			clock-frequency = <25500000>;
+			nvidia,emem-configuration = <
+				0x00030003 /* MC_EMEM_ARB_CFG */
+				0xc0000010 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+				0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+				0x00000001 /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+				0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+				0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+				0x75e30303 /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+		timing-51000000 {
+			clock-frequency = <51000000>;
+			nvidia,emem-configuration = <
+				0x00010003 /* MC_EMEM_ARB_CFG */
+				0xc0000010 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+				0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+				0x00000001 /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+				0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+				0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+				0x74e30303 /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+		timing-102000000 {
+			clock-frequency = <102000000>;
+			nvidia,emem-configuration = <
+				0x00000003 /* MC_EMEM_ARB_CFG */
+				0xc0000018 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RC */
+				0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+				0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+				0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+				0x000a0503 /* MC_EMEM_ARB_DA_COVERS */
+				0x74430504 /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+		timing-204000000 {
+			clock-frequency = <204000000>;
+			nvidia,emem-configuration = <
+				0x00000006 /* MC_EMEM_ARB_CFG */
+				0xc0000025 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000005 /* MC_EMEM_ARB_TIMING_RC */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RAS */
+				0x00000004 /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+				0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+				0x000a0505 /* MC_EMEM_ARB_DA_COVERS */
+				0x74040a06 /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+		timing-400000000 {
+			clock-frequency = <400000000>;
+			nvidia,emem-configuration = <
+				0x0000000c /* MC_EMEM_ARB_CFG */
+				0xc0000048 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000009 /* MC_EMEM_ARB_TIMING_RC */
+				0x00000005 /* MC_EMEM_ARB_TIMING_RAS */
+				0x00000007 /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+				0x06030202 /* MC_EMEM_ARB_DA_TURNS */
+				0x000d0709 /* MC_EMEM_ARB_DA_COVERS */
+				0x7086120a /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+		timing-800000000 {
+			clock-frequency = <800000000>;
+			nvidia,emem-configuration = <
+				0x00000018 /* MC_EMEM_ARB_CFG */
+				0xc0000090 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+				0x00000004 /* MC_EMEM_ARB_TIMING_RCD */
+				0x00000005 /* MC_EMEM_ARB_TIMING_RP */
+				0x00000013 /* MC_EMEM_ARB_TIMING_RC */
+				0x0000000c /* MC_EMEM_ARB_TIMING_RAS */
+				0x0000000f /* MC_EMEM_ARB_TIMING_FAW */
+				0x00000002 /* MC_EMEM_ARB_TIMING_RRD */
+				0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+				0x0000000c /* MC_EMEM_ARB_TIMING_WAP2PRE */
+				0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+				0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+				0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+				0x00000008 /* MC_EMEM_ARB_TIMING_W2R */
+				0x08040202 /* MC_EMEM_ARB_DA_TURNS */
+				0x00160d13 /* MC_EMEM_ARB_DA_COVERS */
+				0x712c2414 /* MC_EMEM_ARB_MISC0 */
+				0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+			>;
+		};
+	};
+};
+&emc_timings {
+	emc-timings-0 {
+		nvidia,ram-code = <0>;  /* Samsung RAM */
+		timing-25500000 {
+			clock-frequency = <25500000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100003>;
+			nvidia,emc-mode-2 = <0x80200008>;
+			nvidia,emc-mode-reset = <0x80001221>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-cfg-periodic-qrst;
+			nvidia,emc-cfg-dyn-self-ref;
+			nvidia,emc-configuration = <
+				0x00000001 /* EMC_RC */
+				0x00000006 /* EMC_RFC */
+				0x00000000 /* EMC_RAS */
+				0x00000000 /* EMC_RP */
+				0x00000002 /* EMC_R2W */
+				0x0000000a /* EMC_W2R */
+				0x00000005 /* EMC_R2P */
+				0x0000000b /* EMC_W2P */
+				0x00000000 /* EMC_RD_RCD */
+				0x00000000 /* EMC_WR_RCD */
+				0x00000003 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000005 /* EMC_WDV */
+				0x00000005 /* EMC_QUSE */
+				0x00000004 /* EMC_QRST */
+				0x0000000a /* EMC_QSAFE */
+				0x0000000b /* EMC_RDV */
+				0x000000c0 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x00000030 /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000002 /* EMC_PDEX2WR */
+				0x00000002 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x00000007 /* EMC_AR2PDEN */
+				0x0000000f /* EMC_RW2PDEN */
+				0x00000007 /* EMC_TXSR */
+				0x00000007 /* EMC_TXSRDLL */
+				0x00000004 /* EMC_TCKE */
+				0x00000002 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000004 /* EMC_TCLKSTABLE */
+				0x00000005 /* EMC_TCLKSTOP */
+				0x000000c7 /* EMC_TREFBW */
+				0x00000006 /* EMC_QUSE_EXTRA */
+				0x00000004 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00004288 /* EMC_FBIO_CFG5 */
+				0x007800a4 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x000fc000 /* EMC_DLL_XFORM_DQS0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS3 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS4 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS5 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS6 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS7 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0800211c /* EMC_XM2DQSPADCTRL2 */
+				0x00000000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f108 /* EMC_XM2COMPPADCTRL */
+				0x05057404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+				0x08000168 /* EMC_XM2QUSEPADCTRL */
+				0x08000000 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00000000 /* EMC_ZCAL_INTERVAL */
+				0x00000040 /* EMC_ZCAL_WAIT_CNT */
+				0x000c000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x80000287 /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff00 /* EMC_CFG_RSV */
+			>;
+		};
+		timing-51000000 {
+			clock-frequency = <51000000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100003>;
+			nvidia,emc-mode-2 = <0x80200008>;
+			nvidia,emc-mode-reset = <0x80001221>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-cfg-periodic-qrst;
+			nvidia,emc-cfg-dyn-self-ref;
+			nvidia,emc-configuration = <
+				0x00000002 /* EMC_RC */
+				0x0000000d /* EMC_RFC */
+				0x00000001 /* EMC_RAS */
+				0x00000000 /* EMC_RP */
+				0x00000002 /* EMC_R2W */
+				0x0000000a /* EMC_W2R */
+				0x00000005 /* EMC_R2P */
+				0x0000000b /* EMC_W2P */
+				0x00000000 /* EMC_RD_RCD */
+				0x00000000 /* EMC_WR_RCD */
+				0x00000003 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000005 /* EMC_WDV */
+				0x00000005 /* EMC_QUSE */
+				0x00000004 /* EMC_QRST */
+				0x0000000a /* EMC_QSAFE */
+				0x0000000b /* EMC_RDV */
+				0x00000181 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x00000060 /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000002 /* EMC_PDEX2WR */
+				0x00000002 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x00000007 /* EMC_AR2PDEN */
+				0x0000000f /* EMC_RW2PDEN */
+				0x0000000e /* EMC_TXSR */
+				0x0000000e /* EMC_TXSRDLL */
+				0x00000004 /* EMC_TCKE */
+				0x00000003 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000004 /* EMC_TCLKSTABLE */
+				0x00000005 /* EMC_TCLKSTOP */
+				0x0000018e /* EMC_TREFBW */
+				0x00000006 /* EMC_QUSE_EXTRA */
+				0x00000004 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00004288 /* EMC_FBIO_CFG5 */
+				0x007800a4 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x000fc000 /* EMC_DLL_XFORM_DQS0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS3 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS4 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS5 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS6 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS7 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0800211c /* EMC_XM2DQSPADCTRL2 */
+				0x00000000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f108 /* EMC_XM2COMPPADCTRL */
+				0x05057404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+				0x08000168 /* EMC_XM2QUSEPADCTRL */
+				0x08000000 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00000000 /* EMC_ZCAL_INTERVAL */
+				0x00000040 /* EMC_ZCAL_WAIT_CNT */
+				0x000c000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x8000040b /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff00 /* EMC_CFG_RSV */
+			>;
+		};
+		timing-102000000 {
+			clock-frequency = <102000000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100003>;
+			nvidia,emc-mode-2 = <0x80200008>;
+			nvidia,emc-mode-reset = <0x80001221>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-cfg-periodic-qrst;
+			nvidia,emc-cfg-dyn-self-ref;
+			nvidia,emc-configuration = <
+				0x00000004 /* EMC_RC */
+				0x0000001a /* EMC_RFC */
+				0x00000003 /* EMC_RAS */
+				0x00000001 /* EMC_RP */
+				0x00000002 /* EMC_R2W */
+				0x0000000a /* EMC_W2R */
+				0x00000005 /* EMC_R2P */
+				0x0000000b /* EMC_W2P */
+				0x00000001 /* EMC_RD_RCD */
+				0x00000001 /* EMC_WR_RCD */
+				0x00000003 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000005 /* EMC_WDV */
+				0x00000005 /* EMC_QUSE */
+				0x00000004 /* EMC_QRST */
+				0x0000000a /* EMC_QSAFE */
+				0x0000000b /* EMC_RDV */
+				0x00000303 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x000000c0 /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000002 /* EMC_PDEX2WR */
+				0x00000002 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x00000007 /* EMC_AR2PDEN */
+				0x0000000f /* EMC_RW2PDEN */
+				0x0000001c /* EMC_TXSR */
+				0x0000001c /* EMC_TXSRDLL */
+				0x00000004 /* EMC_TCKE */
+				0x00000005 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000004 /* EMC_TCLKSTABLE */
+				0x00000005 /* EMC_TCLKSTOP */
+				0x0000031c /* EMC_TREFBW */
+				0x00000006 /* EMC_QUSE_EXTRA */
+				0x00000004 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00004288 /* EMC_FBIO_CFG5 */
+				0x007800a4 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x000fc000 /* EMC_DLL_XFORM_DQS0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS3 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS4 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS5 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS6 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS7 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0800211c /* EMC_XM2DQSPADCTRL2 */
+				0x00000000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f108 /* EMC_XM2COMPPADCTRL */
+				0x05057404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+				0x08000168 /* EMC_XM2QUSEPADCTRL */
+				0x08000000 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00000000 /* EMC_ZCAL_INTERVAL */
+				0x00000040 /* EMC_ZCAL_WAIT_CNT */
+				0x000c000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x80000713 /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff00 /* EMC_CFG_RSV */
+			>;
+		};
+		timing-204000000 {
+			clock-frequency = <204000000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100003>;
+			nvidia,emc-mode-2 = <0x80200008>;
+			nvidia,emc-mode-reset = <0x80001221>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-cfg-periodic-qrst;
+			nvidia,emc-cfg-dyn-self-ref;
+			nvidia,emc-configuration = <
+				0x00000009 /* EMC_RC */
+				0x00000035 /* EMC_RFC */
+				0x00000007 /* EMC_RAS */
+				0x00000002 /* EMC_RP */
+				0x00000002 /* EMC_R2W */
+				0x0000000a /* EMC_W2R */
+				0x00000005 /* EMC_R2P */
+				0x0000000b /* EMC_W2P */
+				0x00000002 /* EMC_RD_RCD */
+				0x00000002 /* EMC_WR_RCD */
+				0x00000003 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000005 /* EMC_WDV */
+				0x00000005 /* EMC_QUSE */
+				0x00000004 /* EMC_QRST */
+				0x0000000a /* EMC_QSAFE */
+				0x0000000b /* EMC_RDV */
+				0x00000607 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x00000181 /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000002 /* EMC_PDEX2WR */
+				0x00000002 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x00000007 /* EMC_AR2PDEN */
+				0x0000000f /* EMC_RW2PDEN */
+				0x00000038 /* EMC_TXSR */
+				0x00000038 /* EMC_TXSRDLL */
+				0x00000004 /* EMC_TCKE */
+				0x00000009 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000004 /* EMC_TCLKSTABLE */
+				0x00000005 /* EMC_TCLKSTOP */
+				0x00000638 /* EMC_TREFBW */
+				0x00000006 /* EMC_QUSE_EXTRA */
+				0x00000006 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00004288 /* EMC_FBIO_CFG5 */
+				0x004400a4 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x00080000 /* EMC_DLL_XFORM_DQS0 */
+				0x00080000 /* EMC_DLL_XFORM_DQS1 */
+				0x00080000 /* EMC_DLL_XFORM_DQS2 */
+				0x00080000 /* EMC_DLL_XFORM_DQS3 */
+				0x00080000 /* EMC_DLL_XFORM_DQS4 */
+				0x00080000 /* EMC_DLL_XFORM_DQS5 */
+				0x00080000 /* EMC_DLL_XFORM_DQS6 */
+				0x00080000 /* EMC_DLL_XFORM_DQS7 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x00080000 /* EMC_DLL_XFORM_DQ0 */
+				0x00080000 /* EMC_DLL_XFORM_DQ1 */
+				0x00080000 /* EMC_DLL_XFORM_DQ2 */
+				0x00080000 /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0800211c /* EMC_XM2DQSPADCTRL2 */
+				0x00000000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f108 /* EMC_XM2COMPPADCTRL */
+				0x05057404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+				0x08000168 /* EMC_XM2QUSEPADCTRL */
+				0x08000000 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00020000 /* EMC_ZCAL_INTERVAL */
+				0x00000100 /* EMC_ZCAL_WAIT_CNT */
+				0x000c000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x80000d22 /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff00 /* EMC_CFG_RSV */
+			>;
+		};
+		timing-400000000 {
+			clock-frequency = <400000000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100002>;
+			nvidia,emc-mode-2 = <0x80200000>;
+			nvidia,emc-mode-reset = <0x80000521>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-configuration = <
+				0x00000012 /* EMC_RC */
+				0x00000066 /* EMC_RFC */
+				0x0000000c /* EMC_RAS */
+				0x00000004 /* EMC_RP */
+				0x00000003 /* EMC_R2W */
+				0x00000008 /* EMC_W2R */
+				0x00000002 /* EMC_R2P */
+				0x0000000a /* EMC_W2P */
+				0x00000004 /* EMC_RD_RCD */
+				0x00000004 /* EMC_WR_RCD */
+				0x00000002 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000004 /* EMC_WDV */
+				0x00000006 /* EMC_QUSE */
+				0x00000004 /* EMC_QRST */
+				0x0000000a /* EMC_QSAFE */
+				0x0000000c /* EMC_RDV */
+				0x00000bf0 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x000002fc /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000001 /* EMC_PDEX2WR */
+				0x00000008 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x00000008 /* EMC_AR2PDEN */
+				0x0000000f /* EMC_RW2PDEN */
+				0x0000006c /* EMC_TXSR */
+				0x00000200 /* EMC_TXSRDLL */
+				0x00000004 /* EMC_TCKE */
+				0x00000010 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000004 /* EMC_TCLKSTABLE */
+				0x00000005 /* EMC_TCLKSTOP */
+				0x00000c30 /* EMC_TREFBW */
+				0x00000000 /* EMC_QUSE_EXTRA */
+				0x00000004 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00007088 /* EMC_FBIO_CFG5 */
+				0x001d0084 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x0003c000 /* EMC_DLL_XFORM_DQS0 */
+				0x0003c000 /* EMC_DLL_XFORM_DQS1 */
+				0x0003c000 /* EMC_DLL_XFORM_DQS2 */
+				0x0003c000 /* EMC_DLL_XFORM_DQS3 */
+				0x0003c000 /* EMC_DLL_XFORM_DQS4 */
+				0x0003c000 /* EMC_DLL_XFORM_DQS5 */
+				0x0003c000 /* EMC_DLL_XFORM_DQS6 */
+				0x0003c000 /* EMC_DLL_XFORM_DQS7 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x00048000 /* EMC_DLL_XFORM_DQ0 */
+				0x00048000 /* EMC_DLL_XFORM_DQ1 */
+				0x00048000 /* EMC_DLL_XFORM_DQ2 */
+				0x00048000 /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0800013d /* EMC_XM2DQSPADCTRL2 */
+				0x00000000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f508 /* EMC_XM2COMPPADCTRL */
+				0x05057404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+				0x080001e8 /* EMC_XM2QUSEPADCTRL */
+				0x08000021 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00020000 /* EMC_ZCAL_INTERVAL */
+				0x00000100 /* EMC_ZCAL_WAIT_CNT */
+				0x0158000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x800018c8 /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff89 /* EMC_CFG_RSV */
+			>;
+		};
+		timing-800000000 {
+			clock-frequency = <800000000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100002>;
+			nvidia,emc-mode-2 = <0x80200018>;
+			nvidia,emc-mode-reset = <0x80000d71>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-cfg-periodic-qrst;
+			nvidia,emc-configuration = <
+				0x00000025 /* EMC_RC */
+				0x000000ce /* EMC_RFC */
+				0x0000001a /* EMC_RAS */
+				0x00000009 /* EMC_RP */
+				0x00000005 /* EMC_R2W */
+				0x0000000d /* EMC_W2R */
+				0x00000004 /* EMC_R2P */
+				0x00000013 /* EMC_W2P */
+				0x00000009 /* EMC_RD_RCD */
+				0x00000009 /* EMC_WR_RCD */
+				0x00000004 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000007 /* EMC_WDV */
+				0x0000000a /* EMC_QUSE */
+				0x00000009 /* EMC_QRST */
+				0x0000000b /* EMC_QSAFE */
+				0x00000011 /* EMC_RDV */
+				0x00001820 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x00000608 /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000003 /* EMC_PDEX2WR */
+				0x00000012 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x0000000f /* EMC_AR2PDEN */
+				0x00000018 /* EMC_RW2PDEN */
+				0x000000d8 /* EMC_TXSR */
+				0x00000200 /* EMC_TXSRDLL */
+				0x00000005 /* EMC_TCKE */
+				0x00000020 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000007 /* EMC_TCLKSTABLE */
+				0x00000008 /* EMC_TCLKSTOP */
+				0x00001860 /* EMC_TREFBW */
+				0x0000000b /* EMC_QUSE_EXTRA */
+				0x00000006 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00005088 /* EMC_FBIO_CFG5 */
+				0xf0070191 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x0000800a /* EMC_DLL_XFORM_DQS0 */
+				0x0000000a /* EMC_DLL_XFORM_DQS1 */
+				0x0000000a /* EMC_DLL_XFORM_DQS2 */
+				0x0000000a /* EMC_DLL_XFORM_DQS3 */
+				0x0000000a /* EMC_DLL_XFORM_DQS4 */
+				0x0000000a /* EMC_DLL_XFORM_DQS5 */
+				0x0000000a /* EMC_DLL_XFORM_DQS6 */
+				0x0000000a /* EMC_DLL_XFORM_DQS7 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x0000000a /* EMC_DLL_XFORM_DQ0 */
+				0x0000000a /* EMC_DLL_XFORM_DQ1 */
+				0x0000000a /* EMC_DLL_XFORM_DQ2 */
+				0x0000000a /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0600013d /* EMC_XM2DQSPADCTRL2 */
+				0x22220000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f501 /* EMC_XM2COMPPADCTRL */
+				0x07077404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000000 /* EMC_XM2VTTGENPADCTRL2 */
+				0x080001e8 /* EMC_XM2QUSEPADCTRL */
+				0x08000021 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00020000 /* EMC_ZCAL_INTERVAL */
+				0x00000100 /* EMC_ZCAL_WAIT_CNT */
+				0x00f0000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x8000308c /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff49 /* EMC_CFG_RSV */
+			>;
+		};
+	};
+	emc-timings-1 {
+		nvidia,ram-code = <1>;  /* Hynix M RAM */
+		timing-25500000 {
+			clock-frequency = <25500000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100003>;
+			nvidia,emc-mode-2 = <0x80200008>;
+			nvidia,emc-mode-reset = <0x80001221>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-cfg-periodic-qrst;
+			nvidia,emc-cfg-dyn-self-ref;
+			nvidia,emc-configuration = <
+				0x00000001 /* EMC_RC */
+				0x00000006 /* EMC_RFC */
+				0x00000000 /* EMC_RAS */
+				0x00000000 /* EMC_RP */
+				0x00000002 /* EMC_R2W */
+				0x0000000a /* EMC_W2R */
+				0x00000005 /* EMC_R2P */
+				0x0000000b /* EMC_W2P */
+				0x00000000 /* EMC_RD_RCD */
+				0x00000000 /* EMC_WR_RCD */
+				0x00000003 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000005 /* EMC_WDV */
+				0x00000005 /* EMC_QUSE */
+				0x00000004 /* EMC_QRST */
+				0x0000000a /* EMC_QSAFE */
+				0x0000000b /* EMC_RDV */
+				0x000000c0 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x00000030 /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000002 /* EMC_PDEX2WR */
+				0x00000002 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x00000007 /* EMC_AR2PDEN */
+				0x0000000f /* EMC_RW2PDEN */
+				0x00000007 /* EMC_TXSR */
+				0x00000007 /* EMC_TXSRDLL */
+				0x00000004 /* EMC_TCKE */
+				0x00000002 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000004 /* EMC_TCLKSTABLE */
+				0x00000005 /* EMC_TCLKSTOP */
+				0x000000c7 /* EMC_TREFBW */
+				0x00000006 /* EMC_QUSE_EXTRA */
+				0x00000004 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00004288 /* EMC_FBIO_CFG5 */
+				0x007800a4 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x000fc000 /* EMC_DLL_XFORM_DQS0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS3 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS4 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS5 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS6 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS7 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0800211c /* EMC_XM2DQSPADCTRL2 */
+				0x00000000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f108 /* EMC_XM2COMPPADCTRL */
+				0x05057404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+				0x08000168 /* EMC_XM2QUSEPADCTRL */
+				0x08000000 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00000000 /* EMC_ZCAL_INTERVAL */
+				0x00000040 /* EMC_ZCAL_WAIT_CNT */
+				0x000c000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x80000287 /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff00 /* EMC_CFG_RSV */
+			>;
+		};
+		timing-51000000 {
+			clock-frequency = <51000000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100003>;
+			nvidia,emc-mode-2 = <0x80200008>;
+			nvidia,emc-mode-reset = <0x80001221>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-cfg-periodic-qrst;
+			nvidia,emc-cfg-dyn-self-ref;
+			nvidia,emc-configuration = <
+				0x00000002 /* EMC_RC */
+				0x0000000d /* EMC_RFC */
+				0x00000001 /* EMC_RAS */
+				0x00000000 /* EMC_RP */
+				0x00000002 /* EMC_R2W */
+				0x0000000a /* EMC_W2R */
+				0x00000005 /* EMC_R2P */
+				0x0000000b /* EMC_W2P */
+				0x00000000 /* EMC_RD_RCD */
+				0x00000000 /* EMC_WR_RCD */
+				0x00000003 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000005 /* EMC_WDV */
+				0x00000005 /* EMC_QUSE */
+				0x00000004 /* EMC_QRST */
+				0x0000000a /* EMC_QSAFE */
+				0x0000000b /* EMC_RDV */
+				0x00000181 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x00000060 /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000002 /* EMC_PDEX2WR */
+				0x00000002 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x00000007 /* EMC_AR2PDEN */
+				0x0000000f /* EMC_RW2PDEN */
+				0x0000000e /* EMC_TXSR */
+				0x0000000e /* EMC_TXSRDLL */
+				0x00000004 /* EMC_TCKE */
+				0x00000003 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000004 /* EMC_TCLKSTABLE */
+				0x00000005 /* EMC_TCLKSTOP */
+				0x0000018e /* EMC_TREFBW */
+				0x00000006 /* EMC_QUSE_EXTRA */
+				0x00000004 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00004288 /* EMC_FBIO_CFG5 */
+				0x007800a4 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x000fc000 /* EMC_DLL_XFORM_DQS0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS3 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS4 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS5 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS6 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS7 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0800211c /* EMC_XM2DQSPADCTRL2 */
+				0x00000000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f108 /* EMC_XM2COMPPADCTRL */
+				0x05057404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+				0x08000168 /* EMC_XM2QUSEPADCTRL */
+				0x08000000 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00000000 /* EMC_ZCAL_INTERVAL */
+				0x00000040 /* EMC_ZCAL_WAIT_CNT */
+				0x000c000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x8000040b /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff00 /* EMC_CFG_RSV */
+			>;
+		};
+		timing-102000000 {
+			clock-frequency = <102000000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100003>;
+			nvidia,emc-mode-2 = <0x80200008>;
+			nvidia,emc-mode-reset = <0x80001221>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-cfg-periodic-qrst;
+			nvidia,emc-cfg-dyn-self-ref;
+			nvidia,emc-configuration = <
+				0x00000004 /* EMC_RC */
+				0x0000001a /* EMC_RFC */
+				0x00000003 /* EMC_RAS */
+				0x00000001 /* EMC_RP */
+				0x00000002 /* EMC_R2W */
+				0x0000000a /* EMC_W2R */
+				0x00000005 /* EMC_R2P */
+				0x0000000b /* EMC_W2P */
+				0x00000001 /* EMC_RD_RCD */
+				0x00000001 /* EMC_WR_RCD */
+				0x00000003 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000005 /* EMC_WDV */
+				0x00000005 /* EMC_QUSE */
+				0x00000004 /* EMC_QRST */
+				0x0000000a /* EMC_QSAFE */
+				0x0000000b /* EMC_RDV */
+				0x00000303 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x000000c0 /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000002 /* EMC_PDEX2WR */
+				0x00000002 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x00000007 /* EMC_AR2PDEN */
+				0x0000000f /* EMC_RW2PDEN */
+				0x0000001c /* EMC_TXSR */
+				0x0000001c /* EMC_TXSRDLL */
+				0x00000004 /* EMC_TCKE */
+				0x00000005 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000004 /* EMC_TCLKSTABLE */
+				0x00000005 /* EMC_TCLKSTOP */
+				0x0000031c /* EMC_TREFBW */
+				0x00000006 /* EMC_QUSE_EXTRA */
+				0x00000004 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00004288 /* EMC_FBIO_CFG5 */
+				0x007800a4 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x000fc000 /* EMC_DLL_XFORM_DQS0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS3 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS4 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS5 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS6 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS7 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0800211c /* EMC_XM2DQSPADCTRL2 */
+				0x00000000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f108 /* EMC_XM2COMPPADCTRL */
+				0x05057404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+				0x08000168 /* EMC_XM2QUSEPADCTRL */
+				0x08000000 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00000000 /* EMC_ZCAL_INTERVAL */
+				0x00000040 /* EMC_ZCAL_WAIT_CNT */
+				0x000c000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x80000713 /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff00 /* EMC_CFG_RSV */
+			>;
+		};
+		timing-204000000 {
+			clock-frequency = <204000000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100003>;
+			nvidia,emc-mode-2 = <0x80200008>;
+			nvidia,emc-mode-reset = <0x80001221>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-cfg-periodic-qrst;
+			nvidia,emc-cfg-dyn-self-ref;
+			nvidia,emc-configuration = <
+				0x00000009 /* EMC_RC */
+				0x00000035 /* EMC_RFC */
+				0x00000007 /* EMC_RAS */
+				0x00000002 /* EMC_RP */
+				0x00000002 /* EMC_R2W */
+				0x0000000a /* EMC_W2R */
+				0x00000005 /* EMC_R2P */
+				0x0000000b /* EMC_W2P */
+				0x00000002 /* EMC_RD_RCD */
+				0x00000002 /* EMC_WR_RCD */
+				0x00000003 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000005 /* EMC_WDV */
+				0x00000005 /* EMC_QUSE */
+				0x00000004 /* EMC_QRST */
+				0x0000000a /* EMC_QSAFE */
+				0x0000000b /* EMC_RDV */
+				0x00000607 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x00000181 /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000002 /* EMC_PDEX2WR */
+				0x00000002 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x00000007 /* EMC_AR2PDEN */
+				0x0000000f /* EMC_RW2PDEN */
+				0x00000038 /* EMC_TXSR */
+				0x00000038 /* EMC_TXSRDLL */
+				0x00000004 /* EMC_TCKE */
+				0x00000009 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000004 /* EMC_TCLKSTABLE */
+				0x00000005 /* EMC_TCLKSTOP */
+				0x00000638 /* EMC_TREFBW */
+				0x00000006 /* EMC_QUSE_EXTRA */
+				0x00000006 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00004288 /* EMC_FBIO_CFG5 */
+				0x004400a4 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x00080000 /* EMC_DLL_XFORM_DQS0 */
+				0x00080000 /* EMC_DLL_XFORM_DQS1 */
+				0x00080000 /* EMC_DLL_XFORM_DQS2 */
+				0x00080000 /* EMC_DLL_XFORM_DQS3 */
+				0x00080000 /* EMC_DLL_XFORM_DQS4 */
+				0x00080000 /* EMC_DLL_XFORM_DQS5 */
+				0x00080000 /* EMC_DLL_XFORM_DQS6 */
+				0x00080000 /* EMC_DLL_XFORM_DQS7 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x00080000 /* EMC_DLL_XFORM_DQ0 */
+				0x00080000 /* EMC_DLL_XFORM_DQ1 */
+				0x00080000 /* EMC_DLL_XFORM_DQ2 */
+				0x00080000 /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0800211c /* EMC_XM2DQSPADCTRL2 */
+				0x00000000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f108 /* EMC_XM2COMPPADCTRL */
+				0x05057404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+				0x08000168 /* EMC_XM2QUSEPADCTRL */
+				0x08000000 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00020000 /* EMC_ZCAL_INTERVAL */
+				0x00000100 /* EMC_ZCAL_WAIT_CNT */
+				0x000c000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x80000d22 /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff00 /* EMC_CFG_RSV */
+			>;
+		};
+		timing-400000000 {
+			clock-frequency = <400000000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100002>;
+			nvidia,emc-mode-2 = <0x80200000>;
+			nvidia,emc-mode-reset = <0x80000521>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-configuration = <
+				0x00000012 /* EMC_RC */
+				0x00000066 /* EMC_RFC */
+				0x0000000c /* EMC_RAS */
+				0x00000004 /* EMC_RP */
+				0x00000003 /* EMC_R2W */
+				0x00000008 /* EMC_W2R */
+				0x00000002 /* EMC_R2P */
+				0x0000000a /* EMC_W2P */
+				0x00000004 /* EMC_RD_RCD */
+				0x00000004 /* EMC_WR_RCD */
+				0x00000002 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000004 /* EMC_WDV */
+				0x00000006 /* EMC_QUSE */
+				0x00000004 /* EMC_QRST */
+				0x0000000a /* EMC_QSAFE */
+				0x0000000c /* EMC_RDV */
+				0x00000bf0 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x000002fc /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000001 /* EMC_PDEX2WR */
+				0x00000008 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x00000008 /* EMC_AR2PDEN */
+				0x0000000f /* EMC_RW2PDEN */
+				0x0000006c /* EMC_TXSR */
+				0x00000200 /* EMC_TXSRDLL */
+				0x00000004 /* EMC_TCKE */
+				0x00000010 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000004 /* EMC_TCLKSTABLE */
+				0x00000005 /* EMC_TCLKSTOP */
+				0x00000c30 /* EMC_TREFBW */
+				0x00000000 /* EMC_QUSE_EXTRA */
+				0x00000004 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00007088 /* EMC_FBIO_CFG5 */
+				0x001d0084 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x0003c000 /* EMC_DLL_XFORM_DQS0 */
+				0x0003c000 /* EMC_DLL_XFORM_DQS1 */
+				0x0003c000 /* EMC_DLL_XFORM_DQS2 */
+				0x0003c000 /* EMC_DLL_XFORM_DQS3 */
+				0x0003c000 /* EMC_DLL_XFORM_DQS4 */
+				0x0003c000 /* EMC_DLL_XFORM_DQS5 */
+				0x0003c000 /* EMC_DLL_XFORM_DQS6 */
+				0x0003c000 /* EMC_DLL_XFORM_DQS7 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x00048000 /* EMC_DLL_XFORM_DQ0 */
+				0x00048000 /* EMC_DLL_XFORM_DQ1 */
+				0x00048000 /* EMC_DLL_XFORM_DQ2 */
+				0x00048000 /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0800013d /* EMC_XM2DQSPADCTRL2 */
+				0x00000000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f508 /* EMC_XM2COMPPADCTRL */
+				0x05057404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+				0x080001e8 /* EMC_XM2QUSEPADCTRL */
+				0x08000021 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00020000 /* EMC_ZCAL_INTERVAL */
+				0x00000100 /* EMC_ZCAL_WAIT_CNT */
+				0x0158000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x800018c8 /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff89 /* EMC_CFG_RSV */
+			>;
+		};
+		timing-800000000 {
+			clock-frequency = <800000000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100002>;
+			nvidia,emc-mode-2 = <0x80200018>;
+			nvidia,emc-mode-reset = <0x80000d71>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-cfg-periodic-qrst;
+			nvidia,emc-configuration = <
+				0x00000025 /* EMC_RC */
+				0x000000ce /* EMC_RFC */
+				0x0000001a /* EMC_RAS */
+				0x00000009 /* EMC_RP */
+				0x00000005 /* EMC_R2W */
+				0x0000000d /* EMC_W2R */
+				0x00000004 /* EMC_R2P */
+				0x00000013 /* EMC_W2P */
+				0x00000009 /* EMC_RD_RCD */
+				0x00000009 /* EMC_WR_RCD */
+				0x00000004 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000007 /* EMC_WDV */
+				0x0000000a /* EMC_QUSE */
+				0x00000009 /* EMC_QRST */
+				0x0000000b /* EMC_QSAFE */
+				0x00000011 /* EMC_RDV */
+				0x00001820 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x00000608 /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000003 /* EMC_PDEX2WR */
+				0x00000012 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x0000000f /* EMC_AR2PDEN */
+				0x00000018 /* EMC_RW2PDEN */
+				0x000000d8 /* EMC_TXSR */
+				0x00000200 /* EMC_TXSRDLL */
+				0x00000005 /* EMC_TCKE */
+				0x00000020 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000007 /* EMC_TCLKSTABLE */
+				0x00000008 /* EMC_TCLKSTOP */
+				0x00001860 /* EMC_TREFBW */
+				0x0000000b /* EMC_QUSE_EXTRA */
+				0x00000006 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00005088 /* EMC_FBIO_CFG5 */
+				0xf0070191 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x0000800a /* EMC_DLL_XFORM_DQS0 */
+				0x0000000a /* EMC_DLL_XFORM_DQS1 */
+				0x0000000a /* EMC_DLL_XFORM_DQS2 */
+				0x0000000a /* EMC_DLL_XFORM_DQS3 */
+				0x0000000a /* EMC_DLL_XFORM_DQS4 */
+				0x0000000a /* EMC_DLL_XFORM_DQS5 */
+				0x0000000a /* EMC_DLL_XFORM_DQS6 */
+				0x0000000a /* EMC_DLL_XFORM_DQS7 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x0000000a /* EMC_DLL_XFORM_DQ0 */
+				0x0000000a /* EMC_DLL_XFORM_DQ1 */
+				0x0000000a /* EMC_DLL_XFORM_DQ2 */
+				0x0000000a /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0600013d /* EMC_XM2DQSPADCTRL2 */
+				0x22220000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f501 /* EMC_XM2COMPPADCTRL */
+				0x07077404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000000 /* EMC_XM2VTTGENPADCTRL2 */
+				0x080001e8 /* EMC_XM2QUSEPADCTRL */
+				0x08000021 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00020000 /* EMC_ZCAL_INTERVAL */
+				0x00000100 /* EMC_ZCAL_WAIT_CNT */
+				0x00f0000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x8000308c /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff49 /* EMC_CFG_RSV */
+			>;
+		};
+	};
+	emc-timings-2 {
+		nvidia,ram-code = <2>;  /* Hynix A RAM */
+		timing-25500000 {
+			clock-frequency = <25500000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100003>;
+			nvidia,emc-mode-2 = <0x80200008>;
+			nvidia,emc-mode-reset = <0x80001221>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-cfg-periodic-qrst;
+			nvidia,emc-cfg-dyn-self-ref;
+			nvidia,emc-configuration = <
+				0x00000001 /* EMC_RC */
+				0x00000007 /* EMC_RFC */
+				0x00000000 /* EMC_RAS */
+				0x00000000 /* EMC_RP */
+				0x00000002 /* EMC_R2W */
+				0x0000000a /* EMC_W2R */
+				0x00000005 /* EMC_R2P */
+				0x0000000b /* EMC_W2P */
+				0x00000000 /* EMC_RD_RCD */
+				0x00000000 /* EMC_WR_RCD */
+				0x00000003 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000005 /* EMC_WDV */
+				0x00000005 /* EMC_QUSE */
+				0x00000004 /* EMC_QRST */
+				0x0000000a /* EMC_QSAFE */
+				0x0000000b /* EMC_RDV */
+				0x000000c0 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x00000030 /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000002 /* EMC_PDEX2WR */
+				0x00000002 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x00000007 /* EMC_AR2PDEN */
+				0x0000000f /* EMC_RW2PDEN */
+				0x00000008 /* EMC_TXSR */
+				0x00000008 /* EMC_TXSRDLL */
+				0x00000004 /* EMC_TCKE */
+				0x00000002 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000004 /* EMC_TCLKSTABLE */
+				0x00000005 /* EMC_TCLKSTOP */
+				0x000000c7 /* EMC_TREFBW */
+				0x00000006 /* EMC_QUSE_EXTRA */
+				0x00000004 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00004288 /* EMC_FBIO_CFG5 */
+				0x007800a4 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x000fc000 /* EMC_DLL_XFORM_DQS0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS3 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS4 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS5 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS6 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS7 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0800211c /* EMC_XM2DQSPADCTRL2 */
+				0x00000000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f108 /* EMC_XM2COMPPADCTRL */
+				0x05057404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+				0x08000168 /* EMC_XM2QUSEPADCTRL */
+				0x08000000 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00000000 /* EMC_ZCAL_INTERVAL */
+				0x00000040 /* EMC_ZCAL_WAIT_CNT */
+				0x000c000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x80000287 /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff00 /* EMC_CFG_RSV */
+			>;
+		};
+		timing-51000000 {
+			clock-frequency = <51000000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100003>;
+			nvidia,emc-mode-2 = <0x80200008>;
+			nvidia,emc-mode-reset = <0x80001221>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-cfg-periodic-qrst;
+			nvidia,emc-cfg-dyn-self-ref;
+			nvidia,emc-configuration = <
+				0x00000002 /* EMC_RC */
+				0x0000000f /* EMC_RFC */
+				0x00000001 /* EMC_RAS */
+				0x00000000 /* EMC_RP */
+				0x00000002 /* EMC_R2W */
+				0x0000000a /* EMC_W2R */
+				0x00000005 /* EMC_R2P */
+				0x0000000b /* EMC_W2P */
+				0x00000000 /* EMC_RD_RCD */
+				0x00000000 /* EMC_WR_RCD */
+				0x00000003 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000005 /* EMC_WDV */
+				0x00000005 /* EMC_QUSE */
+				0x00000004 /* EMC_QRST */
+				0x0000000a /* EMC_QSAFE */
+				0x0000000b /* EMC_RDV */
+				0x00000181 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x00000060 /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000002 /* EMC_PDEX2WR */
+				0x00000002 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x00000007 /* EMC_AR2PDEN */
+				0x0000000f /* EMC_RW2PDEN */
+				0x00000010 /* EMC_TXSR */
+				0x00000010 /* EMC_TXSRDLL */
+				0x00000004 /* EMC_TCKE */
+				0x00000003 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000004 /* EMC_TCLKSTABLE */
+				0x00000005 /* EMC_TCLKSTOP */
+				0x0000018e /* EMC_TREFBW */
+				0x00000006 /* EMC_QUSE_EXTRA */
+				0x00000004 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00004288 /* EMC_FBIO_CFG5 */
+				0x007800a4 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x000fc000 /* EMC_DLL_XFORM_DQS0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS3 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS4 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS5 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS6 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS7 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0800211c /* EMC_XM2DQSPADCTRL2 */
+				0x00000000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f108 /* EMC_XM2COMPPADCTRL */
+				0x05057404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+				0x08000168 /* EMC_XM2QUSEPADCTRL */
+				0x08000000 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00000000 /* EMC_ZCAL_INTERVAL */
+				0x00000040 /* EMC_ZCAL_WAIT_CNT */
+				0x000c000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x8000040b /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff00 /* EMC_CFG_RSV */
+			>;
+		};
+		timing-102000000 {
+			clock-frequency = <102000000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100003>;
+			nvidia,emc-mode-2 = <0x80200008>;
+			nvidia,emc-mode-reset = <0x80001221>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-cfg-periodic-qrst;
+			nvidia,emc-cfg-dyn-self-ref;
+			nvidia,emc-configuration = <
+				0x00000004 /* EMC_RC */
+				0x0000001e /* EMC_RFC */
+				0x00000003 /* EMC_RAS */
+				0x00000001 /* EMC_RP */
+				0x00000002 /* EMC_R2W */
+				0x0000000a /* EMC_W2R */
+				0x00000005 /* EMC_R2P */
+				0x0000000b /* EMC_W2P */
+				0x00000001 /* EMC_RD_RCD */
+				0x00000001 /* EMC_WR_RCD */
+				0x00000003 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000005 /* EMC_WDV */
+				0x00000005 /* EMC_QUSE */
+				0x00000004 /* EMC_QRST */
+				0x0000000a /* EMC_QSAFE */
+				0x0000000b /* EMC_RDV */
+				0x00000303 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x000000c0 /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000002 /* EMC_PDEX2WR */
+				0x00000002 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x00000007 /* EMC_AR2PDEN */
+				0x0000000f /* EMC_RW2PDEN */
+				0x00000020 /* EMC_TXSR */
+				0x00000020 /* EMC_TXSRDLL */
+				0x00000004 /* EMC_TCKE */
+				0x00000005 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000004 /* EMC_TCLKSTABLE */
+				0x00000005 /* EMC_TCLKSTOP */
+				0x0000031c /* EMC_TREFBW */
+				0x00000006 /* EMC_QUSE_EXTRA */
+				0x00000004 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00004288 /* EMC_FBIO_CFG5 */
+				0x007800a4 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x000fc000 /* EMC_DLL_XFORM_DQS0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS3 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS4 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS5 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS6 */
+				0x000fc000 /* EMC_DLL_XFORM_DQS7 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+				0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0800211c /* EMC_XM2DQSPADCTRL2 */
+				0x00000000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f108 /* EMC_XM2COMPPADCTRL */
+				0x05057404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+				0x08000168 /* EMC_XM2QUSEPADCTRL */
+				0x08000000 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00000000 /* EMC_ZCAL_INTERVAL */
+				0x00000040 /* EMC_ZCAL_WAIT_CNT */
+				0x000c000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x80000713 /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff00 /* EMC_CFG_RSV */
+			>;
+		};
+		timing-204000000 {
+			clock-frequency = <204000000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100003>;
+			nvidia,emc-mode-2 = <0x80200008>;
+			nvidia,emc-mode-reset = <0x80001221>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-cfg-periodic-qrst;
+			nvidia,emc-cfg-dyn-self-ref;
+			nvidia,emc-configuration = <
+				0x00000009 /* EMC_RC */
+				0x0000003d /* EMC_RFC */
+				0x00000007 /* EMC_RAS */
+				0x00000002 /* EMC_RP */
+				0x00000002 /* EMC_R2W */
+				0x0000000a /* EMC_W2R */
+				0x00000005 /* EMC_R2P */
+				0x0000000b /* EMC_W2P */
+				0x00000002 /* EMC_RD_RCD */
+				0x00000002 /* EMC_WR_RCD */
+				0x00000003 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000005 /* EMC_WDV */
+				0x00000005 /* EMC_QUSE */
+				0x00000004 /* EMC_QRST */
+				0x0000000a /* EMC_QSAFE */
+				0x0000000b /* EMC_RDV */
+				0x00000607 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x00000181 /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000002 /* EMC_PDEX2WR */
+				0x00000002 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x00000007 /* EMC_AR2PDEN */
+				0x0000000f /* EMC_RW2PDEN */
+				0x00000040 /* EMC_TXSR */
+				0x00000040 /* EMC_TXSRDLL */
+				0x00000004 /* EMC_TCKE */
+				0x00000009 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000004 /* EMC_TCLKSTABLE */
+				0x00000005 /* EMC_TCLKSTOP */
+				0x00000638 /* EMC_TREFBW */
+				0x00000006 /* EMC_QUSE_EXTRA */
+				0x00000006 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00004288 /* EMC_FBIO_CFG5 */
+				0x004400a4 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x00080000 /* EMC_DLL_XFORM_DQS0 */
+				0x00080000 /* EMC_DLL_XFORM_DQS1 */
+				0x00080000 /* EMC_DLL_XFORM_DQS2 */
+				0x00080000 /* EMC_DLL_XFORM_DQS3 */
+				0x00080000 /* EMC_DLL_XFORM_DQS4 */
+				0x00080000 /* EMC_DLL_XFORM_DQS5 */
+				0x00080000 /* EMC_DLL_XFORM_DQS6 */
+				0x00080000 /* EMC_DLL_XFORM_DQS7 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x00080000 /* EMC_DLL_XFORM_DQ0 */
+				0x00080000 /* EMC_DLL_XFORM_DQ1 */
+				0x00080000 /* EMC_DLL_XFORM_DQ2 */
+				0x00080000 /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0800211c /* EMC_XM2DQSPADCTRL2 */
+				0x00000000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f108 /* EMC_XM2COMPPADCTRL */
+				0x05057404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+				0x08000168 /* EMC_XM2QUSEPADCTRL */
+				0x08000000 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00020000 /* EMC_ZCAL_INTERVAL */
+				0x00000100 /* EMC_ZCAL_WAIT_CNT */
+				0x000c000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x80000d22 /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff00 /* EMC_CFG_RSV */
+			>;
+		};
+		timing-400000000 {
+			clock-frequency = <400000000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100002>;
+			nvidia,emc-mode-2 = <0x80200000>;
+			nvidia,emc-mode-reset = <0x80000521>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-configuration = <
+				0x00000012 /* EMC_RC */
+				0x00000076 /* EMC_RFC */
+				0x0000000c /* EMC_RAS */
+				0x00000004 /* EMC_RP */
+				0x00000003 /* EMC_R2W */
+				0x00000008 /* EMC_W2R */
+				0x00000002 /* EMC_R2P */
+				0x0000000a /* EMC_W2P */
+				0x00000004 /* EMC_RD_RCD */
+				0x00000004 /* EMC_WR_RCD */
+				0x00000002 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000004 /* EMC_WDV */
+				0x00000006 /* EMC_QUSE */
+				0x00000004 /* EMC_QRST */
+				0x0000000a /* EMC_QSAFE */
+				0x0000000c /* EMC_RDV */
+				0x00000bf0 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x000002fc /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000001 /* EMC_PDEX2WR */
+				0x00000008 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x00000008 /* EMC_AR2PDEN */
+				0x0000000f /* EMC_RW2PDEN */
+				0x0000007c /* EMC_TXSR */
+				0x00000200 /* EMC_TXSRDLL */
+				0x00000004 /* EMC_TCKE */
+				0x00000010 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000004 /* EMC_TCLKSTABLE */
+				0x00000005 /* EMC_TCLKSTOP */
+				0x00000c30 /* EMC_TREFBW */
+				0x00000000 /* EMC_QUSE_EXTRA */
+				0x00000004 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00007088 /* EMC_FBIO_CFG5 */
+				0x001d0084 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x00044000 /* EMC_DLL_XFORM_DQS0 */
+				0x00044000 /* EMC_DLL_XFORM_DQS1 */
+				0x00044000 /* EMC_DLL_XFORM_DQS2 */
+				0x00044000 /* EMC_DLL_XFORM_DQS3 */
+				0x00044000 /* EMC_DLL_XFORM_DQS4 */
+				0x00044000 /* EMC_DLL_XFORM_DQS5 */
+				0x00044000 /* EMC_DLL_XFORM_DQS6 */
+				0x00044000 /* EMC_DLL_XFORM_DQS7 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x00058000 /* EMC_DLL_XFORM_DQ0 */
+				0x00058000 /* EMC_DLL_XFORM_DQ1 */
+				0x00058000 /* EMC_DLL_XFORM_DQ2 */
+				0x00058000 /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0800013d /* EMC_XM2DQSPADCTRL2 */
+				0x00000000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f508 /* EMC_XM2COMPPADCTRL */
+				0x05057404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+				0x080001e8 /* EMC_XM2QUSEPADCTRL */
+				0x08000021 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00020000 /* EMC_ZCAL_INTERVAL */
+				0x00000100 /* EMC_ZCAL_WAIT_CNT */
+				0x0148000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x800018c8 /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff89 /* EMC_CFG_RSV */
+			>;
+		};
+		timing-800000000 {
+			clock-frequency = <800000000>;
+			nvidia,emc-auto-cal-interval = <0x001fffff>;
+			nvidia,emc-mode-1 = <0x80100002>;
+			nvidia,emc-mode-2 = <0x80200018>;
+			nvidia,emc-mode-reset = <0x80000d71>;
+			nvidia,emc-zcal-cnt-long = <0x00000040>;
+			nvidia,emc-cfg-periodic-qrst;
+			nvidia,emc-configuration = <
+				0x00000025 /* EMC_RC */
+				0x000000ee /* EMC_RFC */
+				0x0000001a /* EMC_RAS */
+				0x00000009 /* EMC_RP */
+				0x00000005 /* EMC_R2W */
+				0x0000000d /* EMC_W2R */
+				0x00000004 /* EMC_R2P */
+				0x00000013 /* EMC_W2P */
+				0x00000009 /* EMC_RD_RCD */
+				0x00000009 /* EMC_WR_RCD */
+				0x00000003 /* EMC_RRD */
+				0x00000001 /* EMC_REXT */
+				0x00000000 /* EMC_WEXT */
+				0x00000007 /* EMC_WDV */
+				0x0000000a /* EMC_QUSE */
+				0x00000009 /* EMC_QRST */
+				0x0000000b /* EMC_QSAFE */
+				0x00000011 /* EMC_RDV */
+				0x00001820 /* EMC_REFRESH */
+				0x00000000 /* EMC_BURST_REFRESH_NUM */
+				0x00000608 /* EMC_PRE_REFRESH_REQ_CNT */
+				0x00000003 /* EMC_PDEX2WR */
+				0x00000012 /* EMC_PDEX2RD */
+				0x00000001 /* EMC_PCHG2PDEN */
+				0x00000000 /* EMC_ACT2PDEN */
+				0x0000000f /* EMC_AR2PDEN */
+				0x00000018 /* EMC_RW2PDEN */
+				0x000000f8 /* EMC_TXSR */
+				0x00000200 /* EMC_TXSRDLL */
+				0x00000005 /* EMC_TCKE */
+				0x00000020 /* EMC_TFAW */
+				0x00000000 /* EMC_TRPAB */
+				0x00000007 /* EMC_TCLKSTABLE */
+				0x00000008 /* EMC_TCLKSTOP */
+				0x00001860 /* EMC_TREFBW */
+				0x0000000b /* EMC_QUSE_EXTRA */
+				0x00000006 /* EMC_FBIO_CFG6 */
+				0x00000000 /* EMC_ODT_WRITE */
+				0x00000000 /* EMC_ODT_READ */
+				0x00005088 /* EMC_FBIO_CFG5 */
+				0xf0070191 /* EMC_CFG_DIG_DLL */
+				0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+				0x0000000c /* EMC_DLL_XFORM_DQS0 */
+				0x007fc00a /* EMC_DLL_XFORM_DQS1 */
+				0x00000008 /* EMC_DLL_XFORM_DQS2 */
+				0x0000000a /* EMC_DLL_XFORM_DQS3 */
+				0x0000000a /* EMC_DLL_XFORM_DQS4 */
+				0x0000000a /* EMC_DLL_XFORM_DQS5 */
+				0x0000000a /* EMC_DLL_XFORM_DQS6 */
+				0x0000000a /* EMC_DLL_XFORM_DQS7 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE0 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE1 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE2 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE3 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE4 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE5 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE6 */
+				0x00018000 /* EMC_DLL_XFORM_QUSE7 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+				0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+				0x0000000a /* EMC_DLL_XFORM_DQ0 */
+				0x0000000c /* EMC_DLL_XFORM_DQ1 */
+				0x0000000a /* EMC_DLL_XFORM_DQ2 */
+				0x0000000a /* EMC_DLL_XFORM_DQ3 */
+				0x000002a0 /* EMC_XM2CMDPADCTRL */
+				0x0600013d /* EMC_XM2DQSPADCTRL2 */
+				0x22220000 /* EMC_XM2DQPADCTRL2 */
+				0x77fff884 /* EMC_XM2CLKPADCTRL */
+				0x01f1f501 /* EMC_XM2COMPPADCTRL */
+				0x07077404 /* EMC_XM2VTTGENPADCTRL */
+				0x54000000 /* EMC_XM2VTTGENPADCTRL2 */
+				0x080001e8 /* EMC_XM2QUSEPADCTRL */
+				0x0a000021 /* EMC_XM2DQSPADCTRL3 */
+				0x00000802 /* EMC_CTT_TERM_CTRL */
+				0x00020000 /* EMC_ZCAL_INTERVAL */
+				0x00000100 /* EMC_ZCAL_WAIT_CNT */
+				0x00d0000c /* EMC_MRS_WAIT_CNT */
+				0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+				0x00000000 /* EMC_CTT */
+				0x00000000 /* EMC_CTT_DURATION */
+				0x8000308c /* EMC_DYN_SELF_REF_CONTROL */
+				0xe8000000 /* EMC_FBIO_SPARE */
+				0xff00ff49 /* EMC_CFG_RSV */
+			>;
+		};
+	};
+};
+&state_default {
+	clk_32k_out_pa0 {
+		nvidia,pins = "clk_32k_out_pa0";
+		nvidia,function = "blink";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	uart3_cts_n_pa1 {
+		nvidia,pins = "uart3_cts_n_pa1";
+		nvidia,function = "uartc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	dap2_fs_pa2 {
+		nvidia,pins = "dap2_fs_pa2";
+		nvidia,function = "i2s1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	dap2_sclk_pa3 {
+		nvidia,pins = "dap2_sclk_pa3";
+		nvidia,function = "i2s1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	dap2_din_pa4 {
+		nvidia,pins = "dap2_din_pa4";
+		nvidia,function = "i2s1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	dap2_dout_pa5 {
+		nvidia,pins = "dap2_dout_pa5";
+		nvidia,function = "i2s1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	sdmmc3_clk_pa6 {
+		nvidia,pins = "sdmmc3_clk_pa6";
+		nvidia,function = "sdmmc3";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	sdmmc3_cmd_pa7 {
+		nvidia,pins = "sdmmc3_cmd_pa7";
+		nvidia,function = "sdmmc3";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	gmi_a17_pb0 {
+		nvidia,pins = "gmi_a17_pb0";
+		nvidia,function = "spi4";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_a18_pb1 {
+		nvidia,pins = "gmi_a18_pb1";
+		nvidia,function = "spi4";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_pwr0_pb2 {
+		nvidia,pins = "lcd_pwr0_pb2";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_pclk_pb3 {
+		nvidia,pins = "lcd_pclk_pb3";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc3_dat3_pb4 {
+		nvidia,pins = "sdmmc3_dat3_pb4";
+		nvidia,function = "sdmmc3";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	sdmmc3_dat2_pb5 {
+		nvidia,pins = "sdmmc3_dat2_pb5";
+		nvidia,function = "sdmmc3";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	sdmmc3_dat1_pb6 {
+		nvidia,pins = "sdmmc3_dat1_pb6";
+		nvidia,function = "sdmmc3";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	sdmmc3_dat0_pb7 {
+		nvidia,pins = "sdmmc3_dat0_pb7";
+		nvidia,function = "sdmmc3";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	uart3_rts_n_pc0 {
+		nvidia,pins = "uart3_rts_n_pc0";
+		nvidia,function = "uartc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_pwr1_pc1 {
+		nvidia,pins = "lcd_pwr1_pc1";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	uart2_txd_pc2 {
+		nvidia,pins = "uart2_txd_pc2";
+		nvidia,function = "uartb";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	uart2_rxd_pc3 {
+		nvidia,pins = "uart2_rxd_pc3";
+		nvidia,function = "uartb";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gen1_i2c_scl_pc4 {
+		nvidia,pins = "gen1_i2c_scl_pc4";
+		nvidia,function = "i2c1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+	};
+	gen1_i2c_sda_pc5 {
+		nvidia,pins = "gen1_i2c_sda_pc5";
+		nvidia,function = "i2c1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_pwr2_pc6 {
+		nvidia,pins = "lcd_pwr2_pc6";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_wp_n_pc7 {
+		nvidia,pins = "gmi_wp_n_pc7";
+		nvidia,function = "gmi";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	sdmmc3_dat5_pd0 {
+		nvidia,pins = "sdmmc3_dat5_pd0";
+		nvidia,function = "sdmmc3";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc3_dat4_pd1 {
+		nvidia,pins = "sdmmc3_dat4_pd1";
+		nvidia,function = "sdmmc3";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	lcd_dc1_pd2 {
+		nvidia,pins = "lcd_dc1_pd2";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc3_dat6_pd3 {
+		nvidia,pins = "sdmmc3_dat6_pd3";
+		nvidia,function = "spi4";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc3_dat7_pd4 {
+		nvidia,pins = "sdmmc3_dat7_pd4";
+		nvidia,function = "spi4";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	vi_d1_pd5 {
+		nvidia,pins = "vi_d1_pd5";
+		nvidia,function = "sdmmc2";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	vi_vsync_pd6 {
+		nvidia,pins = "vi_vsync_pd6";
+		nvidia,function = "ddr";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	vi_hsync_pd7 {
+		nvidia,pins = "vi_hsync_pd7";
+		nvidia,function = "ddr";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	lcd_d0_pe0 {
+		nvidia,pins = "lcd_d0_pe0";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d1_pe1 {
+		nvidia,pins = "lcd_d1_pe1";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d2_pe2 {
+		nvidia,pins = "lcd_d2_pe2";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d3_pe3 {
+		nvidia,pins = "lcd_d3_pe3";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d4_pe4 {
+		nvidia,pins = "lcd_d4_pe4";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d5_pe5 {
+		nvidia,pins = "lcd_d5_pe5";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d6_pe6 {
+		nvidia,pins = "lcd_d6_pe6";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d7_pe7 {
+		nvidia,pins = "lcd_d7_pe7";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d8_pf0 {
+		nvidia,pins = "lcd_d8_pf0";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d9_pf1 {
+		nvidia,pins = "lcd_d9_pf1";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d10_pf2 {
+		nvidia,pins = "lcd_d10_pf2";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d11_pf3 {
+		nvidia,pins = "lcd_d11_pf3";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d12_pf4 {
+		nvidia,pins = "lcd_d12_pf4";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d13_pf5 {
+		nvidia,pins = "lcd_d13_pf5";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d14_pf6 {
+		nvidia,pins = "lcd_d14_pf6";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d15_pf7 {
+		nvidia,pins = "lcd_d15_pf7";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_ad0_pg0 {
+		nvidia,pins = "gmi_ad0_pg0";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	gmi_ad1_pg1 {
+		nvidia,pins = "gmi_ad1_pg1";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_ad2_pg2 {
+		nvidia,pins = "gmi_ad2_pg2";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	gmi_ad3_pg3 {
+		nvidia,pins = "gmi_ad3_pg3";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	gmi_ad4_pg4 {
+		nvidia,pins = "gmi_ad4_pg4";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	gmi_ad5_pg5 {
+		nvidia,pins = "gmi_ad5_pg5";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	gmi_ad6_pg6 {
+		nvidia,pins = "gmi_ad6_pg6";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	gmi_ad7_pg7 {
+		nvidia,pins = "gmi_ad7_pg7";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	gmi_ad8_ph0 {
+		nvidia,pins = "gmi_ad8_ph0";
+		nvidia,function = "pwm0";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_ad9_ph1 {
+		nvidia,pins = "gmi_ad9_ph1";
+		nvidia,function = "pwm1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_ad10_ph2 {
+		nvidia,pins = "gmi_ad10_ph2";
+		nvidia,function = "pwm2";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_ad11_ph3 {
+		nvidia,pins = "gmi_ad11_ph3";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_ad12_ph4 {
+		nvidia,pins = "gmi_ad12_ph4";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_ad13_ph5 {
+		nvidia,pins = "gmi_ad13_ph5";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_ad14_ph6 {
+		nvidia,pins = "gmi_ad14_ph6";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_wr_n_pi0 {
+		nvidia,pins = "gmi_wr_n_pi0";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_oe_n_pi1 {
+		nvidia,pins = "gmi_oe_n_pi1";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_dqs_pi2 {
+		nvidia,pins = "gmi_dqs_pi2";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_iordy_pi5 {
+		nvidia,pins = "gmi_iordy_pi5";
+		nvidia,function = "rsvd1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_cs7_n_pi6 {
+		nvidia,pins = "gmi_cs7_n_pi6";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_wait_pi7 {
+		nvidia,pins = "gmi_wait_pi7";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_de_pj1 {
+		nvidia,pins = "lcd_de_pj1";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_cs1_n_pj2 {
+		nvidia,pins = "gmi_cs1_n_pj2";
+		nvidia,function = "rsvd1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_hsync_pj3 {
+		nvidia,pins = "lcd_hsync_pj3";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_vsync_pj4 {
+		nvidia,pins = "lcd_vsync_pj4";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	uart2_cts_n_pj5 {
+		nvidia,pins = "uart2_cts_n_pj5";
+		nvidia,function = "uartb";
+		nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	uart2_rts_n_pj6 {
+		nvidia,pins = "uart2_rts_n_pj6";
+		nvidia,function = "uartb";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_a16_pj7 {
+		nvidia,pins = "gmi_a16_pj7";
+		nvidia,function = "spi4";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_adv_n_pk0 {
+		nvidia,pins = "gmi_adv_n_pk0";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_clk_pk1 {
+		nvidia,pins = "gmi_clk_pk1";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_cs2_n_pk3 {
+		nvidia,pins = "gmi_cs2_n_pk3";
+		nvidia,function = "rsvd1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	gmi_cs3_n_pk4 {
+		nvidia,pins = "gmi_cs3_n_pk4";
+		nvidia,function = "nand";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	spdif_out_pk5 {
+		nvidia,pins = "spdif_out_pk5";
+		nvidia,function = "spdif";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	spdif_in_pk6 {
+		nvidia,pins = "spdif_in_pk6";
+		nvidia,function = "spdif";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	gmi_a19_pk7 {
+		nvidia,pins = "gmi_a19_pk7";
+		nvidia,function = "spi4";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	vi_d2_pl0 {
+		nvidia,pins = "vi_d2_pl0";
+		nvidia,function = "sdmmc2";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	vi_d3_pl1 {
+		nvidia,pins = "vi_d3_pl1";
+		nvidia,function = "sdmmc2";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	vi_d4_pl2 {
+		nvidia,pins = "vi_d4_pl2";
+		nvidia,function = "vi";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	vi_d5_pl3 {
+		nvidia,pins = "vi_d5_pl3";
+		nvidia,function = "sdmmc2";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	vi_d6_pl4 {
+		nvidia,pins = "vi_d6_pl4";
+		nvidia,function = "vi";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	vi_d7_pl5 {
+		nvidia,pins = "vi_d7_pl5";
+		nvidia,function = "sdmmc2";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	vi_d8_pl6 {
+		nvidia,pins = "vi_d8_pl6";
+		nvidia,function = "sdmmc2";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	vi_d9_pl7 {
+		nvidia,pins = "vi_d9_pl7";
+		nvidia,function = "sdmmc2";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d16_pm0 {
+		nvidia,pins = "lcd_d16_pm0";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d17_pm1 {
+		nvidia,pins = "lcd_d17_pm1";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d18_pm2 {
+		nvidia,pins = "lcd_d18_pm2";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d19_pm3 {
+		nvidia,pins = "lcd_d19_pm3";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d20_pm4 {
+		nvidia,pins = "lcd_d20_pm4";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d21_pm5 {
+		nvidia,pins = "lcd_d21_pm5";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d22_pm6 {
+		nvidia,pins = "lcd_d22_pm6";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_d23_pm7 {
+		nvidia,pins = "lcd_d23_pm7";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	dap1_fs_pn0 {
+		nvidia,pins = "dap1_fs_pn0";
+		nvidia,function = "i2s0";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	dap1_din_pn1 {
+		nvidia,pins = "dap1_din_pn1";
+		nvidia,function = "i2s0";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	dap1_dout_pn2 {
+		nvidia,pins = "dap1_dout_pn2";
+		nvidia,function = "i2s0";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	dap1_sclk_pn3 {
+		nvidia,pins = "dap1_sclk_pn3";
+		nvidia,function = "i2s0";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	lcd_cs0_n_pn4 {
+		nvidia,pins = "lcd_cs0_n_pn4";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_sdout_pn5 {
+		nvidia,pins = "lcd_sdout_pn5";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_dc0_pn6 {
+		nvidia,pins = "lcd_dc0_pn6";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	hdmi_int_pn7 {
+		nvidia,pins = "hdmi_int_pn7";
+		nvidia,function = "hdmi";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	ulpi_data7_po0 {
+		nvidia,pins = "ulpi_data7_po0";
+		nvidia,function = "uarta";
+		nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	ulpi_data0_po1 {
+		nvidia,pins = "ulpi_data0_po1";
+		nvidia,function = "uarta";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	ulpi_data1_po2 {
+		nvidia,pins = "ulpi_data1_po2";
+		nvidia,function = "uarta";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	ulpi_data2_po3 {
+		nvidia,pins = "ulpi_data2_po3";
+		nvidia,function = "uarta";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	ulpi_data3_po4 {
+		nvidia,pins = "ulpi_data3_po4";
+		nvidia,function = "uarta";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	ulpi_data4_po5 {
+		nvidia,pins = "ulpi_data4_po5";
+		nvidia,function = "uarta";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	ulpi_data5_po6 {
+		nvidia,pins = "ulpi_data5_po6";
+		nvidia,function = "uarta";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	ulpi_data6_po7 {
+		nvidia,pins = "ulpi_data6_po7";
+		nvidia,function = "uarta";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	dap3_fs_pp0 {
+		nvidia,pins = "dap3_fs_pp0";
+		nvidia,function = "i2s2";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	dap3_din_pp1 {
+		nvidia,pins = "dap3_din_pp1";
+		nvidia,function = "i2s2";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	dap3_dout_pp2 {
+		nvidia,pins = "dap3_dout_pp2";
+		nvidia,function = "i2s2";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	dap3_sclk_pp3 {
+		nvidia,pins = "dap3_sclk_pp3";
+		nvidia,function = "i2s2";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	dap4_fs_pp4 {
+		nvidia,pins = "dap4_fs_pp4";
+		nvidia,function = "i2s3";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	dap4_din_pp5 {
+		nvidia,pins = "dap4_din_pp5";
+		nvidia,function = "i2s3";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	dap4_dout_pp6 {
+		nvidia,pins = "dap4_dout_pp6";
+		nvidia,function = "i2s3";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	dap4_sclk_pp7 {
+		nvidia,pins = "dap4_sclk_pp7";
+		nvidia,function = "i2s3";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	kb_col0_pq0 {
+		nvidia,pins = "kb_col0_pq0";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_col1_pq1 {
+		nvidia,pins = "kb_col1_pq1";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_col2_pq2 {
+		nvidia,pins = "kb_col2_pq2";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_col3_pq3 {
+		nvidia,pins = "kb_col3_pq3";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_col4_pq4 {
+		nvidia,pins = "kb_col4_pq4";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_col5_pq5 {
+		nvidia,pins = "kb_col5_pq5";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_col6_pq6 {
+		nvidia,pins = "kb_col6_pq6";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_col7_pq7 {
+		nvidia,pins = "kb_col7_pq7";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_row0_pr0 {
+		nvidia,pins = "kb_row0_pr0";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_row1_pr1 {
+		nvidia,pins = "kb_row1_pr1";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_row2_pr2 {
+		nvidia,pins = "kb_row2_pr2";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_row3_pr3 {
+		nvidia,pins = "kb_row3_pr3";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_row4_pr4 {
+		nvidia,pins = "kb_row4_pr4";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_row5_pr5 {
+		nvidia,pins = "kb_row5_pr5";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_row6_pr6 {
+		nvidia,pins = "kb_row6_pr6";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_row7_pr7 {
+		nvidia,pins = "kb_row7_pr7";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	kb_row8_ps0 {
+		nvidia,pins = "kb_row8_ps0";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_row9_ps1 {
+		nvidia,pins = "kb_row9_ps1";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_row10_ps2 {
+		nvidia,pins = "kb_row10_ps2";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_row11_ps3 {
+		nvidia,pins = "kb_row11_ps3";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_row12_ps4 {
+		nvidia,pins = "kb_row12_ps4";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_row13_ps5 {
+		nvidia,pins = "kb_row13_ps5";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_row14_ps6 {
+		nvidia,pins = "kb_row14_ps6";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	kb_row15_ps7 {
+		nvidia,pins = "kb_row15_ps7";
+		nvidia,function = "kbc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	vi_pclk_pt0 {
+		nvidia,pins = "vi_pclk_pt0";
+		nvidia,function = "rsvd1";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	vi_mclk_pt1 {
+		nvidia,pins = "vi_mclk_pt1";
+		nvidia,function = "vi";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	vi_d10_pt2 {
+		nvidia,pins = "vi_d10_pt2";
+		nvidia,function = "ddr";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	vi_d11_pt3 {
+		nvidia,pins = "vi_d11_pt3";
+		nvidia,function = "ddr";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	vi_d0_pt4 {
+		nvidia,pins = "vi_d0_pt4";
+		nvidia,function = "ddr";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	gen2_i2c_scl_pt5 {
+		nvidia,pins = "gen2_i2c_scl_pt5";
+		nvidia,function = "i2c2";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+	};
+	gen2_i2c_sda_pt6 {
+		nvidia,pins = "gen2_i2c_sda_pt6";
+		nvidia,function = "i2c2";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc4_cmd_pt7 {
+		nvidia,pins = "sdmmc4_cmd_pt7";
+		nvidia,function = "sdmmc4";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		nvidia,io-reset = <TEGRA_PIN_DISABLE>;
+	};
+	pu0 {
+		nvidia,pins = "pu0";
+		nvidia,function = "owr";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pu1 {
+		nvidia,pins = "pu1";
+		nvidia,function = "rsvd1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pu2 {
+		nvidia,pins = "pu2";
+		nvidia,function = "rsvd1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pu3 {
+		nvidia,pins = "pu3";
+		nvidia,function = "pwm0";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pu4 {
+		nvidia,pins = "pu4";
+		nvidia,function = "pwm1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pu5 {
+		nvidia,pins = "pu5";
+		nvidia,function = "rsvd4";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pu6 {
+		nvidia,pins = "pu6";
+		nvidia,function = "pwm3";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	jtag_rtck_pu7 {
+		nvidia,pins = "jtag_rtck_pu7";
+		nvidia,function = "rtck";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pv0 {
+		nvidia,pins = "pv0";
+		nvidia,function = "rsvd1";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	pv1 {
+		nvidia,pins = "pv1";
+		nvidia,function = "rsvd1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pv2 {
+		nvidia,pins = "pv2";
+		nvidia,function = "owr";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pv3 {
+		nvidia,pins = "pv3";
+		nvidia,function = "clk_12m_out";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	ddc_scl_pv4 {
+		nvidia,pins = "ddc_scl_pv4";
+		nvidia,function = "i2c4";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	ddc_sda_pv5 {
+		nvidia,pins = "ddc_sda_pv5";
+		nvidia,function = "i2c4";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	crt_hsync_pv6 {
+		nvidia,pins = "crt_hsync_pv6";
+		nvidia,function = "crt";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	crt_vsync_pv7 {
+		nvidia,pins = "crt_vsync_pv7";
+		nvidia,function = "crt";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_cs1_n_pw0 {
+		nvidia,pins = "lcd_cs1_n_pw0";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_m1_pw1 {
+		nvidia,pins = "lcd_m1_pw1";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	spi2_cs1_n_pw2 {
+		nvidia,pins = "spi2_cs1_n_pw2";
+		nvidia,function = "spi2";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	clk1_out_pw4 {
+		nvidia,pins = "clk1_out_pw4";
+		nvidia,function = "extperiph1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	clk2_out_pw5 {
+		nvidia,pins = "clk2_out_pw5";
+		nvidia,function = "extperiph2";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	uart3_txd_pw6 {
+		nvidia,pins = "uart3_txd_pw6";
+		nvidia,function = "uartc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	uart3_rxd_pw7 {
+		nvidia,pins = "uart3_rxd_pw7";
+		nvidia,function = "uartc";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	spi2_sck_px2 {
+		nvidia,pins = "spi2_sck_px2";
+		nvidia,function = "gmi";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	spi1_mosi_px4 {
+		nvidia,pins = "spi1_mosi_px4";
+		nvidia,function = "spi1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	spi1_sck_px5 {
+		nvidia,pins = "spi1_sck_px5";
+		nvidia,function = "spi1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	spi1_cs0_n_px6 {
+		nvidia,pins = "spi1_cs0_n_px6";
+		nvidia,function = "spi1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	spi1_miso_px7 {
+		nvidia,pins = "spi1_miso_px7";
+		nvidia,function = "spi1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	ulpi_clk_py0 {
+		nvidia,pins = "ulpi_clk_py0";
+		nvidia,function = "uartd";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	ulpi_dir_py1 {
+		nvidia,pins = "ulpi_dir_py1";
+		nvidia,function = "uartd";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	ulpi_nxt_py2 {
+		nvidia,pins = "ulpi_nxt_py2";
+		nvidia,function = "uartd";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	ulpi_stp_py3 {
+		nvidia,pins = "ulpi_stp_py3";
+		nvidia,function = "uartd";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc1_dat3_py4 {
+		nvidia,pins = "sdmmc1_dat3_py4";
+		nvidia,function = "sdmmc1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc1_dat2_py5 {
+		nvidia,pins = "sdmmc1_dat2_py5";
+		nvidia,function = "sdmmc1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc1_dat1_py6 {
+		nvidia,pins = "sdmmc1_dat1_py6";
+		nvidia,function = "sdmmc1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc1_dat0_py7 {
+		nvidia,pins = "sdmmc1_dat0_py7";
+		nvidia,function = "sdmmc1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc1_clk_pz0 {
+		nvidia,pins = "sdmmc1_clk_pz0";
+		nvidia,function = "sdmmc1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc1_cmd_pz1 {
+		nvidia,pins = "sdmmc1_cmd_pz1";
+		nvidia,function = "sdmmc1";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_sdin_pz2 {
+		nvidia,pins = "lcd_sdin_pz2";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_wr_n_pz3 {
+		nvidia,pins = "lcd_wr_n_pz3";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	lcd_sck_pz4 {
+		nvidia,pins = "lcd_sck_pz4";
+		nvidia,function = "displaya";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	sys_clk_req_pz5 {
+		nvidia,pins = "sys_clk_req_pz5";
+		nvidia,function = "sysclk";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pwr_i2c_scl_pz6 {
+		nvidia,pins = "pwr_i2c_scl_pz6";
+		nvidia,function = "i2cpwr";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+	};
+	pwr_i2c_sda_pz7 {
+		nvidia,pins = "pwr_i2c_sda_pz7";
+		nvidia,function = "i2cpwr";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+	};
+	sdmmc4_dat0_paa0 {
+		nvidia,pins = "sdmmc4_dat0_paa0";
+		nvidia,function = "sdmmc4";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		nvidia,io-reset = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc4_dat1_paa1 {
+		nvidia,pins = "sdmmc4_dat1_paa1";
+		nvidia,function = "sdmmc4";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		nvidia,io-reset = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc4_dat2_paa2 {
+		nvidia,pins = "sdmmc4_dat2_paa2";
+		nvidia,function = "sdmmc4";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		nvidia,io-reset = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc4_dat3_paa3 {
+		nvidia,pins = "sdmmc4_dat3_paa3";
+		nvidia,function = "sdmmc4";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		nvidia,io-reset = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc4_dat4_paa4 {
+		nvidia,pins = "sdmmc4_dat4_paa4";
+		nvidia,function = "sdmmc4";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		nvidia,io-reset = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc4_dat5_paa5 {
+		nvidia,pins = "sdmmc4_dat5_paa5";
+		nvidia,function = "sdmmc4";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		nvidia,io-reset = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc4_dat6_paa6 {
+		nvidia,pins = "sdmmc4_dat6_paa6";
+		nvidia,function = "sdmmc4";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		nvidia,io-reset = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc4_dat7_paa7 {
+		nvidia,pins = "sdmmc4_dat7_paa7";
+		nvidia,function = "sdmmc4";
+		nvidia,pull = <TEGRA_PIN_PULL_UP>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		nvidia,io-reset = <TEGRA_PIN_DISABLE>;
+	};
+	pbb0 {
+		nvidia,pins = "pbb0";
+		nvidia,function = "i2s4";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	cam_i2c_scl_pbb1 {
+		nvidia,pins = "cam_i2c_scl_pbb1";
+		nvidia,function = "i2c3";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+	};
+	cam_i2c_sda_pbb2 {
+		nvidia,pins = "cam_i2c_sda_pbb2";
+		nvidia,function = "i2c3";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+	};
+	pbb3 {
+		nvidia,pins = "pbb3";
+		nvidia,function = "vgp3";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pbb4 {
+		nvidia,pins = "pbb4";
+		nvidia,function = "vgp4";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pbb5 {
+		nvidia,pins = "pbb5";
+		nvidia,function = "vgp5";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pbb6 {
+		nvidia,pins = "pbb6";
+		nvidia,function = "vgp6";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pbb7 {
+		nvidia,pins = "pbb7";
+		nvidia,function = "i2s4";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	cam_mclk_pcc0 {
+		nvidia,pins = "cam_mclk_pcc0";
+		nvidia,function = "vi_alt3";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pcc1 {
+		nvidia,pins = "pcc1";
+		nvidia,function = "i2s4";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	pcc2 {
+		nvidia,pins = "pcc2";
+		nvidia,function = "i2s4";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc4_rst_n_pcc3 {
+		nvidia,pins = "sdmmc4_rst_n_pcc3";
+		nvidia,function = "sdmmc4";
+		nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		nvidia,io-reset = <TEGRA_PIN_DISABLE>;
+	};
+	sdmmc4_clk_pcc4 {
+		nvidia,pins = "sdmmc4_clk_pcc4";
+		nvidia,function = "sdmmc4";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		nvidia,io-reset = <TEGRA_PIN_DISABLE>;
+	};
+	clk2_req_pcc5 {
+		nvidia,pins = "clk2_req_pcc5";
+		nvidia,function = "dap";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pex_l2_rst_n_pcc6 {
+		nvidia,pins = "pex_l2_rst_n_pcc6";
+		nvidia,function = "pcie";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pex_l2_clkreq_n_pcc7 {
+		nvidia,pins = "pex_l2_clkreq_n_pcc7";
+		nvidia,function = "pcie";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pex_l0_prsnt_n_pdd0 {
+		nvidia,pins = "pex_l0_prsnt_n_pdd0";
+		nvidia,function = "pcie";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pex_l0_rst_n_pdd1 {
+		nvidia,pins = "pex_l0_rst_n_pdd1";
+		nvidia,function = "pcie";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pex_l0_clkreq_n_pdd2 {
+		nvidia,pins = "pex_l0_clkreq_n_pdd2";
+		nvidia,function = "pcie";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pex_wake_n_pdd3 {
+		nvidia,pins = "pex_wake_n_pdd3";
+		nvidia,function = "pcie";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pex_l1_prsnt_n_pdd4 {
+		nvidia,pins = "pex_l1_prsnt_n_pdd4";
+		nvidia,function = "pcie";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pex_l1_rst_n_pdd5 {
+		nvidia,pins = "pex_l1_rst_n_pdd5";
+		nvidia,function = "pcie";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pex_l1_clkreq_n_pdd6 {
+		nvidia,pins = "pex_l1_clkreq_n_pdd6";
+		nvidia,function = "pcie";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	pex_l2_prsnt_n_pdd7 {
+		nvidia,pins = "pex_l2_prsnt_n_pdd7";
+		nvidia,function = "pcie";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	clk3_out_pee0 {
+		nvidia,pins = "clk3_out_pee0";
+		nvidia,function = "extperiph3";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	clk3_req_pee1 {
+		nvidia,pins = "clk3_req_pee1";
+		nvidia,function = "dev3";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	clk1_req_pee2 {
+		nvidia,pins = "clk1_req_pee2";
+		nvidia,function = "dap";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+	};
+	hdmi_cec_pee3 {
+		nvidia,pins = "hdmi_cec_pee3";
+		nvidia,function = "cec";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+	};
+	owr {
+		nvidia,pins = "owr";
+		nvidia,function = "owr";
+		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+		nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+	};
+	drive_groups {
+		nvidia,pins = "drive_gma",
+			      "drive_gmb",
+			      "drive_gmc",
+			      "drive_gmd";
+		nvidia,pull-down-strength = <9>;
+		nvidia,pull-up-strength = <9>;
+		nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
+		nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
+	};
+};
-- 
2.25.1


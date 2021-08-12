Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A70E3EA49C
	for <lists+linux-tegra@lfdr.de>; Thu, 12 Aug 2021 14:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233613AbhHLM07 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 12 Aug 2021 08:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236581AbhHLM06 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Aug 2021 08:26:58 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4396C061765;
        Thu, 12 Aug 2021 05:26:32 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id k5-20020a05600c1c85b02902e699a4d20cso4432615wms.2;
        Thu, 12 Aug 2021 05:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tUsrlmSGnr2TahZb2w/BRoJ7WvZ4yrar8DsfAKfdork=;
        b=RhMy/nlINZVRlTEdX4RM27ZOEl60elktzan4p1+Lbtp3+QeYCiwQwIzTEwVb53mHLR
         I8f7Wc7lNIqsnxfMV+I7Os8wVaa0Ve3Huq01C41SbkE0vVaAJbV80Z7pCuL1bYYpt/l/
         KM3LWcIeud8HbcWwv9zHkGf98Ae+GgonAlwanulgVQ9glGWZNdJckT9Yx4P5KpkaXZpG
         wUSRxisHvNg5LPO2iadJYWDWMPPVtUAiBl5RC/+6LTquowhHhNXogX4tF8G03UBzIpsW
         OiWPgW94V0nxe1NE9uRE/aBVhJeUGrmXP0HbBmZHnKAcFehocBdcJgPVa0ZKqTum+v36
         YAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tUsrlmSGnr2TahZb2w/BRoJ7WvZ4yrar8DsfAKfdork=;
        b=naOglYDp3bN2ipOABUtbO/dvIdTVjNChKr19qa+aOkne0bSDL4PtmnSN33j9w7JPA9
         WqQ2BHAqZxlrkum9w5exNqXKjQ64Lc415UmvetQrnwq6XHRQpZh80y/q/vBBlhX+rvrp
         pcVOg2k2sDvxRs2v9S5v4MsbMaKnEeu/sZI0voHNzzSIEPbmDh9vKwnlAUVrTi3LJtHF
         j0VorjumFqIK/piTdgbxAaJu9096uS3HsW9fEE+G0dSDSixL7wPL6x73Rvf3jB/hkUAX
         fpRwjzacWqhegw1W4lxkVrF/IGS7SLPTdc7vxhKBp1Wg6guKikBBDMvBNLOQkQmBetbL
         MF1Q==
X-Gm-Message-State: AOAM531FJS/h85ovbxKLzR2Rgv/I+vb8cGm2phBmm3NmVASA6RXpUP5q
        Q4AKWStEtEjP7RY+1ypaIh7fyMieJPc=
X-Google-Smtp-Source: ABdhPJzVNfUHlC2pG81/n+qBGjPhu+Ox3HN8jFYnojHbxgudP4GR0J+u785irUAM155TgA4kWTyj6A==
X-Received: by 2002:a1c:9a86:: with SMTP id c128mr8457453wme.65.1628771191364;
        Thu, 12 Aug 2021 05:26:31 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id l9sm2760508wro.92.2021.08.12.05.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 05:26:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] arm64: tegra: Add NVIDIA Jetson TX2 NX Developer Kit support
Date:   Thu, 12 Aug 2021 14:26:17 +0200
Message-Id: <20210812122617.2378605-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210812122617.2378605-1-thierry.reding@gmail.com>
References: <20210812122617.2378605-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Jetson TX2 NX Developer Kit is very similar to the Jetson Nano, but
uses the more powerful Tegra186 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../nvidia/tegra186-p3509-0000+p3636-0001.dts | 718 ++++++++++++++++++
 2 files changed, 719 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index e13fb1070472..c80f7dc2935e 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p3450-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-smaug.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2894-0050-a08.dtb
 dtb-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186-p2771-0000.dtb
+dtb-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186-p3509-0000+p3636-0001.dtb
 dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p2972-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0001.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
new file mode 100644
index 000000000000..936b106e73db
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
@@ -0,0 +1,718 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/mfd/max77620.h>
+
+#include "tegra186.dtsi"
+
+/ {
+	model = "NVIDIA Jetson TX2 NX Developer Kit";
+	compatible = "nvidia,p3509-0000+p3636-0001", "nvidia,tegra186";
+
+	aliases {
+		ethernet0 = "/ethernet@2490000";
+		i2c0 = "/bpmp/i2c";
+		i2c1 = "/i2c@3160000";
+		i2c2 = "/i2c@c240000";
+		i2c3 = "/i2c@3180000";
+		i2c4 = "/i2c@3190000";
+		i2c5 = "/i2c@31c0000";
+		i2c6 = "/i2c@c250000";
+		i2c7 = "/i2c@31e0000";
+		mmc0 = "/mmc@3460000";
+		serial0 = &uarta;
+	};
+
+	chosen {
+		bootargs = "earlycon console=ttyS0,115200n8";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x70000000>;
+	};
+
+	ethernet@2490000 {
+		status = "okay";
+
+		phy-reset-gpios = <&gpio_aon TEGRA186_AON_GPIO(AA, 6) GPIO_ACTIVE_LOW>;
+		phy-handle = <&phy>;
+		phy-mode = "rgmii-id";
+
+		mdio {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			phy: phy@0 {
+				compatible = "ethernet-phy-ieee802.3-c22";
+				reg = <0x0>;
+				interrupt-parent = <&gpio_aon>;
+				interrupts = <TEGRA186_AON_GPIO(AA, 7) IRQ_TYPE_LEVEL_LOW>;
+				#phy-cells = <0>;
+			};
+		};
+	};
+
+	memory-controller@2c00000 {
+		status = "okay";
+	};
+
+	timer@3010000 {
+		status = "okay";
+	};
+
+	serial@3100000 {
+		status = "okay";
+	};
+
+	i2c@3160000 {
+		status = "okay";
+	};
+
+	i2c@3180000 {
+		status = "okay";
+
+		power-monitor@40 {
+			compatible = "ti,ina3221";
+			reg = <0x40>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			channel@0 {
+				reg = <0>;
+				label = "VDD_IN";
+				shunt-resistor-micro-ohms = <5>;
+			};
+
+			channel@1 {
+				reg = <1>;
+				label = "VDD_CPU_GPU";
+				shunt-resistor-micro-ohms = <5>;
+			};
+
+			channel@2 {
+				reg = <2>;
+				label = "VDD_SOC";
+				shunt-resistor-micro-ohms = <>;
+			};
+		};
+	};
+
+	ddc: i2c@3190000 {
+		status = "okay";
+	};
+
+	i2c@31c0000 {
+		status = "okay";
+	};
+
+	i2c@31e0000 {
+		status = "okay";
+	};
+
+	/* SDMMC4 (eMMC) */
+	mmc@3460000 {
+		status = "okay";
+		bus-width = <8>;
+		non-removable;
+
+		vqmmc-supply = <&vdd_1v8_ap>;
+		vmmc-supply = <&vdd_3v3_sys>;
+	};
+
+	hda@3510000 {
+		nvidia,model = "jetson-tx2-hda";
+		status = "okay";
+	};
+
+	padctl@3520000 {
+		status = "okay";
+
+		avdd-pll-erefeut-supply = <&vdd_1v8_pll>;
+		avdd-usb-supply = <&vdd_3v3_sys>;
+		vclamp-usb-supply = <&vdd_1v8>;
+		vddio-hsic-supply = <&gnd>;
+
+		pads {
+			usb2 {
+				status = "okay";
+
+				lanes {
+					micro_b: usb2-0 {
+						nvidia,function = "xusb";
+						status = "okay";
+					};
+
+					usb2-1 {
+						nvidia,function = "xusb";
+						status = "okay";
+					};
+
+					usb2-2 {
+						nvidia,function = "xusb";
+						status = "okay";
+					};
+				};
+			};
+
+			usb3 {
+				status = "okay";
+
+				lanes {
+					usb3-1 {
+						nvidia,function = "xusb";
+						status = "okay";
+					};
+				};
+			};
+		};
+
+		ports {
+			usb2-0 {
+				status = "okay";
+				mode = "otg";
+				vbus-supply = <&vdd_5v0_sys>;
+				usb-role-switch;
+
+				connector {
+					compatible = "gpio-usb-b-connector",
+						     "usb-b-connector";
+					label = "micro-USB";
+					type = "micro";
+					vbus-gpios = <&gpio
+						      TEGRA186_MAIN_GPIO(L, 4)
+						      GPIO_ACTIVE_LOW>;
+					id-gpios = <&pmic 0 GPIO_ACTIVE_HIGH>;
+				};
+			};
+
+			usb2-1 {
+				status = "okay";
+				mode = "host";
+
+				vbus-supply = <&vdd_5v0_sys>;
+			};
+
+			usb2-2 {
+				status = "okay";
+				mode = "host";
+
+				vbus-supply = <&vdd_5v0_sys>;
+			};
+
+			usb3-1 {
+				nvidia,usb2-companion = <1>;
+				vbus-supply = <&vdd_5v0_sys>;
+				status = "okay";
+			};
+		};
+	};
+
+	usb@3530000 {
+		status = "okay";
+
+		phys = <&{/padctl@3520000/pads/usb2/lanes/usb2-0}>,
+		       <&{/padctl@3520000/pads/usb2/lanes/usb2-1}>,
+		       <&{/padctl@3520000/pads/usb2/lanes/usb2-2}>,
+		       <&{/padctl@3520000/pads/usb3/lanes/usb3-1}>;
+		phy-names = "usb2-0", "usb2-1", "usb2-2", "usb3-1";
+	};
+
+	usb@3550000 {
+		status = "okay";
+
+		phys = <&micro_b>;
+		phy-names = "usb2-0";
+	};
+
+	hsp@3c00000 {
+		status = "okay";
+	};
+
+	i2c@c240000 {
+		status = "okay";
+	};
+
+	i2c@c250000 {
+		status = "okay";
+
+		/* module ID EEPROM */
+		eeprom@50 {
+			compatible = "atmel,24c02";
+			reg = <0x50>;
+
+			label = "module";
+			vcc-supply = <&vdd_1v8>;
+			address-width = <8>;
+			pagesize = <8>;
+			size = <256>;
+			read-only;
+		};
+
+		/* carrier board ID EEPROM */
+		eeprom@57 {
+			compatible = "atmel,24c02";
+			reg = <0x57>;
+
+			label = "system";
+			vcc-supply = <&vdd_1v8>;
+			address-width = <8>;
+			pagesize = <8>;
+			size = <256>;
+			read-only;
+		};
+	};
+
+	rtc@c2a0000 {
+		status = "okay";
+	};
+
+	pwm@c340000 {
+		status = "okay";
+	};
+
+	pmc@c360000 {
+		nvidia,invert-interrupt;
+	};
+
+	pcie@10003000 {
+		status = "okay";
+
+		dvdd-pex-supply = <&vdd_pex>;
+		hvdd-pex-pll-supply = <&vdd_1v8>;
+		hvdd-pex-supply = <&vdd_1v8>;
+		vddio-pexctl-aud-supply = <&vdd_1v8>;
+
+		pci@1,0 {
+			nvidia,num-lanes = <2>;
+			status = "okay";
+		};
+
+		pci@2,0 {
+			nvidia,num-lanes = <1>;
+			status = "disabled";
+		};
+
+		pci@3,0 {
+			nvidia,num-lanes = <1>;
+			status = "okay";
+		};
+	};
+
+	host1x@13e00000 {
+		status = "okay";
+
+		dpaux@15040000 {
+			status = "okay";
+		};
+
+		display-hub@15200000 {
+			status = "okay";
+		};
+
+		dsi@15300000 {
+			status = "disabled";
+		};
+
+		/* DP */
+		sor@15540000 {
+			status = "okay";
+
+			avdd-io-hdmi-dp-supply = <&vdd_hdmi_1v05>;
+			vdd-hdmi-dp-pll-supply = <&vdd_1v8_ap>;
+
+			nvidia,dpaux = <&dpaux>;
+		};
+
+		/* HDMI */
+		sor@15580000 {
+			status = "okay";
+
+			avdd-io-hdmi-dp-supply = <&vdd_hdmi_1v05>;
+			vdd-hdmi-dp-pll-supply = <&vdd_1v8_ap>;
+			hdmi-supply = <&vdd_hdmi>;
+
+			nvidia,ddc-i2c-bus = <&ddc>;
+			nvidia,hpd-gpio = <&gpio TEGRA186_MAIN_GPIO(P, 1)
+						 GPIO_ACTIVE_LOW>;
+		};
+
+		dpaux@155c0000 {
+			status = "okay";
+		};
+	};
+
+	gpu@17000000 {
+		status = "okay";
+	};
+
+	fan: fan {
+		compatible = "pwm-fan";
+		pwms = <&pwm4 0 45334>;
+
+		cooling-levels = <0 64 128 255>;
+		#cooling-cells = <2>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		power {
+			label = "Power";
+			gpios = <&gpio_aon TEGRA186_AON_GPIO(FF, 0)
+					   GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_POWER>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		volume-up {
+			label = "Volume Up";
+			gpios = <&gpio_aon TEGRA186_AON_GPIO(FF, 1)
+					   GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <10>;
+		};
+
+		volume-down {
+			label = "Volume Down";
+			gpios = <&gpio_aon TEGRA186_AON_GPIO(FF, 2)
+					   GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <10>;
+		};
+	};
+
+	cpus {
+		cpu@0 {
+			enable-method = "psci";
+		};
+
+		cpu@1 {
+			enable-method = "psci";
+		};
+
+		cpu@2 {
+			enable-method = "psci";
+		};
+
+		cpu@3 {
+			enable-method = "psci";
+		};
+
+		cpu@4 {
+			enable-method = "psci";
+		};
+
+		cpu@5 {
+			enable-method = "psci";
+		};
+	};
+
+	bpmp {
+		i2c {
+			status = "okay";
+
+			pmic: pmic@3c {
+				compatible = "maxim,max77620";
+				reg = <0x3c>;
+
+				interrupt-parent = <&pmc>;
+				interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+
+				#gpio-cells = <2>;
+				gpio-controller;
+
+				pinctrl-names = "default";
+				pinctrl-0 = <&max77620_default>;
+
+				max77620_default: pinmux {
+					gpio0 {
+						pins = "gpio0";
+						function = "gpio";
+					};
+
+					gpio1 {
+						pins = "gpio1";
+						function = "fps-out";
+						maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
+					};
+
+					gpio2 {
+						pins = "gpio2";
+						function = "fps-out";
+						maxim,active-fps-source = <MAX77620_FPS_SRC_1>;
+					};
+
+					gpio3 {
+						pins = "gpio3";
+						function = "fps-out";
+						maxim,active-fps-source = <MAX77620_FPS_SRC_1>;
+					};
+
+					gpio4 {
+						pins = "gpio4";
+						function = "32k-out1";
+						drive-push-pull = <1>;
+					};
+
+					gpio5 {
+						pins = "gpio5";
+						function = "gpio";
+						drive-push-pull = <0>;
+					};
+
+					gpio6 {
+						pins = "gpio6";
+						function = "gpio";
+						drive-push-pull = <1>;
+					};
+
+					gpio7 {
+						pins = "gpio7";
+						function = "gpio";
+						drive-push-pull = <1>;
+					};
+				};
+
+				fps {
+					fps0 {
+						maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_EN0>;
+						maxim,shutdown-fps-time-period-us = <640>;
+					};
+
+					fps1 {
+						maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_EN1>;
+						maxim,shutdown-fps-time-period-us = <640>;
+					};
+
+					fps2 {
+						maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_EN0>;
+						maxim,shutdown-fps-time-period-us = <640>;
+					};
+				};
+
+				regulators {
+					in-sd0-supply = <&vdd_5v0_sys>;
+					in-sd1-supply = <&vdd_5v0_sys>;
+					in-sd2-supply = <&vdd_5v0_sys>;
+					in-sd3-supply = <&vdd_5v0_sys>;
+
+					in-ldo0-1-supply = <&vdd_5v0_sys>;
+					in-ldo2-supply = <&vdd_5v0_sys>;
+					in-ldo3-5-supply = <&vdd_5v0_sys>;
+					in-ldo4-6-supply = <&vdd_1v8>;
+					in-ldo7-8-supply = <&avdd_dsi_csi>;
+
+					sd0 {
+						regulator-name = "VDD_DDR_1V1_PMIC";
+						regulator-min-microvolt = <1100000>;
+						regulator-max-microvolt = <1100000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					avdd_dsi_csi: sd1 {
+						regulator-name = "AVDD_DSI_CSI_1V2";
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <1200000>;
+					};
+
+					vdd_1v8: sd2 {
+						regulator-name = "VDD_1V8";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					vdd_3v3_sys: sd3 {
+						regulator-name = "VDD_3V3_SYS";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+					};
+
+					vdd_1v8_pll: ldo0 {
+						regulator-name = "VDD_1V8_AP_PLL";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					ldo2 {
+						regulator-name = "VDDIO_3V3_AOHV";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					vddio_sdmmc1: ldo3 {
+						regulator-name = "VDDIO_SDMMC1_AP";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <3300000>;
+					};
+
+					ldo4 {
+						regulator-name = "VDD_RTC";
+						regulator-min-microvolt = <1000000>;
+						regulator-max-microvolt = <1000000>;
+					};
+
+					vddio_sdmmc3: ldo5 {
+						regulator-name = "VDDIO_SDMMC3_AP";
+						regulator-min-microvolt = <2800000>;
+						regulator-max-microvolt = <2800000>;
+					};
+
+					vdd_hdmi_1v05: ldo7 {
+						regulator-name = "VDD_HDMI_1V05";
+						regulator-min-microvolt = <1050000>;
+						regulator-max-microvolt = <1050000>;
+					};
+
+					vdd_pex: ldo8 {
+						regulator-name = "VDD_PEX_1V05";
+						regulator-min-microvolt = <1050000>;
+						regulator-max-microvolt = <1050000>;
+					};
+				};
+			};
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		status = "okay";
+		method = "smc";
+	};
+
+	gnd: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "GND";
+		regulator-min-microvolt = <0>;
+		regulator-max-microvolt = <0>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_5v0_sys: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_5V0_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_1v8_ap: regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_AP";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vdd_1v8>;
+	};
+
+	vdd_hdmi: regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_5V0_HDMI_CON";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	thermal-zones {
+		cpu {
+			polling-delay = <0>;
+			polling-delay-passive = <500>;
+			status = "okay";
+
+			trips {
+				cpu_trip_critical: critical {
+					temperature = <96500>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+
+				cpu_trip_hot: hot {
+					temperature = <79000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpu_trip_active: active {
+					temperature = <62000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+
+				cpu_trip_passive: passive {
+					temperature = <45000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				cpu-critical {
+					cooling-device = <&fan 3 3>;
+					trip = <&cpu_trip_critical>;
+				};
+
+				cpu-hot {
+					cooling-device = <&fan 2 2>;
+					trip = <&cpu_trip_hot>;
+				};
+
+				cpu-active {
+					cooling-device = <&fan 1 1>;
+					trip = <&cpu_trip_active>;
+				};
+
+				cpu-passive {
+					cooling-device = <&fan 0 0>;
+					trip = <&cpu_trip_passive>;
+				};
+			};
+		};
+
+		gpu {
+			polling-delay = <0>;
+			polling-delay-passive = <500>;
+			status = "okay";
+
+			trips {
+				gpu_alert0: critical {
+					temperature = <99000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aux {
+			polling-delay = <0>;
+			polling-delay-passive = <500>;
+			status = "okay";
+
+			trips {
+				aux_alert0: critical {
+					temperature = <90000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
-- 
2.32.0


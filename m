Return-Path: <linux-tegra+bounces-9072-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4303B46979
	for <lists+linux-tegra@lfdr.de>; Sat,  6 Sep 2025 08:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A5331C86FE3
	for <lists+linux-tegra@lfdr.de>; Sat,  6 Sep 2025 06:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B5C2D0636;
	Sat,  6 Sep 2025 06:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ish5R9Ew"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD702C2346;
	Sat,  6 Sep 2025 06:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757140202; cv=none; b=fMZA3E8nXVGqaftyK3zuFwsXy0k+Gji+Dc+9PjWtKOes6kGpWG/DDGIVmkklnqCKNfzIKYTX9XqVKOknRqaDiVAKN6cRZxf0wZIFT7aclRT7Y1sWvBq51XVBB072IN6dEnp1zrNy3yTaiiZtOf/+N+Fr2gt2WpMwMlgv1Qpi17s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757140202; c=relaxed/simple;
	bh=IbEDXx6TcOiBjLLRVqeOgKt+7cMnTmo58VJw1+HuJSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RKkLfcioplV+TIQPpqRQAAGc94V/VkSXy4d253Iak+Yao/j1v9SqUOnDiHBcVdQLmdkdakGCcW5BUAT0+M+1dNAD1YD/CEtWm9NKJW7ZcpvjScxm77jnPFwcbj3RvJD32KS0F5UL2uWmlEFrpouEupeCvjSeNgMFNhu979oYADM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ish5R9Ew; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so2918788e87.2;
        Fri, 05 Sep 2025 23:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757140196; x=1757744996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpkqLCTHuDiXR8yNf6u1uqAjNgUO9/Dm7yaYdRHBCic=;
        b=ish5R9EwG4yumbDZ6A6RAtEAerjRLvK1YzfUqqtxqrj+Q/S/bzt+D1vkjlEKZ0tPoI
         TaNuvX5P6BC6OUbchBNeKWy6b+WOlg5br+/WAk1CeWgHidYWzZFx7pmpcPKlVz5nPYvp
         kkScO3TWrgMi+u653o5KlWXaeKukXf0W4MfF6FPF1aozP68y72FayuvEeTy8bdmiUD99
         q4wYrj37RsT5MKgffozMZ9Hi8mol/znucs4pyp8sy4WRprUN65rj3C6nQXwWaHXfNtr0
         jet3n1KCqI/gEmp9MkWFMhl4TEaF9ZmkslnVTBRyDFuBtEjVti/LWe6temtcQy0mECeD
         viAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757140196; x=1757744996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpkqLCTHuDiXR8yNf6u1uqAjNgUO9/Dm7yaYdRHBCic=;
        b=bEApqZVnyIT7AnjciA7v0pF3sCELMs/d4y+3OxxfY7DLtWIuPKZnBdr/auFRct3U8t
         wNTDpvTY+/FLRI0ZxVnuNAtqEDsz+93FnDDw1s/buWCtXiAviLr5DJ68sB+xKbhhbJM0
         JV3MO7wCWQLJ5aKn0gG/3cmGzHVz6cxjKfesVdnUMQG1s6UQ10upQhZCbBaZ6y1qI5Y+
         rSdkVLTUBB/oCKpB4uTZ2Czdju0BYYP5/gjRVBgfOVr+7nyBA+qyd0mUKgT5j6NiskM1
         R0BwGRG2feosV1qVeT14c5+5csHjAsV1SyXKWZUJE6yOAbampTnJaFxNPla0ElyIav31
         OxkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLtH5AVU6O3TbdUAvQ4irg8dyvq8wc8BYYtud/s+LtkIu7Y2WnovpYYFUunkX3BVffJD0A0lS0VrZSVvc=@vger.kernel.org, AJvYcCX00hjtzIToBYsD8tUncZTIfxRLzWdPPx7mS71SrhI2X/It2XANdIlaO/l64z204hPUibW8l78dW0mLDjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAJuS4xWrQ+nAk3imhbQRou1cAGJxmzKtwCXKmRT8gkj7CWQ84
	IGeax9/l6ZAy/Z9ulL2cAT5IwjPgo4i6q+D/9P4jf1dnRAutqhe/Q8FR
X-Gm-Gg: ASbGnct4W3+rsELbWyvdAM0uIRAO4ctycxdnCKPP8osMb0R63JJjONM9wb0Mmc1Q0NB
	1p4rVIHnTH31eWvTOXWssfRVZf2WSuOxHuaZUtpXeQLR1PW/+VnzhiAwn/qDGdda8o7AGjBOf2K
	THGEc8WRuo+rTPfVcP7Nm82izGJPYBpMQbkvU/1QzuQ7p8kMkrmbeEXqNotqdSgT1sAWrVyS3If
	l8PKQOd57xJR6bdluFjLIRt7/ubSDRGl2l3Y5CgSEeg8lT+LhTLtF5G1EZlL8DmNASxO+DzVjjL
	9CJqKMUQhxw7kU8CzecbEYOQgHornTa/UgJ9/hSjtTdJJQi6zyUoeE7r6QQgoDr51FN/e9nGGa1
	RoHvb3r6VGY6I5DMsl1Jn8Zmf
X-Google-Smtp-Source: AGHT+IHaVtQ46hPuPHKpXuSY/aSAyVyIBboALGQyrEFqitisnWvaB2YOK3THVql0G+xtOJTodSvlcQ==
X-Received: by 2002:a05:6512:3b0e:b0:55f:596f:2ec0 with SMTP id 2adb3069b0e04-562603a2278mr417971e87.5.1757140195549;
        Fri, 05 Sep 2025 23:29:55 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608abb7c74sm2178737e87.54.2025.09.05.23.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 23:29:55 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] ARM: tegra: add support for ASUS Eee Pad Slider SL101
Date: Sat,  6 Sep 2025 09:29:34 +0300
Message-ID: <20250906062934.6637-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906062934.6637-1-clamor95@gmail.com>
References: <20250906062934.6637-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Factor out common part from ASUS Eee Pad Transformer TF101 device tree
into tegra20-asus-transformer-common.dtsi and add device tree fragment for
ASUS Eee Pad Slider SL101.

Tested-by: Winona Schroeer-Smith <wolfizen@wolfizen.net> # ASUS SL101
Tested-by: Antoni Aloy Torrens <aaloytorrens@gmail.com> # ASUS TF101
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/Makefile             |    1 +
 .../boot/dts/nvidia/tegra20-asus-sl101.dts    |   61 +
 .../boot/dts/nvidia/tegra20-asus-tf101.dts    | 1254 +---------------
 .../tegra20-asus-transformer-common.dtsi      | 1268 +++++++++++++++++
 4 files changed, 1333 insertions(+), 1251 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi

diff --git a/arch/arm/boot/dts/nvidia/Makefile b/arch/arm/boot/dts/nvidia/Makefile
index ff2c5bfd8efa..bfb62ab2ee2a 100644
--- a/arch/arm/boot/dts/nvidia/Makefile
+++ b/arch/arm/boot/dts/nvidia/Makefile
@@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_TEGRA_124_SOC) += \
 	tegra124-venice2.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += \
 	tegra20-acer-a500-picasso.dtb \
+	tegra20-asus-sl101.dtb \
 	tegra20-asus-tf101.dtb \
 	tegra20-harmony.dtb \
 	tegra20-colibri-eval-v3.dtb \
diff --git a/arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts b/arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts
new file mode 100644
index 000000000000..8828129d1fa3
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra20-asus-transformer-common.dtsi"
+
+/ {
+	model = "ASUS Eee Pad Slider SL101";
+	compatible = "asus,sl101", "nvidia,tegra20";
+
+	i2c@7000c000 {
+		magnetometer@e {
+			mount-matrix =  "1",  "0",  "0",
+					"0", "-1",  "0",
+					"0",  "0",  "1";
+		};
+
+		/* Atmel MXT1386 Touchscreen */
+		touchscreen@5a {
+			compatible = "atmel,maxtouch";
+			reg = <0x5a>;
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
+			mount-matrix =	 "0",  "1",  "0",
+					"-1",  "0",  "0",
+					 "0",  "0",  "1";
+
+			i2c-gate {
+				accelerometer@f {
+					mount-matrix =	 "1",  "0",  "0",
+							 "0", "-1",  "0",
+							 "0",  "0",  "1";
+				};
+			};
+		};
+	};
+
+	extcon-keys {
+		compatible = "gpio-keys";
+
+		switch-tablet-mode {
+			label = "Tablet Mode";
+			gpios = <&gpio TEGRA_GPIO(S, 4) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_TABLET_MODE>;
+			debounce-interval = <500>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts b/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
index efd8838f9644..0d93820a5ad4 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
@@ -1,545 +1,19 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-#include <dt-bindings/input/atmel-maxtouch.h>
-#include <dt-bindings/input/gpio-keys.h>
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/thermal/thermal.h>
-
-#include "tegra20.dtsi"
-#include "tegra20-cpu-opp.dtsi"
-#include "tegra20-cpu-opp-microvolt.dtsi"
+#include "tegra20-asus-transformer-common.dtsi"
 
 / {
-	model = "ASUS EeePad Transformer TF101";
+	model = "ASUS Eee Pad Transformer TF101";
 	compatible = "asus,tf101", "nvidia,tegra20";
-	chassis-type = "convertible";
-
-	aliases {
-		mmc0 = &sdmmc4; /* eMMC */
-		mmc1 = &sdmmc3; /* MicroSD */
-		mmc2 = &sdmmc1; /* WiFi */
-
-		rtc0 = &pmic;
-		rtc1 = "/rtc@7000e000";
-
-		serial0 = &uartd;
-		serial1 = &uartc; /* Bluetooth */
-		serial2 = &uartb; /* GPS */
-	};
-
-	/*
-	 * The decompressor and also some bootloaders rely on a
-	 * pre-existing /chosen node to be available to insert the
-	 * command line and merge other ATAGS info.
-	 */
-	chosen {};
-
-	memory@0 {
-		reg = <0x00000000 0x40000000>;
-	};
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		ramoops@2ffe0000 {
-			compatible = "ramoops";
-			reg = <0x2ffe0000 0x10000>;	/* 64kB */
-			console-size = <0x8000>;	/* 32kB */
-			record-size = <0x400>;		/*  1kB */
-			ecc-size = <16>;
-		};
-
-		linux,cma@30000000 {
-			compatible = "shared-dma-pool";
-			alloc-ranges = <0x30000000 0x10000000>;
-			size = <0x10000000>; /* 256MiB */
-			linux,cma-default;
-			reusable;
-		};
-	};
-
-	host1x@50000000 {
-		dc@54200000 {
-			rgb {
-				status = "okay";
-
-				port {
-					lcd_output: endpoint {
-						remote-endpoint = <&lvds_encoder_input>;
-						bus-width = <18>;
-					};
-				};
-			};
-		};
-
-		hdmi@54280000 {
-			status = "okay";
-
-			vdd-supply = <&hdmi_vdd_reg>;
-			pll-supply = <&hdmi_pll_reg>;
-			hdmi-supply = <&vdd_hdmi_en>;
-
-			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
-				GPIO_ACTIVE_HIGH>;
-		};
-	};
-
-	gpio@6000d000 {
-		charging-enable-hog {
-			gpio-hog;
-			gpios = <TEGRA_GPIO(R, 6) GPIO_ACTIVE_HIGH>;
-			output-low;
-		};
-	};
-
-	pinmux@70000014 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&state_default>;
-
-		state_default: pinmux {
-			ata {
-				nvidia,pins = "ata";
-				nvidia,function = "ide";
-			};
-
-			atb {
-				nvidia,pins = "atb", "gma", "gme";
-				nvidia,function = "sdio4";
-			};
-
-			atc {
-				nvidia,pins = "atc";
-				nvidia,function = "nand";
-			};
-
-			atd {
-				nvidia,pins = "atd", "ate", "gmb", "spia",
-					"spib", "spic";
-				nvidia,function = "gmi";
-			};
-
-			cdev1 {
-				nvidia,pins = "cdev1";
-				nvidia,function = "plla_out";
-			};
-
-			cdev2 {
-				nvidia,pins = "cdev2";
-				nvidia,function = "pllp_out4";
-			};
-
-			crtp {
-				nvidia,pins = "crtp";
-				nvidia,function = "crt";
-			};
-
-			lm1 {
-				nvidia,pins = "lm1";
-				nvidia,function = "rsvd3";
-			};
-
-			csus {
-				nvidia,pins = "csus";
-				nvidia,function = "vi_sensor_clk";
-			};
-
-			dap1 {
-				nvidia,pins = "dap1";
-				nvidia,function = "dap1";
-			};
-
-			dap2 {
-				nvidia,pins = "dap2";
-				nvidia,function = "dap2";
-			};
-
-			dap3 {
-				nvidia,pins = "dap3";
-				nvidia,function = "dap3";
-			};
-
-			dap4 {
-				nvidia,pins = "dap4";
-				nvidia,function = "dap4";
-			};
-
-			dta {
-				nvidia,pins = "dta", "dtb", "dtc", "dtd", "dte";
-				nvidia,function = "vi";
-			};
-
-			dtf {
-				nvidia,pins = "dtf";
-				nvidia,function = "i2c3";
-			};
-
-			gmc {
-				nvidia,pins = "gmc";
-				nvidia,function = "uartd";
-			};
-
-			gmd {
-				nvidia,pins = "gmd";
-				nvidia,function = "sflash";
-			};
-
-			gpu {
-				nvidia,pins = "gpu";
-				nvidia,function = "pwm";
-			};
-
-			gpu7 {
-				nvidia,pins = "gpu7";
-				nvidia,function = "rtck";
-			};
-
-			gpv {
-				nvidia,pins = "gpv", "slxa";
-				nvidia,function = "pcie";
-			};
-
-			hdint {
-				nvidia,pins = "hdint";
-				nvidia,function = "hdmi";
-			};
-
-			i2cp {
-				nvidia,pins = "i2cp";
-				nvidia,function = "i2cp";
-			};
-
-			irrx {
-				nvidia,pins = "irrx", "irtx";
-				nvidia,function = "uartb";
-			};
-
-			kbca {
-				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
-					"kbce", "kbcf";
-				nvidia,function = "kbc";
-			};
-
-			lcsn {
-				nvidia,pins = "lcsn", "ldc", "lm0", "lpw1",
-					"lsdi", "lvp0";
-				nvidia,function = "rsvd4";
-			};
-
-			ld0 {
-				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
-					"ld5", "ld6", "ld7", "ld8", "ld9",
-					"ld10", "ld11", "ld12", "ld13", "ld14",
-					"ld15", "ld16", "ld17", "ldi", "lhp0",
-					"lhp1", "lhp2", "lhs", "lpp", "lpw0",
-					"lpw2", "lsc0", "lsc1", "lsck", "lsda",
-					"lspi", "lvp1", "lvs";
-				nvidia,function = "displaya";
-			};
-
-			owc {
-				nvidia,pins = "owc", "spdi", "spdo", "uac";
-				nvidia,function = "rsvd2";
-			};
-
-			pmc {
-				nvidia,pins = "pmc";
-				nvidia,function = "pwr_on";
-			};
-
-			rm {
-				nvidia,pins = "rm";
-				nvidia,function = "i2c1";
-			};
-
-			sdb {
-				nvidia,pins = "sdb", "sdc", "sdd", "slxc", "slxk";
-				nvidia,function = "sdio3";
-			};
-
-			sdio1 {
-				nvidia,pins = "sdio1";
-				nvidia,function = "sdio1";
-			};
-
-			slxd {
-				nvidia,pins = "slxd";
-				nvidia,function = "spdif";
-			};
-
-			spid {
-				nvidia,pins = "spid", "spie", "spif";
-				nvidia,function = "spi1";
-			};
-
-			spig {
-				nvidia,pins = "spig", "spih";
-				nvidia,function = "spi2_alt";
-			};
-
-			uaa {
-				nvidia,pins = "uaa", "uab", "uda";
-				nvidia,function = "ulpi";
-			};
-
-			uad {
-				nvidia,pins = "uad";
-				nvidia,function = "irda";
-			};
-
-			uca {
-				nvidia,pins = "uca", "ucb";
-				nvidia,function = "uartc";
-			};
-
-			conf_ata {
-				nvidia,pins = "ata", "atb", "atc", "atd",
-					"cdev1", "cdev2", "dap1", "dap4",
-					"dte", "ddc", "dtf", "gma", "gmc",
-					"gme", "gpu", "gpu7", "gpv", "i2cp",
-					"irrx", "irtx", "pta", "rm", "sdc",
-					"sdd", "slxc", "slxd", "slxk", "spdi",
-					"spdo", "uac", "uad",
-					"uda", "csus";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-			};
-
-			conf_ate {
-				nvidia,pins = "ate", "dap2", "dap3", "gmb", "gmd",
-					"owc", "spia", "spib", "spic",
-					"spid", "spie", "spig", "slxa";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-			};
-
-			conf_ck32 {
-				nvidia,pins = "ck32", "ddrc", "pmca", "pmcb",
-					"pmcc", "pmcd", "pmce", "xm2c", "xm2d";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-			};
-
-			conf_crtp {
-				nvidia,pins = "crtp", "spih";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-			};
-
-			conf_dta {
-				nvidia,pins = "dta", "dtb", "dtc", "dtd";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-			};
-
-			conf_spif {
-				nvidia,pins = "spif";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-			};
-
-			conf_hdint {
-				nvidia,pins = "hdint", "lcsn", "ldc", "lm1",
-					"lpw1", "lsck", "lsda", "lsdi", "lvp0";
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-			};
-
-			conf_kbca {
-				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
-					"kbce", "kbcf", "sdio1", "uaa", "uab",
-					"uca", "ucb";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-			};
-
-			conf_lc {
-				nvidia,pins = "lc", "ls";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-			};
-
-			conf_ld0 {
-				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
-					"ld5", "ld6", "ld7", "ld8", "ld9",
-					"ld10", "ld11", "ld12", "ld13", "ld14",
-					"ld15", "ld16", "ld17", "ldi", "lhp0",
-					"lhp1", "lhp2", "lhs", "lm0", "lpp",
-					"lpw0", "lpw2", "lsc0", "lsc1", "lspi",
-					"lvp1", "lvs", "pmc", "sdb";
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-			};
-
-			conf_ld17_0 {
-				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
-					"ld23_22";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-			};
-
-			drive_sdio1 {
-				nvidia,pins = "drive_sdio1", "drive_ddc", "drive_vi1";
-				nvidia,high-speed-mode = <TEGRA_PIN_DISABLE>;
-				nvidia,schmitt = <TEGRA_PIN_ENABLE>;
-				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_1>;
-				nvidia,pull-down-strength = <31>;
-				nvidia,pull-up-strength = <31>;
-				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
-				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
-			};
-
-			drive_csus {
-				nvidia,pins = "drive_csus";
-				nvidia,high-speed-mode = <TEGRA_PIN_DISABLE>;
-				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
-				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_1>;
-				nvidia,pull-down-strength = <31>;
-				nvidia,pull-up-strength = <31>;
-				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
-				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
-			};
-		};
-
-		state_i2cmux_ddc: pinmux-i2cmux-ddc {
-			ddc {
-				nvidia,pins = "ddc";
-				nvidia,function = "i2c2";
-			};
-
-			pta {
-				nvidia,pins = "pta";
-				nvidia,function = "rsvd4";
-			};
-		};
-
-		state_i2cmux_idle: pinmux-i2cmux-idle {
-			ddc {
-				nvidia,pins = "ddc";
-				nvidia,function = "rsvd4";
-			};
-
-			pta {
-				nvidia,pins = "pta";
-				nvidia,function = "rsvd4";
-			};
-		};
-
-		state_i2cmux_pta: pinmux-i2cmux-pta {
-			ddc {
-				nvidia,pins = "ddc";
-				nvidia,function = "rsvd4";
-			};
-
-			pta {
-				nvidia,pins = "pta";
-				nvidia,function = "i2c2";
-			};
-		};
-	};
-
-	spdif@70002400 {
-		status = "okay";
-
-		nvidia,fixed-parent-rate;
-	};
-
-	i2s@70002800 {
-		status = "okay";
-
-		nvidia,fixed-parent-rate;
-	};
-
-	serial@70006040 {
-		compatible = "nvidia,tegra20-hsuart";
-		reset-names = "serial";
-		/delete-property/ reg-shift;
-		/* GPS BCM4751 */
-	};
-
-	serial@70006200 {
-		compatible = "nvidia,tegra20-hsuart";
-		reset-names = "serial";
-		/delete-property/ reg-shift;
-		status = "okay";
-
-		/* Azurewave AW-NH615 BCM4329B1 */
-		bluetooth {
-			compatible = "brcm,bcm4329-bt";
-
-			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "host-wakeup";
-
-			/* PLLP 216MHz / 16 / 4 */
-			max-speed = <3375000>;
-
-			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
-			clock-names = "txco";
-
-			vbat-supply  = <&vdd_3v3_sys>;
-			vddio-supply = <&vdd_1v8_sys>;
-
-			device-wakeup-gpios = <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
-			shutdown-gpios = <&gpio TEGRA_GPIO(U, 0) GPIO_ACTIVE_HIGH>;
-		};
-	};
-
-	serial@70006300 {
-		/delete-property/ dmas;
-		/delete-property/ dma-names;
-		status = "okay";
-	};
-
-	pwm@7000a000 {
-		status = "okay";
-	};
 
 	i2c@7000c000 {
-		status = "okay";
-		clock-frequency = <400000>;
-
-		/* Aichi AMI306 digital compass */
 		magnetometer@e {
-			compatible = "asahi-kasei,ak8974";
-			reg = <0xe>;
-
-			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(N, 5) IRQ_TYPE_EDGE_RISING>;
-
-			avdd-supply = <&vdd_3v3_sys>;
-			dvdd-supply = <&vdd_1v8_sys>;
-
 			mount-matrix = "-1",  "0",  "0",
 					"0",  "1",  "0",
 					"0",  "0", "-1";
 		};
 
-		wm8903: audio-codec@1a {
-			compatible = "wlf,wm8903";
-			reg = <0x1a>;
-
-			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(X, 3) IRQ_TYPE_EDGE_BOTH>;
-
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			micdet-cfg = <0x83>;
-			micdet-delay = <100>;
-
-			gpio-cfg = <
-				0x00000600 /* DMIC_LR, output */
-				0x00000680 /* DMIC_DAT, input */
-				0x00000000 /* Speaker-enable GPIO, output, low */
-				0xffffffff /* don't touch */
-				0xffffffff /* don't touch */
-			>;
-
-			AVDD-supply  = <&vdd_1v8_sys>;
-			CPVDD-supply = <&vdd_1v8_sys>;
-			DBVDD-supply = <&vdd_1v8_sys>;
-			DCVDD-supply = <&vdd_1v8_sys>;
-		};
-
 		/* Atmel MXT1386 Touchscreen */
 		touchscreen@5b {
 			compatible = "atmel,maxtouch";
@@ -557,33 +31,12 @@ touchscreen@5b {
 		};
 
 		gyroscope@68 {
-			compatible = "invensense,mpu3050";
-			reg = <0x68>;
-
-			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(Z, 4) IRQ_TYPE_EDGE_RISING>;
-
-			vdd-supply    = <&vdd_3v3_sys>;
-			vlogic-supply = <&vdd_1v8_sys>;
-
 			mount-matrix =	 "0",  "1",  "0",
 					"-1",  "0",  "0",
 					 "0",  "0",  "1";
 
 			i2c-gate {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
 				accelerometer@f {
-					compatible = "kionix,kxtf9";
-					reg = <0xf>;
-
-					interrupt-parent = <&gpio>;
-					interrupts = <TEGRA_GPIO(N, 4) IRQ_TYPE_EDGE_RISING>;
-
-					vdd-supply = <&vdd_1v8_sys>;
-					vddio-supply = <&vdd_1v8_sys>;
-
 					mount-matrix =	"-1",  "0",  "0",
 							 "0", "-1",  "0",
 							 "0",  "0", "-1";
@@ -592,461 +45,9 @@ accelerometer@f {
 		};
 	};
 
-	i2c2: i2c@7000c400 {
-		status = "okay";
-		clock-frequency = <100000>;
-	};
-
-	i2c@7000c500 {
-		status = "okay";
-		clock-frequency = <400000>;
-	};
-
-	i2c@7000d000 {
-		status = "okay";
-		clock-frequency = <400000>;
-
-		pmic: pmic@34 {
-			compatible = "ti,tps6586x";
-			reg = <0x34>;
-			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
-
-			ti,system-power-controller;
-
-			#gpio-cells = <2>;
-			gpio-controller;
-
-			sys-supply = <&vdd_5v0_sys>;
-			vin-sm0-supply = <&sys_reg>;
-			vin-sm1-supply = <&sys_reg>;
-			vin-sm2-supply = <&sys_reg>;
-			vinldo01-supply = <&sm2_reg>;
-			vinldo23-supply = <&sm2_reg>;
-			vinldo4-supply = <&sm2_reg>;
-			vinldo678-supply = <&sm2_reg>;
-			vinldo9-supply = <&sm2_reg>;
-
-			regulators {
-				sys_reg: sys {
-					regulator-name = "vdd_sys";
-					regulator-always-on;
-				};
-
-				vdd_core: sm0 {
-					regulator-name = "vdd_sm0,vdd_core";
-					regulator-min-microvolt = <950000>;
-					regulator-max-microvolt = <1300000>;
-					regulator-coupled-with = <&rtc_vdd &vdd_cpu>;
-					regulator-coupled-max-spread = <170000 550000>;
-					regulator-always-on;
-					regulator-boot-on;
-
-					nvidia,tegra-core-regulator;
-				};
-
-				vdd_cpu: sm1 {
-					regulator-name = "vdd_sm1,vdd_cpu";
-					regulator-min-microvolt = <750000>;
-					regulator-max-microvolt = <1125000>;
-					regulator-coupled-with = <&vdd_core &rtc_vdd>;
-					regulator-coupled-max-spread = <550000 550000>;
-					regulator-always-on;
-					regulator-boot-on;
-
-					nvidia,tegra-cpu-regulator;
-				};
-
-				sm2_reg: sm2 {
-					regulator-name = "vdd_sm2,vin_ldo*";
-					regulator-min-microvolt = <3700000>;
-					regulator-max-microvolt = <3700000>;
-					regulator-always-on;
-				};
-
-				/* LDO0 is not connected to anything */
-
-				ldo1 {
-					regulator-name = "vdd_ldo1,avdd_pll*";
-					regulator-min-microvolt = <1100000>;
-					regulator-max-microvolt = <1100000>;
-					regulator-always-on;
-				};
-
-				rtc_vdd: ldo2 {
-					regulator-name = "vdd_ldo2,vdd_rtc";
-					regulator-min-microvolt = <950000>;
-					regulator-max-microvolt = <1300000>;
-					regulator-coupled-with = <&vdd_core &vdd_cpu>;
-					regulator-coupled-max-spread = <170000 550000>;
-					regulator-always-on;
-					regulator-boot-on;
-
-					nvidia,tegra-rtc-regulator;
-				};
-
-				ldo3 {
-					regulator-name = "vdd_ldo3,avdd_usb*";
-					regulator-min-microvolt = <3300000>;
-					regulator-max-microvolt = <3300000>;
-					regulator-always-on;
-				};
-
-				ldo4 {
-					regulator-name = "vdd_ldo4,avdd_osc,vddio_sys";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-				};
-
-				vcore_emmc: ldo5 {
-					regulator-name = "vdd_ldo5,vcore_mmc";
-					regulator-min-microvolt = <2850000>;
-					regulator-max-microvolt = <2850000>;
-					regulator-always-on;
-				};
-
-				ldo6 {
-					regulator-name = "vdd_ldo6,avdd_vdac";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-				};
-
-				hdmi_vdd_reg: ldo7 {
-					regulator-name = "vdd_ldo7,avdd_hdmi,vdd_fuse";
-					regulator-min-microvolt = <3300000>;
-					regulator-max-microvolt = <3300000>;
-				};
-
-				hdmi_pll_reg: ldo8 {
-					regulator-name = "vdd_ldo8,avdd_hdmi_pll";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-				};
-
-				ldo9 {
-					regulator-name = "vdd_ldo9,avdd_2v85,vdd_ddr_rx";
-					regulator-min-microvolt = <2850000>;
-					regulator-max-microvolt = <2850000>;
-					regulator-always-on;
-				};
-
-				ldo_rtc {
-					regulator-name = "vdd_rtc_out,vdd_cell";
-					regulator-min-microvolt = <3300000>;
-					regulator-max-microvolt = <3300000>;
-					regulator-always-on;
-				};
-			};
-		};
-
-		nct1008: temperature-sensor@4c {
-			compatible = "onnn,nct1008";
-			reg = <0x4c>;
-			vcc-supply = <&vdd_3v3_sys>;
-
-			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(N, 6) IRQ_TYPE_EDGE_FALLING>;
-
-			#thermal-sensor-cells = <1>;
-		};
-	};
-
-	pmc@7000e400 {
-		nvidia,invert-interrupt;
-		nvidia,suspend-mode = <1>;
-		nvidia,cpu-pwr-good-time = <2000>;
-		nvidia,cpu-pwr-off-time = <100>;
-		nvidia,core-pwr-good-time = <3845 3845>;
-		nvidia,core-pwr-off-time = <458>;
-		nvidia,sys-clock-req-active-high;
-		core-supply = <&vdd_core>;
-	};
-
-	memory-controller@7000f400 {
-		nvidia,use-ram-code;
-
-		emc-tables@3 {
-			reg = <0x3>;
-
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			emc-table@25000 {
-				reg = <25000>;
-				compatible = "nvidia,tegra20-emc-table";
-				clock-frequency = <25000>;
-				nvidia,emc-registers = <0x00000002 0x00000006
-					0x00000003 0x00000003 0x00000006 0x00000004
-					0x00000002 0x00000009 0x00000003 0x00000003
-					0x00000002 0x00000002 0x00000002 0x00000004
-					0x00000003 0x00000008 0x0000000b 0x0000004d
-					0x00000000 0x00000003 0x00000003 0x00000003
-					0x00000008 0x00000001 0x0000000a 0x00000004
-					0x00000003 0x00000008 0x00000004 0x00000006
-					0x00000002 0x00000068 0x00000000 0x00000003
-					0x00000000 0x00000000 0x00000282 0xa0ae04ae
-					0x00070000 0x00000000 0x00000000 0x00000003
-					0x00000000 0x00000000 0x00000000 0x00000000>;
-			};
-
-			emc-table@50000 {
-				reg = <50000>;
-				compatible = "nvidia,tegra20-emc-table";
-				clock-frequency = <50000>;
-				nvidia,emc-registers = <0x00000003 0x00000007
-					0x00000003 0x00000003 0x00000006 0x00000004
-					0x00000002 0x00000009 0x00000003 0x00000003
-					0x00000002 0x00000002 0x00000002 0x00000005
-					0x00000003 0x00000008 0x0000000b 0x0000009f
-					0x00000000 0x00000003 0x00000003 0x00000003
-					0x00000008 0x00000001 0x0000000a 0x00000007
-					0x00000003 0x00000008 0x00000004 0x00000006
-					0x00000002 0x000000d0 0x00000000 0x00000000
-					0x00000000 0x00000000 0x00000282 0xa0ae04ae
-					0x00070000 0x00000000 0x00000000 0x00000005
-					0x00000000 0x00000000 0x00000000 0x00000000>;
-			};
-
-			emc-table@75000 {
-				reg = <75000>;
-				compatible = "nvidia,tegra20-emc-table";
-				clock-frequency = <75000>;
-				nvidia,emc-registers = <0x00000005 0x0000000a
-					0x00000004 0x00000003 0x00000006 0x00000004
-					0x00000002 0x00000009 0x00000003 0x00000003
-					0x00000002 0x00000002 0x00000002 0x00000005
-					0x00000003 0x00000008 0x0000000b 0x000000ff
-					0x00000000 0x00000003 0x00000003 0x00000003
-					0x00000008 0x00000001 0x0000000a 0x0000000b
-					0x00000003 0x00000008 0x00000004 0x00000006
-					0x00000002 0x00000138 0x00000000 0x00000000
-					0x00000000 0x00000000 0x00000282 0xa0ae04ae
-					0x00070000 0x00000000 0x00000000 0x00000007
-					0x00000000 0x00000000 0x00000000 0x00000000>;
-			};
-
-			emc-table@150000 {
-				reg = <150000>;
-				compatible = "nvidia,tegra20-emc-table";
-				clock-frequency = <150000>;
-				nvidia,emc-registers = <0x00000009 0x00000014
-					0x00000007 0x00000003 0x00000006 0x00000004
-					0x00000002 0x00000009 0x00000003 0x00000003
-					0x00000002 0x00000002 0x00000002 0x00000005
-					0x00000003 0x00000008 0x0000000b 0x0000021f
-					0x00000000 0x00000003 0x00000003 0x00000003
-					0x00000008 0x00000001 0x0000000a 0x00000015
-					0x00000003 0x00000008 0x00000004 0x00000006
-					0x00000002 0x00000270 0x00000000 0x00000001
-					0x00000000 0x00000000 0x00000282 0xa07c04ae
-					0x007dc010 0x00000000 0x00000000 0x0000000e
-					0x00000000 0x00000000 0x00000000 0x00000000>;
-			};
-
-			emc-table@300000 {
-				reg = <300000>;
-				compatible = "nvidia,tegra20-emc-table";
-				clock-frequency = <300000>;
-				nvidia,emc-registers = <0x00000012 0x00000027
-					0x0000000d 0x00000006 0x00000007 0x00000005
-					0x00000003 0x00000009 0x00000006 0x00000006
-					0x00000003 0x00000003 0x00000002 0x00000006
-					0x00000003 0x00000009 0x0000000c 0x0000045f
-					0x00000000 0x00000004 0x00000004 0x00000006
-					0x00000008 0x00000001 0x0000000e 0x0000002a
-					0x00000003 0x0000000f 0x00000007 0x00000005
-					0x00000002 0x000004e0 0x00000005 0x00000002
-					0x00000000 0x00000000 0x00000282 0xe059048b
-					0x007e0010 0x00000000 0x00000000 0x0000001b
-					0x00000000 0x00000000 0x00000000 0x00000000>;
-			};
-
-			lpddr2 {
-				compatible = "elpida,B8132B2PB-6D-F", "jedec,lpddr2-s4";
-				revision-id = <1 0>;
-				density = <2048>;
-				io-width = <16>;
-			};
-		};
-	};
-
-	/* Peripheral USB via ASUS connector */
-	usb@c5000000 {
-		compatible = "nvidia,tegra20-udc";
-		status = "okay";
-		dr_mode = "peripheral";
-	};
-
-	usb-phy@c5000000 {
-		status = "okay";
-		dr_mode = "peripheral";
-		nvidia,xcvr-setup-use-fuses;
-		nvidia,xcvr-lsfslew = <2>;
-		nvidia,xcvr-lsrslew = <2>;
-		vbus-supply = <&vdd_5v0_sys>;
-	};
-
-	/* Dock's USB port */
-	usb@c5008000 {
-		status = "okay";
-	};
-
-	usb-phy@c5008000 {
-		status = "okay";
-		nvidia,xcvr-setup-use-fuses;
-		vbus-supply = <&vdd_5v0_sys>;
-	};
-
-	sdmmc1: mmc@c8000000 {
-		status = "okay";
-
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		assigned-clocks = <&tegra_car TEGRA20_CLK_SDMMC1>;
-		assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_C>;
-		assigned-clock-rates = <40000000>;
-
-		max-frequency = <40000000>;
-		keep-power-in-suspend;
-		bus-width = <4>;
-		non-removable;
-
-		mmc-pwrseq = <&brcm_wifi_pwrseq>;
-		vmmc-supply = <&vdd_3v3_sys>;
-		vqmmc-supply = <&vdd_3v3_sys>;
-
-		/* Azurewave AW-NH615 BCM4329B1 */
-		wifi@1 {
-			compatible = "brcm,bcm4329-fmac";
-			reg = <1>;
-
-			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(S, 0) IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "host-wake";
-		};
-	};
-
-	sdmmc3: mmc@c8000400 {
-		status = "okay";
-		bus-width = <4>;
-		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
-		wp-gpios = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
-		power-gpios = <&gpio TEGRA_GPIO(I, 6) GPIO_ACTIVE_HIGH>;
-		vmmc-supply = <&vdd_3v3_sys>;
-		vqmmc-supply = <&vdd_3v3_sys>;
-	};
-
-	sdmmc4: mmc@c8000600 {
-		status = "okay";
-		bus-width = <8>;
-		vmmc-supply = <&vcore_emmc>;
-		vqmmc-supply = <&vdd_3v3_sys>;
-		non-removable;
-	};
-
-	mains: ac-adapter-detect {
-		compatible = "gpio-charger";
-		charger-type = "mains";
-		gpios = <&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_LOW>;
-	};
-
-	backlight: backlight {
-		compatible = "pwm-backlight";
-
-		enable-gpios = <&gpio TEGRA_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
-		power-supply = <&vdd_3v3_sys>;
-		pwms = <&pwm 2 4000000>;
-
-		brightness-levels = <7 255>;
-		num-interpolated-steps = <248>;
-		default-brightness-level = <20>;
-	};
-
-	/* PMIC has a built-in 32KHz oscillator which is used by PMC */
-	clk32k_in: clock-32k-in {
-		compatible = "fixed-clock";
-		clock-frequency = <32768>;
-		#clock-cells = <0>;
-	};
-
-	cpus {
-		cpu0: cpu@0 {
-			cpu-supply = <&vdd_cpu>;
-			operating-points-v2 = <&cpu0_opp_table>;
-			#cooling-cells = <2>;
-		};
-
-		cpu1: cpu@1 {
-			cpu-supply = <&vdd_cpu>;
-			operating-points-v2 = <&cpu0_opp_table>;
-			#cooling-cells = <2>;
-		};
-	};
-
-	display-panel {
-		compatible = "auo,b101ew05", "panel-lvds";
-
-		/* AUO B101EW05 using custom timings */
-
-		backlight = <&backlight>;
-		ddc-i2c-bus = <&lvds_ddc>;
-		power-supply = <&vdd_pnl_reg>;
-
-		width-mm = <218>;
-		height-mm = <135>;
-
-		data-mapping = "jeida-18";
-
-		panel-timing {
-			clock-frequency = <71200000>;
-			hactive = <1280>;
-			vactive = <800>;
-			hfront-porch = <8>;
-			hback-porch = <18>;
-			hsync-len = <184>;
-			vsync-len = <3>;
-			vfront-porch = <4>;
-			vback-porch = <8>;
-		};
-
-		port {
-			panel_input: endpoint {
-				remote-endpoint = <&lvds_encoder_output>;
-			};
-		};
-	};
-
-	gpio-keys {
+	extcon-keys {
 		compatible = "gpio-keys";
 
-		key-power {
-			label = "Power";
-			gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_POWER>;
-			debounce-interval = <10>;
-			wakeup-event-action = <EV_ACT_ASSERTED>;
-			wakeup-source;
-		};
-
-		key-volume-down {
-			label = "Volume Down";
-			gpios = <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_VOLUMEDOWN>;
-			debounce-interval = <10>;
-			wakeup-event-action = <EV_ACT_ASSERTED>;
-			wakeup-source;
-		};
-
-		key-volume-up {
-			label = "Volume Up";
-			gpios = <&gpio TEGRA_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_VOLUMEUP>;
-			debounce-interval = <10>;
-			wakeup-event-action = <EV_ACT_ASSERTED>;
-			wakeup-source;
-		};
-
 		switch-dock-hall-sensor {
 			label = "Lid";
 			gpios = <&gpio TEGRA_GPIO(S, 4) GPIO_ACTIVE_LOW>;
@@ -1057,253 +58,4 @@ switch-dock-hall-sensor {
 			wakeup-source;
 		};
 	};
-
-	i2cmux {
-		compatible = "i2c-mux-pinctrl";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		i2c-parent = <&i2c2>;
-
-		pinctrl-names = "ddc", "pta", "idle";
-		pinctrl-0 = <&state_i2cmux_ddc>;
-		pinctrl-1 = <&state_i2cmux_pta>;
-		pinctrl-2 = <&state_i2cmux_idle>;
-
-		hdmi_ddc: i2c@0 {
-			reg = <0>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-		};
-
-		lvds_ddc: i2c@1 {
-			reg = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			smart-battery@b {
-				compatible = "ti,bq20z75", "sbs,sbs-battery";
-				reg = <0xb>;
-				sbs,i2c-retry-count = <2>;
-				sbs,poll-retry-count = <10>;
-				power-supplies = <&mains>;
-			};
-
-			/* Dynaimage ambient light sensor */
-			light-sensor@1c {
-				compatible = "dynaimage,al3000a";
-				reg = <0x1c>;
-
-				interrupt-parent = <&gpio>;
-				interrupts = <TEGRA_GPIO(Z, 2) IRQ_TYPE_LEVEL_HIGH>;
-
-				vdd-supply = <&vdd_1v8_sys>;
-			};
-		};
-	};
-
-	lvds-encoder {
-		compatible = "ti,sn75lvds83", "lvds-encoder";
-
-		powerdown-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_LOW>;
-		power-supply = <&vdd_3v3_sys>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				lvds_encoder_input: endpoint {
-					remote-endpoint = <&lcd_output>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				lvds_encoder_output: endpoint {
-					remote-endpoint = <&panel_input>;
-				};
-			};
-		};
-	};
-
-	opp-table-emc {
-		/delete-node/ opp-666000000;
-		/delete-node/ opp-760000000;
-	};
-
-	vdd_5v0_sys: regulator-5v0 {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_5v0";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-always-on;
-	};
-
-	vdd_3v3_sys: regulator-3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_3v3_vs";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-		vin-supply = <&vdd_5v0_sys>;
-	};
-
-	regulator-pcie {
-		compatible = "regulator-fixed";
-		regulator-name = "pcie_vdd";
-		regulator-min-microvolt = <1500000>;
-		regulator-max-microvolt = <1500000>;
-		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
-		regulator-always-on;
-	};
-
-	vdd_pnl_reg: regulator-panel {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_pnl";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-		gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
-	vdd_1v8_sys: regulator-1v8 {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_1v8_vs";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-		vin-supply = <&vdd_5v0_sys>;
-	};
-
-	vdd_hdmi_en: regulator-hdmi {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_5v0_hdmi_en";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-always-on;
-		vin-supply = <&vdd_5v0_sys>;
-		gpio = <&gpio TEGRA_GPIO(V, 5) GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
-	sound {
-		compatible = "asus,tegra-audio-wm8903-tf101",
-			     "nvidia,tegra-audio-wm8903";
-		nvidia,model = "Asus EeePad Transformer WM8903";
-
-		nvidia,audio-routing =
-			"Headphone Jack", "HPOUTR",
-			"Headphone Jack", "HPOUTL",
-			"Int Spk", "ROP",
-			"Int Spk", "RON",
-			"Int Spk", "LOP",
-			"Int Spk", "LON",
-			"IN2L", "Mic Jack",
-			"DMICDAT", "Int Mic";
-
-		nvidia,i2s-controller = <&tegra_i2s1>;
-		nvidia,audio-codec = <&wm8903>;
-
-		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
-		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
-		nvidia,mic-det-gpios = <&gpio TEGRA_GPIO(X, 1) GPIO_ACTIVE_LOW>;
-		nvidia,coupled-mic-hp-det;
-
-		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
-			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
-			 <&tegra_car TEGRA20_CLK_CDEV1>;
-		clock-names = "pll_a", "pll_a_out0", "mclk";
-	};
-
-	thermal-zones {
-		/*
-		 * NCT1008 has two sensors:
-		 *
-		 *	0: internal that monitors ambient/skin temperature
-		 *	1: external that is connected to the CPU's diode
-		 *
-		 * Ideally we should use userspace thermal governor,
-		 * but it's a much more complex solution.  The "skin"
-		 * zone is a simpler solution which prevents TF101 from
-		 * getting too hot from a user's tactile perspective.
-		 * The CPU zone is intended to protect silicon from damage.
-		 */
-
-		skin-thermal {
-			polling-delay-passive = <1000>; /* milliseconds */
-			polling-delay = <5000>; /* milliseconds */
-
-			thermal-sensors = <&nct1008 0>;
-
-			trips {
-				trip0: skin-alert {
-					/* start throttling at 60C */
-					temperature = <60000>;
-					hysteresis = <200>;
-					type = "passive";
-				};
-
-				trip1: skin-crit {
-					/* shut down at 70C */
-					temperature = <70000>;
-					hysteresis = <2000>;
-					type = "critical";
-				};
-			};
-
-			cooling-maps {
-				map0 {
-					trip = <&trip0>;
-					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-			};
-		};
-
-		cpu-thermal {
-			polling-delay-passive = <1000>; /* milliseconds */
-			polling-delay = <5000>; /* milliseconds */
-
-			thermal-sensors = <&nct1008 1>;
-
-			trips {
-				trip2: cpu-alert {
-					/* throttle at 85C until temperature drops to 84.8C */
-					temperature = <85000>;
-					hysteresis = <200>;
-					type = "passive";
-				};
-
-				trip3: cpu-crit {
-					/* shut down at 90C */
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "critical";
-				};
-			};
-
-			cooling-maps {
-				map1 {
-					trip = <&trip2>;
-					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-			};
-		};
-	};
-
-	brcm_wifi_pwrseq: wifi-pwrseq {
-		compatible = "mmc-pwrseq-simple";
-
-		clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
-		clock-names = "ext_clock";
-
-		reset-gpios = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_LOW>;
-		post-power-on-delay-ms = <200>;
-		power-off-delay-us = <200>;
-	};
 };
diff --git a/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi
new file mode 100644
index 000000000000..b48f53c00efa
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi
@@ -0,0 +1,1268 @@
+// SPDX-License-Identifier: GPL-2.0
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
+				port {
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
+
+			atb {
+				nvidia,pins = "atb", "gma", "gme";
+				nvidia,function = "sdio4";
+			};
+
+			atc {
+				nvidia,pins = "atc";
+				nvidia,function = "nand";
+			};
+
+			atd {
+				nvidia,pins = "atd", "ate", "gmb", "spia",
+					"spib", "spic";
+				nvidia,function = "gmi";
+			};
+
+			cdev1 {
+				nvidia,pins = "cdev1";
+				nvidia,function = "plla_out";
+			};
+
+			cdev2 {
+				nvidia,pins = "cdev2";
+				nvidia,function = "pllp_out4";
+			};
+
+			crtp {
+				nvidia,pins = "crtp";
+				nvidia,function = "crt";
+			};
+
+			lm1 {
+				nvidia,pins = "lm1";
+				nvidia,function = "rsvd3";
+			};
+
+			csus {
+				nvidia,pins = "csus";
+				nvidia,function = "vi_sensor_clk";
+			};
+
+			dap1 {
+				nvidia,pins = "dap1";
+				nvidia,function = "dap1";
+			};
+
+			dap2 {
+				nvidia,pins = "dap2";
+				nvidia,function = "dap2";
+			};
+
+			dap3 {
+				nvidia,pins = "dap3";
+				nvidia,function = "dap3";
+			};
+
+			dap4 {
+				nvidia,pins = "dap4";
+				nvidia,function = "dap4";
+			};
+
+			dta {
+				nvidia,pins = "dta", "dtb", "dtc", "dtd", "dte";
+				nvidia,function = "vi";
+			};
+
+			dtf {
+				nvidia,pins = "dtf";
+				nvidia,function = "i2c3";
+			};
+
+			gmc {
+				nvidia,pins = "gmc";
+				nvidia,function = "uartd";
+			};
+
+			gmd {
+				nvidia,pins = "gmd";
+				nvidia,function = "sflash";
+			};
+
+			gpu {
+				nvidia,pins = "gpu";
+				nvidia,function = "pwm";
+			};
+
+			gpu7 {
+				nvidia,pins = "gpu7";
+				nvidia,function = "rtck";
+			};
+
+			gpv {
+				nvidia,pins = "gpv", "slxa";
+				nvidia,function = "pcie";
+			};
+
+			hdint {
+				nvidia,pins = "hdint";
+				nvidia,function = "hdmi";
+			};
+
+			i2cp {
+				nvidia,pins = "i2cp";
+				nvidia,function = "i2cp";
+			};
+
+			irrx {
+				nvidia,pins = "irrx", "irtx";
+				nvidia,function = "uartb";
+			};
+
+			kbca {
+				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
+					"kbce", "kbcf";
+				nvidia,function = "kbc";
+			};
+
+			lcsn {
+				nvidia,pins = "lcsn", "ldc", "lm0", "lpw1",
+					"lsdi", "lvp0";
+				nvidia,function = "rsvd4";
+			};
+
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
+
+			owc {
+				nvidia,pins = "owc", "spdi", "spdo", "uac";
+				nvidia,function = "rsvd2";
+			};
+
+			pmc {
+				nvidia,pins = "pmc";
+				nvidia,function = "pwr_on";
+			};
+
+			rm {
+				nvidia,pins = "rm";
+				nvidia,function = "i2c1";
+			};
+
+			sdb {
+				nvidia,pins = "sdb", "sdc", "sdd", "slxc", "slxk";
+				nvidia,function = "sdio3";
+			};
+
+			sdio1 {
+				nvidia,pins = "sdio1";
+				nvidia,function = "sdio1";
+			};
+
+			slxd {
+				nvidia,pins = "slxd";
+				nvidia,function = "spdif";
+			};
+
+			spid {
+				nvidia,pins = "spid", "spie", "spif";
+				nvidia,function = "spi1";
+			};
+
+			spig {
+				nvidia,pins = "spig", "spih";
+				nvidia,function = "spi2_alt";
+			};
+
+			uaa {
+				nvidia,pins = "uaa", "uab", "uda";
+				nvidia,function = "ulpi";
+			};
+
+			uad {
+				nvidia,pins = "uad";
+				nvidia,function = "irda";
+			};
+
+			uca {
+				nvidia,pins = "uca", "ucb";
+				nvidia,function = "uartc";
+			};
+
+			conf-ata {
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
+
+			conf-ate {
+				nvidia,pins = "ate", "dap2", "dap3", "gmb", "gmd",
+					"owc", "spia", "spib", "spic",
+					"spid", "spie", "spig", "slxa";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+
+			conf-ck32 {
+				nvidia,pins = "ck32", "ddrc", "pmca", "pmcb",
+					"pmcc", "pmcd", "pmce", "xm2c", "xm2d";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			};
+
+			conf-crtp {
+				nvidia,pins = "crtp", "spih";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+
+			conf-dta {
+				nvidia,pins = "dta", "dtb", "dtc", "dtd";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
+			conf-spif {
+				nvidia,pins = "spif";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+
+			conf-hdint {
+				nvidia,pins = "hdint", "lcsn", "ldc", "lm1",
+					"lpw1", "lsck", "lsda", "lsdi", "lvp0";
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+
+			conf-kbca {
+				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
+					"kbce", "kbcf", "sdio1", "uaa", "uab",
+					"uca", "ucb";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
+			conf-lc {
+				nvidia,pins = "lc", "ls";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			};
+
+			conf-ld0 {
+				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
+					"ld5", "ld6", "ld7", "ld8", "ld9",
+					"ld10", "ld11", "ld12", "ld13", "ld14",
+					"ld15", "ld16", "ld17", "ldi", "lhp0",
+					"lhp1", "lhp2", "lhs", "lm0", "lpp",
+					"lpw0", "lpw2", "lsc0", "lsc1", "lspi",
+					"lvp1", "lvs", "pmc", "sdb";
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
+			conf-ld17-0 {
+				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
+					"ld23_22";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			};
+
+			drive-sdio1 {
+				nvidia,pins = "drive_sdio1", "drive_ddc", "drive_vi1";
+				nvidia,high-speed-mode = <TEGRA_PIN_DISABLE>;
+				nvidia,schmitt = <TEGRA_PIN_ENABLE>;
+				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_1>;
+				nvidia,pull-down-strength = <31>;
+				nvidia,pull-up-strength = <31>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
+			};
+
+			drive-csus {
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
+		state_i2cmux_ddc: pinmux-i2cmux-ddc {
+			ddc {
+				nvidia,pins = "ddc";
+				nvidia,function = "i2c2";
+			};
+
+			pta {
+				nvidia,pins = "pta";
+				nvidia,function = "rsvd4";
+			};
+		};
+
+		state_i2cmux_idle: pinmux-i2cmux-idle {
+			ddc {
+				nvidia,pins = "ddc";
+				nvidia,function = "rsvd4";
+			};
+
+			pta {
+				nvidia,pins = "pta";
+				nvidia,function = "rsvd4";
+			};
+		};
+
+		state_i2cmux_pta: pinmux-i2cmux-pta {
+			ddc {
+				nvidia,pins = "ddc";
+				nvidia,function = "rsvd4";
+			};
+
+			pta {
+				nvidia,pins = "pta";
+				nvidia,function = "i2c2";
+			};
+		};
+	};
+
+	spdif@70002400 {
+		status = "okay";
+
+		nvidia,fixed-parent-rate;
+	};
+
+	i2s@70002800 {
+		status = "okay";
+
+		nvidia,fixed-parent-rate;
+	};
+
+	serial@70006040 {
+		compatible = "nvidia,tegra20-hsuart";
+		reset-names = "serial";
+		/delete-property/ reg-shift;
+		/* GPS BCM4751 */
+	};
+
+	serial@70006200 {
+		compatible = "nvidia,tegra20-hsuart";
+		reset-names = "serial";
+		/delete-property/ reg-shift;
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
+			shutdown-gpios = <&gpio TEGRA_GPIO(U, 0) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	serial@70006300 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
+		status = "okay";
+	};
+
+	pwm@7000a000 {
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
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(N, 5) IRQ_TYPE_EDGE_RISING>;
+
+			avdd-supply = <&vdd_3v3_sys>;
+			dvdd-supply = <&vdd_1v8_sys>;
+		};
+
+		wm8903: audio-codec@1a {
+			compatible = "wlf,wm8903";
+			reg = <0x1a>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(X, 3) IRQ_TYPE_EDGE_BOTH>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			micdet-cfg = <0x83>;
+			micdet-delay = <100>;
+
+			gpio-cfg = <
+				0x00000600 /* DMIC_LR, output */
+				0x00000680 /* DMIC_DAT, input */
+				0x00000000 /* Speaker-enable GPIO, output, low */
+				0xffffffff /* don't touch */
+				0xffffffff /* don't touch */
+			>;
+
+			AVDD-supply  = <&vdd_1v8_sys>;
+			CPVDD-supply = <&vdd_1v8_sys>;
+			DBVDD-supply = <&vdd_1v8_sys>;
+			DCVDD-supply = <&vdd_1v8_sys>;
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
+	memory-controller@7000f400 {
+		nvidia,use-ram-code;
+
+		emc-tables@3 {
+			reg = <0x3>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
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
+
+			lpddr2 {
+				compatible = "elpida,B8132B2PB-6D-F", "jedec,lpddr2-s4";
+				revision-id = <1 0>;
+				density = <2048>;
+				io-width = <16>;
+			};
+		};
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
+	display-panel {
+		compatible = "auo,b101ew05", "panel-lvds";
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
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-power {
+			label = "Power";
+			gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		key-volume-down {
+			label = "Volume Down";
+			gpios = <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&gpio TEGRA_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
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
+
+			/* Dynaimage ambient light sensor */
+			light-sensor@1c {
+				compatible = "dynaimage,al3000a";
+				reg = <0x1c>;
+
+				interrupt-parent = <&gpio>;
+				interrupts = <TEGRA_GPIO(Z, 2) IRQ_TYPE_LEVEL_HIGH>;
+
+				vdd-supply = <&vdd_1v8_sys>;
+			};
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
+	opp-table-emc {
+		/delete-node/ opp-666000000;
+		/delete-node/ opp-760000000;
+	};
+
+	vdd_5v0_sys: regulator-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	vdd_3v3_sys: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3_vs";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	regulator-pcie {
+		compatible = "regulator-fixed";
+		regulator-name = "pcie_vdd";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+	};
+
+	vdd_pnl_reg: regulator-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_pnl";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vdd_1v8_sys: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_vs";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	vdd_hdmi_en: regulator-hdmi {
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
+			"IN2L", "Mic Jack",
+			"DMICDAT", "Int Mic";
+
+		nvidia,i2s-controller = <&tegra_i2s1>;
+		nvidia,audio-codec = <&wm8903>;
+
+		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
+		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
+		nvidia,mic-det-gpios = <&gpio TEGRA_GPIO(X, 1) GPIO_ACTIVE_LOW>;
+		nvidia,coupled-mic-hp-det;
+
+		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA20_CLK_CDEV1>;
+		clock-names = "pll_a", "pll_a_out0", "mclk";
+	};
+
+	thermal-zones {
+		/*
+		 * NCT1008 has two sensors:
+		 *
+		 *	0: internal that monitors ambient/skin temperature
+		 *	1: external that is connected to the CPU's diode
+		 *
+		 * Ideally we should use userspace thermal governor,
+		 * but it's a much more complex solution.  The "skin"
+		 * zone is a simpler solution which prevents TF101 from
+		 * getting too hot from a user's tactile perspective.
+		 * The CPU zone is intended to protect silicon from damage.
+		 */
+
+		skin-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&nct1008 0>;
+
+			trips {
+				trip0: skin-alert {
+					/* start throttling at 60C */
+					temperature = <60000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+
+				trip1: skin-crit {
+					/* shut down at 70C */
+					temperature = <70000>;
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
+
+		cpu-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&nct1008 1>;
+
+			trips {
+				trip2: cpu-alert {
+					/* throttle at 85C until temperature drops to 84.8C */
+					temperature = <85000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+
+				trip3: cpu-crit {
+					/* shut down at 90C */
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map1 {
+					trip = <&trip2>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
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
+};
-- 
2.48.1



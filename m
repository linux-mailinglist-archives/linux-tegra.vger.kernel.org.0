Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D853D46D9EF
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Dec 2021 18:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238202AbhLHRlp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 Dec 2021 12:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238112AbhLHRlj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Dec 2021 12:41:39 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5DAC061D5F;
        Wed,  8 Dec 2021 09:38:06 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id l22so7018932lfg.7;
        Wed, 08 Dec 2021 09:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F/9kk4jGqOtanTMKtcX+ETuTPmqQu9E+LgGZrXbf8fE=;
        b=aHSt7Ufg9WY3deSayIacXkx0jAljG7+5CuSXsCl7DfDd/HkoX7HhjFg+iYQrD7zrfE
         S0BQXlGfBViUVMYx8y+2n40cOYDSYhO97GUT/dGpPwnkYcBJnDrexaHiCAuBKMOOnAQk
         eZkNLJFe5kpAMmjzOugB8arCpYolbpVaDHe9DaivFcd2OTmVzOqCUELeOuRIGa6n37zN
         /nNC2mizGhKsXV26y04oq59mOlnCxRpyO7V6bV9lSZsuPNopHk5x5lVvVnhEr2zMXaHC
         ECjXeQzqht4StFtOqoBiGE87idW6h9G66XXXZ46tWvxwH8fvlDOqmGBiUgtGcsACaLP4
         R0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F/9kk4jGqOtanTMKtcX+ETuTPmqQu9E+LgGZrXbf8fE=;
        b=ZlOcXEOP6eDd7GhCupif4DdFFp1Jlrn1QJ7eMCiXNNvNr7BcncGUnySX0Pe3BX8ip7
         WxLPkhamsutXFpzRXRkPhy/urOhJg6R+WFqh2dtxq4LWkT4rGDp5DUMGFEL3Snu1xPVN
         a262r3Yfn6KSh78oImXwBZyt1WRHW1lU4Dj/D9SweSm9w+J24fC9OwOW3zKi0+vCWRt3
         6zHx7ypbZRPceiVSgxPfe4FKljooDyKLmh4oBPx58w6RCvMoes3D16HJMPxXq7jwqYYq
         lUsCpgdWd15vPulXY4T19u958eGJwN0y8lJ+lJNBlTMNcDF0QuiSY+oRx83uzN6WVvsb
         ld4A==
X-Gm-Message-State: AOAM532vHA3Ojytf1xGD056WMNv3jFVGtctuZ94brcS3ugpkZkaWNI3E
        piQyPm4bCk84p9JUqQqiC5k=
X-Google-Smtp-Source: ABdhPJxF1i+YZIsrAcxoYNn31x48voz1Fkw/pEyDnoVsac/t+8jI5xX0HSfrV+/oaRA6gjALZ7NwlA==
X-Received: by 2002:a05:6512:3c9e:: with SMTP id h30mr849984lfv.212.1638985084055;
        Wed, 08 Dec 2021 09:38:04 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.gmail.com with ESMTPSA id a25sm349159lfm.250.2021.12.08.09.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:38:03 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
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
        Thomas Graichen <thomas.graichen@gmail.com>,
        Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/24] ARM: tegra: Add common device-tree base for Tegra30 ASUS Transformers
Date:   Wed,  8 Dec 2021 20:35:51 +0300
Message-Id: <20211208173609.4064-7-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211208173609.4064-1-digetx@gmail.com>
References: <20211208173609.4064-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Svyatoslav Ryhel <clamor95@gmail.com>

Add common DTSI for Tegra30 ASUS Transformers. It will be used by multiple
device-trees of ASUS devices. The common part initially was born out of
the ASUS TF300T tablet's device-tree that was created by Michał Mirosław.
It was heavily reworked and improved by Svyatoslav Ryhel, Maxim Schwalm,
Ion Agorria et al.

[digetx@gmail.com: factored out common part into separate patch and wrote commit message]
Co-developed-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Ion Agorria <ion@agorria.com>
Co-developed-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Co-developed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../dts/tegra30-asus-transformer-common.dtsi  | 1729 +++++++++++++++++
 1 file changed, 1729 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi

diff --git a/arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi b/arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi
new file mode 100644
index 000000000000..be77212dd8c7
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi
@@ -0,0 +1,1729 @@
+// SPDX-License-Identifier: GPL-2.0
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
+	chassis-type = "convertible";
+
+	aliases {
+		mmc0 = &sdmmc4;	/* eMMC */
+		mmc1 = &sdmmc1; /* uSD slot */
+		mmc2 = &sdmmc3; /* WiFi */
+
+		rtc0 = &pmic;
+		rtc1 = "/rtc@7000e000";
+
+		display0 = &lcd;
+		display1 = &hdmi;
+
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
+			size = <0x10000000>;		/* 256MiB */
+			linux,cma-default;
+			reusable;
+		};
+
+		ramoops@beb00000 {
+			compatible = "ramoops";
+			reg = <0xbeb00000 0x10000>;	/* 64kB */
+			console-size = <0x8000>;	/* 32kB */
+			record-size = <0x400>;		/*  1kB */
+			ecc-size = <16>;
+		};
+
+		trustzone@bfe00000 {
+			reg = <0xbfe00000 0x200000>;	/* 2MB */
+			no-map;
+		};
+	};
+
+	host1x@50000000 {
+		hdmi: hdmi@54280000 {
+			status = "okay";
+
+			hdmi-supply = <&hdmi_5v0_sys>;
+			pll-supply = <&vdd_1v8_vio>;
+			vdd-supply = <&vdd_3v3_sys>;
+
+			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+		};
+	};
+
+	gpio@6000d000 {
+		init-lpm-in-hog {
+			gpio-hog;
+			gpios = <TEGRA_GPIO(I, 6) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(B, 1) GPIO_ACTIVE_HIGH>;
+			input;
+		};
+
+		init-lpm-out-hog {
+			gpio-hog;
+			gpios = <TEGRA_GPIO(K, 7) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
+			output-low;
+		};
+
+		usb-charge-limit-hog {
+			gpio-hog;
+			gpios = <TEGRA_GPIO(R, 1) GPIO_ACTIVE_LOW>;
+			output-high;
+		};
+	};
+
+	vde@6001a000 {
+		assigned-clocks = <&tegra_car TEGRA30_CLK_VDE>;
+		assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_P>;
+		assigned-clock-rates = <408000000>;
+	};
+
+	pinmux@70000868 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&state_default>;
+
+		state_default: pinmux {
+			/* SDMMC1 pinmux */
+			sdmmc1_clk {
+				nvidia,pins = "sdmmc1_clk_pz0";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc1_cmd {
+				nvidia,pins = "sdmmc1_dat3_py4",
+						"sdmmc1_dat2_py5",
+						"sdmmc1_dat1_py6",
+						"sdmmc1_dat0_py7",
+						"sdmmc1_cmd_pz1";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc1_cd {
+				nvidia,pins = "gmi_iordy_pi5";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc1_wp {
+				nvidia,pins = "vi_d11_pt3";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* SDMMC2 pinmux */
+			vi_d1_pd5 {
+				nvidia,pins = "vi_d1_pd5",
+						"vi_d2_pl0",
+						"vi_d3_pl1",
+						"vi_d5_pl3",
+						"vi_d7_pl5";
+				nvidia,function = "sdmmc2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			vi_d8_pl6 {
+				nvidia,pins = "vi_d8_pl6",
+						"vi_d9_pl7";
+				nvidia,function = "sdmmc2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+				nvidia,ioreset = <0>;
+			};
+
+			/* SDMMC3 pinmux */
+			sdmmc3_clk {
+				nvidia,pins = "sdmmc3_clk_pa6";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc3_cmd {
+				nvidia,pins = "sdmmc3_cmd_pa7",
+						"sdmmc3_dat0_pb7",
+						"sdmmc3_dat1_pb6",
+						"sdmmc3_dat2_pb5",
+						"sdmmc3_dat3_pb4",
+						"sdmmc3_dat4_pd1",
+						"sdmmc3_dat5_pd0",
+						"sdmmc3_dat6_pd3",
+						"sdmmc3_dat7_pd4";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* SDMMC4 pinmux */
+			sdmmc4_clk {
+				nvidia,pins = "sdmmc4_clk_pcc4";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc4_cmd {
+				nvidia,pins = "sdmmc4_cmd_pt7",
+						"sdmmc4_dat0_paa0",
+						"sdmmc4_dat1_paa1",
+						"sdmmc4_dat2_paa2",
+						"sdmmc4_dat3_paa3",
+						"sdmmc4_dat4_paa4",
+						"sdmmc4_dat5_paa5",
+						"sdmmc4_dat6_paa6",
+						"sdmmc4_dat7_paa7";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc4_rst_n {
+				nvidia,pins = "sdmmc4_rst_n_pcc3";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			cam_mclk {
+				nvidia,pins = "cam_mclk_pcc0";
+				nvidia,function = "vi_alt3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			drive_sdmmc4 {
+				nvidia,pins = "drive_gma",
+						"drive_gmb",
+						"drive_gmc",
+						"drive_gmd";
+				nvidia,pull-down-strength = <9>;
+				nvidia,pull-up-strength = <9>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
+			};
+
+			/* I2C pinmux */
+			gen1_i2c {
+				nvidia,pins = "gen1_i2c_scl_pc4",
+						"gen1_i2c_sda_pc5";
+				nvidia,function = "i2c1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+			};
+			gen2_i2c {
+				nvidia,pins = "gen2_i2c_scl_pt5",
+						"gen2_i2c_sda_pt6";
+				nvidia,function = "i2c2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+			};
+			cam_i2c {
+				nvidia,pins = "cam_i2c_scl_pbb1",
+						"cam_i2c_sda_pbb2";
+				nvidia,function = "i2c3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+			};
+			ddc_i2c {
+				nvidia,pins = "ddc_scl_pv4",
+						"ddc_sda_pv5";
+				nvidia,function = "i2c4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+			};
+			pwr_i2c {
+				nvidia,pins = "pwr_i2c_scl_pz6",
+						"pwr_i2c_sda_pz7";
+				nvidia,function = "i2cpwr";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+			};
+			hotplug_i2c {
+				nvidia,pins = "pu4";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* HDMI pinmux */
+			hdmi_cec {
+				nvidia,pins = "hdmi_cec_pee3";
+				nvidia,function = "cec";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+			};
+			hdmi_hpd {
+				nvidia,pins = "hdmi_int_pn7";
+				nvidia,function = "hdmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* UART-A */
+			ulpi_data0_po1 {
+				nvidia,pins = "ulpi_data0_po1";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ulpi_data1_po2 {
+				nvidia,pins = "ulpi_data1_po2";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			ulpi_data5_po6 {
+				nvidia,pins = "ulpi_data5_po6";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			ulpi_data7_po0 {
+				nvidia,pins = "ulpi_data7_po0",
+						"ulpi_data2_po3",
+						"ulpi_data3_po4",
+						"ulpi_data4_po5",
+						"ulpi_data6_po7";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* UART-B */
+			uartb_txd_rts {
+				nvidia,pins = "uart2_txd_pc2",
+						"uart2_rts_n_pj6";
+				nvidia,function = "uartb";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			uartb_rxd_cts {
+				nvidia,pins = "uart2_rxd_pc3",
+						"uart2_cts_n_pj5";
+				nvidia,function = "uartb";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* UART-C */
+			uartc_rxd_cts {
+				nvidia,pins = "uart3_cts_n_pa1",
+						"uart3_rxd_pw7";
+				nvidia,function = "uartc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			uartc_txd_rts {
+				nvidia,pins = "uart3_rts_n_pc0",
+						"uart3_txd_pw6";
+				nvidia,function = "uartc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* UART-D */
+			ulpi_nxt_py2 {
+				nvidia,pins = "ulpi_nxt_py2";
+				nvidia,function = "uartd";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			ulpi_clk_py0 {
+				nvidia,pins = "ulpi_clk_py0",
+						"ulpi_dir_py1",
+						"ulpi_stp_py3";
+				nvidia,function = "uartd";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* I2S pinmux */
+			dap_i2s0 {
+				nvidia,pins = "dap1_fs_pn0",
+						"dap1_din_pn1",
+						"dap1_dout_pn2",
+						"dap1_sclk_pn3";
+				nvidia,function = "i2s0";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap_i2s1 {
+				nvidia,pins = "dap2_fs_pa2",
+						"dap2_sclk_pa3",
+						"dap2_din_pa4",
+						"dap2_dout_pa5";
+				nvidia,function = "i2s1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap3_fs {
+				nvidia,pins = "dap3_fs_pp0",
+						"dap3_din_pp1";
+				nvidia,function = "i2s2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap3_dout {
+				nvidia,pins = "dap3_dout_pp2",
+						"dap3_sclk_pp3";
+				nvidia,function = "i2s2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap_i2s3 {
+				nvidia,pins = "dap4_fs_pp4",
+						"dap4_din_pp5",
+						"dap4_dout_pp6",
+						"dap4_sclk_pp7";
+				nvidia,function = "i2s3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Sensors pinmux */
+			nct_irq {
+				nvidia,pins = "pcc2";
+				nvidia,function = "i2s4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Asus EC pinmux */
+			ec_irqs {
+				nvidia,pins = "kb_row10_ps2",
+						"kb_row15_ps7";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			ec_reqs {
+				nvidia,pins = "kb_col1_pq1";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Memory type bootstrap */
+			mem_boostraps {
+				nvidia,pins = "gmi_ad4_pg4",
+						"gmi_ad5_pg5";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* PCI-e pinmux */
+			pex_l2_rst_n {
+				nvidia,pins = "pex_l2_rst_n_pcc6",
+						"pex_l0_rst_n_pdd1",
+						"pex_l1_rst_n_pdd5";
+				nvidia,function = "pcie";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pex_l2_clkreq_n {
+				nvidia,pins = "pex_l2_clkreq_n_pcc7",
+						"pex_l0_prsnt_n_pdd0",
+						"pex_l0_clkreq_n_pdd2",
+						"pex_wake_n_pdd3",
+						"pex_l1_prsnt_n_pdd4",
+						"pex_l1_clkreq_n_pdd6",
+						"pex_l2_prsnt_n_pdd7";
+				nvidia,function = "pcie";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* SPI pinmux */
+			spi1_mosi_px4 {
+				nvidia,pins = "spi1_mosi_px4",
+						"spi1_sck_px5",
+						"spi1_cs0_n_px6",
+						"spi1_miso_px7";
+				nvidia,function = "spi1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			spi2_cs1_n_pw2 {
+				nvidia,pins = "spi2_cs1_n_pw2";
+				nvidia,function = "spi2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			spi2_sck_px2 {
+				nvidia,pins = "spi2_sck_px2";
+				nvidia,function = "spi2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi_a17_pb0 {
+				nvidia,pins = "gmi_a17_pb0",
+						"gmi_a16_pj7";
+				nvidia,function = "spi4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_a18_pb1 {
+				nvidia,pins = "gmi_a18_pb1";
+				nvidia,function = "spi4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi_a19_pk7 {
+				nvidia,pins = "gmi_a19_pk7";
+				nvidia,function = "spi4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Display A pinmux */
+			lcd_pwr0_pb2 {
+				nvidia,pins = "lcd_pwr0_pb2",
+						"lcd_pclk_pb3",
+						"lcd_pwr1_pc1",
+						"lcd_d0_pe0",
+						"lcd_d1_pe1",
+						"lcd_d2_pe2",
+						"lcd_d3_pe3",
+						"lcd_d4_pe4",
+						"lcd_d5_pe5",
+						"lcd_d6_pe6",
+						"lcd_d7_pe7",
+						"lcd_d8_pf0",
+						"lcd_d9_pf1",
+						"lcd_d10_pf2",
+						"lcd_d11_pf3",
+						"lcd_d12_pf4",
+						"lcd_d13_pf5",
+						"lcd_d14_pf6",
+						"lcd_d15_pf7",
+						"lcd_de_pj1",
+						"lcd_hsync_pj3",
+						"lcd_vsync_pj4",
+						"lcd_d16_pm0",
+						"lcd_d17_pm1",
+						"lcd_d18_pm2",
+						"lcd_d19_pm3",
+						"lcd_d20_pm4",
+						"lcd_d21_pm5",
+						"lcd_d22_pm6",
+						"lcd_d23_pm7",
+						"lcd_dc0_pn6",
+						"lcd_sdin_pz2";
+				nvidia,function = "displaya";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			lcd_cs0_n_pn4 {
+				nvidia,pins = "lcd_cs0_n_pn4",
+						"lcd_sdout_pn5",
+						"lcd_wr_n_pz3";
+				nvidia,function = "displaya";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			blink {
+				nvidia,pins = "clk_32k_out_pa0";
+				nvidia,function = "blink";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* KBC keys */
+			kb_col0_pq0 {
+				nvidia,pins = "kb_col0_pq0";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_col1_pq1 {
+				nvidia,pins = "kb_row1_pr1",
+						"kb_row3_pr3",
+						"kb_row8_ps0",
+						"kb_row14_ps6";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			kb_col4_pq4 {
+				nvidia,pins = "kb_col4_pq4",
+						"kb_col5_pq5",
+						"kb_col7_pq7",
+						"kb_row2_pr2",
+						"kb_row4_pr4",
+						"kb_row5_pr5",
+						"kb_row12_ps4",
+						"kb_row13_ps5";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			gmi_wp_n_pc7 {
+				nvidia,pins = "gmi_wp_n_pc7",
+						"gmi_wait_pi7",
+						"gmi_cs3_n_pk4";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_cs0_n_pj0 {
+				nvidia,pins = "gmi_cs0_n_pj0",
+						"gmi_cs1_n_pj2",
+						"gmi_cs2_n_pk3";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			vi_pclk_pt0 {
+				nvidia,pins = "vi_pclk_pt0";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+				nvidia,ioreset = <0>;
+			};
+
+			/* GPIO keys pinmux */
+			power_key {
+				nvidia,pins = "pv0";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			vol_keys {
+				nvidia,pins = "kb_col2_pq2",
+						"kb_col3_pq3";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Bluetooth */
+			bt_shutdown {
+				nvidia,pins = "pu0";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			bt_dev_wake {
+				nvidia,pins = "pu1";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			bt_host_wake {
+				nvidia,pins = "pu6";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			pu2 {
+				nvidia,pins = "pu2";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pu3 {
+				nvidia,pins = "pu3";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pcc1 {
+				nvidia,pins = "pcc1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pv2 {
+				nvidia,pins = "pv2";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pv3 {
+				nvidia,pins = "pv3";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			vi_vsync_pd6 {
+				nvidia,pins = "vi_vsync_pd6",
+						"vi_hsync_pd7";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+				nvidia,ioreset = <0>;
+			};
+			vi_d10_pt2 {
+				nvidia,pins = "vi_d10_pt2",
+						"vi_d0_pt4", "pbb0";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			kb_row0_pr0 {
+				nvidia,pins = "kb_row0_pr0";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gmi_ad0_pg0 {
+				nvidia,pins = "gmi_ad0_pg0",
+						"gmi_ad1_pg1",
+						"gmi_ad2_pg2",
+						"gmi_ad3_pg3",
+						"gmi_ad6_pg6",
+						"gmi_ad7_pg7",
+						"gmi_wr_n_pi0",
+						"gmi_oe_n_pi1",
+						"gmi_dqs_pi2",
+						"gmi_adv_n_pk0",
+						"gmi_clk_pk1";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_ad13_ph5 {
+				nvidia,pins = "gmi_ad13_ph5";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi_ad10_ph2 {
+				nvidia,pins = "gmi_ad10_ph2",
+						"gmi_ad11_ph3",
+						"gmi_ad14_ph6";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_ad12_ph4 {
+				nvidia,pins = "gmi_ad12_ph4",
+						"gmi_rst_n_pi4",
+						"gmi_cs7_n_pi6";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Vibrator control */
+			vibrator {
+				nvidia,pins = "gmi_ad15_ph7";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* PWM pimnmux */
+			pwm_0 {
+				nvidia,pins = "gmi_ad8_ph0";
+				nvidia,function = "pwm0";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pwm_2 {
+				nvidia,pins = "pu5";
+				nvidia,function = "pwm2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			gmi_cs6_n_pi3 {
+				nvidia,pins = "gmi_cs6_n_pi3";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Spdif pinmux */
+			spdif_out {
+				nvidia,pins = "spdif_out_pk5";
+				nvidia,function = "spdif";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			spdif_in {
+				nvidia,pins = "spdif_in_pk6";
+				nvidia,function = "spdif";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			vi_d4_pl2 {
+				nvidia,pins = "vi_d4_pl2";
+				nvidia,function = "vi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			vi_d6_pl4 {
+				nvidia,pins = "vi_d6_pl4";
+				nvidia,function = "vi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+				nvidia,lock = <0>;
+				nvidia,ioreset = <0>;
+			};
+			vi_mclk_pt1 {
+				nvidia,pins = "vi_mclk_pt1";
+				nvidia,function = "vi";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			jtag_rtck {
+				nvidia,pins = "jtag_rtck_pu7";
+				nvidia,function = "rtck";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			crt_hsync_pv6 {
+				nvidia,pins = "crt_hsync_pv6",
+						"crt_vsync_pv7";
+				nvidia,function = "crt";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			clk1_out {
+				nvidia,pins = "clk1_out_pw4";
+				nvidia,function = "extperiph1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			clk2_out {
+				nvidia,pins = "clk2_out_pw5";
+				nvidia,function = "extperiph2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			clk3_out {
+				nvidia,pins = "clk3_out_pee0";
+				nvidia,function = "extperiph3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			sys_clk_req {
+				nvidia,pins = "sys_clk_req_pz5";
+				nvidia,function = "sysclk";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			pbb4 {
+				nvidia,pins = "pbb4";
+				nvidia,function = "vgp4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pbb5 {
+				nvidia,pins = "pbb5";
+				nvidia,function = "vgp5";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pbb6 {
+				nvidia,pins = "pbb6";
+				nvidia,function = "vgp6";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			clk2_req_pcc5 {
+				nvidia,pins = "clk2_req_pcc5",
+						"clk1_req_pee2";
+				nvidia,function = "dap";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			clk3_req_pee1 {
+				nvidia,pins = "clk3_req_pee1";
+				nvidia,function = "dev3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			owr {
+				nvidia,pins = "owr";
+				nvidia,function = "owr";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* GPIO power/drive control */
+			drive_dap1 {
+				nvidia,pins = "drive_dap1",
+						"drive_dap2",
+						"drive_dbg",
+						"drive_at5",
+						"drive_gme",
+						"drive_ddc",
+						"drive_ao1",
+						"drive_uart3";
+				nvidia,high-speed-mode = <TEGRA_PIN_DISABLE>;
+				nvidia,schmitt = <TEGRA_PIN_ENABLE>;
+				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_1>;
+				nvidia,pull-down-strength = <31>;
+				nvidia,pull-up-strength = <31>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+			};
+			drive_sdio1 {
+				nvidia,pins = "drive_sdio1",
+						"drive_sdio3";
+				nvidia,high-speed-mode = <TEGRA_PIN_DISABLE>;
+				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+				nvidia,pull-down-strength = <46>;
+				nvidia,pull-up-strength = <42>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FAST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FAST>;
+			};
+		};
+	};
+
+	uartb: serial@70006040 {
+		compatible = "nvidia,tegra30-hsuart";
+		status = "okay";
+
+		/* Broadcom GPS BCM47511 */
+	};
+
+	uartc: serial@70006200 {
+		compatible = "nvidia,tegra30-hsuart";
+		status = "okay";
+
+		nvidia,adjust-baud-rates = <0 9600 100>,
+					   <9600 115200 200>,
+					   <1000000 4000000 136>;
+
+		bluetooth {
+			max-speed = <4000000>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
+			clock-names = "txco";
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "host-wakeup";
+
+			device-wakeup-gpios = <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
+			shutdown-gpios =      <&gpio TEGRA_GPIO(U, 0) GPIO_ACTIVE_HIGH>;
+
+			vbat-supply  = <&vdd_3v3_com>;
+			vddio-supply = <&vdd_1v8_vio>;
+		};
+	};
+
+	pwm: pwm@7000a000 {
+		status = "okay";
+	};
+
+	lcd_ddc: i2c@7000c000 {
+		status = "okay";
+		clock-frequency = <100000>;
+	};
+
+	i2c2: i2c@7000c400 {
+		status = "okay";
+		clock-frequency = <400000>;
+	};
+
+	i2c3: i2c@7000c500 {
+		status = "okay";
+
+		/* Aichi AMI306 digital compass */
+		magnetometer@e {
+			compatible = "asahi-kasei,ak8974";
+			reg = <0x0e>;
+
+			avdd-supply = <&vdd_3v3_sys>;
+			dvdd-supply = <&vdd_1v8_vio>;
+		};
+
+		/* Dynaimage ambient light sensor */
+		light-sensor@1c {
+			compatible = "dynaimage,al3010";
+			reg = <0x1c>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(Z, 2) IRQ_TYPE_LEVEL_HIGH>;
+
+			vdd-supply = <&vdd_3v3_sys>;
+		};
+
+		gyroscope@68 {
+			compatible = "invensense,mpu3050";
+			reg = <0x68>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(X, 1) IRQ_TYPE_EDGE_RISING>;
+
+			vdd-supply    = <&vdd_3v3_sys>;
+			vlogic-supply = <&vdd_1v8_vio>;
+
+			i2c-gate {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				accelerometer@f {
+					compatible = "kionix,kxtf9";
+					reg = <0x0f>;
+
+					interrupt-parent = <&gpio>;
+					interrupts = <TEGRA_GPIO(O, 5) IRQ_TYPE_EDGE_RISING>;
+
+					vdd-supply = <&vdd_1v8_vio>;
+					vddio-supply = <&vdd_1v8_vio>;
+				};
+			};
+		};
+	};
+
+	hdmi_ddc: i2c@7000c700 {
+		status = "okay";
+		clock-frequency = <93750>;
+	};
+
+	i2c5: i2c@7000d000 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		nct72: temperature-sensor@4c {
+			compatible = "onnn,nct1008";
+			reg = <0x4c>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(CC, 2) IRQ_TYPE_EDGE_FALLING>;
+
+			vcc-supply = <&vdd_3v3_sys>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		/* Texas Instruments TPS659110 PMIC */
+		pmic: pmic@2d {
+			compatible = "ti,tps65911";
+			reg = <0x2d>;
+
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			wakeup-source;
+
+			ti,en-gpio-sleep = <0 0 1 0 0 0 0 0 0>;
+			ti,system-power-controller;
+			ti,sleep-keep-ck32k;
+			ti,sleep-enable;
+
+			#gpio-cells = <2>;
+			gpio-controller;
+
+			vcc1-supply = <&vdd_5v0_bat>;
+			vcc2-supply = <&vdd_5v0_bat>;
+			vcc3-supply = <&vdd_1v8_vio>;
+			vcc4-supply = <&vdd_5v0_sys>;
+			vcc5-supply = <&vdd_5v0_bat>;
+			vcc6-supply = <&vdd_3v3_sys>;
+			vcc7-supply = <&vdd_5v0_bat>;
+			vccio-supply = <&vdd_5v0_bat>;
+
+			pmic-sleep-hog {
+				gpio-hog;
+				gpios = <2 GPIO_ACTIVE_HIGH>;
+				output-high;
+			};
+
+			regulators {
+				/* VDD1 is not used by Transformers */
+
+				vddio_ddr: vdd2 {
+					regulator-name = "vddio_ddr";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_cpu: vddctrl {
+					regulator-name = "vdd_cpu,vdd_sys";
+					regulator-min-microvolt = <600000>;
+					regulator-max-microvolt = <1400000>;
+					regulator-coupled-with = <&vdd_core>;
+					regulator-coupled-max-spread = <300000>;
+					regulator-max-step-microvolt = <100000>;
+					regulator-always-on;
+					regulator-boot-on;
+					ti,regulator-ext-sleep-control = <1>;
+
+					nvidia,tegra-cpu-regulator;
+				};
+
+				vdd_1v8_vio: vio {
+					regulator-name = "vdd_1v8_gen";
+					/* FIXME: eMMC won't work, if set to 1.8 V */
+					regulator-min-microvolt = <1500000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				/* eMMC VDD */
+				vcore_emmc: ldo1 {
+					regulator-name = "vdd_emmc_core";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+				};
+
+				/* uSD slot VDD */
+				vdd_usd: ldo2 {
+					regulator-name = "vdd_usd";
+					regulator-min-microvolt = <3100000>;
+					regulator-max-microvolt = <3100000>;
+					/* FIXME: Without this, voltage switching fails */
+					regulator-always-on;
+				};
+
+				/* uSD slot VDDIO */
+				vddio_usd: ldo3 {
+					regulator-name = "vddio_usd";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3100000>;
+				};
+
+				ldo4 {
+					regulator-name = "vdd_rtc";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+				};
+
+				/* LDO5 is not used by Transformers */
+
+				ldo6 {
+					regulator-name = "avdd_dsi_csi,pwrdet_mipi";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+				};
+
+				ldo7 {
+					regulator-name = "vdd_pllm,x,u,a_p_c_s";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+					regulator-boot-on;
+					ti,regulator-ext-sleep-control = <8>;
+				};
+
+				ldo8 {
+					regulator-name = "vdd_ddr_hs";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+					ti,regulator-ext-sleep-control = <8>;
+				};
+			};
+		};
+
+		vdd_core: core-regulator@60 {
+			compatible = "ti,tps62361";
+			reg = <0x60>;
+
+			regulator-name = "tps62361-vout";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1770000>;
+			regulator-coupled-with = <&vdd_cpu>;
+			regulator-coupled-max-spread = <300000>;
+			regulator-max-step-microvolt = <100000>;
+			regulator-boot-on;
+			regulator-always-on;
+			ti,enable-vout-discharge;
+			ti,vsel0-state-high;
+			ti,vsel1-state-high;
+
+			nvidia,tegra-core-regulator;
+		};
+	};
+
+	vdd_5v0_bat: regulator-bat {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_ac_bat";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_5v0_cp: regulator-sby {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0_sby";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_bat>;
+	};
+
+	vdd_5v0_sys: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0_sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&pmic 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_bat>;
+	};
+
+	vdd_1v5_ddr: regulator-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_ddr";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_bat>;
+	};
+
+	vdd_3v3_sys: regulator-3v {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3_sys";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_bat>;
+	};
+
+	vdd_pnl: regulator-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_panel";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-enable-ramp-delay = <20000>;
+		gpio = <&gpio TEGRA_GPIO(W, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
+
+	vdd_3v3_com: regulator-com {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3_com";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		gpio = <&gpio TEGRA_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
+
+	vdd_5v0_bl: regulator-bl {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0_bl";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_bat>;
+	};
+
+	hdmi_5v0_sys: regulator-hdmi {
+		compatible = "regulator-fixed";
+		regulator-name = "hdmi_5v0_sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	pmc@7000e400 {
+		status = "okay";
+		nvidia,invert-interrupt;
+		/* FIXME: LP1 doesn't work at the moment */
+		nvidia,suspend-mode = <2>;
+		nvidia,cpu-pwr-good-time = <2000>;
+		nvidia,cpu-pwr-off-time = <200>;
+		nvidia,core-pwr-good-time = <3845 3845>;
+		nvidia,core-pwr-off-time = <0>;
+		nvidia,core-power-req-active-high;
+		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
+
+		/* Set DEV_OFF + PWR_OFF_SET bit in DCDC control register of TPS65911 PMIC  */
+		i2c-thermtrip {
+			nvidia,i2c-controller-id = <4>;
+			nvidia,bus-addr = <0x2d>;
+			nvidia,reg-addr = <0x3f>;
+			nvidia,reg-data = <0x81>;
+		};
+	};
+
+	hda@70030000 {
+		status = "okay";
+	};
+
+	ahub@70080000 {
+		i2s@70080400 {		/* i2s1 */
+			status = "okay";
+		};
+
+		/* BT SCO */
+		i2s@70080600 {		/* i2s3 */
+			status = "okay";
+		};
+	};
+
+	sdmmc1: mmc@78000000 {
+		status = "okay";
+
+		/* FIXME: Full 208Mhz clock rate doesn't work reliably */
+		max-frequency = <104000000>;
+
+		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
+		bus-width = <4>;
+
+		vmmc-supply = <&vdd_usd>;	/* ldo2 */
+		vqmmc-supply = <&vddio_usd>;	/* ldo3 */
+	};
+
+	brcm_wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+
+		clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
+		clock-names = "ext_clock";
+
+		reset-gpios = <&gpio TEGRA_GPIO(D, 4) GPIO_ACTIVE_LOW>;
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
+		bus-width = <4>;
+		non-removable;
+
+		mmc-pwrseq = <&brcm_wifi_pwrseq>;
+		vmmc-supply = <&vdd_3v3_com>;
+		vqmmc-supply = <&vdd_1v8_vio>;
+
+		/* Azurewave AW-NH615 BCM4329B1 or AW-NH665 BCM4330B1 */
+		wifi@1 {
+			compatible = "brcm,bcm4329-fmac";
+			reg = <1>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(O, 4) IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "host-wake";
+		};
+	};
+
+	sdmmc4: mmc@78000600 {
+		status = "okay";
+		bus-width = <8>;
+		vmmc-supply = <&vcore_emmc>;
+		vqmmc-supply = <&vdd_1v8_vio>;
+		mmc-ddr-3_3v;
+		non-removable;
+	};
+
+	/* USB via ASUS connector */
+	usb@7d000000 {
+		compatible = "nvidia,tegra30-udc";
+		status = "okay";
+		dr_mode = "peripheral";
+	};
+
+	usb-phy@7d000000 {
+		status = "okay";
+		dr_mode = "peripheral";
+		nvidia,hssync-start-delay = <0>;
+		nvidia,xcvr-lsfslew = <2>;
+		nvidia,xcvr-lsrslew = <2>;
+		vbus-supply = <&vdd_5v0_sys>;
+	};
+
+	/* Dock's USB port */
+	usb@7d008000 {
+		status = "okay";
+	};
+
+	usb-phy@7d008000 {
+		status = "okay";
+		vbus-supply = <&vdd_5v0_bat>;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+
+		enable-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
+		power-supply = <&vdd_5v0_bl>;
+		pwms = <&pwm 0 4000000>;
+
+		brightness-levels = <1 255>;
+		num-interpolated-steps = <254>;
+		default-brightness-level = <40>;
+	};
+
+	/* PMIC has a built-in 32KHz oscillator which is used by PMC */
+	clk32k_in: clock-32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "pmic-oscillator";
+	};
+
+	cpus {
+		cpu0: cpu@0 {
+			cpu-supply = <&vdd_cpu>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
+		};
+		cpu1: cpu@1 {
+			cpu-supply = <&vdd_cpu>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
+		};
+		cpu2: cpu@2 {
+			cpu-supply = <&vdd_cpu>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
+		};
+		cpu3: cpu@3 {
+			cpu-supply = <&vdd_cpu>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
+		};
+	};
+
+	firmware {
+		trusted-foundations {
+			compatible = "tlm,trusted-foundations";
+			tlm,version-major = <2>;
+			tlm,version-minor = <8>;
+		};
+	};
+
+	mains: ac-adapter-detect {
+		compatible = "gpio-charger";
+		charger-type = "mains";
+		gpios = <&gpio TEGRA_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
+	};
+
+	pad-keys {
+		compatible = "gpio-keys";
+		interrupt-parent = <&gpio>;
+
+		power {
+			label = "Power";
+			gpios = <&gpio TEGRA_GPIO(V, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		volume-up {
+			label = "Volume Up";
+			gpios = <&gpio TEGRA_GPIO(Q, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		volume-down {
+			label = "Volume Down";
+			gpios = <&gpio TEGRA_GPIO(Q, 3) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+	};
+
+	extcon-keys {
+		compatible = "gpio-keys";
+		interrupt-parent = <&gpio>;
+
+		dock-hall-sensor {
+			label = "Lid sensor";
+			gpios = <&gpio TEGRA_GPIO(S, 6) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			debounce-interval = <500>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		lineout-detect {
+			label = "Audio dock line-out detect";
+			gpios = <&gpio TEGRA_GPIO(X, 3) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LINEOUT_INSERT>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+	};
+
+	sound {
+		nvidia,i2s-controller = <&tegra_i2s1>;
+
+		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
+		nvidia,hp-mute-gpios = <&gpio TEGRA_GPIO(X, 2) GPIO_ACTIVE_LOW>;
+
+		clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
+			 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+			 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+		clock-names = "pll_a", "pll_a_out0", "mclk";
+
+		assigned-clocks = <&tegra_car TEGRA30_CLK_EXTERN1>,
+				  <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+
+		assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+					 <&tegra_car TEGRA30_CLK_EXTERN1>;
+	};
+
+	thermal-zones {
+		/*
+		 * NCT72 has two sensors:
+		 *
+		 *	0: internal that monitors ambient/skin temperature
+		 *	1: external that is connected to the CPU's diode
+		 *
+		 * Ideally we should use userspace thermal governor,
+		 * but it's a much more complex solution.  The "skin"
+		 * zone exists as a simpler solution which prevents
+		 * Transformers from getting too hot from a user's
+		 * tactile perspective. The CPU zone is intended to
+		 * protect silicon from damage.
+		 */
+
+		skin-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&nct72 0>;
+
+			trips {
+				trip0: skin-alert {
+					/* throttle at 57C until temperature drops to 56.8C */
+					temperature = <57000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+
+				trip1: skin-crit {
+					/* shut down at 65C */
+					temperature = <65000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&trip0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&actmon THERMAL_NO_LIMIT
+								  THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&nct72 1>;
+
+			trips {
+				trip2: cpu-alert {
+					/* throttle at 75C until temperature drops to 74.8C */
+					temperature = <75000>;
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
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&actmon THERMAL_NO_LIMIT
+								  THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+};
-- 
2.33.1


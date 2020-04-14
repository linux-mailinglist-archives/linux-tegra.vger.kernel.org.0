Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6CD1A8E5D
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Apr 2020 00:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634250AbgDNWLO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Apr 2020 18:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2634201AbgDNWKF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Apr 2020 18:10:05 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF7BBC061A0C;
        Tue, 14 Apr 2020 15:10:04 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q19so1495992ljp.9;
        Tue, 14 Apr 2020 15:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gJl/WEZ7oBavIVCKdnpzsKiuCdUanjWDMU2hnilycWU=;
        b=BQWz6D6PPaDIGiBDvomM6dDJXYz4tUmtYBhC1e3P5Pg/CPwyLXziKrfAsNo6pvL8Hv
         AJDJ1AJKVCUnANaJ+v/hEh8Qb+SaTB13imQjPxWYRy+BmOmUl0flNuL18Es2QXQhYPH6
         VjzGuGqSoZvfpeCquKASrcL/XFrCz0A4yN4/CRJoSrxneLYKytdl0PeR8+8eJnbtTUVo
         /I6psG9WUsHVIqN61qWJ7/XbGNNLx2j2vUPYUqzgZ0EFmYNrtfiRtjDBfBruQw0XzM4E
         d7DRg5TJrMMpB+XgEN0Xpm1y+9HciJN0knCVV2l+SSWhsfUhY4R5zK8mvpNyelOeCI0W
         88Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gJl/WEZ7oBavIVCKdnpzsKiuCdUanjWDMU2hnilycWU=;
        b=p9vQHhX3nCnjm/JohkILx/OB6cvlBqzZJT0Doox2vS3/csXlH7IxsPQOSVVccADi5r
         dIGp+Ry3f//UIkxGJ1UTDHt18QnUT1HzOBzibjtbu2Nse6PgQWLDBWltBfDH3O9Bgn6L
         FoVhot8Hq8xaVWKJgut2BPHEHcPVIXPgVa83iR4mw4mxPii5Y7dJwjEEKGXNbe1U1Sha
         /FjHodgaErAueP5jjpJA7/OUu+iEmGd4GcTFOEBJZ5d3xg6hkSU1NWwn7ubBczwpX7DE
         b/NicKt5+H4DohY3tST3Q9nULn2SN0iDeO+fN6DhaagESeWANld/wTsfNx+n7vfuHNwK
         B4Hg==
X-Gm-Message-State: AGi0PubrqzYmcTzKhmG4qdZSPFqlbHkNjEQGdoe+YvCj/zFRagM7q0NO
        DSeVWG6k13R9YSs/UGYrjvA=
X-Google-Smtp-Source: APiQypKXD8EYim/529UZWDd2ugn7oZdsvTUqpTXcIColI+ZJEO2X3GsaVRQl6EDAViPTImHiPEbYrA==
X-Received: by 2002:a2e:99d6:: with SMTP id l22mr1266438ljj.263.1586902202578;
        Tue, 14 Apr 2020 15:10:02 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id w27sm13663044lfn.45.2020.04.14.15.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 15:10:01 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        David Heidelberg <david@ixit.cz>,
        Peter Geis <pgwipeout@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        =?UTF-8?q?Pedro=20=C3=82ngelo?= <pangelo@void.io>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/6] ARM: tegra: Add device-tree for Acer Iconia Tab A500
Date:   Wed, 15 Apr 2020 01:07:54 +0300
Message-Id: <20200414220759.29146-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414220759.29146-1-digetx@gmail.com>
References: <20200414220759.29146-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add device-tree for Acer Iconia Tab A500, which is NVIDIA Tegra20-based
tablet device.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/Makefile                    |    1 +
 .../boot/dts/tegra20-acer-a500-picasso.dts    | 1458 +++++++++++++++++
 2 files changed, 1459 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8c410e466592..45a40663bf61 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1186,6 +1186,7 @@ dtb-$(CONFIG_MACH_SUNIV) += \
 dtb-$(CONFIG_ARCH_TANGO) += \
 	tango4-vantage-1172.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += \
+	tegra20-acer-a500-picasso.dtb \
 	tegra20-harmony.dtb \
 	tegra20-colibri-eval-v3.dtb \
 	tegra20-colibri-iris.dtb \
diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
new file mode 100644
index 000000000000..93bfd164dbe1
--- /dev/null
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -0,0 +1,1458 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/thermal/thermal.h>
+
+#include "tegra20.dtsi"
+#include "tegra20-cpu-opp.dtsi"
+#include "tegra20-cpu-opp-microvolt.dtsi"
+
+/ {
+	model = "Acer Iconia Tab A500";
+	compatible = "acer,picasso", "nvidia,tegra20";
+
+	aliases {
+		rtc0 = "/i2c@7000d000/tps658621@34";
+		rtc1 = "/rtc@7000e000";
+
+		serial0 = &uartd; /* Docking station */
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
+				nvidia,panel = <&panel>;
+
+				port@0 {
+					lvds_output: endpoint {
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
+			hdmi-supply = <&vdd_5v0_sys>;
+
+			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
+				GPIO_ACTIVE_HIGH>;
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
+				nvidia,pins = "crtp", "lm1";
+				nvidia,function = "crt";
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
+					"lhp1", "lhp2", "lhs", "lpp", "lsc0",
+					"lsc1", "lsck", "lsda", "lspi", "lvp1",
+					"lvs";
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
+					"cdev1", "cdev2", "csus", "dap1",
+					"dap4", "dte", "dtf", "gma", "gmc",
+					"gme", "gpu", "gpu7", "gpv", "i2cp",
+					"irrx", "irtx", "pta", "rm",
+					"sdc", "sdd", "slxc", "slxd", "slxk",
+					"spdi", "spdo", "uac", "uad", "uda";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+			conf_ate {
+				nvidia,pins = "ate", "dap2", "dap3",
+					"gmd", "owc", "spia", "spib", "spic",
+					"spid", "spie";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+			conf_ck32 {
+				nvidia,pins = "ck32", "ddrc", "pmca", "pmcb",
+					"pmcc", "pmcd", "pmce", "xm2c", "xm2d";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			};
+			conf_crtp {
+				nvidia,pins = "crtp", "gmb", "slxa", "spig",
+					"spih";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+			conf_dta {
+				nvidia,pins = "dta", "dtb", "dtc", "dtd", "kbcb";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+			conf_dte {
+				nvidia,pins = "spif";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+			conf_hdint {
+				nvidia,pins = "hdint", "lcsn", "ldc", "lm1",
+					"lpw1", "lsck", "lsda", "lsdi",
+					"lvp0";
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+			conf_kbca {
+				nvidia,pins = "kbca", "kbcc", "kbcd",
+					"kbce", "kbcf", "sdio1", "uaa",
+					"uab", "uca", "ucb";
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
+				nvidia,pins = "ld17_0";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			};
+			drive_ddc {
+				nvidia,pins = "drive_ddc",
+						"drive_vi1",
+						"drive_sdio1";
+				nvidia,schmitt = <TEGRA_PIN_ENABLE>;
+				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_4>;
+			};
+			drive_dbg {
+				nvidia,pins = "drive_dbg",
+						"drive_vi2",
+						"drive_at1",
+						"drive_ao1";
+				nvidia,schmitt = <TEGRA_PIN_ENABLE>;
+				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_4>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
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
+	tegra_i2s1: i2s@70002800 {
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
+		/* Azurewave AW-NH665 BCM4329B1 */
+		bluetooth {
+			compatible = "brcm,bcm4329-bt";
+
+			/* PLLP 216MHz / 16 / 4 */
+			max-speed = <3375000>;
+
+			clocks = <&rtc_32k_wifi>;
+			clock-names = "txco";
+
+			vbat-supply  = <&vdd_3v3_sys>;
+			vddio-supply = <&vdd_1v8_sys>;
+
+			device-wakeup-gpios = <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
+			host-wakeup-gpios =   <&gpio TEGRA_GPIO(U, 6) GPIO_ACTIVE_HIGH>;
+			shutdown-gpios =      <&gpio TEGRA_GPIO(U, 0) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	uartd: serial@70006300 {
+		/* Docking station */
+	};
+
+	i2c@7000c000 {
+		clock-frequency = <400000>;
+		status = "okay";
+
+		wm8903: audio-codec@1a {
+			compatible = "wlf,wm8903";
+			reg = <0x1a>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(X, 3) IRQ_TYPE_LEVEL_HIGH>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			gpio-cfg = <
+				0x0000 /* MIC_LR_OUT#    GPIO, output, low */
+				0x0000 /* FM2018-enable  GPIO, output, low */
+				0x0000 /* Speaker-enable GPIO, output, low */
+				0x0200 /* Interrupt, output */
+				0x01a0 /* BCLK, input, active high */
+			>;
+
+			AVDD-supply  = <&vdd_1v8_sys>;
+			CPVDD-supply = <&vdd_1v8_sys>;
+			DBVDD-supply = <&vdd_1v8_sys>;
+			DCVDD-supply = <&vdd_1v8_sys>;
+		};
+
+		touchscreen@4c {
+			compatible = "atmel,maxtouch";
+			reg = <0x4c>;
+
+			atmel,cfg_name = "maxtouch-acer-iconia-tab-a500.cfg";
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(V, 6) IRQ_TYPE_LEVEL_LOW>;
+
+			reset-gpios = <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
+
+			avdd-supply = <&vdd_3v3_sys>;
+			vdd-supply  = <&vdd_3v3_sys>;
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
+					 "1",  "0",  "0",
+					 "0",  "0", "-1";
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
+					interrupts = <TEGRA_GPIO(S, 7) IRQ_TYPE_EDGE_RISING>;
+
+					mount-matrix =	 "0",  "1",  "0",
+							 "1",  "0",  "0",
+							 "0",  "0", "-1";
+				};
+			};
+		};
+	};
+
+	i2c@7000c400 {
+		clock-frequency = <10000>;
+		status = "okay";
+	};
+
+	i2cmux {
+		compatible = "i2c-mux-pinctrl";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c-parent = <&{/i2c@7000c400}>;
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
+		panel_ddc: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	pwm: pwm@7000a000 {
+		status = "okay";
+	};
+
+	i2c@7000d000 {
+		clock-frequency = <100000>;
+		status = "okay";
+
+		magnetometer@c {
+			compatible = "ak,ak8975";
+			reg = <0x0c>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(N, 5) IRQ_TYPE_EDGE_RISING>;
+
+			vdd-supply = <&vdd_3v3_sys>;
+			vid-supply = <&vdd_1v8_sys>;
+
+			mount-matrix =	"1",  "0",  "0",
+					"0", "-1",  "0",
+					"0",  "0", "-1";
+		};
+
+		pmic@34 {
+			compatible = "ti,tps6586x";
+			reg = <0x34>;
+
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+
+			#gpio-cells = <2>;
+			gpio-controller;
+
+			sys-supply       = <&vdd_5v0_sys>;
+			vin-sm0-supply   = <&sys_reg>;
+			vin-sm1-supply   = <&sys_reg>;
+			vin-sm2-supply   = <&sys_reg>;
+			vinldo01-supply  = <&sm2_reg>;
+			vinldo23-supply  = <&sm2_reg>;
+			vinldo4-supply   = <&sm2_reg>;
+			vinldo678-supply = <&sm2_reg>;
+			vinldo9-supply   = <&sm2_reg>;
+
+			regulators {
+				sys_reg: sys {
+					regulator-name = "vdd_sys";
+					regulator-always-on;
+				};
+
+				vdd_core: sm0 {
+					regulator-name = "vdd_sm0,vdd_core";
+					regulator-min-microvolt = <1200000>;
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
+					regulator-boot-on;
+				};
+
+				rtc_vdd: ldo2 {
+					regulator-name = "vdd_ldo2,vdd_rtc";
+					regulator-min-microvolt = <1200000>;
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
+					regulator-boot-on;
+				};
+
+				vcore_emmc: ldo5 {
+					regulator-name = "vdd_ldo5,vcore_mmc";
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+				};
+
+				avdd_vdac_reg: ldo6 {
+					regulator-name = "vdd_ldo6,avdd_vdac";
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+				};
+
+				hdmi_vdd_reg: ldo7 {
+					regulator-name = "vdd_ldo7,avdd_hdmi";
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
+					regulator-boot-on;
+				};
+
+				ldo_rtc {
+					regulator-name = "vdd_rtc_out,vdd_cell";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+			};
+		};
+
+		nct1008: temperature-sensor@4c {
+			compatible = "onnn,nct1008";
+			reg = <0x4c>;
+			vcc-supply = <&vdd_3v3_sys>;
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
+	};
+
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
+		vbus-supply = <&vdd_vbus1>;
+	};
+
+	usb@c5008000 {
+		status = "okay";
+	};
+
+	usb-phy@c5008000 {
+		status = "okay";
+		nvidia,xcvr-setup-use-fuses;
+		nvidia,xcvr-lsfslew = <2>;
+		nvidia,xcvr-lsrslew = <2>;
+		vbus-supply = <&vdd_vbus3>;
+	};
+
+	brcm_wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+
+		clocks = <&rtc_32k_wifi>;
+		clock-names = "ext_clock";
+
+		reset-gpios = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <300>;
+		power-off-delay-us = <300>;
+	};
+
+	sdhci@c8000000 {
+		status = "okay";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		max-frequency = <25000000>;
+		keep-power-in-suspend;
+		bus-width = <4>;
+		non-removable;
+
+		mmc-pwrseq = <&brcm_wifi_pwrseq>;
+		vmmc-supply = <&vdd_3v3_sys>;
+		vqmmc-supply = <&vdd_3v3_sys>;
+
+		/* Azurewave AW-NH611 BCM4329 */
+		wifi@1 {
+			reg = <1>;
+			compatible = "brcm,bcm4329-fmac";
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(S, 0) IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "host-wake";
+		};
+	};
+
+	sdhci@c8000400 {
+		status = "okay";
+		bus-width = <4>;
+		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
+		power-gpios = <&gpio TEGRA_GPIO(I, 6) GPIO_ACTIVE_HIGH>;
+		vmmc-supply = <&vdd_3v3_sys>;
+		vqmmc-supply = <&vdd_3v3_sys>;
+	};
+
+	sdhci@c8000600 {
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
+		pwms = <&pwm 2 41667>;
+
+		brightness-levels = <7 255>;
+		num-interpolated-steps = <248>;
+		default-brightness-level = <20>;
+	};
+
+	clocks {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* PMIC has a built-in 32KHz oscillator which is used by PMC */
+		clk32k_in: clock@0 {
+			compatible = "fixed-clock";
+			reg = <0>;
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+			clock-output-names = "tps658621-out32k";
+		};
+
+		/*
+		 * This standalone onboard fixed-clock always-ON 32KHz
+		 * oscillator is used as a reference clock-source by the
+		 * Azurewave WiFi/BT module.
+		 */
+		rtc_32k_wifi: clock@1 {
+			compatible = "fixed-clock";
+			reg = <1>;
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+			clock-output-names = "kk3270032";
+		};
+	};
+
+	cpus {
+		cpu0: cpu@0 {
+			cpu-supply = <&vdd_cpu>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
+		};
+
+		cpu@1 {
+			cpu-supply = <&vdd_cpu>;
+			operating-points-v2 = <&cpu0_opp_table>;
+		};
+	};
+
+	panel: display-panel {
+		compatible = "auo,b101ew05", "panel-lvds";
+
+		ddc-i2c-bus = <&panel_ddc>;
+		power-supply = <&vdd_pnl>;
+		backlight = <&backlight>;
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
+		power {
+			label = "Power";
+			gpios = <&gpio TEGRA_GPIO(I, 3) GPIO_ACTIVE_HIGH>;
+			linux,code = <KEY_POWER>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		rotation-lock {
+			label = "Rotate-lock";
+			gpios = <&gpio TEGRA_GPIO(Q, 2) GPIO_ACTIVE_HIGH>;
+			linux,code = <SW_ROTATE_LOCK>;
+			linux,input-type = <EV_SW>;
+			debounce-interval = <10>;
+		};
+
+		volume-up {
+			label = "Volume Up";
+			gpios = <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		volume-down {
+			label = "Volume Down";
+			gpios = <&gpio TEGRA_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+	};
+
+	haptic-feedback {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&gpio TEGRA_GPIO(V, 5) GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&vdd_3v3_sys>;
+	};
+
+	lvds-encoder {
+		compatible = "ti,sn75lvds83", "lvds-encoder";
+
+		powerdown-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lvds_encoder_input: endpoint {
+					remote-endpoint = <&lvds_output>;
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
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vdd_5v0_sys: regulator@0 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+			regulator-name = "vdd_5v0";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+		};
+
+		vdd_3v3_sys: regulator@1 {
+			compatible = "regulator-fixed";
+			reg = <1>;
+			regulator-name = "vdd_3v3_vs";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+			vin-supply = <&vdd_5v0_sys>;
+		};
+
+		vdd_1v8_sys: regulator@2 {
+			compatible = "regulator-fixed";
+			reg = <2>;
+			regulator-name = "vdd_1v8_vs";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+			vin-supply = <&vdd_5v0_sys>;
+		};
+
+		vdd_pnl: regulator@3 {
+			compatible = "regulator-fixed";
+			reg = <3>;
+			regulator-name = "vdd_panel";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-enable-ramp-delay = <300000>;
+			gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_5v0_sys>;
+		};
+
+		vdd_vbus1: regulator@4 {
+			compatible = "regulator-fixed";
+			reg = <4>;
+			regulator-name = "vdd_usb1_vbus";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+			gpio = <&gpio TEGRA_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_5v0_sys>;
+		};
+
+		vdd_vbus3: regulator@5 {
+			compatible = "regulator-fixed";
+			reg = <5>;
+			regulator-name = "vdd_usb3_vbus";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+			gpio = <&gpio TEGRA_GPIO(D, 3) GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_5v0_sys>;
+		};
+	};
+
+	sound {
+		compatible = "nvidia,tegra-audio-wm8903-picasso",
+			     "nvidia,tegra-audio-wm8903";
+		nvidia,model = "Acer Iconia Tab A500 WM8903";
+
+		nvidia,audio-routing =
+			"Headphone Jack", "HPOUTR",
+			"Headphone Jack", "HPOUTL",
+			"Int Spk", "LINEOUTL",
+			"Int Spk", "LINEOUTR",
+			"Mic Jack", "MICBIAS",
+			"IN2L", "Mic Jack",
+			"IN2R", "Mic Jack",
+			"IN1L", "Int Mic",
+			"IN1R", "Int Mic";
+
+		nvidia,i2s-controller = <&tegra_i2s1>;
+		nvidia,audio-codec = <&wm8903>;
+
+		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
+		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_HIGH>;
+		nvidia,int-mic-en-gpios = <&wm8903 1 GPIO_ACTIVE_HIGH>;
+		nvidia,headset;
+
+		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA20_CLK_CDEV1>;
+		clock-names = "pll_a", "pll_a_out0", "mclk";
+	};
+
+	thermal-zones {
+		nct1008-local {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <0>; /* milliseconds */
+
+			thermal-sensors = <&nct1008 0>;
+		};
+
+		nct1008-remote {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&nct1008 1>;
+
+			trips {
+				trip0: cpu-alert0 {
+					/* start throttling at 50C */
+					temperature = <50000>;
+					hysteresis = <3000>;
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
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
+	memory-controller@7000f400 {
+		nvidia,use-ram-code;
+
+		emc-tables@0 {
+			nvidia,ram-code = <0>; /* elpida-8gb */
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
+					0x007dd510 0x00000000 0x00000000 0x0000000e
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
+					0x00000002 0x000004e1 0x00000005 0x00000002
+					0x00000000 0x00000000 0x00000282 0xe059048b
+					0x007e1510 0x00000000 0x00000000 0x0000001b
+					0x00000000 0x00000000 0x00000000 0x00000000>;
+			};
+		};
+
+		emc-tables@1 {
+			nvidia,ram-code = <1>; /* elpida-4gb */
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
+					0x0007c000 0x00000000 0x00000000 0x00000003
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
+					0x0007c000 0x00000000 0x00000000 0x00000005
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
+					0x0007c000 0x00000000 0x00000000 0x00000007
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
+					0x007e4010 0x00000000 0x00000000 0x0000000e
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
+					0x00000002 0x000004e1 0x00000005 0x00000002
+					0x00000000 0x00000000 0x00000282 0xe059048b
+					0x007e0010 0x00000000 0x00000000 0x0000001b
+					0x00000000 0x00000000 0x00000000 0x00000000>;
+			};
+		};
+
+		emc-tables@2 {
+			nvidia,ram-code = <2>; /* hynix-8gb */
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
+					0x007dd010 0x00000000 0x00000000 0x0000000e
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
+					0x00000002 0x000004e1 0x00000005 0x00000002
+					0x00000000 0x00000000 0x00000282 0xe059048b
+					0x007e2010 0x00000000 0x00000000 0x0000001b
+					0x00000000 0x00000000 0x00000000 0x00000000>;
+			};
+		};
+
+		emc-tables@3 {
+			nvidia,ram-code = <3>; /* hynix-4gb */
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
+					0x0007c000 0x00000000 0x00000000 0x00000003
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
+					0x0007c000 0x00078000 0x00000000 0x00000005
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
+					0x0007c000 0x00000000 0x00000000 0x00000007
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
+					0x007e4010 0x00000000 0x00000000 0x0000000e
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
+					0x00000002 0x000004e1 0x00000005 0x00000002
+					0x00000000 0x00000000 0x00000282 0xe059048b
+					0x007e0010 0x00000000 0x00000000 0x0000001b
+					0x00000000 0x00000000 0x00000000 0x00000000>;
+			};
+		};
+	};
+};
-- 
2.26.0


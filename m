Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C408946DA26
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Dec 2021 18:39:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238206AbhLHRmx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 Dec 2021 12:42:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238223AbhLHRls (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Dec 2021 12:41:48 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D5D4C061B38;
        Wed,  8 Dec 2021 09:38:15 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 13so4970743ljj.11;
        Wed, 08 Dec 2021 09:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0SHq7UlkEXD4af7HY17LWTy+ZE5Tpui/d2Up1dwFKU8=;
        b=cU+zl8cocNSkC+IEiAK3QfOmpMFMKMUtR5WdjS2CFljye3kCQ8q0LXggBD1gALHJSq
         Qhz99kO3DsuXFPWcfsDX8AAiAuTJCr0ppsbVNAQFSArXo6L8dMUrA3fDKWPp9p/kyInd
         D39Klx/NFSGk8J29DNE5G+3RwDf1V+mMEpR5Rnfo7pg8ed6XOcXfyzRW0noGSLSoF8oV
         6ckxq8iO/EvLa0khqlYA/Uy3M1yfNLxT76w64UCuL1tcEQCO9q1W75zLEy6fM4V+iB0Z
         VznViAPDFs943YON6YnC3gxtRxMtXaWM/tQHJBLVQnUSFYlt1qMMZDd6512CzGlqHkwI
         MzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0SHq7UlkEXD4af7HY17LWTy+ZE5Tpui/d2Up1dwFKU8=;
        b=euWHTJ9Bmjw3TfwYbn7l76gWIuvpa8UYYseF1xngHnGUDT5PHc5gMZk9YlgTiteYMV
         NMqJUyr36rCPCCTei9z6rtdW2zf8shnPWvolK6N9BlR9itl+Rhtyp+M/qsOfg30q5hDd
         ++fkvt+SHqoBPYYcbwkJrLXvFF5LUqX6NV2OLlSl7V2yO4mPyGdK4Ygfw7ND3GfkczBH
         870QCIgLtiP7vDe+Tdrl9JNG6phh/kOeQqChap1d5bPqDKRfLAeuJUGVIKJScpjqHuHP
         1rRHmqQ49tqCLrVBzXZ56v5kZccm9GxzLCmXx5szR7U48xjJrZbQUJWiWy86jaYVOAPp
         lwxw==
X-Gm-Message-State: AOAM533jVYkw3/xYisAj8CjrfXi1p840uaYRo+FHEYEG4/Zl8Db/ZMwi
        2bBPMHwOe/mz8UmmkWTPe84=
X-Google-Smtp-Source: ABdhPJyp3n2WDeHg+u16s24xySXOi2molf7a/1uKltiBnNFZBApsr/QSjVy9zmXNTfQFiu7TgTRyUA==
X-Received: by 2002:a2e:9699:: with SMTP id q25mr896199lji.6.1638985092843;
        Wed, 08 Dec 2021 09:38:12 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.gmail.com with ESMTPSA id a25sm349159lfm.250.2021.12.08.09.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:38:12 -0800 (PST)
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
Subject: [PATCH v5 13/24] ARM: tegra: Add device-tree for Pegatron Chagall
Date:   Wed,  8 Dec 2021 20:35:58 +0300
Message-Id: <20211208173609.4064-14-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211208173609.4064-1-digetx@gmail.com>
References: <20211208173609.4064-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Svyatoslav Ryhel <clamor95@gmail.com>

Add device-tree for Pegatron Chagall, which is a NVIDIA Tegra30-based
Android tablet.

Link: https://wiki.postmarketos.org/wiki/Pegatron_Chagall_(pegatron-chagall)
Co-developed-by: Raffaele Tranquillini <raffaele.tranquillini@gmail.com>
Signed-off-by: Raffaele Tranquillini <raffaele.tranquillini@gmail.com>
Co-developed-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Ion Agorria <ion@agorria.com>
Co-developed-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/Makefile                    |    3 +-
 .../arm/boot/dts/tegra30-pegatron-chagall.dts | 2794 +++++++++++++++++
 2 files changed, 2796 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/tegra30-pegatron-chagall.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index e59e7973990d..26798673739c 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1329,7 +1329,8 @@ dtb-$(CONFIG_ARCH_TEGRA_3x_SOC) += \
 	tegra30-cardhu-a02.dtb \
 	tegra30-cardhu-a04.dtb \
 	tegra30-colibri-eval-v3.dtb \
-	tegra30-ouya.dtb
+	tegra30-ouya.dtb \
+	tegra30-pegatron-chagall.dtb
 dtb-$(CONFIG_ARCH_TEGRA_114_SOC) += \
 	tegra114-asus-tf701t.dtb \
 	tegra114-dalmore.dtb \
diff --git a/arch/arm/boot/dts/tegra30-pegatron-chagall.dts b/arch/arm/boot/dts/tegra30-pegatron-chagall.dts
new file mode 100644
index 000000000000..bb9ef3c5ec8d
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-pegatron-chagall.dts
@@ -0,0 +1,2794 @@
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
+#include "tegra30-asus-lvds-display.dtsi"
+
+/ {
+	model = "Pegatron Chagall";
+	compatible = "pegatron,chagall", "nvidia,tegra30";
+	chassis-type = "tablet";
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
+			sdmmc1_clk_pz0 {
+				nvidia,pins = "sdmmc1_clk_pz0";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc1_dat3_py4 {
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
+			sdmmc3_clk_pa6 {
+				nvidia,pins = "sdmmc3_clk_pa6";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc3_cmd_pa7 {
+				nvidia,pins = "sdmmc3_cmd_pa7",
+						"sdmmc3_dat3_pb4",
+						"sdmmc3_dat2_pb5",
+						"sdmmc3_dat2_pb5",
+						"sdmmc3_dat1_pb6",
+						"sdmmc3_dat0_pb7",
+						"sdmmc3_dat5_pd0",
+						"sdmmc3_dat4_pd1",
+						"sdmmc3_dat6_pd3",
+						"sdmmc3_dat7_pd4";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* SDMMC4 pinmux */
+			sdmmc4_clk_pcc4 {
+				nvidia,pins = "sdmmc4_clk_pcc4";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc4_cmd_pt7 {
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
+
+			/* I2C pinmux */
+			gen1_i2c_scl_pc4 {
+				nvidia,pins = "gen1_i2c_scl_pc4",
+						"gen1_i2c_sda_pc5";
+				nvidia,function = "i2c1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+			};
+			gen2_i2c_scl_pt5 {
+				nvidia,pins = "gen2_i2c_scl_pt5",
+						"gen2_i2c_sda_pt6";
+				nvidia,function = "i2c2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+			};
+			cam_i2c_scl_pbb1 {
+				nvidia,pins = "cam_i2c_scl_pbb1",
+						"cam_i2c_sda_pbb2";
+				nvidia,function = "i2c3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+			};
+			ddc_scl_pv4 {
+				nvidia,pins = "ddc_scl_pv4",
+						"ddc_sda_pv5";
+				nvidia,function = "i2c4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+			};
+			pwr_i2c_scl_pz6 {
+				nvidia,pins = "pwr_i2c_scl_pz6",
+						"pwr_i2c_sda_pz7";
+				nvidia,function = "i2cpwr";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+			};
+
+			/* HDMI-CEC pinmux */
+			hdmi_cec_pee3 {
+				nvidia,pins = "hdmi_cec_pee3";
+				nvidia,function = "cec";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
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
+				nvidia,pins = "ulpi_data1_po2",
+						"ulpi_data2_po3",
+						"ulpi_data3_po4",
+						"ulpi_data4_po5",
+						"ulpi_data5_po6",
+						"ulpi_data6_po7";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			ulpi_data7_po0 {
+				nvidia,pins = "ulpi_data7_po0";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* UART-B */
+			uart2_txd_pc2 {
+				nvidia,pins = "uart2_txd_pc2",
+						"uart2_rts_n_pj6";
+				nvidia,function = "uartb";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			uart2_rxd_pc3 {
+				nvidia,pins = "uart2_rxd_pc3",
+						"uart2_cts_n_pj5";
+				nvidia,function = "uartb";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* UART-C */
+			uart3_cts_n_pa1 {
+				nvidia,pins = "uart3_cts_n_pa1",
+						"uart3_rxd_pw7";
+				nvidia,function = "uartc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			uart3_rts_n_pc0 {
+				nvidia,pins = "uart3_rts_n_pc0",
+						"uart3_txd_pw6";
+				nvidia,function = "uartc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* UART-D */
+			ulpi_clk_py0 {
+				nvidia,pins = "ulpi_clk_py0",
+						"ulpi_stp_py3";
+				nvidia,function = "uartd";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ulpi_dir_py1 {
+				nvidia,pins = "ulpi_dir_py1",
+						"ulpi_nxt_py2";
+				nvidia,function = "uartd";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* I2S pinmux */
+			dap1_fs_pn0 {
+				nvidia,pins = "dap1_fs_pn0",
+						"dap1_din_pn1",
+						"dap1_dout_pn2",
+						"dap1_sclk_pn3";
+				nvidia,function = "i2s0";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap2_fs_pa2 {
+				nvidia,pins = "dap2_fs_pa2",
+						"dap2_sclk_pa3",
+						"dap2_din_pa4",
+						"dap2_dout_pa5";
+				nvidia,function = "i2s1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap3_fs_pp0 {
+				nvidia,pins = "dap3_fs_pp0",
+						"dap3_din_pp1",
+						"dap3_dout_pp2",
+						"dap3_sclk_pp3";
+				nvidia,function = "i2s2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap4_fs_pp4 {
+				nvidia,pins = "dap4_fs_pp4",
+						"dap4_din_pp5",
+						"dap4_dout_pp6",
+						"dap4_sclk_pp7";
+				nvidia,function = "i2s3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pcc2 {
+				nvidia,pins = "pcc2";
+				nvidia,function = "i2s4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* PCI-e pinmux */
+			pex_l2_rst_n_pcc6 {
+				nvidia,pins = "pex_l2_rst_n_pcc6",
+						"pex_l0_rst_n_pdd1",
+						"pex_l1_rst_n_pdd5";
+				nvidia,function = "pcie";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			pex_l2_clkreq_n_pcc7 {
+				nvidia,pins = "pex_l2_clkreq_n_pcc7",
+						"pex_l0_prsnt_n_pdd0",
+						"pex_l0_clkreq_n_pdd2",
+						"pex_l2_prsnt_n_pdd7";
+				nvidia,function = "pcie";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pex_wake_n_pdd3 {
+				nvidia,pins = "pex_wake_n_pdd3";
+				nvidia,function = "pcie";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
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
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			spi2_cs1_n_pw2 {
+				nvidia,pins = "spi2_cs1_n_pw2",
+						"spi2_cs2_n_pw3";
+				nvidia,function = "spi2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			spi2_sck_px2 {
+				nvidia,pins = "spi2_sck_px2";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi_a16_pj7 {
+				nvidia,pins = "gmi_a16_pj7",
+						"gmi_a19_pk7";
+				nvidia,function = "spi4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi_a17_pb0 {
+				nvidia,pins = "gmi_a17_pb0",
+						"gmi_a18_pb1";
+				nvidia,function = "spi4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			spi2_mosi_px0 {
+				nvidia,pins = "spi2_mosi_px0";
+				nvidia,function = "spi6";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			spdif_out_pk5 {
+				nvidia,pins = "spdif_out_pk5";
+				nvidia,function = "spdif";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			spdif_in_pk6 {
+				nvidia,pins = "spdif_in_pk6";
+				nvidia,function = "spdif";
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
+						"lcd_pwr2_pc6",
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
+						"lcd_cs0_n_pn4",
+						"lcd_sdout_pn5",
+						"lcd_dc0_pn6",
+						"lcd_sdin_pz2",
+						"lcd_wr_n_pz3",
+						"lcd_sck_pz4",
+						"lcd_cs1_n_pw0",
+						"lcd_m1_pw1";
+				nvidia,function = "displaya";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			lcd_dc1_pd2 {
+				nvidia,pins = "lcd_dc1_pd2";
+				nvidia,function = "displaya";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			clk_32k_out_pa0 {
+				nvidia,pins = "clk_32k_out_pa0";
+				nvidia,function = "blink";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* KBC keys */
+			kb_row0_pr0 {
+				nvidia,pins = "kb_row0_pr0",
+						"kb_row1_pr1",
+						"kb_row2_pr2",
+						"kb_row3_pr3",
+						"kb_row8_ps0",
+						"kb_col0_pq0",
+						"kb_col1_pq1",
+						"kb_col2_pq2",
+						"kb_col3_pq3",
+						"kb_col4_pq4",
+						"kb_col5_pq5",
+						"kb_col7_pq7";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			kb_row4_pr4 {
+				nvidia,pins = "kb_row4_pr4",
+						"kb_row7_pr7",
+						"kb_row10_ps2",
+						"kb_row13_ps5";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			kb_row11_ps3 {
+				nvidia,pins = "kb_row11_ps3",
+						"kb_row12_ps4",
+						"kb_row15_ps7";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			kb_row14_ps6 {
+				nvidia,pins = "kb_row14_ps6";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gmi_iordy_pi5 {
+				nvidia,pins = "gmi_iordy_pi5";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
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
+			pu1 {
+				nvidia,pins = "pu1";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pu2 {
+				nvidia,pins = "pu2";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pv0 {
+				nvidia,pins = "pv0";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pv1 {
+				nvidia,pins = "pv1";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			pcc1 {
+				nvidia,pins = "pcc1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc4_rst_n_pcc3 {
+				nvidia,pins = "sdmmc4_rst_n_pcc3";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pv3 {
+				nvidia,pins = "pv3";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
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
+			vi_d11_pt3 {
+				nvidia,pins = "vi_d11_pt3";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			pu0 {
+				nvidia,pins = "pu0";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pu3 {
+				nvidia,pins = "pu3";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pu6 {
+				nvidia,pins = "pu6";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pex_l1_prsnt_n_pdd4 {
+				nvidia,pins = "pex_l1_prsnt_n_pdd4",
+						"pex_l1_clkreq_n_pdd6";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			gmi_wait_pi7 {
+				nvidia,pins = "gmi_wait_pi7",
+						"gmi_cs0_n_pj0",
+						"gmi_cs1_n_pj2",
+						"gmi_cs4_n_pk2";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_ad0_pg0 {
+				nvidia,pins = "gmi_ad0_pg0",
+						"gmi_ad1_pg1",
+						"gmi_ad2_pg2",
+						"gmi_ad3_pg3",
+						"gmi_ad4_pg4",
+						"gmi_ad5_pg5",
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
+			gmi_cs2_n_pk3 {
+				nvidia,pins = "gmi_cs2_n_pk3";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi_cs3_n_pk4 {
+				nvidia,pins = "gmi_cs3_n_pk4";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
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
+			gmi_ad13_ph5 {
+				nvidia,pins = "gmi_ad13_ph5",
+						"gmi_ad12_ph4",
+						"gmi_cs7_n_pi6";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi_rst_n_pi4 {
+				nvidia,pins = "gmi_rst_n_pi4";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			gmi_ad8_ph0 {
+				nvidia,pins = "gmi_ad8_ph0";
+				nvidia,function = "pwm0";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_ad9_ph1 {
+				nvidia,pins = "gmi_ad9_ph1";
+				nvidia,function = "pwm1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gmi_wp_n_pc7 {
+				nvidia,pins = "gmi_wp_n_pc7";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi_cs6_n_pi3 {
+				nvidia,pins = "gmi_cs6_n_pi3";
+				nvidia,function = "sata";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
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
+			/* HDMI hot-plug-detect */
+			hdmi_int_pn7 {
+				nvidia,pins = "hdmi_int_pn7";
+				nvidia,function = "hdmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			pu4 {
+				nvidia,pins = "pu4";
+				nvidia,function = "pwm1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pu5 {
+				nvidia,pins = "pu5";
+				nvidia,function = "pwm2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			jtag_rtck_pu7 {
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
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			clk1_out_pw4 {
+				nvidia,pins = "clk1_out_pw4";
+				nvidia,function = "extperiph1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			clk2_out_pw5 {
+				nvidia,pins = "clk2_out_pw5";
+				nvidia,function = "extperiph2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			clk3_out_pee0 {
+				nvidia,pins = "clk3_out_pee0";
+				nvidia,function = "extperiph3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			sys_clk_req_pz5 {
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
+			clk1_req_pee2 {
+				nvidia,pins = "clk1_req_pee2";
+				nvidia,function = "dap";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			clk2_req_pcc5 {
+				nvidia,pins = "clk2_req_pcc5";
+				nvidia,function = "dap";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			clk3_req_pee1 {
+				nvidia,pins = "clk3_req_pee1";
+				nvidia,function = "dev3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
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
+			pv2 {
+				nvidia,pins = "pv2",
+						"kb_row5_pr5";
+				nvidia,function = "owr";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			pbb3 {
+				nvidia,pins = "pbb3";
+				nvidia,function = "vgp3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pbb7 {
+				nvidia,pins = "pbb7";
+				nvidia,function = "i2s4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			cam_mclk_pcc0 {
+				nvidia,pins = "cam_mclk_pcc0";
+				nvidia,function = "vi_alt3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
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
+				nvidia,high-speed-mode = <0>;
+				nvidia,schmitt = <TEGRA_PIN_ENABLE>;
+				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_1>;
+				nvidia,pull-down-strength = <31>;
+				nvidia,pull-up-strength = <31>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+			};
+			drive_sdio1 {
+				nvidia,pins = "drive_sdio1";
+				nvidia,high-speed-mode = <0>;
+				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+				nvidia,pull-down-strength = <5>;
+				nvidia,pull-up-strength = <5>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FAST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FAST>;
+			};
+			drive_sdio3 {
+				nvidia,pins = "drive_sdio3";
+				nvidia,high-speed-mode = <0>;
+				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+				nvidia,pull-down-strength = <46>;
+				nvidia,pull-up-strength = <42>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FAST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FAST>;
+			};
+			drive_gma {
+				nvidia,pins = "drive_gma",
+						"drive_gmb",
+						"drive_gmc",
+						"drive_gmd";
+				nvidia,pull-down-strength = <9>;
+				nvidia,pull-up-strength = <9>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
+			};
+			drive_lcd2 {
+				nvidia,pins = "drive_lcd2";
+				nvidia,high-speed-mode = <0>;
+				nvidia,schmitt = <TEGRA_PIN_ENABLE>;
+				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_4>;
+				nvidia,pull-down-strength = <20>;
+				nvidia,pull-up-strength = <20>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
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
+		/* Azurewave AW-AH663 BCM4330B1 */
+		bluetooth {
+			compatible = "brcm,bcm4330-bt";
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
+			vbat-supply  = <&vdd_3v3_sys>;
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
+		clock-frequency = <400000>;
+
+		/* Wolfson Microelectronics WM8903 audio codec */
+		wm8903: audio-codec@1a {
+			compatible = "wlf,wm8903";
+			reg = <0x1a>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_EDGE_BOTH>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			micdet-cfg = <0>;
+			micdet-delay = <100>;
+
+			gpio-cfg = <0xffffffff 0xffffffff 0 0xffffffff 0xffffffff>;
+
+			AVDD-supply  = <&vdd_1v8_vio>;
+			CPVDD-supply = <&vdd_1v8_vio>;
+			DBVDD-supply = <&vdd_1v8_vio>;
+			DCVDD-supply = <&vdd_1v8_vio>;
+		};
+
+	};
+
+	i2c2: i2c@7000c400 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		/* Atmel touchscreen */
+		touchscreen@4d {
+			compatible = "atmel,maxtouch";
+			reg = <0x4d>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(H, 4) IRQ_TYPE_EDGE_FALLING>;
+			reset-gpios = <&gpio TEGRA_GPIO(H, 6) GPIO_ACTIVE_LOW>;
+
+			vdda-supply = <&vdd_3v3_sys>;
+			vdd-supply  = <&vdd_3v3_sys>;
+		};
+	};
+
+	i2c3: i2c@7000c500 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		light-sensor@44 {
+			compatible = "isil,isl29023";
+			reg = <0x44>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(Q, 3) IRQ_TYPE_LEVEL_HIGH>;
+
+			vcc-supply = <&vdd_3v3_sen>;
+		};
+
+		/* AsahiKASEI AK8975 magnetometer sensor */
+		magnetometer@c {
+			compatible = "asahi-kasei,ak8975";
+			reg = <0x0c>;
+
+			vdd-supply = <&vdd_3v3_sen>;
+			vid-supply = <&vdd_1v8_vio>;
+
+			mount-matrix =   "0",  "1",  "0",
+					 "1",  "0",  "0",
+					 "0",  "0", "-1";
+		};
+
+		gyroscope@68 {
+			compatible = "invensense,mpu3050";
+			reg = <0x68>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(X, 1) IRQ_TYPE_EDGE_RISING>;
+
+			vdd-supply = <&vdd_3v3_sen>;
+			vlogic-supply = <&vdd_1v8_vio>;
+
+			mount-matrix =   "0",  "1",  "0",
+					 "1",  "0",  "0",
+					 "0",  "0", "-1";
+
+			/* External I2C interface */
+			i2c-gate {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				accelerometer@f {
+					compatible = "kionix,kxtf9";
+					reg = <0x0f>;
+
+					interrupt-parent = <&gpio>;
+					interrupts = <TEGRA_GPIO(L, 1) IRQ_TYPE_EDGE_RISING>;
+
+					vdd-supply = <&vdd_1v8_vio>;
+					vddio-supply = <&vdd_1v8_vio>;
+
+					mount-matrix =  "-1",  "0",  "0",
+							 "0",  "1",  "0",
+							 "0",  "0",  "1";
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
+			interrupts = <TEGRA_GPIO(U, 5) IRQ_TYPE_EDGE_FALLING>;
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
+			vcc1-supply = <&vdd_5v0_sys>;
+			vcc2-supply = <&vdd_5v0_sys>;
+			vcc3-supply = <&vdd_1v8_vio>;
+			vcc4-supply = <&vdd_1v8_vio>;
+			vcc5-supply = <&vdd_5v0_sys>;
+			vcc6-supply = <&vddio_1v2_ddr>;
+			vcc7-supply = <&vdd_5v0_sys>;
+			vccio-supply = <&vdd_5v0_sys>;
+
+			pmic-sleep-hog {
+				gpio-hog;
+				gpios = <0 GPIO_ACTIVE_HIGH>,
+					<2 GPIO_ACTIVE_HIGH>,
+					<6 GPIO_ACTIVE_HIGH>,
+					<8 GPIO_ACTIVE_HIGH>;
+				output-high;
+			};
+
+			regulators {
+				/* VDD1 is not used by Chagall */
+
+				vddio_1v2_ddr: vdd2 {
+					regulator-name = "vddio_1v2_ddr";
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
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+				};
+
+				/* uSD slot VDD */
+				vdd_usd: ldo2 {
+					regulator-name = "vdd_usd";
+					regulator-min-microvolt = <3200000>;
+					regulator-max-microvolt = <3200000>;
+				};
+
+				/* uSD slot VDDIO */
+				vddio_usd: ldo3 {
+					regulator-name = "vddio_usd";
+					regulator-min-microvolt = <1900000>;
+					regulator-max-microvolt = <3200000>;
+				};
+
+				ldo4 {
+					regulator-name = "vdd_rtc";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+				};
+
+				ldo5 {
+					regulator-name = "vdd_1v3_cam_isp";
+					regulator-min-microvolt = <1300000>;
+					regulator-max-microvolt = <1300000>;
+				};
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
+	vdd_5v0_sys: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0_sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_3v3_sys: regulator-3v {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3_sys";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_pnl: regulator-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_panel";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-enable-ramp-delay = <300000>;
+		gpio = <&gpio TEGRA_GPIO(W, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
+
+	vdd_3v3_sen: regulator-sensors {
+		compatible = "regulator-fixed";
+		regulator-name = "sen_3v3_en";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio TEGRA_GPIO(K, 5) GPIO_ACTIVE_HIGH>;
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
+		gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
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
+	vdd_vbus_usb1: regulator-usb1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_vbus_micro_usb";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(DD, 3) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	vdd_vbus_usb3: regulator-usb3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_vbus_typea_usb";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(CC, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	pmc@7000e400 {
+		status = "okay";
+		nvidia,invert-interrupt;
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
+		bus-width = <4>;
+		non-removable;
+
+		mmc-pwrseq = <&brcm_wifi_pwrseq>;
+		vmmc-supply = <&vdd_3v3_sys>;
+		vqmmc-supply = <&vdd_1v8_vio>;
+
+		/* Azurewave AW-AH663 BCM4330B1 */
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
+		non-removable;
+	};
+
+	usb@7d000000 {
+		compatible = "nvidia,tegra30-udc";
+		status = "okay";
+		dr_mode = "otg";
+		vbus-supply = <&vdd_vbus_usb1>;
+	};
+
+	usb-phy@7d000000 {
+		status = "okay";
+		dr_mode = "otg";
+		nvidia,hssync-start-delay = <0>;
+		nvidia,xcvr-lsfslew = <2>;
+		nvidia,xcvr-lsrslew = <2>;
+	};
+
+	usb@7d008000 {
+		status = "okay";
+	};
+
+	usb-phy@7d008000 {
+		status = "okay";
+		vbus-supply = <&vdd_vbus_usb3>;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+
+		enable-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
+		power-supply = <&vdd_5v0_bl>;
+		pwms = <&pwm 0 5000000>;
+
+		brightness-levels = <1 255>;
+		num-interpolated-steps = <254>;
+		default-brightness-level = <15>;
+	};
+
+	display-panel {
+		compatible = "panel-lvds";
+
+		width-mm = <217>;
+		height-mm = <136>;
+
+		data-mapping = "jeida-24";
+
+		panel-timing {
+			/* 1280x800@60Hz */
+			clock-frequency = <68000000>;
+			hactive = <1280>;
+			vactive = <800>;
+			hfront-porch = <48>;
+			hback-porch = <18>;
+			hsync-len = <30>;
+			vsync-len = <5>;
+			vfront-porch = <3>;
+			vback-porch = <12>;
+		};
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
+		gpios = <&gpio TEGRA_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
+	};
+
+	gpio-keys {
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
+			gpios = <&gpio TEGRA_GPIO(Q, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		volume-down {
+			label = "Volume Down";
+			gpios = <&gpio TEGRA_GPIO(Q, 1) GPIO_ACTIVE_LOW>;
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
+		dock-insert {
+			label = "Chagall Dock";
+			gpios = <&gpio TEGRA_GPIO(S, 4) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_DOCK>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		lineout-detect {
+			label = "Audio dock line-out detect";
+			gpios = <&gpio TEGRA_GPIO(S, 3) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LINEOUT_INSERT>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+	};
+
+	sound {
+		compatible = "pegatron,tegra-audio-wm8903-chagall",
+			     "nvidia,tegra-audio-wm8903";
+		nvidia,model = "Pegatron Chagall WM8903";
+
+		nvidia,audio-routing =
+			"Headphone Jack", "HPOUTR",
+			"Headphone Jack", "HPOUTL",
+			"Int Spk", "ROP",
+			"Int Spk", "RON",
+			"Int Spk", "LOP",
+			"Int Spk", "LON",
+			"IN1R", "Mic Jack",
+			"DMICDAT", "Int Mic";
+
+		nvidia,i2s-controller = <&tegra_i2s1>;
+		nvidia,audio-codec = <&wm8903>;
+
+		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
+		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
+		nvidia,headset;
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
+		 * Chagall from getting too hot from a user's tactile
+		 * perspective. The CPU zone is intended to protect
+		 * silicon from damage.
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
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&actmon THERMAL_NO_LIMIT
+								  THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
+	haptic-feedback {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&gpio TEGRA_GPIO(U, 4) GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&vdd_3v3_sys>;
+	};
+
+	memory-controller@7000f000 {
+		emc-timings-0 {
+			/* SAMSUNG K4P8G304EB FGC1 */
+			nvidia,ram-code = <0>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emem-configuration = < 0x00020001 0xc0000010
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060402 0x73e30303 0x001f0000 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emem-configuration = < 0x00010001 0xc0000010
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060402 0x72c30303 0x001f0000 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = < 0x00000001 0xc0000018
+					0x00000001 0x00000001 0x00000003 0x00000001
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060403 0x72430504 0x001f0000 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = < 0x00000003 0xc0000025
+					0x00000001 0x00000001 0x00000006 0x00000003
+					0x00000005 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000003 0x00000002
+					0x02030001 0x00070506 0x71e40a07 0x001f0000 >;
+			};
+
+			timing-400000000 {
+				clock-frequency = <400000000>;
+
+				nvidia,emem-configuration = < 0x00000006 0xc0000048
+					0x00000002 0x00000003 0x0000000c 0x00000007
+					0x00000009 0x00000001 0x00000002 0x00000006
+					0x00000001 0x00000000 0x00000004 0x00000004
+					0x04040001 0x000d090c 0x7026120d 0x001f0000 >;
+			};
+		};
+
+		emc-timings-1 {
+			/* ELPIDA EDB8132B2MA 8D_F */
+			nvidia,ram-code = <1>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emem-configuration = < 0x00020001 0xc0000010
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060402 0x73e30303 0x001f0000 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emem-configuration = < 0x00010001 0xc0000010
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060402 0x72c30303 0x001f0000 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = < 0x00000001 0xc0000018
+					0x00000001 0x00000001 0x00000003 0x00000001
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060403 0x72430504 0x001f0000 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = < 0x00000003 0xc0000025
+					0x00000001 0x00000001 0x00000006 0x00000003
+					0x00000005 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000003 0x00000002
+					0x02030001 0x00070506 0x71e40a07 0x001f0000 >;
+			};
+
+			timing-400000000 {
+				clock-frequency = <400000000>;
+
+				nvidia,emem-configuration = < 0x00000006 0xc0000048
+					0x00000002 0x00000003 0x0000000c 0x00000007
+					0x00000009 0x00000001 0x00000002 0x00000006
+					0x00000001 0x00000000 0x00000004 0x00000004
+					0x04040001 0x000d090c 0x7026120d 0x001f0000 >;
+			};
+		};
+
+		emc-timings-2 {
+			/* SAMSUNG K4P8G304EB FGC2 */
+			nvidia,ram-code = <2>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emem-configuration = < 0x00020001 0xc0000010
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060402 0x73e30303 0x001f0000 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emem-configuration = < 0x00010001 0xc0000010
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060402 0x72c30303 0x001f0000 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = < 0x00000001 0xc0000018
+					0x00000001 0x00000001 0x00000003 0x00000001
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060403 0x72430504 0x001f0000 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = < 0x00000003 0xc0000025
+					0x00000001 0x00000001 0x00000006 0x00000003
+					0x00000005 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000003 0x00000002
+					0x02030001 0x00070506 0x71e40a07 0x001f0000 >;
+			};
+
+			timing-533000000 {
+				clock-frequency = <533000000>;
+
+				nvidia,emem-configuration = < 0x00000008 0xc0000060
+					0x00000003 0x00000004 0x00000010 0x0000000a
+					0x0000000d 0x00000002 0x00000002 0x00000008
+					0x00000002 0x00000000 0x00000004 0x00000005
+					0x05040002 0x00110b10 0x70281811 0x001f0000 >;
+			};
+		};
+
+		emc-timings-3 {
+			/* HYNIX H9TCNNN8JDMMPR NGM */
+			nvidia,ram-code = <3>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emem-configuration = < 0x00020001 0xc0000010
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060402 0x73e30303 0x001f0000 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emem-configuration = < 0x00010001 0xc0000010
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060402 0x72c30303 0x001f0000 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = < 0x00000001 0xc0000018
+					0x00000001 0x00000001 0x00000003 0x00000001
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060403 0x72430504 0x001f0000 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = < 0x00000003 0xc0000025
+					0x00000001 0x00000001 0x00000006 0x00000003
+					0x00000005 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000003 0x00000002
+					0x02030001 0x00070506 0x71e40a07 0x001f0000 >;
+			};
+
+			timing-533000000 {
+				clock-frequency = <533000000>;
+
+				nvidia,emem-configuration = < 0x00000008 0xc0000060
+					0x00000003 0x00000004 0x00000010 0x0000000a
+					0x0000000d 0x00000002 0x00000002 0x00000008
+					0x00000002 0x00000000 0x00000004 0x00000005
+					0x05040002 0x00110b10 0x70281811 0x001f0000 >;
+			};
+		};
+	};
+
+	memory-controller@7000f400 {
+		emc-timings-0 {
+			/* SAMSUNG K4P8G304EB FGC1 */
+			nvidia,ram-code = <0>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000009>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000001
+					0x00000003 0x00000002 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x00000009 0x00000060 0x00000000 0x00000018
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x00000004 0x00000004
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x0000006b 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00004282 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x0000000a 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x800001c5 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000009>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000003
+					0x00000006 0x00000002 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x00000009 0x000000c0 0x00000000 0x00000030
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x00000008 0x00000008
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x000000d5 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00004282 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x00000013 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x80000287 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x0000000a>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000006
+					0x0000000d 0x00000004 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x00000009 0x00000181 0x00000000 0x00000060
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x0000000f 0x0000000f
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x000001a9 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00004282 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x00000025 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x8000040b 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010042>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000013>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x0000000c
+					0x0000001a 0x00000008 0x00000003 0x00000005
+					0x00000004 0x00000001 0x00000006 0x00000003
+					0x00000003 0x00000002 0x00000002 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000c
+					0x0000000a 0x00000303 0x00000000 0x000000c0
+					0x00000001 0x00000001 0x00000003 0x00000000
+					0x00000001 0x00000007 0x0000001d 0x0000001d
+					0x00000004 0x0000000b 0x00000005 0x00000004
+					0x00000002 0x00000351 0x00000004 0x00000006
+					0x00000000 0x00000000 0x00004282 0x004400a4
+					0x00008000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x000e0220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x0000004a 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x80000713 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-400000000 {
+				clock-frequency = <400000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010082>;
+				nvidia,emc-mode-2 = <0x00020004>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000024>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000017
+					0x00000033 0x00000010 0x00000007 0x00000007
+					0x00000007 0x00000002 0x0000000a 0x00000007
+					0x00000007 0x00000003 0x00000002 0x00000000
+					0x00000003 0x00000007 0x00000004 0x0000000d
+					0x0000000e 0x000005e9 0x00000000 0x0000017a
+					0x00000002 0x00000002 0x00000007 0x00000000
+					0x00000001 0x0000000c 0x00000038 0x00000038
+					0x00000006 0x00000014 0x00000009 0x00000004
+					0x00000002 0x00000680 0x00000000 0x00000006
+					0x00000000 0x00000000 0x00006282 0x001d0084
+					0x00008000 0x00034000 0x00034000 0x00034000
+					0x00034000 0x00034000 0x00034000 0x00034000
+					0x00034000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00038000 0x00038000 0x00038000
+					0x00038000 0x00080220 0x0800003d 0x00000000
+					0x77ffc004 0x01f1f408 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x00000090 0x000c000c 0xa0f10404 0x00000000
+					0x00000000 0x80000ce6 0xe0000000 0xff00ff88 >;
+			};
+		};
+
+		emc-timings-1 {
+			/* ELPIDA EDB8132B2MA 8D_F */
+			nvidia,ram-code = <1>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000009>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000001
+					0x00000003 0x00000002 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x0000000a 0x00000060 0x00000000 0x00000018
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x00000004 0x00000004
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x0000006b 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00004282 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x0000000a 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x800001c5 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000009>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000003
+					0x00000006 0x00000002 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x0000000a 0x000000c0 0x00000000 0x00000030
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x00000008 0x00000008
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x000000d5 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00004282 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x00000013 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x80000287 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x0000000a>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000006
+					0x0000000d 0x00000004 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x0000000a 0x00000181 0x00000000 0x00000060
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x0000000f 0x0000000f
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x000001a9 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00004282 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x00000025 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x8000040b 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010042>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000013>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x0000000c
+					0x0000001a 0x00000008 0x00000003 0x00000005
+					0x00000004 0x00000001 0x00000006 0x00000003
+					0x00000003 0x00000002 0x00000002 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000c
+					0x0000000a 0x00000303 0x00000000 0x000000c0
+					0x00000001 0x00000001 0x00000003 0x00000000
+					0x00000001 0x00000007 0x0000001d 0x0000001d
+					0x00000004 0x0000000b 0x00000005 0x00000004
+					0x00000002 0x00000351 0x00000004 0x00000006
+					0x00000000 0x00000000 0x00004282 0x004400a4
+					0x00008000 0x00070000 0x00070000 0x00070000
+					0x00070000 0x00070000 0x00070000 0x00070000
+					0x00070000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x000e0220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x0000004a 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x80000713 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-400000000 {
+				clock-frequency = <400000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010082>;
+				nvidia,emc-mode-2 = <0x00020004>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000024>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000017
+					0x00000033 0x00000010 0x00000007 0x00000007
+					0x00000007 0x00000002 0x0000000a 0x00000007
+					0x00000007 0x00000003 0x00000002 0x00000000
+					0x00000003 0x00000007 0x00000004 0x0000000d
+					0x0000000e 0x000005e9 0x00000000 0x0000017a
+					0x00000002 0x00000002 0x00000007 0x00000000
+					0x00000001 0x0000000c 0x00000038 0x00000038
+					0x00000006 0x00000014 0x00000009 0x00000004
+					0x00000002 0x00000680 0x00000000 0x00000004
+					0x00000000 0x00000000 0x00006282 0x001d0084
+					0x00008000 0x00034000 0x00034000 0x00034000
+					0x00034000 0x00034000 0x00034000 0x00034000
+					0x00034000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00048000 0x00048000 0x00048000
+					0x00048000 0x00060220 0x0800003d 0x00000000
+					0x77ffc004 0x01f1f408 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x00000090 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x80000ce6 0xe0000000 0xff00ff88 >;
+			};
+		};
+
+		emc-timings-2 {
+			/* SAMSUNG K4P8G304EB FGC2 */
+			nvidia,ram-code = <2>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000009>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000001
+					0x00000003 0x00000002 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x0000000a 0x00000060 0x00000000 0x00000018
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x00000004 0x00000004
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x0000006b 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00004282 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x0000000a 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x800001c5 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000009>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000003
+					0x00000006 0x00000002 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x0000000a 0x000000c0 0x00000000 0x00000030
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x00000008 0x00000008
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x000000d5 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00004282 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x00000013 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x80000287 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x0000000a>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000006
+					0x0000000d 0x00000004 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x00000009 0x00000181 0x00000000 0x00000060
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x0000000f 0x0000000f
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x000001a9 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00004282 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x00000025 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x8000040b 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010042>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000013>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x0000000c
+					0x0000001a 0x00000008 0x00000003 0x00000005
+					0x00000004 0x00000001 0x00000006 0x00000003
+					0x00000003 0x00000002 0x00000002 0x00000000
+					0x00000001 0x00000004 0x00000001 0x0000000c
+					0x0000000a 0x00000303 0x00000000 0x000000c0
+					0x00000001 0x00000001 0x00000003 0x00000000
+					0x00000001 0x00000007 0x0000001d 0x0000001d
+					0x00000004 0x0000000b 0x00000005 0x00000004
+					0x00000002 0x00000351 0x00000005 0x00000004
+					0x00000000 0x00000000 0x00004282 0x004400a4
+					0x00008000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x000e0220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x0000004a 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x80000713 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-533000000 {
+				clock-frequency = <533000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x000100c2>;
+				nvidia,emc-mode-2 = <0x00020006>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000030>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x0000001f
+					0x00000045 0x00000016 0x00000009 0x00000008
+					0x00000009 0x00000003 0x0000000d 0x00000009
+					0x00000009 0x00000005 0x00000003 0x00000000
+					0x00000004 0x0000000a 0x00000006 0x0000000d
+					0x00000010 0x000007df 0x00000000 0x000001f7
+					0x00000003 0x00000003 0x00000009 0x00000000
+					0x00000001 0x0000000f 0x0000004b 0x0000004b
+					0x00000008 0x0000001b 0x0000000c 0x00000004
+					0x00000002 0x000008aa 0x00000000 0x00000004
+					0x00000000 0x00000000 0x00006282 0xf0120091
+					0x00008000 0x007f8008 0x007f8008 0x007f8008
+					0x007f8008 0x007f8008 0x007f8008 0x007f8008
+					0x007f8008 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x0000000c 0x0000000c 0x0000000c
+					0x0000000c 0x00080220 0x0200003d 0x00000000
+					0x77ffc004 0x01f1f408 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x000000c0 0x000e000e 0xa0f10000 0x00000000
+					0x00000000 0x800010d9 0xf0000000 0xff00ff88 >;
+			};
+		};
+
+		emc-timings-3 {
+			/* HYNIX H9TCNNN8JDMMPR NGM */
+			nvidia,ram-code = <3>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000009>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000001
+					0x00000003 0x00000002 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x0000000a 0x00000060 0x00000000 0x00000018
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x00000004 0x00000004
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x0000006b 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00004282 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x0000000a 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x800001c5 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000009>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000003
+					0x00000006 0x00000002 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x0000000a 0x000000c0 0x00000000 0x00000030
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x00000008 0x00000008
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x000000d5 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00004282 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x00000013 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x80000287 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x0000000a>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000006
+					0x0000000d 0x00000004 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x0000000a 0x00000181 0x00000000 0x00000060
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x0000000f 0x0000000f
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x000001a9 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00004282 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x00000025 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x8000040b 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010042>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000013>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x0000000c
+					0x0000001a 0x00000008 0x00000003 0x00000005
+					0x00000004 0x00000001 0x00000006 0x00000003
+					0x00000003 0x00000002 0x00000002 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000c
+					0x0000000b 0x00000303 0x00000000 0x000000c0
+					0x00000001 0x00000001 0x00000003 0x00000000
+					0x00000001 0x00000007 0x0000001d 0x0000001d
+					0x00000004 0x0000000b 0x00000005 0x00000004
+					0x00000002 0x00000351 0x00000004 0x00000006
+					0x00000000 0x00000000 0x00004282 0x004400a4
+					0x00008000 0x00072000 0x00072000 0x00072000
+					0x00072000 0x00072000 0x00072000 0x00072000
+					0x00072000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x000e0220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x0000004a 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x80000713 0xd0000000 0xff00ff00 >;
+			};
+
+			timing-533000000 {
+				clock-frequency = <533000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x000100c2>;
+				nvidia,emc-mode-2 = <0x00020006>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000030>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x0000001f
+					0x00000045 0x00000016 0x00000009 0x00000008
+					0x00000009 0x00000003 0x0000000d 0x00000009
+					0x00000009 0x00000005 0x00000003 0x00000000
+					0x00000004 0x00000009 0x00000006 0x0000000d
+					0x00000010 0x000007df 0x00000000 0x000001f7
+					0x00000003 0x00000003 0x00000009 0x00000000
+					0x00000001 0x0000000f 0x0000004b 0x0000004b
+					0x00000008 0x0000001b 0x0000000c 0x00000004
+					0x00000002 0x000008aa 0x00000000 0x00000006
+					0x00000000 0x00000000 0x00006282 0xf0120091
+					0x00008000 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x0000000c 0x0000000c 0x0000000c
+					0x0000000c 0x000a0220 0x0800003d 0x00000000
+					0x77ffc004 0x01f1f408 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x000000c0 0x000e000e 0xa0f10000 0x00000000
+					0x00000000 0x800010d9 0xe0000000 0xff00ff88 >;
+			};
+		};
+	};
+};
+
+&emc_icc_dvfs_opp_table {
+	/delete-node/ opp-625000000-1200;
+	/delete-node/ opp-625000000-1250;
+	/delete-node/ opp-667000000-1200;
+	/delete-node/ opp-750000000-1300;
+	/delete-node/ opp-800000000-1300;
+	/delete-node/ opp-900000000-1350;
+};
+
+&emc_bw_dfs_opp_table {
+	/delete-node/ opp-625000000;
+	/delete-node/ opp-667000000;
+	/delete-node/ opp-750000000;
+	/delete-node/ opp-800000000;
+	/delete-node/ opp-900000000;
+};
-- 
2.33.1


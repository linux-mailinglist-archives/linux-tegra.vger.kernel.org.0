Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75C511D4038
	for <lists+linux-tegra@lfdr.de>; Thu, 14 May 2020 23:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgENViO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 14 May 2020 17:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728216AbgENViM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 May 2020 17:38:12 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30328C061A0C;
        Thu, 14 May 2020 14:38:11 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id h26so53832lfg.6;
        Thu, 14 May 2020 14:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NzycdWzT1lK9CEr7Nj18jKyhdSnxSkjyQ07/JBOSinE=;
        b=WKpObvnlTZbu9SUL7bqnnzF1DrVSfSCJwYvnDpzEa/Bu3l8jF73HE6l/nZY69+enkF
         kXd9/gkx4eTqdbWj15xx5hJAYXX577biuuwrCUO9xRGRC7oz57LJ9VPDOqgesDi0NWZi
         k6uzcRsqA0u5/wgQYOzw/5iMn3c5UMwELgeZxJupSNgjfSyybitd2fMxI3P6p871iAW3
         mX/IOH7A71OikugxrDRhrr45RVK7Pa8Ve863tIK/b+kfAdd1FyDdUPBw4yNvGX4OjQM3
         AktqDiD9H8WXvPPGKKMMCIZ0pi5DP2vNWGalRuy/8+DU5WjZP4KxXXg9KbOXgp8gf2z5
         ZOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NzycdWzT1lK9CEr7Nj18jKyhdSnxSkjyQ07/JBOSinE=;
        b=mHLKkpcEKa3rN+JS06rO0GJq9SNZt/VPiLWg6wy1wgIeeT07Y5h7s9kuR7h1SNda2g
         IBW8C7peYz97UjxeseJW4NTfOGwYSl2uLp/xGzfvLdFhtQxe8yw254Pm+b1avICs1ido
         /z1PGyTJRfew3DHjvKaQQ7TKLSKVm8q5kEj4NJHW7M/IPrSp10POAPTS6BpmCrQectQ8
         PcaFgXJBlLRgtOjL8apzgjRxQVpQaeF3M3rbfaiQmSB6Rn2i5H/xe1oYR6DuYDi+RaGh
         W83mTVXDGsDgTC0L5zvpSdT4OJqPjwSuWqWu7UyKGm9XoYLTTE/DUw0XjrPhSJ2WGCa2
         SA8A==
X-Gm-Message-State: AOAM530vJ0L9DHvHtNWEbkBiUYMp1bfbMMCclMJgW9krx4tAsPO0VX2j
        SGhlxexItxVOVj3eeiY9Kl0=
X-Google-Smtp-Source: ABdhPJx5bn0cQgWVutB6JJejfg2bnSmmHVNONAtAs1ySsA0tU4CGTuX6WIhFxBt0bXXHQPxhJtKuPg==
X-Received: by 2002:ac2:555b:: with SMTP id l27mr137357lfk.170.1589492289000;
        Thu, 14 May 2020 14:38:09 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id a12sm63628ljj.64.2020.05.14.14.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 14:38:07 -0700 (PDT)
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
        Matt Merhar <mattmerhar@protonmail.com>,
        Zack Pearsall <zpearsall@yahoo.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/6] ARM: tegra: Add device-tree for ASUS Google Nexus 7
Date:   Fri, 15 May 2020 00:36:50 +0300
Message-Id: <20200514213654.12834-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200514213654.12834-1-digetx@gmail.com>
References: <20200514213654.12834-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There are few hardware variants of NVIDIA Tegra30-based Nexus 7 device:

1. WiFi-only (named Grouper)
2. GSM (named Tilapia)
3. Using Maxim PMIC (E1565 board ID)
4. Using Ti PMIC (PM269 board ID)

This patch adds device-trees for known and tested variants.

Link: https://wiki.postmarketos.org/wiki/Google_Nexus_7_2012_(asus-grouper)
Tested-by: Pedro Ângelo <pangelo@void.io>
Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Tested-by: Zack Pearsall <zpearsall@yahoo.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/Makefile                    |    3 +
 .../dts/tegra30-asus-nexus7-grouper-E1565.dts |    9 +
 .../dts/tegra30-asus-nexus7-grouper-PM269.dts |    9 +
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 2503 +++++++++++++++++
 ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |  188 ++
 .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  |  151 +
 .../boot/dts/tegra30-asus-nexus7-grouper.dtsi |  462 +++
 .../dts/tegra30-asus-nexus7-tilapia-E1565.dts |    9 +
 .../boot/dts/tegra30-asus-nexus7-tilapia.dtsi |  548 ++++
 9 files changed, 3882 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-E1565.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-PM269.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia-E1565.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 93cbd99e57b6..00a58e5f49fb 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1204,6 +1204,9 @@ dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += \
 dtb-$(CONFIG_ARCH_TEGRA_3x_SOC) += \
 	tegra30-apalis-eval.dtb \
 	tegra30-apalis-v1.1-eval.dtb \
+	tegra30-asus-nexus7-grouper-PM269.dtb \
+	tegra30-asus-nexus7-grouper-E1565.dtb \
+	tegra30-asus-nexus7-tilapia-E1565.dtb \
 	tegra30-beaver.dtb \
 	tegra30-cardhu-a02.dtb \
 	tegra30-cardhu-a04.dtb \
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-E1565.dts b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-E1565.dts
new file mode 100644
index 000000000000..a25b8560b0cd
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-E1565.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra30-asus-nexus7-grouper-maxim-pmic.dtsi"
+#include "tegra30-asus-nexus7-grouper.dtsi"
+
+/ {
+	model = "ASUS Google Nexus 7 (Project Nakasi / ME370T) E1565";
+};
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-PM269.dts b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-PM269.dts
new file mode 100644
index 000000000000..06ef13ea5df8
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-PM269.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra30-asus-nexus7-grouper-ti-pmic.dtsi"
+#include "tegra30-asus-nexus7-grouper.dtsi"
+
+/ {
+	model = "ASUS Google Nexus 7 (Project Nakasi / ME370T) PM269";
+};
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
new file mode 100644
index 000000000000..3c43bc5d8c74
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -0,0 +1,2503 @@
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
+	aliases {
+		rtc0 = &pmic;
+		rtc1 = "/rtc@7000e000";
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
+		dc@54200000 {
+			rgb {
+				status = "okay";
+
+				port@0 {
+					lvds_output: endpoint {
+						remote-endpoint = <&lvds_encoder_input>;
+						bus-width = <24>;
+					};
+				};
+			};
+		};
+	};
+
+	gpio@6000d000 {
+		init-mode {
+			gpio-hog;
+			gpios =	<TEGRA_GPIO(DD, 7) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(CC, 6) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
+			output-low;
+		};
+
+		init-low-power-mode {
+			gpio-hog;
+			gpios = <TEGRA_GPIO(I, 6) GPIO_ACTIVE_HIGH>;
+			input;
+		};
+	};
+
+	pinmux@70000868 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&state_default>;
+
+		state_default: pinmux {
+			clk_32k_out_pa0 {
+				nvidia,pins = "clk_32k_out_pa0";
+				nvidia,function = "blink";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			uart3_cts_n_pa1 {
+				nvidia,pins = "uart3_cts_n_pa1",
+						"uart3_rxd_pw7";
+				nvidia,function = "uartc";
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
+						"sdmmc3_dat1_pb6",
+						"sdmmc3_dat0_pb7",
+						"sdmmc3_dat4_pd1",
+						"sdmmc3_dat6_pd3",
+						"sdmmc3_dat7_pd4";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi_a17_pb0 {
+				nvidia,pins = "gmi_a17_pb0",
+						"gmi_a18_pb1";
+				nvidia,function = "uartd";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			lcd_pwr0_pb2 {
+				nvidia,pins = "lcd_pwr0_pb2",
+						"lcd_pwr1_pc1",
+						"lcd_m1_pw1";
+				nvidia,function = "displaya";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			lcd_pclk_pb3 {
+				nvidia,pins = "lcd_pclk_pb3",
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
+						"lcd_cs1_n_pw0",
+						"lcd_sdin_pz2",
+						"lcd_sck_pz4";
+				nvidia,function = "displaya";
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
+			gen1_i2c_scl_pc4 {
+				nvidia,pins = "gen1_i2c_scl_pc4",
+						"gen1_i2c_sda_pc5";
+				nvidia,function = "i2c1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+			};
+			gmi_wp_n_pc7 {
+				nvidia,pins = "gmi_wp_n_pc7",
+						"gmi_wait_pi7",
+						"gmi_cs4_n_pk2",
+						"gmi_cs3_n_pk4";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_ad12_ph4 {
+				nvidia,pins = "gmi_ad12_ph4",
+						"gmi_cs0_n_pj0",
+						"gmi_cs1_n_pj2",
+						"gmi_cs2_n_pk3";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc3_dat5_pd0 {
+				nvidia,pins = "sdmmc3_dat5_pd0";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_ad0_pg0 {
+				nvidia,pins = "gmi_ad0_pg0",
+						"gmi_ad1_pg1",
+						"gmi_ad14_ph6",
+						"pu1";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_ad2_pg2 {
+				nvidia,pins = "gmi_ad2_pg2",
+						"gmi_ad3_pg3",
+						"gmi_ad6_pg6",
+						"gmi_ad7_pg7";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_ad4_pg4 {
+				nvidia,pins = "gmi_ad4_pg4",
+						"gmi_ad5_pg5";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi_ad8_ph0 {
+				nvidia,pins = "gmi_ad8_ph0";
+				nvidia,function = "pwm0";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_ad9_ph1 {
+				nvidia,pins = "gmi_ad9_ph1";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_ad10_ph2 {
+				nvidia,pins = "gmi_ad10_ph2";
+				nvidia,function = "pwm2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_ad11_ph3 {
+				nvidia,pins = "gmi_ad11_ph3";
+				nvidia,function = "pwm3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_ad13_ph5 {
+				nvidia,pins = "gmi_ad13_ph5",
+						"gmi_wr_n_pi0",
+						"gmi_oe_n_pi1",
+						"gmi_adv_n_pk0";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_ad15_ph7 {
+				nvidia,pins = "gmi_ad15_ph7";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_dqs_pi2 {
+				nvidia,pins = "gmi_dqs_pi2",
+						"pu2",
+						"pv1";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi_rst_n_pi4 {
+				nvidia,pins = "gmi_rst_n_pi4";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_iordy_pi5 {
+				nvidia,pins = "gmi_iordy_pi5";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi_cs7_n_pi6 {
+				nvidia,pins = "gmi_cs7_n_pi6",
+						"gmi_clk_pk1";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_a16_pj7 {
+				nvidia,pins = "gmi_a16_pj7",
+						"gmi_a19_pk7";
+				nvidia,function = "uartd";
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
+			hdmi_int_pn7 {
+				nvidia,pins = "hdmi_int_pn7";
+				nvidia,function = "hdmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			ulpi_data7_po0 {
+				nvidia,pins = "ulpi_data7_po0";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ulpi_data3_po4 {
+				nvidia,pins = "ulpi_data3_po4";
+				nvidia,function = "ulpi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap3_fs_pp0 {
+				nvidia,pins = "dap3_fs_pp0";
+				nvidia,function = "i2s2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
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
+			kb_col0_pq0 {
+				nvidia,pins = "kb_col0_pq0",
+						"kb_col1_pq1",
+						"kb_row1_pr1";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_col2_pq2 {
+				nvidia,pins = "kb_col2_pq2",
+						"kb_col3_pq3";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			kb_col4_pq4 {
+				nvidia,pins = "kb_col4_pq4",
+						"kb_col5_pq5",
+						"kb_col7_pq7",
+						"kb_row2_pr2",
+						"kb_row4_pr4",
+						"kb_row5_pr5",
+						"kb_row14_ps6";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			kb_row0_pr0 {
+				nvidia,pins = "kb_row0_pr0";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row6_pr6 {
+				nvidia,pins = "kb_row6_pr6",
+						"kb_row8_ps0",
+						"kb_row9_ps1",
+						"kb_row10_ps2";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row11_ps3 {
+				nvidia,pins = "kb_row11_ps3",
+						"kb_row12_ps4";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gen2_i2c_scl_pt5 {
+				nvidia,pins = "gen2_i2c_scl_pt5",
+						"gen2_i2c_sda_pt6";
+				nvidia,function = "i2c2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
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
+			pu0 {
+				nvidia,pins = "pu0",
+						"pu6";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			jtag_rtck_pu7 {
+				nvidia,pins = "jtag_rtck_pu7";
+				nvidia,function = "rtck";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pv0 {
+				nvidia,pins = "pv0";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			ddc_scl_pv4 {
+				nvidia,pins = "ddc_scl_pv4",
+						"ddc_sda_pv5";
+				nvidia,function = "i2c4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			crt_hsync_pv6 {
+				nvidia,pins = "crt_hsync_pv6",
+						"crt_vsync_pv7";
+				nvidia,function = "crt";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			spi2_cs1_n_pw2 {
+				nvidia,pins = "spi2_cs1_n_pw2",
+						"spi2_miso_px1",
+						"spi2_sck_px2";
+				nvidia,function = "spi2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
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
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			spi2_cs0_n_px3 {
+				nvidia,pins = "spi2_cs0_n_px3";
+				nvidia,function = "spi6";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			spi1_mosi_px4 {
+				nvidia,pins = "spi1_mosi_px4",
+						"spi1_cs0_n_px6";
+				nvidia,function = "spi1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			ulpi_clk_py0 {
+				nvidia,pins = "ulpi_clk_py0",
+						"ulpi_dir_py1";
+				nvidia,function = "ulpi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
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
+			sdmmc1_clk_pz0 {
+				nvidia,pins = "sdmmc1_clk_pz0";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			lcd_wr_n_pz3 {
+				nvidia,pins = "lcd_wr_n_pz3";
+				nvidia,function = "displaya";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sys_clk_req_pz5 {
+				nvidia,pins = "sys_clk_req_pz5";
+				nvidia,function = "sysclk";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pwr_i2c_scl_pz6 {
+				nvidia,pins = "pwr_i2c_scl_pz6",
+						"pwr_i2c_sda_pz7";
+				nvidia,function = "i2cpwr";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+			};
+			pbb0 {
+				nvidia,pins = "pbb0",
+						"pcc1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			cam_i2c_scl_pbb1 {
+				nvidia,pins = "cam_i2c_scl_pbb1",
+						"cam_i2c_sda_pbb2";
+				nvidia,function = "i2c3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+			};
+			pbb3 {
+				nvidia,pins = "pbb3";
+				nvidia,function = "vgp3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
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
+			pbb7 {
+				nvidia,pins = "pbb7",
+						"pcc2";
+				nvidia,function = "i2s4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			cam_mclk_pcc0 {
+				nvidia,pins = "cam_mclk_pcc0";
+				nvidia,function = "vi_alt3";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc4_rst_n_pcc3 {
+				nvidia,pins = "sdmmc4_rst_n_pcc3";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc4_clk_pcc4 {
+				nvidia,pins = "sdmmc4_clk_pcc4";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			clk2_req_pcc5 {
+				nvidia,pins = "clk2_req_pcc5";
+				nvidia,function = "dap";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pex_l2_rst_n_pcc6 {
+				nvidia,pins = "pex_l2_rst_n_pcc6",
+						"pex_l2_clkreq_n_pcc7";
+				nvidia,function = "pcie";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pex_wake_n_pdd3 {
+				nvidia,pins = "pex_wake_n_pdd3",
+						"pex_l2_prsnt_n_pdd7";
+				nvidia,function = "pcie";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			clk3_out_pee0 {
+				nvidia,pins = "clk3_out_pee0";
+				nvidia,function = "extperiph3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			clk1_req_pee2 {
+				nvidia,pins = "clk1_req_pee2";
+				nvidia,function = "dap";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			hdmi_cec_pee3 {
+				nvidia,pins = "hdmi_cec_pee3";
+				nvidia,function = "cec";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+			};
+			owr {
+				nvidia,pins = "owr";
+				nvidia,function = "owr";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
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
+				nvidia,pins = "drive_sdio1",
+						"drive_sdio3";
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
+		};
+	};
+
+	uartb: serial@70006040 {
+		compatible = "nvidia,tegra30-hsuart";
+		/* GPS BCM4751 */
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
+		/* Azurewave AW-NH665 BCM4330B1 */
+		bluetooth {
+			compatible = "brcm,bcm4330-bt";
+
+			max-speed = <4000000>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
+			clock-names = "txco";
+
+			vbat-supply  = <&vdd_3v3_sys>;
+			vddio-supply = <&vdd_1v8>;
+
+			device-wakeup-gpios = <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
+			host-wakeup-gpios =   <&gpio TEGRA_GPIO(U, 6) GPIO_ACTIVE_HIGH>;
+			shutdown-gpios =      <&gpio TEGRA_GPIO(U, 0) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	pwm: pwm@7000a000 {
+		status = "okay";
+	};
+
+	i2c@7000c400 {
+		clock-frequency = <400000>;
+		status = "okay";
+	};
+
+	i2c@7000c500 {
+		clock-frequency = <100000>;
+		status = "okay";
+
+		compass@e {
+			compatible = "asahi-kasei,ak8974";
+			reg = <0x0e>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(W, 0) IRQ_TYPE_EDGE_RISING>;
+
+			avdd-supply = <&vdd_3v3_sys>;
+			dvdd-supply = <&vdd_1v8>;
+
+			mount-matrix =	 "0", "-1",  "0",
+					"-1",  "0",  "0",
+					 "0",  "0", "-1";
+		};
+
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
+		accelerometer@68 {
+			compatible = "invensense,mpu6050";
+			reg = <0x68>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(X, 1) IRQ_TYPE_EDGE_RISING>;
+
+			vdd-supply   = <&vdd_3v3_sys>;
+			vddio-supply = <&vdd_1v8>;
+
+			mount-matrix =	 "0", "-1",  "0",
+					"-1",  "0",  "0",
+					 "0",  "0", "-1";
+		};
+	};
+
+	i2c@7000d000 {
+		clock-frequency = <100000>;
+		status = "okay";
+
+		rt5640: audio-codec@1c {
+			compatible = "realtek,rt5640";
+			reg = <0x1c>;
+
+			realtek,dmic1-data-pin = <1>;
+		};
+
+		nct72: temperature-sensor@4c {
+			compatible = "onnn,nct1008";
+			reg = <0x4c>;
+			vcc-supply = <&vdd_3v3_sys>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		battery@55 {
+			compatible = "ti,bq27541";
+			reg = <0x55>;
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
+		nvidia,core-pwr-off-time = <0>;
+		nvidia,core-power-req-active-high;
+		nvidia,sys-clock-req-active-high;
+	};
+
+	ahub@70080000 {
+		i2s@70080400 {
+			status = "okay";
+		};
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
+	sdhci@78000400 {
+		status = "okay";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		keep-power-in-suspend;
+		bus-width = <4>;
+		non-removable;
+
+		mmc-pwrseq = <&brcm_wifi_pwrseq>;
+		vmmc-supply = <&vdd_3v3_sys>;
+		vqmmc-supply = <&vdd_1v8>;
+
+		/* Azurewave AW-NH665 BCM4330 */
+		wifi@1 {
+			reg = <1>;
+			compatible = "brcm,bcm4329-fmac";
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(O, 4) IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "host-wake";
+		};
+	};
+
+	sdhci@78000600 {
+		status = "okay";
+		bus-width = <8>;
+		vmmc-supply = <&vcore_emmc>;
+		vqmmc-supply = <&vdd_1v8>;
+		non-removable;
+	};
+
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
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+
+		power-supply = <&vdd_5v0_sys>;
+		pwms = <&pwm 0 50000>;
+
+		brightness-levels = <1 255>;
+		num-interpolated-steps = <254>;
+		default-brightness-level = <15>;
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
+			clock-output-names = "pmic-oscillator";
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
+
+		cpu@2 {
+			cpu-supply = <&vdd_cpu>;
+			operating-points-v2 = <&cpu0_opp_table>;
+		};
+
+		cpu@3 {
+			cpu-supply = <&vdd_cpu>;
+			operating-points-v2 = <&cpu0_opp_table>;
+		};
+	};
+
+	display-panel {
+		compatible = "hydis,hv070wx2-1e0", "chunghwa,claa070wp03xg",
+			     "panel-lvds";
+
+		power-supply = <&vdd_pnl>;
+		backlight = <&backlight>;
+
+		width-mm = <94>;
+		height-mm = <150>;
+		rotation = <180>;
+
+		data-mapping = "jeida-24";
+
+		port {
+			panel_input: endpoint {
+				remote-endpoint = <&lvds_encoder_output>;
+			};
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
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		hall-sensor {
+			label = "Lid";
+			gpios = <&gpio TEGRA_GPIO(S, 6) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			debounce-interval = <500>;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+			wakeup-source;
+		};
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
+	lvds-encoder {
+		compatible = "ti,sn75lvds83", "lvds-encoder";
+
+		powerdown-gpios = <&gpio TEGRA_GPIO(N, 6) GPIO_ACTIVE_LOW>;
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
+			regulator-boot-on;
+		};
+
+		vdd_3v3_sys: regulator@1 {
+			compatible = "regulator-fixed";
+			reg = <1>;
+			regulator-name = "vdd_3v3";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+			regulator-boot-on;
+			vin-supply = <&vdd_5v0_sys>;
+		};
+
+		vdd_pnl: regulator@2 {
+			compatible = "regulator-fixed";
+			reg = <2>;
+			regulator-name = "vdd_panel";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-enable-ramp-delay = <300000>;
+			gpio = <&gpio TEGRA_GPIO(W, 1) GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_3v3_sys>;
+		};
+
+		vcc_3v3_ts: regulator@3 {
+			compatible = "regulator-fixed";
+			reg = <3>;
+			regulator-name = "ldo_s-1167_3v3";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+			regulator-boot-on;
+			vin-supply = <&vdd_5v0_sys>;
+		};
+	};
+
+	sound {
+		compatible = "nvidia,tegra-audio-rt5640-grouper",
+			     "nvidia,tegra-audio-rt5640";
+		nvidia,model = "ASUS Google Nexus 7 ALC5642";
+
+		nvidia,audio-routing =
+			"Headphones", "HPOR",
+			"Headphones", "HPOL",
+			"Speakers", "SPORP",
+			"Speakers", "SPORN",
+			"Speakers", "SPOLP",
+			"Speakers", "SPOLN",
+			"DMIC1", "Mic Jack";
+
+		nvidia,i2s-controller = <&tegra_i2s1>;
+		nvidia,audio-codec = <&rt5640>;
+
+		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
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
+		nct72-local {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <0>; /* milliseconds */
+
+			thermal-sensors = <&nct72 0>;
+		};
+
+		nct72-remote {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&nct72 1>;
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
+	memory-controller@7000f000 {
+		emc-timings-0 {
+			nvidia,ram-code = <0>; /* Elpida EDJ2108EDBG-DJL-F */
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emem-configuration = <
+					0x00020001 /* MC_EMEM_ARB_CFG */
+					0xc0000020 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000001 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+					0x74830303 /* MC_EMEM_ARB_MISC0 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emem-configuration = <
+					0x00010001 /* MC_EMEM_ARB_CFG */
+					0xc0000020 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000001 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+					0x73430303 /* MC_EMEM_ARB_MISC0 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = <
+					0x00000001 /* MC_EMEM_ARB_CFG */
+					0xc0000030 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000001 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0503 /* MC_EMEM_ARB_DA_COVERS */
+					0x72830504 /* MC_EMEM_ARB_MISC0 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = <
+					0x00000003 /* MC_EMEM_ARB_CFG */
+					0xc0000025 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000003 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0505 /* MC_EMEM_ARB_DA_COVERS */
+					0x72440a06 /* MC_EMEM_ARB_MISC0 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-333500000 {
+				clock-frequency = <333500000>;
+
+				nvidia,emem-configuration = <
+					0x00000005 /* MC_EMEM_ARB_CFG */
+					0xc000003d /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000008 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000004 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000007 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030202 /* MC_EMEM_ARB_DA_TURNS */
+					0x000b0608 /* MC_EMEM_ARB_DA_COVERS */
+					0x70850f09 /* MC_EMEM_ARB_MISC0 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-667000000 {
+				clock-frequency = <667000000>;
+
+				nvidia,emem-configuration = <
+					0x0000000a /* MC_EMEM_ARB_CFG */
+					0xc0000079 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000010 /* MC_EMEM_ARB_TIMING_RC */
+					0x0000000b /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000a /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x0000000b /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000008 /* MC_EMEM_ARB_TIMING_W2R */
+					0x08040202 /* MC_EMEM_ARB_DA_TURNS */
+					0x00130b10 /* MC_EMEM_ARB_DA_COVERS */
+					0x70ea1f11 /* MC_EMEM_ARB_MISC0 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+		};
+
+		emc-timings-1 {
+			nvidia,ram-code = <1>; /* Hynix H5TC2G83CFR */
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emem-configuration = <
+					0x00020001 /* MC_EMEM_ARB_CFG */
+					0xc0000020 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000001 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+					0x74830303 /* MC_EMEM_ARB_MISC0 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emem-configuration = <
+					0x00010001 /* MC_EMEM_ARB_CFG */
+					0xc0000020 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000001 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+					0x73430303 /* MC_EMEM_ARB_MISC0 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = <
+					0x00000001 /* MC_EMEM_ARB_CFG */
+					0xc0000030 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000001 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0503 /* MC_EMEM_ARB_DA_COVERS */
+					0x72830504 /* MC_EMEM_ARB_MISC0 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = <
+					0x00000003 /* MC_EMEM_ARB_CFG */
+					0xc0000025 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000003 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06020102 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0505 /* MC_EMEM_ARB_DA_COVERS */
+					0x72440a06 /* MC_EMEM_ARB_MISC0 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-333500000 {
+				clock-frequency = <333500000>;
+
+				nvidia,emem-configuration = <
+					0x00000005 /* MC_EMEM_ARB_CFG */
+					0xc000003d /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000008 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000004 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000007 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030202 /* MC_EMEM_ARB_DA_TURNS */
+					0x000b0608 /* MC_EMEM_ARB_DA_COVERS */
+					0x70850f09 /* MC_EMEM_ARB_MISC0 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-667000000 {
+				clock-frequency = <667000000>;
+
+				nvidia,emem-configuration = <
+					0x0000000a /* MC_EMEM_ARB_CFG */
+					0xc0000079 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000010 /* MC_EMEM_ARB_TIMING_RC */
+					0x0000000b /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000a /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x0000000b /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000008 /* MC_EMEM_ARB_TIMING_W2R */
+					0x08040202 /* MC_EMEM_ARB_DA_TURNS */
+					0x00130b10 /* MC_EMEM_ARB_DA_COVERS */
+					0x70ea1f11 /* MC_EMEM_ARB_MISC0 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+		};
+	};
+
+	memory-controller@7000f400 {
+		emc-timings-0 {
+			nvidia,ram-code = <0>; /* Elpida EDJ2108EDBG-DJL-F */
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration = <
+					0x00000001 /* EMC_RC */
+					0x00000004 /* EMC_RFC */
+					0x00000000 /* EMC_RAS */
+					0x00000000 /* EMC_RP */
+					0x00000002 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000005 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000000 /* EMC_RD_RCD */
+					0x00000000 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000001 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000005 /* EMC_WDV */
+					0x00000005 /* EMC_QUSE */
+					0x00000004 /* EMC_QRST */
+					0x0000000a /* EMC_QSAFE */
+					0x0000000b /* EMC_RDV */
+					0x000000c0 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000030 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000005 /* EMC_TXSR */
+					0x00000005 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000001 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000004 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x000000c7 /* EMC_TREFBW */
+					0x00000006 /* EMC_QUSE_EXTRA */
+					0x00000004 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x00004288 /* EMC_FBIO_CFG5 */
+					0x007800a4 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x000fc000 /* EMC_DLL_XFORM_DQS0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS3 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS4 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS5 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS6 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS7 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+					0x000002a0 /* EMC_XM2CMDPADCTRL */
+					0x0800211c /* EMC_XM2DQSPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x77fff884 /* EMC_XM2CLKPADCTRL */
+					0x01f1f108 /* EMC_XM2COMPPADCTRL */
+					0x05057404 /* EMC_XM2VTTGENPADCTRL */
+					0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+					0x08000168 /* EMC_XM2QUSEPADCTRL */
+					0x08000000 /* EMC_XM2DQSPADCTRL3 */
+					0x00000802 /* EMC_CTT_TERM_CTRL */
+					0x00000000 /* EMC_ZCAL_INTERVAL */
+					0x00000040 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT */
+					0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+					0x00000000 /* EMC_CTT */
+					0x00000000 /* EMC_CTT_DURATION */
+					0x80000287 /* EMC_DYN_SELF_REF_CONTROL */
+					0xe8000000 /* EMC_FBIO_SPARE */
+					0xff00ff00 /* EMC_CFG_RSV */
+				>;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration = <
+					0x00000002 /* EMC_RC */
+					0x00000008 /* EMC_RFC */
+					0x00000001 /* EMC_RAS */
+					0x00000000 /* EMC_RP */
+					0x00000002 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000005 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000000 /* EMC_RD_RCD */
+					0x00000000 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000001 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000005 /* EMC_WDV */
+					0x00000005 /* EMC_QUSE */
+					0x00000004 /* EMC_QRST */
+					0x0000000a /* EMC_QSAFE */
+					0x0000000b /* EMC_RDV */
+					0x00000181 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000060 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000009 /* EMC_TXSR */
+					0x00000009 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000002 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000004 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x0000018e /* EMC_TREFBW */
+					0x00000006 /* EMC_QUSE_EXTRA */
+					0x00000004 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x00004288 /* EMC_FBIO_CFG5 */
+					0x007800a4 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x000fc000 /* EMC_DLL_XFORM_DQS0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS3 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS4 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS5 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS6 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS7 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+					0x000002a0 /* EMC_XM2CMDPADCTRL */
+					0x0800211c /* EMC_XM2DQSPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x77fff884 /* EMC_XM2CLKPADCTRL */
+					0x01f1f108 /* EMC_XM2COMPPADCTRL */
+					0x05057404 /* EMC_XM2VTTGENPADCTRL */
+					0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+					0x08000168 /* EMC_XM2QUSEPADCTRL */
+					0x08000000 /* EMC_XM2DQSPADCTRL3 */
+					0x00000802 /* EMC_CTT_TERM_CTRL */
+					0x00000000 /* EMC_ZCAL_INTERVAL */
+					0x00000040 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT */
+					0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+					0x00000000 /* EMC_CTT */
+					0x00000000 /* EMC_CTT_DURATION */
+					0x8000040b /* EMC_DYN_SELF_REF_CONTROL */
+					0xe8000000 /* EMC_FBIO_SPARE */
+					0xff00ff00 /* EMC_CFG_RSV */
+				>;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration = <
+					0x00000005 /* EMC_RC */
+					0x00000010 /* EMC_RFC */
+					0x00000003 /* EMC_RAS */
+					0x00000001 /* EMC_RP */
+					0x00000002 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000005 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000001 /* EMC_RD_RCD */
+					0x00000001 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000001 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000005 /* EMC_WDV */
+					0x00000005 /* EMC_QUSE */
+					0x00000004 /* EMC_QRST */
+					0x0000000a /* EMC_QSAFE */
+					0x0000000b /* EMC_RDV */
+					0x00000303 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x000000c0 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000012 /* EMC_TXSR */
+					0x00000012 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000004 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000004 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x0000031c /* EMC_TREFBW */
+					0x00000006 /* EMC_QUSE_EXTRA */
+					0x00000004 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x00004288 /* EMC_FBIO_CFG5 */
+					0x007800a4 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x000fc000 /* EMC_DLL_XFORM_DQS0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS3 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS4 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS5 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS6 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS7 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+					0x000002a0 /* EMC_XM2CMDPADCTRL */
+					0x0800211c /* EMC_XM2DQSPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x77fff884 /* EMC_XM2CLKPADCTRL */
+					0x01f1f108 /* EMC_XM2COMPPADCTRL */
+					0x05057404 /* EMC_XM2VTTGENPADCTRL */
+					0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+					0x08000168 /* EMC_XM2QUSEPADCTRL */
+					0x08000000 /* EMC_XM2DQSPADCTRL3 */
+					0x00000802 /* EMC_CTT_TERM_CTRL */
+					0x00000000 /* EMC_ZCAL_INTERVAL */
+					0x00000040 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT */
+					0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+					0x00000000 /* EMC_CTT */
+					0x00000000 /* EMC_CTT_DURATION */
+					0x80000713 /* EMC_DYN_SELF_REF_CONTROL */
+					0xe8000000 /* EMC_FBIO_SPARE */
+					0xff00ff00 /* EMC_CFG_RSV */
+				>;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration = <
+					0x0000000a /* EMC_RC */
+					0x00000020 /* EMC_RFC */
+					0x00000007 /* EMC_RAS */
+					0x00000002 /* EMC_RP */
+					0x00000002 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000005 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000002 /* EMC_RD_RCD */
+					0x00000002 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000001 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000005 /* EMC_WDV */
+					0x00000005 /* EMC_QUSE */
+					0x00000004 /* EMC_QRST */
+					0x0000000a /* EMC_QSAFE */
+					0x0000000b /* EMC_RDV */
+					0x00000607 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000181 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000023 /* EMC_TXSR */
+					0x00000023 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000007 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000004 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000638 /* EMC_TREFBW */
+					0x00000006 /* EMC_QUSE_EXTRA */
+					0x00000006 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x00004288 /* EMC_FBIO_CFG5 */
+					0x004400a4 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00080000 /* EMC_DLL_XFORM_DQS0 */
+					0x00080000 /* EMC_DLL_XFORM_DQS1 */
+					0x00080000 /* EMC_DLL_XFORM_DQS2 */
+					0x00080000 /* EMC_DLL_XFORM_DQS3 */
+					0x00080000 /* EMC_DLL_XFORM_DQS4 */
+					0x00080000 /* EMC_DLL_XFORM_DQS5 */
+					0x00080000 /* EMC_DLL_XFORM_DQS6 */
+					0x00080000 /* EMC_DLL_XFORM_DQS7 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00080000 /* EMC_DLL_XFORM_DQ0 */
+					0x00080000 /* EMC_DLL_XFORM_DQ1 */
+					0x00080000 /* EMC_DLL_XFORM_DQ2 */
+					0x00080000 /* EMC_DLL_XFORM_DQ3 */
+					0x000002a0 /* EMC_XM2CMDPADCTRL */
+					0x0800211c /* EMC_XM2DQSPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x77fff884 /* EMC_XM2CLKPADCTRL */
+					0x01f1f108 /* EMC_XM2COMPPADCTRL */
+					0x05057404 /* EMC_XM2VTTGENPADCTRL */
+					0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+					0x08000168 /* EMC_XM2QUSEPADCTRL */
+					0x08000000 /* EMC_XM2DQSPADCTRL3 */
+					0x00000802 /* EMC_CTT_TERM_CTRL */
+					0x00020000 /* EMC_ZCAL_INTERVAL */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT */
+					0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+					0x00000000 /* EMC_CTT */
+					0x00000000 /* EMC_CTT_DURATION */
+					0x80000d22 /* EMC_DYN_SELF_REF_CONTROL */
+					0xe8000000 /* EMC_FBIO_SPARE */
+					0xff00ff00 /* EMC_CFG_RSV */
+				>;
+			};
+
+			timing-333500000 {
+				clock-frequency = <333500000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200000>;
+				nvidia,emc-mode-reset = <0x80000321>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+
+				nvidia,emc-configuration = <
+					0x0000000f /* EMC_RC */
+					0x00000034 /* EMC_RFC */
+					0x0000000a /* EMC_RAS */
+					0x00000003 /* EMC_RP */
+					0x00000003 /* EMC_R2W */
+					0x00000008 /* EMC_W2R */
+					0x00000002 /* EMC_R2P */
+					0x00000009 /* EMC_W2P */
+					0x00000003 /* EMC_RD_RCD */
+					0x00000003 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000001 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000004 /* EMC_WDV */
+					0x00000006 /* EMC_QUSE */
+					0x00000004 /* EMC_QRST */
+					0x0000000a /* EMC_QSAFE */
+					0x0000000c /* EMC_RDV */
+					0x000009e9 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x0000027a /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000001 /* EMC_PDEX2WR */
+					0x00000008 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000e /* EMC_RW2PDEN */
+					0x00000039 /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x0000000a /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000004 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000a2a /* EMC_TREFBW */
+					0x00000000 /* EMC_QUSE_EXTRA */
+					0x00000004 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x00007088 /* EMC_FBIO_CFG5 */
+					0x002600a4 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x0003c000 /* EMC_DLL_XFORM_DQS0 */
+					0x0003c000 /* EMC_DLL_XFORM_DQS1 */
+					0x0003c000 /* EMC_DLL_XFORM_DQS2 */
+					0x0003c000 /* EMC_DLL_XFORM_DQS3 */
+					0x00014000 /* EMC_DLL_XFORM_DQS4 */
+					0x00014000 /* EMC_DLL_XFORM_DQS5 */
+					0x00014000 /* EMC_DLL_XFORM_DQS6 */
+					0x00014000 /* EMC_DLL_XFORM_DQS7 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00048000 /* EMC_DLL_XFORM_DQ0 */
+					0x00048000 /* EMC_DLL_XFORM_DQ1 */
+					0x00048000 /* EMC_DLL_XFORM_DQ2 */
+					0x00048000 /* EMC_DLL_XFORM_DQ3 */
+					0x000002a0 /* EMC_XM2CMDPADCTRL */
+					0x0800013d /* EMC_XM2DQSPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x77fff884 /* EMC_XM2CLKPADCTRL */
+					0x01f1f508 /* EMC_XM2COMPPADCTRL */
+					0x05057404 /* EMC_XM2VTTGENPADCTRL */
+					0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+					0x080001e8 /* EMC_XM2QUSEPADCTRL */
+					0x08000021 /* EMC_XM2DQSPADCTRL3 */
+					0x00000802 /* EMC_CTT_TERM_CTRL */
+					0x00020000 /* EMC_ZCAL_INTERVAL */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x018b000c /* EMC_MRS_WAIT_CNT */
+					0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+					0x00000000 /* EMC_CTT */
+					0x00000000 /* EMC_CTT_DURATION */
+					0x800014d4 /* EMC_DYN_SELF_REF_CONTROL */
+					0xe8000000 /* EMC_FBIO_SPARE */
+					0xff00ff89 /* EMC_CFG_RSV */
+				>;
+			};
+		};
+
+		emc-timings-1 {
+			nvidia,ram-code = <1>; /* Hynix H5TC2G83CFR */
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration = <
+					0x00000001 /* EMC_RC */
+					0x00000004 /* EMC_RFC */
+					0x00000000 /* EMC_RAS */
+					0x00000000 /* EMC_RP */
+					0x00000002 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000005 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000000 /* EMC_RD_RCD */
+					0x00000000 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000001 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000005 /* EMC_WDV */
+					0x00000005 /* EMC_QUSE */
+					0x00000004 /* EMC_QRST */
+					0x0000000a /* EMC_QSAFE */
+					0x0000000b /* EMC_RDV */
+					0x000000c0 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000030 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000005 /* EMC_TXSR */
+					0x00000005 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000001 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000004 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x000000c7 /* EMC_TREFBW */
+					0x00000006 /* EMC_QUSE_EXTRA */
+					0x00000004 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x00004288 /* EMC_FBIO_CFG5 */
+					0x007800a4 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x000fc000 /* EMC_DLL_XFORM_DQS0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS3 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS4 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS5 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS6 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS7 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+					0x000002a0 /* EMC_XM2CMDPADCTRL */
+					0x0800211c /* EMC_XM2DQSPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x77fff884 /* EMC_XM2CLKPADCTRL */
+					0x01f1f108 /* EMC_XM2COMPPADCTRL */
+					0x05057404 /* EMC_XM2VTTGENPADCTRL */
+					0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+					0x08000168 /* EMC_XM2QUSEPADCTRL */
+					0x08000000 /* EMC_XM2DQSPADCTRL3 */
+					0x00000802 /* EMC_CTT_TERM_CTRL */
+					0x00000000 /* EMC_ZCAL_INTERVAL */
+					0x00000040 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT */
+					0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+					0x00000000 /* EMC_CTT */
+					0x00000000 /* EMC_CTT_DURATION */
+					0x80000287 /* EMC_DYN_SELF_REF_CONTROL */
+					0xe8000000 /* EMC_FBIO_SPARE */
+					0xff00ff00 /* EMC_CFG_RSV */
+				>;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration = <
+					0x00000002 /* EMC_RC */
+					0x00000008 /* EMC_RFC */
+					0x00000001 /* EMC_RAS */
+					0x00000000 /* EMC_RP */
+					0x00000002 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000005 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000000 /* EMC_RD_RCD */
+					0x00000000 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000001 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000005 /* EMC_WDV */
+					0x00000005 /* EMC_QUSE */
+					0x00000004 /* EMC_QRST */
+					0x0000000a /* EMC_QSAFE */
+					0x0000000b /* EMC_RDV */
+					0x00000181 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000060 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000009 /* EMC_TXSR */
+					0x00000009 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000002 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000004 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x0000018e /* EMC_TREFBW */
+					0x00000006 /* EMC_QUSE_EXTRA */
+					0x00000004 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x00004288 /* EMC_FBIO_CFG5 */
+					0x007800a4 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x000fc000 /* EMC_DLL_XFORM_DQS0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS3 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS4 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS5 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS6 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS7 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+					0x000002a0 /* EMC_XM2CMDPADCTRL */
+					0x0800211c /* EMC_XM2DQSPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x77fff884 /* EMC_XM2CLKPADCTRL */
+					0x01f1f108 /* EMC_XM2COMPPADCTRL */
+					0x05057404 /* EMC_XM2VTTGENPADCTRL */
+					0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+					0x08000168 /* EMC_XM2QUSEPADCTRL */
+					0x08000000 /* EMC_XM2DQSPADCTRL3 */
+					0x00000802 /* EMC_CTT_TERM_CTRL */
+					0x00000000 /* EMC_ZCAL_INTERVAL */
+					0x00000040 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT */
+					0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+					0x00000000 /* EMC_CTT */
+					0x00000000 /* EMC_CTT_DURATION */
+					0x8000040b /* EMC_DYN_SELF_REF_CONTROL */
+					0xe8000000 /* EMC_FBIO_SPARE */
+					0xff00ff00 /* EMC_CFG_RSV */
+				>;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration = <
+					0x00000005 /* EMC_RC */
+					0x00000010 /* EMC_RFC */
+					0x00000003 /* EMC_RAS */
+					0x00000001 /* EMC_RP */
+					0x00000002 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000005 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000001 /* EMC_RD_RCD */
+					0x00000001 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000001 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000005 /* EMC_WDV */
+					0x00000005 /* EMC_QUSE */
+					0x00000004 /* EMC_QRST */
+					0x0000000a /* EMC_QSAFE */
+					0x0000000b /* EMC_RDV */
+					0x00000303 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x000000c0 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000012 /* EMC_TXSR */
+					0x00000012 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000004 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000004 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x0000031c /* EMC_TREFBW */
+					0x00000006 /* EMC_QUSE_EXTRA */
+					0x00000004 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x00004288 /* EMC_FBIO_CFG5 */
+					0x007800a4 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x000fc000 /* EMC_DLL_XFORM_DQS0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS3 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS4 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS5 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS6 */
+					0x000fc000 /* EMC_DLL_XFORM_DQS7 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+					0x000002a0 /* EMC_XM2CMDPADCTRL */
+					0x0800211c /* EMC_XM2DQSPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x77fff884 /* EMC_XM2CLKPADCTRL */
+					0x01f1f108 /* EMC_XM2COMPPADCTRL */
+					0x05057404 /* EMC_XM2VTTGENPADCTRL */
+					0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+					0x08000168 /* EMC_XM2QUSEPADCTRL */
+					0x08000000 /* EMC_XM2DQSPADCTRL3 */
+					0x00000802 /* EMC_CTT_TERM_CTRL */
+					0x00000000 /* EMC_ZCAL_INTERVAL */
+					0x00000040 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT */
+					0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+					0x00000000 /* EMC_CTT */
+					0x00000000 /* EMC_CTT_DURATION */
+					0x80000713 /* EMC_DYN_SELF_REF_CONTROL */
+					0xe8000000 /* EMC_FBIO_SPARE */
+					0xff00ff00 /* EMC_CFG_RSV */
+				>;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration = <
+					0x0000000a /* EMC_RC */
+					0x00000020 /* EMC_RFC */
+					0x00000007 /* EMC_RAS */
+					0x00000002 /* EMC_RP */
+					0x00000002 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000005 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000002 /* EMC_RD_RCD */
+					0x00000002 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000001 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000005 /* EMC_WDV */
+					0x00000005 /* EMC_QUSE */
+					0x00000004 /* EMC_QRST */
+					0x0000000a /* EMC_QSAFE */
+					0x0000000b /* EMC_RDV */
+					0x00000607 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000181 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000023 /* EMC_TXSR */
+					0x00000023 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000007 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000004 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000638 /* EMC_TREFBW */
+					0x00000006 /* EMC_QUSE_EXTRA */
+					0x00000006 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x00004288 /* EMC_FBIO_CFG5 */
+					0x004400a4 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00080000 /* EMC_DLL_XFORM_DQS0 */
+					0x00080000 /* EMC_DLL_XFORM_DQS1 */
+					0x00080000 /* EMC_DLL_XFORM_DQS2 */
+					0x00080000 /* EMC_DLL_XFORM_DQS3 */
+					0x00080000 /* EMC_DLL_XFORM_DQS4 */
+					0x00080000 /* EMC_DLL_XFORM_DQS5 */
+					0x00080000 /* EMC_DLL_XFORM_DQS6 */
+					0x00080000 /* EMC_DLL_XFORM_DQS7 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00080000 /* EMC_DLL_XFORM_DQ0 */
+					0x00080000 /* EMC_DLL_XFORM_DQ1 */
+					0x00080000 /* EMC_DLL_XFORM_DQ2 */
+					0x00080000 /* EMC_DLL_XFORM_DQ3 */
+					0x000002a0 /* EMC_XM2CMDPADCTRL */
+					0x0800211c /* EMC_XM2DQSPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x77fff884 /* EMC_XM2CLKPADCTRL */
+					0x01f1f108 /* EMC_XM2COMPPADCTRL */
+					0x05057404 /* EMC_XM2VTTGENPADCTRL */
+					0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+					0x08000168 /* EMC_XM2QUSEPADCTRL */
+					0x08000000 /* EMC_XM2DQSPADCTRL3 */
+					0x00000802 /* EMC_CTT_TERM_CTRL */
+					0x00020000 /* EMC_ZCAL_INTERVAL */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT */
+					0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+					0x00000000 /* EMC_CTT */
+					0x00000000 /* EMC_CTT_DURATION */
+					0x80000d22 /* EMC_DYN_SELF_REF_CONTROL */
+					0xe8000000 /* EMC_FBIO_SPARE */
+					0xff00ff00 /* EMC_CFG_RSV */
+				>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
new file mode 100644
index 000000000000..6ed509a0aaf2
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/mfd/max77620.h>
+
+/ {
+	i2c@7000d000 {
+		pmic: pmic@3c {
+			compatible = "maxim,max77663";
+			reg = <0x3c>;
+
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+
+			#gpio-cells = <2>;
+			gpio-controller;
+
+			system-power-controller;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&max77620_default>;
+
+			max77620_default: pinmux {
+				gpio4 {
+					pins = "gpio4";
+					function = "32k-out1";
+				};
+			};
+
+			cpu-pwr-req {
+				gpio-hog;
+				gpios = <6 GPIO_ACTIVE_HIGH>;
+				input;
+			};
+
+			fps {
+				fps0 {
+					maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_EN0>;
+				};
+
+				fps1 {
+					maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_EN1>;
+				};
+
+				fps2 {
+					maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_EN0>;
+				};
+			};
+
+			regulators {
+				in-sd0-supply = <&vdd_5v0_sys>;
+				in-sd1-supply = <&vdd_5v0_sys>;
+				in-sd2-supply = <&vdd_5v0_sys>;
+				in-sd3-supply = <&vdd_5v0_sys>;
+				in-sd4-supply = <&vdd_5v0_sys>;
+
+				in-ldo0-1-supply = <&vdd_1v35>;
+				in-ldo2-supply   = <&vdd_3v3_sys>;
+				in-ldo3-5-supply = <&vdd_3v3_sys>;
+				in-ldo4-6-supply = <&vdd_5v0_sys>;
+				in-ldo7-8-supply = <&vdd_1v35>;
+
+				vdd_cpu: sd0 {
+					regulator-name = "vdd_cpu";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1250000>;
+					regulator-coupled-with = <&vdd_core>;
+					regulator-coupled-max-spread = <300000>;
+					regulator-max-step-microvolt = <100000>;
+					regulator-always-on;
+					regulator-boot-on;
+
+					nvidia,tegra-cpu-regulator;
+				};
+
+				vdd_core: sd1 {
+					regulator-name = "vdd_core";
+					regulator-min-microvolt = <950000>;
+					regulator-max-microvolt = <1350000>;
+					regulator-coupled-with = <&vdd_cpu>;
+					regulator-coupled-max-spread = <300000>;
+					regulator-max-step-microvolt = <100000>;
+					regulator-always-on;
+					regulator-boot-on;
+
+					nvidia,tegra-core-regulator;
+				};
+
+				vdd_1v8: sd2 {
+					regulator-name = "vdd_gen1v8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_1v35: sd3 {
+					regulator-name = "vdd_ddr3l_1v35";
+					regulator-min-microvolt = <1350000>;
+					regulator-max-microvolt = <1350000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldo0 {
+					regulator-name = "vdd_ddr_hs";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldo2 {
+					regulator-name = "vdd_ddr_rx";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vcore_emmc: ldo3 {
+					regulator-name = "vcore_emmc";
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <3100000>;
+					regulator-always-on;
+				};
+
+				ldo4 {
+					regulator-name = "vdd_rtc";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldo5 {
+					regulator-name = "vdd_camera";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				ldo6 {
+					regulator-name = "vddio_sdmmc";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldo7 {
+					regulator-name = "avdd_dsi_csi";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+				};
+
+				ldo8 {
+					regulator-name = "avdd_pll";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+			};
+		};
+	};
+
+	regulators {
+		vdd_3v3_sys: regulator@1 {
+			gpio = <&pmic 3 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		regulator@4 {
+			compatible = "regulator-fixed";
+			reg = <4>;
+			regulator-name = "avdd_usb";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+			regulator-boot-on;
+			gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_3v3_sys>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
new file mode 100644
index 000000000000..2f7d085c9feb
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	i2c@7000d000 {
+		pmic: pmic@2d {
+			compatible = "ti,tps65911";
+			reg = <0x2d>;
+
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
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
+			vcc3-supply = <&vdd_1v8>;
+			vcc4-supply = <&vdd_5v0_sys>;
+			vcc5-supply = <&vdd_5v0_sys>;
+			vcc6-supply = <&vdd2_reg>;
+			vcc7-supply = <&vdd_5v0_sys>;
+			vccio-supply = <&vdd_5v0_sys>;
+
+			regulators {
+				vdd1 {
+					regulator-name = "vddio_ddr_1v2";
+					regulator-min-microvolt = <600000>;
+					regulator-max-microvolt = <1500000>;
+					regulator-always-on;
+					regulator-boot-on;
+					ti,regulator-ext-sleep-control = <8>;
+				};
+
+				vdd2_reg: vdd2 {
+					regulator-name = "vdd2_1v2";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_cpu: vddctrl {
+					regulator-name = "vdd_cpu,vdd_sys";
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1250000>;
+					regulator-coupled-with = <&vdd_core>;
+					regulator-coupled-max-spread = <300000>;
+					regulator-max-step-microvolt = <100000>;
+					regulator-always-on;
+					ti,regulator-ext-sleep-control = <1>;
+
+					nvidia,tegra-cpu-regulator;
+				};
+
+				vdd_1v8: vio {
+					regulator-name = "vdd_1v8_gen";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vcore_emmc: ldo1 {
+					regulator-name = "vdd_pexa,vdd_pexb";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+				};
+
+				ldo2 {
+					regulator-name = "vdd_sata,avdd_plle";
+					regulator-min-microvolt = <1050000>;
+					regulator-max-microvolt = <1050000>;
+				};
+
+				/* LDO3 is not connected to anything */
+
+				ldo4 {
+					regulator-name = "vdd_rtc";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+				};
+
+				ldo5 {
+					regulator-name = "vddio_sdmmc,avdd_vdac";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
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
+			regulator-max-microvolt = <1350000>;
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
+	regulators {
+		vdd_3v3_sys: regulator@1 {
+			gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi
new file mode 100644
index 000000000000..c00a620636f0
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi
@@ -0,0 +1,462 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "tegra30-asus-nexus7-grouper-common.dtsi"
+
+/ {
+	compatible = "asus,grouper", "nvidia,tegra30";
+
+	display-panel {
+		panel-timing {
+			clock-frequency = <68000000>;
+			hactive = <800>;
+			vactive = <1280>;
+			hfront-porch = <24>;
+			hback-porch = <32>;
+			hsync-len = <24>;
+			vsync-len = <1>;
+			vfront-porch = <5>;
+			vback-porch = <32>;
+		};
+	};
+
+	pinmux@70000868 {
+		state_default: pinmux {
+			lcd_dc1_pd2 {
+				nvidia,pins = "lcd_dc1_pd2";
+				nvidia,function = "displaya";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			lcd_pwr2_pc6 {
+				nvidia,pins = "lcd_pwr2_pc6";
+				nvidia,function = "displaya";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			spi2_cs2_n_pw3 {
+				nvidia,pins = "spi2_cs2_n_pw3";
+				nvidia,function = "spi2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			spi1_sck_px5 {
+				nvidia,pins = "spi1_sck_px5";
+				nvidia,function = "spi1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pu5 {
+				nvidia,pins = "pu5";
+				nvidia,function = "pwm2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			spi1_miso_px7 {
+				nvidia,pins = "spi1_miso_px7";
+				nvidia,function = "spi1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			spi2_mosi_px0 {
+				nvidia,pins = "spi2_mosi_px0";
+				nvidia,function = "spi2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			kb_row7_pr7 {
+				nvidia,pins = "kb_row7_pr7";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pu3 {
+				nvidia,pins = "pu3";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pu4 {
+				nvidia,pins = "pu4";
+				nvidia,function = "pwm1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			kb_row15_ps7 {
+				nvidia,pins = "kb_row15_ps7";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row3_pr3 {
+				nvidia,pins = "kb_row3_pr3";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row13_ps5 {
+				nvidia,pins = "kb_row13_ps5";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_wp_n_pc7 {
+				nvidia,pins = "gmi_wp_n_pc7",
+						"gmi_wait_pi7",
+						"gmi_cs4_n_pk2",
+						"gmi_cs3_n_pk4";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi_cs6_n_pi3 {
+				nvidia,pins = "gmi_cs6_n_pi3";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+		};
+	};
+
+	i2c@7000c500 {
+		nfc@28 {
+			compatible = "nxp,pn544-i2c";
+			reg = <0x28>;
+			clock-frequency = <100000>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(X, 0) IRQ_TYPE_EDGE_RISING>;
+
+			enable-gpios   = <&gpio TEGRA_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
+			firmware-gpios = <&gpio TEGRA_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	memory-controller@7000f400 {
+		emc-timings-0 {
+			timing-667000000 {
+				clock-frequency = <667000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200018>;
+				nvidia,emc-mode-reset = <0x80000b71>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration = <
+					0x0000001f /* EMC_RC */
+					0x00000069 /* EMC_RFC */
+					0x00000017 /* EMC_RAS */
+					0x00000007 /* EMC_RP */
+					0x00000005 /* EMC_R2W */
+					0x0000000c /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x00000011 /* EMC_W2P */
+					0x00000007 /* EMC_RD_RCD */
+					0x00000007 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000001 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000007 /* EMC_WDV */
+					0x0000000b /* EMC_QUSE */
+					0x00000009 /* EMC_QRST */
+					0x0000000b /* EMC_QSAFE */
+					0x00000011 /* EMC_RDV */
+					0x00001412 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000504 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x0000000e /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x0000000c /* EMC_AR2PDEN */
+					0x00000016 /* EMC_RW2PDEN */
+					0x00000072 /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000005 /* EMC_TCKE */
+					0x00000015 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000006 /* EMC_TCLKSTABLE */
+					0x00000007 /* EMC_TCLKSTOP */
+					0x00001453 /* EMC_TREFBW */
+					0x0000000c /* EMC_QUSE_EXTRA */
+					0x00000004 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x00005088 /* EMC_FBIO_CFG5 */
+					0xf00b0191 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00000008 /* EMC_DLL_XFORM_DQS0 */
+					0x00000008 /* EMC_DLL_XFORM_DQS1 */
+					0x00000008 /* EMC_DLL_XFORM_DQS2 */
+					0x00000008 /* EMC_DLL_XFORM_DQS3 */
+					0x0000000a /* EMC_DLL_XFORM_DQS4 */
+					0x0000000a /* EMC_DLL_XFORM_DQS5 */
+					0x0000000a /* EMC_DLL_XFORM_DQS6 */
+					0x0000000a /* EMC_DLL_XFORM_DQS7 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x0000000c /* EMC_DLL_XFORM_DQ0 */
+					0x0000000c /* EMC_DLL_XFORM_DQ1 */
+					0x0000000c /* EMC_DLL_XFORM_DQ2 */
+					0x0000000c /* EMC_DLL_XFORM_DQ3 */
+					0x000002a0 /* EMC_XM2CMDPADCTRL */
+					0x0600013d /* EMC_XM2DQSPADCTRL2 */
+					0x22220000 /* EMC_XM2DQPADCTRL2 */
+					0x77fff884 /* EMC_XM2CLKPADCTRL */
+					0x01f1f501 /* EMC_XM2COMPPADCTRL */
+					0x07077404 /* EMC_XM2VTTGENPADCTRL */
+					0x54000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x080001e8 /* EMC_XM2QUSEPADCTRL */
+					0x0a000021 /* EMC_XM2DQSPADCTRL3 */
+					0x00000802 /* EMC_CTT_TERM_CTRL */
+					0x00020000 /* EMC_ZCAL_INTERVAL */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x0156000c /* EMC_MRS_WAIT_CNT */
+					0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+					0x00000000 /* EMC_CTT */
+					0x00000000 /* EMC_CTT_DURATION */
+					0x800028a5 /* EMC_DYN_SELF_REF_CONTROL */
+					0xf8000000 /* EMC_FBIO_SPARE */
+					0xff00ff49 /* EMC_CFG_RSV */
+				>;
+			};
+		};
+
+		emc-timings-1 {
+			timing-333500000 {
+				clock-frequency = <333500000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200000>;
+				nvidia,emc-mode-reset = <0x80000321>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+
+				nvidia,emc-configuration = <
+					0x0000000f /* EMC_RC */
+					0x00000034 /* EMC_RFC */
+					0x0000000a /* EMC_RAS */
+					0x00000003 /* EMC_RP */
+					0x00000003 /* EMC_R2W */
+					0x00000008 /* EMC_W2R */
+					0x00000002 /* EMC_R2P */
+					0x00000009 /* EMC_W2P */
+					0x00000003 /* EMC_RD_RCD */
+					0x00000003 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000001 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000004 /* EMC_WDV */
+					0x00000006 /* EMC_QUSE */
+					0x00000004 /* EMC_QRST */
+					0x0000000a /* EMC_QSAFE */
+					0x0000000c /* EMC_RDV */
+					0x000009e9 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x0000027a /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000001 /* EMC_PDEX2WR */
+					0x00000008 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000e /* EMC_RW2PDEN */
+					0x00000039 /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x0000000a /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000004 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000a2a /* EMC_TREFBW */
+					0x00000000 /* EMC_QUSE_EXTRA */
+					0x00000004 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x00007088 /* EMC_FBIO_CFG5 */
+					0x002600a4 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x0003c000 /* EMC_DLL_XFORM_DQS0 */
+					0x0003c000 /* EMC_DLL_XFORM_DQS1 */
+					0x0003c000 /* EMC_DLL_XFORM_DQS2 */
+					0x0003c000 /* EMC_DLL_XFORM_DQS3 */
+					0x00014000 /* EMC_DLL_XFORM_DQS4 */
+					0x00014000 /* EMC_DLL_XFORM_DQS5 */
+					0x00014000 /* EMC_DLL_XFORM_DQS6 */
+					0x00014000 /* EMC_DLL_XFORM_DQS7 */
+					0x00018000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00018000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00018000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00018000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00048000 /* EMC_DLL_XFORM_DQ0 */
+					0x00048000 /* EMC_DLL_XFORM_DQ1 */
+					0x00048000 /* EMC_DLL_XFORM_DQ2 */
+					0x00048000 /* EMC_DLL_XFORM_DQ3 */
+					0x000002a0 /* EMC_XM2CMDPADCTRL */
+					0x0600013d /* EMC_XM2DQSPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x77fff884 /* EMC_XM2CLKPADCTRL */
+					0x01f1f508 /* EMC_XM2COMPPADCTRL */
+					0x05057404 /* EMC_XM2VTTGENPADCTRL */
+					0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+					0x080001e8 /* EMC_XM2QUSEPADCTRL */
+					0x08000021 /* EMC_XM2DQSPADCTRL3 */
+					0x00000802 /* EMC_CTT_TERM_CTRL */
+					0x00020000 /* EMC_ZCAL_INTERVAL */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x018b000c /* EMC_MRS_WAIT_CNT */
+					0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+					0x00000000 /* EMC_CTT */
+					0x00000000 /* EMC_CTT_DURATION */
+					0x800014d4 /* EMC_DYN_SELF_REF_CONTROL */
+					0xf8000000 /* EMC_FBIO_SPARE */
+					0xff00ff89 /* EMC_CFG_RSV */
+				>;
+			};
+
+			timing-667000000 {
+				clock-frequency = <667000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200018>;
+				nvidia,emc-mode-reset = <0x80000b71>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration = <
+					0x00000020 /* EMC_RC */
+					0x0000006a /* EMC_RFC */
+					0x00000017 /* EMC_RAS */
+					0x00000007 /* EMC_RP */
+					0x00000005 /* EMC_R2W */
+					0x0000000c /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x00000011 /* EMC_W2P */
+					0x00000007 /* EMC_RD_RCD */
+					0x00000007 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000001 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000007 /* EMC_WDV */
+					0x0000000a /* EMC_QUSE */
+					0x00000009 /* EMC_QRST */
+					0x0000000b /* EMC_QSAFE */
+					0x00000011 /* EMC_RDV */
+					0x00001412 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000504 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x0000000e /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x0000000c /* EMC_AR2PDEN */
+					0x00000016 /* EMC_RW2PDEN */
+					0x00000072 /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000005 /* EMC_TCKE */
+					0x00000015 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000006 /* EMC_TCLKSTABLE */
+					0x00000007 /* EMC_TCLKSTOP */
+					0x00001453 /* EMC_TREFBW */
+					0x0000000b /* EMC_QUSE_EXTRA */
+					0x00000006 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x00005088 /* EMC_FBIO_CFG5 */
+					0xf00b0191 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x0000000a /* EMC_DLL_XFORM_DQS0 */
+					0x0000000a /* EMC_DLL_XFORM_DQS1 */
+					0x0000000a /* EMC_DLL_XFORM_DQS2 */
+					0x0000000a /* EMC_DLL_XFORM_DQS3 */
+					0x0000000a /* EMC_DLL_XFORM_DQS4 */
+					0x0000000a /* EMC_DLL_XFORM_DQS5 */
+					0x0000000a /* EMC_DLL_XFORM_DQS6 */
+					0x0000000a /* EMC_DLL_XFORM_DQS7 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x0000000c /* EMC_DLL_XFORM_DQ0 */
+					0x0000000c /* EMC_DLL_XFORM_DQ1 */
+					0x0000000c /* EMC_DLL_XFORM_DQ2 */
+					0x0000000c /* EMC_DLL_XFORM_DQ3 */
+					0x000002a0 /* EMC_XM2CMDPADCTRL */
+					0x0400013d /* EMC_XM2DQSPADCTRL2 */
+					0x22220000 /* EMC_XM2DQPADCTRL2 */
+					0x77fff884 /* EMC_XM2CLKPADCTRL */
+					0x01f1f501 /* EMC_XM2COMPPADCTRL */
+					0x07077404 /* EMC_XM2VTTGENPADCTRL */
+					0x54000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x080001e8 /* EMC_XM2QUSEPADCTRL */
+					0x0a000021 /* EMC_XM2DQSPADCTRL3 */
+					0x00000802 /* EMC_CTT_TERM_CTRL */
+					0x00020000 /* EMC_ZCAL_INTERVAL */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x0155000c /* EMC_MRS_WAIT_CNT */
+					0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+					0x00000000 /* EMC_CTT */
+					0x00000000 /* EMC_CTT_DURATION */
+					0x800028a5 /* EMC_DYN_SELF_REF_CONTROL */
+					0xe8000000 /* EMC_FBIO_SPARE */
+					0xff00ff49 /* EMC_CFG_RSV */
+				>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia-E1565.dts b/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia-E1565.dts
new file mode 100644
index 000000000000..f1c63feb4af9
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia-E1565.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra30-asus-nexus7-grouper-maxim-pmic.dtsi"
+#include "tegra30-asus-nexus7-tilapia.dtsi"
+
+/ {
+	model = "ASUS Google Nexus 7 (Project Bach / ME370TG) E1565";
+};
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi
new file mode 100644
index 000000000000..c83cc95dd83f
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi
@@ -0,0 +1,548 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "tegra30-asus-nexus7-grouper-common.dtsi"
+
+/ {
+	compatible = "asus,tilapia", "asus,grouper", "nvidia,tegra30";
+
+	display-panel {
+		enable-gpios = <&gpio TEGRA_GPIO(V, 6) GPIO_ACTIVE_HIGH>;
+
+		panel-timing {
+			clock-frequency = <81750000>;
+			hactive = <800>;
+			vactive = <1280>;
+			hfront-porch = <64>;
+			hback-porch = <128>;
+			hsync-len = <64>;
+			vsync-len = <1>;
+			vfront-porch = <5>;
+			vback-porch = <2>;
+		};
+	};
+
+	gpio@6000d000 {
+		init-mode-3g {
+			gpio-hog;
+			gpios =	<TEGRA_GPIO(D, 2) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(W, 3) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(P, 1) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(X, 5) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(U, 5) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(X, 7) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(X, 0) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(EE, 1) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(Y, 2) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(Y, 3) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(R, 7) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(U, 4) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(U, 3) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(N, 1) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(N, 2) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(N, 0) GPIO_ACTIVE_HIGH>,
+				<TEGRA_GPIO(N, 3) GPIO_ACTIVE_HIGH>;
+			output-low;
+		};
+	};
+
+	pinmux@70000868 {
+		state_default: pinmux {
+			lcd_dc1_pd2 {
+				nvidia,pins = "lcd_dc1_pd2";
+				nvidia,function = "displaya";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			lcd_pwr2_pc6 {
+				nvidia,pins = "lcd_pwr2_pc6";
+				nvidia,function = "displaya";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			spi2_cs2_n_pw3 {
+				nvidia,pins = "spi2_cs2_n_pw3";
+				nvidia,function = "spi2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap3_din_pp1 {
+				nvidia,pins = "dap3_din_pp1";
+				nvidia,function = "i2s2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			spi1_sck_px5 {
+				nvidia,pins = "spi1_sck_px5";
+				nvidia,function = "spi1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pu5 {
+				nvidia,pins = "pu5";
+				nvidia,function = "pwm2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			spi1_miso_px7 {
+				nvidia,pins = "spi1_miso_px7";
+				nvidia,function = "spi1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			spi2_mosi_px0 {
+				nvidia,pins = "spi2_mosi_px0";
+				nvidia,function = "spi2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			clk3_req_pee1 {
+				nvidia,pins = "clk3_req_pee1";
+				nvidia,function = "dev3";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			ulpi_nxt_py2 {
+				nvidia,pins = "ulpi_nxt_py2";
+				nvidia,function = "uartd";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ulpi_stp_py3 {
+				nvidia,pins = "ulpi_stp_py3";
+				nvidia,function = "uartd";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			kb_row7_pr7 {
+				nvidia,pins = "kb_row7_pr7";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pu4 {
+				nvidia,pins = "pu4";
+				nvidia,function = "pwm1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pu3 {
+				nvidia,pins = "pu3";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row15_ps7 {
+				nvidia,pins = "kb_row15_ps7";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap3_sclk_pp3 {
+				nvidia,pins = "dap3_sclk_pp3";
+				nvidia,function = "i2s2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row3_pr3 {
+				nvidia,pins = "kb_row3_pr3",
+						"kb_row13_ps5";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			kb_row13_ps5 {
+				nvidia,pins = "kb_row13_ps5";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi_wp_n_pc7 {
+				nvidia,pins = "gmi_wp_n_pc7",
+						"gmi_wait_pi7",
+						"gmi_cs4_n_pk2",
+						"gmi_cs3_n_pk4";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi_cs6_n_pi3 {
+				nvidia,pins = "gmi_cs6_n_pi3";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+		};
+	};
+
+	i2c@7000c500 {
+		proximity-sensor@28 {
+			compatible = "microchip,cap1106";
+			reg = <0x28>;
+
+			/*
+			 * Binding doesn't support specifying linux,input-type
+			 * and this results in unwanted key-presses handled by
+			 * applications, hence keep it disabled for now.
+			 */
+			status = "disabled";
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(R, 3) IRQ_TYPE_LEVEL_HIGH>;
+
+			linux,keycodes = <KEY_RESERVED>,
+					 <KEY_RESERVED>,
+					 <KEY_RESERVED>,
+					 <KEY_RESERVED>,
+					 <KEY_RESERVED>,
+					 <SW_FRONT_PROXIMITY>;
+		};
+
+		nfc@2a {
+			compatible = "nxp,pn544-i2c";
+			reg = <0x2a>;
+
+			clock-frequency = <100000>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(S, 7) IRQ_TYPE_EDGE_RISING>;
+
+			enable-gpios   = <&gpio TEGRA_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
+			firmware-gpios = <&gpio TEGRA_GPIO(P, 3) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	memory-controller@7000f400 {
+		emc-timings-0 {
+			timing-667000000 {
+				clock-frequency = <667000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200018>;
+				nvidia,emc-mode-reset = <0x80000b71>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration = <
+					0x0000001f /* EMC_RC */
+					0x00000069 /* EMC_RFC */
+					0x00000017 /* EMC_RAS */
+					0x00000007 /* EMC_RP */
+					0x00000005 /* EMC_R2W */
+					0x0000000c /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x00000011 /* EMC_W2P */
+					0x00000007 /* EMC_RD_RCD */
+					0x00000007 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000001 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000007 /* EMC_WDV */
+					0x0000000b /* EMC_QUSE */
+					0x00000009 /* EMC_QRST */
+					0x0000000b /* EMC_QSAFE */
+					0x00000011 /* EMC_RDV */
+					0x00001412 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000504 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x0000000e /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x0000000c /* EMC_AR2PDEN */
+					0x00000016 /* EMC_RW2PDEN */
+					0x00000072 /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000005 /* EMC_TCKE */
+					0x00000015 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000006 /* EMC_TCLKSTABLE */
+					0x00000007 /* EMC_TCLKSTOP */
+					0x00001453 /* EMC_TREFBW */
+					0x0000000c /* EMC_QUSE_EXTRA */
+					0x00000004 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x00005088 /* EMC_FBIO_CFG5 */
+					0xf00b0191 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00000008 /* EMC_DLL_XFORM_DQS0 */
+					0x00000008 /* EMC_DLL_XFORM_DQS1 */
+					0x00000008 /* EMC_DLL_XFORM_DQS2 */
+					0x00000008 /* EMC_DLL_XFORM_DQS3 */
+					0x0000000a /* EMC_DLL_XFORM_DQS4 */
+					0x0000000a /* EMC_DLL_XFORM_DQS5 */
+					0x0000000a /* EMC_DLL_XFORM_DQS6 */
+					0x0000000a /* EMC_DLL_XFORM_DQS7 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x0000000c /* EMC_DLL_XFORM_DQ0 */
+					0x0000000c /* EMC_DLL_XFORM_DQ1 */
+					0x0000000c /* EMC_DLL_XFORM_DQ2 */
+					0x0000000c /* EMC_DLL_XFORM_DQ3 */
+					0x000002a0 /* EMC_XM2CMDPADCTRL */
+					0x0800013d /* EMC_XM2DQSPADCTRL2 */
+					0x22220000 /* EMC_XM2DQPADCTRL2 */
+					0x77fff884 /* EMC_XM2CLKPADCTRL */
+					0x01f1f501 /* EMC_XM2COMPPADCTRL */
+					0x07077404 /* EMC_XM2VTTGENPADCTRL */
+					0x54000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x080001e8 /* EMC_XM2QUSEPADCTRL */
+					0x08000021 /* EMC_XM2DQSPADCTRL3 */
+					0x00000802 /* EMC_CTT_TERM_CTRL */
+					0x00020000 /* EMC_ZCAL_INTERVAL */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x0156000c /* EMC_MRS_WAIT_CNT */
+					0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+					0x00000000 /* EMC_CTT */
+					0x00000000 /* EMC_CTT_DURATION */
+					0x800028a5 /* EMC_DYN_SELF_REF_CONTROL */
+					0xe8000000 /* EMC_FBIO_SPARE */
+					0xff00ff49 /* EMC_CFG_RSV */
+				>;
+			};
+		};
+
+		emc-timings-1 {
+			timing-333500000 {
+				clock-frequency = <333500000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200000>;
+				nvidia,emc-mode-reset = <0x80000321>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+
+				nvidia,emc-configuration = <
+					0x0000000f /* EMC_RC */
+					0x00000034 /* EMC_RFC */
+					0x0000000a /* EMC_RAS */
+					0x00000003 /* EMC_RP */
+					0x00000003 /* EMC_R2W */
+					0x00000008 /* EMC_W2R */
+					0x00000002 /* EMC_R2P */
+					0x00000009 /* EMC_W2P */
+					0x00000003 /* EMC_RD_RCD */
+					0x00000003 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000001 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000004 /* EMC_WDV */
+					0x00000006 /* EMC_QUSE */
+					0x00000004 /* EMC_QRST */
+					0x0000000a /* EMC_QSAFE */
+					0x0000000c /* EMC_RDV */
+					0x000009e9 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x0000027a /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000001 /* EMC_PDEX2WR */
+					0x00000008 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000e /* EMC_RW2PDEN */
+					0x00000039 /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x0000000a /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000004 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000a2a /* EMC_TREFBW */
+					0x00000000 /* EMC_QUSE_EXTRA */
+					0x00000004 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x00007088 /* EMC_FBIO_CFG5 */
+					0x002600a4 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x0003c000 /* EMC_DLL_XFORM_DQS0 */
+					0x0003c000 /* EMC_DLL_XFORM_DQS1 */
+					0x0003c000 /* EMC_DLL_XFORM_DQS2 */
+					0x0003c000 /* EMC_DLL_XFORM_DQS3 */
+					0x00014000 /* EMC_DLL_XFORM_DQS4 */
+					0x00014000 /* EMC_DLL_XFORM_DQS5 */
+					0x00014000 /* EMC_DLL_XFORM_DQS6 */
+					0x00014000 /* EMC_DLL_XFORM_DQS7 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00048000 /* EMC_DLL_XFORM_DQ0 */
+					0x00048000 /* EMC_DLL_XFORM_DQ1 */
+					0x00048000 /* EMC_DLL_XFORM_DQ2 */
+					0x00048000 /* EMC_DLL_XFORM_DQ3 */
+					0x000002a0 /* EMC_XM2CMDPADCTRL */
+					0x0800013d /* EMC_XM2DQSPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x77fff884 /* EMC_XM2CLKPADCTRL */
+					0x01f1f508 /* EMC_XM2COMPPADCTRL */
+					0x05057404 /* EMC_XM2VTTGENPADCTRL */
+					0x54000007 /* EMC_XM2VTTGENPADCTRL2 */
+					0x080001e8 /* EMC_XM2QUSEPADCTRL */
+					0x08000021 /* EMC_XM2DQSPADCTRL3 */
+					0x00000802 /* EMC_CTT_TERM_CTRL */
+					0x00020000 /* EMC_ZCAL_INTERVAL */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x018b000c /* EMC_MRS_WAIT_CNT */
+					0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+					0x00000000 /* EMC_CTT */
+					0x00000000 /* EMC_CTT_DURATION */
+					0x800014d4 /* EMC_DYN_SELF_REF_CONTROL */
+					0xe8000000 /* EMC_FBIO_SPARE */
+					0xff00ff89 /* EMC_CFG_RSV */
+				>;
+			};
+
+			timing-667000000 {
+				clock-frequency = <667000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200018>;
+				nvidia,emc-mode-reset = <0x80000b71>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration = <
+					0x00000020 /* EMC_RC */
+					0x0000006a /* EMC_RFC */
+					0x00000017 /* EMC_RAS */
+					0x00000007 /* EMC_RP */
+					0x00000005 /* EMC_R2W */
+					0x0000000c /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x00000011 /* EMC_W2P */
+					0x00000007 /* EMC_RD_RCD */
+					0x00000007 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000001 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000007 /* EMC_WDV */
+					0x0000000a /* EMC_QUSE */
+					0x00000009 /* EMC_QRST */
+					0x0000000b /* EMC_QSAFE */
+					0x00000011 /* EMC_RDV */
+					0x00001412 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000504 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x0000000e /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x0000000c /* EMC_AR2PDEN */
+					0x00000016 /* EMC_RW2PDEN */
+					0x00000072 /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000005 /* EMC_TCKE */
+					0x00000015 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000006 /* EMC_TCLKSTABLE */
+					0x00000007 /* EMC_TCLKSTOP */
+					0x00001453 /* EMC_TREFBW */
+					0x0000000b /* EMC_QUSE_EXTRA */
+					0x00000006 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x00005088 /* EMC_FBIO_CFG5 */
+					0xf00b0191 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00000008 /* EMC_DLL_XFORM_DQS0 */
+					0x00000008 /* EMC_DLL_XFORM_DQS1 */
+					0x00000008 /* EMC_DLL_XFORM_DQS2 */
+					0x00000008 /* EMC_DLL_XFORM_DQS3 */
+					0x0000000a /* EMC_DLL_XFORM_DQS4 */
+					0x0000000a /* EMC_DLL_XFORM_DQS5 */
+					0x0000000a /* EMC_DLL_XFORM_DQS6 */
+					0x0000000a /* EMC_DLL_XFORM_DQS7 */
+					0x00018000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00018000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00018000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00018000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x0000000a /* EMC_DLL_XFORM_DQ0 */
+					0x0000000a /* EMC_DLL_XFORM_DQ1 */
+					0x0000000a /* EMC_DLL_XFORM_DQ2 */
+					0x0000000a /* EMC_DLL_XFORM_DQ3 */
+					0x000002a0 /* EMC_XM2CMDPADCTRL */
+					0x0800013d /* EMC_XM2DQSPADCTRL2 */
+					0x22220000 /* EMC_XM2DQPADCTRL2 */
+					0x77fff884 /* EMC_XM2CLKPADCTRL */
+					0x01f1f501 /* EMC_XM2COMPPADCTRL */
+					0x07077404 /* EMC_XM2VTTGENPADCTRL */
+					0x54000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x080001e8 /* EMC_XM2QUSEPADCTRL */
+					0x0c000021 /* EMC_XM2DQSPADCTRL3 */
+					0x00000802 /* EMC_CTT_TERM_CTRL */
+					0x00020000 /* EMC_ZCAL_INTERVAL */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x0155000c /* EMC_MRS_WAIT_CNT */
+					0xa0f10000 /* EMC_AUTO_CAL_CONFIG */
+					0x00000000 /* EMC_CTT */
+					0x00000000 /* EMC_CTT_DURATION */
+					0x800028a5 /* EMC_DYN_SELF_REF_CONTROL */
+					0xe8000000 /* EMC_FBIO_SPARE */
+					0xff00ff49 /* EMC_CFG_RSV */
+				>;
+			};
+		};
+	};
+};
-- 
2.26.0


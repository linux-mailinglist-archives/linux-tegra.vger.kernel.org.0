Return-Path: <linux-tegra+bounces-9154-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27006B4A435
	for <lists+linux-tegra@lfdr.de>; Tue,  9 Sep 2025 09:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF7381892F86
	for <lists+linux-tegra@lfdr.de>; Tue,  9 Sep 2025 07:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57D523D291;
	Tue,  9 Sep 2025 07:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0o1Q8m/"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4624823D7D9;
	Tue,  9 Sep 2025 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757404215; cv=none; b=ULa0jJtoo/Y6BVZvp+ncal7jeAP+oKDJcGTBJgnrULANfBSxVF5Jm3B5fdsAMt3XqitWQQnYe56q8by/Sllyvxe9Uy1T7g5JRqOlAqKy5L6g/mdNhwBkqU8p6iGNtJHKcHOWGDIc9TQSki2msgK0dhapusYohbbNQOd2eyT9+3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757404215; c=relaxed/simple;
	bh=pLynVTPB2eAT1g02pSCnY8TppSF0r9e9tkujpYlYa30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CTkRP49oLCbxr+YFJ8pHG9uKpRF7++6IZcnfv6StX6gyY5gL7y9KKjclKmdvONfp7f6kiMv+Ye2DkTsxIdVimhhjdPTx1cQU1OaaaJzlexTljiEJR74z/vN6iZd5EDaDpdGEqpLbhQLzSk1p1aitxretEqgZbxRhMoniWXQdnd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0o1Q8m/; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5679dbcf9d8so483091e87.0;
        Tue, 09 Sep 2025 00:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757404209; x=1758009009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7GjicCuGh2OG3uFLUNx236xeNFc443Z840LDg366HQ=;
        b=F0o1Q8m/pbsa7YPYv5coZX8grX38JmJSRtRrfaEnqw+f1yn1tPVsInFNxB0PujbrIr
         VP/NPLKtI2UJWBdos9z5Um+nzQ05nuhvtmi0pmhLZhZeYjfAFn98YNUuIMoXBE2F9o7g
         f7GvBCTh0FKjef0i0xobf8Im1JN/7Io8QkpN55SQ1/AK3sQdnZ+9+Vni/JhNgVxrQIUZ
         W2ibDs/0DZJgkv9xycFIDklL59qoEpaMKYbhtZYZvX4vNL35GuUp8kgLwoNZyJ63pmhe
         lwrTUzfLVCRIl/kPfyeW8KjWlUdgpjas8yAlfQVQLevoxXVVJmmORopigpIcrgzvgllh
         G7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757404209; x=1758009009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7GjicCuGh2OG3uFLUNx236xeNFc443Z840LDg366HQ=;
        b=Z+paqx6kBR1ytI8btIcuEqH3oL7DZf0vayBbYbqbkhjsogANkAZw+B2NiMe1VvgoWj
         kt+YiEoekHS4c1uW7IMEItz6vhUO+9vRy9IjN4Aiy6PCCKnuednsUYmXmuoua9Jvh7zX
         yGg2wTH/JBHIOihSx7s+TgpLrKSId5Za3s10QYMdb4GXl4OSRfzKadKrqeYVIjyNwD6l
         KHGX3vc19sY07+QR3yVS8SirqSwCYabWEJhroJty8G7NfL/fJzwFLpwW4jHZKRMgyCxJ
         Uy18vsf5wtdnoS5VdEuh5BIc+RHlz6fr4mnpzYep4PLtskc2dTMqWvq66vCI0fl+c5NK
         rcQw==
X-Forwarded-Encrypted: i=1; AJvYcCX7R9FwYdtTOGVdqwjMuyzP/08JPAwQkZ3Dcuv8NsD/E4rLIdNLl1okmb0tGIuBGeFSAUdUkZd69d4iAQc=@vger.kernel.org, AJvYcCXpbPqloqYctzSsPUEl0Ci2eERKe3ryVcm34+QDTkD1gTpcwnrEqfbe9VRqB63BdnwuUz5ONT/WnTMIXzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAi3clS9gcuWrl6jBz641+dM2kCnzlgQ1HkWqZHZL2sBBIN6bh
	7qXHW3xmOqPJWUgd2SViNj+M8HVC3aKMzTzAiny9biMMv2Po/jVcGfy6
X-Gm-Gg: ASbGncvefdeGSx3D5EmrP1xXyFa1GtPFP19/zcgFxgL6GKO4CxZK9WLf+B0LP6ra5OD
	mXEEHEQtwbf7wN1PpKw8OwzPDA/VGfqRCejHN++enkrdW7NidL9UDT4XDY5fp81uSBBjK8cKhH0
	ZJd7W7lK6XDDW5Z5rHicWmyLe1h51LoXOHSBHliZlZub+pz5411QorX77lntjfs53xnSNcb3yo3
	PPBnIhNn3Xxaq9rfP/nNhGEtQGRHcX3KQvj4Y0X8B8Cv48SKzD3EVw6Z2qUuaSej8IK7xIx6qTh
	mYvdIDoiLmq3CfjCG37iYcvuIV3SPI/ipN7T5M+Q1GdGvoq5vmw0wNIi0vrWVw5ZMQxlwcDl9tb
	Ii+q2ZhgQGtcSsw==
X-Google-Smtp-Source: AGHT+IEIGrediq43HUVYd1iiuNkwVGZSOUswYw1QBmSndvHRyn22X8bHD+p/iMyJqfMSHVHSlg7hrA==
X-Received: by 2002:a05:6512:3b1f:b0:560:99a1:db7b with SMTP id 2adb3069b0e04-56262191d74mr3118335e87.56.1757404208726;
        Tue, 09 Sep 2025 00:50:08 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680cce9f3csm340021e87.52.2025.09.09.00.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:50:08 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ARM: tegra: add device-tree for Xiaomi Mi Pad (A0101)
Date: Tue,  9 Sep 2025 10:49:58 +0300
Message-ID: <20250909074958.92704-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250909074958.92704-1-clamor95@gmail.com>
References: <20250909074958.92704-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Mi Pad is a tablet computer based on Nvidia Tegra K1 SoC which
originally ran the Android operating system. The Mi Pad has a 7.9" IPS
display with 1536 x 2048 (324 ppi) resolution. 2 GB of RAM and 16/64 GB of
internal memory that can be supplemented with a microSDXC card giving up
to 128 GB of additional storage.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/Makefile             |    3 +-
 .../boot/dts/nvidia/tegra124-xiaomi-mocha.dts | 2514 +++++++++++++++++
 2 files changed, 2516 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts

diff --git a/arch/arm/boot/dts/nvidia/Makefile b/arch/arm/boot/dts/nvidia/Makefile
index 2ed2d923c8f9..faf591485ada 100644
--- a/arch/arm/boot/dts/nvidia/Makefile
+++ b/arch/arm/boot/dts/nvidia/Makefile
@@ -11,7 +11,8 @@ dtb-$(CONFIG_ARCH_TEGRA_124_SOC) += \
 	tegra124-nyan-big.dtb \
 	tegra124-nyan-big-fhd.dtb \
 	tegra124-nyan-blaze.dtb \
-	tegra124-venice2.dtb
+	tegra124-venice2.dtb \
+	tegra124-xiaomi-mocha.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += \
 	tegra20-acer-a500-picasso.dtb \
 	tegra20-asus-sl101.dtb \
diff --git a/arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts b/arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts
new file mode 100644
index 000000000000..71c3e3aa965c
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts
@@ -0,0 +1,2514 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/ti-drv260x.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/thermal/thermal.h>
+
+#include "tegra124.dtsi"
+
+/ {
+	model = "Xiaomi Mi Pad A0101";
+	compatible = "xiaomi,mocha", "nvidia,tegra124";
+	chassis-type = "tablet";
+
+	aliases {
+		mmc0 = &sdmmc4; /* eMMC */
+		mmc1 = &sdmmc3; /* uSD slot */
+		mmc2 = &sdmmc1; /* WiFi */
+
+		rtc0 = &palmas;
+		rtc1 = "/rtc@7000e000";
+
+		serial0 = &uartd; /* Console */
+		serial1 = &uartc; /* Bluetooth */
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		reg = <0 0x80000000 0 0x80000000>;
+	};
+
+	host1x@50000000 {
+		dsia: dsi@54300000 {
+			status = "okay";
+
+			avdd-dsi-csi-supply = <&avdd_dsi_csi>;
+			nvidia,ganged-mode = <&dsib>;
+
+			panel@0 {
+				compatible = "sharp,lq079l1sx01";
+				reg = <0>;
+
+				reset-gpios = <&gpio TEGRA_GPIO(H, 3) GPIO_ACTIVE_LOW>;
+
+				avdd-supply = <&avdd_lcd>;
+				vddio-supply = <&vdd_lcd_io>;
+
+				vsp-supply = <&vsp_5v5_lcd>;
+				vsn-supply = <&vsn_5v5_lcd>;
+
+				backlight = <&lp8556>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						panel_link0: endpoint {
+							remote-endpoint = <&dsia_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						panel_link1: endpoint {
+							remote-endpoint = <&dsib_out>;
+						};
+					};
+				};
+			};
+
+			port {
+				dsia_out: endpoint {
+					remote-endpoint = <&panel_link0>;
+				};
+			};
+		};
+
+		dsib: dsi@54400000 {
+			status = "okay";
+
+			avdd-dsi-csi-supply = <&avdd_dsi_csi>;
+
+			port {
+				dsib_out: endpoint {
+					remote-endpoint = <&panel_link1>;
+				};
+			};
+		};
+	};
+
+	gpu@57000000 {
+		vdd-supply = <&vdd_gpu>;
+	};
+
+	clock@60006000 {
+		emc-timings-0 {
+			nvidia,ram-code = <0>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-300000000 {
+				clock-frequency = <300000000>;
+				nvidia,parent-clock-frequency = <600000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_C>;
+				clock-names = "emc-parent";
+			};
+
+			timing-396000000 {
+				clock-frequency = <396000000>;
+				nvidia,parent-clock-frequency = <792000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_M>;
+				clock-names = "emc-parent";
+			};
+
+			timing-528000000 {
+				clock-frequency = <528000000>;
+				nvidia,parent-clock-frequency = <528000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
+				clock-names = "emc-parent";
+			};
+
+			timing-600000000 {
+				clock-frequency = <600000000>;
+				nvidia,parent-clock-frequency = <600000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_C_UD>;
+				clock-names = "emc-parent";
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+				nvidia,parent-clock-frequency = <792000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
+				clock-names = "emc-parent";
+			};
+
+			timing-924000000 {
+				clock-frequency = <924000000>;
+				nvidia,parent-clock-frequency = <924000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
+				clock-names = "emc-parent";
+			};
+		};
+	};
+
+	pinmux@70000868 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&state_default>;
+
+		state_default: pinmux {
+			/* Keys pinmux */
+			keys {
+				nvidia,pins = "kb_col0_pq0",
+					      "kb_col6_pq6",
+					      "kb_col7_pq7";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			hall-front {
+				nvidia,pins = "pi5";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			hall-back {
+				nvidia,pins = "gpio_w3_aud_pw3";
+				nvidia,function = "spi1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Leds pinmux */
+			bl-en {
+				nvidia,pins = "pbb4";
+				nvidia,function = "vgp4";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			keys-led {
+				nvidia,pins = "ph1";
+				nvidia,function = "pwm1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			leds-en {
+				nvidia,pins = "pg7";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Panel pinmux */
+			lcd-rst {
+				nvidia,pins = "ph3";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			lcd-vsp {
+				nvidia,pins = "pi4";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			lcd-vsn {
+				nvidia,pins = "kb_row10_ps2";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			lcd-id {
+				nvidia,pins = "kb_row6_pr6";
+				nvidia,function = "displaya_alt";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			lcd-pwm {
+				nvidia,pins = "ph2";
+				nvidia,function = "pwm2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* SDMMC1 pinmux */
+			sdmmc1-clk {
+				nvidia,pins = "sdmmc1_clk_pz0";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			sdmmc1-cmd {
+				nvidia,pins = "sdmmc1_cmd_pz1",
+					      "sdmmc1_dat0_py7",
+					      "sdmmc1_dat1_py6",
+					      "sdmmc1_dat2_py5",
+					      "sdmmc1_dat3_py4";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* SDMMC3 pinmux */
+			sdmmc3-clk {
+				nvidia,pins = "sdmmc3_clk_pa6";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			sdmmc3-cmd {
+				nvidia,pins = "sdmmc3_cmd_pa7",
+					      "sdmmc3_dat0_pb7",
+					      "sdmmc3_dat1_pb6",
+					      "sdmmc3_dat2_pb5",
+					      "sdmmc3_dat3_pb4",
+					      "sdmmc3_clk_lb_out_pee4",
+					      "sdmmc3_clk_lb_in_pee5";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			sdmmc3-cd {
+				nvidia,pins = "sdmmc3_cd_n_pv2";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			usd-pwr {
+				nvidia,pins = "kb_row0_pr0";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* SDMMC4 pinmux */
+			sdmmc4-clk {
+				nvidia,pins = "sdmmc4_clk_pcc4";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			sdmmc4-cmd {
+				nvidia,pins = "sdmmc4_cmd_pt7",
+					      "sdmmc4_dat0_paa0",
+					      "sdmmc4_dat1_paa1",
+					      "sdmmc4_dat2_paa2",
+					      "sdmmc4_dat3_paa3",
+					      "sdmmc4_dat4_paa4",
+					      "sdmmc4_dat5_paa5",
+					      "sdmmc4_dat6_paa6",
+					      "sdmmc4_dat7_paa7";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* UART-B pinmux */
+			uartb-cts {
+				nvidia,pins = "uart2_cts_n_pj5";
+				nvidia,function = "uartb";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			uartb-rts {
+				nvidia,pins = "uart2_rts_n_pj6";
+				nvidia,function = "uartb";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			uartb-rxd {
+				nvidia,pins = "uart2_rxd_pc3";
+				nvidia,function = "irda";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			uartb-txd {
+				nvidia,pins = "uart2_txd_pc2";
+				nvidia,function = "irda";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* UART-C pinmux */
+			uartc-cts-rxd {
+				nvidia,pins = "uart3_cts_n_pa1",
+					      "uart3_rxd_pw7";
+				nvidia,function = "uartc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			uartc-rts-txd {
+				nvidia,pins = "uart3_rts_n_pc0",
+					      "uart3_txd_pw6";
+				nvidia,function = "uartc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* UART-D pinmux */
+			uartd-txd {
+				nvidia,pins = "pj7";
+				nvidia,function = "uartd";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			uartd-rxd {
+				nvidia,pins = "pb0";
+				nvidia,function = "uartd";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* I2C pinmux */
+			gen1-i2c {
+				nvidia,pins = "gen1_i2c_sda_pc5",
+					      "gen1_i2c_scl_pc4";
+				nvidia,function = "i2c1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <TEGRA_PIN_DISABLE>;
+				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+			};
+
+			gen2-i2c {
+				nvidia,pins = "gen2_i2c_scl_pt5",
+					      "gen2_i2c_sda_pt6";
+				nvidia,function = "i2c2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <TEGRA_PIN_DISABLE>;
+				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+			};
+
+			cam-i2c {
+				nvidia,pins = "cam_i2c_scl_pbb1",
+					      "cam_i2c_sda_pbb2";
+				nvidia,function = "i2c3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <TEGRA_PIN_DISABLE>;
+				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+			};
+
+			ddc-i2c {
+				nvidia,pins = "ddc_scl_pv4",
+					      "ddc_sda_pv5";
+				nvidia,function = "i2c4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			pwr-i2c {
+				nvidia,pins = "pwr_i2c_scl_pz6",
+					      "pwr_i2c_sda_pz7";
+				nvidia,function = "i2cpwr";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+			};
+
+			ts-irq {
+				nvidia,pins = "kb_row7_pr7";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			ts-rst {
+				nvidia,pins = "pk4";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			ts-en {
+				nvidia,pins = "pk1";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			hapt-en {
+				nvidia,pins = "pg6";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			charger-irq {
+				nvidia,pins = "pj0";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			bat-irq {
+				nvidia,pins = "kb_col5_pq5";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			compass-rst {
+				nvidia,pins = "kb_col4_pq4";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			als-irq {
+				nvidia,pins = "gpio_x3_aud_px3";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			therm-irq {
+				nvidia,pins = "pi6";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			snsr-vio {
+				nvidia,pins = "pbb5";
+				nvidia,function = "vgp5";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			wlan-reg-on {
+				nvidia,pins = "gpio_x7_aud_px7";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			wlan-rst {
+				nvidia,pins = "clk2_req_pcc5";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			wlan-host-wake {
+				nvidia,pins = "pu5";
+				nvidia,function = "pwm2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			bt-pdwn {
+				nvidia,pins = "kb_row1_pr1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			bt-host-wake {
+				nvidia,pins = "pu6";
+				nvidia,function = "rsvd3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			bt-dev-wake {
+				nvidia,pins = "clk3_req_pee1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			imu-irq {
+				nvidia,pins = "kb_row3_pr3";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			imu-sync {
+				nvidia,pins = "kb_row8_ps0";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			dsi-b {
+				nvidia,pins = "mipi_pad_ctrl_dsi_b";
+				nvidia,function = "dsi_b";
+			};
+
+			/* GPIO power/drive control */
+			drive-sdio1 {
+				nvidia,pins = "drive_sdio1";
+				nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
+				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+				nvidia,pull-down-strength = <32>;
+				nvidia,pull-up-strength = <42>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+			};
+
+			drive-sdio3 {
+				nvidia,pins = "drive_sdio3";
+				nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
+				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+				nvidia,pull-down-strength = <20>;
+				nvidia,pull-up-strength = <36>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+			};
+
+			drive-gma {
+				nvidia,pins = "drive_gma";
+				nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
+				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_1>;
+				nvidia,pull-down-strength = <1>;
+				nvidia,pull-up-strength = <2>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+			};
+		};
+	};
+
+	uartc: serial@70006200 {
+		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
+		/delete-property/ reg-shift;
+		status = "okay";
+
+		nvidia,adjust-baud-rates = <0 9600 100>,
+					   <9600 115200 200>,
+					   <1000000 4000000 136>;
+
+		bluetooth {
+			compatible = "brcm,bcm43540-bt";
+			max-speed = <4000000>;
+
+			clocks = <&clk32k_pmic>;
+			clock-names = "lpo";
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "host-wakeup";
+
+			device-wakeup-gpios = <&gpio TEGRA_GPIO(EE, 1) GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_LOW>;
+			shutdown-gpios = <&gpio TEGRA_GPIO(R, 1) GPIO_ACTIVE_HIGH>;
+
+			vbat-supply  = <&vdd_3v3_sys>;
+			vddio-supply = <&vdd_1v8_vio>;
+		};
+	};
+
+	uartd: serial@70006300 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
+		status = "okay";
+
+		/* Console */
+	};
+
+	pwm@7000a000 {
+		status = "okay";
+	};
+
+	gen1_i2c: i2c@7000c000 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		lp8556: backlight@2c {
+			compatible = "ti,lp8556";
+			reg = <0x2c>;
+
+			dev-ctrl = /bits/ 8 <0x83>;
+			init-brt = /bits/ 8 <0x1f>;
+
+			power-supply = <&vdd_3v3_sys>;
+			enable-supply = <&vddio_1v8_bl>;
+
+			rom-98h {
+				rom-addr = /bits/ 8 <0x98>;
+				rom-val = /bits/ 8 <0x80>;
+			};
+
+			rom-9eh {
+				rom-addr = /bits/ 8 <0x9e>;
+				rom-val = /bits/ 8 <0x21>;
+			};
+
+			rom-a0h {
+				rom-addr = /bits/ 8 <0xa0>;
+				rom-val = /bits/ 8 <0xff>;
+			};
+
+			rom-a1h {
+				rom-addr = /bits/ 8 <0xa1>;
+				rom-val = /bits/ 8 <0x3f>;
+			};
+
+			rom-a2h {
+				rom-addr = /bits/ 8 <0xa2>;
+				rom-val = /bits/ 8 <0x20>;
+			};
+
+			rom-a3h {
+				rom-addr = /bits/ 8 <0xa3>;
+				rom-val = /bits/ 8 <0x00>;
+			};
+
+			rom-a4h {
+				rom-addr = /bits/ 8 <0xa4>;
+				rom-val = /bits/ 8 <0x72>;
+			};
+
+			rom-a5h {
+				rom-addr = /bits/ 8 <0xa5>;
+				rom-val = /bits/ 8 <0x24>;
+			};
+
+			rom-a6h {
+				rom-addr = /bits/ 8 <0xa6>;
+				rom-val = /bits/ 8 <0x80>;
+			};
+
+			rom-a7h {
+				rom-addr = /bits/ 8 <0xa7>;
+				rom-val = /bits/ 8 <0xf5>;
+			};
+
+			rom-a8h {
+				rom-addr = /bits/ 8 <0xa8>;
+				rom-val = /bits/ 8 <0x24>;
+			};
+
+			rom-a9h {
+				rom-addr = /bits/ 8 <0xa9>;
+				rom-val = /bits/ 8 <0xb2>;
+			};
+
+			rom-aah {
+				rom-addr = /bits/ 8 <0xaa>;
+				rom-val = /bits/ 8 <0x8f>;
+			};
+
+			rom-aeh {
+				rom-addr = /bits/ 8 <0xae>;
+				rom-val = /bits/ 8 <0x0f>;
+			};
+		};
+
+		led-controller@32 {
+			compatible = "national,lp5521";
+			reg = <0x32>;
+
+			enable-gpios = <&gpio TEGRA_GPIO(G, 7) GPIO_ACTIVE_HIGH>;
+			clock-mode = /bits/ 8 <2>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+
+				led-cur = /bits/ 8 <0x14>;
+				max-cur = /bits/ 8 <0xff>;
+
+				color = <LED_COLOR_ID_RED>;
+				function = LED_FUNCTION_STATUS;
+			};
+
+			led@1 {
+				reg = <1>;
+
+				led-cur = /bits/ 8 <0x14>;
+				max-cur = /bits/ 8 <0xff>;
+
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_STATUS;
+			};
+
+			led@2 {
+				reg = <2>;
+
+				led-cur = /bits/ 8 <0x14>;
+				max-cur = /bits/ 8 <0xff>;
+
+				color = <LED_COLOR_ID_BLUE>;
+				function = LED_FUNCTION_STATUS;
+			};
+		};
+
+		audio-codec@34 {
+			compatible = "nxp,tfa9890";
+			reg = <0x34>;
+
+			sound-name-prefix = "Speaker Right";
+			vddd-supply = <&vdd_1v8_vio>;
+
+			#sound-dai-cells = <0>;
+		};
+
+		audio-codec@37 {
+			compatible = "nxp,tfa9890";
+			reg = <0x37>;
+
+			sound-name-prefix = "Speaker Left";
+			vddd-supply = <&vdd_1v8_vio>;
+
+			#sound-dai-cells = <0>;
+		};
+
+		light-sensor@44 {
+			compatible = "isil,isl29035";
+			reg = <0x44>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(X, 3) IRQ_TYPE_LEVEL_LOW>;
+
+			vcc-supply = <&vdd_3v3_sys>;
+		};
+
+		temp_sensor: temperature-sensor@4c {
+			compatible = "ti,tmp451";
+			reg = <0x4c>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(I, 6) IRQ_TYPE_EDGE_FALLING>;
+
+			vcc-supply = <&vdd_1v8_vio>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		haptic-engine@5a {
+			compatible = "ti,drv2604";
+			reg = <0x5a>;
+
+			enable-gpios = <&gpio TEGRA_GPIO(G, 6) GPIO_ACTIVE_HIGH>;
+
+			mode = <DRV260X_ERM_MODE>;
+			library-sel = <DRV260X_ERM_LIB_A>;
+
+			vib-rated-mv = <3200>;
+			vib-overdrive-mv = <3400>;
+
+			vbat-supply = <&vdd_3v3_sys>;
+		};
+	};
+
+	gen2_i2c: i2c@7000c400 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		power-sensor@40 {
+			compatible = "ti,ina230";
+			reg = <0x40>;
+
+			vs-supply = <&vdd_hv_sdmmc>;
+			#io-channel-cells = <1>;
+		};
+
+		fuel-gauge@55 {
+			compatible = "ti,bq27520g4";
+			reg = <0x55>;
+
+			monitored-battery = <&battery>;
+			power-supplies = <&bq24192>;
+		};
+
+		bq24192: charger@6b {
+			compatible = "ti,bq24192";
+			reg = <0x6b>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(J, 0) IRQ_TYPE_EDGE_FALLING>;
+
+			monitored-battery = <&battery>;
+
+			omit-battery-class;
+			ti,system-minimum-microvolt = <3500000>;
+
+			usb_otg_vbus: usb-otg-vbus {
+				regulator-name = "usb_otg_vbus";
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5000000>;
+			};
+		};
+	};
+
+	i2c@7000c700 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		/* Atmel mxT1664T/mxT1066T touchscreen */
+		touchscreen@4a {
+			compatible = "atmel,maxtouch";
+			reg = <0x4a>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(R, 7) IRQ_TYPE_EDGE_FALLING>;
+
+			reset-gpios = <&gpio TEGRA_GPIO(K, 4) GPIO_ACTIVE_LOW>;
+
+			linux,keycodes = <KEY_BACK KEY_HOME KEY_MENU>;
+
+			vdda-supply = <&avdd_3v3_ts>;
+			vdd-supply  = <&vdd_2v8_tp>;
+		};
+	};
+
+	i2c@7000d000 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		/* Texas Instruments TPS65913 PMIC */
+		palmas: pmic@58 {
+			compatible = "ti,tps65913", "ti,palmas";
+			reg = <0x58>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+
+			#interrupt-cells = <2>;
+			interrupt-controller;
+
+			ti,system-power-controller;
+
+			palmas_gpadc: adc {
+				compatible = "ti,palmas-gpadc";
+				interrupts = <18 IRQ_TYPE_NONE>,
+					     <16 IRQ_TYPE_NONE>,
+					     <17 IRQ_TYPE_NONE>;
+
+				ti,channel0-current-microamp = <20>;
+				#io-channel-cells = <1>;
+			};
+
+			palmas_extcon: extcon {
+				compatible = "ti,palmas-usb-vid";
+
+				ti,enable-vbus-detection;
+				ti,enable-id-detection;
+
+				ti,wakeup;
+			};
+
+			palmas_gpio: gpio {
+				compatible = "ti,palmas-gpio";
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			clk32k_pmic: palmas-clk32k@0 {
+				compatible = "ti,palmas-clk32kg";
+				#clock-cells = <0>;
+			};
+
+			pinmux {
+				compatible = "ti,tps65913-pinctrl";
+
+				pinctrl-names = "default";
+				pinctrl-0 = <&palmas_default>;
+
+				palmas_default: pinmux {
+					pin_gpio0 {
+						pins = "gpio0";
+						function = "id";
+						bias-pull-up;
+					};
+
+					pin_gpio1 {
+						pins = "gpio1";
+						function = "gpio";
+					};
+
+					pin_gpio2 {
+						pins = "gpio2";
+						function = "gpio";
+					};
+
+					/* GPIO3 is not used */
+
+					pin_gpio4 {
+						pins = "gpio4";
+						function = "gpio";
+					};
+
+					pin_gpio5 {
+						pins = "gpio5";
+						function = "clk32kgaudio";
+					};
+
+					/* GPIO6 is not used */
+
+					pin_gpio7 {
+						pins = "gpio7";
+						function = "gpio";
+					};
+
+					pin_powergood {
+						pins = "powergood";
+						function = "powergood";
+					};
+
+					pin_vac {
+						pins = "vac";
+						function = "vac";
+					};
+				};
+			};
+
+			pmic {
+				compatible = "ti,tps65913-pmic", "ti,palmas-pmic";
+
+				ldo1-in-supply = <&vdd_1v8_vio>;
+				ldo2-in-supply = <&vdd_3v3_sys>;
+				ldo3-in-supply = <&vdd_smps10_out2>;
+				ldo4-in-supply = <&vdd_3v3_sys>;
+				ldo5-in-supply = <&vdd_1v8_vio>;
+				ldo6-in-supply = <&vdd_3v3_sys>;
+				ldo7-in-supply = <&vdd_3v3_sys>;
+				ldo8-in-supply = <&vdd_3v3_sys>;
+				ldo9-in-supply = <&vdd_hv_sdmmc>;
+				ldousb-in-supply = <&vdd_smps10_out2>;
+				ldoln-in-supply = <&vdd_smps10_out2>;
+
+				regulators {
+					vdd_cpu: smps123 {
+						regulator-name = "vdd_cpu";
+						regulator-min-microvolt = <700000>;
+						regulator-max-microvolt = <1400000>;
+						regulator-always-on;
+						regulator-boot-on;
+						ti,roof-floor = <1>;
+						ti,mode-sleep = <3>;
+					};
+
+					vdd_gpu: smps45 {
+						regulator-name = "vdd_gpu";
+						regulator-min-microvolt = <700000>;
+						regulator-max-microvolt = <1400000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					vddio_ddr: smps6 {
+						regulator-name = "vddio_ddr";
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <1200000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					vdd_core: smps7 {
+						regulator-name = "vdd_core";
+						regulator-min-microvolt = <700000>;
+						regulator-max-microvolt = <1400000>;
+						regulator-always-on;
+						regulator-boot-on;
+						ti,roof-floor = <3>;
+					};
+
+					vdd_1v8_vio: smps8 {
+						regulator-name = "vdd_1v8_gen";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					vdd_hv_sdmmc: smps9 {
+						regulator-name = "vdd_hv_sdmmc";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					smps10_out1 {
+						regulator-name = "vd_smps10_out1";
+						regulator-min-microvolt = <5000000>;
+						regulator-max-microvolt = <5000000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					vdd_smps10_out2: smps10_out2 {
+						regulator-name = "vd_smps10_out2";
+						regulator-min-microvolt = <5000000>;
+						regulator-max-microvolt = <5000000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					avdd_pll: ldo1 {
+						regulator-name = "avdd_pll";
+						regulator-min-microvolt = <1050000>;
+						regulator-max-microvolt = <1050000>;
+						regulator-always-on;
+						regulator-boot-on;
+						ti,roof-floor = <3>;
+					};
+
+					avdd_lcd: ldo2 {
+						regulator-name = "avdd_lcd";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+						regulator-boot-on;
+					};
+
+					avdd_3v3_ts: ldo3 {
+						regulator-name = "avdd_3v3_ts";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-boot-on;
+					};
+
+					avdd_dsi_csi: ldo5 {
+						regulator-name = "avdd_dsi_csi";
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <1200000>;
+						regulator-boot-on;
+					};
+
+					ldo8 {
+						regulator-name = "vdd_rtc";
+						regulator-min-microvolt = <950000>;
+						regulator-max-microvolt = <950000>;
+						regulator-always-on;
+						regulator-boot-on;
+						ti,enable-ldo8-tracking;
+					};
+
+					vddio_usd: ldo9 {
+						regulator-name = "vddio_sdmmc";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <3300000>;
+					};
+
+					avdd_usb: ldousb {
+						regulator-name = "vdd_usb";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					ldoln {
+						regulator-name = "vddio_hv";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+				};
+			};
+
+			rtc {
+				compatible = "ti,palmas-rtc";
+				interrupt-parent = <&palmas>;
+				interrupts = <8 IRQ_TYPE_NONE>;
+			};
+		};
+	};
+
+	pmc@7000e400 {
+		nvidia,invert-interrupt;
+		nvidia,suspend-mode = <2>;
+		nvidia,cpu-pwr-good-time = <500>;
+		nvidia,cpu-pwr-off-time = <300>;
+		nvidia,core-pwr-good-time = <641 3845>;
+		nvidia,core-pwr-off-time = <61036>;
+		nvidia,core-power-req-active-high;
+		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
+
+		/* Clear DEV_ON bit in DEV_CTRL register of TPS65913 PMIC */
+		i2c-thermtrip {
+			nvidia,i2c-controller-id = <4>;
+			nvidia,bus-addr = <0x58>;
+			nvidia,reg-addr = <0xa0>;
+			nvidia,reg-data = <0x00>;
+		};
+	};
+
+	memory-controller@70019000 {
+		emc-timings-0 {
+			/* Hynix H9CKNNNBKTMTDR DDR3 924MHz */
+			nvidia,ram-code = <0>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+
+				nvidia,emem-configuration = < 0x40040001 0x8000000a
+					0x00000001 0x00000002 0x00000004 0x00000000
+					0x00000003 0x00000001 0x00000002 0x00000007
+					0x00000002 0x00000001 0x00000004 0x00000005
+					0x05040102 0x000b0604 0x77230305 0x70000f03
+					0x001f0000 >;
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+
+				nvidia,emem-configuration = < 0x40020001 0x80000012
+					0x00000001 0x00000002 0x00000004 0x00000000
+					0x00000003 0x00000001 0x00000002 0x00000007
+					0x00000002 0x00000001 0x00000004 0x00000005
+					0x05040102 0x000b0604 0x75a30305 0x70000f03
+					0x001f0000 >;
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+
+				nvidia,emem-configuration = < 0xa0000001 0x80000017
+					0x00000001 0x00000002 0x00000004 0x00000000
+					0x00000003 0x00000001 0x00000002 0x00000007
+					0x00000002 0x00000001 0x00000004 0x00000005
+					0x05040102 0x000b0604 0x74030305 0x70000f03
+					0x001f0000 >;
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+
+				nvidia,emem-configuration = < 0x00000001 0x8000001e
+					0x00000001 0x00000002 0x00000003 0x00000000
+					0x00000003 0x00000001 0x00000002 0x00000007
+					0x00000002 0x00000001 0x00000004 0x00000005
+					0x05040102 0x000a0503 0x73830404 0x70000f03
+					0x001f0000 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = < 0x08000001 0x80000026
+					0x00000001 0x00000002 0x00000004 0x00000001
+					0x00000003 0x00000001 0x00000002 0x00000007
+					0x00000002 0x00000001 0x00000004 0x00000005
+					0x05040102 0x000a0504 0x73430505 0x70000f03
+					0x001f0000 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = < 0x01000003 0x80000040
+					0x00000001 0x00000002 0x00000007 0x00000003
+					0x00000005 0x00000001 0x00000002 0x00000007
+					0x00000003 0x00000001 0x00000005 0x00000005
+					0x05050103 0x000b0607 0x72e40a08 0x70000f03
+					0x001f0000 >;
+			};
+
+			timing-300000000 {
+				clock-frequency = <300000000>;
+
+				nvidia,emem-configuration = < 0x08000004 0x80000040
+					0x00000001 0x00000002 0x00000009 0x00000005
+					0x00000007 0x00000001 0x00000002 0x00000007
+					0x00000003 0x00000001 0x00000005 0x00000005
+					0x05050103 0x000c0709 0x72c50e0a 0x70000f03
+					0x001f0000 >;
+			};
+
+			timing-396000000 {
+				clock-frequency = <396000000>;
+
+				nvidia,emem-configuration = < 0x0f000005 0x80000040
+					0x00000002 0x00000003 0x0000000c 0x00000007
+					0x00000009 0x00000001 0x00000002 0x00000007
+					0x00000003 0x00000001 0x00000005 0x00000005
+					0x05050103 0x000e090c 0x72c6120d 0x70000f03
+					0x001f0000 >;
+			};
+
+			timing-528000000 {
+				clock-frequency = <528000000>;
+
+				nvidia,emem-configuration = < 0x0f000007 0x80000040
+					0x00000003 0x00000004 0x00000010 0x0000000a
+					0x0000000d 0x00000002 0x00000002 0x00000009
+					0x00000003 0x00000001 0x00000006 0x00000006
+					0x06060103 0x00120b10 0x72c81811 0x70000f03
+					0x001f0000 >;
+			};
+
+			timing-600000000 {
+				clock-frequency = <600000000>;
+
+				nvidia,emem-configuration = < 0x00000009 0x80000040
+					0x00000004 0x00000005 0x00000012 0x0000000b
+					0x0000000e 0x00000002 0x00000003 0x0000000a
+					0x00000003 0x00000001 0x00000006 0x00000007
+					0x07060103 0x00140d12 0x72c91b13 0x70000f03
+					0x001f0000 >;
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+
+				nvidia,emem-configuration = < 0x0e00000b 0x80000040
+					0x00000006 0x00000007 0x00000018 0x0000000f
+					0x00000013 0x00000003 0x00000003 0x0000000c
+					0x00000003 0x00000001 0x00000008 0x00000008
+					0x08080103 0x001a1118 0x72ac2419 0x70000f02
+					0x001f0000 >;
+			};
+
+			timing-924000000 {
+				clock-frequency = <924000000>;
+
+				nvidia,emem-configuration = < 0x0e00000d 0x80000040
+					0x00000007 0x00000008 0x0000001b 0x00000012
+					0x00000017 0x00000004 0x00000004 0x0000000e
+					0x00000004 0x00000001 0x00000009 0x00000009
+					0x09090104 0x001e141b 0x72ae2a1c 0x70000f02
+					0x001f0000 >;
+			};
+		};
+	};
+
+	external-memory-controller@7001b000 {
+		emc-timings-0 {
+			/* Hynix H9CKNNNBKTMTDR DDR3 924MHz */
+			nvidia,ram-code = <0>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0xd3200000>;
+				nvidia,emc-cfg-2 = <0x000008c7>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80010083>;
+				nvidia,emc-mode-2 = <0x80020004>;
+				nvidia,emc-mode-4 = <0x800b0000>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-mrs-wait-cnt = <0x000d0011>;
+				nvidia,emc-sel-dpd-ctrl = <0x0004013c>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b018>;
+				nvidia,emc-zcal-cnt-long = <0x00000015>;
+				nvidia,emc-zcal-interval = <0x00064000>;
+
+				nvidia,emc-configuration =  <
+					0x00000000 0x00000002 0x00000000 0x00000002
+					0x00000005 0x00000006 0x00000008 0x00000003
+					0x0000000a 0x00000002 0x00000002 0x00000001
+					0x00000002 0x00000000 0x00000003 0x00000003
+					0x00000006 0x00000002 0x00000000 0x00000005
+					0x00000005 0x00010000 0x00000003 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000004
+					0x0000000c 0x0000000d 0x0000000f 0x00000030
+					0x00000000 0x0000000c 0x00000002 0x00000002
+					0x00000005 0x00000000 0x00000001 0x0000000c
+					0x00000003 0x00000003 0x00000003 0x00000003
+					0x00000003 0x00000006 0x00000006 0x00000003
+					0x00000003 0x00000056 0x00000000 0x00000000
+					0x00000000 0x1363a296 0x005800a0 0x00008000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x000fc000 0x000fc000 0x00000000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x0000fc00 0x0000fc00
+					0x0000fc00 0x0000fc00 0x00000200 0x00000000
+					0x00100100 0x00000000 0x00000000 0x77ffc000
+					0x00000404 0x81f1f008 0x07070000 0x0000003f
+					0x015ddddd 0x51451400 0x00514514 0x00514514
+					0x51451400 0x0000003f 0x00000000 0x00000000
+					0x00000011 0x000d0011 0x00000000 0x00000003
+					0x0000f3f3 0x80000164 0x0000000a >;
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0xd3200000>;
+				nvidia,emc-cfg-2 = <0x000008c7>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80010083>;
+				nvidia,emc-mode-2 = <0x80020004>;
+				nvidia,emc-mode-4 = <0x800b0000>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-mrs-wait-cnt = <0x00150011>;
+				nvidia,emc-sel-dpd-ctrl = <0x0004013c>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b018>;
+				nvidia,emc-zcal-cnt-long = <0x00000015>;
+				nvidia,emc-zcal-interval = <0x00064000>;
+
+				nvidia,emc-configuration =  <
+					0x00000001 0x00000004 0x00000000 0x00000002
+					0x00000005 0x00000006 0x00000008 0x00000003
+					0x0000000a 0x00000002 0x00000002 0x00000001
+					0x00000002 0x00000000 0x00000003 0x00000003
+					0x00000006 0x00000002 0x00000000 0x00000005
+					0x00000005 0x00010000 0x00000003 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000004
+					0x0000000c 0x0000000d 0x0000000f 0x0000004d
+					0x00000000 0x00000013 0x00000002 0x00000002
+					0x00000005 0x00000000 0x00000001 0x0000000c
+					0x00000005 0x00000005 0x00000003 0x00000003
+					0x00000003 0x00000006 0x00000006 0x00000003
+					0x00000003 0x0000008a 0x00000000 0x00000000
+					0x00000000 0x1363a296 0x005800a0 0x00008000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x000fc000 0x000fc000 0x00000000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x0000fc00 0x0000fc00
+					0x0000fc00 0x0000fc00 0x00000200 0x00000000
+					0x00100100 0x00000000 0x00000000 0x77ffc000
+					0x00000404 0x81f1f008 0x07070000 0x0000003f
+					0x015ddddd 0x51451400 0x00514514 0x00514514
+					0x51451400 0x0000003f 0x00000000 0x00000000
+					0x00000011 0x00150011 0x00000000 0x00000003
+					0x0000f3f3 0x8000019f 0x0000000a >;
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0xd3200000>;
+				nvidia,emc-cfg-2 = <0x000008c7>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80010083>;
+				nvidia,emc-mode-2 = <0x80020004>;
+				nvidia,emc-mode-4 = <0x800b0000>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-mrs-wait-cnt = <0x00290011>;
+				nvidia,emc-sel-dpd-ctrl = <0x0004013c>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b018>;
+				nvidia,emc-zcal-cnt-long = <0x00000015>;
+				nvidia,emc-zcal-interval = <0x00064000>;
+
+				nvidia,emc-configuration =  <
+					0x00000002 0x00000008 0x00000000 0x00000002
+					0x00000005 0x00000006 0x00000008 0x00000003
+					0x0000000a 0x00000002 0x00000002 0x00000001
+					0x00000002 0x00000000 0x00000003 0x00000003
+					0x00000006 0x00000002 0x00000000 0x00000005
+					0x00000005 0x00010000 0x00000003 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000004
+					0x0000000c 0x0000000d 0x0000000f 0x0000009a
+					0x00000000 0x00000026 0x00000002 0x00000002
+					0x00000005 0x00000000 0x00000001 0x0000000c
+					0x00000009 0x00000009 0x00000003 0x00000003
+					0x00000003 0x00000006 0x00000007 0x00000003
+					0x00000003 0x00000113 0x00000000 0x00000000
+					0x00000000 0x1363a296 0x005800a0 0x00008000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x000fc000 0x000fc000 0x00000000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x0000fc00 0x0000fc00
+					0x0000fc00 0x0000fc00 0x00000200 0x00000000
+					0x00100100 0x00000000 0x00000000 0x77ffc000
+					0x00000404 0x81f1f008 0x07070000 0x0000003f
+					0x015ddddd 0x51451400 0x00514514 0x00514514
+					0x51451400 0x0000003f 0x00000000 0x00000000
+					0x00000011 0x00290011 0x00000000 0x00000003
+					0x0000f3f3 0x8000023a 0x0000000a >;
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0xd3200000>;
+				nvidia,emc-cfg-2 = <0x000008c7>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80010083>;
+				nvidia,emc-mode-2 = <0x80020004>;
+				nvidia,emc-mode-4 = <0x800b0000>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-mrs-wait-cnt = <0x00440011>;
+				nvidia,emc-sel-dpd-ctrl = <0x0004013c>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b018>;
+				nvidia,emc-zcal-cnt-long = <0x00000015>;
+				nvidia,emc-zcal-interval = <0x00064000>;
+
+				nvidia,emc-configuration =  <
+					0x00000004 0x00000010 0x00000000 0x00000002
+					0x00000004 0x00000006 0x00000008 0x00000003
+					0x0000000a 0x00000002 0x00000002 0x00000001
+					0x00000002 0x00000000 0x00000003 0x00000003
+					0x00000006 0x00000002 0x00000000 0x00000005
+					0x00000005 0x00010000 0x00000003 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000004
+					0x0000000c 0x0000000d 0x0000000f 0x00000101
+					0x00000000 0x00000040 0x00000002 0x00000002
+					0x00000004 0x00000000 0x00000001 0x0000000c
+					0x0000000f 0x0000000f 0x00000003 0x00000003
+					0x00000003 0x00000006 0x00000005 0x00000003
+					0x00000003 0x000001c9 0x00000000 0x00000000
+					0x00000000 0x1363a296 0x005800a0 0x00008000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x000fc000 0x000fc000 0x00000000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x0000fc00 0x0000fc00
+					0x0000fc00 0x0000fc00 0x00000200 0x00000000
+					0x00100100 0x00000000 0x00000000 0x77ffc000
+					0x00000404 0x81f1f008 0x07070000 0x0000003f
+					0x015ddddd 0x51451400 0x00514514 0x00514514
+					0x51451400 0x0000003f 0x00000000 0x00000000
+					0x00000019 0x00440011 0x00000000 0x00000003
+					0x0000f3f3 0x80000309 0x0000000a >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0xd3200000>;
+				nvidia,emc-cfg-2 = <0x000008c7>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80010083>;
+				nvidia,emc-mode-2 = <0x80020004>;
+				nvidia,emc-mode-4 = <0x800b0000>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-mrs-wait-cnt = <0x00660011>;
+				nvidia,emc-sel-dpd-ctrl = <0x0004013c>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b018>;
+				nvidia,emc-zcal-cnt-long = <0x00000015>;
+				nvidia,emc-zcal-interval = <0x00064000>;
+
+				nvidia,emc-configuration =  <
+					0x00000006 0x00000015 0x00000000 0x00000004
+					0x00000004 0x00000006 0x00000008 0x00000003
+					0x0000000a 0x00000002 0x00000002 0x00000001
+					0x00000002 0x00000000 0x00000003 0x00000003
+					0x00000006 0x00000002 0x00000000 0x00000005
+					0x00000005 0x00010000 0x00000003 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000004
+					0x0000000c 0x0000000d 0x0000000f 0x00000182
+					0x00000000 0x00000060 0x00000002 0x00000002
+					0x00000004 0x00000000 0x00000001 0x0000000c
+					0x00000017 0x00000017 0x00000003 0x00000003
+					0x00000003 0x00000006 0x00000005 0x00000003
+					0x00000003 0x000002ae 0x00000000 0x00000000
+					0x00000000 0x1363a296 0x005800a0 0x00008000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00090000 0x00090000 0x00090000 0x00090000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x000fc000 0x000fc000 0x00000000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x0000fc00 0x0000fc00
+					0x0000fc00 0x0000fc00 0x00000200 0x00000000
+					0x00100100 0x00000000 0x00000000 0x77ffc000
+					0x00000404 0x81f1f008 0x07070000 0x0000003f
+					0x015ddddd 0x51451400 0x00514514 0x00514514
+					0x51451400 0x0000003f 0x00000000 0x00000000
+					0x00000025 0x00660011 0x00000000 0x00000003
+					0x0000f3f3 0x8000040b 0x0000000a >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0xd3200000>;
+				nvidia,emc-cfg-2 = <0x000008cf>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80010083>;
+				nvidia,emc-mode-2 = <0x80020004>;
+				nvidia,emc-mode-4 = <0x800b0000>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-mrs-wait-cnt = <0x00cc0011>;
+				nvidia,emc-sel-dpd-ctrl = <0x0004013c>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b018>;
+				nvidia,emc-zcal-cnt-long = <0x00000017>;
+				nvidia,emc-zcal-interval = <0x00064000>;
+
+				nvidia,emc-configuration =  <
+					0x0000000c 0x0000002a 0x00000000 0x00000008
+					0x00000005 0x00000007 0x00000008 0x00000003
+					0x0000000a 0x00000003 0x00000003 0x00000002
+					0x00000003 0x00000000 0x00000002 0x00000002
+					0x00000005 0x00000003 0x00000000 0x00000003
+					0x00000007 0x00010000 0x00000004 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000002
+					0x0000000e 0x0000000f 0x00000011 0x00000304
+					0x00000000 0x000000c1 0x00000002 0x00000002
+					0x00000005 0x00000000 0x00000001 0x0000000c
+					0x0000002d 0x0000002d 0x00000003 0x00000004
+					0x00000003 0x00000009 0x00000006 0x00000003
+					0x00000003 0x0000055b 0x00000000 0x00000000
+					0x00000000 0x1363a296 0x005800a0 0x00008000
+					0x00080000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00080000 0x00080000 0x00080000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00098000 0x00098000 0x00000000 0x00098000
+					0x00098000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x0008c000 0x00088000
+					0x00088000 0x00088000 0x00008800 0x00008800
+					0x00008800 0x00008800 0x00000200 0x00000000
+					0x00100100 0x00000000 0x00000000 0x77ffc000
+					0x00000404 0x81f1f008 0x07070000 0x0000003f
+					0x015ddddd 0x51451400 0x00514514 0x00514514
+					0x51451400 0x0000003f 0x00000000 0x00000000
+					0x0000004a 0x00cc0011 0x00000000 0x00000004
+					0x0000d3b3 0x80000713 0x0000000a >;
+			};
+
+			timing-300000000 {
+				clock-frequency = <300000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0xd3300000>;
+				nvidia,emc-cfg-2 = <0x000008d7>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80010083>;
+				nvidia,emc-mode-2 = <0x80020004>;
+				nvidia,emc-mode-4 = <0x800b0000>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-mrs-wait-cnt = <0x012c0011>;
+				nvidia,emc-sel-dpd-ctrl = <0x0004013c>;
+				nvidia,emc-xm2dqspadctrl2 = <0x01231239>;
+				nvidia,emc-zcal-cnt-long = <0x0000001f>;
+				nvidia,emc-zcal-interval = <0x00064000>;
+
+				nvidia,emc-configuration =  <
+					0x00000011 0x0000003e 0x00000000 0x0000000c
+					0x00000005 0x00000007 0x00000008 0x00000003
+					0x0000000a 0x00000005 0x00000005 0x00000002
+					0x00000003 0x00000000 0x00000002 0x00000002
+					0x00000006 0x00000003 0x00000000 0x00000003
+					0x00000008 0x00030000 0x00000004 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000002
+					0x0000000f 0x00000012 0x00000014 0x0000046e
+					0x00000000 0x0000011b 0x00000002 0x00000002
+					0x00000005 0x00000000 0x00000001 0x0000000c
+					0x00000042 0x00000042 0x00000003 0x00000005
+					0x00000003 0x0000000d 0x00000007 0x00000003
+					0x00000003 0x000007e0 0x00000000 0x00000000
+					0x00000000 0x1363a096 0x005800a0 0x00008000
+					0x00020000 0x00020000 0x00020000 0x00020000
+					0x00020000 0x00020000 0x00020000 0x00020000
+					0x00020000 0x00020000 0x00020000 0x00020000
+					0x00020000 0x00020000 0x00020000 0x00020000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00060000 0x00060000 0x00000000 0x00060000
+					0x00060000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00048000 0x00048000
+					0x00048000 0x00048000 0x00004800 0x00004800
+					0x00004800 0x00004800 0x00000200 0x00000000
+					0x00100100 0x00000000 0x00000000 0x77ffc000
+					0x00000404 0x81f1f008 0x07070000 0x0000003f
+					0x015ddddd 0x51451420 0x00514514 0x00514514
+					0x51451400 0x0000003f 0x00000000 0x00000000
+					0x0000006c 0x012c0011 0x00000000 0x00000004
+					0x000052a3 0x800009ed 0x0000000b >;
+			};
+
+			timing-396000000 {
+				clock-frequency = <396000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0xd3300000>;
+				nvidia,emc-cfg-2 = <0x00000897>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80010083>;
+				nvidia,emc-mode-2 = <0x80020004>;
+				nvidia,emc-mode-4 = <0x800b0000>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-mrs-wait-cnt = <0x018c0011>;
+				nvidia,emc-sel-dpd-ctrl = <0x0004001c>;
+				nvidia,emc-xm2dqspadctrl2 = <0x01231239>;
+				nvidia,emc-zcal-cnt-long = <0x00000028>;
+				nvidia,emc-zcal-interval = <0x00064000>;
+
+				nvidia,emc-configuration =  <
+					0x00000017 0x00000053 0x00000000 0x00000010
+					0x00000007 0x00000008 0x00000008 0x00000003
+					0x0000000a 0x00000007 0x00000007 0x00000003
+					0x00000003 0x00000000 0x00000002 0x00000002
+					0x00000006 0x00000003 0x00000000 0x00000002
+					0x00000009 0x00030000 0x00000004 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000001
+					0x00000010 0x00000012 0x00000014 0x000005d9
+					0x00000000 0x00000176 0x00000002 0x00000002
+					0x00000007 0x00000000 0x00000001 0x0000000e
+					0x00000058 0x00000058 0x00000003 0x00000006
+					0x00000003 0x00000012 0x00000009 0x00000003
+					0x00000003 0x00000a66 0x00000000 0x00000000
+					0x00000000 0x1363a096 0x005800a0 0x00008000
+					0x00020000 0x00020000 0x00020000 0x00020000
+					0x00020000 0x00020000 0x00020000 0x00020000
+					0x00020000 0x00020000 0x00020000 0x00020000
+					0x00020000 0x00020000 0x00020000 0x00020000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00048000 0x00048000 0x00000000 0x00048000
+					0x00048000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00038000 0x00038000
+					0x00038000 0x00038000 0x00003800 0x00003800
+					0x00003800 0x00003800 0x00000200 0x00000000
+					0x00100100 0x00000000 0x00000000 0x77ffc000
+					0x00000404 0x81f1f008 0x07070000 0x0000003f
+					0x015ddddd 0x51451420 0x00514514 0x00514514
+					0x51451400 0x0000003f 0x00000000 0x00000000
+					0x0000008f 0x018c0011 0x00000000 0x00000004
+					0x000052a3 0x80000cc7 0x0000000b >;
+			};
+
+			timing-528000000 {
+				clock-frequency = <528000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0xd3300000>;
+				nvidia,emc-cfg-2 = <0x0000089f>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x800100c3>;
+				nvidia,emc-mode-2 = <0x80020006>;
+				nvidia,emc-mode-4 = <0x800b0000>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-mrs-wait-cnt = <0x02100013>;
+				nvidia,emc-sel-dpd-ctrl = <0x0004001c>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0123123d>;
+				nvidia,emc-zcal-cnt-long = <0x00000034>;
+				nvidia,emc-zcal-interval = <0x00064000>;
+
+				nvidia,emc-configuration =  <
+					0x0000001f 0x0000006e 0x00000000 0x00000016
+					0x00000009 0x00000009 0x00000009 0x00000003
+					0x0000000d 0x00000009 0x00000009 0x00000005
+					0x00000004 0x00000000 0x00000002 0x00000002
+					0x00000008 0x00000003 0x00000000 0x00000003
+					0x0000000a 0x00050000 0x00000004 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000002
+					0x00000011 0x00000015 0x00000017 0x000007cd
+					0x00000000 0x000001f3 0x00000003 0x00000003
+					0x00000009 0x00000000 0x00000001 0x00000011
+					0x00000075 0x00000075 0x00000004 0x00000008
+					0x00000004 0x00000019 0x0000000c 0x00000003
+					0x00000003 0x00000ddd 0x00000000 0x00000000
+					0x00000000 0x1363a096 0xe01200b9 0x00008000
+					0x0000000a 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x0000000a
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00004010 0x00004010 0x00000000 0x00004010
+					0x00004010 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x0000000c 0x0000000c
+					0x0000000c 0x0000000c 0x0000000c 0x0000000c
+					0x0000000c 0x0000000c 0x00000220 0x00000000
+					0x00100100 0x00000000 0x00000000 0x77ffc004
+					0x00000404 0x81f1f008 0x07070000 0x0000003f
+					0x015ddddd 0x51451420 0x00514514 0x00514514
+					0x51451400 0x0000003f 0x00000000 0x00000000
+					0x000000bf 0x02100013 0x00000000 0x00000004
+					0x000042a0 0x800010b3 0x0000000d >;
+			};
+
+			timing-600000000 {
+				clock-frequency = <600000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0xd3300000>;
+				nvidia,emc-cfg-2 = <0x0000089f>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x800100e3>;
+				nvidia,emc-mode-2 = <0x80020007>;
+				nvidia,emc-mode-4 = <0x800b0000>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-mrs-wait-cnt = <0x02580014>;
+				nvidia,emc-sel-dpd-ctrl = <0x0004001c>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0121103d>;
+				nvidia,emc-zcal-cnt-long = <0x0000003a>;
+				nvidia,emc-zcal-interval = <0x00064000>;
+
+				nvidia,emc-configuration =  <
+					0x00000023 0x0000007d 0x00000000 0x00000019
+					0x0000000a 0x0000000a 0x0000000b 0x00000004
+					0x0000000f 0x0000000a 0x0000000a 0x00000005
+					0x00000004 0x00000000 0x00000004 0x00000004
+					0x0000000a 0x00000004 0x00000000 0x00000003
+					0x0000000d 0x00070000 0x00000005 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000002
+					0x00000014 0x00000018 0x0000001a 0x000008e4
+					0x00000000 0x00000239 0x00000004 0x00000004
+					0x0000000a 0x00000000 0x00000001 0x00000013
+					0x00000084 0x00000084 0x00000005 0x00000009
+					0x00000005 0x0000001c 0x0000000d 0x00000003
+					0x00000003 0x00000fc0 0x00000000 0x00000000
+					0x00000000 0x1363a096 0xe00e00b9 0x00008000
+					0x0000000a 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x0000000a
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000010 0x00000010 0x00000000 0x00000010
+					0x00000010 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000001
+					0x00000000 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000000 0x00000000 0x00000001
+					0x00000000 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000000 0x0000000c 0x0000000b
+					0x0000000b 0x0000000b 0x0000000b 0x0000000b
+					0x0000000b 0x0000000b 0x00000220 0x00000000
+					0x00100100 0x00000000 0x00000000 0x77ffc004
+					0x00000404 0x81f1f008 0x07070000 0x0000003f
+					0x015ddddd 0x51451420 0x00514514 0x00514514
+					0x51451400 0x0000003f 0x00000000 0x00000000
+					0x000000d8 0x02580014 0x00000000 0x00000005
+					0x000040a0 0x800012d6 0x00000010 >;
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0xd3300000>;
+				nvidia,emc-cfg-2 = <0x0000089f>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80010043>;
+				nvidia,emc-mode-2 = <0x8002001a>;
+				nvidia,emc-mode-4 = <0x800b0000>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-mrs-wait-cnt = <0x03180017>;
+				nvidia,emc-sel-dpd-ctrl = <0x0004001c>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0120103d>;
+				nvidia,emc-zcal-cnt-long = <0x0000004c>;
+				nvidia,emc-zcal-interval = <0x00064000>;
+
+				nvidia,emc-configuration =  <
+					0x0000002f 0x000000a6 0x00000000 0x00000021
+					0x0000000e 0x0000000d 0x0000000d 0x00000005
+					0x00000013 0x0000000e 0x0000000e 0x00000007
+					0x00000004 0x00000000 0x00000005 0x00000005
+					0x0000000e 0x00000004 0x00000000 0x00000005
+					0x0000000f 0x000b0000 0x00000006 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000004
+					0x00000016 0x0000001d 0x0000001f 0x00000bd1
+					0x00000000 0x000002f4 0x00000005 0x00000005
+					0x0000000e 0x00000000 0x00000001 0x00000017
+					0x000000af 0x000000af 0x00000006 0x0000000c
+					0x00000006 0x00000026 0x00000011 0x00000003
+					0x00000003 0x000014cb 0x00000000 0x00000000
+					0x00000000 0x1363a096 0xe00700b9 0x00008000
+					0x00000006 0x00000006 0x00000006 0x00000006
+					0x00000006 0x00000006 0x00000006 0x00000006
+					0x00000006 0x00000006 0x00000006 0x00000006
+					0x00000006 0x00000006 0x00000006 0x00000006
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00008012 0x00008012 0x00000000 0x00008012
+					0x00008012 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000002 0x00000005
+					0x00000002 0x00000004 0x00000005 0x00000004
+					0x00000004 0x00000003 0x00000002 0x00000005
+					0x00000002 0x00000004 0x00000005 0x00000004
+					0x00000004 0x00000003 0x0000000b 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x0000000a 0x00000220 0x00000000
+					0x00100100 0x00000000 0x00000000 0x77ffc004
+					0x00000808 0x81f1f008 0x07070000 0x00000000
+					0x015ddddd 0x61861820 0x00514514 0x00514514
+					0x61861800 0x0000003f 0x00000000 0x00000000
+					0x0000011e 0x03180017 0x00000000 0x00000006
+					0x00004080 0x8000188b 0x00000014 >;
+			};
+
+			timing-924000000 {
+				clock-frequency = <924000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0xd3300000>;
+				nvidia,emc-cfg-2 = <0x0000089f>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80010083>;
+				nvidia,emc-mode-2 = <0x8002001c>;
+				nvidia,emc-mode-4 = <0x800b0000>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-mrs-wait-cnt = <0x039c0019>;
+				nvidia,emc-sel-dpd-ctrl = <0x0004001c>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0120103d>;
+				nvidia,emc-zcal-cnt-long = <0x00000058>;
+				nvidia,emc-zcal-interval = <0x00064000>;
+
+				nvidia,emc-configuration =  <
+					0x00000037 0x000000c2 0x00000000 0x00000026
+					0x00000010 0x0000000f 0x00000010 0x00000006
+					0x00000017 0x00000010 0x00000010 0x00000009
+					0x00000005 0x00000000 0x00000007 0x00000007
+					0x00000010 0x00000005 0x00000000 0x00000005
+					0x00000012 0x000d0000 0x00000007 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000004
+					0x00000019 0x00000020 0x00000022 0x00000dd4
+					0x00000000 0x00000375 0x00000006 0x00000006
+					0x00000010 0x00000000 0x00000001 0x0000001b
+					0x000000cc 0x000000cc 0x00000007 0x0000000e
+					0x00000007 0x0000002d 0x00000014 0x00000003
+					0x00000003 0x00001842 0x00000000 0x00000000
+					0x00000000 0x1363a896 0xe00400b9 0x00008000
+					0x00000004 0x00000004 0x00000004 0x00000004
+					0x00000004 0x00000004 0x00000004 0x00000004
+					0x00000004 0x00000004 0x00000004 0x00000004
+					0x00000004 0x00000004 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x0000000f 0x0000000f 0x00000000 0x00000011
+					0x00000012 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000004 0x00000006
+					0x00000004 0x00000006 0x00000006 0x00000006
+					0x00000006 0x00000005 0x00000004 0x00000006
+					0x00000004 0x00000006 0x00000006 0x00000006
+					0x00000006 0x00000005 0x0000000a 0x00000009
+					0x00000009 0x0000000a 0x00000009 0x00000009
+					0x00000009 0x00000009 0x00000220 0x00000000
+					0x00100100 0x00000000 0x00000000 0x77ffc004
+					0x00000404 0x81f1f008 0x07070000 0x00000000
+					0x015ddddd 0x51451420 0x00514514 0x00514514
+					0x51451400 0x0000003f 0x00000000 0x00000000
+					0x0000014d 0x039c0019 0x00000000 0x00000007
+					0x00004080 0x80001c77 0x00000017 >;
+			};
+		};
+	};
+
+	usb@70090000 {
+		status = "disabled";
+	};
+
+	padctl@7009f000 {
+		status = "disabled";
+	};
+
+	/* WiFi */
+	sdmmc1: mmc@700b0000 {
+		status = "okay";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		assigned-clocks = <&tegra_car TEGRA124_CLK_SDMMC1>;
+		assigned-clock-parents = <&tegra_car TEGRA124_CLK_PLL_P>;
+		assigned-clock-rates = <204000000>;
+
+		max-frequency = <82000000>;
+		keep-power-in-suspend;
+		bus-width = <4>;
+		non-removable;
+
+		sd-uhs-ddr50;
+		mmc-ddr-1_8v;
+
+		mmc-pwrseq = <&brcm_wifi_pwrseq>;
+		vmmc-supply = <&vdd_3v3_sys>;
+		vqmmc-supply = <&vdd_1v8_vio>;
+
+		/* BCM4354XKUBG */
+		wifi@1 {
+			compatible = "brcm,bcm4354-fmac", "brcm,bcm4329-fmac";
+			reg = <1>;
+
+			clocks = <&clk32k_pmic>;
+			clock-names = "lpo";
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(U, 5) IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "host-wake";
+		};
+	};
+
+	/* MicroSD */
+	sdmmc3: mmc@700b0400 {
+		status = "okay";
+		bus-width = <4>;
+
+		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
+		power-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
+
+		vmmc-supply = <&vdd_hv_sdmmc>;
+		vqmmc-supply = <&vddio_usd>;
+	};
+
+	/* eMMC */
+	sdmmc4: mmc@700b0600 {
+		status = "okay";
+		bus-width = <8>;
+		non-removable;
+
+		vmmc-supply = <&vdd_hv_sdmmc>;
+		vqmmc-supply = <&vdd_1v8_vio>;
+	};
+
+	/* CPU DFLL clock */
+	clock@70110000 {
+		status = "okay";
+		vdd-cpu-supply = <&vdd_cpu>;
+		nvidia,i2c-fs-rate = <400000>;
+	};
+
+	ahub@70300000 {
+		/* HIFI CODEC */
+		i2s@70301000 {		/* i2s0 */
+			status = "okay";
+		};
+
+		/* LEFT SPK */
+		i2s@70301100 {		/* i2s1 */
+			status = "okay";
+		};
+
+		/* RIGHT SPK */
+		i2s@70301200 {		/* i2s2 */
+			status = "okay";
+		};
+
+		/* BT SCO */
+		i2s@70301300 {		/* i2s3 */
+			status = "okay";
+		};
+	};
+
+	usb1: usb@7d000000 {
+		compatible = "nvidia,tegra124-udc";
+		status = "okay";
+		dr_mode = "otg";
+		extcon = <&palmas_extcon>, <&palmas_extcon>; /* vbus is bq24192?, id */
+		vbus-supply = <&usb_otg_vbus>;
+	};
+
+	usb-phy@7d000000 {
+		status = "okay";
+		dr_mode = "otg";
+		nvidia,xcvr-setup = <8>;
+		nvidia,xcvr-lsfslew = <2>;
+		nvidia,xcvr-lsrslew = <2>;
+		vbus-supply = <&avdd_usb>;
+	};
+
+	battery: battery-cell {
+		compatible = "simple-battery";
+		device-chemistry = "lithium-ion-polymer";
+
+		charge-full-design-microamp-hours = <6520000>;
+		energy-full-design-microwatt-hours = <2478000>;
+
+		voltage-min-design-microvolt = <4300000>;
+		voltage-max-design-microvolt = <4350000>;
+
+		precharge-current-microamp = <256000>;
+		charge-term-current-microamp = <400000>;
+
+		operating-range-celsius = <0 45>;
+	};
+
+	clk32k_in: clock-32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "ref-oscillator";
+	};
+
+	cpus {
+		cpu0: cpu@0 {
+			vdd-cpu-supply = <&vdd_cpu>;
+			#cooling-cells = <2>;
+		};
+
+		cpu1: cpu@1 {
+			#cooling-cells = <2>;
+		};
+
+		cpu2: cpu@2 {
+			#cooling-cells = <2>;
+		};
+
+		cpu3: cpu@3 {
+			#cooling-cells = <2>;
+		};
+	};
+
+	extcon-keys {
+		compatible = "gpio-keys";
+
+		switch-back-hall-sensor {
+			label = "Hall sensor (back)";
+			gpios = <&gpio TEGRA_GPIO(W, 3) GPIO_ACTIVE_LOW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+			wakeup-source;
+		};
+
+		switch-front-hall-sensor {
+			label = "Hall sensor (front)";
+			gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-power {
+			label = "Power";
+			gpios = <&gpio TEGRA_GPIO(Q, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			debounce-interval = <10>;
+			wakeup-source;
+		};
+
+		key-volume-down {
+			label = "Volume Down";
+			gpios = <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <10>;
+		};
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&gpio TEGRA_GPIO(Q, 6) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <10>;
+		};
+	};
+
+	led-controller {
+		compatible = "pwm-leds";
+
+		led-button {
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_BACKLIGHT;
+
+			pwms = <&pwm 1 10000>;
+			max-brightness = <100>;
+		};
+	};
+
+	brcm_wifi_pwrseq: pwrseq-wifi {
+		compatible = "mmc-pwrseq-simple";
+
+		reset-gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
+
+		post-power-on-delay-ms = <300>;
+		power-off-delay-us = <300>;
+	};
+
+	vdd_3v3_sys: regulator-3v3-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3_sys";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vddio_1v8_bl: regulator-bl-io {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio_1v8_bl";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(BB, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_1v8_vio>;
+	};
+
+	vdd_lcd_io: regulator-lcd-vio {
+		compatible = "regulator-fixed";
+		regulator-name = "dvdd_lcd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		gpio = <&palmas_gpio 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_1v8_vio>;
+	};
+
+	vsp_5v5_lcd: regulator-vsp {
+		compatible = "regulator-fixed";
+		regulator-name = "avdd_lcd_vsp";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(I, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
+
+	vsn_5v5_lcd: regulator-vsn {
+		compatible = "regulator-fixed";
+		regulator-name = "avdd_lcd_vsn";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(S, 2) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
+
+	vdd_2v8_tp: regulator-vtp {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_2v8_tp";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_smps10_out2>;
+	};
+
+	thermistor: thermal-sensor-thermistor {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+
+		io-channels = <&palmas_gpadc 1>;
+		io-channel-names = "sensor-channel";
+
+		temperature-lookup-table = <
+			(-40000) 2578  (-30000) 2567  (-20000) 2545  (-10000) 2507
+			       0 2445     10000 2346     20000 2203     30000 2009
+			   40000 1769     50000 1500     60000 1226     70000  970
+			   80000  748     90000  568    100000  427    110000  320
+			  120000  240    125000  208 >;
+	};
+
+	thermal-zones {
+		tboard-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <15000>; /* milliseconds */
+
+			thermal-sensors = <&thermistor>;
+
+			trips {
+				thermistor_alert_trip: alert {
+					temperature = <40000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				map-tboard {
+					trip = <&thermistor_alert_trip>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		/*
+		 * TMP451 has two sensors:
+		 *
+		 *	0: internal that monitors ambient/skin temperature
+		 *	1: external that is connected to the CPU's diode
+		 *
+		 * Ideally we should use userspace thermal governor,
+		 * but it's a much more complex solution.  The "skin"
+		 * zone exists as a simpler solution which prevents
+		 * tablet from getting too hot from a user's tactile
+		 * perspective. The CPU zone is intended to protect
+		 * silicon from damage.
+		 */
+
+		t451-skin-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <10000>; /* milliseconds */
+
+			thermal-sensors = <&temp_sensor 0>;
+
+			trips {
+				skip_alert_trip: skin-alert {
+					/* throttle at 50C until temperature drops to 49.5C */
+					temperature = <50000>;
+					hysteresis = <500>;
+					type = "passive";
+				};
+
+				skin-crit {
+					/* shut down at 85C */
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map-skip {
+					trip = <&skip_alert_trip>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		t451-cpu-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <10000>; /* milliseconds */
+
+			thermal-sensors = <&temp_sensor 1>;
+
+			trips {
+				cpu_alert_trip: cpu-alert {
+					/* throttle at 85C until temperature drops to 84.5C */
+					temperature = <85000>;
+					hysteresis = <500>;
+					type = "passive";
+				};
+
+				cpu-crit {
+					/* shut down at 95C */
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map-cpu {
+					trip = <&cpu_alert_trip>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+};
-- 
2.48.1



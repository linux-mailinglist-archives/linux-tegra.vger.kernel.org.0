Return-Path: <linux-tegra+bounces-7401-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B841EADA99E
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Jun 2025 09:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C8061894B3C
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Jun 2025 07:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465BA20C476;
	Mon, 16 Jun 2025 07:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3n6Dq3E"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BAE1F8724;
	Mon, 16 Jun 2025 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059626; cv=none; b=mmEFNMmwRg4E9pbGpNAwea1pCAAyJTRPPS43cdVTtg7TOQppsXjJggZk0dVZhhMr2w0T2BGHE823RLbJ45XIhxQjqJuYtEDbiaKBKGCLUsO3qH4lteHMSnDMaDhtiCfOysPF7zllQ8Qs/RMpQCSeZvUVvDIEjUMwF3bSy2K3jGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059626; c=relaxed/simple;
	bh=bIuaJ4IqG0OZgNiNIKpL84TStba9k2I5kDc+CHQFDnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V6iFVeUiaOyKX4PV1XGcPfGaFaebjLfVDoUOXgkrvg0nqGAV5Prp6MNwQNzKst3zsr0ktA96GrzazPjTAt/kRgWfkAHO3DH4iDFRztzLDOQo9j9ZeiWaC2FrLPTC0qSwX5LUUol1A94br6YhXaYnXsrlg2lne2QrBUvscIKKs1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3n6Dq3E; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5535e35b059so5241434e87.1;
        Mon, 16 Jun 2025 00:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750059620; x=1750664420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/coAAJGS2f6ArBUxzndxc4e3U7Pi4Pzzl6MLDxk/Pc=;
        b=M3n6Dq3EjHqIgPs8OeIv6nHzi8/Rm+DZEoUnjG4RlquI/GB+hoX8EcQxB4xhoFBroG
         TzoEL60IzTZLTDNkJH2B/L6fFTctQmZwEgZyLxztogWXaUKn557KkCItVssw86CluTY9
         ysLksFbkaO/F03icHcBLlgztopRouTgpRDe3l7gZGyN9qZlv+Ydr9qvoDHBsmbt8a40K
         NfNnm1eCz2BSDSVLIH5FuFEnkBZYH5c85ZvWtEJMDAra1w3VlNwmudk3B9kNpFz6Qlqd
         bhVUgpOUvMzvkApfNLjpCaR+TpA8mWhp24fDMoOtBkc7kRV5M+Kr5rBJgFuNyxp38/Qc
         19eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059620; x=1750664420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/coAAJGS2f6ArBUxzndxc4e3U7Pi4Pzzl6MLDxk/Pc=;
        b=V4VKlVMOCwOGtyKtIyhPhxqu93GOKuwdr6YIjHbpokT8c1XaRUNc26Ep5JoP4u1EIy
         6oJTbzianlA5htlb/Hnszxv3DGtgzUzJLHvG3bwtOZ5tFe//Pm3tylQoHulIJYyRHLnF
         0PCAfMkPATNTNNXNHcAxzqkanuUJrO5a1du/Sbp4syBOVSIFpf1OGjOpDtbZUxZ+Vrdb
         WhxnQIuejeU2S7YrkgYakjAxyUEsfYp6o9WYHJUYPl+aFgmYvwf32Dm+d4i7o11Nv65/
         p06vTIHocw6q6YuB+sVyVbv97wTn+AgOisz8swIOrfLYdBuGoBCGvAlXAns8yd77VvH1
         O/XA==
X-Forwarded-Encrypted: i=1; AJvYcCUHJLLIMHmdyYEOPuRvYX3T+TD497Jd8bwXG5TCh1njdR8ixdR5ZaEgIPZOWqXSwqQnM8gRPrK1RxkwzeI=@vger.kernel.org, AJvYcCVynJdARm9MqoWnkrwzqbqgpUzPmmzcCSdXBLYspK7fxJWn+4Ce/jFjZMIEADLsopEcfhRPGG9GiyzpgtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfbcUxsBSnwV4/Nv1RPpyCZ3ZYqJ8zmJW9nq9ULki+N0k/PNDe
	8CgufEZMusdp3AZ7BseeOKrb+aFROxSqwTxw5tdkUsJIx4mOIZJOtXYM8kpXDw==
X-Gm-Gg: ASbGncutYyxj2DlvDLb+zQD1aRjbkKTrA/CYapYUUK5Af3pOnO78nAnovo5wBX8ze5L
	T+M4rsVIWdq/QvLRDGv4Hw+IciDLXbgo0OTPqPtgPjyw0GJ1vfmElczwWgUEbtJJ4EygR/eFkqs
	/iwwtSA/Auwqud1mUQhc6jM1O2b78SkZYRd8nqSByNtCvaaHEfDxW546pB1gTKQyeOCDjmvFX9z
	094ymgEoXU59XWD+c3ny7HfA4s2J1SG1tj5d3lP6BeSxIxQjYRJFvCohmC8FL0rYHuNzNgKExG1
	THL106P8kGM60CCVvGGKR8Fbrgg8jY2t3xBBbc7x2f0YSsJCjo5NTg==
X-Google-Smtp-Source: AGHT+IGS50S6fr7k7DfZV38Kk1WIdM4ceCH5AnDI4KURU+863+xB1A/N4P+5px4sgRcx9fKGmH3pow==
X-Received: by 2002:a05:6512:15a0:b0:553:23fe:fbeb with SMTP id 2adb3069b0e04-553b67fffc7mr1857579e87.3.1750059619665;
        Mon, 16 Jun 2025 00:40:19 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1ab08fsm1452721e87.89.2025.06.16.00.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:40:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ARM: tegra: Add device-tree for Asus Portable AiO P1801-T
Date: Mon, 16 Jun 2025 10:39:47 +0300
Message-ID: <20250616073947.13675-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250616073947.13675-1-clamor95@gmail.com>
References: <20250616073947.13675-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device-tree for the Asus Portable AiO P1801-T, which is a NVIDIA
Tegra30-based 2-in-1 detachable tablet, originally running Android.

The tablet was also sold together with a PC docking station as the
Transformer AiO P1801.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # P1801-T with dock
Co-developed-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/Makefile             |    1 +
 .../boot/dts/nvidia/tegra30-asus-p1801-t.dts  | 2087 +++++++++++++++++
 2 files changed, 2088 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dts

diff --git a/arch/arm/boot/dts/nvidia/Makefile b/arch/arm/boot/dts/nvidia/Makefile
index ff2c5bfd8efa..1890d9075a87 100644
--- a/arch/arm/boot/dts/nvidia/Makefile
+++ b/arch/arm/boot/dts/nvidia/Makefile
@@ -31,6 +31,7 @@ dtb-$(CONFIG_ARCH_TEGRA_3x_SOC) += \
 	tegra30-asus-nexus7-grouper-PM269.dtb \
 	tegra30-asus-nexus7-grouper-E1565.dtb \
 	tegra30-asus-nexus7-tilapia-E1565.dtb \
+	tegra30-asus-p1801-t.dtb \
 	tegra30-asus-tf201.dtb \
 	tegra30-asus-tf300t.dtb \
 	tegra30-asus-tf300tg.dtb \
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dts b/arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dts
new file mode 100644
index 000000000000..9241cc269a89
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dts
@@ -0,0 +1,2087 @@
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
+	model = "Asus Portable AiO P1801-T";
+	compatible = "asus,p1801-t", "nvidia,tegra30";
+	chassis-type = "convertible";
+
+	aliases {
+		mmc0 = &sdmmc4; /* eMMC */
+		mmc1 = &sdmmc1; /* uSD slot */
+		mmc2 = &sdmmc3; /* WiFi */
+
+		rtc0 = &pmic;
+		rtc1 = "/rtc@7000e000";
+
+		display0 = &hdmi;
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
+	firmware {
+		trusted-foundations {
+			compatible = "tlm,trusted-foundations";
+			tlm,version-major = <2>;
+			tlm,version-minor = <8>;
+		};
+	};
+
+	memory@80000000 {
+		reg = <0x80000000 0x80000000>;
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
+		framebuffer@abe01000 {
+			reg = <0xabe01000 (1920 * 1080 * 4)>;
+			no-map;
+		};
+
+		trustzone@bfe00000 {
+			reg = <0xbfe00000 0x200000>;	/* 2MB */
+			no-map;
+		};
+
+		ramoops@fea00000 {
+			compatible = "ramoops";
+			reg = <0xfea00000 0x10000>;	/* 64kB */
+			console-size = <0x8000>;	/* 32kB */
+			record-size = <0x400>;		/*  1kB */
+			ecc-size = <16>;
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
+			port {
+				hdmi_out: endpoint {
+					remote-endpoint = <&bridge_in>;
+				};
+			};
+		};
+	};
+
+	gpio@6000d000 {
+		init-lpm-in-hog {
+			gpio-hog;
+			gpios = <TEGRA_GPIO(B, 1) GPIO_ACTIVE_HIGH>;
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
+		tp-vendor-hog {
+			gpio-hog;
+			gpios = <TEGRA_GPIO(R, 6) GPIO_ACTIVE_HIGH>;
+			input;
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
+			sdmmc1-clk {
+				nvidia,pins = "sdmmc1_clk_pz0";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc1-cmd {
+				nvidia,pins = "sdmmc1_dat3_py4",
+					      "sdmmc1_dat2_py5",
+					      "sdmmc1_dat1_py6",
+					      "sdmmc1_dat0_py7",
+					      "sdmmc1_cmd_pz1";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc1-cd {
+				nvidia,pins = "gmi_iordy_pi5";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc1-wp {
+				nvidia,pins = "vi_d11_pt3";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* SDMMC2 pinmux */
+			vi-d1-pd5 {
+				nvidia,pins = "vi_d1_pd5",
+					      "vi_d2_pl0",
+					      "vi_d3_pl1",
+					      "vi_d5_pl3",
+					      "vi_d7_pl5";
+				nvidia,function = "sdmmc2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			vi-d8-pl6 {
+				nvidia,pins = "vi_d8_pl6",
+					      "vi_d9_pl7";
+				nvidia,function = "sdmmc2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+				nvidia,io-reset = <0>;
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
+			sdmmc3-cmd {
+				nvidia,pins = "sdmmc3_cmd_pa7",
+					      "sdmmc3_dat0_pb7",
+					      "sdmmc3_dat1_pb6",
+					      "sdmmc3_dat2_pb5",
+					      "sdmmc3_dat3_pb4",
+					      "sdmmc3_dat4_pd1",
+					      "sdmmc3_dat5_pd0",
+					      "sdmmc3_dat6_pd3",
+					      "sdmmc3_dat7_pd4";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
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
+			sdmmc4-rst-n {
+				nvidia,pins = "sdmmc4_rst_n_pcc3";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			cam-mclk {
+				nvidia,pins = "cam_mclk_pcc0";
+				nvidia,function = "vi_alt3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			drive-sdmmc4 {
+				nvidia,pins = "drive_gma",
+					      "drive_gmb",
+					      "drive_gmc",
+					      "drive_gmd";
+				nvidia,pull-down-strength = <9>;
+				nvidia,pull-up-strength = <9>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
+			};
+
+			/* I2C pinmux */
+			gen1-i2c {
+				nvidia,pins = "gen1_i2c_scl_pc4",
+					      "gen1_i2c_sda_pc5";
+				nvidia,function = "i2c1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+			};
+			gen2-i2c {
+				nvidia,pins = "gen2_i2c_scl_pt5",
+					      "gen2_i2c_sda_pt6";
+				nvidia,function = "i2c2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+			};
+			cam-i2c {
+				nvidia,pins = "cam_i2c_scl_pbb1",
+					      "cam_i2c_sda_pbb2";
+				nvidia,function = "i2c3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+			};
+			ddc-i2c {
+				nvidia,pins = "ddc_scl_pv4",
+					      "ddc_sda_pv5";
+				nvidia,function = "i2c4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+			};
+			pwr-i2c {
+				nvidia,pins = "pwr_i2c_scl_pz6",
+					      "pwr_i2c_sda_pz7";
+				nvidia,function = "i2cpwr";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+			};
+			hotplug-i2c {
+				nvidia,pins = "pu4";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* HDMI pinmux */
+			hdmi-cec {
+				nvidia,pins = "hdmi_cec_pee3";
+				nvidia,function = "cec";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+			};
+			hdmi-hpd {
+				nvidia,pins = "hdmi_int_pn7";
+				nvidia,function = "hdmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* UART-A */
+			ulpi-data0-po1 {
+				nvidia,pins = "ulpi_data0_po1";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ulpi-data1-po2 {
+				nvidia,pins = "ulpi_data1_po2";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			ulpi-data5-po6 {
+				nvidia,pins = "ulpi_data5_po6";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			ulpi-data7-po0 {
+				nvidia,pins = "ulpi_data7_po0",
+					      "ulpi_data2_po3",
+					      "ulpi_data3_po4",
+					      "ulpi_data4_po5",
+					      "ulpi_data6_po7";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* UART-B */
+			uartb-txd-rts {
+				nvidia,pins = "uart2_txd_pc2",
+					      "uart2_rts_n_pj6";
+				nvidia,function = "uartb";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			uartb-rxd-cts {
+				nvidia,pins = "uart2_rxd_pc3",
+					      "uart2_cts_n_pj5";
+				nvidia,function = "uartb";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* UART-C */
+			uartc-rxd-cts {
+				nvidia,pins = "uart3_cts_n_pa1",
+					      "uart3_rxd_pw7";
+				nvidia,function = "uartc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			uartc-txd-rts {
+				nvidia,pins = "uart3_rts_n_pc0",
+					      "uart3_txd_pw6";
+				nvidia,function = "uartc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* UART-D */
+			ulpi-nxt-py2 {
+				nvidia,pins = "ulpi_nxt_py2";
+				nvidia,function = "uartd";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			ulpi-clk-py0 {
+				nvidia,pins = "ulpi_clk_py0",
+					      "ulpi_dir_py1",
+					      "ulpi_stp_py3";
+				nvidia,function = "uartd";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* I2S pinmux */
+			dap-i2s0 {
+				nvidia,pins = "dap1_fs_pn0",
+					      "dap1_din_pn1",
+					      "dap1_dout_pn2",
+					      "dap1_sclk_pn3";
+				nvidia,function = "i2s0";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap-i2s1 {
+				nvidia,pins = "dap2_fs_pa2",
+					      "dap2_sclk_pa3",
+					      "dap2_din_pa4",
+					      "dap2_dout_pa5";
+				nvidia,function = "i2s1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap3-fs {
+				nvidia,pins = "dap3_fs_pp0",
+					      "dap3_din_pp1";
+				nvidia,function = "i2s2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap3-dout {
+				nvidia,pins = "dap3_dout_pp2",
+					      "dap3_sclk_pp3";
+				nvidia,function = "i2s2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap-i2s3 {
+				nvidia,pins = "dap4_fs_pp4",
+					      "dap4_din_pp5",
+					      "dap4_dout_pp6",
+					      "dap4_sclk_pp7";
+				nvidia,function = "i2s3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* sensors pinmux */
+			nct-irq {
+				nvidia,pins = "pcc2";
+				nvidia,function = "i2s4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Asus EC pinmux */
+			ec-irqs {
+				nvidia,pins = "kb_row10_ps2",
+					      "kb_row15_ps7";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			ec-reqs {
+				nvidia,pins = "kb_col1_pq1";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* memory type bootstrap */
+			mem-boostraps {
+				nvidia,pins = "gmi_ad4_pg4",
+					      "gmi_ad5_pg5";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* PCI-e pinmux */
+			pex-l2-rst-n {
+				nvidia,pins = "pex_l2_rst_n_pcc6",
+					      "pex_l0_rst_n_pdd1",
+					      "pex_l1_rst_n_pdd5";
+				nvidia,function = "pcie";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pex-l2-clkreq-n {
+				nvidia,pins = "pex_l2_clkreq_n_pcc7",
+					      "pex_l0_prsnt_n_pdd0",
+					      "pex_l0_clkreq_n_pdd2",
+					      "pex_wake_n_pdd3",
+					      "pex_l1_prsnt_n_pdd4",
+					      "pex_l1_clkreq_n_pdd6",
+					      "pex_l2_prsnt_n_pdd7";
+				nvidia,function = "pcie";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* SPI pinmux */
+			spi1-mosi-px4 {
+				nvidia,pins = "spi1_mosi_px4",
+					      "spi1_sck_px5",
+					      "spi1_cs0_n_px6",
+					      "spi1_miso_px7";
+				nvidia,function = "spi1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			spi2-cs1-n-pw2 {
+				nvidia,pins = "spi2_cs1_n_pw2";
+				nvidia,function = "spi2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			spi2-sck-px2 {
+				nvidia,pins = "spi2_sck_px2";
+				nvidia,function = "spi2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi-a17-pb0 {
+				nvidia,pins = "gmi_a17_pb0",
+					      "gmi_a16_pj7";
+				nvidia,function = "spi4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi-a18-pb1 {
+				nvidia,pins = "gmi_a18_pb1";
+				nvidia,function = "spi4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi-a19-pk7 {
+				nvidia,pins = "gmi_a19_pk7";
+				nvidia,function = "spi4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Display A pinmux */
+			lcd-pwr0-pb2 {
+				nvidia,pins = "lcd_pwr0_pb2",
+					      "lcd_pclk_pb3",
+					      "lcd_pwr1_pc1",
+					      "lcd_d0_pe0",
+					      "lcd_d1_pe1",
+					      "lcd_d2_pe2",
+					      "lcd_d3_pe3",
+					      "lcd_d4_pe4",
+					      "lcd_d5_pe5",
+					      "lcd_d6_pe6",
+					      "lcd_d7_pe7",
+					      "lcd_d8_pf0",
+					      "lcd_d9_pf1",
+					      "lcd_d10_pf2",
+					      "lcd_d11_pf3",
+					      "lcd_d12_pf4",
+					      "lcd_d13_pf5",
+					      "lcd_d14_pf6",
+					      "lcd_d15_pf7",
+					      "lcd_de_pj1",
+					      "lcd_hsync_pj3",
+					      "lcd_vsync_pj4",
+					      "lcd_d16_pm0",
+					      "lcd_d17_pm1",
+					      "lcd_d18_pm2",
+					      "lcd_d19_pm3",
+					      "lcd_d20_pm4",
+					      "lcd_d21_pm5",
+					      "lcd_d22_pm6",
+					      "lcd_d23_pm7",
+					      "lcd_dc0_pn6",
+					      "lcd_sdin_pz2";
+				nvidia,function = "displaya";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			lcd-cs0-n-pn4 {
+				nvidia,pins = "lcd_cs0_n_pn4",
+					      "lcd_sdout_pn5",
+					      "lcd_wr_n_pz3";
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
+			kb-col0-pq0 {
+				nvidia,pins = "kb_col0_pq0";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb-col1-pq1 {
+				nvidia,pins = "kb_row1_pr1",
+					      "kb_row3_pr3",
+					      "kb_row14_ps6";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			kb-col4-pq4 {
+				nvidia,pins = "kb_col4_pq4",
+					      "kb_col5_pq5",
+					      "kb_col7_pq7",
+					      "kb_row2_pr2",
+					      "kb_row4_pr4",
+					      "kb_row5_pr5",
+					      "kb_row12_ps4",
+					      "kb_row13_ps5";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			gmi-wp-n-pc7 {
+				nvidia,pins = "gmi_wp_n_pc7",
+					      "gmi_wait_pi7",
+					      "gmi_cs3_n_pk4";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi-cs0-n-pj0 {
+				nvidia,pins = "gmi_cs0_n_pj0",
+					      "gmi_cs1_n_pj2",
+					      "gmi_cs2_n_pk3";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			vi-pclk-pt0 {
+				nvidia,pins = "vi_pclk_pt0";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+				nvidia,io-reset = <0>;
+			};
+
+			/* GPIO keys pinmux */
+			power-key {
+				nvidia,pins = "pv0";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			vol-keys {
+				nvidia,pins = "kb_col2_pq2",
+					      "kb_col3_pq3";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Bluetooth */
+			bt-shutdown {
+				nvidia,pins = "pu0";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			bt-dev-wake {
+				nvidia,pins = "pu1";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			bt-host-wake {
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
+			vi-vsync-pd6 {
+				nvidia,pins = "vi_vsync_pd6",
+					      "vi_hsync_pd7";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,lock = <0>;
+				nvidia,io-reset = <0>;
+			};
+			vi-d10-pt2 {
+				nvidia,pins = "vi_d10_pt2",
+					      "vi_d0_pt4",
+					      "pbb0";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			kb-row0-pr0 {
+				nvidia,pins = "kb_row0_pr0";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi-ad0-pg0 {
+				nvidia,pins = "gmi_ad0_pg0",
+					      "gmi_ad1_pg1",
+					      "gmi_ad2_pg2",
+					      "gmi_ad3_pg3",
+					      "gmi_ad6_pg6",
+					      "gmi_ad7_pg7",
+					      "gmi_wr_n_pi0",
+					      "gmi_oe_n_pi1",
+					      "gmi_dqs_pi2",
+					      "gmi_adv_n_pk0",
+					      "gmi_clk_pk1";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi-ad13-ph5 {
+				nvidia,pins = "gmi_ad13_ph5";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi-ad10-ph2 {
+				nvidia,pins = "gmi_ad10_ph2",
+					      "gmi_ad11_ph3",
+					      "gmi_ad14_ph6";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gmi-ad12-ph4 {
+				nvidia,pins = "gmi_ad12_ph4",
+					      "gmi_rst_n_pi4";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* USB2 VBUS control */
+			usb2-vbus-control {
+				nvidia,pins = "gmi_ad15_ph7";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* PWM pinmux */
+			pwm-0 {
+				nvidia,pins = "gmi_ad8_ph0";
+				nvidia,function = "pwm0";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pwm-2 {
+				nvidia,pins = "pu5";
+				nvidia,function = "pwm2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* S/PDIF pinmux */
+			spdif-out {
+				nvidia,pins = "spdif_out_pk5";
+				nvidia,function = "spdif";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			spdif-in {
+				nvidia,pins = "spdif_in_pk6";
+				nvidia,function = "spdif";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			vi-d4-pl2 {
+				nvidia,pins = "vi_d4_pl2";
+				nvidia,function = "vi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			vi-d6-pl4 {
+				nvidia,pins = "vi_d6_pl4";
+				nvidia,function = "vi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+				nvidia,lock = <0>;
+				nvidia,io-reset = <0>;
+			};
+			vi-mclk-pt1 {
+				nvidia,pins = "vi_mclk_pt1";
+				nvidia,function = "vi";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			jtag-rtck {
+				nvidia,pins = "jtag_rtck_pu7";
+				nvidia,function = "rtck";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			crt-hsync-pv6 {
+				nvidia,pins = "crt_hsync_pv6",
+					      "crt_vsync_pv7";
+				nvidia,function = "crt";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			clk1-out {
+				nvidia,pins = "clk1_out_pw4";
+				nvidia,function = "extperiph1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			clk2-out {
+				nvidia,pins = "clk2_out_pw5";
+				nvidia,function = "extperiph2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			clk3-out {
+				nvidia,pins = "clk3_out_pee0";
+				nvidia,function = "extperiph3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			sys-clk-req {
+				nvidia,pins = "sys_clk_req_pz5";
+				nvidia,function = "sysclk";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
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
+			clk2-req-pcc5 {
+				nvidia,pins = "clk2_req_pcc5",
+					      "clk1_req_pee2";
+				nvidia,function = "dap";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			clk3-req-pee1 {
+				nvidia,pins = "clk3_req_pee1";
+				nvidia,function = "dev3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			owr {
+				nvidia,pins = "owr";
+				nvidia,function = "owr";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* P1801-T specific pinmux */
+			lcd-pwr2 {
+				nvidia,pins = "lcd_pwr2_pc6",
+					      "lcd_dc1_pd2";
+				nvidia,function = "displaya";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			lcd-m1 {
+				nvidia,pins = "lcd_m1_pw1";
+				nvidia,function = "displaya";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			key-mode {
+				nvidia,pins = "gmi_cs4_n_pk2";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			splashtop {
+				nvidia,pins = "gmi_cs6_n_pi3";
+				nvidia,function = "nand_alt";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			w8-detect {
+				nvidia,pins = "gmi_cs7_n_pi6";
+				nvidia,function = "nand_alt";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
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
+			spi2-mosi-px0 {
+				nvidia,pins = "spi2_mosi_px0";
+				nvidia,function = "spi6";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			tp-vendor {
+				nvidia,pins = "kb_row6_pr6",
+					      "kb_row7_pr7";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			tp-power {
+				nvidia,pins = "kb_row8_ps0";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* GPIO power/drive control */
+			drive-dap1 {
+				nvidia,pins = "drive_dap1",
+					      "drive_dap2",
+					      "drive_dbg",
+					      "drive_at5",
+					      "drive_gme",
+					      "drive_ddc",
+					      "drive_ao1",
+					      "drive_uart3";
+				nvidia,high-speed-mode = <TEGRA_PIN_DISABLE>;
+				nvidia,schmitt = <TEGRA_PIN_ENABLE>;
+				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_1>;
+				nvidia,pull-down-strength = <31>;
+				nvidia,pull-up-strength = <31>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+			};
+			drive-sdio1 {
+				nvidia,pins = "drive_sdio1",
+					      "drive_sdio3";
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
+		reset-names = "serial";
+		/delete-property/ reg-shift;
+		status = "okay";
+
+		/* Broadcom GPS BCM47511 */
+	};
+
+	uartc: serial@70006200 {
+		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
+		/delete-property/ reg-shift;
+		status = "okay";
+
+		/* Azurewave AW-AH691 BCM43241B0 */
+	};
+
+	pwm: pwm@7000a000 {
+		status = "okay";
+	};
+
+	i2c@7000c000 {
+		status = "okay";
+		clock-frequency = <280000>;
+	};
+
+	i2c@7000c400 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		/* Nuvoton NPCE791LA0DX embedded controller */
+	};
+
+	i2c@7000c500 {
+		status = "okay";
+		clock-frequency = <100000>;
+
+		accelerometer@f {
+			compatible = "kionix,kxtf9";
+			reg = <0x0f>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(O, 5) IRQ_TYPE_EDGE_RISING>;
+
+			vdd-supply = <&vdd_1v8_vio>;
+			vddio-supply = <&vdd_1v8_vio>;
+
+			mount-matrix = "0", "1", "0",
+				       "1", "0", "0",
+				       "0", "0", "1";
+		};
+	};
+
+	hdmi_ddc: i2c@7000c700 {
+		status = "okay";
+		clock-frequency = <33000>;
+	};
+
+	i2c@7000d000 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		rt5640: audio-codec@1c {
+			compatible = "realtek,rt5640";
+			reg = <0x1c>;
+
+			realtek,dmic1-data-pin = <1>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			clock-names = "mclk";
+
+			realtek,ldo1-en-gpios = <&gpio TEGRA_GPIO(BB, 6) GPIO_ACTIVE_HIGH>;
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
+			vcc4-supply = <&vdd_5v0_bat>;
+			vcc5-supply = <&vdd_5v0_bat>;
+			vcc6-supply = <&vddio_ddr>;
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
+				/* vdd1 is not used by Portable AiO */
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
+					regulator-min-microvolt = <3100000>;
+					regulator-max-microvolt = <3100000>;
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
+				/* ldo5 is not used by Portable AiO */
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
+	usb2_vbus: regulator-usb2 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
+		gpio-open-drain;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	hdmi_5v0_sys: regulator-hdmi {
+		compatible = "regulator-fixed";
+		regulator-name = "hdmi_5v0_sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
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
+		i2c-thermtrip {
+			nvidia,i2c-controller-id = <4>;
+			nvidia,bus-addr = <0x2d>;
+			nvidia,reg-addr = <0x3f>;
+			nvidia,reg-data = <0x81>;
+		};
+	};
+
+	memory-controller@7000f000 {
+		emc-timings-3 {
+			/* Micron 2GB 800MHz */
+			nvidia,ram-code = <3>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emem-configuration = < 0x00030003 0xc0000020
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000003 0x00000008
+					0x00000002 0x00000001 0x00000002 0x00000006
+					0x06020102 0x000a0502 0x75830303 0x001f0000 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emem-configuration = < 0x00010003 0xc0000020
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000003 0x00000008
+					0x00000002 0x00000001 0x00000002 0x00000006
+					0x06020102 0x000a0502 0x74630303 0x001f0000 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = < 0x00000003 0xc0000030
+					0x00000001 0x00000001 0x00000003 0x00000000
+					0x00000001 0x00000001 0x00000003 0x00000008
+					0x00000002 0x00000001 0x00000002 0x00000006
+					0x06020102 0x000a0503 0x73c30504 0x001f0000 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = < 0x00000006 0xc0000025
+					0x00000001 0x00000001 0x00000005 0x00000002
+					0x00000003 0x00000001 0x00000003 0x00000008
+					0x00000002 0x00000001 0x00000002 0x00000006
+					0x06020102 0x000a0505 0x73840a06 0x001f0000 >;
+			};
+
+			timing-400000000 {
+				clock-frequency = <400000000>;
+
+				nvidia,emem-configuration = < 0x0000000c 0xc0000048
+					0x00000001 0x00000002 0x00000009 0x00000005
+					0x00000005 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000002 0x00000003 0x00000006
+					0x06030202 0x000d0709 0x7086120a 0x001f0000 >;
+			};
+
+			timing-800000000 {
+				clock-frequency = <800000000>;
+
+				nvidia,emem-configuration = < 0x00000018 0xc0000090
+					0x00000004 0x00000005 0x00000013 0x0000000c
+					0x0000000b 0x00000002 0x00000003 0x0000000c
+					0x00000002 0x00000002 0x00000004 0x00000008
+					0x08040202 0x00160d13 0x712c2414 0x001f0000 >;
+			};
+		};
+	};
+
+	memory-controller@7000f400 {
+		emc-timings-3 {
+			/* Micron 2GB 800MHz */
+			nvidia,ram-code = <3>;
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
+				nvidia,emc-configuration =  < 0x00000001
+					0x00000006 0x00000000 0x00000000 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000004 0x00000009
+					0x0000000b 0x000000c0 0x00000000 0x00000030
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000007 0x00000007
+					0x00000004 0x00000001 0x00000000 0x00000004
+					0x00000005 0x000000c7 0x00000006 0x00000006
+					0x00000000 0x00000000 0x00004288 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000002a0 0x0800211c 0x00000000
+					0x77fff884 0x01f1f108 0x05057404 0x54000007
+					0x08000168 0x08000000 0x00000802 0x00000000
+					0x00000040 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x80000287 0xe8000000 0xff00ff00 >;
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
+				nvidia,emc-configuration =  < 0x00000002
+					0x0000000d 0x00000001 0x00000000 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000004 0x00000009
+					0x0000000b 0x00000181 0x00000000 0x00000060
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x0000000e 0x0000000e
+					0x00000004 0x00000002 0x00000000 0x00000004
+					0x00000005 0x0000018e 0x00000006 0x00000006
+					0x00000000 0x00000000 0x00004288 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000002a0 0x0800211c 0x00000000
+					0x77fff884 0x01f1f108 0x05057404 0x54000007
+					0x08000168 0x08000000 0x00000802 0x00000000
+					0x00000040 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x8000040b 0xe8000000 0xff00ff00 >;
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
+				nvidia,emc-configuration =  < 0x00000004
+					0x0000001a 0x00000003 0x00000001 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000001
+					0x00000001 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000004 0x00000009
+					0x0000000b 0x00000303 0x00000000 0x000000c0
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x0000001c 0x0000001c
+					0x00000004 0x00000004 0x00000000 0x00000004
+					0x00000005 0x0000031c 0x00000006 0x00000006
+					0x00000000 0x00000000 0x00004288 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000002a0 0x0800211c 0x00000000
+					0x77fff884 0x01f1f108 0x05057404 0x54000007
+					0x08000168 0x08000000 0x00000802 0x00000000
+					0x00000040 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x80000713 0xe8000000 0xff00ff00 >;
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
+				nvidia,emc-configuration =  < 0x00000009
+					0x00000035 0x00000007 0x00000002 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000002
+					0x00000002 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000006 0x00000004 0x00000009
+					0x0000000b 0x00000607 0x00000000 0x00000181
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000038 0x00000038
+					0x00000004 0x00000007 0x00000000 0x00000004
+					0x00000005 0x00000638 0x00000007 0x00000004
+					0x00000000 0x00000000 0x00004288 0x004400a4
+					0x00008000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x000002a0 0x0800211c 0x00000000
+					0x77fff884 0x01f1f108 0x05057404 0x54000007
+					0x08000168 0x08000000 0x00000802 0x00020000
+					0x00000100 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x80000d22 0xe8000000 0xff00ff00 >;
+			};
+
+			timing-400000000 {
+				clock-frequency = <400000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200000>;
+				nvidia,emc-mode-reset = <0x80000521>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+
+				nvidia,emc-configuration =  < 0x00000012
+					0x00000066 0x0000000c 0x00000004 0x00000003
+					0x00000008 0x00000002 0x0000000a 0x00000004
+					0x00000004 0x00000002 0x00000001 0x00000000
+					0x00000004 0x00000006 0x00000004 0x0000000a
+					0x0000000c 0x00000bf0 0x00000000 0x000002fc
+					0x00000001 0x00000008 0x00000001 0x00000000
+					0x00000008 0x0000000f 0x0000006c 0x00000200
+					0x00000004 0x0000000c 0x00000000 0x00000004
+					0x00000005 0x00000c30 0x00000000 0x00000004
+					0x00000000 0x00000000 0x00007088 0x001d0084
+					0x00008000 0x00044000 0x00044000 0x00044000
+					0x00044000 0x00044000 0x00044000 0x00044000
+					0x00044000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00048000 0x00048000 0x00048000
+					0x00048000 0x000002a0 0x0800013d 0x00000000
+					0x77fff884 0x01f1f508 0x05057404 0x54000007
+					0x080001e8 0x08000021 0x00000802 0x00020000
+					0x00000100 0x0158000c 0xa0f10000 0x00000000
+					0x00000000 0x800018c8 0xe8000000 0xff00ff89 >;
+			};
+
+			timing-800000000 {
+				clock-frequency = <800000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200018>;
+				nvidia,emc-mode-reset = <0x80000d71>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000025
+					0x000000ce 0x0000001a 0x00000009 0x00000005
+					0x0000000d 0x00000004 0x00000013 0x00000009
+					0x00000009 0x00000003 0x00000001 0x00000000
+					0x00000007 0x0000000b 0x00000009 0x0000000b
+					0x00000012 0x00001820 0x00000000 0x00000608
+					0x00000003 0x00000012 0x00000001 0x00000000
+					0x0000000f 0x00000018 0x000000d8 0x00000200
+					0x00000005 0x00000018 0x00000000 0x00000007
+					0x00000008 0x00001860 0x0000000c 0x00000004
+					0x00000000 0x00000000 0x00005088 0xf0070191
+					0x00008000 0x0000c00a 0x0000000a 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x00018000 0x00018000 0x00018000
+					0x00018000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x000002a0 0x0800013d 0x22220000
+					0x77fff884 0x01f1f501 0x07077404 0x54000000
+					0x080001e8 0x08000021 0x00000802 0x00020000
+					0x00000100 0x00f0000c 0xa0f10202 0x00000000
+					0x00000000 0x8000308c 0xe8000000 0xff00ff49 >;
+			};
+		};
+	};
+
+	hda@70030000 {
+		status = "okay";
+	};
+
+	ahub@70080000 {
+		i2s@70080400 { /* i2s1 */
+			status = "okay";
+		};
+
+		/* BT SCO */
+		i2s@70080600 { /* i2s3 */
+			status = "okay";
+		};
+	};
+
+	sdmmc1: mmc@78000000 {
+		status = "okay";
+
+		/* SDR104 mode unsupported yet */
+		max-frequency = <104000000>;
+
+		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
+		bus-width = <4>;
+
+		vmmc-supply = <&vdd_usd>;	/* ldo2 */
+		vqmmc-supply = <&vddio_usd>;	/* ldo3 */
+	};
+
+	sdmmc3: mmc@78000400 {
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
+		vmmc-supply = <&vdd_3v3_com>;
+		vqmmc-supply = <&vdd_1v8_vio>;
+
+		/* Azurewave AW-AH691 BCM43241B0 */
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
+
+		non-removable;
+		mmc-ddr-3_3v;
+
+		vmmc-supply = <&vcore_emmc>;
+		vqmmc-supply = <&vdd_1v8_vio>;
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
+	/* mini-USB port */
+	usb@7d004000 {
+		status = "okay";
+	};
+
+	usb-phy@7d004000 {
+		status = "okay";
+		vbus-supply = <&usb2_vbus>;
+	};
+
+	/* Full size USB */
+	usb@7d008000 {
+		status = "okay";
+	};
+
+	usb-phy@7d008000 {
+		status = "okay";
+		vbus-supply = <&vdd_5v0_bat>;
+	};
+
+	pad_battery: battery-cell {
+		compatible = "simple-battery";
+		device-chemistry = "lithium-ion-polymer";
+		charge-full-design-microamp-hours = <5136000>;
+		energy-full-design-microwatt-hours = <38000000>;
+		operating-range-celsius = <0 45>;
+	};
+
+	/* Connected to a 18.4" LVDS panel */
+	bridge {
+		compatible = "mstar,tsumu88adt3-lf-1";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				bridge_in: endpoint {
+					remote-endpoint = <&hdmi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				bridge_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
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
+	connector {
+		compatible = "hdmi-connector";
+		label = "HDMI";
+		type = "a";
+
+		/* low: tablet, high: dock */
+		hpd-gpios = <&gpio TEGRA_GPIO(H, 4) GPIO_ACTIVE_LOW>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+		ddc-en-gpios = <&gpio TEGRA_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&bridge_out>;
+			};
+		};
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
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-power {
+			label = "Power";
+			gpios = <&gpio TEGRA_GPIO(V, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&gpio TEGRA_GPIO(Q, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		key-volume-down {
+			label = "Volume Down";
+			gpios = <&gpio TEGRA_GPIO(Q, 3) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		switch-docking-station-mode {
+			label = "Mode";
+			gpios = <&gpio TEGRA_GPIO(K, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_MODE>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+	};
+
+	opp-table-actmon {
+		opp-800000000 {
+			opp-supported-hw = <0x0006>;
+		};
+
+		/delete-node/ opp-900000000;
+	};
+
+	opp-table-emc {
+		opp-800000000-1300 {
+			opp-supported-hw = <0x0006>;
+		};
+
+		/delete-node/ opp-900000000-1350;
+	};
+
+	brcm_wifi_pwrseq: pwrseq-wifi {
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
+	sound {
+		compatible = "asus,tegra-audio-rt5640-p1801-t",
+			     "nvidia,tegra-audio-rt5640";
+		nvidia,model = "Asus Portable AiO P1801-T RT5642";
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
+		/*
+		 * NCT72 has two sensors:
+		 *
+		 *	0: internal that monitors ambient/skin temperature
+		 *	1: external that is connected to the CPU's diode
+		 *
+		 * Ideally we should use userspace thermal governor,
+		 * but it's a much more complex solution. The "skin"
+		 * zone exists as a simpler solution which prevents
+		 * the Portable AiO from getting too hot from a user's
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
2.48.1



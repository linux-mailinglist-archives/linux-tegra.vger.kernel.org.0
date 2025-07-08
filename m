Return-Path: <linux-tegra+bounces-7809-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 695EDAFC59E
	for <lists+linux-tegra@lfdr.de>; Tue,  8 Jul 2025 10:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8B10189879F
	for <lists+linux-tegra@lfdr.de>; Tue,  8 Jul 2025 08:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD492BE034;
	Tue,  8 Jul 2025 08:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHIocwjj"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FE72BDC00;
	Tue,  8 Jul 2025 08:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963309; cv=none; b=Jk8MYyfStlHS0pz6LukbhrnPSWuSN+RwF9GKNudN2iWW41Fhcfj96XCnnjx0/zwcYdwxJUO1GL0HFxi74TVRf0vRC0e195yx6SNfSUdHH/XWqhY7Ovk/dBiYOLZiHg1eGDWbfkBRsQvoweCmAThkuaPc9nX5MSgTXUJ5vtDESq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963309; c=relaxed/simple;
	bh=npi79LZhuDFe6A2UXuN66H4+d0/uBtmbYowqHBMV7Vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jrkjFVPWVCzZDdaCmWnkwXKFoiHIMNz8fE99gnaRK+/vWr3mqlegDE7iGeFr0OrmPMoT3Uw2Z/VPV9bYiUIcZ4SiYb9dEqni4ngEoidcoMnMWorvmmpDtYeW/a2WeA/urGOTG5l99bqE3bnmLPGY24s3D7fP0LUzMSRRuok6658=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHIocwjj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-453066fad06so28067585e9.2;
        Tue, 08 Jul 2025 01:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751963305; x=1752568105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlhZERrOKwaOdnEg8ANjEvrFqWxTJOJd9piL8E3yd6M=;
        b=PHIocwjjPQyU82/p2JpT5ez8K5dWp39onlBSo1H07mu3PsdKV7UrPXvlZGs4lF4hQ6
         nvZ1RHYwU6eJkmvoNeOZE09sgTVkKLVGCJ5K4WrRhVN1CGRHScolPkZ6L1XCPLNVLLxv
         cToI7VC3OPYUpsvvdadnb/rtr6e1K//GqTk1NH8u/MgIUVjBdpq/EwT/4/9FeC4Dkf8v
         0N8II9afdX5XkIArPovubajeWdOSsTAc+de5wbzeU2N+CU+SMQh0Q9Ms/f+CkaFFOBfW
         5MOEtnWE0ZyEeeYyXJYgKofPB9LDvZ28NGMlBqLU/7ceWiEUf06rIDNmCrRYRh2qSnoI
         gUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963305; x=1752568105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlhZERrOKwaOdnEg8ANjEvrFqWxTJOJd9piL8E3yd6M=;
        b=CISmwCwzmCmtGy9eJbOzrZarWulq0aoG+G+uKs5RdaFICQ4/YvDXV3jwTxQXSHg4KN
         J8lxq435EWG4VxfJz5kdQa+qHCv7r1YLYDib8g6rLBdGmVszKcM2B97i8bRKeCDvcwKz
         BoEwunl863MB3lFG7sPLvGCY2L4WFs02luJGbnR1oJdg3OMOHbFUQvdcFoIxOd1ty22y
         76+OVTpCbTro+55HQsP/4ZvqGPIiMmhiWjZphwEsjgn20dvgp1IKbOQVfFyX/mijmIBe
         zOXZyBXr09sTkrpi6tEbFdPDKMU3EEbM2TnVzM1B5NU06eg5MxzWExWvsnpuSy4IQPu+
         seig==
X-Forwarded-Encrypted: i=1; AJvYcCV7NhFOdqtHQVRm4LUKA4WWcp1KVufIBG7J4D2xo6Uxo06tvUVRusqTYPpkwfCnV8+P0WAGfpfbvGitL5U=@vger.kernel.org, AJvYcCVmD0cA+7Hjvcvt5bW/HhGlLnOuS2DcQao/2Qokt6S9MVEdwOgWUMbRnvpk/9NNhmlZPHPlnLX70SFl@vger.kernel.org
X-Gm-Message-State: AOJu0YwI7dZFsjeOofqmfMKANcpoLsjFcCSUjfL8BzoYXEZfwncGzOyD
	L7Ygr93+g8lpwu8pQupEPAuPiBPlFxNOZLx5QSYz49Yvg5viBKVXFURC
X-Gm-Gg: ASbGnctZPUsiLH2BuOs8m1YxZhKWHgdtJHJ3img+dJhzqiQfovSxZap46VT9aIdmKUY
	LVFuMoVoZzsh63+xpVGmE7SbY6VIsIlFsyP2tsY6TsGIocuANE/tB7hFz0SvCPzPG1cHNd/3D2b
	Cew/Xs4jd/R6SdHLPF9nC7Q4QrNj9Qg+SK9kf/9g8gay8pfsBhYyHkX1t6h0O0Pj3KzD3h9bC6F
	sutjMZYJ5mLHPQG+SM+Q/qDltPOBW4xCQSpaaXi9TNA8T9VsytDiFRu3dA2Z+nEaU60KsQhAxS0
	YLnqOsyUYklXytaEd0sh1+HG3o3poIqoi/gEKnSwgTt6aC7zPYMv3/Cd9eNGKC6JNKrfcN2cN/O
	UY2XqyQ6CKtYvp9JxZLf8vzu+QsI7DC/bYHTRpuQmt5KJLhBaihMOwQ==
X-Google-Smtp-Source: AGHT+IHu3yp5AxyfRVmZasV3RAW+HpH5Gnagy8YkCMAikS6G+6UIaSpNgljrrCFWvoHfg1RhFyKqzg==
X-Received: by 2002:a05:600c:3b17:b0:453:7bd:2e30 with SMTP id 5b1f17b1804b1-454cd543dfcmr16979465e9.29.1751963304810;
        Tue, 08 Jul 2025 01:28:24 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454cd38f092sm15431755e9.1.2025.07.08.01.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:28:23 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/5] dt-bindings: Add Tegra264 clock and reset definitions
Date: Tue,  8 Jul 2025 10:28:11 +0200
Message-ID: <20250708082814.1491230-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708082814.1491230-1-thierry.reding@gmail.com>
References: <20250708082814.1491230-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The BPMP firmware on Tegra264 defines a set of IDs for clock and reset
resources. These are not enumerations but provided by hardware, and 0 is
a reserved value, hence the numbering starts at 1.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- drop -reset and -clock suffixes since they are redundant
- include all known clock and reset definitions
- drop U suffix for integer literals
- add vendor prefix to filename

 include/dt-bindings/clock/nvidia,tegra264.h | 466 ++++++++++++++++++++
 include/dt-bindings/reset/nvidia,tegra264.h |  92 ++++
 2 files changed, 558 insertions(+)
 create mode 100644 include/dt-bindings/clock/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/reset/nvidia,tegra264.h

diff --git a/include/dt-bindings/clock/nvidia,tegra264.h b/include/dt-bindings/clock/nvidia,tegra264.h
new file mode 100644
index 000000000000..0fc2ad5e6cef
--- /dev/null
+++ b/include/dt-bindings/clock/nvidia,tegra264.h
@@ -0,0 +1,466 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/* Copyright (c) 2022-2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef DT_BINDINGS_CLOCK_NVIDIA_TEGRA264_H
+#define DT_BINDINGS_CLOCK_NVIDIA_TEGRA264_H
+
+#define TEGRA264_CLK_OSC				1
+#define TEGRA264_CLK_CLK_S				2
+#define TEGRA264_CLK_JTAG_REG				3
+#define TEGRA264_CLK_SPLL				4
+#define TEGRA264_CLK_SPLL_OUT0				5
+#define TEGRA264_CLK_SPLL_OUT1				6
+#define TEGRA264_CLK_SPLL_OUT2				7
+#define TEGRA264_CLK_SPLL_OUT3				8
+#define TEGRA264_CLK_SPLL_OUT4				9
+#define TEGRA264_CLK_SPLL_OUT5				10
+#define TEGRA264_CLK_SPLL_OUT6				11
+#define TEGRA264_CLK_SPLL_OUT7				12
+#define TEGRA264_CLK_AON_I2C				13
+#define TEGRA264_CLK_HOST1X				14
+#define TEGRA264_CLK_ISP				15
+#define TEGRA264_CLK_ISP1				16
+#define TEGRA264_CLK_ISP_ROOT				17
+#define TEGRA264_CLK_NAFLL_PVA0_CORE			18
+#define TEGRA264_CLK_NAFLL_PVA0_VPS			19
+#define TEGRA264_CLK_NVCSI				20
+#define TEGRA264_CLK_NVCSILP				21
+#define TEGRA264_CLK_PLLP_OUT0				22
+#define TEGRA264_CLK_PVA0_CPU_AXI			23
+#define TEGRA264_CLK_PVA0_VPS				24
+#define TEGRA264_CLK_PWM10				25
+#define TEGRA264_CLK_PWM2				26
+#define TEGRA264_CLK_PWM3				27
+#define TEGRA264_CLK_PWM4				28
+#define TEGRA264_CLK_PWM5				29
+#define TEGRA264_CLK_PWM9				30
+#define TEGRA264_CLK_QSPI0				31
+#define TEGRA264_CLK_QSPI0_2X_PM			32
+#define TEGRA264_CLK_RCE1_CPU				33
+#define TEGRA264_CLK_RCE1_NIC				34
+#define TEGRA264_CLK_RCE_CPU				35
+#define TEGRA264_CLK_RCE_NIC				36
+#define TEGRA264_CLK_SE					37
+#define TEGRA264_CLK_SEU1				38
+#define TEGRA264_CLK_SEU2				39
+#define TEGRA264_CLK_SEU3				40
+#define TEGRA264_CLK_SE_ROOT				41
+#define TEGRA264_CLK_SPI1				42
+#define TEGRA264_CLK_SPI2				43
+#define TEGRA264_CLK_SPI3				44
+#define TEGRA264_CLK_SPI4				45
+#define TEGRA264_CLK_SPI5				46
+#define TEGRA264_CLK_TOP_I2C				47
+#define TEGRA264_CLK_TSEC				48
+#define TEGRA264_CLK_TSEC_PKA				49
+#define TEGRA264_CLK_UART0				50
+#define TEGRA264_CLK_UART10				51
+#define TEGRA264_CLK_UART11				52
+#define TEGRA264_CLK_UART4				53
+#define TEGRA264_CLK_UART5				54
+#define TEGRA264_CLK_UART8				55
+#define TEGRA264_CLK_UART9				56
+#define TEGRA264_CLK_VI					57
+#define TEGRA264_CLK_VI1				58
+#define TEGRA264_CLK_VIC				59
+#define TEGRA264_CLK_VI_ROOT				60
+#define TEGRA264_CLK_DISPPLL				61
+#define TEGRA264_CLK_SPPLL0				62
+#define TEGRA264_CLK_SPPLL0_CLKOUT1A			63
+#define TEGRA264_CLK_SPPLL0_CLKOUT2A			64
+#define TEGRA264_CLK_SPPLL1				65
+#define TEGRA264_CLK_VPLL0				66
+#define TEGRA264_CLK_VPLL1				67
+#define TEGRA264_CLK_VPLL2				68
+#define TEGRA264_CLK_VPLL3				69
+#define TEGRA264_CLK_VPLL4				70
+#define TEGRA264_CLK_VPLL5				71
+#define TEGRA264_CLK_VPLL6				72
+#define TEGRA264_CLK_VPLL7				73
+#define TEGRA264_CLK_RG0_DIV				74
+#define TEGRA264_CLK_RG1_DIV				75
+#define TEGRA264_CLK_RG2_DIV				76
+#define TEGRA264_CLK_RG3_DIV				77
+#define TEGRA264_CLK_RG4_DIV				78
+#define TEGRA264_CLK_RG5_DIV				79
+#define TEGRA264_CLK_RG6_DIV				80
+#define TEGRA264_CLK_RG7_DIV				81
+#define TEGRA264_CLK_RG0				82
+#define TEGRA264_CLK_RG1				83
+#define TEGRA264_CLK_RG2				84
+#define TEGRA264_CLK_RG3				85
+#define TEGRA264_CLK_RG4				86
+#define TEGRA264_CLK_RG5				87
+#define TEGRA264_CLK_RG6				88
+#define TEGRA264_CLK_RG7				89
+#define TEGRA264_CLK_DISP				90
+#define TEGRA264_CLK_DSC				91
+#define TEGRA264_CLK_DSC_ROOT				92
+#define TEGRA264_CLK_HUB				93
+#define TEGRA264_CLK_VPLLX_SOR0_MUXED			94
+#define TEGRA264_CLK_VPLLX_SOR1_MUXED			95
+#define TEGRA264_CLK_VPLLX_SOR2_MUXED			96
+#define TEGRA264_CLK_VPLLX_SOR3_MUXED			97
+#define TEGRA264_CLK_LINKA_SYM				98
+#define TEGRA264_CLK_LINKB_SYM				99
+#define TEGRA264_CLK_LINKC_SYM				100
+#define TEGRA264_CLK_LINKD_SYM				101
+#define TEGRA264_CLK_PRE_SOR0				102
+#define TEGRA264_CLK_PRE_SOR1				103
+#define TEGRA264_CLK_PRE_SOR2				104
+#define TEGRA264_CLK_PRE_SOR3				105
+#define TEGRA264_CLK_SOR0_PLL_REF			106
+#define TEGRA264_CLK_SOR1_PLL_REF			107
+#define TEGRA264_CLK_SOR2_PLL_REF			108
+#define TEGRA264_CLK_SOR3_PLL_REF			109
+#define TEGRA264_CLK_SOR0_PAD				110
+#define TEGRA264_CLK_SOR1_PAD				111
+#define TEGRA264_CLK_SOR2_PAD				112
+#define TEGRA264_CLK_SOR3_PAD				113
+#define TEGRA264_CLK_SOR0_REF				114
+#define TEGRA264_CLK_SOR1_REF				115
+#define TEGRA264_CLK_SOR2_REF				116
+#define TEGRA264_CLK_SOR3_REF				117
+#define TEGRA264_CLK_SOR0_DIV				118
+#define TEGRA264_CLK_SOR1_DIV				119
+#define TEGRA264_CLK_SOR2_DIV				120
+#define TEGRA264_CLK_SOR3_DIV				121
+#define TEGRA264_CLK_SOR0				122
+#define TEGRA264_CLK_SOR1				123
+#define TEGRA264_CLK_SOR2				124
+#define TEGRA264_CLK_SOR3				125
+#define TEGRA264_CLK_SF0_SOR				126
+#define TEGRA264_CLK_SF1_SOR				127
+#define TEGRA264_CLK_SF2_SOR				128
+#define TEGRA264_CLK_SF3_SOR				129
+#define TEGRA264_CLK_SF4_SOR				130
+#define TEGRA264_CLK_SF5_SOR				131
+#define TEGRA264_CLK_SF6_SOR				132
+#define TEGRA264_CLK_SF7_SOR				133
+#define TEGRA264_CLK_SF0				134
+#define TEGRA264_CLK_SF1				135
+#define TEGRA264_CLK_SF2				136
+#define TEGRA264_CLK_SF3				137
+#define TEGRA264_CLK_SF4				138
+#define TEGRA264_CLK_SF5				139
+#define TEGRA264_CLK_SF6				140
+#define TEGRA264_CLK_SF7				141
+#define TEGRA264_CLK_MAUD				142
+#define TEGRA264_CLK_AZA_2XBIT				143
+#define TEGRA264_CLK_DCE_CPU				144
+#define TEGRA264_CLK_DCE_NIC				145
+#define TEGRA264_CLK_PLLC4				146
+#define TEGRA264_CLK_PLLC4_OUT0				147
+#define TEGRA264_CLK_PLLC4_OUT1				148
+#define TEGRA264_CLK_PLLC4_MUXED			149
+#define TEGRA264_CLK_SDMMC1				150
+#define TEGRA264_CLK_SDMMC_LEGACY_TM			151
+#define TEGRA264_CLK_PLLC0				152
+#define TEGRA264_CLK_NAFLL_BPMP				153
+#define TEGRA264_CLK_PLLP_OUT_PDIV			154
+#define TEGRA264_CLK_DISP_ROOT				155
+#define TEGRA264_CLK_ADSP				156
+#define TEGRA264_CLK_PLLA				157
+#define TEGRA264_CLK_PLLA1				158
+#define TEGRA264_CLK_PLLA1_OUT1				159
+#define TEGRA264_CLK_PLLAON				160
+#define TEGRA264_CLK_PLLAON_APE				161
+#define TEGRA264_CLK_PLLA_OUT0				162
+#define TEGRA264_CLK_AHUB				163
+#define TEGRA264_CLK_APE				164
+#define TEGRA264_CLK_I2S1_SCLK_IN			165
+#define TEGRA264_CLK_I2S2_SCLK_IN			166
+#define TEGRA264_CLK_I2S3_SCLK_IN			167
+#define TEGRA264_CLK_I2S4_SCLK_IN			168
+#define TEGRA264_CLK_I2S5_SCLK_IN			169
+#define TEGRA264_CLK_I2S6_SCLK_IN			170
+#define TEGRA264_CLK_I2S7_SCLK_IN			171
+#define TEGRA264_CLK_I2S8_SCLK_IN			172
+#define TEGRA264_CLK_I2S9_SCLK_IN			173
+#define TEGRA264_CLK_I2S1_AUDIO_SYNC			174
+#define TEGRA264_CLK_I2S2_AUDIO_SYNC			175
+#define TEGRA264_CLK_I2S3_AUDIO_SYNC			176
+#define TEGRA264_CLK_I2S4_AUDIO_SYNC			177
+#define TEGRA264_CLK_I2S5_AUDIO_SYNC			178
+#define TEGRA264_CLK_I2S6_AUDIO_SYNC			179
+#define TEGRA264_CLK_I2S7_AUDIO_SYNC			180
+#define TEGRA264_CLK_I2S8_AUDIO_SYNC			181
+#define TEGRA264_CLK_DMIC1_AUDIO_SYNC			182
+#define TEGRA264_CLK_DSPK1_AUDIO_SYNC			183
+#define TEGRA264_CLK_I2S1				184
+#define TEGRA264_CLK_I2S2				185
+#define TEGRA264_CLK_I2S3				186
+#define TEGRA264_CLK_I2S4				187
+#define TEGRA264_CLK_I2S5				188
+#define TEGRA264_CLK_I2S6				189
+#define TEGRA264_CLK_I2S7				190
+#define TEGRA264_CLK_I2S8				191
+#define TEGRA264_CLK_I2S9				192
+#define TEGRA264_CLK_DMIC1				193
+#define TEGRA264_CLK_DMIC5				194
+#define TEGRA264_CLK_DSPK1				195
+#define TEGRA264_CLK_AON_CPU				196
+#define TEGRA264_CLK_AON_NIC				197
+#define TEGRA264_CLK_BPMP				198
+#define TEGRA264_CLK_AXI_CBB				199
+#define TEGRA264_CLK_FUSE				200
+#define TEGRA264_CLK_TSENSE				201
+#define TEGRA264_CLK_CSITE				202
+#define TEGRA264_CLK_HCSITE				203
+#define TEGRA264_CLK_DBGAPB				204
+#define TEGRA264_CLK_LA					205
+#define TEGRA264_CLK_PLLREFGP				206
+#define TEGRA264_CLK_PLLE0				207
+#define TEGRA264_CLK_UPHY0_PLL0_XDIG			208
+#define TEGRA264_CLK_EQOS_APP				209
+#define TEGRA264_CLK_EQOS_MAC				210
+#define TEGRA264_CLK_EQOS_MACSEC			211
+#define TEGRA264_CLK_EQOS_TX_PCS			212
+#define TEGRA264_CLK_MGBES_PTP_REF			213
+#define TEGRA264_CLK_MGBE0_UPHY1_PLL_XDIG		214
+#define TEGRA264_CLK_MGBE0_TX_PCS			215
+#define TEGRA264_CLK_MGBE0_MAC				216
+#define TEGRA264_CLK_MGBE0_MACSEC			217
+#define TEGRA264_CLK_MGBE0_APP				218
+#define TEGRA264_CLK_MGBE1_UPHY1_PLL_XDIG		219
+#define TEGRA264_CLK_MGBE1_TX_PCS			220
+#define TEGRA264_CLK_MGBE1_MAC				221
+#define TEGRA264_CLK_MGBE1_MACSEC			222
+#define TEGRA264_CLK_MGBE1_APP				223
+#define TEGRA264_CLK_MGBE2_UPHY1_PLL_XDIG		224
+#define TEGRA264_CLK_MGBE2_TX_PCS			225
+#define TEGRA264_CLK_MGBE2_MAC				226
+#define TEGRA264_CLK_MGBE2_MACSEC			227
+#define TEGRA264_CLK_MGBE2_APP				228
+#define TEGRA264_CLK_MGBE3_UPHY1_PLL_XDIG		229
+#define TEGRA264_CLK_MGBE3_TX_PCS			230
+#define TEGRA264_CLK_MGBE3_MAC				231
+#define TEGRA264_CLK_MGBE3_MACSEC			232
+#define TEGRA264_CLK_MGBE3_APP				233
+#define TEGRA264_CLK_PLLREFUFS				234
+#define TEGRA264_CLK_PLLREFUFS_CLKOUT624		235
+#define TEGRA264_CLK_PLLREFUFS_REFCLKOUT		236
+#define TEGRA264_CLK_PLLREFUFS_UFSDEV_REFCLKOUT		237
+#define TEGRA264_CLK_UFSHC_CG_SYS			238
+#define TEGRA264_CLK_MPHY_L0_RX_LS_BIT_DIV		239
+#define TEGRA264_CLK_MPHY_L0_RX_LS_BIT			240
+#define TEGRA264_CLK_MPHY_L0_RX_LS_SYMB_DIV		241
+#define TEGRA264_CLK_MPHY_L0_RX_HS_SYMB_DIV		242
+#define TEGRA264_CLK_MPHY_L0_RX_SYMB			243
+#define TEGRA264_CLK_MPHY_L0_UPHY_TX_FIFO		244
+#define TEGRA264_CLK_MPHY_L0_TX_LS_3XBIT_DIV		245
+#define TEGRA264_CLK_MPHY_L0_TX_LS_SYMB_DIV		246
+#define TEGRA264_CLK_UPHY0_PLL4_XDIG			247
+#define TEGRA264_CLK_MPHY_L0_TX_HS_SYMB_DIV		248
+#define TEGRA264_CLK_MPHY_L0_TX_SYMB			249
+#define TEGRA264_CLK_MPHY_L0_TX_LS_3XBIT		250
+#define TEGRA264_CLK_MPHY_L0_RX_ANA			251
+#define TEGRA264_CLK_MPHY_L1_RX_ANA			252
+#define TEGRA264_CLK_MPHY_TX_1MHZ_REF			253
+#define TEGRA264_CLK_MPHY_CORE_PLL_FIXED		254
+#define TEGRA264_CLK_MPHY_IOBIST			255
+#define TEGRA264_CLK_UFSHC_CG_SYS_DIV			256
+#define TEGRA264_CLK_XUSB1_CORE				257
+#define TEGRA264_CLK_XUSB1_FALCON			258
+#define TEGRA264_CLK_XUSB1_FS				259
+#define TEGRA264_CLK_XUSB1_SS				260
+#define TEGRA264_CLK_UPHY0_USB_P0_RX_CORE		261
+#define TEGRA264_CLK_UPHY0_USB_P1_RX_CORE		262
+#define TEGRA264_CLK_UPHY0_USB_P2_RX_CORE		263
+#define TEGRA264_CLK_UPHY0_USB_P3_RX_CORE		264
+#define TEGRA264_CLK_XUSB1_CLK480M_NVWRAP_CORE		265
+#define TEGRA264_CLK_XUSB1_CORE_HOST			266
+#define TEGRA264_CLK_XUSB1_CORE_DEV			267
+#define TEGRA264_CLK_XUSB1_CORE_SUPERSPEED		268
+#define TEGRA264_CLK_XUSB1_FALCON_HOST			269
+#define TEGRA264_CLK_XUSB1_FALCON_SUPERSPEED		270
+#define TEGRA264_CLK_XUSB1_FS_HOST			271
+#define TEGRA264_CLK_XUSB1_FS_DEV			272
+#define TEGRA264_CLK_XUSB1_HS_HSICP			273
+#define TEGRA264_CLK_XUSB1_SS_DEV			274
+#define TEGRA264_CLK_XUSB1_SS_SUPERSPEED		275
+#define TEGRA264_CLK_AON_TOUCH				276
+#define TEGRA264_CLK_AUD_MCLK				277
+#define TEGRA264_CLK_EXTPERIPH1				278
+#define TEGRA264_CLK_EXTPERIPH2				279
+#define TEGRA264_CLK_EXTPERIPH3				280
+#define TEGRA264_CLK_EXTPERIPH4				281
+#define TEGRA264_CLK_JTAG_REG_UNGATED			282
+#define TEGRA264_CLK_IST_BUS				283
+#define TEGRA264_CLK_IST_BUS_RIST_MCC			284
+#define TEGRA264_CLK_MATHS_SEC_RIST			285
+#define TEGRA264_CLK_NAFLL_IST				286
+#define TEGRA264_CLK_RIST_ROOT				287
+#define TEGRA264_CLK_IST_CONTROLLER_RIST		288
+#define TEGRA264_CLK_MSS_ENCRYPT			289
+#define TEGRA264_CLK_EMC				290
+#define TEGRA264_CLK_SPPLL0_CLKOUT100			291
+#define TEGRA264_CLK_SPPLL0_CLKOUT270			292
+#define TEGRA264_CLK_SPPLL1_CLKOUT100			293
+#define TEGRA264_CLK_SPPLL1_CLKOUT270			294
+#define TEGRA264_CLK_DP_LINKA_REF			295
+#define TEGRA264_CLK_DP_LINKB_REF			296
+#define TEGRA264_CLK_DP_LINKC_REF			297
+#define TEGRA264_CLK_DP_LINKD_REF			298
+#define TEGRA264_CLK_PLLNVCSI				299
+#define TEGRA264_CLK_PLLBPMPCAM				300
+#define TEGRA264_CLK_UTMI_PLL1				301
+#define TEGRA264_CLK_UTMI_PLL1_CLKOUT48			302
+#define TEGRA264_CLK_UTMI_PLL1_CLKOUT60			303
+#define TEGRA264_CLK_UTMI_PLL1_CLKOUT480		304
+#define TEGRA264_CLK_NAFLL_ISP				305
+#define TEGRA264_CLK_NAFLL_RCE				306
+#define TEGRA264_CLK_NAFLL_RCE1				307
+#define TEGRA264_CLK_NAFLL_SE				308
+#define TEGRA264_CLK_NAFLL_VI				309
+#define TEGRA264_CLK_NAFLL_VIC				310
+#define TEGRA264_CLK_NAFLL_DCE				311
+#define TEGRA264_CLK_NAFLL_TSEC				312
+#define TEGRA264_CLK_NAFLL_CPAIR0			313
+#define TEGRA264_CLK_NAFLL_CPAIR1			314
+#define TEGRA264_CLK_NAFLL_CPAIR2			315
+#define TEGRA264_CLK_NAFLL_CPAIR3			316
+#define TEGRA264_CLK_NAFLL_CPAIR4			317
+#define TEGRA264_CLK_NAFLL_CPAIR5			318
+#define TEGRA264_CLK_NAFLL_CPAIR6			319
+#define TEGRA264_CLK_NAFLL_GPU_SYS			320
+#define TEGRA264_CLK_NAFLL_GPU_NVD			321
+#define TEGRA264_CLK_NAFLL_GPU_UPROC			322
+#define TEGRA264_CLK_NAFLL_GPU_GPC0			323
+#define TEGRA264_CLK_NAFLL_GPU_GPC1			324
+#define TEGRA264_CLK_NAFLL_GPU_GPC2			325
+#define TEGRA264_CLK_SOR_LINKA_INPUT			326
+#define TEGRA264_CLK_SOR_LINKB_INPUT			327
+#define TEGRA264_CLK_SOR_LINKC_INPUT			328
+#define TEGRA264_CLK_SOR_LINKD_INPUT			329
+#define TEGRA264_CLK_SOR_LINKA_AFIFO			330
+#define TEGRA264_CLK_SOR_LINKB_AFIFO			331
+#define TEGRA264_CLK_SOR_LINKC_AFIFO			332
+#define TEGRA264_CLK_SOR_LINKD_AFIFO			333
+#define TEGRA264_CLK_I2S1_PAD_M				334
+#define TEGRA264_CLK_I2S2_PAD_M				335
+#define TEGRA264_CLK_I2S3_PAD_M				336
+#define TEGRA264_CLK_I2S4_PAD_M				337
+#define TEGRA264_CLK_I2S5_PAD_M				338
+#define TEGRA264_CLK_I2S6_PAD_M				339
+#define TEGRA264_CLK_I2S7_PAD_M				340
+#define TEGRA264_CLK_I2S8_PAD_M				341
+#define TEGRA264_CLK_I2S9_PAD_M				342
+#define TEGRA264_CLK_BPMP_NIC				343
+#define TEGRA264_CLK_CLK1M				344
+#define TEGRA264_CLK_RDET				345
+#define TEGRA264_CLK_ADC_SOC_REF			346
+#define TEGRA264_CLK_UPHY0_PLL0_TXREF			347
+#define TEGRA264_CLK_EQOS_TX				348
+#define TEGRA264_CLK_EQOS_TX_M				349
+#define TEGRA264_CLK_EQOS_RX_PCS_IN			350
+#define TEGRA264_CLK_EQOS_RX_PCS_M			351
+#define TEGRA264_CLK_EQOS_RX_IN				352
+#define TEGRA264_CLK_EQOS_RX				353
+#define TEGRA264_CLK_EQOS_RX_M				354
+#define TEGRA264_CLK_MGBE0_UPHY1_PLL_TXREF		355
+#define TEGRA264_CLK_MGBE0_TX				356
+#define TEGRA264_CLK_MGBE0_TX_M				357
+#define TEGRA264_CLK_MGBE0_RX_PCS_IN			358
+#define TEGRA264_CLK_MGBE0_RX_PCS_M			359
+#define TEGRA264_CLK_MGBE0_RX_IN			360
+#define TEGRA264_CLK_MGBE0_RX_M				361
+#define TEGRA264_CLK_MGBE1_UPHY1_PLL_TXREF		362
+#define TEGRA264_CLK_MGBE1_TX				363
+#define TEGRA264_CLK_MGBE1_TX_M				364
+#define TEGRA264_CLK_MGBE1_RX_PCS_IN			365
+#define TEGRA264_CLK_MGBE1_RX_PCS_M			366
+#define TEGRA264_CLK_MGBE1_RX_IN			367
+#define TEGRA264_CLK_MGBE1_RX_M				368
+#define TEGRA264_CLK_MGBE2_UPHY1_PLL_TXREF		369
+#define TEGRA264_CLK_MGBE2_TX				370
+#define TEGRA264_CLK_MGBE2_TX_M				371
+#define TEGRA264_CLK_MGBE2_RX_PCS_IN			372
+#define TEGRA264_CLK_MGBE2_RX_PCS_M			373
+#define TEGRA264_CLK_MGBE2_RX_IN			374
+#define TEGRA264_CLK_MGBE2_RX_M				375
+#define TEGRA264_CLK_MGBE3_UPHY1_PLL_TXREF		376
+#define TEGRA264_CLK_MGBE3_TX				377
+#define TEGRA264_CLK_MGBE3_TX_M				378
+#define TEGRA264_CLK_MGBE3_RX_PCS_IN			379
+#define TEGRA264_CLK_MGBE3_RX_PCS_M			380
+#define TEGRA264_CLK_MGBE3_RX_IN			381
+#define TEGRA264_CLK_MGBE3_RX_M				382
+#define TEGRA264_CLK_UPHY0_USB_P0_TX_CORE		383
+#define TEGRA264_CLK_UPHY0_USB_P1_TX_CORE		384
+#define TEGRA264_CLK_UPHY0_USB_P2_TX_CORE		385
+#define TEGRA264_CLK_UPHY0_USB_P3_TX_CORE		386
+#define TEGRA264_CLK_UPHY0_USB_P0_TX			387
+#define TEGRA264_CLK_UPHY0_USB_P1_TX			388
+#define TEGRA264_CLK_UPHY0_USB_P2_TX			389
+#define TEGRA264_CLK_UPHY0_USB_P3_TX			390
+#define TEGRA264_CLK_UPHY0_USB_P0_RX_IN			391
+#define TEGRA264_CLK_UPHY0_USB_P1_RX_IN			392
+#define TEGRA264_CLK_UPHY0_USB_P2_RX_IN			393
+#define TEGRA264_CLK_UPHY0_USB_P3_RX_IN			394
+#define TEGRA264_CLK_UPHY0_USB_P0_RX_M			395
+#define TEGRA264_CLK_UPHY0_USB_P1_RX_M			396
+#define TEGRA264_CLK_UPHY0_USB_P2_RX_M			397
+#define TEGRA264_CLK_UPHY0_USB_P3_RX_M			398
+#define TEGRA264_CLK_UPHY0_LANE0_TX_M			399
+#define TEGRA264_CLK_PCIE_C1_XCLK_NOBG_M		400
+#define TEGRA264_CLK_PCIE_C2_XCLK_NOBG_M		401
+#define TEGRA264_CLK_PCIE_C3_XCLK_NOBG_M		402
+#define TEGRA264_CLK_PCIE_C4_XCLK_NOBG_M		403
+#define TEGRA264_CLK_PCIE_C5_XCLK_NOBG_M		404
+#define TEGRA264_CLK_PCIE_C1_L0_RX_M			405
+#define TEGRA264_CLK_PCIE_C1_L1_RX_M			406
+#define TEGRA264_CLK_PCIE_C1_L2_RX_M			407
+#define TEGRA264_CLK_PCIE_C1_L3_RX_M			408
+#define TEGRA264_CLK_PCIE_C2_L0_RX_M			409
+#define TEGRA264_CLK_PCIE_C2_L1_RX_M			410
+#define TEGRA264_CLK_PCIE_C2_L2_RX_M			411
+#define TEGRA264_CLK_PCIE_C2_L3_RX_M			412
+#define TEGRA264_CLK_PCIE_C3_L0_RX_M			413
+#define TEGRA264_CLK_PCIE_C3_L1_RX_M			414
+#define TEGRA264_CLK_PCIE_C4_L0_RX_M			415
+#define TEGRA264_CLK_PCIE_C4_L1_RX_M			416
+#define TEGRA264_CLK_PCIE_C4_L2_RX_M			417
+#define TEGRA264_CLK_PCIE_C4_L3_RX_M			418
+#define TEGRA264_CLK_PCIE_C4_L4_RX_M			419
+#define TEGRA264_CLK_PCIE_C4_L5_RX_M			420
+#define TEGRA264_CLK_PCIE_C4_L6_RX_M			421
+#define TEGRA264_CLK_PCIE_C4_L7_RX_M			422
+#define TEGRA264_CLK_PCIE_C5_L0_RX_M			423
+#define TEGRA264_CLK_PCIE_C5_L1_RX_M			424
+#define TEGRA264_CLK_PCIE_C5_L2_RX_M			425
+#define TEGRA264_CLK_PCIE_C5_L3_RX_M			426
+#define TEGRA264_CLK_MPHY_L0_RX_PWM_BIT_M		427
+#define TEGRA264_CLK_MPHY_L1_RX_PWM_BIT_M		428
+#define TEGRA264_CLK_DBB_UPHY0				429
+#define TEGRA264_CLK_UPHY0_UXL_CORE			430
+#define TEGRA264_CLK_ISC_CPU_ROOT			431
+#define TEGRA264_CLK_ISC_NIC				432
+#define TEGRA264_CLK_CTC_TXCLK0_M			433
+#define TEGRA264_CLK_CTC_TXCLK1_M			434
+#define TEGRA264_CLK_CTC_RXCLK0_M			435
+#define TEGRA264_CLK_CTC_RXCLK1_M			436
+#define TEGRA264_CLK_PLLREFGP_OUT			437
+#define TEGRA264_CLK_PLLREFGP_OUT1			438
+#define TEGRA264_CLK_GPU_SYS				439
+#define TEGRA264_CLK_GPU_NVD				440
+#define TEGRA264_CLK_GPU_UPROC				441
+#define TEGRA264_CLK_GPU_GPC0				442
+#define TEGRA264_CLK_GPU_GPC1				443
+#define TEGRA264_CLK_GPU_GPC2				444
+#define TEGRA264_CLK_PLLX				445
+#define TEGRA264_CLK_APE_SOUNDWIRE_MSRC0		446
+#define TEGRA264_CLK_APE_SOUNDWIRE_DATA_EN_SHAPER	447
+#define TEGRA264_CLK_AO_SOUNDWIRE_MSRC0			448
+#define TEGRA264_CLK_AO_SOUNDWIRE_DATA_EN_SHAPER	449
+#define TEGRA264_CLK_MGBE0_TX_SER			459
+#define TEGRA264_CLK_MGBE1_TX_SER			460
+#define TEGRA264_CLK_MGBE2_TX_SER			461
+#define TEGRA264_CLK_MGBE3_TX_SER			462
+#define TEGRA264_CLK_MGBE0_RX_SER			463
+#define TEGRA264_CLK_MGBE1_RX_SER			464
+#define TEGRA264_CLK_MGBE2_RX_SER			465
+#define TEGRA264_CLK_MGBE3_RX_SER			466
+#define TEGRA264_CLK_DPAUX				467
+
+#endif /* DT_BINDINGS_CLOCK_NVIDIA_TEGRA264_H */
diff --git a/include/dt-bindings/reset/nvidia,tegra264.h b/include/dt-bindings/reset/nvidia,tegra264.h
new file mode 100644
index 000000000000..a61a56bb232b
--- /dev/null
+++ b/include/dt-bindings/reset/nvidia,tegra264.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/* Copyright (c) 2022-2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef DT_BINDINGS_RESET_NVIDIA_TEGRA264_H
+#define DT_BINDINGS_RESET_NVIDIA_TEGRA264_H
+
+#define TEGRA264_RESET_APE_TKE			1
+#define TEGRA264_RESET_CEC			2
+#define TEGRA264_RESET_ADSP_ALL			3
+#define TEGRA264_RESET_RCE_ALL			4
+#define TEGRA264_RESET_UFSHC			5
+#define TEGRA264_RESET_UFSHC_AXI_M		6
+#define TEGRA264_RESET_UFSHC_LP_SEQ		7
+#define TEGRA264_RESET_DPAUX			8
+#define TEGRA264_RESET_EQOS_PCS			9
+#define TEGRA264_RESET_HWPM			10
+#define TEGRA264_RESET_I2C1			11
+#define TEGRA264_RESET_I2C2			12
+#define TEGRA264_RESET_I2C3			13
+#define TEGRA264_RESET_I2C4			14
+#define TEGRA264_RESET_I2C6			15
+#define TEGRA264_RESET_I2C7			16
+#define TEGRA264_RESET_I2C8			17
+#define TEGRA264_RESET_I2C9			18
+#define TEGRA264_RESET_ISP			19
+#define TEGRA264_RESET_LA			20
+#define TEGRA264_RESET_NVCSI			21
+#define TEGRA264_RESET_EQOS_MAC			22
+#define TEGRA264_RESET_PWM10			23
+#define TEGRA264_RESET_PWM2			24
+#define TEGRA264_RESET_PWM3			25
+#define TEGRA264_RESET_PWM4			26
+#define TEGRA264_RESET_PWM5			27
+#define TEGRA264_RESET_PWM9			28
+#define TEGRA264_RESET_QSPI0			29
+#define TEGRA264_RESET_HDA			30
+#define TEGRA264_RESET_HDACODEC			31
+#define TEGRA264_RESET_I2C0			32
+#define TEGRA264_RESET_I2C10			33
+#define TEGRA264_RESET_SDMMC1			34
+#define TEGRA264_RESET_MIPI_CAL			35
+#define TEGRA264_RESET_SPI1			36
+#define TEGRA264_RESET_SPI2			37
+#define TEGRA264_RESET_SPI3			38
+#define TEGRA264_RESET_SPI4			39
+#define TEGRA264_RESET_SPI5			40
+#define TEGRA264_RESET_SPI7			41
+#define TEGRA264_RESET_SPI8			42
+#define TEGRA264_RESET_SPI9			43
+#define TEGRA264_RESET_TACH0			44
+#define TEGRA264_RESET_TSEC			45
+#define TEGRA264_RESET_VI			46
+#define TEGRA264_RESET_VI1			47
+#define TEGRA264_RESET_PVA0_ALL			48
+#define TEGRA264_RESET_VIC			49
+#define TEGRA264_RESET_MPHY_CLK_CTL		50
+#define TEGRA264_RESET_MPHY_L0_RX		51
+#define TEGRA264_RESET_MPHY_L0_TX		52
+#define TEGRA264_RESET_MPHY_L1_RX		53
+#define TEGRA264_RESET_MPHY_L1_TX		54
+#define TEGRA264_RESET_ISP1			55
+#define TEGRA264_RESET_I2C11			56
+#define TEGRA264_RESET_I2C12			57
+#define TEGRA264_RESET_I2C14			58
+#define TEGRA264_RESET_I2C15			59
+#define TEGRA264_RESET_I2C16			60
+#define TEGRA264_RESET_EQOS_MACSEC		61
+#define TEGRA264_RESET_MGBE0_PCS		62
+#define TEGRA264_RESET_MGBE0_MAC		63
+#define TEGRA264_RESET_MGBE0_MACSEC		64
+#define TEGRA264_RESET_MGBE1_PCS		65
+#define TEGRA264_RESET_MGBE1_MAC		66
+#define TEGRA264_RESET_MGBE1_MACSEC		67
+#define TEGRA264_RESET_MGBE2_PCS		68
+#define TEGRA264_RESET_MGBE2_MAC		69
+#define TEGRA264_RESET_MGBE2_MACSEC		70
+#define TEGRA264_RESET_MGBE3_PCS		71
+#define TEGRA264_RESET_MGBE3_MAC		72
+#define TEGRA264_RESET_MGBE3_MACSEC		73
+#define TEGRA264_RESET_ADSP_CORE0		74
+#define TEGRA264_RESET_ADSP_CORE1		75
+#define TEGRA264_RESET_APE			76
+#define TEGRA264_RESET_XUSB1_PADCTL		77
+#define TEGRA264_RESET_AON_CPU_ALL		78
+#define TEGRA264_RESET_AON_HSP			79
+#define TEGRA264_RESET_UART4			80
+#define TEGRA264_RESET_UART5			81
+#define TEGRA264_RESET_UART9			82
+#define TEGRA264_RESET_UART10			83
+#define TEGRA264_RESET_UART8			84
+
+#endif /* DT_BINDINGS_RESET_NVIDIA_TEGRA264_H */
-- 
2.50.0



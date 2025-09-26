Return-Path: <linux-tegra+bounces-9513-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E831BA2C9D
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Sep 2025 09:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C9D46278C5
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Sep 2025 07:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E12F28980A;
	Fri, 26 Sep 2025 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mH8zptJD"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5391F285C80
	for <linux-tegra@vger.kernel.org>; Fri, 26 Sep 2025 07:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758871824; cv=none; b=nBrleYKLuemp934y385Lj0RTrDFlU6KSu9m68qnQeOY+AsRnwj3CcCLAJLTSXViZ0IppHHOa8FGbdOnVWZVBGWMTAMSMc6m7m6TSg6W5W8K9Y/Qn3LIDEO7drteIE/322xmUmTIdLppTIloQUEOo+e2XfsEPbJY+BNlv2q2Vd/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758871824; c=relaxed/simple;
	bh=lihxpIMyiYQyOiFumHF1rN7h6XSKOa+ADOFBNYBSWmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OUExDxwVA/Oz4mNQ03kzw6nPt2WmHiein9YEO3VlHnfdDlw2/OrqTTVBeahikp/MCHIInfdkOUe/NfZmELieRb9916LI0VCEWLfRMGjKFk4y72qAWMVuPaXglIW50KQPFLbgtM533UKFNyij2HUQekV9uw6l9bj9TzAwbUw2zjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mH8zptJD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-267facf9b58so14238765ad.2
        for <linux-tegra@vger.kernel.org>; Fri, 26 Sep 2025 00:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758871821; x=1759476621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrOxWiHrOu/Wl7h0gaVf9cIOyykBhAug5LCU/y/0I4Q=;
        b=mH8zptJD5OIZKuNRUq4+3H1Cotw557egOPZMko7dWKrKqAIxi+bCuLzQpTeo3DsnZa
         LUneR4DQQUR4LqwBlHqto+98esYr+r5WnqH9ICcpswbs5q851+3kc2Vw70tKJk9kU2x2
         pTSdK/w15bdWFgLi6HX++XwH2HfjzqBBb7oLMOBFpbM8PJbBVGxXWnB/PKDjfuVAunc8
         X5pcDVfGIVp3d4wVdRsXY37AdTV9i89zecVraIAIEs7nxzcL1k4rJFfl+3DHYuQxoSyT
         FS4DK3AzlfRlUVgWB1jRvrq3qc097vJj9+c8OMN7jg+ZeaMPD0VUgyXVdZY9HZ1/xq2a
         uIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871821; x=1759476621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrOxWiHrOu/Wl7h0gaVf9cIOyykBhAug5LCU/y/0I4Q=;
        b=T2a/7E928KJ+y7tzrQw8nmK6ixuaYkSz59HPU8x6OUnyhyaip1fLyebW6u2hMimIvc
         P4uwDRZDYC3LqGkQVHoq2XC5dvBjxVGMKyzHoFCPq2JQ4BMucWxdFrpYMcFvnGPu6Lgq
         LgGVYbjj894RJOvJMXm0+4dD5tQHvLS7qCr7bf5P4lzQFyzOC/6eKSzAn0Fq+vFgth6k
         LkYzh/LIcN0QqLp/4bZjQ1owFMnSKXAjbPrWfe73YySdHf9IahLjrlW1LH/dWiC3FMsC
         puMwLg9eHmokMEWahwDhDRHNnD4Cm5fVTQDAWmHlIeBGS8lsS/TEqSoNfe+LHsHoBEtv
         HY2g==
X-Forwarded-Encrypted: i=1; AJvYcCUl+oo/gmJXkq8mWSsTn/39C+8OvdG/pzqO4gBjyt+qcTlfb9vqxLIf20C9DY5ZViWa3NezTZuypyvTGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXWGYkSTyk5DGr2ELP1GOCo5Ao8di+/l84vS+uO7o2ZyXMRz/a
	PkJB6/96adJL1MbLhG+w601+/W8Zaic9rSQG12p9WCy6XSJrlsMKQPvq
X-Gm-Gg: ASbGnctSa65DfRKBhsKbWeDqxArGIemAFIYwvQgtN2JVMpeyDlpLuLZPFb1+DhAju4A
	t7ofMwpRzeVFn0/FxI8QzTZmnMoQiaHheyHdRUAvp2AYjSRbOd/OIn2YCUrFmRkUMkeUEzadrUU
	me0NAt7ULL8QEUi/S3tmeos/Jd3s4N0qeAxyfWgzhUwm1pFvc1x/olSGvBUW8iWy355uVNNxGg3
	z2hXsisRFOCfsO9fZK8ei3zMR3/UespumjdhkRyRd04HWW4kvIY7U5mSwGExq+TKoqSDC5wpDvb
	RYwjSkGbI9NezaegPIELfkdUgyv335sVhglHf/0ne/gHDpLvzpxS9Ppu9MDFLNe8Lh82kFGFxj1
	4zO9pENonRHVRkN6FL0xe
X-Google-Smtp-Source: AGHT+IE+CU63RMRJ3Okrq3A6S2HUdCCZU8QN3LT/sYHTcNpsGnNXxTUjqoCCTa+kQD0qqNn6+qTeOg==
X-Received: by 2002:a17:903:b47:b0:25c:ae94:f49e with SMTP id d9443c01a7336-27ed4a91f06mr65238255ad.37.1758871820534;
        Fri, 26 Sep 2025 00:30:20 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69a98b9sm44083065ad.111.2025.09.26.00.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:30:19 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-pci@vger.kernel.org (open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 4/5] PCI: tegra: Use BIT() and GENMASK() macros for register definitions
Date: Fri, 26 Sep 2025 12:57:45 +0530
Message-ID: <20250926072905.126737-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250926072905.126737-1-linux.amoon@gmail.com>
References: <20250926072905.126737-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace opencode masking and shifting bit operations with standard BIT()
and GENMASK() macros. This improves code readability and maintainability
by removing magic numbers and resolving checkpatch.pl warnings.

Cc: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: New patch in this series
---
 drivers/pci/controller/pci-tegra.c | 129 +++++++++++++++--------------
 1 file changed, 65 insertions(+), 64 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index b0056818a203..02cee0763396 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -13,6 +13,7 @@
  * Author: Thierry Reding <treding@nvidia.com>
  */
 
+#include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -84,17 +85,17 @@
 #define AFI_MSI_EN_VEC(x)	(0x8c + ((x) * 4))
 
 #define AFI_CONFIGURATION		0xac
-#define  AFI_CONFIGURATION_EN_FPCI		(1 << 0)
-#define  AFI_CONFIGURATION_CLKEN_OVERRIDE	(1 << 31)
+#define  AFI_CONFIGURATION_EN_FPCI		BIT(0)
+#define  AFI_CONFIGURATION_CLKEN_OVERRIDE	BIT(31)
 
 #define AFI_FPCI_ERROR_MASKS	0xb0
 
 #define AFI_INTR_MASK		0xb4
-#define  AFI_INTR_MASK_INT_MASK	(1 << 0)
-#define  AFI_INTR_MASK_MSI_MASK	(1 << 8)
+#define  AFI_INTR_MASK_INT_MASK	BIT(0)
+#define  AFI_INTR_MASK_MSI_MASK	BIT(8)
 
 #define AFI_INTR_CODE			0xb8
-#define  AFI_INTR_CODE_MASK		0xf
+#define  AFI_INTR_CODE_MASK		GENMASK(3, 0)
 #define  AFI_INTR_INI_SLAVE_ERROR	1
 #define  AFI_INTR_INI_DECODE_ERROR	2
 #define  AFI_INTR_TARGET_ABORT		3
@@ -113,32 +114,32 @@
 #define AFI_INTR_SIGNATURE	0xbc
 #define AFI_UPPER_FPCI_ADDRESS	0xc0
 #define AFI_SM_INTR_ENABLE	0xc4
-#define  AFI_SM_INTR_INTA_ASSERT	(1 << 0)
-#define  AFI_SM_INTR_INTB_ASSERT	(1 << 1)
-#define  AFI_SM_INTR_INTC_ASSERT	(1 << 2)
-#define  AFI_SM_INTR_INTD_ASSERT	(1 << 3)
-#define  AFI_SM_INTR_INTA_DEASSERT	(1 << 4)
-#define  AFI_SM_INTR_INTB_DEASSERT	(1 << 5)
-#define  AFI_SM_INTR_INTC_DEASSERT	(1 << 6)
-#define  AFI_SM_INTR_INTD_DEASSERT	(1 << 7)
+#define  AFI_SM_INTR_INTA_ASSERT	BIT(0)
+#define  AFI_SM_INTR_INTB_ASSERT	BIT(1)
+#define  AFI_SM_INTR_INTC_ASSERT	BIT(2)
+#define  AFI_SM_INTR_INTD_ASSERT	BIT(3)
+#define  AFI_SM_INTR_INTA_DEASSERT	BIT(4)
+#define  AFI_SM_INTR_INTB_DEASSERT	BIT(5)
+#define  AFI_SM_INTR_INTC_DEASSERT	BIT(6)
+#define  AFI_SM_INTR_INTD_DEASSERT	BIT(7)
 
 #define AFI_AFI_INTR_ENABLE		0xc8
-#define  AFI_INTR_EN_INI_SLVERR		(1 << 0)
-#define  AFI_INTR_EN_INI_DECERR		(1 << 1)
-#define  AFI_INTR_EN_TGT_SLVERR		(1 << 2)
-#define  AFI_INTR_EN_TGT_DECERR		(1 << 3)
-#define  AFI_INTR_EN_TGT_WRERR		(1 << 4)
-#define  AFI_INTR_EN_DFPCI_DECERR	(1 << 5)
-#define  AFI_INTR_EN_AXI_DECERR		(1 << 6)
-#define  AFI_INTR_EN_FPCI_TIMEOUT	(1 << 7)
-#define  AFI_INTR_EN_PRSNT_SENSE	(1 << 8)
+#define  AFI_INTR_EN_INI_SLVERR		BIT(0)
+#define  AFI_INTR_EN_INI_DECERR		BIT(1)
+#define  AFI_INTR_EN_TGT_SLVERR		BIT(2)
+#define  AFI_INTR_EN_TGT_DECERR		BIT(3)
+#define  AFI_INTR_EN_TGT_WRERR		BIT(4)
+#define  AFI_INTR_EN_DFPCI_DECERR	BIT(5)
+#define  AFI_INTR_EN_AXI_DECERR		BIT(6)
+#define  AFI_INTR_EN_FPCI_TIMEOUT	BIT(7)
+#define  AFI_INTR_EN_PRSNT_SENSE	BIT(8)
 
 #define AFI_PCIE_PME		0xf0
 
 #define AFI_PCIE_CONFIG					0x0f8
-#define  AFI_PCIE_CONFIG_PCIE_DISABLE(x)		(1 << ((x) + 1))
-#define  AFI_PCIE_CONFIG_PCIE_DISABLE_ALL		0xe
-#define  AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_MASK	(0xf << 20)
+#define  AFI_PCIE_CONFIG_PCIE_DISABLE(x)		BIT((x) + 1)
+#define  AFI_PCIE_CONFIG_PCIE_DISABLE_ALL		GENMASK(3, 1)
+#define  AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_MASK	GENMASK(23, 20)
 #define  AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_SINGLE	(0x0 << 20)
 #define  AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_420	(0x0 << 20)
 #define  AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_X2_X1	(0x0 << 20)
@@ -149,79 +150,79 @@
 #define  AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_211	(0x1 << 20)
 #define  AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_411	(0x2 << 20)
 #define  AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_111	(0x2 << 20)
-#define  AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO(x)		(1 << ((x) + 29))
-#define  AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO_ALL		(0x7 << 29)
+#define  AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO(x)		BIT((x) + 29)
+#define  AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO_ALL		GENMASK(31, 29)
 
 #define AFI_FUSE			0x104
-#define  AFI_FUSE_PCIE_T0_GEN2_DIS	(1 << 2)
+#define  AFI_FUSE_PCIE_T0_GEN2_DIS	BIT(2)
 
 #define AFI_PEX0_CTRL			0x110
 #define AFI_PEX1_CTRL			0x118
-#define  AFI_PEX_CTRL_RST		(1 << 0)
-#define  AFI_PEX_CTRL_CLKREQ_EN		(1 << 1)
-#define  AFI_PEX_CTRL_REFCLK_EN		(1 << 3)
-#define  AFI_PEX_CTRL_OVERRIDE_EN	(1 << 4)
+#define  AFI_PEX_CTRL_RST		BIT(0)
+#define  AFI_PEX_CTRL_CLKREQ_EN		BIT(1)
+#define  AFI_PEX_CTRL_REFCLK_EN		BIT(3)
+#define  AFI_PEX_CTRL_OVERRIDE_EN	BIT(4)
 
 #define AFI_PLLE_CONTROL		0x160
-#define  AFI_PLLE_CONTROL_BYPASS_PADS2PLLE_CONTROL (1 << 9)
-#define  AFI_PLLE_CONTROL_PADS2PLLE_CONTROL_EN (1 << 1)
+#define  AFI_PLLE_CONTROL_BYPASS_PADS2PLLE_CONTROL BIT(9)
+#define  AFI_PLLE_CONTROL_PADS2PLLE_CONTROL_EN BIT(1)
 
 #define AFI_PEXBIAS_CTRL_0		0x168
 
 #define RP_ECTL_2_R1	0x00000e84
-#define  RP_ECTL_2_R1_RX_CTLE_1C_MASK		0xffff
+#define  RP_ECTL_2_R1_RX_CTLE_1C_MASK		GENMASK(15, 0)
 
 #define RP_ECTL_4_R1	0x00000e8c
-#define  RP_ECTL_4_R1_RX_CDR_CTRL_1C_MASK	(0xffff << 16)
+#define  RP_ECTL_4_R1_RX_CDR_CTRL_1C_MASK	GENMASK(31, 16)
 #define  RP_ECTL_4_R1_RX_CDR_CTRL_1C_SHIFT	16
 
 #define RP_ECTL_5_R1	0x00000e90
-#define  RP_ECTL_5_R1_RX_EQ_CTRL_L_1C_MASK	0xffffffff
+#define  RP_ECTL_5_R1_RX_EQ_CTRL_L_1C_MASK	GENMASK(31, 0)
 
 #define RP_ECTL_6_R1	0x00000e94
-#define  RP_ECTL_6_R1_RX_EQ_CTRL_H_1C_MASK	0xffffffff
+#define  RP_ECTL_6_R1_RX_EQ_CTRL_H_1C_MASK	GENMASK(31, 0)
 
 #define RP_ECTL_2_R2	0x00000ea4
 #define  RP_ECTL_2_R2_RX_CTLE_1C_MASK	0xffff
 
 #define RP_ECTL_4_R2	0x00000eac
-#define  RP_ECTL_4_R2_RX_CDR_CTRL_1C_MASK	(0xffff << 16)
+#define  RP_ECTL_4_R2_RX_CDR_CTRL_1C_MASK	GENMASK(31, 16)
 #define  RP_ECTL_4_R2_RX_CDR_CTRL_1C_SHIFT	16
 
 #define RP_ECTL_5_R2	0x00000eb0
-#define  RP_ECTL_5_R2_RX_EQ_CTRL_L_1C_MASK	0xffffffff
+#define  RP_ECTL_5_R2_RX_EQ_CTRL_L_1C_MASK	GENMASK(31, 0)
 
 #define RP_ECTL_6_R2	0x00000eb4
-#define  RP_ECTL_6_R2_RX_EQ_CTRL_H_1C_MASK	0xffffffff
+#define  RP_ECTL_6_R2_RX_EQ_CTRL_H_1C_MASK	GENMASK(31, 0)
 
 #define RP_VEND_XP	0x00000f00
-#define  RP_VEND_XP_DL_UP			(1 << 30)
-#define  RP_VEND_XP_OPPORTUNISTIC_ACK		(1 << 27)
-#define  RP_VEND_XP_OPPORTUNISTIC_UPDATEFC	(1 << 28)
-#define  RP_VEND_XP_UPDATE_FC_THRESHOLD_MASK	(0xff << 18)
+#define  RP_VEND_XP_DL_UP			BIT(30)
+#define  RP_VEND_XP_OPPORTUNISTIC_ACK		BIT(27)
+#define  RP_VEND_XP_OPPORTUNISTIC_UPDATEFC	BIT(28)
+#define  RP_VEND_XP_UPDATE_FC_THRESHOLD_MASK	GENMASK(25, 18)
 
 #define RP_VEND_CTL0	0x00000f44
-#define  RP_VEND_CTL0_DSK_RST_PULSE_WIDTH_MASK	(0xf << 12)
+#define  RP_VEND_CTL0_DSK_RST_PULSE_WIDTH_MASK	GENMASK(15, 12)
 #define  RP_VEND_CTL0_DSK_RST_PULSE_WIDTH	(0x9 << 12)
 
 #define RP_VEND_CTL1	0x00000f48
-#define  RP_VEND_CTL1_ERPT	(1 << 13)
+#define  RP_VEND_CTL1_ERPT	BIT(13)
 
 #define RP_VEND_XP_BIST	0x00000f4c
-#define  RP_VEND_XP_BIST_GOTO_L1_L2_AFTER_DLLP_DONE	(1 << 28)
+#define  RP_VEND_XP_BIST_GOTO_L1_L2_AFTER_DLLP_DONE	BIT(28)
 
 #define RP_VEND_CTL2 0x00000fa8
-#define  RP_VEND_CTL2_PCA_ENABLE (1 << 7)
+#define  RP_VEND_CTL2_PCA_ENABLE BIT(7)
 
 #define RP_PRIV_MISC	0x00000fe0
-#define  RP_PRIV_MISC_PRSNT_MAP_EP_PRSNT		(0xe << 0)
-#define  RP_PRIV_MISC_PRSNT_MAP_EP_ABSNT		(0xf << 0)
-#define  RP_PRIV_MISC_CTLR_CLK_CLAMP_THRESHOLD_MASK	(0x7f << 16)
+#define  RP_PRIV_MISC_PRSNT_MAP_EP_PRSNT		GENMASK(3, 1)
+#define  RP_PRIV_MISC_PRSNT_MAP_EP_ABSNT		GENMASK(3, 0)
+#define  RP_PRIV_MISC_CTLR_CLK_CLAMP_THRESHOLD_MASK	GENMASK(22, 16)
 #define  RP_PRIV_MISC_CTLR_CLK_CLAMP_THRESHOLD		(0xf << 16)
-#define  RP_PRIV_MISC_CTLR_CLK_CLAMP_ENABLE		(1 << 23)
-#define  RP_PRIV_MISC_TMS_CLK_CLAMP_THRESHOLD_MASK	(0x7f << 24)
+#define  RP_PRIV_MISC_CTLR_CLK_CLAMP_ENABLE		BIT(23)
+#define  RP_PRIV_MISC_TMS_CLK_CLAMP_THRESHOLD_MASK	GENMASK(30, 24)
 #define  RP_PRIV_MISC_TMS_CLK_CLAMP_THRESHOLD		(0xf << 24)
-#define  RP_PRIV_MISC_TMS_CLK_CLAMP_ENABLE		(1 << 31)
+#define  RP_PRIV_MISC_TMS_CLK_CLAMP_ENABLE		BIT(31)
 
 #define RP_LINK_CONTROL_STATUS			0x00000090
 #define  RP_LINK_CONTROL_STATUS_DL_LINK_ACTIVE	0x20000000
@@ -232,22 +233,22 @@
 #define PADS_CTL_SEL		0x0000009c
 
 #define PADS_CTL		0x000000a0
-#define  PADS_CTL_IDDQ_1L	(1 << 0)
-#define  PADS_CTL_TX_DATA_EN_1L	(1 << 6)
-#define  PADS_CTL_RX_DATA_EN_1L	(1 << 10)
+#define  PADS_CTL_IDDQ_1L	BIT(0)
+#define  PADS_CTL_TX_DATA_EN_1L	BIT(6)
+#define  PADS_CTL_RX_DATA_EN_1L	BIT(10)
 
 #define PADS_PLL_CTL_TEGRA20			0x000000b8
 #define PADS_PLL_CTL_TEGRA30			0x000000b4
-#define  PADS_PLL_CTL_RST_B4SM			(1 << 1)
-#define  PADS_PLL_CTL_LOCKDET			(1 << 8)
-#define  PADS_PLL_CTL_REFCLK_MASK		(0x3 << 16)
+#define  PADS_PLL_CTL_RST_B4SM			BIT(1)
+#define  PADS_PLL_CTL_LOCKDET			BIT(8)
+#define  PADS_PLL_CTL_REFCLK_MASK		GENMASK(17, 16)
 #define  PADS_PLL_CTL_REFCLK_INTERNAL_CML	(0 << 16)
-#define  PADS_PLL_CTL_REFCLK_INTERNAL_CMOS	(1 << 16)
+#define  PADS_PLL_CTL_REFCLK_INTERNAL_CMOS	BIT(16)
 #define  PADS_PLL_CTL_REFCLK_EXTERNAL		(2 << 16)
 #define  PADS_PLL_CTL_TXCLKREF_MASK		(0x1 << 20)
 #define  PADS_PLL_CTL_TXCLKREF_DIV10		(0 << 20)
-#define  PADS_PLL_CTL_TXCLKREF_DIV5		(1 << 20)
-#define  PADS_PLL_CTL_TXCLKREF_BUF_EN		(1 << 22)
+#define  PADS_PLL_CTL_TXCLKREF_DIV5		BIT(20)
+#define  PADS_PLL_CTL_TXCLKREF_BUF_EN		BIT(22)
 
 #define PADS_REFCLK_CFG0			0x000000c8
 #define PADS_REFCLK_CFG1			0x000000cc
-- 
2.50.1



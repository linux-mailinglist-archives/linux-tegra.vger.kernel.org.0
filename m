Return-Path: <linux-tegra+bounces-8545-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31846B2E105
	for <lists+linux-tegra@lfdr.de>; Wed, 20 Aug 2025 17:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00041581B94
	for <lists+linux-tegra@lfdr.de>; Wed, 20 Aug 2025 15:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6B8343D97;
	Wed, 20 Aug 2025 15:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NazaG3bA"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16023431E9;
	Wed, 20 Aug 2025 15:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755702838; cv=none; b=iSXxR+k5HPmRBW37SeKKOkTM6KJiGOGzu3iLQpKBCDgXnfukhsu0RUQQYSngU+PBBm2Qw0e4omHi8P36CkxDNNH/1bzeEwdId75bYdQLVONo3M+1kf60PlIeBpjJRSfhJUR4hapeTMbLKQvvcxsA7y4jK+055uwaVcRAN9W101c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755702838; c=relaxed/simple;
	bh=ggJTxwuVc87/mZHwchOGPG25EuZl20cKTsm90v+Iq4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEBI2diRlOLvvJyV7UECeMpUGFibEFiR8EGgVp4EucMsYxziyp/BNtDBkeDwXss6PaX3GQZTa4Zjl8JMexQf819/jr+M7rMO5WvqOsme9dZUYcLjhipfNwDFsKmZ+FmM3OG0wym0Pu5+o4UdHXNjaIdynuLtP9ytcKMIsHS1LT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NazaG3bA; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7ace3baso1131596366b.3;
        Wed, 20 Aug 2025 08:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755702833; x=1756307633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JD8tOQTTtdC4jOAibu1mY4LM6JkABafsszS025rkn0I=;
        b=NazaG3bAjOsfDdxzno5crA46OgOob5Zf1dFTPLMIUpBIDI5e6XsOfkk3hfqJp98vsS
         a86YDHQbbBl6KOlDV1jbfEyVUapXBXxJf57myqhC6CSfiVAJCBSP0VXbdZ8nxia8gKzU
         ncAH5L5voxIzxrzlw3ORVQQsUIG+cHQ3cmxytvv6R6BlTe/CcHirJbo6JH3JMWp7cGjx
         jG7IEg9F5KK/ZN+4jHjsAJONIYx9zjq8/xgqxFYjogxWj8WF9jbzVogJWqpk3gJ45F8N
         XVh8Z/jnpU+WbPtWihDPJYWv8lWiBKE6bvhYJNQiqiy0It26b9+iTCaDJOG1wH4AgKAG
         ixmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755702833; x=1756307633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JD8tOQTTtdC4jOAibu1mY4LM6JkABafsszS025rkn0I=;
        b=E6x+zAJoEvUXO8bBQVE0PudKlLloyVtaaVtfSIw4fyAybFhjD8BYFbH+K7/AQo9XPL
         mGC0zJ2aWH/+yTAwJGpcGAdaKzPoeQXItx/StmAhUw7qpFxHMxN7waUk+R0RcUO6NfwP
         lPvFi3a6IQu+5kfD/5o4bzmcbPraaSjf3ML8klnf2iYeZL3opOia1zntgAmIrO4HbCoF
         uWE6+tYYf7FInlWInrEZ1CqJhrBtXn0F2xxIJStDNMvL9BscYBYoJjyzcYA4xoXGdsh4
         94XaIHpkKHAK/DEwcATFczkMmrNWE6VF9gY6seKvklW3CbjdNIBUPQ0NC+0dDPPqqqeK
         JjCA==
X-Forwarded-Encrypted: i=1; AJvYcCVl5p5YZ4bdQ1tC42HNVvw+xqmXxY2gzjJk3EKG6hc/8fgXFEjgjs9YI+w0TF912l+heFBVvMuil2XU@vger.kernel.org, AJvYcCWTJ3wm7n581XRt5qqopgnMQ5Id5Xg8ea9u2C7hUGHfiAJCGNvAj+Bb9jtAf0ibbeaWJVyxqM2nY7Toh5A=@vger.kernel.org, AJvYcCWuzc30yc0U1/Gfd6VSolpU0rUN0pJxvoxpqgM9KBtjnXRRWm5MXACVpyDNITU7+EzCmAKOEX7KRnxU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2rhOTalp/mXXpBwfonO9ieq8arG/udUFAq4Jd4OSSp7LAL7S7
	SMznH06SyfOGUbc+FQ8OkUr3GPQHTQolm08noZ2qNfbaEP/CG0lhVfRG
X-Gm-Gg: ASbGnctPOckX6niqoA+NNZz8hCsyz9wLo3TNzo/uqDexsDt61bh8a3GQbnr9WUQ/k+G
	tePRWJNfyKjviDYzL/0nFRLOKHQ2Ro/V4T/+h0892KOZQq77Mv1Jz98Z+zxFb0gqQ9vunfsG9r/
	G2rRs36rzTdch/DVr6OKWrHF8Bq2ktqoOmRcOa6OvjrJ7KDpP/EvW/Y7snRM+cWWFNwUiNLWqpg
	6hCjUYA1WflT9VC5GgEZMEos3HxHMebCuDksyHgpZE5T/uVe5vE2L4G+/VBLGCJrWAgsLA6eZuE
	OcV/eiN3CtHQiK6b2ivgc32tUwLUDYdvj67CB0c6vQAQteCDTn9pn0iUUKK0GsMw5HCKurWP3jX
	mdYcQYLoGnDcOuA==
X-Google-Smtp-Source: AGHT+IFdqoQKwYsaGBYbNniAuVKcnsRjfSVv00Q4A9ugvKGhaTYm7tozeVeg8zutV50YWsXi/RrajQ==
X-Received: by 2002:a17:906:c103:b0:ad5:74cd:1824 with SMTP id a640c23a62f3a-afdf01d402dmr320748466b.38.1755702832652;
        Wed, 20 Aug 2025 08:13:52 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdef1d34f8sm175905166b.83.2025.08.20.08.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:13:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 7/9] memory: tegra: Add Tegra114 EMC driver
Date: Wed, 20 Aug 2025 18:13:21 +0300
Message-ID: <20250820151323.167772-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250820151323.167772-1-clamor95@gmail.com>
References: <20250820151323.167772-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce driver for the External Memory Controller (EMC) found in Tegra114
SoC. It controls the external DRAM on the board. The purpose of this
driver is to program memory timing for external memory on the EMC clock
rate change.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/memory/tegra/Kconfig        |   12 +
 drivers/memory/tegra/Makefile       |    1 +
 drivers/memory/tegra/tegra114-emc.c | 1487 +++++++++++++++++++++++++++
 3 files changed, 1500 insertions(+)
 create mode 100644 drivers/memory/tegra/tegra114-emc.c

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index fc5a27791826..11e7cc357d39 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -35,6 +35,18 @@ config TEGRA30_EMC
 	  This driver is required to change memory timings / clock rate for
 	  external memory.
 
+config TEGRA114_EMC
+	tristate "NVIDIA Tegra114 External Memory Controller driver"
+	default y
+	depends on ARCH_TEGRA_114_SOC || COMPILE_TEST
+	select TEGRA124_CLK_EMC if ARCH_TEGRA
+	select PM_OPP
+	help
+	  This driver is for the External Memory Controller (EMC) found on
+	  Tegra114 chips. The EMC controls the external DRAM on the board.
+	  This driver is required to change memory timings / clock rate for
+	  external memory.
+
 config TEGRA124_EMC
 	tristate "NVIDIA Tegra124 External Memory Controller driver"
 	default ARCH_TEGRA_124_SOC
diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
index 0750847dac3c..d36be28efc4a 100644
--- a/drivers/memory/tegra/Makefile
+++ b/drivers/memory/tegra/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
 
 obj-$(CONFIG_TEGRA20_EMC)  += tegra20-emc.o
 obj-$(CONFIG_TEGRA30_EMC)  += tegra30-emc.o
+obj-$(CONFIG_TEGRA114_EMC) += tegra114-emc.o
 obj-$(CONFIG_TEGRA124_EMC) += tegra124-emc.o
 obj-$(CONFIG_TEGRA210_EMC_TABLE) += tegra210-emc-table.o
 obj-$(CONFIG_TEGRA210_EMC) += tegra210-emc.o
diff --git a/drivers/memory/tegra/tegra114-emc.c b/drivers/memory/tegra/tegra114-emc.c
new file mode 100644
index 000000000000..b986b5509f41
--- /dev/null
+++ b/drivers/memory/tegra/tegra114-emc.c
@@ -0,0 +1,1487 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Tegra114 External Memory Controller driver
+ *
+ * Based on downstream driver from NVIDIA and tegra124-emc.c
+ * Copyright (C) 2011-2014 NVIDIA Corporation
+ *
+ * Copyright (C) 2024 Svyatoslav Ryhel <clamor95@gmail.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/clk.h>
+#include <linux/clkdev.h>
+#include <linux/clk/tegra.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/interconnect-provider.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/sort.h>
+#include <linux/string.h>
+
+#include <soc/tegra/fuse.h>
+#include <soc/tegra/mc.h>
+
+#include "mc.h"
+
+#define EMC_INTSTATUS				0x0
+#define EMC_REFRESH_OVERFLOW_INT		BIT(3)
+#define EMC_INTSTATUS_CLKCHANGE_COMPLETE	BIT(4)
+
+#define EMC_INTMASK				0x4
+
+#define EMC_DBG					0x8
+#define EMC_DBG_READ_MUX_ASSEMBLY		BIT(0)
+#define EMC_DBG_WRITE_MUX_ACTIVE		BIT(1)
+#define EMC_DBG_FORCE_UPDATE			BIT(2)
+#define EMC_DBG_CFG_PRIORITY			BIT(24)
+
+#define EMC_CFG					0xc
+#define EMC_CFG_DRAM_CLKSTOP_PD			BIT(31)
+#define EMC_CFG_DRAM_CLKSTOP_SR			BIT(30)
+#define EMC_CFG_DRAM_ACPD			BIT(29)
+#define EMC_CFG_DYN_SREF			BIT(28)
+#define EMC_CFG_PWR_MASK			((0xF << 28) | BIT(18))
+#define EMC_CFG_DSR_VTTGEN_DRV_EN		BIT(18)
+
+#define EMC_ADR_CFG				0x10
+#define EMC_ADR_CFG_EMEM_NUMDEV			BIT(0)
+
+#define EMC_REFCTRL				0x20
+#define EMC_REFCTRL_DEV_SEL_SHIFT		0
+#define EMC_REFCTRL_ENABLE			BIT(31)
+
+#define EMC_TIMING_CONTROL			0x28
+#define EMC_RC					0x2c
+#define EMC_RFC					0x30
+#define EMC_RAS					0x34
+#define EMC_RP					0x38
+#define EMC_R2W					0x3c
+#define EMC_W2R					0x40
+#define EMC_R2P					0x44
+#define EMC_W2P					0x48
+#define EMC_RD_RCD				0x4c
+#define EMC_WR_RCD				0x50
+#define EMC_RRD					0x54
+#define EMC_REXT				0x58
+#define EMC_WDV					0x5c
+#define EMC_QUSE				0x60
+#define EMC_QRST				0x64
+#define EMC_QSAFE				0x68
+#define EMC_RDV					0x6c
+#define EMC_REFRESH				0x70
+#define EMC_BURST_REFRESH_NUM			0x74
+#define EMC_PDEX2WR				0x78
+#define EMC_PDEX2RD				0x7c
+#define EMC_PCHG2PDEN				0x80
+#define EMC_ACT2PDEN				0x84
+#define EMC_AR2PDEN				0x88
+#define EMC_RW2PDEN				0x8c
+#define EMC_TXSR				0x90
+#define EMC_TCKE				0x94
+#define EMC_TFAW				0x98
+#define EMC_TRPAB				0x9c
+#define EMC_TCLKSTABLE				0xa0
+#define EMC_TCLKSTOP				0xa4
+#define EMC_TREFBW				0xa8
+#define EMC_QUSE_EXTRA				0xac
+#define EMC_ODT_WRITE				0xb0
+#define EMC_ODT_READ				0xb4
+#define EMC_WEXT				0xb8
+#define EMC_CTT					0xbc
+#define EMC_RFC_SLR				0xc0
+#define EMC_MRS_WAIT_CNT2			0xc4
+
+#define EMC_MRS_WAIT_CNT			0xc8
+#define EMC_MRS_WAIT_CNT_SHORT_WAIT_SHIFT	0
+#define EMC_MRS_WAIT_CNT_SHORT_WAIT_MASK	\
+	(0x3FF << EMC_MRS_WAIT_CNT_SHORT_WAIT_SHIFT)
+#define EMC_MRS_WAIT_CNT_LONG_WAIT_SHIFT	16
+#define EMC_MRS_WAIT_CNT_LONG_WAIT_MASK		\
+	(0x3FF << EMC_MRS_WAIT_CNT_LONG_WAIT_SHIFT)
+
+#define EMC_MRS					0xcc
+#define EMC_MODE_SET_DLL_RESET			BIT(8)
+#define EMC_MODE_SET_LONG_CNT			BIT(26)
+#define EMC_EMRS				0xd0
+#define EMC_REF					0xd4
+#define EMC_PRE					0xd8
+
+#define EMC_SELF_REF				0xe0
+#define EMC_SELF_REF_CMD_ENABLED		BIT(0)
+#define EMC_SELF_REF_DEV_SEL_SHIFT		30
+
+#define EMC_MRW					0xe8
+
+#define EMC_MRR					0xec
+#define EMC_MRR_MA_SHIFT			16
+#define LPDDR2_MR4_TEMP_SHIFT			0
+
+#define EMC_XM2DQSPADCTRL3			0xf8
+#define EMC_FBIO_SPARE				0x100
+
+#define EMC_FBIO_CFG5				0x104
+#define	EMC_FBIO_CFG5_DRAM_TYPE_MASK		0x3
+#define	EMC_FBIO_CFG5_DRAM_TYPE_SHIFT		0
+
+#define EMC_FBIO_CFG6				0x114
+#define EMC_EMRS2				0x12c
+#define EMC_MRW2				0x134
+#define EMC_MRW4				0x13c
+#define EMC_EINPUT				0x14c
+#define EMC_EINPUT_DURATION			0x150
+#define EMC_PUTERM_EXTRA			0x154
+#define EMC_TCKESR				0x158
+#define EMC_TPD					0x15c
+
+#define EMC_AUTO_CAL_CONFIG			0x2a4
+#define EMC_AUTO_CAL_CONFIG_AUTO_CAL_START	BIT(31)
+#define EMC_AUTO_CAL_INTERVAL			0x2a8
+#define EMC_AUTO_CAL_STATUS			0x2ac
+#define EMC_AUTO_CAL_STATUS_ACTIVE		BIT(31)
+#define EMC_STATUS				0x2b4
+#define EMC_STATUS_TIMING_UPDATE_STALLED	BIT(23)
+
+#define EMC_CFG_2				0x2b8
+#define EMC_CLKCHANGE_REQ_ENABLE		BIT(0)
+#define EMC_CLKCHANGE_PD_ENABLE			BIT(1)
+#define EMC_CLKCHANGE_SR_ENABLE			BIT(2)
+
+#define EMC_CFG_DIG_DLL				0x2bc
+#define EMC_CFG_DIG_DLL_PERIOD			0x2c0
+#define EMC_RDV_MASK				0x2cc
+#define EMC_WDV_MASK				0x2d0
+#define EMC_CTT_DURATION			0x2d8
+#define EMC_CTT_TERM_CTRL			0x2dc
+#define EMC_ZCAL_INTERVAL			0x2e0
+#define EMC_ZCAL_WAIT_CNT			0x2e4
+
+#define EMC_ZQ_CAL				0x2ec
+#define EMC_ZQ_CAL_CMD				BIT(0)
+#define EMC_ZQ_CAL_LONG				BIT(4)
+#define EMC_ZQ_CAL_LONG_CMD_DEV0		\
+	(DRAM_DEV_SEL_0 | EMC_ZQ_CAL_LONG | EMC_ZQ_CAL_CMD)
+#define EMC_ZQ_CAL_LONG_CMD_DEV1		\
+	(DRAM_DEV_SEL_1 | EMC_ZQ_CAL_LONG | EMC_ZQ_CAL_CMD)
+
+#define EMC_XM2CMDPADCTRL			0x2f0
+#define EMC_XM2DQSPADCTRL			0x2f8
+#define EMC_XM2DQSPADCTRL2			0x2fc
+#define EMC_XM2DQSPADCTRL2_RX_FT_REC_ENABLE	BIT(0)
+#define EMC_XM2DQSPADCTRL2_VREF_ENABLE		BIT(5)
+#define EMC_XM2DQPADCTRL			0x300
+#define EMC_XM2DQPADCTRL2			0x304
+#define EMC_XM2CLKPADCTRL			0x308
+#define EMC_XM2COMPPADCTRL			0x30c
+#define EMC_XM2VTTGENPADCTRL			0x310
+#define EMC_XM2VTTGENPADCTRL2			0x314
+#define EMC_XM2QUSEPADCTRL			0x318
+#define EMC_XM2DQSPADCTRL4			0x320
+#define EMC_DLL_XFORM_DQS0			0x328
+#define EMC_DLL_XFORM_DQS1			0x32c
+#define EMC_DLL_XFORM_DQS2			0x330
+#define EMC_DLL_XFORM_DQS3			0x334
+#define EMC_DLL_XFORM_DQS4			0x338
+#define EMC_DLL_XFORM_DQS5			0x33c
+#define EMC_DLL_XFORM_DQS6			0x340
+#define EMC_DLL_XFORM_DQS7			0x344
+#define EMC_DLL_XFORM_QUSE0			0x348
+#define EMC_DLL_XFORM_QUSE1			0x34c
+#define EMC_DLL_XFORM_QUSE2			0x350
+#define EMC_DLL_XFORM_QUSE3			0x354
+#define EMC_DLL_XFORM_QUSE4			0x358
+#define EMC_DLL_XFORM_QUSE5			0x35c
+#define EMC_DLL_XFORM_QUSE6			0x360
+#define EMC_DLL_XFORM_QUSE7			0x364
+#define EMC_DLL_XFORM_DQ0			0x368
+#define EMC_DLL_XFORM_DQ1			0x36c
+#define EMC_DLL_XFORM_DQ2			0x370
+#define EMC_DLL_XFORM_DQ3			0x374
+#define EMC_DLI_TRIM_TXDQS0			0x3a8
+#define EMC_DLI_TRIM_TXDQS1			0x3ac
+#define EMC_DLI_TRIM_TXDQS2			0x3b0
+#define EMC_DLI_TRIM_TXDQS3			0x3b4
+#define EMC_DLI_TRIM_TXDQS4			0x3b8
+#define EMC_DLI_TRIM_TXDQS5			0x3bc
+#define EMC_DLI_TRIM_TXDQS6			0x3c0
+#define EMC_DLI_TRIM_TXDQS7			0x3c4
+#define EMC_STALL_THEN_EXE_AFTER_CLKCHANGE	0x3cc
+#define EMC_SEL_DPD_CTRL			0x3d8
+#define EMC_SEL_DPD_CTRL_DATA_SEL_DPD		BIT(8)
+#define EMC_SEL_DPD_CTRL_ODT_SEL_DPD		BIT(5)
+#define EMC_SEL_DPD_CTRL_RESET_SEL_DPD		BIT(4)
+#define EMC_SEL_DPD_CTRL_CA_SEL_DPD		BIT(3)
+#define EMC_SEL_DPD_CTRL_CLK_SEL_DPD		BIT(2)
+#define EMC_SEL_DPD_CTRL_DDR3_MASK	\
+	((0xf << 2) | BIT(8))
+#define EMC_SEL_DPD_CTRL_MASK \
+	((0x3 << 2) | BIT(5) | BIT(8))
+#define EMC_PRE_REFRESH_REQ_CNT			0x3dc
+#define EMC_DYN_SELF_REF_CONTROL		0x3e0
+#define EMC_TXSRDLL				0x3e4
+#define EMC_CCFIFO_ADDR				0x3e8
+#define EMC_CCFIFO_DATA				0x3ec
+#define EMC_CCFIFO_STATUS			0x3f0
+#define EMC_CDB_CNTL_1				0x3f4
+#define EMC_CDB_CNTL_2				0x3f8
+#define EMC_XM2CLKPADCTRL2			0x3fc
+#define EMC_AUTO_CAL_CONFIG2			0x458
+#define EMC_AUTO_CAL_CONFIG3			0x45c
+#define EMC_IBDLY				0x468
+#define EMC_DLL_XFORM_ADDR0			0x46c
+#define EMC_DLL_XFORM_ADDR1			0x470
+#define EMC_DLL_XFORM_ADDR2			0x474
+#define EMC_DSR_VTTGEN_DRV			0x47c
+#define EMC_TXDSRVTTGEN				0x480
+#define EMC_XM2CMDPADCTRL4			0x484
+
+#define DRAM_DEV_SEL_ALL			0
+#define DRAM_DEV_SEL_0				BIT(31)
+#define DRAM_DEV_SEL_1				BIT(30)
+
+#define EMC_CFG_POWER_FEATURES_MASK		\
+	(EMC_CFG_DYN_SREF | EMC_CFG_DRAM_ACPD | EMC_CFG_DRAM_CLKSTOP_SR | \
+	EMC_CFG_DRAM_CLKSTOP_PD | EMC_CFG_DSR_VTTGEN_DRV_EN)
+#define EMC_REFCTRL_DEV_SEL(n) ((((n) > 1) ? 0 : 2) << EMC_REFCTRL_DEV_SEL_SHIFT)
+#define EMC_DRAM_DEV_SEL(n) (((n) > 1) ? DRAM_DEV_SEL_ALL : DRAM_DEV_SEL_0)
+
+/* Maximum amount of time in us. to wait for changes to become effective */
+#define EMC_STATUS_UPDATE_TIMEOUT		1000
+
+enum emc_dram_type {
+	DRAM_TYPE_DDR3,
+	DRAM_TYPE_DDR1,
+	DRAM_TYPE_LPDDR2,
+	DRAM_TYPE_DDR2
+};
+
+enum emc_dll_change {
+	DLL_CHANGE_NONE,
+	DLL_CHANGE_ON,
+	DLL_CHANGE_OFF
+};
+
+static const unsigned long emc_burst_regs[] = {
+	EMC_RC,
+	EMC_RFC,
+	EMC_RAS,
+	EMC_RP,
+	EMC_R2W,
+	EMC_W2R,
+	EMC_R2P,
+	EMC_W2P,
+	EMC_RD_RCD,
+	EMC_WR_RCD,
+	EMC_RRD,
+	EMC_REXT,
+	EMC_WEXT,
+	EMC_WDV,
+	EMC_WDV_MASK,
+	EMC_QUSE,
+	EMC_IBDLY,
+	EMC_EINPUT,
+	EMC_EINPUT_DURATION,
+	EMC_PUTERM_EXTRA,
+	EMC_CDB_CNTL_1,
+	EMC_CDB_CNTL_2,
+	EMC_QRST,
+	EMC_QSAFE,
+	EMC_RDV,
+	EMC_RDV_MASK,
+	EMC_REFRESH,
+	EMC_BURST_REFRESH_NUM,
+	EMC_PRE_REFRESH_REQ_CNT,
+	EMC_PDEX2WR,
+	EMC_PDEX2RD,
+	EMC_PCHG2PDEN,
+	EMC_ACT2PDEN,
+	EMC_AR2PDEN,
+	EMC_RW2PDEN,
+	EMC_TXSR,
+	EMC_TXSRDLL,
+	EMC_TCKE,
+	EMC_TCKESR,
+	EMC_TPD,
+	EMC_TFAW,
+	EMC_TRPAB,
+	EMC_TCLKSTABLE,
+	EMC_TCLKSTOP,
+	EMC_TREFBW,
+	EMC_QUSE_EXTRA,
+	EMC_FBIO_CFG6,
+	EMC_ODT_WRITE,
+	EMC_ODT_READ,
+	EMC_FBIO_CFG5,
+	EMC_CFG_DIG_DLL,
+	EMC_CFG_DIG_DLL_PERIOD,
+	EMC_DLL_XFORM_DQS0,
+	EMC_DLL_XFORM_DQS1,
+	EMC_DLL_XFORM_DQS2,
+	EMC_DLL_XFORM_DQS3,
+	EMC_DLL_XFORM_DQS4,
+	EMC_DLL_XFORM_DQS5,
+	EMC_DLL_XFORM_DQS6,
+	EMC_DLL_XFORM_DQS7,
+	EMC_DLL_XFORM_QUSE0,
+	EMC_DLL_XFORM_QUSE1,
+	EMC_DLL_XFORM_QUSE2,
+	EMC_DLL_XFORM_QUSE3,
+	EMC_DLL_XFORM_QUSE4,
+	EMC_DLL_XFORM_QUSE5,
+	EMC_DLL_XFORM_QUSE6,
+	EMC_DLL_XFORM_QUSE7,
+	EMC_DLI_TRIM_TXDQS0,
+	EMC_DLI_TRIM_TXDQS1,
+	EMC_DLI_TRIM_TXDQS2,
+	EMC_DLI_TRIM_TXDQS3,
+	EMC_DLI_TRIM_TXDQS4,
+	EMC_DLI_TRIM_TXDQS5,
+	EMC_DLI_TRIM_TXDQS6,
+	EMC_DLI_TRIM_TXDQS7,
+	EMC_DLL_XFORM_DQ0,
+	EMC_DLL_XFORM_DQ1,
+	EMC_DLL_XFORM_DQ2,
+	EMC_DLL_XFORM_DQ3,
+	EMC_XM2CMDPADCTRL,
+	EMC_XM2CMDPADCTRL4,
+	EMC_XM2DQPADCTRL2,
+	EMC_XM2CLKPADCTRL,
+	EMC_XM2COMPPADCTRL,
+	EMC_XM2VTTGENPADCTRL,
+	EMC_XM2VTTGENPADCTRL2,
+	EMC_XM2DQSPADCTRL3,
+	EMC_XM2DQSPADCTRL4,
+	EMC_DSR_VTTGEN_DRV,
+	EMC_TXDSRVTTGEN,
+	EMC_FBIO_SPARE,
+	EMC_ZCAL_WAIT_CNT,
+	EMC_MRS_WAIT_CNT2,
+	EMC_CTT,
+	EMC_CTT_DURATION,
+	EMC_DYN_SELF_REF_CONTROL,
+};
+
+struct emc_timing {
+	unsigned long rate;
+
+	u32 emc_burst_data[ARRAY_SIZE(emc_burst_regs)];
+
+	u32 emc_auto_cal_config;
+	u32 emc_auto_cal_config2;
+	u32 emc_auto_cal_config3;
+	u32 emc_auto_cal_interval;
+	u32 emc_cfg;
+	u32 emc_ctt_term_ctrl;
+	u32 emc_mode_1;
+	u32 emc_mode_2;
+	u32 emc_mode_4;
+	u32 emc_mode_reset;
+	u32 emc_mrs_wait_cnt;
+	u32 emc_sel_dpd_ctrl;
+	u32 emc_xm2dqspadctrl2;
+	u32 emc_zcal_cnt_long;
+	u32 emc_zcal_interval;
+};
+
+enum emc_rate_request_type {
+	EMC_RATE_DEBUG,
+	EMC_RATE_ICC,
+	EMC_RATE_TYPE_MAX,
+};
+
+struct emc_rate_request {
+	unsigned long min_rate;
+	unsigned long max_rate;
+};
+
+struct tegra_emc {
+	struct device *dev;
+
+	struct tegra_mc *mc;
+
+	void __iomem *regs;
+
+	unsigned int irq;
+
+	struct clk *clk;
+
+	enum emc_dram_type dram_type;
+	unsigned int dram_num;
+
+	struct emc_timing last_timing;
+	struct emc_timing *timings;
+	unsigned int num_timings;
+
+	struct {
+		struct dentry *root;
+		unsigned long min_rate;
+		unsigned long max_rate;
+	} debugfs;
+
+	struct icc_provider provider;
+
+	/*
+	 * There are multiple sources in the EMC driver which could request
+	 * a min/max clock rate, these rates are contained in this array.
+	 */
+	struct emc_rate_request requested_rate[EMC_RATE_TYPE_MAX];
+
+	/* protect shared rate-change code path */
+	struct mutex rate_lock;
+};
+
+static irqreturn_t tegra_emc_isr(int irq, void *data)
+{
+	struct tegra_emc *emc = data;
+	u32 intmask = EMC_REFRESH_OVERFLOW_INT;
+	u32 status;
+
+	status = readl_relaxed(emc->regs + EMC_INTSTATUS) & intmask;
+	if (!status)
+		return IRQ_NONE;
+
+	/* notify about HW problem */
+	if (status & EMC_REFRESH_OVERFLOW_INT)
+		dev_err_ratelimited(emc->dev,
+				    "refresh request overflow timeout\n");
+
+	/* clear interrupts */
+	writel_relaxed(status, emc->regs + EMC_INTSTATUS);
+
+	return IRQ_HANDLED;
+}
+
+/* Timing change sequence functions */
+
+static void emc_ccfifo_writel(struct tegra_emc *emc, u32 value,
+			      unsigned long offset)
+{
+	writel(value, emc->regs + EMC_CCFIFO_DATA);
+	writel(offset, emc->regs + EMC_CCFIFO_ADDR);
+}
+
+static void emc_seq_update_timing(struct tegra_emc *emc)
+{
+	unsigned int i;
+	u32 value;
+
+	writel(1, emc->regs + EMC_TIMING_CONTROL);
+
+	for (i = 0; i < EMC_STATUS_UPDATE_TIMEOUT; ++i) {
+		value = readl(emc->regs + EMC_STATUS);
+		if ((value & EMC_STATUS_TIMING_UPDATE_STALLED) == 0)
+			return;
+		udelay(1);
+	}
+
+	dev_err(emc->dev, "timing update timed out\n");
+}
+
+static void emc_seq_disable_auto_cal(struct tegra_emc *emc)
+{
+	unsigned int i;
+	u32 value;
+
+	writel(0, emc->regs + EMC_AUTO_CAL_INTERVAL);
+
+	for (i = 0; i < EMC_STATUS_UPDATE_TIMEOUT; ++i) {
+		value = readl(emc->regs + EMC_AUTO_CAL_STATUS);
+		if ((value & EMC_AUTO_CAL_STATUS_ACTIVE) == 0)
+			return;
+		udelay(1);
+	}
+
+	dev_err(emc->dev, "auto cal disable timed out\n");
+}
+
+static void emc_seq_wait_clkchange(struct tegra_emc *emc)
+{
+	unsigned int i;
+	u32 value;
+
+	for (i = 0; i < EMC_STATUS_UPDATE_TIMEOUT; ++i) {
+		value = readl(emc->regs + EMC_INTSTATUS);
+		if (value & EMC_INTSTATUS_CLKCHANGE_COMPLETE)
+			return;
+		udelay(1);
+	}
+
+	dev_err(emc->dev, "clock change timed out\n");
+}
+
+static struct emc_timing *tegra_emc_find_timing(struct tegra_emc *emc,
+						unsigned long rate)
+{
+	struct emc_timing *timing = NULL;
+	unsigned int i;
+
+	for (i = 0; i < emc->num_timings; i++) {
+		if (emc->timings[i].rate == rate) {
+			timing = &emc->timings[i];
+			break;
+		}
+	}
+
+	if (!timing) {
+		dev_err(emc->dev, "no timing for rate %lu\n", rate);
+		return NULL;
+	}
+
+	return timing;
+}
+
+static int tegra_emc_prepare_timing_change(struct tegra_emc *emc,
+					   unsigned long rate)
+{
+	struct emc_timing *timing = tegra_emc_find_timing(emc, rate);
+	struct emc_timing *last = &emc->last_timing;
+	enum emc_dll_change dll_change;
+	unsigned int pre_wait = 0;
+	u32 val, mask;
+	bool update = false;
+	unsigned int i;
+
+	if (!timing)
+		return -ENOENT;
+
+	if ((last->emc_mode_1 & 0x1) == (timing->emc_mode_1 & 0x1))
+		dll_change = DLL_CHANGE_NONE;
+	else if (timing->emc_mode_1 & 0x1)
+		dll_change = DLL_CHANGE_ON;
+	else
+		dll_change = DLL_CHANGE_OFF;
+
+	/* Clear CLKCHANGE_COMPLETE interrupts */
+	writel(EMC_INTSTATUS_CLKCHANGE_COMPLETE, emc->regs + EMC_INTSTATUS);
+
+	/* Disable dynamic self-refresh */
+	val = readl(emc->regs + EMC_CFG);
+	if (val & EMC_CFG_PWR_MASK) {
+		val &= ~EMC_CFG_POWER_FEATURES_MASK;
+		writel(val, emc->regs + EMC_CFG);
+
+		pre_wait = 5;
+	}
+
+	/* Disable SEL_DPD_CTRL for clock change */
+	if (emc->dram_type == DRAM_TYPE_DDR3)
+		mask = EMC_SEL_DPD_CTRL_DDR3_MASK;
+	else
+		mask = EMC_SEL_DPD_CTRL_MASK;
+
+	val = readl(emc->regs + EMC_SEL_DPD_CTRL);
+	if (val & mask) {
+		val &= ~mask;
+		writel(val, emc->regs + EMC_SEL_DPD_CTRL);
+	}
+
+	/* Prepare DQ/DQS for clock change */
+	val = readl(emc->regs + EMC_XM2DQSPADCTRL2);
+	if (timing->emc_xm2dqspadctrl2 & EMC_XM2DQSPADCTRL2_VREF_ENABLE &&
+	    !(val & EMC_XM2DQSPADCTRL2_VREF_ENABLE)) {
+		val |= EMC_XM2DQSPADCTRL2_VREF_ENABLE;
+		update = true;
+	}
+
+	if (timing->emc_xm2dqspadctrl2 & EMC_XM2DQSPADCTRL2_RX_FT_REC_ENABLE &&
+	    !(val & EMC_XM2DQSPADCTRL2_RX_FT_REC_ENABLE)) {
+		val |= EMC_XM2DQSPADCTRL2_RX_FT_REC_ENABLE;
+		update = true;
+	}
+
+	if (update) {
+		writel(val, emc->regs + EMC_XM2DQSPADCTRL2);
+		if (pre_wait < 30)
+			pre_wait = 30;
+	}
+
+	/* Wait to settle */
+	if (pre_wait) {
+		emc_seq_update_timing(emc);
+		udelay(pre_wait);
+	}
+
+	/* Program CTT_TERM control */
+	if (last->emc_ctt_term_ctrl != timing->emc_ctt_term_ctrl) {
+		emc_seq_disable_auto_cal(emc);
+		writel(timing->emc_ctt_term_ctrl,
+		       emc->regs + EMC_CTT_TERM_CTRL);
+		emc_seq_update_timing(emc);
+	}
+
+	/* Program burst shadow registers */
+	for (i = 0; i < ARRAY_SIZE(timing->emc_burst_data); ++i)
+		writel(timing->emc_burst_data[i],
+		       emc->regs + emc_burst_regs[i]);
+
+	writel(timing->emc_xm2dqspadctrl2, emc->regs + EMC_XM2DQSPADCTRL2);
+	writel(timing->emc_zcal_interval, emc->regs + EMC_ZCAL_INTERVAL);
+
+	tegra_mc_write_emem_configuration(emc->mc, timing->rate);
+
+	val = timing->emc_cfg & ~EMC_CFG_POWER_FEATURES_MASK;
+	emc_ccfifo_writel(emc, val, EMC_CFG);
+
+	/* Program AUTO_CAL_CONFIG */
+	if (timing->emc_auto_cal_config2 != last->emc_auto_cal_config2)
+		emc_ccfifo_writel(emc, timing->emc_auto_cal_config2,
+				  EMC_AUTO_CAL_CONFIG2);
+
+	if (timing->emc_auto_cal_config3 != last->emc_auto_cal_config3)
+		emc_ccfifo_writel(emc, timing->emc_auto_cal_config3,
+				  EMC_AUTO_CAL_CONFIG3);
+
+	if (timing->emc_auto_cal_config != last->emc_auto_cal_config) {
+		val = timing->emc_auto_cal_config;
+		val &= EMC_AUTO_CAL_CONFIG_AUTO_CAL_START;
+		emc_ccfifo_writel(emc, val, EMC_AUTO_CAL_CONFIG);
+	}
+
+	/* DDR3: predict MRS long wait count */
+	if (emc->dram_type == DRAM_TYPE_DDR3 &&
+	    dll_change == DLL_CHANGE_ON) {
+		u32 cnt = 512;
+
+		if (timing->emc_zcal_interval != 0 &&
+		    last->emc_zcal_interval == 0)
+			cnt -= emc->dram_num * 256;
+
+		val = (timing->emc_mrs_wait_cnt
+			& EMC_MRS_WAIT_CNT_SHORT_WAIT_MASK)
+			>> EMC_MRS_WAIT_CNT_SHORT_WAIT_SHIFT;
+		if (cnt < val)
+			cnt = val;
+
+		val = timing->emc_mrs_wait_cnt
+			& ~EMC_MRS_WAIT_CNT_LONG_WAIT_MASK;
+		val |= (cnt << EMC_MRS_WAIT_CNT_LONG_WAIT_SHIFT)
+			& EMC_MRS_WAIT_CNT_LONG_WAIT_MASK;
+
+		writel(val, emc->regs + EMC_MRS_WAIT_CNT);
+	}
+
+	/* DDR3: Turn off DLL and enter self-refresh */
+	if (emc->dram_type == DRAM_TYPE_DDR3 && dll_change == DLL_CHANGE_OFF)
+		emc_ccfifo_writel(emc, timing->emc_mode_1, EMC_EMRS);
+
+	/* Disable refresh controller */
+	emc_ccfifo_writel(emc, EMC_REFCTRL_DEV_SEL(emc->dram_num),
+			  EMC_REFCTRL);
+	if (emc->dram_type == DRAM_TYPE_DDR3)
+		emc_ccfifo_writel(emc, EMC_DRAM_DEV_SEL(emc->dram_num) |
+				       EMC_SELF_REF_CMD_ENABLED,
+				  EMC_SELF_REF);
+
+	/* Flow control marker */
+	emc_ccfifo_writel(emc, 1, EMC_STALL_THEN_EXE_AFTER_CLKCHANGE);
+
+	/* DDR3: Exit self-refresh */
+	if (emc->dram_type == DRAM_TYPE_DDR3)
+		emc_ccfifo_writel(emc, EMC_DRAM_DEV_SEL(emc->dram_num),
+				  EMC_SELF_REF);
+	emc_ccfifo_writel(emc, EMC_REFCTRL_DEV_SEL(emc->dram_num) |
+			       EMC_REFCTRL_ENABLE,
+			  EMC_REFCTRL);
+
+	/* Set DRAM mode registers */
+	if (emc->dram_type == DRAM_TYPE_DDR3) {
+		if (timing->emc_mode_1 != last->emc_mode_1)
+			emc_ccfifo_writel(emc, timing->emc_mode_1, EMC_EMRS);
+		if (timing->emc_mode_2 != last->emc_mode_2)
+			emc_ccfifo_writel(emc, timing->emc_mode_2, EMC_EMRS2);
+
+		if (timing->emc_mode_reset != last->emc_mode_reset ||
+		    dll_change == DLL_CHANGE_ON) {
+			val = timing->emc_mode_reset;
+			if (dll_change == DLL_CHANGE_ON) {
+				val |= EMC_MODE_SET_DLL_RESET;
+				val |= EMC_MODE_SET_LONG_CNT;
+			} else {
+				val &= ~EMC_MODE_SET_DLL_RESET;
+			}
+			emc_ccfifo_writel(emc, val, EMC_MRS);
+		}
+	} else {
+		if (timing->emc_mode_2 != last->emc_mode_2)
+			emc_ccfifo_writel(emc, timing->emc_mode_2, EMC_MRW2);
+		if (timing->emc_mode_1 != last->emc_mode_1)
+			emc_ccfifo_writel(emc, timing->emc_mode_1, EMC_MRW);
+		if (timing->emc_mode_4 != last->emc_mode_4)
+			emc_ccfifo_writel(emc, timing->emc_mode_4, EMC_MRW4);
+	}
+
+	/*  Issue ZCAL command if turning ZCAL on */
+	if (timing->emc_zcal_interval != 0 && last->emc_zcal_interval == 0) {
+		emc_ccfifo_writel(emc, EMC_ZQ_CAL_LONG_CMD_DEV0, EMC_ZQ_CAL);
+		if (emc->dram_num > 1)
+			emc_ccfifo_writel(emc, EMC_ZQ_CAL_LONG_CMD_DEV1,
+					  EMC_ZQ_CAL);
+	}
+
+	/*  Write to RO register to remove stall after change */
+	emc_ccfifo_writel(emc, 0, EMC_CCFIFO_STATUS);
+
+	/* Disable AUTO_CAL for clock change */
+	emc_seq_disable_auto_cal(emc);
+
+	/* Read register to wait until programming has settled */
+	mc_readl(emc->mc, MC_EMEM_ADR_CFG);
+
+	return 0;
+}
+
+static void tegra_emc_complete_timing_change(struct tegra_emc *emc,
+					     unsigned long rate)
+{
+	struct emc_timing *timing = tegra_emc_find_timing(emc, rate);
+	struct emc_timing *last = &emc->last_timing;
+
+	if (!timing)
+		return;
+
+	/* Wait until the state machine has settled */
+	emc_seq_wait_clkchange(emc);
+
+	/* Restore AUTO_CAL */
+	if (timing->emc_ctt_term_ctrl != last->emc_ctt_term_ctrl)
+		writel(timing->emc_auto_cal_interval,
+		       emc->regs + EMC_AUTO_CAL_INTERVAL);
+
+	/* Restore dynamic self-refresh */
+	if (timing->emc_cfg & EMC_CFG_PWR_MASK)
+		writel(timing->emc_cfg, emc->regs + EMC_CFG);
+
+	/* Set ZCAL wait count */
+	writel(timing->emc_zcal_cnt_long, emc->regs + EMC_ZCAL_WAIT_CNT);
+
+	/* Wait for timing to settle */
+	udelay(2);
+
+	/* Reprogram SEL_DPD_CTRL */
+	writel(timing->emc_sel_dpd_ctrl, emc->regs + EMC_SEL_DPD_CTRL);
+	emc_seq_update_timing(emc);
+
+	emc->last_timing = *timing;
+}
+
+/* Initialization and deinitialization */
+
+static void emc_read_current_timing(struct tegra_emc *emc,
+				    struct emc_timing *timing)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(emc_burst_regs); ++i)
+		timing->emc_burst_data[i] =
+			readl(emc->regs + emc_burst_regs[i]);
+
+	timing->emc_cfg = readl(emc->regs + EMC_CFG);
+
+	timing->emc_auto_cal_interval = 0;
+	timing->emc_zcal_cnt_long = 0;
+	timing->emc_mode_1 = 0;
+	timing->emc_mode_2 = 0;
+	timing->emc_mode_4 = 0;
+	timing->emc_mode_reset = 0;
+}
+
+static int emc_init(struct tegra_emc *emc)
+{
+	u32 emc_cfg, emc_dbg;
+	u32 intmask = EMC_REFRESH_OVERFLOW_INT;
+	const char *dram_type_str;
+
+	emc->dram_type = readl(emc->regs + EMC_FBIO_CFG5);
+
+	emc->dram_type &= EMC_FBIO_CFG5_DRAM_TYPE_MASK;
+	emc->dram_type >>= EMC_FBIO_CFG5_DRAM_TYPE_SHIFT;
+
+	emc->dram_num = tegra_mc_get_emem_device_count(emc->mc);
+
+	emc_cfg = readl_relaxed(emc->regs + EMC_CFG_2);
+
+	/* enable EMC and CAR to handshake on PLL divider/source changes */
+	emc_cfg |= EMC_CLKCHANGE_REQ_ENABLE;
+
+	/* configure clock change mode accordingly to DRAM type */
+	switch (emc->dram_type) {
+	case DRAM_TYPE_LPDDR2:
+		emc_cfg |= EMC_CLKCHANGE_PD_ENABLE;
+		emc_cfg &= ~EMC_CLKCHANGE_SR_ENABLE;
+		break;
+
+	default:
+		emc_cfg &= ~EMC_CLKCHANGE_SR_ENABLE;
+		emc_cfg &= ~EMC_CLKCHANGE_PD_ENABLE;
+		break;
+	}
+
+	writel_relaxed(emc_cfg, emc->regs + EMC_CFG_2);
+
+	/* initialize interrupt */
+	writel_relaxed(intmask, emc->regs + EMC_INTMASK);
+	writel_relaxed(0xffffffff, emc->regs + EMC_INTSTATUS);
+
+	/* ensure that unwanted debug features are disabled */
+	emc_dbg = readl_relaxed(emc->regs + EMC_DBG);
+	emc_dbg |= EMC_DBG_CFG_PRIORITY;
+	emc_dbg &= ~EMC_DBG_READ_MUX_ASSEMBLY;
+	emc_dbg &= ~EMC_DBG_WRITE_MUX_ACTIVE;
+	emc_dbg &= ~EMC_DBG_FORCE_UPDATE;
+	writel_relaxed(emc_dbg, emc->regs + EMC_DBG);
+
+	switch (emc->dram_type) {
+	case DRAM_TYPE_DDR1:
+		dram_type_str = "DDR1";
+		break;
+	case DRAM_TYPE_LPDDR2:
+		dram_type_str = "LPDDR2";
+		break;
+	case DRAM_TYPE_DDR2:
+		dram_type_str = "DDR2";
+		break;
+	case DRAM_TYPE_DDR3:
+		dram_type_str = "DDR3";
+		break;
+	}
+
+	dev_info_once(emc->dev, "%u %s %s attached\n", emc->dram_num,
+		      dram_type_str, emc->dram_num == 2 ? "devices" : "device");
+
+	emc_read_current_timing(emc, &emc->last_timing);
+
+	return 0;
+}
+
+static int load_one_timing_from_dt(struct tegra_emc *emc,
+				   struct emc_timing *timing,
+				   struct device_node *node)
+{
+	u32 value;
+	int err;
+
+	err = of_property_read_u32(node, "clock-frequency", &value);
+	if (err) {
+		dev_err(emc->dev, "timing %pOFn: failed to read rate: %d\n",
+			node, err);
+		return err;
+	}
+
+	timing->rate = value;
+
+	err = of_property_read_u32_array(node, "nvidia,emc-configuration",
+					 timing->emc_burst_data,
+					 ARRAY_SIZE(timing->emc_burst_data));
+	if (err) {
+		dev_err(emc->dev,
+			"timing %pOFn: failed to read emc burst data: %d\n",
+			node, err);
+		return err;
+	}
+
+#define EMC_READ_PROP(prop, dtprop) { \
+	err = of_property_read_u32(node, dtprop, &timing->prop); \
+	if (err) { \
+		dev_err(emc->dev, "timing %pOFn: failed to read " #prop ": %d\n", \
+			node, err); \
+		return err; \
+	} \
+}
+
+	EMC_READ_PROP(emc_auto_cal_config, "nvidia,emc-auto-cal-config")
+	EMC_READ_PROP(emc_auto_cal_config2, "nvidia,emc-auto-cal-config2")
+	EMC_READ_PROP(emc_auto_cal_config3, "nvidia,emc-auto-cal-config3")
+	EMC_READ_PROP(emc_auto_cal_interval, "nvidia,emc-auto-cal-interval")
+	EMC_READ_PROP(emc_cfg, "nvidia,emc-cfg")
+	EMC_READ_PROP(emc_ctt_term_ctrl, "nvidia,emc-ctt-term-ctrl")
+	EMC_READ_PROP(emc_mode_1, "nvidia,emc-mode-1")
+	EMC_READ_PROP(emc_mode_2, "nvidia,emc-mode-2")
+	EMC_READ_PROP(emc_mode_4, "nvidia,emc-mode-4")
+	EMC_READ_PROP(emc_mode_reset, "nvidia,emc-mode-reset")
+	EMC_READ_PROP(emc_mrs_wait_cnt, "nvidia,emc-mrs-wait-cnt")
+	EMC_READ_PROP(emc_sel_dpd_ctrl, "nvidia,emc-sel-dpd-ctrl")
+	EMC_READ_PROP(emc_xm2dqspadctrl2, "nvidia,emc-xm2dqspadctrl2")
+	EMC_READ_PROP(emc_zcal_cnt_long, "nvidia,emc-zcal-cnt-long")
+	EMC_READ_PROP(emc_zcal_interval, "nvidia,emc-zcal-interval")
+
+#undef EMC_READ_PROP
+
+	return 0;
+}
+
+static int cmp_timings(const void *_a, const void *_b)
+{
+	const struct emc_timing *a = _a;
+	const struct emc_timing *b = _b;
+
+	if (a->rate < b->rate)
+		return -1;
+	else if (a->rate == b->rate)
+		return 0;
+	else
+		return 1;
+}
+
+static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
+					  struct device_node *node)
+{
+	int child_count = of_get_child_count(node);
+	struct device_node *child;
+	struct emc_timing *timing;
+	unsigned int i = 0;
+	int err;
+
+	emc->timings = devm_kcalloc(emc->dev, child_count, sizeof(*timing),
+				    GFP_KERNEL);
+	if (!emc->timings)
+		return -ENOMEM;
+
+	emc->num_timings = child_count;
+
+	for_each_child_of_node(node, child) {
+		timing = &emc->timings[i++];
+
+		err = load_one_timing_from_dt(emc, timing, child);
+		if (err) {
+			of_node_put(child);
+			return err;
+		}
+	}
+
+	sort(emc->timings, emc->num_timings, sizeof(*timing), cmp_timings,
+	     NULL);
+
+	return 0;
+}
+
+static struct device_node *
+tegra_emc_find_node_by_ram_code(struct device_node *node, u32 ram_code)
+{
+	struct device_node *np;
+	int err;
+
+	for_each_child_of_node(node, np) {
+		u32 value;
+
+		err = of_property_read_u32(np, "nvidia,ram-code", &value);
+		if (err || value != ram_code)
+			continue;
+
+		return np;
+	}
+
+	return NULL;
+}
+
+static void tegra_emc_rate_requests_init(struct tegra_emc *emc)
+{
+	unsigned int i;
+
+	for (i = 0; i < EMC_RATE_TYPE_MAX; i++) {
+		emc->requested_rate[i].min_rate = 0;
+		emc->requested_rate[i].max_rate = ULONG_MAX;
+	}
+}
+
+static int emc_request_rate(struct tegra_emc *emc,
+			    unsigned long new_min_rate,
+			    unsigned long new_max_rate,
+			    enum emc_rate_request_type type)
+{
+	struct emc_rate_request *req = emc->requested_rate;
+	unsigned long min_rate = 0, max_rate = ULONG_MAX;
+	unsigned int i;
+	int err;
+
+	/* select minimum and maximum rates among the requested rates */
+	for (i = 0; i < EMC_RATE_TYPE_MAX; i++, req++) {
+		if (i == type) {
+			min_rate = max(new_min_rate, min_rate);
+			max_rate = min(new_max_rate, max_rate);
+		} else {
+			min_rate = max(req->min_rate, min_rate);
+			max_rate = min(req->max_rate, max_rate);
+		}
+	}
+
+	if (min_rate > max_rate) {
+		dev_err_ratelimited(emc->dev, "%s: type %u: out of range: %lu %lu\n",
+				    __func__, type, min_rate, max_rate);
+		return -ERANGE;
+	}
+
+	/*
+	 * EMC rate-changes should go via OPP API because it manages voltage
+	 * changes.
+	 */
+	err = dev_pm_opp_set_rate(emc->dev, min_rate);
+	if (err)
+		return err;
+
+	emc->requested_rate[type].min_rate = new_min_rate;
+	emc->requested_rate[type].max_rate = new_max_rate;
+
+	return 0;
+}
+
+static int emc_set_min_rate(struct tegra_emc *emc, unsigned long rate,
+			    enum emc_rate_request_type type)
+{
+	struct emc_rate_request *req = &emc->requested_rate[type];
+	int ret;
+
+	mutex_lock(&emc->rate_lock);
+	ret = emc_request_rate(emc, rate, req->max_rate, type);
+	mutex_unlock(&emc->rate_lock);
+
+	return ret;
+}
+
+static int emc_set_max_rate(struct tegra_emc *emc, unsigned long rate,
+			    enum emc_rate_request_type type)
+{
+	struct emc_rate_request *req = &emc->requested_rate[type];
+	int ret;
+
+	mutex_lock(&emc->rate_lock);
+	ret = emc_request_rate(emc, req->min_rate, rate, type);
+	mutex_unlock(&emc->rate_lock);
+
+	return ret;
+}
+
+/*
+ * debugfs interface
+ *
+ * The memory controller driver exposes some files in debugfs that can be used
+ * to control the EMC frequency. The top-level directory can be found here:
+ *
+ *   /sys/kernel/debug/emc
+ *
+ * It contains the following files:
+ *
+ *   - available_rates: This file contains a list of valid, space-separated
+ *     EMC frequencies.
+ *
+ *   - min_rate: Writing a value to this file sets the given frequency as the
+ *       floor of the permitted range. If this is higher than the currently
+ *       configured EMC frequency, this will cause the frequency to be
+ *       increased so that it stays within the valid range.
+ *
+ *   - max_rate: Similarly to the min_rate file, writing a value to this file
+ *       sets the given frequency as the ceiling of the permitted range. If
+ *       the value is lower than the currently configured EMC frequency, this
+ *       will cause the frequency to be decreased so that it stays within the
+ *       valid range.
+ */
+
+static bool tegra_emc_validate_rate(struct tegra_emc *emc, unsigned long rate)
+{
+	unsigned int i;
+
+	for (i = 0; i < emc->num_timings; i++)
+		if (rate == emc->timings[i].rate)
+			return true;
+
+	return false;
+}
+
+static int tegra_emc_debug_available_rates_show(struct seq_file *s,
+						void *data)
+{
+	struct tegra_emc *emc = s->private;
+	const char *prefix = "";
+	unsigned int i;
+
+	for (i = 0; i < emc->num_timings; i++) {
+		seq_printf(s, "%s%lu", prefix, emc->timings[i].rate);
+		prefix = " ";
+	}
+
+	seq_puts(s, "\n");
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(tegra_emc_debug_available_rates);
+
+static int tegra_emc_debug_min_rate_get(void *data, u64 *rate)
+{
+	struct tegra_emc *emc = data;
+
+	*rate = emc->debugfs.min_rate;
+
+	return 0;
+}
+
+static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
+{
+	struct tegra_emc *emc = data;
+	int err;
+
+	if (!tegra_emc_validate_rate(emc, rate))
+		return -EINVAL;
+
+	err = emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
+	if (err < 0)
+		return err;
+
+	emc->debugfs.min_rate = rate;
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
+			 tegra_emc_debug_min_rate_get,
+			 tegra_emc_debug_min_rate_set, "%llu\n");
+
+static int tegra_emc_debug_max_rate_get(void *data, u64 *rate)
+{
+	struct tegra_emc *emc = data;
+
+	*rate = emc->debugfs.max_rate;
+
+	return 0;
+}
+
+static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
+{
+	struct tegra_emc *emc = data;
+	int err;
+
+	if (!tegra_emc_validate_rate(emc, rate))
+		return -EINVAL;
+
+	err = emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
+	if (err < 0)
+		return err;
+
+	emc->debugfs.max_rate = rate;
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
+			 tegra_emc_debug_max_rate_get,
+			 tegra_emc_debug_max_rate_set, "%llu\n");
+
+static void emc_debugfs_init(struct device *dev, struct tegra_emc *emc)
+{
+	unsigned int i;
+	int err;
+
+	emc->debugfs.min_rate = ULONG_MAX;
+	emc->debugfs.max_rate = 0;
+
+	for (i = 0; i < emc->num_timings; i++) {
+		if (emc->timings[i].rate < emc->debugfs.min_rate)
+			emc->debugfs.min_rate = emc->timings[i].rate;
+
+		if (emc->timings[i].rate > emc->debugfs.max_rate)
+			emc->debugfs.max_rate = emc->timings[i].rate;
+	}
+
+	if (!emc->num_timings) {
+		emc->debugfs.min_rate = clk_get_rate(emc->clk);
+		emc->debugfs.max_rate = emc->debugfs.min_rate;
+	}
+
+	err = clk_set_rate_range(emc->clk, emc->debugfs.min_rate,
+				 emc->debugfs.max_rate);
+	if (err < 0) {
+		dev_err(dev, "failed to set rate range [%lu-%lu] for %pC\n",
+			emc->debugfs.min_rate, emc->debugfs.max_rate,
+			emc->clk);
+		return;
+	}
+
+	emc->debugfs.root = debugfs_create_dir("emc", NULL);
+
+	debugfs_create_file("available_rates", 0444, emc->debugfs.root, emc,
+			    &tegra_emc_debug_available_rates_fops);
+	debugfs_create_file("min_rate", 0644, emc->debugfs.root,
+			    emc, &tegra_emc_debug_min_rate_fops);
+	debugfs_create_file("max_rate", 0644, emc->debugfs.root,
+			    emc, &tegra_emc_debug_max_rate_fops);
+}
+
+static inline struct tegra_emc *
+to_tegra_emc_provider(struct icc_provider *provider)
+{
+	return container_of(provider, struct tegra_emc, provider);
+}
+
+static struct icc_node_data *
+emc_of_icc_xlate_extended(const struct of_phandle_args *spec, void *data)
+{
+	struct icc_provider *provider = data;
+	struct icc_node_data *ndata;
+	struct icc_node *node;
+
+	/* External Memory is the only possible ICC route */
+	list_for_each_entry(node, &provider->nodes, node_list) {
+		if (node->id != TEGRA_ICC_EMEM)
+			continue;
+
+		ndata = kzalloc(sizeof(*ndata), GFP_KERNEL);
+		if (!ndata)
+			return ERR_PTR(-ENOMEM);
+
+		/*
+		 * SRC and DST nodes should have matching TAG in order to have
+		 * it set by default for a requested path.
+		 */
+		ndata->tag = TEGRA_MC_ICC_TAG_ISO;
+		ndata->node = node;
+
+		return ndata;
+	}
+
+	return ERR_PTR(-EPROBE_DEFER);
+}
+
+static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	struct tegra_emc *emc = to_tegra_emc_provider(dst->provider);
+	unsigned long long peak_bw = icc_units_to_bps(dst->peak_bw);
+	unsigned long long avg_bw = icc_units_to_bps(dst->avg_bw);
+	unsigned long long rate = max(avg_bw, peak_bw);
+	unsigned int dram_data_bus_width_bytes = 4;
+	const unsigned int ddr = 2;
+	int err;
+
+	/*
+	 * Tegra114 EMC runs on a clock rate of SDRAM bus. This means that
+	 * EMC clock rate is twice smaller than the peak data rate because
+	 * data is sampled on both EMC clock edges.
+	 */
+	do_div(rate, ddr * dram_data_bus_width_bytes);
+	rate = min_t(u64, rate, U32_MAX);
+
+	err = emc_set_min_rate(emc, rate, EMC_RATE_ICC);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int tegra_emc_interconnect_init(struct tegra_emc *emc)
+{
+	const struct tegra_mc_soc *soc = emc->mc->soc;
+	struct icc_node *node;
+	int err;
+
+	emc->provider.dev = emc->dev;
+	emc->provider.set = emc_icc_set;
+	emc->provider.data = &emc->provider;
+	emc->provider.aggregate = soc->icc_ops->aggregate;
+	emc->provider.xlate_extended = emc_of_icc_xlate_extended;
+
+	icc_provider_init(&emc->provider);
+
+	/* create External Memory Controller node */
+	node = icc_node_create(TEGRA_ICC_EMC);
+	if (IS_ERR(node)) {
+		err = PTR_ERR(node);
+		goto err_msg;
+	}
+
+	node->name = "External Memory Controller";
+	icc_node_add(node, &emc->provider);
+
+	/* link External Memory Controller to External Memory (DRAM) */
+	err = icc_link_create(node, TEGRA_ICC_EMEM);
+	if (err)
+		goto remove_nodes;
+
+	/* create External Memory node */
+	node = icc_node_create(TEGRA_ICC_EMEM);
+	if (IS_ERR(node)) {
+		err = PTR_ERR(node);
+		goto remove_nodes;
+	}
+
+	node->name = "External Memory (DRAM)";
+	icc_node_add(node, &emc->provider);
+
+	err = icc_provider_register(&emc->provider);
+	if (err)
+		goto remove_nodes;
+
+	return 0;
+
+remove_nodes:
+	icc_nodes_remove(&emc->provider);
+err_msg:
+	dev_err(emc->dev, "failed to initialize ICC: %d\n", err);
+
+	return err;
+}
+
+static int tegra_emc_opp_table_init(struct tegra_emc *emc)
+{
+	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
+	int opp_token, err;
+
+	err = dev_pm_opp_set_supported_hw(emc->dev, &hw_version, 1);
+	if (err < 0) {
+		dev_err(emc->dev, "failed to set OPP supported HW: %d\n", err);
+		return err;
+	}
+	opp_token = err;
+
+	err = dev_pm_opp_of_add_table(emc->dev);
+	if (err) {
+		if (err == -ENODEV)
+			dev_err(emc->dev, "OPP table not found, please update your device tree\n");
+		else
+			dev_err(emc->dev, "failed to add OPP table: %d\n", err);
+
+		goto put_hw_table;
+	}
+
+	dev_info_once(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
+		      hw_version, clk_get_rate(emc->clk) / 1000000);
+
+	/* first dummy rate-set initializes voltage state */
+	err = dev_pm_opp_set_rate(emc->dev, clk_get_rate(emc->clk));
+	if (err) {
+		dev_err(emc->dev, "failed to initialize OPP clock: %d\n", err);
+		goto remove_table;
+	}
+
+	return 0;
+
+remove_table:
+	dev_pm_opp_of_remove_table(emc->dev);
+put_hw_table:
+	dev_pm_opp_put_supported_hw(opp_token);
+
+	return err;
+}
+
+static void devm_tegra_emc_unset_callback(void *data)
+{
+	tegra124_clk_set_emc_callbacks(NULL, NULL);
+}
+
+static int tegra_emc_probe(struct platform_device *pdev)
+{
+	struct device_node *np;
+	struct tegra_emc *emc;
+	u32 ram_code;
+	int err;
+
+	emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
+	if (!emc)
+		return -ENOMEM;
+
+	mutex_init(&emc->rate_lock);
+	emc->dev = &pdev->dev;
+
+	emc->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(emc->regs))
+		return PTR_ERR(emc->regs);
+
+	emc->mc = devm_tegra_memory_controller_get(&pdev->dev);
+	if (IS_ERR(emc->mc))
+		return PTR_ERR(emc->mc);
+
+	ram_code = tegra_read_ram_code();
+
+	np = tegra_emc_find_node_by_ram_code(pdev->dev.of_node, ram_code);
+	if (np) {
+		err = tegra_emc_load_timings_from_dt(emc, np);
+		of_node_put(np);
+		if (err)
+			return err;
+	} else {
+		dev_info_once(&pdev->dev,
+			      "no memory timings for RAM code %u found in DT\n",
+			      ram_code);
+	}
+
+	err = emc_init(emc);
+	if (err) {
+		dev_err(&pdev->dev, "EMC initialization failed: %d\n", err);
+		return err;
+	}
+
+	platform_set_drvdata(pdev, emc);
+
+	tegra124_clk_set_emc_callbacks(tegra_emc_prepare_timing_change,
+				       tegra_emc_complete_timing_change);
+
+	err = devm_add_action_or_reset(&pdev->dev, devm_tegra_emc_unset_callback,
+				       NULL);
+	if (err)
+		return err;
+
+	err = platform_get_irq(pdev, 0);
+	if (err < 0)
+		return err;
+
+	emc->irq = err;
+
+	err = devm_request_irq(&pdev->dev, emc->irq, tegra_emc_isr, 0,
+			       dev_name(&pdev->dev), emc);
+	if (err) {
+		dev_err(&pdev->dev, "failed to request irq: %d\n", err);
+		return err;
+	}
+
+	emc->clk = devm_clk_get(&pdev->dev, "emc");
+	if (IS_ERR(emc->clk)) {
+		err = PTR_ERR(emc->clk);
+		dev_err(&pdev->dev, "failed to get EMC clock: %d\n", err);
+		return err;
+	}
+
+	err = tegra_emc_opp_table_init(emc);
+	if (err)
+		return err;
+
+	tegra_emc_rate_requests_init(emc);
+
+	if (IS_ENABLED(CONFIG_DEBUG_FS))
+		emc_debugfs_init(&pdev->dev, emc);
+
+	tegra_emc_interconnect_init(emc);
+
+	/*
+	 * Don't allow the kernel module to be unloaded. Unloading adds some
+	 * extra complexity which doesn't really worth the effort in a case of
+	 * this driver.
+	 */
+	try_module_get(THIS_MODULE);
+
+	return 0;
+};
+
+static const struct of_device_id tegra_emc_of_match[] = {
+	{ .compatible = "nvidia,tegra114-emc" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, tegra_emc_of_match);
+
+static struct platform_driver tegra_emc_driver = {
+	.probe = tegra_emc_probe,
+	.driver = {
+		.name = "tegra114-emc",
+		.of_match_table = tegra_emc_of_match,
+		.suppress_bind_attrs = true,
+		.sync_state = icc_sync_state,
+	},
+};
+module_platform_driver(tegra_emc_driver);
+
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("NVIDIA Tegra114 EMC driver");
+MODULE_LICENSE("GPL");
-- 
2.48.1



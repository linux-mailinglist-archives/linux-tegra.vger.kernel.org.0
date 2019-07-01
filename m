Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 087902D7A1
	for <lists+linux-tegra@lfdr.de>; Wed, 29 May 2019 10:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbfE2IWM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 29 May 2019 04:22:12 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:2662 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbfE2IWL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 May 2019 04:22:11 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cee412e0000>; Wed, 29 May 2019 01:22:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 May 2019 01:22:06 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 May 2019 01:22:06 -0700
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 May
 2019 08:22:05 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 29 May 2019 08:22:05 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cee412b0007>; Wed, 29 May 2019 01:22:05 -0700
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V4 6/8] memory: tegra: Add EMC scaling sequence code for Tegra210
Date:   Wed, 29 May 2019 16:21:37 +0800
Message-ID: <20190529082139.5581-7-josephl@nvidia.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529082139.5581-1-josephl@nvidia.com>
References: <20190529082139.5581-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559118126; bh=byJJk9A0cF+Ms3a1ViHjINsarn7yECY2jz044Sa3rfk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=N/6HcSq+dEPdQRFGyxwAZvFJBXcEKz+usq4fCchuap799RKhIaM3TRzuVtnRBMzbX
         dVzxkUvE5tFVBu+kv7LuQ6AXNZJMpnOPoU+/ILftIygyoOETX0ACbMYcVQhoYYHM3o
         ABeLIZ4prr0nYaaH68qLD1w+QH3PZv6XdDY2l5YiqoYy/ifCFtmXzi9r5FK1eNG8Yu
         jPwdUL+xOCv8oXmyqqVjdL2L2m8dDvJzT3UcC4QxNASFEDJVBVuvRHTTGyUSL9hUAY
         HoHFbykFF0ZWiLAB7gqhW8NG8YXH8JgrKBTdVPYwDFVN5oUpEv90JyNgAZp7/eDQtH
         nlrnDVIOCDTLA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch includes the sequence for clock tuning and the dynamic
training mechanism for the clock above 800MHz.

And historically there have been different sequences to change the EMC
clock. The sequence to be used is specified in the EMC table.
However, for the currently supported upstreaming platform, only the most
recent sequence is used. So only support that in this patch.

Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
v4:
- no change
---
 drivers/memory/tegra/Makefile                 |    2 +-
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 1953 +++++++++++++++++
 drivers/memory/tegra/tegra210-emc.c           |    5 +
 drivers/memory/tegra/tegra210-emc.h           |  157 ++
 4 files changed, 2116 insertions(+), 1 deletion(-)
 create mode 100644 drivers/memory/tegra/tegra210-emc-cc-r21021.c

diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
index f78bbb7cd16f..def087f13a09 100644
--- a/drivers/memory/tegra/Makefile
+++ b/drivers/memory/tegra/Makefile
@@ -12,5 +12,5 @@ obj-$(CONFIG_TEGRA_MC) +=3D tegra-mc.o
=20
 obj-$(CONFIG_TEGRA20_EMC)  +=3D tegra20-emc.o
 obj-$(CONFIG_TEGRA124_EMC) +=3D tegra124-emc.o
-obj-$(CONFIG_TEGRA210_EMC) +=3D tegra210-emc.o
+obj-$(CONFIG_TEGRA210_EMC) +=3D tegra210-emc.o tegra210-emc-cc-r21021.o
 obj-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D tegra186.o
diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory=
/tegra/tegra210-emc-cc-r21021.c
new file mode 100644
index 000000000000..ec5e1db71896
--- /dev/null
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -0,0 +1,1953 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2014-2019, NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/io.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/of.h>
+#include <soc/tegra/mc.h>
+
+#include "mc.h"
+#include "tegra210-emc.h"
+
+#define DVFS_CLOCK_CHANGE_VERSION	21021
+#define EMC_PRELOCK_VERSION		2101
+
+#define emc_cc_dbg(t, ...) pr_debug(__VA_ARGS__)
+
+/*
+ * Enable flags for specifying verbosity.
+ */
+#define INFO            (1 << 0)
+#define STEPS           (1 << 1)
+#define SUB_STEPS       (1 << 2)
+#define PRELOCK         (1 << 3)
+#define PRELOCK_STEPS   (1 << 4)
+#define ACTIVE_EN       (1 << 5)
+#define PRAMP_UP        (1 << 6)
+#define PRAMP_DN        (1 << 7)
+#define EMA_WRITES      (1 << 10)
+#define EMA_UPDATES     (1 << 11)
+#define PER_TRAIN       (1 << 16)
+#define CC_PRINT        (1 << 17)
+#define CCFIFO          (1 << 29)
+#define REGS            (1 << 30)
+#define REG_LISTS       (1 << 31)
+
+enum {
+	DVFS_SEQUENCE =3D 1,
+	WRITE_TRAINING_SEQUENCE =3D 2,
+	PERIODIC_TRAINING_SEQUENCE =3D 3,
+	DVFS_PT1 =3D 10,
+	DVFS_UPDATE =3D 11,
+	TRAINING_PT1 =3D 12,
+	TRAINING_UPDATE =3D 13,
+	PERIODIC_TRAINING_UPDATE =3D 14
+};
+
+/*
+ * PTFV defines - basically just indexes into the per table PTFV array.
+ */
+#define PTFV_DQSOSC_MOVAVG_C0D0U0_INDEX		0
+#define PTFV_DQSOSC_MOVAVG_C0D0U1_INDEX		1
+#define PTFV_DQSOSC_MOVAVG_C0D1U0_INDEX		2
+#define PTFV_DQSOSC_MOVAVG_C0D1U1_INDEX		3
+#define PTFV_DQSOSC_MOVAVG_C1D0U0_INDEX		4
+#define PTFV_DQSOSC_MOVAVG_C1D0U1_INDEX		5
+#define PTFV_DQSOSC_MOVAVG_C1D1U0_INDEX		6
+#define PTFV_DQSOSC_MOVAVG_C1D1U1_INDEX		7
+#define PTFV_DVFS_SAMPLES_INDEX			9
+#define PTFV_MOVAVG_WEIGHT_INDEX		10
+#define PTFV_CONFIG_CTRL_INDEX			11
+
+#define PTFV_CONFIG_CTRL_USE_PREVIOUS_EMA	(1 << 0)
+
+/*
+ * Do arithmetic in fixed point.
+ */
+#define MOVAVG_PRECISION_FACTOR		100
+
+/*
+ * The division portion of the average operation.
+ */
+#define __AVERAGE_PTFV(dev)						\
+	({ next_timing->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] =3D \
+	   next_timing->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] / \
+	   next_timing->ptfv_list[PTFV_DVFS_SAMPLES_INDEX]; })
+
+/*
+ * Convert val to fixed point and add it to the temporary average.
+ */
+#define __INCREMENT_PTFV(dev, val)					\
+	({ next_timing->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] +=3D \
+	   ((val) * MOVAVG_PRECISION_FACTOR); })
+
+/*
+ * Convert a moving average back to integral form and return the value.
+ */
+#define __MOVAVG_AC(timing, dev)					\
+	((timing)->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] /	\
+	 MOVAVG_PRECISION_FACTOR)
+
+/* Weighted update. */
+#define __WEIGHTED_UPDATE_PTFV(dev, nval)				\
+	do {								\
+		int w =3D PTFV_MOVAVG_WEIGHT_INDEX;			\
+		int dqs =3D PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX;		\
+									\
+		next_timing->ptfv_list[dqs] =3D				\
+			((nval * MOVAVG_PRECISION_FACTOR) +		\
+			 (next_timing->ptfv_list[dqs] *			\
+			  next_timing->ptfv_list[w])) /			\
+			(next_timing->ptfv_list[w] + 1);		\
+									\
+		emc_cc_dbg(EMA_UPDATES, "%s: (s=3D%u) EMA: %u\n",		\
+			   __stringify(dev), nval,			\
+			   next_timing->ptfv_list[dqs]);		\
+	} while (0)
+
+/* Access a particular average. */
+#define __MOVAVG(timing, dev)                      \
+	((timing)->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX])
+
+static u32 update_clock_tree_delay(struct tegra_emc *emc,
+				   u32 dram_dev_num, u32 channel_mode, int type)
+{
+	u32 mrr_req =3D 0, mrr_data =3D 0;
+	u32 temp0_0 =3D 0, temp0_1 =3D 0, temp1_0 =3D 0, temp1_1 =3D 0;
+	s32 tdel =3D 0, tmdel =3D 0, adel =3D 0;
+	u32 cval =3D 0;
+	struct emc_table *last_timing =3D emc->current_timing;
+	struct emc_table *next_timing =3D emc->next_timing;
+	u32 last_timing_rate_mhz =3D last_timing->rate / 1000;
+	u32 next_timing_rate_mhz =3D next_timing->rate / 1000;
+	int dvfs_pt1 =3D type =3D=3D DVFS_PT1;
+	int dvfs_update =3D type =3D=3D DVFS_UPDATE;
+	int periodic_training_update =3D type =3D=3D PERIODIC_TRAINING_UPDATE;
+
+	/*
+	 * Dev0 MSB.
+	 */
+	if (dvfs_pt1 || periodic_training_update) {
+		mrr_req =3D (2 << EMC_MRR_DEV_SEL_SHIFT) |
+			(19 << EMC_MRR_MA_SHIFT);
+		emc_writel(emc, mrr_req, EMC_MRR);
+
+		WARN(emc_wait_for_update(emc, EMC_EMC_STATUS,
+					 EMC_EMC_STATUS_MRR_DIVLD, 1, REG_EMC),
+		     "Timed out waiting for MRR 19 (ch=3D0)\n");
+		if (channel_mode =3D=3D DUAL_CHANNEL)
+			WARN(emc_wait_for_update(emc, EMC_EMC_STATUS,
+						 EMC_EMC_STATUS_MRR_DIVLD, 1,
+						 REG_EMC1),
+			     "Timed out waiting for MRR 19 (ch=3D1)\n");
+
+		mrr_data =3D (emc_readl(emc, EMC_MRR) & EMC_MRR_DATA_MASK) <<
+			   EMC_MRR_DATA_SHIFT;
+
+		temp0_0 =3D (mrr_data & 0xff) << 8;
+		temp0_1 =3D mrr_data & 0xff00;
+
+		if (channel_mode =3D=3D DUAL_CHANNEL) {
+			mrr_data =3D (emc1_readl(emc, EMC_MRR) &
+				    EMC_MRR_DATA_MASK) <<
+				   EMC_MRR_DATA_SHIFT;
+			temp1_0 =3D (mrr_data & 0xff) << 8;
+			temp1_1 =3D mrr_data & 0xff00;
+		}
+
+		/*
+		 * Dev0 LSB.
+		 */
+		mrr_req =3D (mrr_req & ~EMC_MRR_MA_MASK) |
+			  (18 << EMC_MRR_MA_SHIFT);
+		emc_writel(emc, mrr_req, EMC_MRR);
+
+		WARN(emc_wait_for_update(emc, EMC_EMC_STATUS,
+					 EMC_EMC_STATUS_MRR_DIVLD, 1, REG_EMC),
+		     "Timed out waiting for MRR 18 (ch=3D0)\n");
+		if (channel_mode =3D=3D DUAL_CHANNEL)
+			WARN(emc_wait_for_update(emc, EMC_EMC_STATUS,
+						 EMC_EMC_STATUS_MRR_DIVLD, 1,
+						 REG_EMC1),
+			     "Timed out waiting for MRR 18 (ch=3D1)\n");
+
+		mrr_data =3D (emc_readl(emc, EMC_MRR) & EMC_MRR_DATA_MASK) <<
+			   EMC_MRR_DATA_SHIFT;
+
+		temp0_0 |=3D mrr_data & 0xff;
+		temp0_1 |=3D (mrr_data & 0xff00) >> 8;
+
+		if (channel_mode =3D=3D DUAL_CHANNEL) {
+			mrr_data =3D (emc1_readl(emc, EMC_MRR) &
+				    EMC_MRR_DATA_MASK) <<
+				   EMC_MRR_DATA_SHIFT;
+			temp1_0 |=3D (mrr_data & 0xff);
+			temp1_1 |=3D (mrr_data & 0xff00) >> 8;
+		}
+	}
+
+	if (dvfs_pt1 || periodic_training_update)
+		cval =3D (1000000 * tegra210_actual_osc_clocks(
+					last_timing->run_clocks)) /
+		       (last_timing_rate_mhz * 2 * temp0_0);
+
+	if (dvfs_pt1)
+		__INCREMENT_PTFV(C0D0U0, cval);
+	else if (dvfs_update)
+		__AVERAGE_PTFV(C0D0U0);
+	else if (periodic_training_update)
+		__WEIGHTED_UPDATE_PTFV(C0D0U0, cval);
+
+	if (dvfs_update || periodic_training_update) {
+		tdel =3D next_timing->current_dram_clktree[C0D0U0] -
+			__MOVAVG_AC(next_timing, C0D0U0);
+		tmdel =3D (tdel < 0) ? -1 * tdel : tdel;
+		adel =3D tmdel;
+		if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
+		    next_timing->tree_margin)
+			next_timing->current_dram_clktree[C0D0U0] =3D
+				__MOVAVG_AC(next_timing, C0D0U0);
+	}
+
+	if (dvfs_pt1 || periodic_training_update)
+		cval =3D (1000000 * tegra210_actual_osc_clocks(
+					last_timing->run_clocks)) /
+		       (last_timing_rate_mhz * 2 * temp0_1);
+
+	if (dvfs_pt1)
+		__INCREMENT_PTFV(C0D0U1, cval);
+	else if (dvfs_update)
+		__AVERAGE_PTFV(C0D0U1);
+	else if (periodic_training_update)
+		__WEIGHTED_UPDATE_PTFV(C0D0U1, cval);
+
+	if (dvfs_update || periodic_training_update) {
+		tdel =3D next_timing->current_dram_clktree[C0D0U1] -
+			__MOVAVG_AC(next_timing, C0D0U1);
+		tmdel =3D (tdel < 0) ? -1 * tdel : tdel;
+
+		if (tmdel > adel)
+			adel =3D tmdel;
+
+		if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
+		    next_timing->tree_margin)
+			next_timing->current_dram_clktree[C0D0U1] =3D
+				__MOVAVG_AC(next_timing, C0D0U1);
+	}
+
+	if (channel_mode =3D=3D DUAL_CHANNEL) {
+		if (dvfs_pt1 || periodic_training_update)
+			cval =3D (1000000 * tegra210_actual_osc_clocks(
+						last_timing->run_clocks)) /
+			       (last_timing_rate_mhz * 2 * temp1_0);
+		if (dvfs_pt1)
+			__INCREMENT_PTFV(C1D0U0, cval);
+		else if (dvfs_update)
+			__AVERAGE_PTFV(C1D0U0);
+		else if (periodic_training_update)
+			__WEIGHTED_UPDATE_PTFV(C1D0U0, cval);
+
+		if (dvfs_update || periodic_training_update) {
+			tdel =3D next_timing->current_dram_clktree[C1D0U0] -
+				__MOVAVG_AC(next_timing, C1D0U0);
+			tmdel =3D (tdel < 0) ? -1 * tdel : tdel;
+
+			if (tmdel > adel)
+				adel =3D tmdel;
+
+			if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
+			    next_timing->tree_margin)
+				next_timing->current_dram_clktree[C1D0U0] =3D
+					__MOVAVG_AC(next_timing, C1D0U0);
+		}
+
+		if (dvfs_pt1 || periodic_training_update)
+			cval =3D (1000000 * tegra210_actual_osc_clocks(
+						last_timing->run_clocks)) /
+			       (last_timing_rate_mhz * 2 * temp1_1);
+		if (dvfs_pt1)
+			__INCREMENT_PTFV(C1D0U1, cval);
+		else if (dvfs_update)
+			__AVERAGE_PTFV(C1D0U1);
+		else if (periodic_training_update)
+			__WEIGHTED_UPDATE_PTFV(C1D0U1, cval);
+
+		if (dvfs_update || periodic_training_update) {
+			tdel =3D next_timing->current_dram_clktree[C1D0U1] -
+				__MOVAVG_AC(next_timing, C1D0U1);
+			tmdel =3D (tdel < 0) ? -1 * tdel : tdel;
+
+			if (tmdel > adel)
+				adel =3D tmdel;
+
+			if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
+			    next_timing->tree_margin)
+				next_timing->current_dram_clktree[C1D0U1] =3D
+					__MOVAVG_AC(next_timing, C1D0U1);
+		}
+	}
+
+	if (dram_dev_num !=3D TWO_RANK)
+		goto done;
+
+	/*
+	 * Dev1 MSB.
+	 */
+	if (dvfs_pt1 || periodic_training_update) {
+		mrr_req =3D (1 << EMC_MRR_DEV_SEL_SHIFT) |
+			  (19 << EMC_MRR_MA_SHIFT);
+		emc_writel(emc, mrr_req, EMC_MRR);
+
+		WARN(emc_wait_for_update(emc, EMC_EMC_STATUS,
+					 EMC_EMC_STATUS_MRR_DIVLD, 1, REG_EMC),
+		     "Timed out waiting for MRR 19 (ch=3D0)\n");
+		if (channel_mode =3D=3D DUAL_CHANNEL)
+			WARN(emc_wait_for_update(emc, EMC_EMC_STATUS,
+						 EMC_EMC_STATUS_MRR_DIVLD, 1,
+						 REG_EMC1),
+			     "Timed out waiting for MRR 19 (ch=3D1)\n");
+
+		mrr_data =3D (emc_readl(emc, EMC_MRR) & EMC_MRR_DATA_MASK) <<
+			   EMC_MRR_DATA_SHIFT;
+
+		temp0_0 =3D (mrr_data & 0xff) << 8;
+		temp0_1 =3D mrr_data & 0xff00;
+
+		if (channel_mode =3D=3D DUAL_CHANNEL) {
+			mrr_data =3D (emc1_readl(emc, EMC_MRR) &
+				    EMC_MRR_DATA_MASK) <<
+				   EMC_MRR_DATA_SHIFT;
+			temp1_0 =3D (mrr_data & 0xff) << 8;
+			temp1_1 =3D mrr_data & 0xff00;
+		}
+
+		/*
+		 * Dev1 LSB.
+		 */
+		mrr_req =3D (mrr_req & ~EMC_MRR_MA_MASK) |
+			  (18 << EMC_MRR_MA_SHIFT);
+		emc_writel(emc, mrr_req, EMC_MRR);
+
+		WARN(emc_wait_for_update(emc, EMC_EMC_STATUS,
+					 EMC_EMC_STATUS_MRR_DIVLD, 1, REG_EMC),
+		     "Timed out waiting for MRR 18 (ch=3D0)\n");
+		if (channel_mode =3D=3D DUAL_CHANNEL)
+			WARN(emc_wait_for_update(emc, EMC_EMC_STATUS,
+						 EMC_EMC_STATUS_MRR_DIVLD, 1,
+						 REG_EMC1),
+			     "Timed out waiting for MRR 18 (ch=3D1)\n");
+
+		mrr_data =3D (emc_readl(emc, EMC_MRR) & EMC_MRR_DATA_MASK) <<
+			   EMC_MRR_DATA_SHIFT;
+
+		temp0_0 |=3D mrr_data & 0xff;
+		temp0_1 |=3D (mrr_data & 0xff00) >> 8;
+
+		if (channel_mode =3D=3D DUAL_CHANNEL) {
+			mrr_data =3D (emc1_readl(emc, EMC_MRR) &
+				    EMC_MRR_DATA_MASK) <<
+				   EMC_MRR_DATA_SHIFT;
+			temp1_0 |=3D (mrr_data & 0xff);
+			temp1_1 |=3D (mrr_data & 0xff00) >> 8;
+		}
+	}
+
+	if (dvfs_pt1 || periodic_training_update)
+		cval =3D (1000000 * tegra210_actual_osc_clocks(
+					last_timing->run_clocks)) /
+		       (last_timing_rate_mhz * 2 * temp0_0);
+
+	if (dvfs_pt1)
+		__INCREMENT_PTFV(C0D1U0, cval);
+	else if (dvfs_update)
+		__AVERAGE_PTFV(C0D1U0);
+	else if (periodic_training_update)
+		__WEIGHTED_UPDATE_PTFV(C0D1U0, cval);
+
+	if (dvfs_update || periodic_training_update) {
+		tdel =3D next_timing->current_dram_clktree[C0D1U0] -
+		       __MOVAVG_AC(next_timing, C0D1U0);
+		tmdel =3D (tdel < 0) ? -1 * tdel : tdel;
+		if (tmdel > adel)
+			adel =3D tmdel;
+
+		if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
+		    next_timing->tree_margin)
+			next_timing->current_dram_clktree[C0D1U0] =3D
+				__MOVAVG_AC(next_timing, C0D1U0);
+	}
+
+	if (dvfs_pt1 || periodic_training_update)
+		cval =3D (1000000 * tegra210_actual_osc_clocks(
+					last_timing->run_clocks)) /
+		       (last_timing_rate_mhz * 2 * temp0_1);
+
+	if (dvfs_pt1)
+		__INCREMENT_PTFV(C0D1U1, cval);
+	else if (dvfs_update)
+		__AVERAGE_PTFV(C0D1U1);
+	else if (periodic_training_update)
+		__WEIGHTED_UPDATE_PTFV(C0D1U1, cval);
+
+	if (dvfs_update || periodic_training_update) {
+		tdel =3D next_timing->current_dram_clktree[C0D1U1] -
+		       __MOVAVG_AC(next_timing, C0D1U1);
+		tmdel =3D (tdel < 0) ? -1 * tdel : tdel;
+		if (tmdel > adel)
+			adel =3D tmdel;
+
+		if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
+		    next_timing->tree_margin)
+			next_timing->current_dram_clktree[C0D1U1] =3D
+				__MOVAVG_AC(next_timing, C0D1U1);
+	}
+
+	if (channel_mode =3D=3D DUAL_CHANNEL) {
+		if (dvfs_pt1 || periodic_training_update)
+			cval =3D (1000000 * tegra210_actual_osc_clocks(
+						last_timing->run_clocks)) /
+			       (last_timing_rate_mhz * 2 * temp1_0);
+
+		if (dvfs_pt1)
+			__INCREMENT_PTFV(C1D1U0, cval);
+		else if (dvfs_update)
+			__AVERAGE_PTFV(C1D1U0);
+		else if (periodic_training_update)
+			__WEIGHTED_UPDATE_PTFV(C1D1U0, cval);
+
+		if (dvfs_update || periodic_training_update) {
+			tdel =3D next_timing->current_dram_clktree[C1D1U0] -
+			       __MOVAVG_AC(next_timing, C1D1U0);
+			tmdel =3D (tdel < 0) ? -1 * tdel : tdel;
+			if (tmdel > adel)
+				adel =3D tmdel;
+
+			if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
+			    next_timing->tree_margin)
+				next_timing->current_dram_clktree[C1D1U0] =3D
+					__MOVAVG_AC(next_timing, C1D1U0);
+		}
+
+		if (dvfs_pt1 || periodic_training_update)
+			cval =3D (1000000 * tegra210_actual_osc_clocks(
+						last_timing->run_clocks)) /
+			       (last_timing_rate_mhz * 2 * temp1_1);
+
+		if (dvfs_pt1)
+			__INCREMENT_PTFV(C1D1U1, cval);
+		else if (dvfs_update)
+			__AVERAGE_PTFV(C1D1U1);
+		else if (periodic_training_update)
+			__WEIGHTED_UPDATE_PTFV(C1D1U1, cval);
+
+		if (dvfs_update || periodic_training_update) {
+			tdel =3D next_timing->current_dram_clktree[C1D1U1] -
+			       __MOVAVG_AC(next_timing, C1D1U1);
+			tmdel =3D (tdel < 0) ? -1 * tdel : tdel;
+			if (tmdel > adel)
+				adel =3D tmdel;
+
+			if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
+			    next_timing->tree_margin)
+				next_timing->current_dram_clktree[C1D1U1] =3D
+					__MOVAVG_AC(next_timing, C1D1U1);
+		}
+	}
+
+done:
+	return adel;
+}
+
+static u32 periodic_compensation_handler(struct tegra_emc *emc, u32 type,
+					 u32 dram_dev_num,
+					 u32 channel_mode,
+					 struct emc_table *last_timing,
+					 struct emc_table *next_timing)
+{
+#define __COPY_EMA(nt, lt, dev)						\
+	({ __MOVAVG(nt, dev) =3D __MOVAVG(lt, dev) *			\
+	   (nt)->ptfv_list[PTFV_DVFS_SAMPLES_INDEX]; })
+
+	u32 i;
+	u32 adel =3D 0;
+	u32 samples =3D next_timing->ptfv_list[PTFV_DVFS_SAMPLES_INDEX];
+	u32 delay =3D 2 +
+		(1000 * tegra210_actual_osc_clocks(last_timing->run_clocks) /
+		last_timing->rate);
+
+	if (!next_timing->periodic_training)
+		return 0;
+
+	if (type =3D=3D DVFS_SEQUENCE) {
+		if (last_timing->periodic_training &&
+		    (next_timing->ptfv_list[PTFV_CONFIG_CTRL_INDEX] &
+		     PTFV_CONFIG_CTRL_USE_PREVIOUS_EMA)) {
+			/*
+			 * If the previous frequency was using periodic
+			 * calibration then we can reuse the previous
+			 * frequencies EMA data.
+			 */
+			__COPY_EMA(next_timing, last_timing, C0D0U0);
+			__COPY_EMA(next_timing, last_timing, C0D0U1);
+			__COPY_EMA(next_timing, last_timing, C1D0U0);
+			__COPY_EMA(next_timing, last_timing, C1D0U1);
+			__COPY_EMA(next_timing, last_timing, C0D1U0);
+			__COPY_EMA(next_timing, last_timing, C0D1U1);
+			__COPY_EMA(next_timing, last_timing, C1D1U0);
+			__COPY_EMA(next_timing, last_timing, C1D1U1);
+		} else {
+			/* Reset the EMA.*/
+			__MOVAVG(next_timing, C0D0U0) =3D 0;
+			__MOVAVG(next_timing, C0D0U1) =3D 0;
+			__MOVAVG(next_timing, C1D0U0) =3D 0;
+			__MOVAVG(next_timing, C1D0U1) =3D 0;
+			__MOVAVG(next_timing, C0D1U0) =3D 0;
+			__MOVAVG(next_timing, C0D1U1) =3D 0;
+			__MOVAVG(next_timing, C1D1U0) =3D 0;
+			__MOVAVG(next_timing, C1D1U1) =3D 0;
+
+			for (i =3D 0; i < samples; i++) {
+				tegra210_start_periodic_compensation(emc);
+				udelay(delay);
+
+				/*
+				 * Generate next sample of data.
+				 */
+				adel =3D update_clock_tree_delay(emc,
+							dram_dev_num,
+							channel_mode,
+							DVFS_PT1);
+			}
+		}
+
+		/*
+		 * Seems like it should be part of the
+		 * 'if (last_timing->periodic_training)' conditional
+		 * since is already done for the else clause.
+		 */
+		adel =3D update_clock_tree_delay(emc,
+					       dram_dev_num,
+					       channel_mode,
+					       DVFS_UPDATE);
+	}
+
+	if (type =3D=3D PERIODIC_TRAINING_SEQUENCE) {
+		tegra210_start_periodic_compensation(emc);
+		udelay(delay);
+
+		adel =3D update_clock_tree_delay(emc,
+					       dram_dev_num,
+					       channel_mode,
+					       PERIODIC_TRAINING_UPDATE);
+	}
+
+	return adel;
+}
+
+u32 __do_periodic_emc_compensation_r21021(struct tegra_emc *emc)
+{
+	u32 dram_dev_num;
+	u32 channel_mode;
+	u32 emc_cfg, emc_cfg_o;
+	u32 emc_dbg_o;
+	u32 del, i;
+	u32 list[] =3D {
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3,
+		EMC_DATA_BRLSHFT_0,
+		EMC_DATA_BRLSHFT_1
+	};
+	u32 items =3D ARRAY_SIZE(list);
+	u32 emc_cfg_update;
+	struct emc_table *current_timing =3D emc->current_timing;
+
+	if (current_timing->periodic_training) {
+		channel_mode =3D
+			!!(current_timing->burst_regs[EMC_FBIO_CFG7_INDEX] &
+			(1 << 2));
+		dram_dev_num =3D 1 + (mc_readl(emc->mc, MC_EMEM_ADR_CFG) & 0x1);
+
+		emc_cc_dbg(PER_TRAIN, "Periodic training starting\n");
+
+		emc_dbg_o =3D emc_readl(emc, EMC_DBG);
+		emc_cfg_o =3D emc_readl(emc, EMC_CFG);
+		emc_cfg =3D emc_cfg_o & ~(EMC_CFG_DYN_SELF_REF |
+					EMC_CFG_DRAM_ACPD |
+					EMC_CFG_DRAM_CLKSTOP_PD |
+					EMC_CFG_DRAM_CLKSTOP_PD);
+
+
+		/*
+		 * 1. Power optimizations should be off.
+		 */
+		emc_writel(emc, emc_cfg, EMC_CFG);
+
+		/* Does emc_timing_update() for above changes. */
+		tegra210_dll_disable(emc, channel_mode);
+
+		emc_wait_for_update(emc, EMC_EMC_STATUS,
+				    EMC_EMC_STATUS_DRAM_IN_POWERDOWN_MASK, 0,
+				    REG_EMC);
+		if (channel_mode)
+			emc_wait_for_update(emc, EMC_EMC_STATUS,
+					EMC_EMC_STATUS_DRAM_IN_POWERDOWN_MASK,
+					0, REG_EMC1);
+
+		emc_wait_for_update(emc, EMC_EMC_STATUS,
+				    EMC_EMC_STATUS_DRAM_IN_SELF_REFRESH_MASK,
+				    0, REG_EMC);
+		if (channel_mode)
+			emc_wait_for_update(emc, EMC_EMC_STATUS,
+				EMC_EMC_STATUS_DRAM_IN_SELF_REFRESH_MASK, 0,
+				REG_EMC1);
+
+		emc_cfg_update =3D emc_readl(emc, EMC_CFG_UPDATE);
+		emc_writel(emc, (emc_cfg_update &
+			    ~EMC_CFG_UPDATE_UPDATE_DLL_IN_UPDATE_MASK) |
+			   (2 << EMC_CFG_UPDATE_UPDATE_DLL_IN_UPDATE_SHIFT),
+			   EMC_CFG_UPDATE);
+
+		/*
+		 * 2. osc kick off - this assumes training and dvfs have set
+		 *    correct MR23.
+		 */
+		tegra210_start_periodic_compensation(emc);
+
+		/*
+		 * 3. Let dram capture its clock tree delays.
+		 */
+		udelay((tegra210_actual_osc_clocks(current_timing->run_clocks) *
+			1000) /
+		       current_timing->rate + 1);
+
+		/*
+		 * 4. Check delta wrt previous values (save value if margin
+		 *    exceeds what is set in table).
+		 */
+		del =3D periodic_compensation_handler(emc,
+						    PERIODIC_TRAINING_SEQUENCE,
+						    dram_dev_num,
+						    channel_mode,
+						    current_timing,
+						    current_timing);
+
+		/*
+		 * 5. Apply compensation w.r.t. trained values (if clock tree
+		 *    has drifted more than the set margin).
+		 */
+		if (current_timing->tree_margin <
+		    ((del * 128 * (current_timing->rate / 1000)) / 1000000)) {
+			for (i =3D 0; i < items; i++) {
+				u32 tmp =3D
+				tegra210_apply_periodic_compensation_trimmer(
+				current_timing, list[i]);
+
+				emc_cc_dbg(EMA_WRITES, "0x%08x <=3D 0x%08x\n",
+					   list[i], tmp);
+				emc_writel(emc, tmp, list[i]);
+			}
+		}
+
+		emc_writel(emc, emc_cfg_o, EMC_CFG);
+
+		/*
+		 * 6. Timing update actally applies the new trimmers.
+		 */
+		emc_timing_update(emc, channel_mode);
+
+		/* 6.1. Restore the UPDATE_DLL_IN_UPDATE field. */
+		emc_writel(emc, emc_cfg_update, EMC_CFG_UPDATE);
+
+		/* 6.2. Restore the DLL. */
+		tegra210_dll_enable(emc, channel_mode);
+	}
+
+	return 0;
+}
+
+/*
+ * Do the clock change sequence.
+ */
+void emc_set_clock_r21021(struct tegra_emc *emc, u32 clksrc)
+{
+	/*
+	 * This is the timing table for the source frequency. It does _not_
+	 * necessarily correspond to the actual timing values in the EMC at the
+	 * moment. If the boot BCT differs from the table then this can happen.
+	 * However, we need it for accessing the dram_timings (which are not
+	 * really registers) array for the current frequency.
+	 */
+	struct emc_table *fake_timing;
+	struct emc_table *last_timing =3D emc->current_timing;
+	struct emc_table *next_timing =3D emc->next_timing;
+
+	u32 i, tmp;
+
+	u32 cya_allow_ref_cc =3D 0, ref_b4_sref_en =3D 0, cya_issue_pc_ref =3D 0;
+
+	u32 zqcal_before_cc_cutoff =3D 2400; /* In picoseconds */
+	u32 ref_delay_mult;
+	u32 ref_delay;
+	s32 zq_latch_dvfs_wait_time;
+	s32 tZQCAL_lpddr4_fc_adj;
+	/* Scaled by x1000 */
+	u32 tFC_lpddr4 =3D 1000 * next_timing->dram_timings[T_FC_LPDDR4];
+	u32 tZQCAL_lpddr4 =3D 1000000;
+
+	u32 dram_type, dram_dev_num, shared_zq_resistor;
+	u32 channel_mode;
+	u32 is_lpddr3;
+
+	u32 emc_cfg, emc_sel_dpd_ctrl, emc_cfg_reg;
+
+	u32 emc_dbg;
+	u32 emc_zcal_interval;
+	u32 emc_zcal_wait_cnt_old;
+	u32 emc_zcal_wait_cnt_new;
+	u32 emc_dbg_active;
+	u32 zq_op;
+	u32 zcal_wait_time_clocks;
+	u32 zcal_wait_time_ps;
+
+	u32 emc_auto_cal_config;
+	u32 auto_cal_en;
+
+	u32 mr13_catr_enable;
+
+	u32 ramp_up_wait =3D 0, ramp_down_wait =3D 0;
+
+	/* In picoseconds. */
+	u32 source_clock_period;
+	u32 destination_clock_period;
+
+	u32 emc_dbg_o;
+	u32 emc_cfg_pipe_clk_o;
+	u32 emc_pin_o;
+
+	u32 mr13_flip_fspwr;
+	u32 mr13_flip_fspop;
+
+	u32 opt_zcal_en_cc;
+	u32 opt_do_sw_qrst =3D 1;
+	u32 opt_dvfs_mode;
+	u32 opt_dll_mode;
+	u32 opt_cc_short_zcal =3D 1;
+	u32 opt_short_zcal =3D 1;
+	u32 save_restore_clkstop_pd =3D 1;
+
+	u32 prelock_dll_en =3D 0, dll_out;
+
+	int next_push, next_dq_e_ivref, next_dqs_e_ivref;
+
+	u32 opt_war_200024907;
+	u32 zq_wait_long;
+	u32 zq_wait_short;
+
+	u32 bg_regulator_switch_complete_wait_clks;
+	u32 bg_regulator_mode_change;
+	u32 enable_bglp_regulator;
+	u32 enable_bg_regulator;
+
+	u32 tRTM;
+	u32 RP_war;
+	u32 R2P_war;
+	u32 TRPab_war;
+	s32 nRTP;
+	u32 deltaTWATM;
+	u32 W2P_war;
+	u32 tRPST;
+
+	u32 mrw_req;
+	u32 adel =3D 0, compensate_trimmer_applicable =3D 0;
+	u32 next_timing_rate_mhz =3D next_timing->rate / 1000;
+
+	static u32 fsp_for_next_freq;
+
+	emc_cc_dbg(INFO, "Running clock change.\n");
+
+	fake_timing =3D emc_get_timing_from_freq(emc, last_timing->rate);
+
+	fsp_for_next_freq =3D !fsp_for_next_freq;
+
+	dram_type =3D emc_readl(emc, EMC_FBIO_CFG5) &
+		    EMC_FBIO_CFG5_DRAM_TYPE_MASK >>
+		    EMC_FBIO_CFG5_DRAM_TYPE_SHIFT;
+	shared_zq_resistor =3D last_timing->burst_regs[EMC_ZCAL_WAIT_CNT_INDEX] &
+			     1 << 31;
+	channel_mode =3D !!(last_timing->burst_regs[EMC_FBIO_CFG7_INDEX] &
+			  1 << 2);
+	opt_zcal_en_cc =3D (next_timing->burst_regs[EMC_ZCAL_INTERVAL_INDEX] &&
+			  !last_timing->burst_regs[EMC_ZCAL_INTERVAL_INDEX]) ||
+			  dram_type =3D=3D DRAM_TYPE_LPDDR4;
+	opt_dll_mode =3D (dram_type =3D=3D DRAM_TYPE_DDR3) ?
+		       emc_get_dll_state(next_timing) : DLL_OFF;
+	is_lpddr3 =3D (dram_type =3D=3D DRAM_TYPE_LPDDR2) &&
+		    next_timing->burst_regs[EMC_FBIO_CFG5_INDEX] &
+		    1 << 25;
+	opt_war_200024907 =3D (dram_type =3D=3D DRAM_TYPE_LPDDR4);
+	opt_dvfs_mode =3D MAN_SR;
+	dram_dev_num =3D (mc_readl(emc->mc, MC_EMEM_ADR_CFG) & 0x1) + 1;
+
+	emc_cfg_reg =3D emc_readl(emc, EMC_CFG);
+	emc_auto_cal_config =3D emc_readl(emc, EMC_AUTO_CAL_CONFIG);
+
+	source_clock_period =3D 1000000000 / last_timing->rate;
+	destination_clock_period =3D 1000000000 / next_timing->rate;
+
+	tZQCAL_lpddr4_fc_adj =3D (destination_clock_period >
+				zqcal_before_cc_cutoff) ?
+		tZQCAL_lpddr4 / destination_clock_period :
+		(tZQCAL_lpddr4 - tFC_lpddr4) / destination_clock_period;
+	emc_dbg_o =3D emc_readl(emc, EMC_DBG);
+	emc_pin_o =3D emc_readl(emc, EMC_PIN);
+	emc_cfg_pipe_clk_o =3D emc_readl(emc, EMC_CFG_PIPE_CLK);
+	emc_dbg =3D emc_dbg_o;
+
+	emc_cfg =3D next_timing->burst_regs[EMC_CFG_INDEX];
+	emc_cfg &=3D ~(EMC_CFG_DYN_SELF_REF | EMC_CFG_DRAM_ACPD |
+		     EMC_CFG_DRAM_CLKSTOP_SR | EMC_CFG_DRAM_CLKSTOP_PD);
+	emc_sel_dpd_ctrl =3D next_timing->emc_sel_dpd_ctrl;
+	emc_sel_dpd_ctrl &=3D ~(EMC_SEL_DPD_CTRL_CLK_SEL_DPD_EN |
+			      EMC_SEL_DPD_CTRL_CA_SEL_DPD_EN |
+			      EMC_SEL_DPD_CTRL_RESET_SEL_DPD_EN |
+			      EMC_SEL_DPD_CTRL_ODT_SEL_DPD_EN |
+			      EMC_SEL_DPD_CTRL_DATA_SEL_DPD_EN);
+
+	emc_cc_dbg(INFO, "Clock change version: %d\n",
+		   DVFS_CLOCK_CHANGE_VERSION);
+	emc_cc_dbg(INFO, "DRAM type =3D %d\n", dram_type);
+	emc_cc_dbg(INFO, "DRAM dev #: %d\n", dram_dev_num);
+	emc_cc_dbg(INFO, "Next EMC clksrc: 0x%08x\n", clksrc);
+	emc_cc_dbg(INFO, "DLL clksrc:      0x%08x\n", next_timing->dll_clk_src);
+	emc_cc_dbg(INFO, "last rate: %u, next rate %u\n", last_timing->rate,
+		   next_timing->rate);
+	emc_cc_dbg(INFO, "last period: %u, next period: %u\n",
+		   source_clock_period, destination_clock_period);
+	emc_cc_dbg(INFO, "  shared_zq_resistor: %d\n", !!shared_zq_resistor);
+	emc_cc_dbg(INFO, "  channel_mode: %d\n", channel_mode);
+	emc_cc_dbg(INFO, "  opt_dll_mode: %d\n", opt_dll_mode);
+
+	/*
+	 * Step 1:
+	 *   Pre DVFS SW sequence.
+	 */
+	emc_cc_dbg(STEPS, "Step 1\n");
+	emc_cc_dbg(STEPS, "Step 1.1: Disable DLL temporarily.\n");
+	tmp =3D emc_readl(emc, EMC_CFG_DIG_DLL);
+	tmp &=3D ~EMC_CFG_DIG_DLL_CFG_DLL_EN;
+	emc_writel(emc, tmp, EMC_CFG_DIG_DLL);
+
+	emc_timing_update(emc, channel_mode);
+	emc_wait_for_update(emc, EMC_CFG_DIG_DLL,
+			    EMC_CFG_DIG_DLL_CFG_DLL_EN, 0, REG_EMC);
+	if (channel_mode)
+		emc_wait_for_update(emc, EMC_CFG_DIG_DLL,
+				    EMC_CFG_DIG_DLL_CFG_DLL_EN, 0, REG_EMC1);
+
+	emc_cc_dbg(STEPS, "Step 1.2: Disable AUTOCAL temporarily.\n");
+	emc_auto_cal_config =3D next_timing->emc_auto_cal_config;
+	auto_cal_en =3D emc_auto_cal_config & EMC_AUTO_CAL_CONFIG_AUTO_CAL_ENABLE=
;
+	emc_auto_cal_config &=3D ~EMC_AUTO_CAL_CONFIG_AUTO_CAL_START;
+	emc_auto_cal_config |=3D  EMC_AUTO_CAL_CONFIG_AUTO_CAL_MEASURE_STALL;
+	emc_auto_cal_config |=3D  EMC_AUTO_CAL_CONFIG_AUTO_CAL_UPDATE_STALL;
+	emc_auto_cal_config |=3D  auto_cal_en;
+	emc_writel(emc, emc_auto_cal_config, EMC_AUTO_CAL_CONFIG);
+	emc_readl(emc, EMC_AUTO_CAL_CONFIG); /* Flush write. */
+
+	emc_cc_dbg(STEPS, "Step 1.3: Disable other power features.\n");
+	emc_set_shadow_bypass(emc, ACTIVE);
+	emc_writel(emc, emc_cfg, EMC_CFG);
+	emc_writel(emc, emc_sel_dpd_ctrl, EMC_SEL_DPD_CTRL);
+	emc_set_shadow_bypass(emc, ASSEMBLY);
+
+	if (next_timing->periodic_training) {
+		tegra210_reset_dram_clktree_values(next_timing);
+
+		emc_wait_for_update(emc, EMC_EMC_STATUS,
+				    EMC_EMC_STATUS_DRAM_IN_POWERDOWN_MASK, 0,
+				    REG_EMC);
+		if (channel_mode)
+			emc_wait_for_update(emc, EMC_EMC_STATUS,
+					EMC_EMC_STATUS_DRAM_IN_POWERDOWN_MASK,
+					0, REG_EMC1);
+
+		emc_wait_for_update(emc, EMC_EMC_STATUS,
+				    EMC_EMC_STATUS_DRAM_IN_SELF_REFRESH_MASK, 0,
+				    REG_EMC);
+		if (channel_mode)
+			emc_wait_for_update(emc, EMC_EMC_STATUS,
+				EMC_EMC_STATUS_DRAM_IN_SELF_REFRESH_MASK, 0,
+				REG_EMC1);
+
+		tegra210_start_periodic_compensation(emc);
+
+		udelay(((1000 *
+			 tegra210_actual_osc_clocks(last_timing->run_clocks)) /
+			last_timing->rate) + 2);
+		adel =3D periodic_compensation_handler(emc, DVFS_SEQUENCE,
+						     dram_dev_num,
+						     channel_mode,
+						     fake_timing, next_timing);
+		compensate_trimmer_applicable =3D
+			next_timing->periodic_training &&
+			((adel * 128 * next_timing_rate_mhz) / 1000000) >
+			next_timing->tree_margin;
+	}
+
+	emc_writel(emc, EMC_INTSTATUS_CLKCHANGE_COMPLETE, EMC_INTSTATUS);
+	emc_set_shadow_bypass(emc, ACTIVE);
+	emc_writel(emc, emc_cfg, EMC_CFG);
+	emc_writel(emc, emc_sel_dpd_ctrl, EMC_SEL_DPD_CTRL);
+	emc_writel(emc, emc_cfg_pipe_clk_o | EMC_CFG_PIPE_CLK_CLK_ALWAYS_ON,
+		   EMC_CFG_PIPE_CLK);
+	emc_writel(emc, next_timing->emc_fdpd_ctrl_cmd_no_ramp &
+		   ~EMC_FDPD_CTRL_CMD_NO_RAMP_CMD_DPD_NO_RAMP_ENABLE,
+		   EMC_FDPD_CTRL_CMD_NO_RAMP);
+
+	bg_regulator_mode_change =3D
+		((next_timing->burst_regs[EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
+		  EMC_PMACRO_BG_BIAS_CTRL_0_BGLP_E_PWRD) ^
+		 (last_timing->burst_regs[EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
+		  EMC_PMACRO_BG_BIAS_CTRL_0_BGLP_E_PWRD)) ||
+		((next_timing->burst_regs[EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
+		  EMC_PMACRO_BG_BIAS_CTRL_0_BG_E_PWRD) ^
+		 (last_timing->burst_regs[EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
+		  EMC_PMACRO_BG_BIAS_CTRL_0_BG_E_PWRD));
+	enable_bglp_regulator =3D
+		(next_timing->burst_regs[EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
+		 EMC_PMACRO_BG_BIAS_CTRL_0_BGLP_E_PWRD) =3D=3D 0;
+	enable_bg_regulator =3D
+		(next_timing->burst_regs[EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
+		 EMC_PMACRO_BG_BIAS_CTRL_0_BG_E_PWRD) =3D=3D 0;
+
+	if (bg_regulator_mode_change) {
+		if (enable_bg_regulator)
+			emc_writel(emc, last_timing->burst_regs
+				   [EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
+				   ~EMC_PMACRO_BG_BIAS_CTRL_0_BG_E_PWRD,
+				   EMC_PMACRO_BG_BIAS_CTRL_0);
+		else
+			emc_writel(emc, last_timing->burst_regs
+				   [EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
+				   ~EMC_PMACRO_BG_BIAS_CTRL_0_BGLP_E_PWRD,
+				   EMC_PMACRO_BG_BIAS_CTRL_0);
+	}
+
+	/* Check if we need to turn on VREF generator. */
+	if ((((last_timing->burst_regs[EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX] &
+	       EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_E_IVREF) =3D=3D 0) &&
+	     ((next_timing->burst_regs[EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX] &
+	       EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_E_IVREF) =3D=3D 1)) ||
+	    (((last_timing->burst_regs[EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX] &
+	       EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQS_E_IVREF) =3D=3D 0) &&
+	     ((next_timing->burst_regs[EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX] &
+	       EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQS_E_IVREF) =3D=3D 1))) {
+		u32 pad_tx_ctrl =3D
+		    next_timing->burst_regs[EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX];
+		u32 last_pad_tx_ctrl =3D
+		    last_timing->burst_regs[EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX];
+
+		next_dqs_e_ivref =3D pad_tx_ctrl &
+				   EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQS_E_IVREF;
+		next_dq_e_ivref =3D pad_tx_ctrl &
+				  EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_E_IVREF;
+		next_push =3D (last_pad_tx_ctrl &
+			     ~EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_E_IVREF &
+			     ~EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQS_E_IVREF) |
+			    next_dq_e_ivref | next_dqs_e_ivref;
+		emc_writel(emc, next_push, EMC_PMACRO_DATA_PAD_TX_CTRL);
+		udelay(1);
+	} else if (bg_regulator_mode_change) {
+		udelay(1);
+	}
+
+	emc_set_shadow_bypass(emc, ASSEMBLY);
+
+	/*
+	 * Step 2:
+	 *   Prelock the DLL.
+	 */
+	emc_cc_dbg(STEPS, "Step 2\n");
+	if (next_timing->burst_regs[EMC_CFG_DIG_DLL_INDEX] &
+	    EMC_CFG_DIG_DLL_CFG_DLL_EN) {
+		emc_cc_dbg(INFO, "Prelock enabled for target frequency.\n");
+		dll_out =3D tegra210_dll_prelock(emc, 0, clksrc);
+		emc_cc_dbg(INFO, "DLL out: 0x%03x\n", dll_out);
+		prelock_dll_en =3D 1;
+	} else {
+		emc_cc_dbg(INFO, "Disabling DLL for target frequency.\n");
+		tegra210_dll_disable(emc, channel_mode);
+	}
+
+	/*
+	 * Step 3:
+	 *   Prepare autocal for the clock change.
+	 */
+	emc_cc_dbg(STEPS, "Step 3\n");
+	emc_set_shadow_bypass(emc, ACTIVE);
+	emc_writel(emc, next_timing->emc_auto_cal_config2,
+		   EMC_AUTO_CAL_CONFIG2);
+	emc_writel(emc, next_timing->emc_auto_cal_config3,
+		   EMC_AUTO_CAL_CONFIG3);
+	emc_writel(emc, next_timing->emc_auto_cal_config4,
+		   EMC_AUTO_CAL_CONFIG4);
+	emc_writel(emc, next_timing->emc_auto_cal_config5,
+		   EMC_AUTO_CAL_CONFIG5);
+	emc_writel(emc, next_timing->emc_auto_cal_config6,
+		   EMC_AUTO_CAL_CONFIG6);
+	emc_writel(emc, next_timing->emc_auto_cal_config7,
+		   EMC_AUTO_CAL_CONFIG7);
+	emc_writel(emc, next_timing->emc_auto_cal_config8,
+		   EMC_AUTO_CAL_CONFIG8);
+	emc_set_shadow_bypass(emc, ASSEMBLY);
+
+	emc_auto_cal_config |=3D (EMC_AUTO_CAL_CONFIG_AUTO_CAL_COMPUTE_START |
+				auto_cal_en);
+	emc_writel(emc, emc_auto_cal_config, EMC_AUTO_CAL_CONFIG);
+
+	/*
+	 * Step 4:
+	 *   Update EMC_CFG. (??)
+	 */
+	emc_cc_dbg(STEPS, "Step 4\n");
+	if (source_clock_period > 50000 && dram_type =3D=3D DRAM_TYPE_LPDDR4)
+		ccfifo_writel(emc, 1, EMC_SELF_REF, 0);
+	else
+		emc_writel(emc, next_timing->emc_cfg_2, EMC_CFG_2);
+
+	/*
+	 * Step 5:
+	 *   Prepare reference variables for ZQCAL regs.
+	 */
+	emc_cc_dbg(STEPS, "Step 5\n");
+	emc_zcal_interval =3D 0;
+	emc_zcal_wait_cnt_old =3D
+		last_timing->burst_regs[EMC_ZCAL_WAIT_CNT_INDEX];
+	emc_zcal_wait_cnt_new =3D
+		next_timing->burst_regs[EMC_ZCAL_WAIT_CNT_INDEX];
+	emc_zcal_wait_cnt_old &=3D ~EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_MASK;
+	emc_zcal_wait_cnt_new &=3D ~EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_MASK;
+
+	if (dram_type =3D=3D DRAM_TYPE_LPDDR4)
+		zq_wait_long =3D max((u32)1,
+				   div_o3(1000000, destination_clock_period));
+	else if (dram_type =3D=3D DRAM_TYPE_LPDDR2 || is_lpddr3)
+		zq_wait_long =3D max(next_timing->min_mrs_wait,
+				   div_o3(360000, destination_clock_period)) +
+			       4;
+	else if (dram_type =3D=3D DRAM_TYPE_DDR3)
+		zq_wait_long =3D max((u32)256,
+				   div_o3(320000, destination_clock_period) +
+				   2);
+	else
+		zq_wait_long =3D 0;
+
+	if (dram_type =3D=3D DRAM_TYPE_LPDDR2 || is_lpddr3)
+		zq_wait_short =3D max(max(next_timing->min_mrs_wait, (u32)6),
+				    div_o3(90000, destination_clock_period)) +
+				4;
+	else if (dram_type =3D=3D DRAM_TYPE_DDR3)
+		zq_wait_short =3D max((u32)64,
+				    div_o3(80000, destination_clock_period)) +
+				2;
+	else
+		zq_wait_short =3D 0;
+
+	/*
+	 * Step 6:
+	 *   Training code - removed.
+	 */
+	emc_cc_dbg(STEPS, "Step 6\n");
+
+	/*
+	 * Step 7:
+	 *   Program FSP reference registers and send MRWs to new FSPWR.
+	 */
+	emc_cc_dbg(STEPS, "Step 7\n");
+	emc_cc_dbg(SUB_STEPS, "Step 7.1: Bug 200024907 - Patch RP R2P");
+	if (opt_war_200024907) {
+		nRTP =3D 16;
+		if (source_clock_period >=3D 1000000/1866) /* 535.91 ps */
+			nRTP =3D 14;
+		if (source_clock_period >=3D 1000000/1600) /* 625.00 ps */
+			nRTP =3D 12;
+		if (source_clock_period >=3D 1000000/1333) /* 750.19 ps */
+			nRTP =3D 10;
+		if (source_clock_period >=3D 1000000/1066) /* 938.09 ps */
+			nRTP =3D 8;
+
+		deltaTWATM =3D max_t(u32, div_o3(7500, source_clock_period), 8);
+
+		/*
+		 * Originally there was a + .5 in the tRPST calculation.
+		 * However since we can't do FP in the kernel and the tRTM
+		 * computation was in a floating point ceiling function, adding
+		 * one to tRTP should be ok. There is no other source of non
+		 * integer values, so the result was always going to be
+		 * something for the form: f_ceil(N + .5) =3D N + 1;
+		 */
+		tRPST =3D ((last_timing->emc_mrw & 0x80) >> 7);
+		tRTM =3D fake_timing->dram_timings[RL] +
+		       div_o3(3600, source_clock_period) +
+		       max_t(u32, div_o3(7500, source_clock_period), 8) +
+		       tRPST + 1 + nRTP;
+
+		emc_cc_dbg(INFO, "tRTM =3D %u, EMC_RP =3D %u\n", tRTM,
+			   next_timing->burst_regs[EMC_RP_INDEX]);
+
+		if (last_timing->burst_regs[EMC_RP_INDEX] < tRTM) {
+			if (tRTM > (last_timing->burst_regs[EMC_R2P_INDEX] +
+				    last_timing->burst_regs[EMC_RP_INDEX])) {
+				R2P_war =3D tRTM -
+					  last_timing->burst_regs[EMC_RP_INDEX];
+				RP_war =3D last_timing->burst_regs[EMC_RP_INDEX];
+				TRPab_war =3D last_timing->burst_regs[
+					    EMC_TRPAB_INDEX];
+				if (R2P_war > 63) {
+					RP_war =3D R2P_war +
+						 last_timing->burst_regs[
+						 EMC_RP_INDEX] - 63;
+					if (TRPab_war < RP_war)
+						TRPab_war =3D RP_war;
+					R2P_war =3D 63;
+				}
+			} else {
+				R2P_war =3D last_timing->burst_regs[
+					  EMC_R2P_INDEX];
+				RP_war =3D last_timing->burst_regs[EMC_RP_INDEX];
+				TRPab_war =3D last_timing->burst_regs[
+					    EMC_TRPAB_INDEX];
+			}
+
+			if (RP_war < deltaTWATM) {
+				W2P_war =3D last_timing->burst_regs[EMC_W2P_INDEX]
+					  + deltaTWATM - RP_war;
+				if (W2P_war > 63) {
+					RP_war =3D RP_war + W2P_war - 63;
+					if (TRPab_war < RP_war)
+						TRPab_war =3D RP_war;
+					W2P_war =3D 63;
+				}
+			} else {
+				W2P_war =3D last_timing->burst_regs[
+					  EMC_W2P_INDEX];
+			}
+
+			if ((last_timing->burst_regs[EMC_W2P_INDEX] ^
+			     W2P_war) ||
+			    (last_timing->burst_regs[EMC_R2P_INDEX] ^
+			     R2P_war) ||
+			    (last_timing->burst_regs[EMC_RP_INDEX] ^
+			     RP_war) ||
+			    (last_timing->burst_regs[EMC_TRPAB_INDEX] ^
+			     TRPab_war)) {
+				emc_writel(emc, RP_war, EMC_RP);
+				emc_writel(emc, R2P_war, EMC_R2P);
+				emc_writel(emc, W2P_war, EMC_W2P);
+				emc_writel(emc, TRPab_war, EMC_TRPAB);
+			}
+			emc_timing_update(emc, DUAL_CHANNEL);
+		} else {
+			emc_cc_dbg(INFO, "Skipped WAR\n");
+		}
+	}
+
+	if (!fsp_for_next_freq) {
+		mr13_flip_fspwr =3D (next_timing->emc_mrw3 & 0xffffff3f) | 0x80;
+		mr13_flip_fspop =3D (next_timing->emc_mrw3 & 0xffffff3f) | 0x00;
+	} else {
+		mr13_flip_fspwr =3D (next_timing->emc_mrw3 & 0xffffff3f) | 0x40;
+		mr13_flip_fspop =3D (next_timing->emc_mrw3 & 0xffffff3f) | 0xc0;
+	}
+
+	mr13_catr_enable =3D (mr13_flip_fspwr & 0xFFFFFFFE) | 0x01;
+	if (dram_dev_num =3D=3D TWO_RANK)
+		mr13_catr_enable =3D (mr13_catr_enable & 0x3fffffff) | 0x80000000;
+
+	if (dram_type =3D=3D DRAM_TYPE_LPDDR4) {
+		emc_writel(emc, mr13_flip_fspwr, EMC_MRW3);
+		emc_writel(emc, next_timing->emc_mrw, EMC_MRW);
+		emc_writel(emc, next_timing->emc_mrw2, EMC_MRW2);
+	}
+
+	/*
+	 * Step 8:
+	 *   Program the shadow registers.
+	 */
+	emc_cc_dbg(STEPS, "Step 8\n");
+	emc_cc_dbg(SUB_STEPS, "Writing burst_regs\n");
+	for (i =3D 0; i < next_timing->num_burst; i++) {
+		u32 var;
+		u32 wval;
+		const u16 *burst_regs_off =3D &reg_off.burst_regs_off[0];
+
+		if (!burst_regs_off[i])
+			continue;
+
+		var =3D burst_regs_off[i];
+		wval =3D next_timing->burst_regs[i];
+
+		if (dram_type !=3D DRAM_TYPE_LPDDR4 &&
+		    (var =3D=3D EMC_MRW6      || var =3D=3D EMC_MRW7 ||
+		     var =3D=3D EMC_MRW8      || var =3D=3D EMC_MRW9 ||
+		     var =3D=3D EMC_MRW10     || var =3D=3D EMC_MRW11 ||
+		     var =3D=3D EMC_MRW12     || var =3D=3D EMC_MRW13 ||
+		     var =3D=3D EMC_MRW14     || var =3D=3D EMC_MRW15 ||
+		     var =3D=3D EMC_TRAINING_CTRL))
+			continue;
+
+		/* Pain... And suffering. */
+		if (var =3D=3D EMC_CFG) {
+			wval &=3D ~EMC_CFG_DRAM_ACPD;
+			wval &=3D ~EMC_CFG_DYN_SELF_REF;
+			if (dram_type =3D=3D DRAM_TYPE_LPDDR4) {
+				wval &=3D ~EMC_CFG_DRAM_CLKSTOP_SR;
+				wval &=3D ~EMC_CFG_DRAM_CLKSTOP_PD;
+			}
+		} else if (var =3D=3D EMC_MRS_WAIT_CNT &&
+			   dram_type =3D=3D DRAM_TYPE_LPDDR2 &&
+			   opt_zcal_en_cc && !opt_cc_short_zcal &&
+			   opt_short_zcal) {
+			wval =3D (wval & ~(EMC_MRS_WAIT_CNT_SHORT_WAIT_MASK <<
+					 EMC_MRS_WAIT_CNT_SHORT_WAIT_SHIFT)) |
+			   ((zq_wait_long & EMC_MRS_WAIT_CNT_SHORT_WAIT_MASK) <<
+			    EMC_MRS_WAIT_CNT_SHORT_WAIT_SHIFT);
+		} else if (var =3D=3D EMC_ZCAL_WAIT_CNT &&
+			   dram_type =3D=3D DRAM_TYPE_DDR3 && opt_zcal_en_cc &&
+			   !opt_cc_short_zcal && opt_short_zcal) {
+			wval =3D (wval & ~(EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_MASK <<
+					 EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_SHIFT))
+			       | ((zq_wait_long &
+				   EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_MASK) <<
+				  EMC_MRS_WAIT_CNT_SHORT_WAIT_SHIFT);
+		} else if (var =3D=3D EMC_ZCAL_INTERVAL && opt_zcal_en_cc) {
+			wval =3D 0; /* EMC_ZCAL_INTERVAL reset value. */
+		} else if (var =3D=3D EMC_PMACRO_AUTOCAL_CFG_COMMON) {
+			wval |=3D EMC_PMACRO_AUTOCAL_CFG_COMMON_E_CAL_BYPASS_DVFS;
+		} else if (var =3D=3D EMC_PMACRO_DATA_PAD_TX_CTRL) {
+			wval &=3D
+			     ~(EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSP_TX_E_DCC |
+			       EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSN_TX_E_DCC |
+			       EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_TX_E_DCC |
+			       EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_CMD_TX_E_DCC);
+		} else if (var =3D=3D EMC_PMACRO_CMD_PAD_TX_CTRL) {
+			wval |=3D EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_DRVFORCEON;
+			wval &=3D ~(EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSP_TX_E_DCC |
+				  EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSN_TX_E_DCC |
+				  EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_E_DCC |
+				  EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_CMD_TX_E_DCC);
+		} else if (var =3D=3D EMC_PMACRO_BRICK_CTRL_RFU1) {
+			wval &=3D 0xf800f800;
+		} else if (var =3D=3D EMC_PMACRO_COMMON_PAD_TX_CTRL) {
+			wval &=3D 0xfffffff0;
+		}
+
+		emc_writel(emc, wval, var);
+	}
+
+	/* SW addition: do EMC refresh adjustment here. */
+	emc_set_over_temp_timing(emc, next_timing, dram_over_temp_state);
+
+	if (dram_type =3D=3D DRAM_TYPE_LPDDR4) {
+		mrw_req =3D (23 << EMC_MRW_MRW_MA_SHIFT) |
+			  (next_timing->run_clocks & EMC_MRW_MRW_OP_MASK);
+		emc_writel(emc, mrw_req, EMC_MRW);
+	}
+
+	/* Per channel burst registers. */
+	emc_cc_dbg(SUB_STEPS, "Writing burst_regs_per_ch\n");
+	for (i =3D 0; i < next_timing->num_burst_per_ch; i++) {
+		const struct per_ch_regs *burst_regs_per_ch_off =3D
+					&reg_off.burst_regs_per_ch_off[0];
+
+		if (!burst_regs_per_ch_off[i].offset)
+			continue;
+
+		if (dram_type !=3D DRAM_TYPE_LPDDR4 &&
+		    (burst_regs_per_ch_off[i].offset =3D=3D EMC_MRW6 ||
+		     burst_regs_per_ch_off[i].offset =3D=3D EMC_MRW7 ||
+		     burst_regs_per_ch_off[i].offset =3D=3D EMC_MRW8 ||
+		     burst_regs_per_ch_off[i].offset =3D=3D EMC_MRW9 ||
+		     burst_regs_per_ch_off[i].offset =3D=3D EMC_MRW10 ||
+		     burst_regs_per_ch_off[i].offset =3D=3D EMC_MRW11 ||
+		     burst_regs_per_ch_off[i].offset =3D=3D EMC_MRW12 ||
+		     burst_regs_per_ch_off[i].offset =3D=3D EMC_MRW13 ||
+		     burst_regs_per_ch_off[i].offset =3D=3D EMC_MRW14 ||
+		     burst_regs_per_ch_off[i].offset =3D=3D EMC_MRW15))
+			continue;
+
+		/* Filter out second channel if not in DUAL_CHANNEL mode. */
+		if (channel_mode !=3D DUAL_CHANNEL &&
+		    burst_regs_per_ch_off[i].bank >=3D REG_EMC1)
+			continue;
+
+		emc_cc_dbg(REG_LISTS, "(%u) 0x%08x =3D> 0x%08x\n",
+			   i, next_timing->burst_reg_per_ch[i],
+			   burst_regs_per_ch_off[i].offset);
+		emc_writel_per_ch(emc, next_timing->burst_reg_per_ch[i],
+				  burst_regs_per_ch_off[i].bank,
+				  burst_regs_per_ch_off[i].offset);
+	}
+
+	/* Vref regs. */
+	emc_cc_dbg(SUB_STEPS, "Writing vref_regs\n");
+	for (i =3D 0; i < next_timing->vref_num; i++) {
+		const struct per_ch_regs *vref_regs_per_ch_off =3D
+					&reg_off.vref_regs_per_ch_off[0];
+
+		if (!vref_regs_per_ch_off[i].offset)
+			continue;
+
+		if (channel_mode !=3D DUAL_CHANNEL &&
+			vref_regs_per_ch_off[i].bank >=3D REG_EMC1)
+			continue;
+
+		emc_cc_dbg(REG_LISTS, "(%u) 0x%08x =3D> 0x%08x\n",
+			   i, next_timing->vref_perch_regs[i],
+			   vref_regs_per_ch_off[i].offset);
+		emc_writel_per_ch(emc, next_timing->vref_perch_regs[i],
+				  vref_regs_per_ch_off[i].bank,
+				  vref_regs_per_ch_off[i].offset);
+	}
+
+	/* Trimmers. */
+	emc_cc_dbg(SUB_STEPS, "Writing trim_regs\n");
+	for (i =3D 0; i < next_timing->num_trim; i++) {
+		u64 trim_reg;
+		const u16 *trim_regs_off =3D &reg_off.trim_regs_off[0];
+
+		if (!trim_regs_off[i])
+			continue;
+
+		trim_reg =3D trim_regs_off[i];
+		if (compensate_trimmer_applicable &&
+		    (trim_reg =3D=3D EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0 ||
+		     trim_reg =3D=3D EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1 ||
+		     trim_reg =3D=3D EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2 ||
+		     trim_reg =3D=3D EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3 ||
+		     trim_reg =3D=3D EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0 ||
+		     trim_reg =3D=3D EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1 ||
+		     trim_reg =3D=3D EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2 ||
+		     trim_reg =3D=3D EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3 ||
+		     trim_reg =3D=3D EMC_DATA_BRLSHFT_0 ||
+		     trim_reg =3D=3D EMC_DATA_BRLSHFT_1)) {
+			u32 reg =3D tegra210_apply_periodic_compensation_trimmer(
+				  next_timing, trim_reg);
+			emc_cc_dbg(REG_LISTS, "(%u) 0x%08x =3D> 0x%08x\n", i, reg,
+				   trim_regs_off[i]);
+			emc_cc_dbg(EMA_WRITES, "0x%08x <=3D 0x%08x\n",
+				   (u32)(u64)trim_regs_off[i], reg);
+			emc_writel(emc, reg, trim_regs_off[i]);
+		} else {
+			emc_cc_dbg(REG_LISTS, "(%u) 0x%08x =3D> 0x%08x\n",
+				   i, next_timing->trim_regs[i],
+				   trim_regs_off[i]);
+			emc_writel(emc, next_timing->trim_regs[i],
+				   trim_regs_off[i]);
+		}
+	}
+
+	/* Per channel trimmers. */
+	emc_cc_dbg(SUB_STEPS, "Writing trim_regs_per_ch\n");
+	for (i =3D 0; i < next_timing->num_trim_per_ch; i++) {
+		u32 trim_reg;
+		const struct per_ch_regs *trim_regs_per_ch_off =3D
+					&reg_off.trim_regs_per_ch_off[0];
+
+		if (!trim_regs_per_ch_off[i].offset)
+			continue;
+
+		if (channel_mode !=3D DUAL_CHANNEL &&
+			trim_regs_per_ch_off[i].bank >=3D REG_EMC1)
+			continue;
+
+		trim_reg =3D trim_regs_per_ch_off[i].offset;
+		if (compensate_trimmer_applicable &&
+		    (trim_reg =3D=3D EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0 ||
+		     trim_reg =3D=3D EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1 ||
+		     trim_reg =3D=3D EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2 ||
+		     trim_reg =3D=3D EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3 ||
+		     trim_reg =3D=3D EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0 ||
+		     trim_reg =3D=3D EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1 ||
+		     trim_reg =3D=3D EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2 ||
+		     trim_reg =3D=3D EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3 ||
+		     trim_reg =3D=3D EMC_DATA_BRLSHFT_0 ||
+		     trim_reg =3D=3D EMC_DATA_BRLSHFT_1)) {
+			u32 reg =3D
+				tegra210_apply_periodic_compensation_trimmer(
+						next_timing, trim_reg);
+			emc_cc_dbg(REG_LISTS, "(%u) 0x%08x =3D> 0x%08x\n",
+				   i, reg, trim_regs_per_ch_off[i].offset);
+			emc_cc_dbg(EMA_WRITES, "0x%08x <=3D 0x%08x\n",
+				   trim_regs_per_ch_off[i].offset, reg);
+			emc_writel_per_ch(emc, reg,
+					  trim_regs_per_ch_off[i].bank,
+					  trim_regs_per_ch_off[i].offset);
+		} else {
+			emc_cc_dbg(REG_LISTS, "(%u) 0x%08x =3D> 0x%08x\n",
+				   i, next_timing->trim_perch_regs[i],
+				   trim_regs_per_ch_off[i].offset);
+			emc_writel_per_ch(emc, next_timing->trim_perch_regs[i],
+					  trim_regs_per_ch_off[i].bank,
+					  trim_regs_per_ch_off[i].offset);
+		}
+	}
+
+	emc_cc_dbg(SUB_STEPS, "Writing burst_mc_regs\n");
+	for (i =3D 0; i < next_timing->num_mc_regs; i++) {
+		emc_cc_dbg(REG_LISTS, "(%u) 0x%08x =3D> 0x%08x\n",
+			   i, next_timing->burst_mc_regs[i],
+			   reg_off.burst_mc_regs_off[i]);
+		mc_writel(emc->mc, next_timing->burst_mc_regs[i],
+			  reg_off.burst_mc_regs_off[i]);
+	}
+
+	/* Registers to be programmed on the faster clock. */
+	if (next_timing->rate < last_timing->rate) {
+		emc_cc_dbg(SUB_STEPS, "Writing la_scale_regs\n");
+		for (i =3D 0; i < next_timing->num_up_down; i++) {
+			emc_cc_dbg(REG_LISTS, "(%u) 0x%08x =3D> 0x%08x\n",
+				   i, next_timing->la_scale_regs[i],
+				   reg_off.la_scale_regs_off[i]);
+			mc_writel(emc->mc, next_timing->la_scale_regs[i],
+				  reg_off.la_scale_regs_off[i]);
+		}
+	}
+
+	/* Flush all the burst register writes. */
+	mc_readl(emc->mc, MC_EMEM_ADR_CFG);
+
+	/*
+	 * Step 9:
+	 *   LPDDR4 section A.
+	 */
+	emc_cc_dbg(STEPS, "Step 9\n");
+	if (dram_type =3D=3D DRAM_TYPE_LPDDR4) {
+		emc_writel(emc, emc_zcal_interval, EMC_ZCAL_INTERVAL);
+		emc_writel(emc, emc_zcal_wait_cnt_new, EMC_ZCAL_WAIT_CNT);
+
+		emc_dbg |=3D (EMC_DBG_WRITE_MUX_ACTIVE |
+			    EMC_DBG_WRITE_ACTIVE_ONLY);
+
+		emc_writel(emc, emc_dbg, EMC_DBG);
+		emc_writel(emc, emc_zcal_interval, EMC_ZCAL_INTERVAL);
+		emc_writel(emc, emc_dbg_o, EMC_DBG);
+	}
+
+	/*
+	 * Step 10:
+	 *   LPDDR4 and DDR3 common section.
+	 */
+	emc_cc_dbg(STEPS, "Step 10\n");
+	if (opt_dvfs_mode =3D=3D MAN_SR || dram_type =3D=3D DRAM_TYPE_LPDDR4) {
+		if (dram_type =3D=3D DRAM_TYPE_LPDDR4)
+			ccfifo_writel(emc, 0x101, EMC_SELF_REF, 0);
+		else
+			ccfifo_writel(emc, 0x1, EMC_SELF_REF, 0);
+
+		if (dram_type =3D=3D DRAM_TYPE_LPDDR4 &&
+		    destination_clock_period <=3D zqcal_before_cc_cutoff) {
+			ccfifo_writel(emc, mr13_flip_fspwr ^ 0x40, EMC_MRW3, 0);
+			ccfifo_writel(emc,
+				      (next_timing->burst_regs[EMC_MRW6_INDEX] &
+				       0xFFFF3F3F) |
+				      (last_timing->burst_regs[EMC_MRW6_INDEX] &
+				       0x0000C0C0), EMC_MRW6, 0);
+			ccfifo_writel(emc,
+				      (next_timing->burst_regs[EMC_MRW14_INDEX]
+				       & 0xFFFF0707) |
+				      (last_timing->burst_regs[EMC_MRW14_INDEX]
+				       & 0x00003838), EMC_MRW14, 0);
+
+			if (dram_dev_num =3D=3D TWO_RANK) {
+				ccfifo_writel(emc,
+				      (next_timing->burst_regs[EMC_MRW7_INDEX] &
+				       0xFFFF3F3F) |
+				      (last_timing->burst_regs[EMC_MRW7_INDEX] &
+				       0x0000C0C0), EMC_MRW7, 0);
+				ccfifo_writel(emc,
+				     (next_timing->burst_regs[EMC_MRW15_INDEX] &
+				      0xFFFF0707) |
+				     (last_timing->burst_regs[EMC_MRW15_INDEX] &
+				      0x00003838), EMC_MRW15, 0);
+			}
+
+			if (opt_zcal_en_cc) {
+				if (dram_dev_num =3D=3D ONE_RANK)
+					ccfifo_writel(emc,
+						2UL << EMC_ZQ_CAL_DEV_SEL_SHIFT
+						| EMC_ZQ_CAL_ZQ_CAL_CMD,
+						EMC_ZQ_CAL, 0);
+				else if (shared_zq_resistor)
+					ccfifo_writel(emc,
+						2UL << EMC_ZQ_CAL_DEV_SEL_SHIFT
+						| EMC_ZQ_CAL_ZQ_CAL_CMD,
+						EMC_ZQ_CAL, 0);
+				else
+					ccfifo_writel(emc,
+						      EMC_ZQ_CAL_ZQ_CAL_CMD,
+						      EMC_ZQ_CAL, 0);
+			}
+		}
+	}
+
+	emc_dbg =3D emc_dbg_o;
+	if (dram_type =3D=3D DRAM_TYPE_LPDDR4) {
+		ccfifo_writel(emc, mr13_flip_fspop | 0x8, EMC_MRW3,
+			      (1000 * fake_timing->dram_timings[T_RP]) /
+			      source_clock_period);
+		ccfifo_writel(emc, 0, 0, tFC_lpddr4 / source_clock_period);
+	}
+
+	if (dram_type =3D=3D DRAM_TYPE_LPDDR4 || opt_dvfs_mode !=3D MAN_SR) {
+		u32 t =3D 30 + (cya_allow_ref_cc ?
+			(4000 * fake_timing->dram_timings[T_RFC]) +
+			((1000 * fake_timing->dram_timings[T_RP]) /
+			 source_clock_period) : 0);
+
+		ccfifo_writel(emc, emc_pin_o & ~(EMC_PIN_PIN_CKE_PER_DEV |
+			      EMC_PIN_PIN_CKEB | EMC_PIN_PIN_CKE),
+			      EMC_PIN, t);
+	}
+
+	ref_delay_mult =3D 1;
+	ref_b4_sref_en =3D 0;
+	cya_issue_pc_ref =3D 0;
+
+	ref_delay_mult +=3D ref_b4_sref_en   ? 1 : 0;
+	ref_delay_mult +=3D cya_allow_ref_cc ? 1 : 0;
+	ref_delay_mult +=3D cya_issue_pc_ref ? 1 : 0;
+	ref_delay =3D ref_delay_mult *
+		    ((1000 * fake_timing->dram_timings[T_RP] /
+		      source_clock_period) +
+		     (1000 * fake_timing->dram_timings[T_RFC] /
+		      source_clock_period)) + 20;
+
+	/*
+	 * Step 11:
+	 *   Ramp down.
+	 */
+	emc_cc_dbg(STEPS, "Step 11\n");
+	ccfifo_writel(emc, 0x0, EMC_CFG_SYNC,
+		      dram_type =3D=3D DRAM_TYPE_LPDDR4 ? 0 : ref_delay);
+
+	emc_dbg_active =3D emc_dbg | (EMC_DBG_WRITE_MUX_ACTIVE |
+			 EMC_DBG_WRITE_ACTIVE_ONLY);
+	ccfifo_writel(emc, emc_dbg_active, EMC_DBG, 0);
+
+	ramp_down_wait =3D tegra210_dvfs_power_ramp_down(emc,
+						       source_clock_period, 0);
+
+	/*
+	 * Step 12:
+	 *   And finally - trigger the clock change.
+	 */
+	emc_cc_dbg(STEPS, "Step 12\n");
+	ccfifo_writel(emc, 1, EMC_STALL_THEN_EXE_AFTER_CLKCHANGE, 0);
+	emc_dbg_active &=3D ~EMC_DBG_WRITE_ACTIVE_ONLY;
+	ccfifo_writel(emc, emc_dbg_active, EMC_DBG, 0);
+
+	/*
+	 * Step 13:
+	 *   Ramp up.
+	 */
+	emc_cc_dbg(STEPS, "Step 13\n");
+	ramp_up_wait =3D tegra210_dvfs_power_ramp_up(emc,
+						   destination_clock_period, 0);
+	ccfifo_writel(emc, emc_dbg, EMC_DBG, 0);
+
+	/*
+	 * Step 14:
+	 *   Bringup CKE pins.
+	 */
+	emc_cc_dbg(STEPS, "Step 14\n");
+	if (dram_type =3D=3D DRAM_TYPE_LPDDR4) {
+		u32 r =3D emc_pin_o | EMC_PIN_PIN_CKE;
+
+		if (dram_dev_num =3D=3D TWO_RANK)
+			ccfifo_writel(emc, r | EMC_PIN_PIN_CKEB |
+				      EMC_PIN_PIN_CKE_PER_DEV, EMC_PIN, 0);
+		else
+			ccfifo_writel(emc, r & ~(EMC_PIN_PIN_CKEB |
+				      EMC_PIN_PIN_CKE_PER_DEV), EMC_PIN, 0);
+	}
+
+	/*
+	 * Step 15: (two step 15s ??)
+	 *   Calculate zqlatch wait time; has dependency on ramping times.
+	 */
+	emc_cc_dbg(STEPS, "Step 15\n");
+
+	if (destination_clock_period <=3D zqcal_before_cc_cutoff) {
+		s32 t =3D (s32)(ramp_up_wait + ramp_down_wait) /
+			(s32)destination_clock_period;
+		zq_latch_dvfs_wait_time =3D (s32)tZQCAL_lpddr4_fc_adj - t;
+	} else {
+		zq_latch_dvfs_wait_time =3D tZQCAL_lpddr4_fc_adj -
+			div_o3(1000 * next_timing->dram_timings[T_PDEX],
+			       destination_clock_period);
+	}
+
+	emc_cc_dbg(INFO, "tZQCAL_lpddr4_fc_adj =3D %u\n", tZQCAL_lpddr4_fc_adj);
+	emc_cc_dbg(INFO, "destination_clock_period =3D %u\n",
+		   destination_clock_period);
+	emc_cc_dbg(INFO, "next_timing->dram_timings[T_PDEX] =3D %u\n",
+		   next_timing->dram_timings[T_PDEX]);
+	emc_cc_dbg(INFO, "zq_latch_dvfs_wait_time =3D %d\n",
+		   max_t(s32, 0, zq_latch_dvfs_wait_time));
+
+	if (dram_type =3D=3D DRAM_TYPE_LPDDR4 && opt_zcal_en_cc) {
+		if (dram_dev_num =3D=3D ONE_RANK) {
+			if (destination_clock_period > zqcal_before_cc_cutoff)
+				ccfifo_writel(emc,
+					      2UL << EMC_ZQ_CAL_DEV_SEL_SHIFT |
+					      EMC_ZQ_CAL_ZQ_CAL_CMD, EMC_ZQ_CAL,
+					      div_o3(1000 *
+						     next_timing->dram_timings
+						     [T_PDEX],
+						     destination_clock_period));
+
+			ccfifo_writel(emc, (mr13_flip_fspop & 0xFFFFFFF7) |
+				      0x0C000000, EMC_MRW3,
+				      div_o3(1000 *
+					     next_timing->dram_timings[T_PDEX],
+					     destination_clock_period));
+			ccfifo_writel(emc, 0, EMC_SELF_REF, 0);
+			ccfifo_writel(emc, 0, EMC_REF, 0);
+			ccfifo_writel(emc, 2UL << EMC_ZQ_CAL_DEV_SEL_SHIFT |
+				      EMC_ZQ_CAL_ZQ_LATCH_CMD,
+				      EMC_ZQ_CAL,
+				      max_t(s32, 0, zq_latch_dvfs_wait_time));
+		} else if (shared_zq_resistor) {
+			if (destination_clock_period > zqcal_before_cc_cutoff)
+				ccfifo_writel(emc,
+					      2UL << EMC_ZQ_CAL_DEV_SEL_SHIFT |
+					      EMC_ZQ_CAL_ZQ_CAL_CMD, EMC_ZQ_CAL,
+					      div_o3(1000 *
+						     next_timing->dram_timings
+						     [T_PDEX],
+						     destination_clock_period));
+
+			ccfifo_writel(emc, 2UL << EMC_ZQ_CAL_DEV_SEL_SHIFT |
+				      EMC_ZQ_CAL_ZQ_LATCH_CMD, EMC_ZQ_CAL,
+				      max_t(s32, 0, zq_latch_dvfs_wait_time) +
+				      div_o3(1000 *
+					     next_timing->dram_timings[T_PDEX],
+					     destination_clock_period));
+			ccfifo_writel(emc, 1UL << EMC_ZQ_CAL_DEV_SEL_SHIFT |
+				      EMC_ZQ_CAL_ZQ_LATCH_CMD,
+				      EMC_ZQ_CAL, 0);
+
+			ccfifo_writel(emc, (mr13_flip_fspop & 0xfffffff7) |
+				      0x0c000000, EMC_MRW3, 0);
+			ccfifo_writel(emc, 0, EMC_SELF_REF, 0);
+			ccfifo_writel(emc, 0, EMC_REF, 0);
+
+			ccfifo_writel(emc, 1UL << EMC_ZQ_CAL_DEV_SEL_SHIFT |
+				      EMC_ZQ_CAL_ZQ_LATCH_CMD, EMC_ZQ_CAL,
+				      tZQCAL_lpddr4 / destination_clock_period);
+		} else {
+			if (destination_clock_period > zqcal_before_cc_cutoff)
+				ccfifo_writel(emc, EMC_ZQ_CAL_ZQ_CAL_CMD,
+					      EMC_ZQ_CAL,
+					      div_o3(1000 *
+						     next_timing->dram_timings
+						     [T_PDEX],
+						     destination_clock_period));
+
+			ccfifo_writel(emc, (mr13_flip_fspop & 0xfffffff7) |
+				      0x0c000000, EMC_MRW3,
+				      div_o3(1000 *
+					     next_timing->dram_timings[T_PDEX],
+					     destination_clock_period));
+			ccfifo_writel(emc, 0, EMC_SELF_REF, 0);
+			ccfifo_writel(emc, 0, EMC_REF, 0);
+
+			ccfifo_writel(emc, EMC_ZQ_CAL_ZQ_LATCH_CMD, EMC_ZQ_CAL,
+				      max_t(s32, 0, zq_latch_dvfs_wait_time));
+		}
+	}
+
+	/* WAR: delay for zqlatch */
+	ccfifo_writel(emc, 0, 0, 10);
+
+	/*
+	 * Step 16:
+	 *   LPDDR4 Conditional Training Kickoff. Removed.
+	 */
+
+	/*
+	 * Step 17:
+	 *   MANSR exit self refresh.
+	 */
+	emc_cc_dbg(STEPS, "Step 17\n");
+	if (opt_dvfs_mode =3D=3D MAN_SR && dram_type !=3D DRAM_TYPE_LPDDR4)
+		ccfifo_writel(emc, 0, EMC_SELF_REF, 0);
+
+	/*
+	 * Step 18:
+	 *   Send MRWs to LPDDR3/DDR3.
+	 */
+	emc_cc_dbg(STEPS, "Step 18\n");
+	if (dram_type =3D=3D DRAM_TYPE_LPDDR2) {
+		ccfifo_writel(emc, next_timing->emc_mrw2, EMC_MRW2, 0);
+		ccfifo_writel(emc, next_timing->emc_mrw,  EMC_MRW,  0);
+		if (is_lpddr3)
+			ccfifo_writel(emc, next_timing->emc_mrw4, EMC_MRW4, 0);
+	} else if (dram_type =3D=3D DRAM_TYPE_DDR3) {
+		if (opt_dll_mode =3D=3D DLL_ON)
+			ccfifo_writel(emc, next_timing->emc_emrs &
+				      ~EMC_EMRS_USE_EMRS_LONG_CNT, EMC_EMRS, 0);
+		ccfifo_writel(emc, next_timing->emc_emrs2 &
+			      ~EMC_EMRS2_USE_EMRS2_LONG_CNT, EMC_EMRS2, 0);
+		ccfifo_writel(emc, next_timing->emc_mrs |
+			      EMC_EMRS_USE_EMRS_LONG_CNT, EMC_MRS, 0);
+	}
+
+	/*
+	 * Step 19:
+	 *   ZQCAL for LPDDR3/DDR3
+	 */
+	emc_cc_dbg(STEPS, "Step 19\n");
+	if (opt_zcal_en_cc) {
+		if (dram_type =3D=3D DRAM_TYPE_LPDDR2) {
+			u32 r;
+
+			zq_op =3D opt_cc_short_zcal  ? 0x56 : 0xAB;
+			zcal_wait_time_ps =3D opt_cc_short_zcal  ? 90000 : 360000;
+			zcal_wait_time_clocks =3D div_o3(zcal_wait_time_ps,
+						destination_clock_period);
+			r =3D zcal_wait_time_clocks <<
+			    EMC_MRS_WAIT_CNT2_MRS_EXT2_WAIT_CNT_SHIFT |
+			    zcal_wait_time_clocks <<
+			    EMC_MRS_WAIT_CNT2_MRS_EXT1_WAIT_CNT_SHIFT;
+			ccfifo_writel(emc, r, EMC_MRS_WAIT_CNT2, 0);
+			ccfifo_writel(emc, 2 << EMC_MRW_MRW_DEV_SELECTN_SHIFT |
+				      EMC_MRW_USE_MRW_EXT_CNT |
+				      10 << EMC_MRW_MRW_MA_SHIFT |
+				      zq_op << EMC_MRW_MRW_OP_SHIFT,
+				      EMC_MRW, 0);
+			if (dram_dev_num =3D=3D TWO_RANK) {
+				r =3D 1 << EMC_MRW_MRW_DEV_SELECTN_SHIFT |
+				    EMC_MRW_USE_MRW_EXT_CNT |
+				    10 << EMC_MRW_MRW_MA_SHIFT |
+				    zq_op << EMC_MRW_MRW_OP_SHIFT;
+				ccfifo_writel(emc, r, EMC_MRW, 0);
+			}
+		} else if (dram_type =3D=3D DRAM_TYPE_DDR3) {
+			zq_op =3D opt_cc_short_zcal ? 0 : EMC_ZQ_CAL_LONG;
+			ccfifo_writel(emc, zq_op | 2 <<
+				      EMC_ZQ_CAL_DEV_SEL_SHIFT |
+				      EMC_ZQ_CAL_ZQ_CAL_CMD, EMC_ZQ_CAL, 0);
+			if (dram_dev_num =3D=3D TWO_RANK)
+				ccfifo_writel(emc, zq_op |
+					      1 << EMC_ZQ_CAL_DEV_SEL_SHIFT |
+					      EMC_ZQ_CAL_ZQ_CAL_CMD,
+					      EMC_ZQ_CAL, 0);
+		}
+	}
+
+	if (bg_regulator_mode_change) {
+		emc_set_shadow_bypass(emc, ACTIVE);
+		bg_regulator_switch_complete_wait_clks =3D
+			ramp_up_wait > 1250000 ? 0 :
+			(1250000 - ramp_up_wait) / destination_clock_period;
+		ccfifo_writel(emc, next_timing->burst_regs
+			      [EMC_PMACRO_BG_BIAS_CTRL_0_INDEX],
+			      EMC_PMACRO_BG_BIAS_CTRL_0,
+			      bg_regulator_switch_complete_wait_clks);
+		emc_set_shadow_bypass(emc, ASSEMBLY);
+	}
+
+	/*
+	 * Step 20:
+	 *   Issue ref and optional QRST.
+	 */
+	emc_cc_dbg(STEPS, "Step 20\n");
+	if (dram_type !=3D DRAM_TYPE_LPDDR4)
+		ccfifo_writel(emc, 0, EMC_REF, 0);
+
+	if (opt_do_sw_qrst) {
+		ccfifo_writel(emc, 1, EMC_ISSUE_QRST, 0);
+		ccfifo_writel(emc, 0, EMC_ISSUE_QRST, 2);
+	}
+
+	/*
+	 * Step 21:
+	 *   Restore ZCAL and ZCAL interval.
+	 */
+	emc_cc_dbg(STEPS, "Step 21\n");
+	if (save_restore_clkstop_pd || opt_zcal_en_cc) {
+		ccfifo_writel(emc, emc_dbg_o | EMC_DBG_WRITE_MUX_ACTIVE,
+			      EMC_DBG, 0);
+		if (opt_zcal_en_cc && dram_type !=3D DRAM_TYPE_LPDDR4)
+			ccfifo_writel(emc, next_timing->burst_regs[
+				      EMC_ZCAL_INTERVAL_INDEX],
+				      EMC_ZCAL_INTERVAL, 0);
+
+		if (save_restore_clkstop_pd)
+			ccfifo_writel(emc,
+				      next_timing->burst_regs[EMC_CFG_INDEX] &
+				      ~EMC_CFG_DYN_SELF_REF, EMC_CFG, 0);
+		ccfifo_writel(emc, emc_dbg_o, EMC_DBG, 0);
+	}
+
+	/*
+	 * Step 22:
+	 *   Restore EMC_CFG_PIPE_CLK.
+	 */
+	emc_cc_dbg(STEPS, "Step 22\n");
+	ccfifo_writel(emc, emc_cfg_pipe_clk_o, EMC_CFG_PIPE_CLK, 0);
+
+	if (bg_regulator_mode_change) {
+		if (enable_bg_regulator)
+			emc_writel(emc, next_timing->burst_regs[
+				   EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
+				   ~EMC_PMACRO_BG_BIAS_CTRL_0_BGLP_E_PWRD,
+				   EMC_PMACRO_BG_BIAS_CTRL_0);
+		else
+			emc_writel(emc, next_timing->burst_regs[
+				   EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
+				   ~EMC_PMACRO_BG_BIAS_CTRL_0_BG_E_PWRD,
+				   EMC_PMACRO_BG_BIAS_CTRL_0);
+	}
+
+	/*
+	 * Step 23:
+	 */
+	emc_cc_dbg(STEPS, "Step 23\n");
+
+	tmp =3D emc_readl(emc, EMC_CFG_DIG_DLL);
+	tmp |=3D EMC_CFG_DIG_DLL_CFG_DLL_STALL_ALL_TRAFFIC;
+	tmp &=3D ~EMC_CFG_DIG_DLL_CFG_DLL_STALL_RW_UNTIL_LOCK;
+	tmp &=3D ~EMC_CFG_DIG_DLL_CFG_DLL_STALL_ALL_UNTIL_LOCK;
+	tmp &=3D ~EMC_CFG_DIG_DLL_CFG_DLL_EN;
+	tmp =3D (tmp & ~EMC_CFG_DIG_DLL_CFG_DLL_MODE_MASK) |
+		(2 << EMC_CFG_DIG_DLL_CFG_DLL_MODE_SHIFT);
+	emc_writel(emc, tmp, EMC_CFG_DIG_DLL);
+
+	emc_do_clock_change(emc, clksrc);
+
+	/*
+	 * Step 24:
+	 *   Save training results. Removed.
+	 */
+
+	/*
+	 * Step 25:
+	 *   Program MC updown registers.
+	 */
+	emc_cc_dbg(STEPS, "Step 25\n");
+
+	if (next_timing->rate > last_timing->rate) {
+		for (i =3D 0; i < next_timing->num_up_down; i++)
+			mc_writel(emc->mc, next_timing->la_scale_regs[i],
+				  reg_off.la_scale_regs_off[i]);
+		emc_timing_update(emc, channel_mode);
+	}
+
+	/*
+	 * Step 26:
+	 *   Restore ZCAL registers.
+	 */
+	emc_cc_dbg(STEPS, "Step 26\n");
+	if (dram_type =3D=3D DRAM_TYPE_LPDDR4) {
+		emc_set_shadow_bypass(emc, ACTIVE);
+		emc_writel(emc, next_timing->burst_regs[
+			   EMC_ZCAL_WAIT_CNT_INDEX], EMC_ZCAL_WAIT_CNT);
+		emc_writel(emc, next_timing->burst_regs[
+			   EMC_ZCAL_INTERVAL_INDEX], EMC_ZCAL_INTERVAL);
+		emc_set_shadow_bypass(emc, ASSEMBLY);
+	}
+
+	if (dram_type !=3D DRAM_TYPE_LPDDR4 &&
+	    opt_zcal_en_cc && !opt_short_zcal && opt_cc_short_zcal) {
+		udelay(2);
+
+		emc_set_shadow_bypass(emc, ACTIVE);
+		if (dram_type =3D=3D DRAM_TYPE_LPDDR2)
+			emc_writel(emc, next_timing->burst_regs[
+				   EMC_MRS_WAIT_CNT_INDEX], EMC_MRS_WAIT_CNT);
+		else if (dram_type =3D=3D DRAM_TYPE_DDR3)
+			emc_writel(emc, next_timing->burst_regs[
+				   EMC_ZCAL_WAIT_CNT_INDEX], EMC_ZCAL_WAIT_CNT);
+		emc_set_shadow_bypass(emc, ASSEMBLY);
+	}
+
+	/*
+	 * Step 27:
+	 *   Restore EMC_CFG, FDPD registers.
+	 */
+	emc_cc_dbg(STEPS, "Step 27\n");
+	emc_set_shadow_bypass(emc, ACTIVE);
+	emc_writel(emc, next_timing->burst_regs[EMC_CFG_INDEX], EMC_CFG);
+	emc_set_shadow_bypass(emc, ASSEMBLY);
+	emc_writel(emc, next_timing->emc_fdpd_ctrl_cmd_no_ramp,
+		   EMC_FDPD_CTRL_CMD_NO_RAMP);
+	emc_writel(emc, next_timing->emc_sel_dpd_ctrl, EMC_SEL_DPD_CTRL);
+
+	/*
+	 * Step 28:
+	 *   Training recover. Removed.
+	 */
+	emc_cc_dbg(STEPS, "Step 28\n");
+
+	emc_set_shadow_bypass(emc, ACTIVE);
+	emc_writel(emc,
+		   next_timing->burst_regs[EMC_PMACRO_AUTOCAL_CFG_COMMON_INDEX],
+		   EMC_PMACRO_AUTOCAL_CFG_COMMON);
+	emc_set_shadow_bypass(emc, ASSEMBLY);
+
+	/*
+	 * Step 29:
+	 *   Power fix WAR.
+	 */
+	emc_cc_dbg(STEPS, "Step 29\n");
+	emc_writel(emc, EMC_PMACRO_CFG_PM_GLOBAL_0_DISABLE_CFG_BYTE0 |
+		   EMC_PMACRO_CFG_PM_GLOBAL_0_DISABLE_CFG_BYTE1 |
+		   EMC_PMACRO_CFG_PM_GLOBAL_0_DISABLE_CFG_BYTE2 |
+		   EMC_PMACRO_CFG_PM_GLOBAL_0_DISABLE_CFG_BYTE3 |
+		   EMC_PMACRO_CFG_PM_GLOBAL_0_DISABLE_CFG_BYTE4 |
+		   EMC_PMACRO_CFG_PM_GLOBAL_0_DISABLE_CFG_BYTE5 |
+		   EMC_PMACRO_CFG_PM_GLOBAL_0_DISABLE_CFG_BYTE6 |
+		   EMC_PMACRO_CFG_PM_GLOBAL_0_DISABLE_CFG_BYTE7,
+		   EMC_PMACRO_CFG_PM_GLOBAL_0);
+	emc_writel(emc, EMC_PMACRO_TRAINING_CTRL_0_CH0_TRAINING_E_WRPTR,
+		   EMC_PMACRO_TRAINING_CTRL_0);
+	emc_writel(emc, EMC_PMACRO_TRAINING_CTRL_1_CH1_TRAINING_E_WRPTR,
+		   EMC_PMACRO_TRAINING_CTRL_1);
+	emc_writel(emc, 0, EMC_PMACRO_CFG_PM_GLOBAL_0);
+
+	/*
+	 * Step 30:
+	 *   Re-enable autocal.
+	 */
+	emc_cc_dbg(STEPS, "Step 30: Re-enable DLL and AUTOCAL\n");
+	if (next_timing->burst_regs[EMC_CFG_DIG_DLL_INDEX] &
+	    EMC_CFG_DIG_DLL_CFG_DLL_EN) {
+		tmp =3D emc_readl(emc, EMC_CFG_DIG_DLL);
+		tmp |=3D  EMC_CFG_DIG_DLL_CFG_DLL_STALL_ALL_TRAFFIC;
+		tmp |=3D  EMC_CFG_DIG_DLL_CFG_DLL_EN;
+		tmp &=3D ~EMC_CFG_DIG_DLL_CFG_DLL_STALL_RW_UNTIL_LOCK;
+		tmp &=3D ~EMC_CFG_DIG_DLL_CFG_DLL_STALL_ALL_UNTIL_LOCK;
+		tmp =3D  (tmp & ~EMC_CFG_DIG_DLL_CFG_DLL_MODE_MASK) |
+		       (2 << EMC_CFG_DIG_DLL_CFG_DLL_MODE_SHIFT);
+		emc_writel(emc, tmp, EMC_CFG_DIG_DLL);
+		emc_timing_update(emc, channel_mode);
+	}
+
+	emc_auto_cal_config =3D next_timing->emc_auto_cal_config;
+	emc_writel(emc, emc_auto_cal_config, EMC_AUTO_CAL_CONFIG);
+
+	/* Done! Yay. */
+}
diff --git a/drivers/memory/tegra/tegra210-emc.c b/drivers/memory/tegra/teg=
ra210-emc.c
index 6eb26cdd9679..271a0d017073 100644
--- a/drivers/memory/tegra/tegra210-emc.c
+++ b/drivers/memory/tegra/tegra210-emc.c
@@ -126,6 +126,11 @@ static const char *emc_src_names[TEGRA_EMC_SRC_COUNT] =
=3D {
 };
=20
 static const struct supported_sequence supported_seqs[] =3D {
+	{
+		0x7,
+		emc_set_clock_r21021,
+		__do_periodic_emc_compensation_r21021,
+	},
 	{
 		0,
 		NULL,
diff --git a/drivers/memory/tegra/tegra210-emc.h b/drivers/memory/tegra/teg=
ra210-emc.h
index 494f1cbdb289..621ec53ea02f 100644
--- a/drivers/memory/tegra/tegra210-emc.h
+++ b/drivers/memory/tegra/tegra210-emc.h
@@ -81,7 +81,16 @@
 #define EMC_INTSTATUS_CLKCHANGE_COMPLETE			BIT(4)
 #define EMC_DBG							0x8
 #define EMC_DBG_WRITE_MUX_ACTIVE				BIT(1)
+#define EMC_DBG_WRITE_ACTIVE_ONLY				BIT(30)
 #define EMC_CFG							0xc
+#define EMC_CFG_DRAM_CLKSTOP_PD					BIT(31)
+#define EMC_CFG_DRAM_CLKSTOP_SR					BIT(30)
+#define EMC_CFG_DRAM_ACPD					BIT(29)
+#define EMC_CFG_DYN_SELF_REF					BIT(28)
+#define EMC_PIN							0x24
+#define EMC_PIN_PIN_CKE						BIT(0)
+#define EMC_PIN_PIN_CKEB					BIT(1)
+#define EMC_PIN_PIN_CKE_PER_DEV					BIT(2)
 #define EMC_TIMING_CONTROL					0x28
 #define EMC_RC							0x2c
 #define EMC_RFC							0x30
@@ -121,7 +130,35 @@
 #define EMC_WEXT						0xb8
 #define EMC_RFC_SLR						0xc0
 #define EMC_MRS_WAIT_CNT2					0xc4
+#define EMC_MRS_WAIT_CNT2_MRS_EXT2_WAIT_CNT_SHIFT		16
+#define EMC_MRS_WAIT_CNT2_MRS_EXT1_WAIT_CNT_SHIFT		0
 #define EMC_MRS_WAIT_CNT					0xc8
+#define EMC_MRS_WAIT_CNT_SHORT_WAIT_SHIFT			0
+#define EMC_MRS_WAIT_CNT_SHORT_WAIT_MASK			\
+	(0x3FF << EMC_MRS_WAIT_CNT_SHORT_WAIT_SHIFT)
+
+#define EMC_MRS							0xcc
+#define EMC_EMRS						0xd0
+#define EMC_EMRS_USE_EMRS_LONG_CNT				BIT(26)
+#define EMC_REF							0xd4
+#define EMC_SELF_REF						0xe0
+#define EMC_MRW							0xe8
+#define EMC_MRW_MRW_OP_SHIFT					0
+#define EMC_MRW_MRW_OP_MASK					\
+	(0xff << EMC_MRW_MRW_OP_SHIFT)
+#define EMC_MRW_MRW_MA_SHIFT					16
+#define EMC_MRW_USE_MRW_EXT_CNT					27
+#define EMC_MRW_MRW_DEV_SELECTN_SHIFT				30
+
+#define EMC_MRR							0xec
+#define EMC_MRR_DEV_SEL_SHIFT					30
+#define EMC_MRR_MA_SHIFT					16
+#define EMC_MRR_MA_MASK						\
+	(0xff << EMC_MRR_MA_SHIFT)
+#define EMC_MRR_DATA_SHIFT					0
+#define EMC_MRR_DATA_MASK					\
+	(0xffff << EMC_MRR_DATA_SHIFT)
+
 #define EMC_FBIO_SPARE						0x100
 #define EMC_FBIO_CFG5						0x104
 #define EMC_FBIO_CFG5_DRAM_TYPE_SHIFT				0
@@ -132,14 +169,34 @@
 #define EMC_PDEX2CKE						0x118
 #define EMC_CKE2PDEN						0x11c
 #define EMC_MPC							0x128
+#define EMC_EMRS2						0x12c
+#define EMC_EMRS2_USE_EMRS2_LONG_CNT				BIT(26)
+#define EMC_MRW2						0x134
+#define EMC_MRW3						0x138
+#define EMC_MRW4						0x13c
 #define EMC_R2R							0x144
 #define EMC_EINPUT						0x14c
 #define EMC_EINPUT_DURATION					0x150
 #define EMC_PUTERM_EXTRA					0x154
 #define EMC_TCKESR						0x158
 #define EMC_TPD							0x15c
+#define EMC_AUTO_CAL_CONFIG					0x2a4
+#define EMC_AUTO_CAL_CONFIG_AUTO_CAL_COMPUTE_START		BIT(0)
+#define EMC_AUTO_CAL_CONFIG_AUTO_CAL_MEASURE_STALL		BIT(9)
+#define EMC_AUTO_CAL_CONFIG_AUTO_CAL_UPDATE_STALL		BIT(10)
+#define EMC_AUTO_CAL_CONFIG_AUTO_CAL_ENABLE			BIT(29)
+#define EMC_AUTO_CAL_CONFIG_AUTO_CAL_START			BIT(31)
 #define EMC_EMC_STATUS						0x2b4
+#define EMC_EMC_STATUS_MRR_DIVLD				BIT(20)
 #define EMC_EMC_STATUS_TIMING_UPDATE_STALLED			BIT(23)
+#define EMC_EMC_STATUS_DRAM_IN_POWERDOWN_SHIFT			4
+#define EMC_EMC_STATUS_DRAM_IN_POWERDOWN_MASK			\
+	(0x3 << EMC_EMC_STATUS_DRAM_IN_POWERDOWN_SHIFT)
+#define EMC_EMC_STATUS_DRAM_IN_SELF_REFRESH_SHIFT		8
+#define EMC_EMC_STATUS_DRAM_IN_SELF_REFRESH_MASK		\
+	(0x3 << EMC_EMC_STATUS_DRAM_IN_SELF_REFRESH_SHIFT)
+
+#define EMC_CFG_2						0x2b8
 #define EMC_CFG_DIG_DLL						0x2bc
 #define EMC_CFG_DIG_DLL_CFG_DLL_EN				BIT(0)
 #define EMC_CFG_DIG_DLL_CFG_DLL_STALL_ALL_UNTIL_LOCK		BIT(1)
@@ -165,8 +222,17 @@
 #define EMC_WDV_MASK						0x2d0
 #define EMC_RDV_EARLY_MASK					0x2d4
 #define EMC_RDV_EARLY						0x2d8
+#define EMC_AUTO_CAL_CONFIG8					0x2dc
 #define EMC_ZCAL_INTERVAL					0x2e0
 #define EMC_ZCAL_WAIT_CNT					0x2e4
+#define EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_MASK			0x7ff
+#define EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_SHIFT			0
+
+#define EMC_ZQ_CAL						0x2ec
+#define EMC_ZQ_CAL_DEV_SEL_SHIFT				30
+#define EMC_ZQ_CAL_LONG						BIT(4)
+#define EMC_ZQ_CAL_ZQ_LATCH_CMD					BIT(1)
+#define EMC_ZQ_CAL_ZQ_CAL_CMD					BIT(0)
 #define EMC_FDPD_CTRL_DQ					0x310
 #define EMC_FDPD_CTRL_CMD					0x314
 #define EMC_PMACRO_CMD_BRICK_CTRL_FDPD				0x318
@@ -176,6 +242,13 @@
 #define EMC_TR_TIMING_0						0x3b4
 #define EMC_TR_CTRL_1						0x3bc
 #define EMC_TR_RDV						0x3c4
+#define EMC_STALL_THEN_EXE_AFTER_CLKCHANGE			0x3cc
+#define EMC_SEL_DPD_CTRL					0x3d8
+#define EMC_SEL_DPD_CTRL_DATA_SEL_DPD_EN			BIT(8)
+#define EMC_SEL_DPD_CTRL_ODT_SEL_DPD_EN				BIT(5)
+#define EMC_SEL_DPD_CTRL_RESET_SEL_DPD_EN			BIT(4)
+#define EMC_SEL_DPD_CTRL_CA_SEL_DPD_EN				BIT(3)
+#define EMC_SEL_DPD_CTRL_CLK_SEL_DPD_EN				BIT(2)
 #define EMC_PRE_REFRESH_REQ_CNT					0x3dc
 #define EMC_DYN_SELF_REF_CONTROL				0x3e0
 #define EMC_TXSRDLL						0x3e4
@@ -185,6 +258,9 @@
 #define EMC_TR_RDV_MASK						0x3f8
 #define EMC_TR_QSAFE						0x3fc
 #define EMC_TR_QRST						0x400
+#define EMC_ISSUE_QRST						0x428
+#define EMC_AUTO_CAL_CONFIG2					0x458
+#define EMC_AUTO_CAL_CONFIG3					0x45c
 #define EMC_TR_DVFS						0x460
 #define EMC_AUTO_CAL_CHANNEL					0x464
 #define EMC_IBDLY						0x468
@@ -198,19 +274,26 @@
 #define EMC_MRW6						0x4a4
 #define EMC_MRW7						0x4a8
 #define EMC_MRW8						0x4ac
+#define EMC_MRW9						0x4b0
 #define EMC_MRW10						0x4b4
 #define EMC_MRW11						0x4b8
 #define EMC_MRW12						0x4bc
 #define EMC_MRW13						0x4c0
 #define EMC_MRW14						0x4c4
 #define EMC_MRW15						0x4d0
+#define EMC_CFG_SYNC						0x4d4
+#define EMC_FDPD_CTRL_CMD_NO_RAMP				0x4d8
+#define EMC_FDPD_CTRL_CMD_NO_RAMP_CMD_DPD_NO_RAMP_ENABLE	BIT(0)
 #define EMC_WDV_CHK						0x4e0
 #define EMC_CFG_PIPE_2						0x554
+#define EMC_CFG_PIPE_CLK					0x558
+#define EMC_CFG_PIPE_CLK_CLK_ALWAYS_ON				BIT(0)
 #define EMC_CFG_PIPE_1						0x55c
 #define EMC_CFG_PIPE						0x560
 #define EMC_QPOP						0x564
 #define EMC_QUSE_WIDTH						0x568
 #define EMC_PUTERM_WIDTH					0x56c
+#define EMC_AUTO_CAL_CONFIG7					0x574
 #define EMC_REFCTRL2						0x580
 #define EMC_FBIO_CFG7						0x584
 #define EMC_FBIO_CFG7_CH0_ENABLE				BIT(1)
@@ -275,10 +358,13 @@
 #define EMC_CMD_BRLSHFT_2					0x5a4
 #define EMC_CMD_BRLSHFT_3					0x5a8
 #define EMC_QUSE_BRLSHFT_0					0x5ac
+#define EMC_AUTO_CAL_CONFIG4					0x5b0
+#define EMC_AUTO_CAL_CONFIG5					0x5b4
 #define EMC_QUSE_BRLSHFT_1					0x5b8
 #define EMC_QUSE_BRLSHFT_2					0x5bc
 #define EMC_CCDMW						0x5c0
 #define EMC_QUSE_BRLSHFT_3					0x5c4
+#define EMC_AUTO_CAL_CONFIG6					0x5cc
 #define EMC_DLL_CFG_0						0x5e4
 #define EMC_DLL_CFG_1						0x5e8
 #define EMC_DLL_CFG_1_DDLLCAL_CTRL_START_TRIM_SHIFT		10
@@ -286,6 +372,11 @@
 	(0x7ff << EMC_DLL_CFG_1_DDLLCAL_CTRL_START_TRIM_SHIFT)
=20
 #define EMC_CONFIG_SAMPLE_DELAY					0x5f0
+#define EMC_CFG_UPDATE						0x5f4
+#define EMC_CFG_UPDATE_UPDATE_DLL_IN_UPDATE_SHIFT		9
+#define EMC_CFG_UPDATE_UPDATE_DLL_IN_UPDATE_MASK		\
+	(0x3 << EMC_CFG_UPDATE_UPDATE_DLL_IN_UPDATE_SHIFT)
+
 #define EMC_PMACRO_QUSE_DDLL_RANK0_0				0x600
 #define EMC_PMACRO_QUSE_DDLL_RANK0_1				0x604
 #define EMC_PMACRO_QUSE_DDLL_RANK0_2				0x608
@@ -594,9 +685,20 @@
 #define EMC_PMACRO_DDLL_SHORT_CMD_0				0xc20
 #define EMC_PMACRO_DDLL_SHORT_CMD_1				0xc24
 #define EMC_PMACRO_DDLL_SHORT_CMD_2				0xc28
+#define EMC_PMACRO_CFG_PM_GLOBAL_0				0xc30
+#define EMC_PMACRO_CFG_PM_GLOBAL_0_DISABLE_CFG_BYTE0		BIT(16)
+#define EMC_PMACRO_CFG_PM_GLOBAL_0_DISABLE_CFG_BYTE1		BIT(17)
+#define EMC_PMACRO_CFG_PM_GLOBAL_0_DISABLE_CFG_BYTE2		BIT(18)
+#define EMC_PMACRO_CFG_PM_GLOBAL_0_DISABLE_CFG_BYTE3		BIT(19)
+#define EMC_PMACRO_CFG_PM_GLOBAL_0_DISABLE_CFG_BYTE4		BIT(20)
+#define EMC_PMACRO_CFG_PM_GLOBAL_0_DISABLE_CFG_BYTE5		BIT(21)
+#define EMC_PMACRO_CFG_PM_GLOBAL_0_DISABLE_CFG_BYTE6		BIT(22)
+#define EMC_PMACRO_CFG_PM_GLOBAL_0_DISABLE_CFG_BYTE7		BIT(23)
 #define EMC_PMACRO_VTTGEN_CTRL_0				0xc34
 #define EMC_PMACRO_VTTGEN_CTRL_1				0xc38
 #define EMC_PMACRO_BG_BIAS_CTRL_0				0xc3c
+#define EMC_PMACRO_BG_BIAS_CTRL_0_BG_E_PWRD			BIT(0)
+#define EMC_PMACRO_BG_BIAS_CTRL_0_BGLP_E_PWRD			BIT(2)
 #define EMC_PMACRO_PAD_CFG_CTRL					0xc40
 #define EMC_PMACRO_ZCTRL					0xc44
 #define EMC_PMACRO_CMD_PAD_RX_CTRL				0xc50
@@ -611,15 +713,22 @@
 #define EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_DRVFORCEON		BIT(26)
=20
 #define EMC_PMACRO_DATA_PAD_TX_CTRL				0xc64
+#define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_E_IVREF		BIT(0)
 #define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_TX_E_DCC		BIT(1)
+#define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQS_E_IVREF		BIT(8)
 #define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSP_TX_E_DCC		BIT(9)
 #define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSN_TX_E_DCC		BIT(16)
 #define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_CMD_TX_E_DCC		BIT(24)
=20
 #define EMC_PMACRO_COMMON_PAD_TX_CTRL				0xc68
 #define EMC_PMACRO_AUTOCAL_CFG_COMMON				0xc78
+#define EMC_PMACRO_AUTOCAL_CFG_COMMON_E_CAL_BYPASS_DVFS		BIT(16)
 #define EMC_PMACRO_VTTGEN_CTRL_2				0xcf0
 #define EMC_PMACRO_IB_RXRT					0xcf4
+#define EMC_PMACRO_TRAINING_CTRL_0				0xcf8
+#define EMC_PMACRO_TRAINING_CTRL_0_CH0_TRAINING_E_WRPTR		BIT(3)
+#define EMC_PMACRO_TRAINING_CTRL_1				0xcfc
+#define EMC_PMACRO_TRAINING_CTRL_1_CH1_TRAINING_E_WRPTR		BIT(3)
 #define EMC_TRAINING_CTRL					0xe04
 #define EMC_TRAINING_QUSE_CORS_CTRL				0xe0c
 #define EMC_TRAINING_QUSE_FINE_CTRL				0xe10
@@ -645,15 +754,31 @@
 #define EMC_COPY_TABLE_PARAM_TRIM_REGS				BIT(1)
=20
 enum burst_regs_list {
+	EMC_RP_INDEX =3D 6,
+	EMC_R2P_INDEX =3D 9,
+	EMC_W2P_INDEX,
+	EMC_MRW6_INDEX =3D 31,
 	EMC_REFRESH_INDEX =3D 41,
 	EMC_PRE_REFRESH_REQ_CNT_INDEX =3D 43,
+	EMC_TRPAB_INDEX =3D 59,
+	EMC_MRW7_INDEX =3D 62,
 	EMC_FBIO_CFG5_INDEX =3D 65,
+	EMC_FBIO_CFG7_INDEX,
+	EMC_CFG_DIG_DLL_INDEX,
+	EMC_ZCAL_INTERVAL_INDEX =3D 139,
+	EMC_ZCAL_WAIT_CNT_INDEX,
+	EMC_MRS_WAIT_CNT_INDEX =3D 141,
 	EMC_DLL_CFG_0_INDEX =3D 144,
+	EMC_PMACRO_AUTOCAL_CFG_COMMON_INDEX =3D 146,
+	EMC_CFG_INDEX =3D 148,
 	EMC_DYN_SELF_REF_CONTROL_INDEX =3D 150,
 	EMC_PMACRO_CMD_PAD_TX_CTRL_INDEX =3D 161,
 	EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX,
 	EMC_PMACRO_COMMON_PAD_TX_CTRL_INDEX,
 	EMC_PMACRO_BRICK_CTRL_RFU1_INDEX =3D 167,
+	EMC_PMACRO_BG_BIAS_CTRL_0_INDEX =3D 171,
+	EMC_MRW14_INDEX =3D 199,
+	EMC_MRW15_INDEX =3D 220,
 };
=20
 enum trim_regs_list {
@@ -683,6 +808,36 @@ enum {
 	DLL_ON,
 };
=20
+enum {
+	ONE_RANK =3D 1,
+	TWO_RANK =3D 2,
+};
+
+enum {
+	T_RP,
+	T_FC_LPDDR4,
+	T_RFC,
+	T_PDEX,
+	RL,
+};
+
+enum {
+	AUTO_PD =3D 0,
+	MAN_SR  =3D 2,
+};
+
+enum {
+	ASSEMBLY =3D 0,
+	ACTIVE,
+};
+
+enum {
+	DRAM_TYPE_DDR3,
+	DRAM_TYPE_LPDDR4,
+	DRAM_TYPE_LPDDR2,
+	DRAM_TYPE_DDR2,
+};
+
 enum {
 	REG_EMC,
 	REG_EMC0,
@@ -847,7 +1002,9 @@ void emc_writel_per_ch(struct tegra_emc *emc, u32 val,=
 int type,
 		       unsigned long offset);
 u32  emc1_readl(struct tegra_emc *emc, unsigned long offset);
=20
+u32 __do_periodic_emc_compensation_r21021(struct tegra_emc *emc);
 void emc_do_clock_change(struct tegra_emc *emc, u32 clksrc);
+void emc_set_clock_r21021(struct tegra_emc *emc, u32 clksrc);
 void emc_set_shadow_bypass(struct tegra_emc *emc, int set);
 void emc_timing_update(struct tegra_emc *emc, int dual_chan);
 u32 emc_get_dll_state(struct emc_table *next_timing);
--=20
2.21.0


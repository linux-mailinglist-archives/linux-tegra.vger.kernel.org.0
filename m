Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0F761250FC
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 19:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbfLRSu3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 13:50:29 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37748 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfLRSu3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 13:50:29 -0500
Received: by mail-lf1-f66.google.com with SMTP id b15so2461406lfc.4
        for <linux-tegra@vger.kernel.org>; Wed, 18 Dec 2019 10:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hJLUe4fMaUXWedrLnThOnCSWsTV2jKrcGiDjm7t+ayY=;
        b=mRGuRaTz+FFdoh7GkF25qvC99Ji2yfOKjNliZh1y9Y2GOHAYGCU5ETA0vroGM0IDEi
         P5+QO73/jhy6FlMdpoX/y1xua4sPgtPWPZ6ar4mYgwrXWYRwoKNZdvS7QAQzajHZ4rKq
         9q3FQVm+cASkwAuTpuua8EMaQiWOD1XL1S2YaC7O0TUTlsR2SrUmwMA2e1quee3Kq3bm
         MJM0j8pG3lcjx7KA7TbFfbo8xOLIMxmjrBe7sSCpMJAl/LFQ8NI0igH4AYL5NHYYvVsc
         t0tfUdwN6CK7tMt5/zIhnXZlUYWZDp1Z5fIhl/N1Ls+sLSWsWnsMqKVQaaWlCAVvEUN8
         HvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hJLUe4fMaUXWedrLnThOnCSWsTV2jKrcGiDjm7t+ayY=;
        b=QmvELQBV5Rb0jMVhWk+WVfEfAQWDdtpBDcrw1ozW8i/EweGfw/Aog+Orhu/prVLMUf
         jCe5xkRSxHTS6K8zyb2gnX+Wg+wlL20yR5ZpE6bryDUA8wF3it3PZWeU/fyWILgLUld1
         XyQWmLLSZ5bFyaGZrofg3mCkC0jR0978x19HygZZAtUhGWvvfzwjpDcW1HVL7mXCAkPt
         sCv834xiflUa9d2Hp3i8bEDFnIWrWbfyukHk7ObRVXjzc1ObxNmBsBhyltIFqdev565L
         8sPCmwAkESGqKL9gtADswi89bcfvOcwvdBPovTsgjVRRkJIhZOqc/IPSEJzkPiOxEVOW
         m/Fg==
X-Gm-Message-State: APjAAAXqiXMo2sEpiRZ+d4WaAr5kNj+thhlCn4TDf0h+px0E5U0preZo
        NHDixaH4FScc0abtPbM5j4R5lNBe
X-Google-Smtp-Source: APXvYqxkWr67aiesnGo6f7tJuiSCSS509W1aEDAtR3vO8Wg+EhEo6cJ/rB76Yq8PinUUnGxnmo7xHw==
X-Received: by 2002:a19:f00d:: with SMTP id p13mr2807084lfc.37.1576695026386;
        Wed, 18 Dec 2019 10:50:26 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id y7sm1592586ljn.31.2019.12.18.10.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 10:50:25 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/3] memory: tegra30-emc: Firm up hardware programming sequence
Date:   Wed, 18 Dec 2019 21:50:01 +0300
Message-Id: <20191218185002.26970-3-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191218185002.26970-1-digetx@gmail.com>
References: <20191218185002.26970-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Previously there was a problem where a late handshake handling caused
a memory corruption, this problem was resolved by issuing calibration
command right after changing the timing, but looks like the solution
wasn't entirely correct since calibration interval could be disabled as
well. Now programming sequence is completed immediately after receiving
handshake from CaR, without potentially long delays and in accordance to
the TRM's programming guide.

Secondly, the TRM's programming guide suggests to flush EMC writes by
reading any *MC* register before doing CaR changes. This is also addressed
now.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra30-emc.c | 148 +++++++++++++++++------------
 1 file changed, 88 insertions(+), 60 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 8e156726b2de..cbc113ddd07c 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -332,6 +332,7 @@ struct tegra_emc {
 	void __iomem *regs;
 	unsigned int irq;
 
+	struct emc_timing *new_timing;
 	struct emc_timing *timings;
 	unsigned int num_timings;
 
@@ -348,6 +349,66 @@ struct tegra_emc {
 	bool bad_state : 1;
 };
 
+static int emc_seq_update_timing(struct tegra_emc *emc)
+{
+	u32 val;
+	int err;
+
+	writel_relaxed(EMC_TIMING_UPDATE, emc->regs + EMC_TIMING_CONTROL);
+
+	err = readl_relaxed_poll_timeout_atomic(emc->regs + EMC_STATUS, val,
+				!(val & EMC_STATUS_TIMING_UPDATE_STALLED),
+				1, 200);
+	if (err) {
+		dev_err(emc->dev, "failed to update timing: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static void emc_complete_clk_change(struct tegra_emc *emc)
+{
+	struct emc_timing *timing = emc->new_timing;
+	unsigned int dram_num;
+	bool failed = false;
+	int err;
+
+	/* re-enable auto-refresh */
+	dram_num = tegra_mc_get_emem_device_count(emc->mc);
+	writel_relaxed(EMC_REFCTRL_ENABLE_ALL(dram_num),
+		       emc->regs + EMC_REFCTRL);
+
+	/* restore auto-calibration */
+	if (emc->vref_cal_toggle)
+		writel_relaxed(timing->emc_auto_cal_interval,
+			       emc->regs + EMC_AUTO_CAL_INTERVAL);
+
+	/* restore dynamic self-refresh */
+	if (timing->emc_cfg_dyn_self_ref) {
+		emc->emc_cfg |= EMC_CFG_DYN_SREF_ENABLE;
+		writel_relaxed(emc->emc_cfg, emc->regs + EMC_CFG);
+	}
+
+	/* set number of clocks to wait after each ZQ command */
+	if (emc->zcal_long)
+		writel_relaxed(timing->emc_zcal_cnt_long,
+			       emc->regs + EMC_ZCAL_WAIT_CNT);
+
+	/* wait for writes to settle */
+	udelay(2);
+
+	/* update restored timing */
+	err = emc_seq_update_timing(emc);
+	if (err)
+		failed = true;
+
+	/* restore early ACK */
+	mc_writel(emc->mc, emc->mc_override, MC_EMEM_ARB_OVERRIDE);
+
+	emc->bad_state = failed;
+}
+
 static irqreturn_t tegra_emc_isr(int irq, void *data)
 {
 	struct tegra_emc *emc = data;
@@ -358,10 +419,6 @@ static irqreturn_t tegra_emc_isr(int irq, void *data)
 	if (!status)
 		return IRQ_NONE;
 
-	/* notify about EMC-CAR handshake completion */
-	if (status & EMC_CLKCHANGE_COMPLETE_INT)
-		complete(&emc->clk_handshake_complete);
-
 	/* notify about HW problem */
 	if (status & EMC_REFRESH_OVERFLOW_INT)
 		dev_err_ratelimited(emc->dev,
@@ -370,6 +427,18 @@ static irqreturn_t tegra_emc_isr(int irq, void *data)
 	/* clear interrupts */
 	writel_relaxed(status, emc->regs + EMC_INTSTATUS);
 
+	/* notify about EMC-CAR handshake completion */
+	if (status & EMC_CLKCHANGE_COMPLETE_INT) {
+		if (completion_done(&emc->clk_handshake_complete)) {
+			dev_err_ratelimited(emc->dev,
+					    "bogus handshake interrupt\n");
+			return IRQ_NONE;
+		}
+
+		emc_complete_clk_change(emc);
+		complete(&emc->clk_handshake_complete);
+	}
+
 	return IRQ_HANDLED;
 }
 
@@ -437,24 +506,6 @@ static bool emc_dqs_preset(struct tegra_emc *emc, struct emc_timing *timing,
 	return preset;
 }
 
-static int emc_seq_update_timing(struct tegra_emc *emc)
-{
-	u32 val;
-	int err;
-
-	writel_relaxed(EMC_TIMING_UPDATE, emc->regs + EMC_TIMING_CONTROL);
-
-	err = readl_relaxed_poll_timeout_atomic(emc->regs + EMC_STATUS, val,
-				!(val & EMC_STATUS_TIMING_UPDATE_STALLED),
-				1, 200);
-	if (err) {
-		dev_err(emc->dev, "failed to update timing: %d\n", err);
-		return err;
-	}
-
-	return 0;
-}
-
 static int emc_prepare_mc_clk_cfg(struct tegra_emc *emc, unsigned long rate)
 {
 	struct tegra_mc *mc = emc->mc;
@@ -620,9 +671,6 @@ static int emc_prepare_timing_change(struct tegra_emc *emc, unsigned long rate)
 		writel_relaxed(val, emc->regs + EMC_MRS_WAIT_CNT);
 	}
 
-	/* disable interrupt since read access is prohibited after stalling */
-	disable_irq(emc->irq);
-
 	/* this read also completes the writes */
 	val = readl_relaxed(emc->regs + EMC_SEL_DPD_CTRL);
 
@@ -738,17 +786,18 @@ static int emc_prepare_timing_change(struct tegra_emc *emc, unsigned long rate)
 				       emc->regs + EMC_ZQ_CAL);
 	}
 
-	/* re-enable auto-refresh */
-	writel_relaxed(EMC_REFCTRL_ENABLE_ALL(dram_num),
-		       emc->regs + EMC_REFCTRL);
-
 	/* flow control marker 3 */
 	writel_relaxed(0x1, emc->regs + EMC_UNSTALL_RW_AFTER_CLKCHANGE);
 
+	/*
+	 * Read and discard an arbitrary MC register (Note: EMC registers
+	 * can't be used) to ensure the register writes are completed.
+	 */
+	mc_readl(emc->mc, MC_EMEM_ARB_OVERRIDE);
+
 	reinit_completion(&emc->clk_handshake_complete);
 
-	/* interrupt can be re-enabled now */
-	enable_irq(emc->irq);
+	emc->new_timing = timing;
 
 	return 0;
 }
@@ -756,9 +805,7 @@ static int emc_prepare_timing_change(struct tegra_emc *emc, unsigned long rate)
 static int emc_complete_timing_change(struct tegra_emc *emc,
 				      unsigned long rate)
 {
-	struct emc_timing *timing = emc_find_timing(emc, rate);
 	unsigned long timeout;
-	int err;
 
 	timeout = wait_for_completion_timeout(&emc->clk_handshake_complete,
 					      msecs_to_jiffies(100));
@@ -767,33 +814,8 @@ static int emc_complete_timing_change(struct tegra_emc *emc,
 		return -EIO;
 	}
 
-	/* restore auto-calibration */
-	if (emc->vref_cal_toggle)
-		writel_relaxed(timing->emc_auto_cal_interval,
-			       emc->regs + EMC_AUTO_CAL_INTERVAL);
-
-	/* restore dynamic self-refresh */
-	if (timing->emc_cfg_dyn_self_ref) {
-		emc->emc_cfg |= EMC_CFG_DYN_SREF_ENABLE;
-		writel_relaxed(emc->emc_cfg, emc->regs + EMC_CFG);
-	}
-
-	/* set number of clocks to wait after each ZQ command */
-	if (emc->zcal_long)
-		writel_relaxed(timing->emc_zcal_cnt_long,
-			       emc->regs + EMC_ZCAL_WAIT_CNT);
-
-	udelay(2);
-	/* update restored timing */
-	err = emc_seq_update_timing(emc);
-
-	/* restore early ACK */
-	mc_writel(emc->mc, emc->mc_override, MC_EMEM_ARB_OVERRIDE);
-
-	if (err)
-		return err;
-
-	emc->bad_state = false;
+	if (emc->bad_state)
+		return -EIO;
 
 	return 0;
 }
@@ -819,7 +841,13 @@ static int emc_clk_change_notify(struct notifier_block *nb,
 
 	switch (msg) {
 	case PRE_RATE_CHANGE:
+		/*
+		 * Disable interrupt since read accesses are prohibited after
+		 * stalling.
+		 */
+		disable_irq(emc->irq);
 		err = emc_prepare_timing_change(emc, cnd->new_rate);
+		enable_irq(emc->irq);
 		break;
 
 	case ABORT_RATE_CHANGE:
-- 
2.24.0


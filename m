Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEA518C085
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Mar 2020 20:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgCSTiN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 19 Mar 2020 15:38:13 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45149 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgCSTiN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Mar 2020 15:38:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id y17so3853073ljk.12
        for <linux-tegra@vger.kernel.org>; Thu, 19 Mar 2020 12:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4mEBBzCTwKALAZE6w4Ux2tf5f8B6W3umTUvr+C3qcV4=;
        b=YNE8DSmru9I7lE0a2BvFQdo640BVkEItUHb1iWHroOkUYUOcYWpKnA7L4AVSHlz2sv
         BO3i5VonvuU0PgUcaW7dqkRiE1mflY/xrFfAG7ZiOFSTkjkRXAUfBl+bIeelQIzCZhaf
         s7ofGGC5nEXNKf39n+7pT4hug7bDcdR4VKZxW4N9WKui2jwP3JxzSqYD1d+NRef0XUhe
         tMBtzD20tNKjJX2aYbCBPi+9vm8A5nMqFTevzchZ5wKQa1KGdQa3BC0xCwJfxAW+lOA4
         7Gx8BeI4/agrFP5ttp/1ONc23MVfRVpWGvpHHaRyHtXXY1ruX4q7975KqlUbBq2b6Z2J
         y38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4mEBBzCTwKALAZE6w4Ux2tf5f8B6W3umTUvr+C3qcV4=;
        b=qIvVxv2lrTLr0AvmhYumfyv/1cyUOf6bkFnI6wVMi+k+zL1AHjH/DhuhmvK7Hq7ec/
         Ydx+OQNH+/pqaYyDEwrf4lDjmfWBiKiVUrHY+8gpfPLSLV3n2dLz4sMpChl5cQS1/efm
         lxOQUINyfUgM/oKxcYI4LlzhzHhCvh6/FiV8KaX/DNJKms3z9mu3WtXF8j0U+ko7rrpg
         ruBWI7vU/o4n2DYXJp07zqd4MOncHrmNrQm9hcTua/KihEIQvdxiOEIgZ59Z/5gmVC84
         pdGU1EndsV+mLQiC6sOk0BeU77VJldCKAJN1FpvO2lq3DGZX1/wWaB29qkwFbYj/bQFm
         KmQA==
X-Gm-Message-State: ANhLgQ0of/SS0V3x0dWp+36y8CQGuCz9ea6Ow/JYXfTaIOyAwTdPKA/e
        V9w4U5AY5sxmtiATqEadTgk=
X-Google-Smtp-Source: ADFU+vtx4n2eCwvby79XxR51GW4DuufRdtwZ7Umj8whpbSw328wxLxiYxfcZVkz348iBkV4vJZHplQ==
X-Received: by 2002:a2e:a318:: with SMTP id l24mr3050176lje.41.1584646691381;
        Thu, 19 Mar 2020 12:38:11 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.gmail.com with ESMTPSA id u19sm2003396ljk.12.2020.03.19.12.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 12:38:10 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/2] memory: tegra30-emc: Poll EMC-CaR handshake instead of waiting for interrupt
Date:   Thu, 19 Mar 2020 22:36:48 +0300
Message-Id: <20200319193648.8810-2-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200319193648.8810-1-digetx@gmail.com>
References: <20200319193648.8810-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The memory clock-rate change could be running on a non-boot CPU, while the
boot CPU handles the EMC interrupt. This introduces an unnecessary latency
since boot CPU should handle the interrupt and then notify the sibling CPU
about clock-rate change completion. In some rare cases boot CPU could be
in uninterruptible state for a significant time (like in a case of KASAN +
NFS root), it could get to the point that completion timeouts before boot
CPU gets a chance to handle interrupt. The solution is to get rid of the
completion and replace it with interrupt-status polling.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra30-emc.c | 116 +++++++++++------------------
 1 file changed, 44 insertions(+), 72 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 727dc7153390..900a291803ca 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -11,7 +11,6 @@
 
 #include <linux/clk.h>
 #include <linux/clk/tegra.h>
-#include <linux/completion.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -327,7 +326,6 @@ struct emc_timing {
 struct tegra_emc {
 	struct device *dev;
 	struct tegra_mc *mc;
-	struct completion clk_handshake_complete;
 	struct notifier_block clk_nb;
 	struct clk *clk;
 	void __iomem *regs;
@@ -374,52 +372,10 @@ static int emc_seq_update_timing(struct tegra_emc *emc)
 	return 0;
 }
 
-static void emc_complete_clk_change(struct tegra_emc *emc)
-{
-	struct emc_timing *timing = emc->new_timing;
-	unsigned int dram_num;
-	bool failed = false;
-	int err;
-
-	/* re-enable auto-refresh */
-	dram_num = tegra_mc_get_emem_device_count(emc->mc);
-	writel_relaxed(EMC_REFCTRL_ENABLE_ALL(dram_num),
-		       emc->regs + EMC_REFCTRL);
-
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
-	/* wait for writes to settle */
-	udelay(2);
-
-	/* update restored timing */
-	err = emc_seq_update_timing(emc);
-	if (err)
-		failed = true;
-
-	/* restore early ACK */
-	mc_writel(emc->mc, emc->mc_override, MC_EMEM_ARB_OVERRIDE);
-
-	WRITE_ONCE(emc->bad_state, failed);
-}
-
 static irqreturn_t tegra_emc_isr(int irq, void *data)
 {
 	struct tegra_emc *emc = data;
-	u32 intmask = EMC_REFRESH_OVERFLOW_INT | EMC_CLKCHANGE_COMPLETE_INT;
+	u32 intmask = EMC_REFRESH_OVERFLOW_INT;
 	u32 status;
 
 	status = readl_relaxed(emc->regs + EMC_INTSTATUS) & intmask;
@@ -434,18 +390,6 @@ static irqreturn_t tegra_emc_isr(int irq, void *data)
 	/* clear interrupts */
 	writel_relaxed(status, emc->regs + EMC_INTSTATUS);
 
-	/* notify about EMC-CAR handshake completion */
-	if (status & EMC_CLKCHANGE_COMPLETE_INT) {
-		if (completion_done(&emc->clk_handshake_complete)) {
-			dev_err_ratelimited(emc->dev,
-					    "bogus handshake interrupt\n");
-			return IRQ_NONE;
-		}
-
-		emc_complete_clk_change(emc);
-		complete(&emc->clk_handshake_complete);
-	}
-
 	return IRQ_HANDLED;
 }
 
@@ -801,29 +745,58 @@ static int emc_prepare_timing_change(struct tegra_emc *emc, unsigned long rate)
 	 */
 	mc_readl(emc->mc, MC_EMEM_ARB_OVERRIDE);
 
-	reinit_completion(&emc->clk_handshake_complete);
-
-	emc->new_timing = timing;
-
 	return 0;
 }
 
 static int emc_complete_timing_change(struct tegra_emc *emc,
 				      unsigned long rate)
 {
-	unsigned long timeout;
+	struct emc_timing *timing = emc_find_timing(emc, rate);
+	unsigned int dram_num;
+	u32 val;
+	int err;
 
-	timeout = wait_for_completion_timeout(&emc->clk_handshake_complete,
-					      msecs_to_jiffies(100));
-	if (timeout == 0) {
-		dev_err(emc->dev, "emc-car handshake failed\n");
-		return -EIO;
+	err = readl_relaxed_poll_timeout_atomic(emc->regs + EMC_INTSTATUS, val,
+						val & EMC_CLKCHANGE_COMPLETE_INT,
+						1, 100);
+	if (err) {
+		dev_err(emc->dev, "emc-car handshake timeout: %d\n", err);
+		return err;
 	}
 
-	if (READ_ONCE(emc->bad_state))
-		return -EIO;
+	/* re-enable auto-refresh */
+	dram_num = tegra_mc_get_emem_device_count(emc->mc);
+	writel_relaxed(EMC_REFCTRL_ENABLE_ALL(dram_num),
+		       emc->regs + EMC_REFCTRL);
+
+	/* restore auto-calibration */
+	if (emc->vref_cal_toggle)
+		writel_relaxed(timing->emc_auto_cal_interval,
+			       emc->regs + EMC_AUTO_CAL_INTERVAL);
 
-	return 0;
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
+	if (!err)
+		emc->bad_state = false;
+
+	/* restore early ACK */
+	mc_writel(emc->mc, emc->mc_override, MC_EMEM_ARB_OVERRIDE);
+
+	return err;
 }
 
 static int emc_unprepare_timing_change(struct tegra_emc *emc,
@@ -1033,7 +1006,7 @@ static struct device_node *emc_find_node_by_ram_code(struct device *dev)
 
 static int emc_setup_hw(struct tegra_emc *emc)
 {
-	u32 intmask = EMC_REFRESH_OVERFLOW_INT | EMC_CLKCHANGE_COMPLETE_INT;
+	u32 intmask = EMC_REFRESH_OVERFLOW_INT;
 	u32 fbio_cfg5, emc_cfg, emc_dbg;
 	enum emc_dram_type dram_type;
 
@@ -1321,7 +1294,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (!emc->mc)
 		return -EPROBE_DEFER;
 
-	init_completion(&emc->clk_handshake_complete);
 	emc->clk_nb.notifier_call = emc_clk_change_notify;
 	emc->dev = &pdev->dev;
 
-- 
2.25.1


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE4018C086
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Mar 2020 20:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgCSTiP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 19 Mar 2020 15:38:15 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34064 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726895AbgCSTiO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Mar 2020 15:38:14 -0400
Received: by mail-lj1-f196.google.com with SMTP id s13so3917974ljm.1
        for <linux-tegra@vger.kernel.org>; Thu, 19 Mar 2020 12:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hkqo/JVfVpGRItPnoz16xNcySsuXd5mHzQp27gotWtg=;
        b=BzOni5FFk7qP1G1rlEPxQ/tKEbbqKyfBaaBPESSrJqN5MjVEGHtNF+nZKej6aP/TsL
         V5HWOiwNYohBog9ysrg1ZySuKB5Cr2AGalDM9nYWblZaaFG8RJ2fjY7Bcsic30OO/oIe
         MDFpqnogxnBo7mQYKMdPbbI4RTRiCrXnG62kWbcKG5mKPaCah1FstQfX//mTVkEX4Rw5
         Yia1oulzUQPDPvcZxC7sj0uWu0nhfPx6wABOayDyNZA+XzvF91m8SVBCca3AJrJh6ZDF
         7QMTtOgCkzDWQPUtBnRrYzc8shCKtl58n43UmmaeIQUgmXThMsD0vS63eCyBTsZLnXGJ
         /eYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hkqo/JVfVpGRItPnoz16xNcySsuXd5mHzQp27gotWtg=;
        b=qvNCFsCFfAqkw66fb9sub+Nj57DjKNORHvzXQqN3BQnqqq+3c28uhkfuWCAzAY7Eck
         ise3A/DYpj9ERQk5C/E0LmkLimn7Yrnt8Guu58mynA2/smqBsAZHkXBFOKtmNiMXsDYP
         mtyH4+DhnXZAQiy2Fypiae03PMwFu2ZS44M/FMkXJBZxilcXEm2XaVIcA59su5Wl4LRO
         lg4vqeQQMM9M7bD/D4ECGkTbgZgJ5QCWJfBK+2vt91fevi6aBY2JmOEvORrv5MvE6QfU
         uwdTiNIlCw+R6rjct0yo2RQXkOHKwQS71qdsMArvRJKGgM2EK6pgk8Rl3x7Shlm54yjM
         qqnQ==
X-Gm-Message-State: ANhLgQ37HoyIaJXfHlnFbMxBuUle/FxHe+pZWaswBHetaYacz++J1Ja2
        RpYi+SRJtK3GoZxX3lwAW/c=
X-Google-Smtp-Source: ADFU+vu6dSERRcYA/mWZvCsk0Y8REa72LIM50O934gP4vt80jv+cCKyaqPOposYsgUJVrnvAgcdn9w==
X-Received: by 2002:a2e:8192:: with SMTP id e18mr3209714ljg.57.1584646690451;
        Thu, 19 Mar 2020 12:38:10 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.gmail.com with ESMTPSA id u19sm2003396ljk.12.2020.03.19.12.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 12:38:09 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/2] memory: tegra20-emc: Poll EMC-CaR handshake instead of waiting for interrupt
Date:   Thu, 19 Mar 2020 22:36:47 +0300
Message-Id: <20200319193648.8810-1-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
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
 drivers/memory/tegra/tegra20-emc.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index f74dd417c874..60b048ae9982 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -7,11 +7,11 @@
 
 #include <linux/clk.h>
 #include <linux/clk/tegra.h>
-#include <linux/completion.h>
 #include <linux/debugfs.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -144,7 +144,6 @@ struct emc_timing {
 
 struct tegra_emc {
 	struct device *dev;
-	struct completion clk_handshake_complete;
 	struct notifier_block clk_nb;
 	struct clk *clk;
 	void __iomem *regs;
@@ -162,17 +161,13 @@ struct tegra_emc {
 static irqreturn_t tegra_emc_isr(int irq, void *data)
 {
 	struct tegra_emc *emc = data;
-	u32 intmask = EMC_REFRESH_OVERFLOW_INT | EMC_CLKCHANGE_COMPLETE_INT;
+	u32 intmask = EMC_REFRESH_OVERFLOW_INT;
 	u32 status;
 
 	status = readl_relaxed(emc->regs + EMC_INTSTATUS) & intmask;
 	if (!status)
 		return IRQ_NONE;
 
-	/* notify about EMC-CAR handshake completion */
-	if (status & EMC_CLKCHANGE_COMPLETE_INT)
-		complete(&emc->clk_handshake_complete);
-
 	/* notify about HW problem */
 	if (status & EMC_REFRESH_OVERFLOW_INT)
 		dev_err_ratelimited(emc->dev,
@@ -224,14 +219,13 @@ static int emc_prepare_timing_change(struct tegra_emc *emc, unsigned long rate)
 	/* wait until programming has settled */
 	readl_relaxed(emc->regs + emc_timing_registers[i - 1]);
 
-	reinit_completion(&emc->clk_handshake_complete);
-
 	return 0;
 }
 
 static int emc_complete_timing_change(struct tegra_emc *emc, bool flush)
 {
-	unsigned long timeout;
+	u32 val;
+	int err;
 
 	dev_dbg(emc->dev, "%s: flush %d\n", __func__, flush);
 
@@ -242,11 +236,12 @@ static int emc_complete_timing_change(struct tegra_emc *emc, bool flush)
 		return 0;
 	}
 
-	timeout = wait_for_completion_timeout(&emc->clk_handshake_complete,
-					      msecs_to_jiffies(100));
-	if (timeout == 0) {
-		dev_err(emc->dev, "EMC-CAR handshake failed\n");
-		return -EIO;
+	err = readl_relaxed_poll_timeout_atomic(emc->regs + EMC_INTSTATUS, val,
+						val & EMC_CLKCHANGE_COMPLETE_INT,
+						1, 100);
+	if (err) {
+		dev_err(emc->dev, "emc-car handshake timeout: %d\n", err);
+		return err;
 	}
 
 	return 0;
@@ -412,7 +407,7 @@ tegra_emc_find_node_by_ram_code(struct device *dev)
 
 static int emc_setup_hw(struct tegra_emc *emc)
 {
-	u32 intmask = EMC_REFRESH_OVERFLOW_INT | EMC_CLKCHANGE_COMPLETE_INT;
+	u32 intmask = EMC_REFRESH_OVERFLOW_INT;
 	u32 emc_cfg, emc_dbg;
 
 	emc_cfg = readl_relaxed(emc->regs + EMC_CFG_2);
@@ -686,7 +681,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	init_completion(&emc->clk_handshake_complete);
 	emc->clk_nb.notifier_call = tegra_emc_clk_change_notify;
 	emc->dev = &pdev->dev;
 
-- 
2.25.1


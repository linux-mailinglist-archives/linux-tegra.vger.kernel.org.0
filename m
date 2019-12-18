Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBC81250FA
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 19:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfLRSu1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 13:50:27 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37744 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbfLRSu1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 13:50:27 -0500
Received: by mail-lf1-f65.google.com with SMTP id b15so2461367lfc.4
        for <linux-tegra@vger.kernel.org>; Wed, 18 Dec 2019 10:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sK69x+mjyLJfEmVl8rvfjVFB6xDLLTT6IM7wdNpwgVI=;
        b=qllfG41W6LcztT+XVeMltD4of4z9ZWz0SBDCAtqHwvvUUM3B1M9oSaFsH6uj4RIsAX
         wcDi5t5MbGMONLiQYzAvxDN9Dg94bmyCvBheWwcUf1xvWsCErzOfIEDvE0VjddDhXO4+
         2eAzlRxaUszLfB2SJTOVd6jcliK/weenRrZGZZubx/IesGlii2NKfLXxICc2VJ+0lhqN
         XnUYu9D6Q80ANfcNyblLOdGHbD5ipf66YcRQmDPFMwrovabFQtJIWuZXejll7SXiAPH5
         cit+xwUU8ygzwSltqiBwl9ypp3heJuE21XHkundc+d84Sa3UL7KWDScLOb7weBEqM1d1
         IrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sK69x+mjyLJfEmVl8rvfjVFB6xDLLTT6IM7wdNpwgVI=;
        b=olhVI4bdOOpX4fH1j/J13qUJXCt709zF54rEBxZL4h0LTeKLsQ+Yi5B7b47ZSKXqb/
         lsUAcMROFSTLc4z1UWS9xvDs/lU36bDvCFrTVDOPFh589kMJiENR5gYm4NujlKtGKBio
         KNmziJjf47isQx38sFoX/uiabrgKxEpQ8YfvtPjwptekcXEOqgHMWpPyYibJ+W0uL3Wu
         L2HfhMxKi8yON1/IxW6Ji8zd361yi6PQ8qiXCTJmoSffowWxknpTpTq69d09FBW6vA7B
         G+7wQVPqjwOQFyLZC+3oENTgxRgVxc2VeM41geILBcShKramJhbO8HxjW12EW7MTr/s3
         uwrQ==
X-Gm-Message-State: APjAAAXmwfIEpytOkNQWBIHu4b7m89R5OO6bm5MyVFTyYmo6iagH87uF
        fxSjDrV07Vd5pFQhl4VyTTx2u5hI
X-Google-Smtp-Source: APXvYqziIuUTAnLoyxgBEzdeppZ0qolqZWsil9Fx+668YMkdlZjJd8lQjFYxBF0P/IPQzZVS7VEAHg==
X-Received: by 2002:a19:f519:: with SMTP id j25mr2756116lfb.41.1576695025589;
        Wed, 18 Dec 2019 10:50:25 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id y7sm1592586ljn.31.2019.12.18.10.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 10:50:25 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/3] memory: tegra30-emc: Firm up suspend/resume sequence
Date:   Wed, 18 Dec 2019 21:50:00 +0300
Message-Id: <20191218185002.26970-2-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191218185002.26970-1-digetx@gmail.com>
References: <20191218185002.26970-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The current code doesn't prevent race conditions of suspend/resume vs CCF.
Let's take exclusive control over the EMC clock during suspend in a way
that is free from race conditions.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra30-emc.c | 38 ++++++++++++++++--------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 0b6a5e451ea3..8e156726b2de 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -345,7 +345,6 @@ struct tegra_emc {
 	bool vref_cal_toggle : 1;
 	bool zcal_long : 1;
 	bool dll_on : 1;
-	bool prepared : 1;
 	bool bad_state : 1;
 };
 
@@ -751,9 +750,6 @@ static int emc_prepare_timing_change(struct tegra_emc *emc, unsigned long rate)
 	/* interrupt can be re-enabled now */
 	enable_irq(emc->irq);
 
-	emc->bad_state = false;
-	emc->prepared = true;
-
 	return 0;
 }
 
@@ -762,13 +758,12 @@ static int emc_complete_timing_change(struct tegra_emc *emc,
 {
 	struct emc_timing *timing = emc_find_timing(emc, rate);
 	unsigned long timeout;
-	int ret;
+	int err;
 
 	timeout = wait_for_completion_timeout(&emc->clk_handshake_complete,
 					      msecs_to_jiffies(100));
 	if (timeout == 0) {
 		dev_err(emc->dev, "emc-car handshake failed\n");
-		emc->bad_state = true;
 		return -EIO;
 	}
 
@@ -790,22 +785,23 @@ static int emc_complete_timing_change(struct tegra_emc *emc,
 
 	udelay(2);
 	/* update restored timing */
-	ret = emc_seq_update_timing(emc);
-	if (ret)
-		emc->bad_state = true;
+	err = emc_seq_update_timing(emc);
 
 	/* restore early ACK */
 	mc_writel(emc->mc, emc->mc_override, MC_EMEM_ARB_OVERRIDE);
 
-	emc->prepared = false;
+	if (err)
+		return err;
+
+	emc->bad_state = false;
 
-	return ret;
+	return 0;
 }
 
 static int emc_unprepare_timing_change(struct tegra_emc *emc,
 				       unsigned long rate)
 {
-	if (emc->prepared && !emc->bad_state) {
+	if (!emc->bad_state) {
 		/* shouldn't ever happen in practice */
 		dev_err(emc->dev, "timing configuration can't be reverted\n");
 		emc->bad_state = true;
@@ -1181,13 +1177,17 @@ static int tegra_emc_probe(struct platform_device *pdev)
 static int tegra_emc_suspend(struct device *dev)
 {
 	struct tegra_emc *emc = dev_get_drvdata(dev);
+	int err;
+
+	/* take exclusive control over the clock's rate */
+	err = clk_rate_exclusive_get(emc->clk);
+	if (err) {
+		dev_err(emc->dev, "failed to acquire clk: %d\n", err);
+		return err;
+	}
 
-	/*
-	 * Suspending in a bad state will hang machine. The "prepared" var
-	 * shall be always false here unless it's a kernel bug that caused
-	 * suspending in a wrong order.
-	 */
-	if (WARN_ON(emc->prepared) || emc->bad_state)
+	/* suspending in a bad state will hang machine */
+	if (WARN(emc->bad_state, "hardware in a bad state\n"))
 		return -EINVAL;
 
 	emc->bad_state = true;
@@ -1202,6 +1202,8 @@ static int tegra_emc_resume(struct device *dev)
 	emc_setup_hw(emc);
 	emc->bad_state = false;
 
+	clk_rate_exclusive_put(emc->clk);
+
 	return 0;
 }
 
-- 
2.24.0


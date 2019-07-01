Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A942129CE7
	for <lists+linux-tegra@lfdr.de>; Fri, 24 May 2019 19:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391556AbfEXRYv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 24 May 2019 13:24:51 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39197 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731904AbfEXRYV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 May 2019 13:24:21 -0400
Received: by mail-lf1-f66.google.com with SMTP id f1so7698802lfl.6;
        Fri, 24 May 2019 10:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OWh1wiHvRHVP3qz/fveyH6ZbO/JhShKh5hwJSBHcwjM=;
        b=uwrUIUdmIzK+lKLESjBorCbXW2k06HXqsJntBThiKDQmDyrIfCE5mZ3wFaXOQsinBT
         2Pdnb3NFEW7blcYK3kGS15eLTwi6XWaFIc8fSxohCjDSRzMZOOk9XqFiL27pkPpxkiFH
         9rXuH7WuK3nRRiRZlyPiYpxBJbvKbHaWyRN8vsFuT6iIwvpL+3d9MZD2MEKwtuije1JT
         arvIeuM05fGJZ+jXFyA6wymu5eGlAxcPlLQ5jCi0EdUYSuyP2GooidpZ1wpukcII+fyv
         F/f3fsAzUNRSLzNCnbCeFiRLIE6InV+t8rSqlRZDBHJVUJrlhqS66eBTddc/Ou+Fy5uh
         HQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OWh1wiHvRHVP3qz/fveyH6ZbO/JhShKh5hwJSBHcwjM=;
        b=PbRFnkMNiI0j6CEXpawYPw757cMbmjNs1P8ip3kYeMHp26zGQQqg0bHXrohd6q8jdG
         gk5mcY51tyQb/lCD+V91y/P1dPyynyyVnw8EVQD8juNJMEMkJDHtdgPCY57XJAJavjF0
         HnRqkDhpqRvoZCCn4ScTndD+y60OnZkDo89NadJvW37mj1SlmxVQt7lVJR0O5RRm2X/P
         TpIMUuEaNqsrsAO/YRaW7o76vPjk2CtnOLIbCD1broE44o08ap9KiLpCj6Y8RQagl3+0
         U8RKlUnnEFwYKOx1WdVTBXn2c2qBfGmWAoIKoEQMmDzfdQUz4Tezh9B6qH16KPmxNkTs
         B+EA==
X-Gm-Message-State: APjAAAVJ/oMxq8loXfRH+a0bl7tC4kzb6bj2V8yMdAcuPceJSYMkX3Mj
        wG1XvxfuI8aDQOZ0pX0F4gU=
X-Google-Smtp-Source: APXvYqwAQk33x1PA9f5T8//SWNrff69nvwCx6jJx8N194e3T6qMVAmeXVhimkFIh8XDsBJg3ilNKpA==
X-Received: by 2002:a19:48c3:: with SMTP id v186mr553868lfa.42.1558718658828;
        Fri, 24 May 2019 10:24:18 -0700 (PDT)
Received: from localhost.localdomain ([94.29.35.141])
        by smtp.gmail.com with ESMTPSA id d13sm196957lfm.27.2019.05.24.10.24.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 10:24:17 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/8] memory: tegra20-emc: Drop setting EMC rate to max on probe
Date:   Fri, 24 May 2019 20:23:47 +0300
Message-Id: <20190524172353.29087-3-digetx@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190524172353.29087-1-digetx@gmail.com>
References: <20190524172353.29087-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The memory frequency scaling will be managed by tegra20-devfreq driver
and PM QoS once all the prerequisite patches will get upstreamed.
The parent clock is now managed by the clock driver and we also should
assume that PLLM rate can't be changed on some devices (Galaxy Tab 10.1
for example). Altogether there is no point in touching of clock's rate
from the EMC driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 45 ------------------------------
 1 file changed, 45 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 9ee5bef49e47..55ac3863a354 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -424,41 +424,6 @@ static int emc_setup_hw(struct tegra_emc *emc)
 	return 0;
 }
 
-static int emc_init(struct tegra_emc *emc, unsigned long rate)
-{
-	int err;
-
-	err = clk_set_parent(emc->emc_mux, emc->backup_clk);
-	if (err) {
-		dev_err(emc->dev,
-			"failed to reparent to backup source: %d\n", err);
-		return err;
-	}
-
-	err = clk_set_rate(emc->pll_m, rate);
-	if (err) {
-		dev_err(emc->dev,
-			"failed to change pll_m rate: %d\n", err);
-		return err;
-	}
-
-	err = clk_set_parent(emc->emc_mux, emc->pll_m);
-	if (err) {
-		dev_err(emc->dev,
-			"failed to reparent to pll_m: %d\n", err);
-		return err;
-	}
-
-	err = clk_set_rate(emc->clk, rate);
-	if (err) {
-		dev_err(emc->dev,
-			"failed to change emc rate: %d\n", err);
-		return err;
-	}
-
-	return 0;
-}
-
 static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
@@ -550,18 +515,8 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		goto put_backup;
 	}
 
-	/* set DRAM clock rate to maximum */
-	err = emc_init(emc, emc->timings[emc->num_timings - 1].rate);
-	if (err) {
-		dev_err(&pdev->dev, "failed to initialize EMC clock rate: %d\n",
-			err);
-		goto unreg_notifier;
-	}
-
 	return 0;
 
-unreg_notifier:
-	clk_notifier_unregister(emc->clk, &emc->clk_nb);
 put_backup:
 	clk_put(emc->backup_clk);
 put_pll_m:
-- 
2.21.0


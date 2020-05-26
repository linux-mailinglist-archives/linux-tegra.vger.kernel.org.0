Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA5431C7AF1
	for <lists+linux-tegra@lfdr.de>; Wed,  6 May 2020 22:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgEFUJM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 6 May 2020 16:09:12 -0400
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:21645 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728062AbgEFUJM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 May 2020 16:09:12 -0400
Received: from localhost.localdomain ([93.23.14.107])
        by mwinf5d60 with ME
        id bY992200F2JbCfx03Y99bF; Wed, 06 May 2020 22:09:10 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 06 May 2020 22:09:10 +0200
X-ME-IP: 93.23.14.107
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] memory: tegra: Fix an error handling path in 'tegra186_emc_probe()'
Date:   Wed,  6 May 2020 22:09:07 +0200
Message-Id: <20200506200907.195502-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The call to 'tegra_bpmp_get()' must be balanced by a call to
'tegra_bpmp_put()' in case of error, as already done in the remove
function.

Add an error handling path and corresponding goto.

Fixes: 52d15dd23f0b ("memory: tegra: Support DVFS on Tegra186 and later")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/memory/tegra/tegra186-emc.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index 97f26bc77ad4..7b35bf6450f3 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -185,7 +185,7 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 	if (IS_ERR(emc->clk)) {
 		err = PTR_ERR(emc->clk);
 		dev_err(&pdev->dev, "failed to get EMC clock: %d\n", err);
-		return err;
+		goto err_put_bpmp;
 	}
 
 	platform_set_drvdata(pdev, emc);
@@ -201,7 +201,7 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 	err = tegra_bpmp_transfer(emc->bpmp, &msg);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to EMC DVFS pairs: %d\n", err);
-		return err;
+		goto err_put_bpmp;
 	}
 
 	emc->debugfs.min_rate = ULONG_MAX;
@@ -211,8 +211,10 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 
 	emc->dvfs = devm_kmalloc_array(&pdev->dev, emc->num_dvfs,
 				       sizeof(*emc->dvfs), GFP_KERNEL);
-	if (!emc->dvfs)
-		return -ENOMEM;
+	if (!emc->dvfs) {
+		err = -ENOMEM;
+		goto err_put_bpmp;
+	}
 
 	dev_dbg(&pdev->dev, "%u DVFS pairs:\n", emc->num_dvfs);
 
@@ -237,7 +239,7 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 			"failed to set rate range [%lu-%lu] for %pC\n",
 			emc->debugfs.min_rate, emc->debugfs.max_rate,
 			emc->clk);
-		return err;
+		goto err_put_bpmp;
 	}
 
 	emc->debugfs.root = debugfs_create_dir("emc", NULL);
@@ -254,6 +256,10 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 			    emc, &tegra186_emc_debug_max_rate_fops);
 
 	return 0;
+
+err_put_bpmp:
+	tegra_bpmp_put(emc->bpmp);
+	return err;
 }
 
 static int tegra186_emc_remove(struct platform_device *pdev)
-- 
2.25.1


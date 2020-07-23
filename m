Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0DD022B26F
	for <lists+linux-tegra@lfdr.de>; Thu, 23 Jul 2020 17:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729583AbgGWPW4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 23 Jul 2020 11:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728711AbgGWPW4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Jul 2020 11:22:56 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DC5C0619DC
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jul 2020 08:22:56 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id l6so2698843plt.7
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jul 2020 08:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aHzoQJgUGIpE9BjMSQwyAvES0B7tP6s7ctsl+J7U1QE=;
        b=rBxzxaCXIxtCvDsgE9c/RvUvBSHqQTwRAv0vgnMVLkwGyKVDuYgerm8XTzK46Z7GvW
         OP6B+KrOS0NqEn8E7gkMZG36gefHmleOUbfbD406kGUCbCrsF9BDYYfFMXQQ9BSgOkTW
         36vvlTI17ZC1CBi+/LpUpOU1crzX89A6b5AgtNmKMvucKZl5PP8eTlAvBFRVBLs3BrcM
         tEuJXg1zdlE+KTGwQwoimEo+47NLPuYzTGTYVsexvCUZJ1shjKoQL/zTpqT0raGU5HJc
         72ap5F2vvHuN02VaosshlFp2B5T16Rvn41FVkXRb73P+4B8SpKrj3PHmP3maFYYFRVvY
         b0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aHzoQJgUGIpE9BjMSQwyAvES0B7tP6s7ctsl+J7U1QE=;
        b=I5Zrt0Afes4Hi/H539PMS/wUThy4635yU0x4yWmaQpzSY7vaLVWydgLa9ZE2hZPxTL
         wohOZh+ZS/HgrvLlyn2bNuKfNmBZ/fPfMO89AX7nNwuPCozQIcT/PPmmW9e1UsLz/xS/
         s2iioB99gEvwNyazO9TrcnqLpXjtoSbdcjVTVT8wytHschbKcX3MwSKPyujEdxpb4PrF
         kCzWW7JpdMxB3P5aUCsJqYzcZJtrkFuoRuAnVpARn3v6bL8k3U/mT1dxbudTJxFySiUB
         1zlWAAl9b3muNq5h2yCwxoW6nCM52dmFlRQCkTd4fwpDY1Tf+fFic6TsXQn+jAMZWaqS
         C6iQ==
X-Gm-Message-State: AOAM530JLGFGMOHJXbl6cWi7icG78VrVns82unepjCbd+VyCwn53RHNi
        xrMYDrBhPrhIM0FF1Us5wIc=
X-Google-Smtp-Source: ABdhPJzxBOxzuT57VJ9D5Xax9m5kHRDBwoUV4ADGiy1GtEfFPiBcC57hYFE3p7ZjTv1YE+bFEuj7YQ==
X-Received: by 2002:a17:90a:6d96:: with SMTP id a22mr855185pjk.26.1595517775677;
        Thu, 23 Jul 2020 08:22:55 -0700 (PDT)
Received: from localhost.localdomain ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id y7sm3235459pgk.93.2020.07.23.08.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 08:22:54 -0700 (PDT)
From:   Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
To:     marvin24@gmx.de, gregkh@linuxfoundation.org, p.zabel@pengutronix.de
Cc:     Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>,
        ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH] change slave occurence to secondary everywhere
Date:   Thu, 23 Jul 2020 20:45:13 +0530
Message-Id: <20200723151511.22193-1-bharadwaj.rohit8@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

changed usage of slave (deprecated) to secondary

Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
---
 drivers/staging/nvec/nvec.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 360ec0407740..5d7b66719a39 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -718,7 +718,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static void tegra_init_i2c_slave(struct nvec_chip *nvec)
+static void tegra_init_i2c_secondary(struct nvec_chip *nvec)
 {
 	u32 val;
 
@@ -744,7 +744,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *nvec)
 }
 
 #ifdef CONFIG_PM_SLEEP
-static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
+static void nvec_disable_i2c_secondary(struct nvec_chip *nvec)
 {
 	disable_irq(nvec->irq);
 	writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
@@ -784,7 +784,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nvec);
 	nvec->dev = dev;
 
-	if (of_property_read_u32(dev->of_node, "slave-addr", &nvec->i2c_addr)) {
+	if (of_property_read_u32(dev->of_node, "secondary-addr", &nvec->i2c_addr)) {
 		dev_err(dev, "no i2c address specified");
 		return -ENODEV;
 	}
@@ -839,7 +839,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 	}
 	disable_irq(nvec->irq);
 
-	tegra_init_i2c_slave(nvec);
+	tegra_init_i2c_secondary(nvec);
 
 	/* enable event reporting */
 	nvec_toggle_global_events(nvec, true);
@@ -913,7 +913,7 @@ static int nvec_suspend(struct device *dev)
 	if (!err)
 		nvec_msg_free(nvec, msg);
 
-	nvec_disable_i2c_slave(nvec);
+	nvec_disable_i2c_secondary(nvec);
 
 	return 0;
 }
@@ -923,7 +923,7 @@ static int nvec_resume(struct device *dev)
 	struct nvec_chip *nvec = dev_get_drvdata(dev);
 
 	dev_dbg(nvec->dev, "resuming\n");
-	tegra_init_i2c_slave(nvec);
+	tegra_init_i2c_secondary(nvec);
 	nvec_toggle_global_events(nvec, true);
 
 	return 0;
-- 
2.25.1


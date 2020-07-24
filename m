Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E10B22BD32
	for <lists+linux-tegra@lfdr.de>; Fri, 24 Jul 2020 06:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbgGXExl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 24 Jul 2020 00:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgGXExl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jul 2020 00:53:41 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C32A8C0619D3
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jul 2020 21:53:40 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k1so4587908pjt.5
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jul 2020 21:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vnj+Uyzmp5pb8duKT3JolAPWjR+RTE2Sq0gDvI4I3R4=;
        b=S+/nB7qPHjGGl3R0LyoEDW/tXSrt0DHvXw0pqQbPP44dsgWFYvi85NG/XcWtLQ7vi+
         Gv6MIWaYF9iZnkkceFDuZrZid5BddGQR1fcPHq+CHQv7RqcLXOU9i94OMqyJIuQ9I6tg
         2y+9S5/alGRm0Mxu/KV2gqTM7Qu2Z5booGgNWuwZ+H2jy3/uHU1H5SyjJUeuY6sqKMU/
         PrKvh4ggB/p9UDzZ55ICE8Ij19BdZAE/iNm7NokxQ60Rh3sS5KIlG3hgXX5zjPpkr6tt
         uyUk6ICskG/YcHJEL9IPcXtyA0Ykz3pO/fBzxhlYLEhuMq21iUvxaYVSr4sRzL7wCkr5
         46NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vnj+Uyzmp5pb8duKT3JolAPWjR+RTE2Sq0gDvI4I3R4=;
        b=hWKGn6ixHokpGa2tb9TRczLjpQrqUwhG/iKxSNqI8RZ3p6/losgocEuxGl5sqQuokZ
         jMS3yX8VQWTVkse3oJm7DcIR3biRI3CE085L2QAq/s8KaJD9z37PFsznPalz5HnFb4Av
         wibF/26i1dU7fovahFVbreylDvdGjPatu0/e8yqflxVmg6aZ+r72YNJEj4f8C2BzPtZ5
         M7MgDaHBewzjKwdRsRcqKPI0+9iKWzZVIQrAP6OfxIraxzrlWWhRTMk3SCm2IQkLeW3g
         Pqti3dyUFtoxrlKX4Bhf+DLcwBtjPt86Q21b2y2iMcefS1ixZQg62cGwRGGzPAmkUyFh
         FMxQ==
X-Gm-Message-State: AOAM530I7i9T6S8S9eiwkJAZd6sUgT9G5Iif7n+3w9ul+HJni0fYdKXp
        UoHO70u9ctSVXJT/8JfmxDk=
X-Google-Smtp-Source: ABdhPJxw4KWNM6SrQL+hQsCgdhiMj+swhykj3eF7zpmRkE1N69AOBCIABxr04v8JygQSl1zrhHnxEA==
X-Received: by 2002:a17:90b:243:: with SMTP id fz3mr3635592pjb.17.1595566420134;
        Thu, 23 Jul 2020 21:53:40 -0700 (PDT)
Received: from localhost.localdomain ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id i125sm4950343pgd.21.2020.07.23.21.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 21:53:39 -0700 (PDT)
From:   Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
To:     marvin24@gmx.de, gregkh@linuxfoundation.org, p.zabel@pengutronix.de
Cc:     Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>,
        ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH v3] staging: nvec: change usage of slave to secondary
Date:   Fri, 24 Jul 2020 10:06:34 +0530
Message-Id: <20200724043633.7755-1-bharadwaj.rohit8@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200723151511.22193-1-bharadwaj.rohit8@gmail.com>
References: <20200723151511.22193-1-bharadwaj.rohit8@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

changed usage of slave (deprecated) to secondary

Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
---
v3: change patch subject, add version history
v2: add changelog text in body of mail
v1: fix style issues by changing usage of slave to secondary

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


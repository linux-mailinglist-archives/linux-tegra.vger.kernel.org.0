Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C605622B201
	for <lists+linux-tegra@lfdr.de>; Thu, 23 Jul 2020 16:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728853AbgGWO7H (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 23 Jul 2020 10:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728577AbgGWO7G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Jul 2020 10:59:06 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D908C0619DC
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jul 2020 07:59:06 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id f16so3190591pjt.0
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jul 2020 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TYn+YXXcyOqmWgDocw8+U+2dd8XHQMqRU/5NyZcvlOE=;
        b=VGAFYwsKTuqWCzSgLnpJdzSmbzdNGsyPXc0Ekr6eo1fIbIs9jpeqtJANPQhuaitz+D
         v3hPP8KPqntkL8itftORDWK1pRn5z3h8PI10+ZHzRvPSwz26ziJI+qtD57A/BhtsYjHy
         20a2i7jEBepleWsAMIotS6L/Nj02zgf3c74wTdi9BtSKmfNjsyaK9Qy9QDTtbcmbBuS+
         mXu1HBgu6b5Ynfh+XguFTc8XO+4IpHR6K5RGE/71hC5V1Q4BWYaAm8P50GWd9qtW3w+p
         zqECxDnyGsHhKYzkYKZgXVhFH6UVov/zYOhvoh9vdaIQeBdf4Li1TQ51AyBAWUQchyWS
         DIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TYn+YXXcyOqmWgDocw8+U+2dd8XHQMqRU/5NyZcvlOE=;
        b=IryAo4Mz0P4JbcVtBL3iOKb/DDiK/q1llImBk40L8goQMsX4j1k2ymwQVxXLaHEFcX
         HThJFUbj3lradAB9/ju4IRmncqzSCkNEAGrPkpPrwstyHRq/GP/5C687YBuCN50722uj
         lxQuOWwWJvGn5IeJIVZ6NW7DX3OR8F7izotNzdSgVqHXM4SDeiWqQTQ6mRlQGzaDz9Xf
         DV+B5YM89YXIRz+DtXwaV5ngCgeE3W2WDhWU+cvYrWeVBWAY8CPuqLLAgIjzCi6WwLkG
         JqZAPEBMRY97iuM+zB1Uq5jyiIYpEMlW+A7BelibtO3kR5XC9Q749ND19JgSdXwpk4+e
         g83Q==
X-Gm-Message-State: AOAM532Jz5jRIXeAcznTpOuFfCESgfHnqMpu5iO6SmNA2EEi24imhjto
        jKhmb1ig4+xAGhE0HW1IS6Y=
X-Google-Smtp-Source: ABdhPJxfCJyP9hYdnyR8Fig8OPGtGM8KyUUBvOD4O4UZ3PDS3IfCtKDp74b8QDzWy6kBrfzhWfskRQ==
X-Received: by 2002:a17:90a:cf01:: with SMTP id h1mr782426pju.234.1595516346008;
        Thu, 23 Jul 2020 07:59:06 -0700 (PDT)
Received: from localhost.localdomain ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id s68sm3193256pjb.38.2020.07.23.07.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 07:59:05 -0700 (PDT)
From:   Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
To:     marvin24@gmx.de, gregkh@linuxfoundation.org, p.zabel@pengutronix.de
Cc:     Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>,
        ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH] change slave occurence to secondary everywhere
Date:   Thu, 23 Jul 2020 20:28:11 +0530
Message-Id: <20200723145811.21109-1-bharadwaj.rohit8@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

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


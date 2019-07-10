Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0A1461813
	for <lists+linux-tegra@lfdr.de>; Mon,  8 Jul 2019 00:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727920AbfGGWfI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 7 Jul 2019 18:35:08 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:42176 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbfGGWfI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 7 Jul 2019 18:35:08 -0400
Received: by mail-qk1-f195.google.com with SMTP id 201so9736335qkm.9;
        Sun, 07 Jul 2019 15:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=12VJs13OPjF9DGDUp85PAmf8xnTp6sUbGcgLhNyWjKk=;
        b=H4tohP6G1QNw/WjZ9idhiG2O2oPpbuKQvEZZ3eZ7e0vG1bkcD9FoFavETEys4Ph/z4
         ppKiZJfsIepTR+O1dF3KFDFgbLBN4AGEipOmA0RQQXbUU0wwG7/OH1t8tRXaHqb8Cgsi
         HNLJ8nw9I6yKXwg9JptVEko1P1KvbThdV84ur3CO1P4vXhGXu2MdzyJechX8vaoxkQqL
         Pn+Vmiq8+quIb4ARQZke1nif5vxePivaQLMRCddfAzTbHV0i1yrga426jIXx/xTFZjX3
         sd9iYL5gUCJAGgOcnZ8ugLsh4mgGuGWntiWGQ8hLinuu3cfSknLqaZEVRjmRDJjLA9KA
         QTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=12VJs13OPjF9DGDUp85PAmf8xnTp6sUbGcgLhNyWjKk=;
        b=lU9eiX6QkgZbIw6sxYXfKie6w7M0/2ALCP1qwFYIbDzkhFlXjsI7KqwtB8+3D+u9li
         jeALYKfVRoGXoxIw9laRKtJTiTXqWfoFrWUh8/mR20u+D1z8mcXyMpRxpy6DQaPJSk1m
         wL/CLhduu0KlgXDHIQGACwRx6qxEa/lu7D51UzFaqeqc3mHRxl9DEinPTVs7WVBX0Pru
         YiSUzEe5p6NPpAnxWsGTRg2RkKRkPgKouAZ60LR4W1dX4iF5rEL9sFuIZzGmZJrQMbdN
         mAHM4EoQNKbGMUKdckWDxNnMQVY7ePhSFC2vPS7j1iXZSxvWPJNA8WF/5uMNQzYRE1aN
         7Ehg==
X-Gm-Message-State: APjAAAV0WwaeoXpk+yzmWdlsHsHQ2l34hjsRxo8vnBOM6GeIDeJGOMax
        vmc14DaJJYf4ChLjCrGu2u0=
X-Google-Smtp-Source: APXvYqw6eMmwwP/w/3GxGhcKKtV81ByIY9T4odzqpLaNWtvEw/XiUogLnfiUkIR4nu9rGZCozQZ1uw==
X-Received: by 2002:a37:a892:: with SMTP id r140mr11241188qke.435.1562538906999;
        Sun, 07 Jul 2019 15:35:06 -0700 (PDT)
Received: from localhost.localdomain (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.gmail.com with ESMTPSA id p4sm6998453qkb.84.2019.07.07.15.35.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Jul 2019 15:35:06 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/24] PM / devfreq: tegra30: Keep interrupt disabled while governor is stopped
Date:   Mon,  8 Jul 2019 01:32:41 +0300
Message-Id: <20190707223303.6755-3-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190707223303.6755-1-digetx@gmail.com>
References: <20190707223303.6755-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There is no real need to keep interrupt always-enabled, will be nicer
to keep it disabled while governor is inactive.

Suggested-by: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 43 ++++++++++++++++---------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index a27300f40b0b..5e2b133babdd 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -11,6 +11,7 @@
 #include <linux/devfreq.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
@@ -416,8 +417,6 @@ static void tegra_actmon_start(struct tegra_devfreq *tegra)
 {
 	unsigned int i;
 
-	disable_irq(tegra->irq);
-
 	actmon_writel(tegra, ACTMON_SAMPLING_PERIOD - 1,
 		      ACTMON_GLB_PERIOD_CTRL);
 
@@ -442,8 +441,6 @@ static void tegra_actmon_stop(struct tegra_devfreq *tegra)
 	}
 
 	actmon_write_barrier(tegra);
-
-	enable_irq(tegra->irq);
 }
 
 static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
@@ -552,6 +549,12 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
 {
 	struct tegra_devfreq *tegra = dev_get_drvdata(devfreq->dev.parent);
 
+	/*
+	 * Couple device with the governor early as it is needed at
+	 * the moment of governor's start (used by ISR).
+	 */
+	tegra->devfreq = devfreq;
+
 	switch (event) {
 	case DEVFREQ_GOV_START:
 		devfreq_monitor_start(devfreq);
@@ -586,10 +589,11 @@ static struct devfreq_governor tegra_devfreq_governor = {
 
 static int tegra_devfreq_probe(struct platform_device *pdev)
 {
-	struct tegra_devfreq *tegra;
 	struct tegra_devfreq_device *dev;
-	unsigned int i;
+	struct tegra_devfreq *tegra;
+	struct devfreq *devfreq;
 	unsigned long rate;
+	unsigned int i;
 	int err;
 
 	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
@@ -625,6 +629,16 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	}
 	tegra->irq = err;
 
+	irq_set_status_flags(tegra->irq, IRQ_NOAUTOEN);
+
+	err = devm_request_threaded_irq(&pdev->dev, tegra->irq, NULL,
+					actmon_thread_isr, IRQF_ONESHOT,
+					"tegra-devfreq", tegra);
+	if (err) {
+		dev_err(&pdev->dev, "Interrupt request failed: %d\n", err);
+		return err;
+	}
+
 	reset_control_assert(tegra->reset);
 
 	err = clk_prepare_enable(tegra->clock);
@@ -672,28 +686,15 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	}
 
 	tegra_devfreq_profile.initial_freq = clk_get_rate(tegra->emc_clock);
-	tegra->devfreq = devfreq_add_device(&pdev->dev,
-					    &tegra_devfreq_profile,
-					    "tegra_actmon",
-					    NULL);
+	devfreq = devfreq_add_device(&pdev->dev, &tegra_devfreq_profile,
+				     "tegra_actmon", NULL);
 	if (IS_ERR(tegra->devfreq)) {
 		err = PTR_ERR(tegra->devfreq);
 		goto remove_governor;
 	}
 
-	err = devm_request_threaded_irq(&pdev->dev, tegra->irq, NULL,
-					actmon_thread_isr, IRQF_ONESHOT,
-					"tegra-devfreq", tegra);
-	if (err) {
-		dev_err(&pdev->dev, "Interrupt request failed: %d\n", err);
-		goto remove_devfreq;
-	}
-
 	return 0;
 
-remove_devfreq:
-	devfreq_remove_device(tegra->devfreq);
-
 remove_governor:
 	devfreq_remove_governor(&tegra_devfreq_governor);
 
-- 
2.22.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEC5F6A57F1
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Feb 2023 12:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231698AbjB1LYm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 28 Feb 2023 06:24:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbjB1LYU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Feb 2023 06:24:20 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E0E91DBA4
        for <linux-tegra@vger.kernel.org>; Tue, 28 Feb 2023 03:23:46 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so9241476wmb.3
        for <linux-tegra@vger.kernel.org>; Tue, 28 Feb 2023 03:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677583419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyXE7dTHWFCFp1MXqwgdHIOsHgvb6Bb+CE7d2W8RwzE=;
        b=uH2iPKUi6WWzxncaaUCnNyUW93Te0pgpw5ZVwQslHbwqJ/8zYBAPRAyVU+rCYo49m+
         vwJfjfzWSyZFyui3qDxrhI6YZtsgewelZDRzhfB/mrkRCN33zgfKv49GvwquHmeUuRCJ
         oywdKx2uiIdUmj6sohlH44EaXz6vKSFcPMgMQWRsWywfb8pKDToojlf05J6f+h16x1G9
         6JZmgpLt5MkCIA68wsyWP+Oih9p+S27qOp9iIlRrA60IyxEzrB+RELqvhxCepoQtMy0W
         NDrdjdjoNPFlb3HS28boS3f6ksSeOu9s71kaooPyFE9PLqd2Vp6C26legnHfZg+ghuaL
         t6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677583419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyXE7dTHWFCFp1MXqwgdHIOsHgvb6Bb+CE7d2W8RwzE=;
        b=WoMBc3otovYCoCnmAdabc1VTZ9j+AAbnoBePjdGH8NQ2sJMnTY91dSSfBrewjm20xA
         38Y9qm9SIks1T0YFgzxE2CtN5/7LD6vd8MWyDZRk1idcr4tFEcUJkMiYDUPbRD6UEWkI
         oPFJTcQmHbR1ySge9hTr82vvmk5eCHgrP534aAkgV+yFKU8iDxSb16fgCc9vuzd5s+FR
         pTVxp8E1vrxFl76dHRxq25QcV7u1nFoHAGgZS6UeTAFxfHWWPWYl5+U8RkLs6wYqu0Kv
         LA4EWr+q91giiNGLY8rweK9M/3+nrOR4unBqrN+jOUS1nhvVVqYTAS/26FKPCPCsnrRp
         SQiA==
X-Gm-Message-State: AO0yUKXpEhbepEKhnevpjTdIW832xOYnkkrqMXrqytQ+ALxqAV4moWVs
        mupcrchw/n8JFUNYAUhbx0kqD9H3Andcgu8Um7LbUw==
X-Google-Smtp-Source: AK7set9RLPg5gGhgg4oy8eyNZ9EGMeNMZaT9OVQhZsjqQK3DbpN6bFo/NPG0kIOxAREuU3IMB0IrwA==
X-Received: by 2002:a05:600c:4586:b0:3eb:376e:2ba5 with SMTP id r6-20020a05600c458600b003eb376e2ba5mr1823393wmo.3.1677583419590;
        Tue, 28 Feb 2023 03:23:39 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:6830:6390:2815:b6a5])
        by smtp.gmail.com with ESMTPSA id z5-20020a5d6545000000b002c5501a5803sm9598130wrv.65.2023.02.28.03.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 03:23:39 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     rafael@kernel.org, daniel.lezcano@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Subject: [PATCH v4 16/19] thermal/drivers/tegra: Remove unneeded lock when setting a trip point
Date:   Tue, 28 Feb 2023 12:22:35 +0100
Message-Id: <20230228112238.2312273-17-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228112238.2312273-1-daniel.lezcano@linaro.org>
References: <20230228112238.2312273-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The function tegra_tsensor_enable_hw_channel() takes the thermal zone
lock to prevent "a potential" race with a call to set_trips()
callback.

The driver must not play with the thermal framework core code
internals.

The tegra_tsensor_enable_hw_channel() is called by:

 - the suspend / resume callbacks
 - the probe function after the thermal zones are registered

The thermal zone lock taken in this function is supposed to protect
from a call to the set_trips() callback which writes in the same
register.

The potential race is when suspend / resume are called at the same
time as set_trips. This one is called only in
thermal_zone_device_update().

 - At suspend time, the 'in_suspend' is set, thus the
   thermal_zone_device_update() bails out immediately and set_trips is
   not called during this moment.

 - At resume time, the thermal zone is updated at PM_POST_SUSPEND,
   thus the driver has already set the TH2 temperature.

 - At probe time, we register the thermal zone and then we set the
   TH2. The only scenario I can see so far is the interrupt fires, the
   thermal_zone_update() is called exactly at the moment
   tegra_tsensor_enable_hw_channel() a few lines after registering it.

Disable the interrupt before setting up the hw channels and then
enable it. We close the potential race window without using the
thermal zone's lock.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/tegra/tegra30-tsensor.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/tegra/tegra30-tsensor.c b/drivers/thermal/tegra/tegra30-tsensor.c
index 4b2ea17910cd..3506c3f3c474 100644
--- a/drivers/thermal/tegra/tegra30-tsensor.c
+++ b/drivers/thermal/tegra/tegra30-tsensor.c
@@ -359,9 +359,6 @@ static int tegra_tsensor_enable_hw_channel(const struct tegra_tsensor *ts,
 
 	tegra_tsensor_get_hw_channel_trips(tzd, &hot_trip, &crit_trip);
 
-	/* prevent potential racing with tegra_tsensor_set_trips() */
-	mutex_lock(&tzd->lock);
-
 	dev_info_once(ts->dev, "ch%u: PMC emergency shutdown trip set to %dC\n",
 		      id, DIV_ROUND_CLOSEST(crit_trip, 1000));
 
@@ -404,8 +401,6 @@ static int tegra_tsensor_enable_hw_channel(const struct tegra_tsensor *ts,
 	val |= FIELD_PREP(TSENSOR_SENSOR0_CONFIG0_INTR_THERMAL_RST_EN, 1);
 	writel_relaxed(val, tsc->regs + TSENSOR_SENSOR0_CONFIG0);
 
-	mutex_unlock(&tzd->lock);
-
 	err = thermal_zone_device_enable(tzd);
 	if (err) {
 		dev_err(ts->dev, "ch%u: failed to enable zone: %d\n", id, err);
@@ -592,12 +587,24 @@ static int tegra_tsensor_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, err,
 				     "failed to request interrupt\n");
 
+	/*
+	 * Disable the interrupt so set_trips() can not be called
+	 * while we are setting up the register
+	 * TSENSOR_SENSOR0_CONFIG1. With this we close a potential
+	 * race window where we are setting up the TH2 and the
+	 * temperature hits TH1 resulting to an update of the
+	 * TSENSOR_SENSOR0_CONFIG1 register in the ISR.
+	 */
+	disable_irq(irq);
+
 	for (i = 0; i < ARRAY_SIZE(ts->ch); i++) {
 		err = tegra_tsensor_enable_hw_channel(ts, i);
 		if (err)
 			return err;
 	}
 
+	enable_irq(irq);
+
 	return 0;
 }
 
-- 
2.34.1


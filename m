Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDE9E298420
	for <lists+linux-tegra@lfdr.de>; Sun, 25 Oct 2020 23:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1419486AbgJYWTk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 25 Oct 2020 18:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1419375AbgJYWSs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 25 Oct 2020 18:18:48 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2657C061755;
        Sun, 25 Oct 2020 15:18:47 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id h6so9405556lfj.3;
        Sun, 25 Oct 2020 15:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wCRnc5sl1MR5Wpdv1p2yGiH30cAgFbcAdvX4Ryr3kIw=;
        b=UrP1B9PxB8RVvyOsCbd9Jw0/5tzpVXf8h1h5w6wOWzamD94BGHvcW066J7jVqBOvH5
         IDugCwgXY8NvMVRYwcsLPMmHftdGNKn8Gu0KKUntAqQT/TLWdna/+t8HsCqRFrq/0hKN
         tHCrcTFq4O8uGpoe2KPKQWypWT/J40eQNtIb5K9dqy6AI6GIpruJlFcn8MkcVJ3Bl7VU
         WipN9cu81VlgjMOpWtTx4+uqGdu4eyPiJ3uBydMNHDskJLHzb+8ldlO14mg9cBKxO18I
         uTvKe1C+Wp0S8aATpzGdHWdaiPv6j5PlXwjsZ0bCuPGv/QY6oT7vg8US/oYtaCmUFOmD
         D81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wCRnc5sl1MR5Wpdv1p2yGiH30cAgFbcAdvX4Ryr3kIw=;
        b=HZtBTXmk/5AnQyNhSoWOweWkg2oTeOh/7vlJBF6rUq6SGavNBXTt+enacvLRzZIC3A
         F+l+mebbanIZBOqqzF1lVHHrnzap8HpnBOX+gnazD0NcKaSRj5GnXLcy82oWoy0NUPqZ
         R6+8I8+Bazf0wGtSCBm3lIX7KtLr7xJCaiBCJ0J4B1/2fasDbHLmVe2vYyGndjpKNHbR
         cSQ4GC/kC95EKa5IFzJeHMFYYsAn7jPT2ajdJwCJGb+tI3fVKQDkiV1rqtvVnq/Di343
         AcEEqTt5hYqtssoOYUP3vjywoGB69UYjVJBAlRthKJInfx8L3+UB0UgJaav7tY+B75N3
         wZzA==
X-Gm-Message-State: AOAM530nski6wfBVwY2dlfh/ZH4r36kcag3fBgDTvogS1uABaGv3ef0k
        Fo3qXvzBveKpL/tl4VYl/TY=
X-Google-Smtp-Source: ABdhPJwwoWilcOIZLzXTPaOkI3oT5zrvX8bjmkI1iqYZEULY/UjpBQ8IKRPbzwvcebcWiw0QUoSk6g==
X-Received: by 2002:a05:6512:3455:: with SMTP id j21mr4441541lfr.135.1603664326339;
        Sun, 25 Oct 2020 15:18:46 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 15:18:45 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Viresh Kumar <vireshk@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 51/52] PM / devfreq: tegra30: Support interconnect and OPPs from device-tree
Date:   Mon, 26 Oct 2020 01:17:34 +0300
Message-Id: <20201025221735.3062-52-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch moves ACTMON driver away from generating OPP table by itself,
transitioning it to use the table which comes from device-tree. This
change breaks compatibility with older device-trees in order to bring
support for the interconnect framework to the driver. This is a mandatory
change which needs to be done in order to implement interconnect-based
memory DVFS. Users of legacy device-trees will get a message telling that
theirs DT needs to be upgraded. Now ACTMON issues memory bandwidth request
using dev_pm_opp_set_bw(), instead of driving EMC clock rate directly.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 91 ++++++++++++++++---------------
 1 file changed, 48 insertions(+), 43 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 3f732ab53573..1b0b91a71886 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -19,6 +19,8 @@
 #include <linux/reset.h>
 #include <linux/workqueue.h>
 
+#include <soc/tegra/fuse.h>
+
 #include "governor.h"
 
 #define ACTMON_GLB_STATUS					0x0
@@ -155,6 +157,7 @@ struct tegra_devfreq_device {
 
 struct tegra_devfreq {
 	struct devfreq		*devfreq;
+	struct opp_table	*opp_table;
 
 	struct reset_control	*reset;
 	struct clk		*clock;
@@ -612,34 +615,19 @@ static void tegra_actmon_stop(struct tegra_devfreq *tegra)
 static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
 				u32 flags)
 {
-	struct tegra_devfreq *tegra = dev_get_drvdata(dev);
-	struct devfreq *devfreq = tegra->devfreq;
 	struct dev_pm_opp *opp;
-	unsigned long rate;
-	int err;
+	int ret;
 
 	opp = devfreq_recommended_opp(dev, freq, flags);
 	if (IS_ERR(opp)) {
-		dev_err(dev, "Failed to find opp for %lu Hz\n", *freq);
+		dev_err(dev, "failed to find opp for %lu Hz\n", *freq);
 		return PTR_ERR(opp);
 	}
-	rate = dev_pm_opp_get_freq(opp);
-	dev_pm_opp_put(opp);
-
-	err = clk_set_min_rate(tegra->emc_clock, rate * KHZ);
-	if (err)
-		return err;
-
-	err = clk_set_rate(tegra->emc_clock, 0);
-	if (err)
-		goto restore_min_rate;
 
-	return 0;
-
-restore_min_rate:
-	clk_set_min_rate(tegra->emc_clock, devfreq->previous_freq);
+	ret = dev_pm_opp_set_bw(dev, opp);
+	dev_pm_opp_put(opp);
 
-	return err;
+	return ret;
 }
 
 static int tegra_devfreq_get_dev_status(struct device *dev,
@@ -655,7 +643,7 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
 	stat->private_data = tegra;
 
 	/* The below are to be used by the other governors */
-	stat->current_frequency = cur_freq;
+	stat->current_frequency = cur_freq * KHZ;
 
 	actmon_dev = &tegra->devices[MCALL];
 
@@ -705,7 +693,7 @@ static int tegra_governor_get_target(struct devfreq *devfreq,
 		target_freq = max(target_freq, dev->target_freq);
 	}
 
-	*freq = target_freq;
+	*freq = target_freq * KHZ;
 
 	return 0;
 }
@@ -773,13 +761,22 @@ static struct devfreq_governor tegra_devfreq_governor = {
 
 static int tegra_devfreq_probe(struct platform_device *pdev)
 {
+	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
 	struct tegra_devfreq_device *dev;
 	struct tegra_devfreq *tegra;
+	struct opp_table *opp_table;
 	struct devfreq *devfreq;
 	unsigned int i;
 	long rate;
 	int err;
 
+	/* legacy device-trees don't have OPP table and must be updated */
+	if (!device_property_present(&pdev->dev, "operating-points-v2")) {
+		dev_err(&pdev->dev, "OPP table not found, cannot continue\n");
+		dev_err(&pdev->dev, "please update your device tree\n");
+		return -ENODEV;
+	}
+
 	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
 	if (!tegra)
 		return -ENOMEM;
@@ -821,11 +818,29 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	tegra->opp_table = dev_pm_opp_get_opp_table(&pdev->dev);
+	if (IS_ERR(tegra->opp_table))
+		return dev_err_probe(&pdev->dev, PTR_ERR(tegra->opp_table),
+				     "Failed to prepare OPP table\n");
+
+	opp_table = dev_pm_opp_set_supported_hw(&pdev->dev, &hw_version, 1);
+	err = PTR_ERR_OR_ZERO(opp_table);
+	if (err) {
+		dev_err(&pdev->dev, "Failed to set supported HW: %d\n", err);
+		goto put_table;
+	}
+
+	err = dev_pm_opp_of_add_table(&pdev->dev);
+	if (err) {
+		dev_err(&pdev->dev, "Failed to add OPP table: %d\n", err);
+		goto put_hw;
+	}
+
 	err = clk_prepare_enable(tegra->clock);
 	if (err) {
 		dev_err(&pdev->dev,
 			"Failed to prepare and enable ACTMON clock\n");
-		return err;
+		goto remove_table;
 	}
 
 	err = reset_control_reset(tegra->reset);
@@ -849,23 +864,6 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 		dev->regs = tegra->regs + dev->config->offset;
 	}
 
-	for (rate = 0; rate <= tegra->max_freq * KHZ; rate++) {
-		rate = clk_round_rate(tegra->emc_clock, rate);
-
-		if (rate < 0) {
-			dev_err(&pdev->dev,
-				"Failed to round clock rate: %ld\n", rate);
-			err = rate;
-			goto remove_opps;
-		}
-
-		err = dev_pm_opp_add(&pdev->dev, rate / KHZ, 0);
-		if (err) {
-			dev_err(&pdev->dev, "Failed to add OPP: %d\n", err);
-			goto remove_opps;
-		}
-	}
-
 	platform_set_drvdata(pdev, tegra);
 
 	tegra->clk_rate_change_nb.notifier_call = tegra_actmon_clk_notify_cb;
@@ -881,7 +879,6 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	}
 
 	tegra_devfreq_profile.initial_freq = clk_get_rate(tegra->emc_clock);
-	tegra_devfreq_profile.initial_freq /= KHZ;
 
 	devfreq = devfreq_add_device(&pdev->dev, &tegra_devfreq_profile,
 				     "tegra_actmon", NULL);
@@ -901,6 +898,12 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	reset_control_reset(tegra->reset);
 disable_clk:
 	clk_disable_unprepare(tegra->clock);
+remove_table:
+	dev_pm_opp_of_remove_table(&pdev->dev);
+put_hw:
+	dev_pm_opp_put_supported_hw(tegra->opp_table);
+put_table:
+	dev_pm_opp_put_opp_table(tegra->opp_table);
 
 	return err;
 }
@@ -912,11 +915,13 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
 	devfreq_remove_device(tegra->devfreq);
 	devfreq_remove_governor(&tegra_devfreq_governor);
 
-	dev_pm_opp_remove_all_dynamic(&pdev->dev);
-
 	reset_control_reset(tegra->reset);
 	clk_disable_unprepare(tegra->clock);
 
+	dev_pm_opp_of_remove_table(&pdev->dev);
+	dev_pm_opp_put_supported_hw(tegra->opp_table);
+	dev_pm_opp_put_opp_table(tegra->opp_table);
+
 	return 0;
 }
 
-- 
2.27.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE65E92BA
	for <lists+linux-tegra@lfdr.de>; Tue, 29 Oct 2019 23:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbfJ2WGV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 29 Oct 2019 18:06:21 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39772 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbfJ2WGU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Oct 2019 18:06:20 -0400
Received: by mail-lj1-f195.google.com with SMTP id y3so347526ljj.6;
        Tue, 29 Oct 2019 15:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KmLVYbZepPbzlnVSQHcxRh+1cxXJhI2502pLE7Wi1uA=;
        b=oN5Jy875okOLihopQI1uqBe5/xz+3td5bDpekzbRc159Hm3Y6xasFmGapmj+6ZPzEt
         mIyvS5hxHQzwPo8XluoXe+FaLSNPtWfKyZl8ix/0fRFb2PlgY9BGNiW0j5SWq5LoIK1B
         BIQuCO++qosE19vIOWkrEi0BIou576lHbSupfufXVFE2tezgpNuAPbYjz5AiEvrFQRoL
         QQHeHy+0Ooxqwr4lrWcOvlb/sKgy9/ulRerUeVneujQr7wLhIJII12NipYhRDLcKiBpD
         p9vSawSy4Z4UTtKxy6EnJC4NAtRueko/h5L8bBWwkYYMCfkACa2OXZuBX7MokIN8/cI3
         YoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KmLVYbZepPbzlnVSQHcxRh+1cxXJhI2502pLE7Wi1uA=;
        b=MlhUnW8vwlFArzd5Fmc0D8uEk9DOd14vDqs9gMfmIYD6CkiHarcHXz+qlMhF24m6gp
         EabXHEqlofodNkMymRSqy6OWVf27nWSQajB26v5wfTGh4f7Nxq7xrO2pblWW7SLQUDek
         gKtbiTrEH+QiTHGFkO5+1Orixg9XxTIny+Hm8+K8f/70dnq912+EZk1lhsfMQ/EKN2qJ
         lSUSOgJFxnxefbYFMcrkALOzmYVpj27A5G9/9djRPTO78i7JeeWn4Nd7B7e2u2F2cV3H
         bncpeEdgRy7j1TyGVCwY/QHkt3uGoGGe0+ixzwJIqeIBm2s0FkLwbW1vfnOWJXzjD1It
         SP1g==
X-Gm-Message-State: APjAAAWQoZT4GuiFov5p+r/9g0Vwbkp5abRbrz5YbnS6wMHxnaYSayqV
        OSpSGIPTpNUPLeckNQFCIC8=
X-Google-Smtp-Source: APXvYqxhX1EZC4UQEdlVVPL6jKi7w0Cxr2icQeFsxcYDV9OzxWf69l+G+r0WeMCS2f8z6u6FP5IplQ==
X-Received: by 2002:a05:651c:1066:: with SMTP id y6mr4233311ljm.96.1572386776062;
        Tue, 29 Oct 2019 15:06:16 -0700 (PDT)
Received: from localhost.localdomain (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.gmail.com with ESMTPSA id 12sm51536lje.92.2019.10.29.15.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 15:06:15 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 07/19] PM / devfreq: tegra30: Use CPUFreq notifier
Date:   Wed, 30 Oct 2019 01:00:07 +0300
Message-Id: <20191029220019.26773-8-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191029220019.26773-1-digetx@gmail.com>
References: <20191029220019.26773-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The CPU's client need to take into account that CPUFreq may change
while memory activity not, staying high. Thus an appropriate frequency
notifier should be used in addition to the clk-notifier.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Peter Geis <pgwipeout@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 180 +++++++++++++++++++++++++-----
 1 file changed, 155 insertions(+), 25 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 06c5376a7201..3f2f2223da8c 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/reset.h>
+#include <linux/workqueue.h>
 
 #include "governor.h"
 
@@ -34,6 +35,8 @@
 #define ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_EN		BIT(30)
 #define ACTMON_DEV_CTRL_ENB					BIT(31)
 
+#define ACTMON_DEV_CTRL_STOP					0x00000000
+
 #define ACTMON_DEV_UPPER_WMARK					0x4
 #define ACTMON_DEV_LOWER_WMARK					0x8
 #define ACTMON_DEV_INIT_AVG					0xc
@@ -159,7 +162,10 @@ struct tegra_devfreq {
 	struct clk		*emc_clock;
 	unsigned long		max_freq;
 	unsigned long		cur_freq;
-	struct notifier_block	rate_change_nb;
+	struct notifier_block	clk_rate_change_nb;
+
+	struct delayed_work	cpufreq_update_work;
+	struct notifier_block	cpu_rate_change_nb;
 
 	struct tegra_devfreq_device devices[ARRAY_SIZE(actmon_device_configs)];
 
@@ -303,22 +309,32 @@ static unsigned long actmon_cpu_to_emc_rate(struct tegra_devfreq *tegra,
 	return 0;
 }
 
+static unsigned long actmon_device_target_freq(struct tegra_devfreq *tegra,
+					       struct tegra_devfreq_device *dev)
+{
+	unsigned int avg_sustain_coef;
+	unsigned long target_freq;
+
+	target_freq = dev->avg_count / ACTMON_SAMPLING_PERIOD;
+	avg_sustain_coef = 100 * 100 / dev->config->boost_up_threshold;
+	target_freq = do_percent(target_freq, avg_sustain_coef);
+	target_freq += dev->boost_freq;
+
+	return target_freq;
+}
+
 static void actmon_update_target(struct tegra_devfreq *tegra,
 				 struct tegra_devfreq_device *dev)
 {
 	unsigned long cpu_freq = 0;
 	unsigned long static_cpu_emc_freq = 0;
-	unsigned int avg_sustain_coef;
 
 	if (dev->config->avg_dependency_threshold) {
-		cpu_freq = cpufreq_get(0);
+		cpu_freq = cpufreq_quick_get(0);
 		static_cpu_emc_freq = actmon_cpu_to_emc_rate(tegra, cpu_freq);
 	}
 
-	dev->target_freq = dev->avg_count / ACTMON_SAMPLING_PERIOD;
-	avg_sustain_coef = 100 * 100 / dev->config->boost_up_threshold;
-	dev->target_freq = do_percent(dev->target_freq, avg_sustain_coef);
-	dev->target_freq += dev->boost_freq;
+	dev->target_freq = actmon_device_target_freq(tegra, dev);
 
 	if (dev->avg_count >= dev->config->avg_dependency_threshold)
 		dev->target_freq = max(dev->target_freq, static_cpu_emc_freq);
@@ -349,8 +365,8 @@ static irqreturn_t actmon_thread_isr(int irq, void *data)
 	return handled ? IRQ_HANDLED : IRQ_NONE;
 }
 
-static int tegra_actmon_rate_notify_cb(struct notifier_block *nb,
-				       unsigned long action, void *ptr)
+static int tegra_actmon_clk_notify_cb(struct notifier_block *nb,
+				      unsigned long action, void *ptr)
 {
 	struct clk_notifier_data *data = ptr;
 	struct tegra_devfreq *tegra;
@@ -360,7 +376,7 @@ static int tegra_actmon_rate_notify_cb(struct notifier_block *nb,
 	if (action != POST_RATE_CHANGE)
 		return NOTIFY_OK;
 
-	tegra = container_of(nb, struct tegra_devfreq, rate_change_nb);
+	tegra = container_of(nb, struct tegra_devfreq, clk_rate_change_nb);
 
 	tegra->cur_freq = data->new_rate / KHZ;
 
@@ -373,6 +389,79 @@ static int tegra_actmon_rate_notify_cb(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
+static void tegra_actmon_delayed_update(struct work_struct *work)
+{
+	struct tegra_devfreq *tegra = container_of(work, struct tegra_devfreq,
+						   cpufreq_update_work.work);
+
+	mutex_lock(&tegra->devfreq->lock);
+	update_devfreq(tegra->devfreq);
+	mutex_unlock(&tegra->devfreq->lock);
+}
+
+static unsigned long
+tegra_actmon_cpufreq_contribution(struct tegra_devfreq *tegra,
+				  unsigned int cpu_freq)
+{
+	unsigned long static_cpu_emc_freq, dev_freq;
+
+	/* check whether CPU's freq is taken into account at all */
+	if (tegra->devices[MCCPU].avg_count <
+	    tegra->devices[MCCPU].config->avg_dependency_threshold)
+		return 0;
+
+	static_cpu_emc_freq = actmon_cpu_to_emc_rate(tegra, cpu_freq);
+	dev_freq = actmon_device_target_freq(tegra, &tegra->devices[MCCPU]);
+
+	if (dev_freq >= static_cpu_emc_freq)
+		return 0;
+
+	return static_cpu_emc_freq;
+}
+
+static int tegra_actmon_cpu_notify_cb(struct notifier_block *nb,
+				      unsigned long action, void *ptr)
+{
+	struct cpufreq_freqs *freqs = ptr;
+	struct tegra_devfreq *tegra;
+	unsigned long old, new, delay;
+
+	if (action != CPUFREQ_POSTCHANGE)
+		return NOTIFY_OK;
+
+	tegra = container_of(nb, struct tegra_devfreq, cpu_rate_change_nb);
+
+	/*
+	 * Quickly check whether CPU frequency should be taken into account
+	 * at all, without blocking CPUFreq's core.
+	 */
+	if (mutex_trylock(&tegra->devfreq->lock)) {
+		old = tegra_actmon_cpufreq_contribution(tegra, freqs->old);
+		new = tegra_actmon_cpufreq_contribution(tegra, freqs->new);
+		mutex_unlock(&tegra->devfreq->lock);
+
+		/*
+		 * If CPU's frequency shouldn't be taken into account at
+		 * the moment, then there is no need to update the devfreq's
+		 * state because ISR will re-check CPU's frequency on the
+		 * next interrupt.
+		 */
+		if (old == new)
+			return NOTIFY_OK;
+	}
+
+	/*
+	 * CPUFreq driver should support CPUFREQ_ASYNC_NOTIFICATION in order
+	 * to allow asynchronous notifications. This means we can't block
+	 * here for too long, otherwise CPUFreq's core will complain with a
+	 * warning splat.
+	 */
+	delay = msecs_to_jiffies(ACTMON_SAMPLING_PERIOD);
+	schedule_delayed_work(&tegra->cpufreq_update_work, delay);
+
+	return NOTIFY_OK;
+}
+
 static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
 					  struct tegra_devfreq_device *dev)
 {
@@ -405,9 +494,22 @@ static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
 	device_writel(dev, val, ACTMON_DEV_CTRL);
 }
 
-static void tegra_actmon_start(struct tegra_devfreq *tegra)
+static void tegra_actmon_stop_devices(struct tegra_devfreq *tegra)
+{
+	struct tegra_devfreq_device *dev = tegra->devices;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++, dev++) {
+		device_writel(dev, ACTMON_DEV_CTRL_STOP, ACTMON_DEV_CTRL);
+		device_writel(dev, ACTMON_INTR_STATUS_CLEAR,
+			      ACTMON_DEV_INTR_STATUS);
+	}
+}
+
+static int tegra_actmon_start(struct tegra_devfreq *tegra)
 {
 	unsigned int i;
+	int err;
 
 	actmon_writel(tegra, ACTMON_SAMPLING_PERIOD - 1,
 		      ACTMON_GLB_PERIOD_CTRL);
@@ -415,20 +517,41 @@ static void tegra_actmon_start(struct tegra_devfreq *tegra)
 	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++)
 		tegra_actmon_configure_device(tegra, &tegra->devices[i]);
 
+	/*
+	 * We are estimating CPU's memory bandwidth requirement based on
+	 * amount of memory accesses and system's load, judging by CPU's
+	 * frequency. We also don't want to receive events about CPU's
+	 * frequency transaction when governor is stopped, hence notifier
+	 * is registered dynamically.
+	 */
+	err = cpufreq_register_notifier(&tegra->cpu_rate_change_nb,
+					CPUFREQ_TRANSITION_NOTIFIER);
+	if (err) {
+		dev_err(tegra->devfreq->dev.parent,
+			"Failed to register rate change notifier: %d\n", err);
+		goto err_stop;
+	}
+
 	enable_irq(tegra->irq);
+
+	return 0;
+
+err_stop:
+	tegra_actmon_stop_devices(tegra);
+
+	return err;
 }
 
 static void tegra_actmon_stop(struct tegra_devfreq *tegra)
 {
-	unsigned int i;
-
 	disable_irq(tegra->irq);
 
-	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++) {
-		device_writel(&tegra->devices[i], 0x00000000, ACTMON_DEV_CTRL);
-		device_writel(&tegra->devices[i], ACTMON_INTR_STATUS_CLEAR,
-			      ACTMON_DEV_INTR_STATUS);
-	}
+	cpufreq_unregister_notifier(&tegra->cpu_rate_change_nb,
+				    CPUFREQ_TRANSITION_NOTIFIER);
+
+	cancel_delayed_work_sync(&tegra->cpufreq_update_work);
+
+	tegra_actmon_stop_devices(tegra);
 }
 
 static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
@@ -536,6 +659,7 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
 					unsigned int event, void *data)
 {
 	struct tegra_devfreq *tegra = dev_get_drvdata(devfreq->dev.parent);
+	int ret = 0;
 
 	/*
 	 * Couple device with the governor early as it is needed at
@@ -546,7 +670,7 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
 	switch (event) {
 	case DEVFREQ_GOV_START:
 		devfreq_monitor_start(devfreq);
-		tegra_actmon_start(tegra);
+		ret = tegra_actmon_start(tegra);
 		break;
 
 	case DEVFREQ_GOV_STOP:
@@ -561,11 +685,11 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
 
 	case DEVFREQ_GOV_RESUME:
 		devfreq_monitor_resume(devfreq);
-		tegra_actmon_start(tegra);
+		ret = tegra_actmon_start(tegra);
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static struct devfreq_governor tegra_devfreq_governor = {
@@ -672,8 +796,14 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, tegra);
 
-	tegra->rate_change_nb.notifier_call = tegra_actmon_rate_notify_cb;
-	err = clk_notifier_register(tegra->emc_clock, &tegra->rate_change_nb);
+	tegra->cpu_rate_change_nb.notifier_call = tegra_actmon_cpu_notify_cb;
+
+	INIT_DELAYED_WORK(&tegra->cpufreq_update_work,
+			  tegra_actmon_delayed_update);
+
+	tegra->clk_rate_change_nb.notifier_call = tegra_actmon_clk_notify_cb;
+	err = clk_notifier_register(tegra->emc_clock,
+				    &tegra->clk_rate_change_nb);
 	if (err) {
 		dev_err(&pdev->dev,
 			"Failed to register rate change notifier\n");
@@ -701,7 +831,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	devfreq_remove_governor(&tegra_devfreq_governor);
 
 unreg_notifier:
-	clk_notifier_unregister(tegra->emc_clock, &tegra->rate_change_nb);
+	clk_notifier_unregister(tegra->emc_clock, &tegra->clk_rate_change_nb);
 
 remove_opps:
 	dev_pm_opp_remove_all_dynamic(&pdev->dev);
@@ -719,7 +849,7 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
 	devfreq_remove_device(tegra->devfreq);
 	devfreq_remove_governor(&tegra_devfreq_governor);
 
-	clk_notifier_unregister(tegra->emc_clock, &tegra->rate_change_nb);
+	clk_notifier_unregister(tegra->emc_clock, &tegra->clk_rate_change_nb);
 	dev_pm_opp_remove_all_dynamic(&pdev->dev);
 
 	reset_control_reset(tegra->reset);
-- 
2.23.0


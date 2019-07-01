Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 663A555D93
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Jun 2019 03:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfFZBfR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Jun 2019 21:35:17 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40245 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbfFZBfP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jun 2019 21:35:15 -0400
Received: by mail-lf1-f67.google.com with SMTP id a9so359090lff.7;
        Tue, 25 Jun 2019 18:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rqswAbjX+pKJ8n0aSqwpQRZfGBqsAS4kf0xi4kuYCCU=;
        b=I0UN7PdNR7xZg3kpKM/QWcexYIbPo5Gn5/Ouf2QbaYZ49Ff3Q4LHQQGDwqZnuk2yBk
         l0W02HfF0B/pR36acfDn+6cBl3YYZQMiut033xIJZU+5g7dZ6ekqiBRYIz/g8Q+1ix0q
         oYo0w9NbZRWQjxiBaPn5vC/IYUhJNTFfnjM6fcC/fVlK909VPF96Oja4R/I9dNcwyVi3
         uRtMGkei9Ah7mQ+H93z9/3ymrmcEMIDqZItk+N5AslMzYb77OM/b186e1pdl9IOQN0Wc
         juQjn9vxNEY5Thp9fQTWt6npjC/MNSXPiDOFNG76g9oMblVlc7iKPoM32kQ/+uP9Neog
         Oh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rqswAbjX+pKJ8n0aSqwpQRZfGBqsAS4kf0xi4kuYCCU=;
        b=qd7Tal+lrro3ZkObjPVKX0aMC8Ir/BLhCBm6WqYJ7SKtPOnZQFpJjlU35/GhHfipuk
         ZrXHOS+fPZbs/dm79VQLOCc+MLriM+/eNuKm+fE+KNVS0vjeC++ivEci5ayb9ydkPFsh
         4tnGh2yoyoB+j5BP4OiBO58gue7rYBtJe4uzB4T/u/bfAYtyaN1+y0K3mqkyIMk98hAC
         FepuAunv9FXvDuRZ8QA3lY+aEy8us8/Jh5Hu0CwlPu/qJDagncP7h2ctTUuZrxMM7qbS
         COVxBnc6x9JlcJIJqt3tFw6irMOS4hA6chqieOWqcSNz0UeffkoPBEcc4z2zJ6hTxPUR
         B6tw==
X-Gm-Message-State: APjAAAWjt/M9DD0Q/ujfbhAWtzj/lwgayG/N2D1Z4KVB9iWYD7gAIyV6
        HE10U9UcGNhe/klsqcno9fo=
X-Google-Smtp-Source: APXvYqzAXHT1ud4m03K/2xs2tzTOwIRc0eJrl9Paf6rO0zl4d8n73AIwCbwElm2xwPJFEQoCwKe2Fw==
X-Received: by 2002:a19:f20d:: with SMTP id q13mr917258lfh.65.1561512912443;
        Tue, 25 Jun 2019 18:35:12 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.gmail.com with ESMTPSA id 199sm2549581ljf.44.2019.06.25.18.35.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 18:35:11 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/17] PM / devfreq: tegra30: Use kHz units uniformly in the code
Date:   Wed, 26 Jun 2019 04:32:50 +0300
Message-Id: <20190626013252.30470-17-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190626013252.30470-1-digetx@gmail.com>
References: <20190626013252.30470-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Now that all kHz-conversion related bugs are fixed, we can use the kHz
uniformly. This makes code cleaner and avoids integer divisions in the
code, which is useful in a case of Tegra30 that has Cortex A9 CPU that
doesn't support integer division instructions, hence all divisions are
actually made in software mode. Another small benefit from this change
is that now powertop utility correctly displays devfreq's stats, for
some reason it expects them to be in kHz.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 78 +++++++++++++++++--------------
 1 file changed, 43 insertions(+), 35 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index c03135000af7..778c5a940256 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -72,6 +72,8 @@
 
 #define KHZ							1000
 
+#define KHZ_MAX						(ULONG_MAX / KHZ)
+
 /* Assume that the bus is saturated if the utilization is 25% */
 #define BUS_SATURATION_RATIO					25
 
@@ -124,7 +126,7 @@ static const struct tegra_devfreq_device_config actmon_device_configs[] = {
 		.boost_down_coeff = 90,
 		.boost_up_threshold = 27,
 		.boost_down_threshold = 10,
-		.avg_dependency_threshold = 50000,
+		.avg_dependency_threshold = 50000 / ACTMON_SAMPLING_PERIOD,
 	},
 };
 
@@ -137,8 +139,11 @@ struct tegra_devfreq_device {
 	const struct tegra_devfreq_device_config *config;
 	void __iomem *regs;
 
-	/* Average event count sampled in the last interrupt */
-	u32 avg_count;
+	/*
+	 * Average event count sampled in the last interrupt and converted
+	 * to frequency value.
+	 */
+	u32 avg_freq;
 
 	/*
 	 * Extra frequency to increase the target by due to consecutive
@@ -172,7 +177,7 @@ struct tegra_actmon_emc_ratio {
 };
 
 static const struct tegra_actmon_emc_ratio actmon_emc_ratios[] = {
-	{ 1400000, ULONG_MAX / KHZ },
+	{ 1400000,    KHZ_MAX },
 	{ 1200000,    750000 },
 	{ 1100000,    600000 },
 	{ 1000000,    500000 },
@@ -234,7 +239,7 @@ tegra_actmon_account_cpu_freq(struct tegra_devfreq *tegra,
 	unsigned long static_cpu_emc_freq;
 
 	if (dev->config->avg_dependency_threshold &&
-	    dev->config->avg_dependency_threshold < dev->avg_count) {
+	    dev->config->avg_dependency_threshold < dev->avg_freq) {
 		static_cpu_emc_freq = actmon_cpu_to_emc_rate(tegra);
 		target_freq = max(target_freq, static_cpu_emc_freq);
 	}
@@ -265,7 +270,7 @@ static unsigned long tegra_actmon_upper_freq(struct tegra_devfreq *tegra,
 
 	opp = dev_pm_opp_find_freq_ceil(tegra->devfreq->dev.parent, &upper);
 	if (IS_ERR(opp))
-		upper = ULONG_MAX;
+		upper = KHZ_MAX;
 	else
 		dev_pm_opp_put(opp);
 
@@ -287,7 +292,7 @@ static void tegra_actmon_get_lower_upper(struct tegra_devfreq *tegra,
 	 * range in a case where target_freq falls into a range of
 	 * next_possible_opp_freq - 1MHz.
 	 */
-	target_freq = round_down(target_freq, 1000000);
+	target_freq = round_down(target_freq, 1000);
 
 	/* watermarks are set at the borders of the corresponding OPPs */
 	*lower = tegra_actmon_lower_freq(tegra, target_freq);
@@ -296,9 +301,6 @@ static void tegra_actmon_get_lower_upper(struct tegra_devfreq *tegra,
 	dev_dbg(ddev, "%03x: target_freq %lu lower freq %lu upper freq %lu\n",
 		offset, target_freq, *lower, *upper);
 
-	*lower /= KHZ;
-	*upper /= KHZ;
-
 	/*
 	 * The upper watermark should take into account CPU's frequency
 	 * because cpu_to_emc_rate() may override the target_freq with
@@ -314,22 +316,23 @@ static void tegra_actmon_get_lower_upper(struct tegra_devfreq *tegra,
 static void tegra_devfreq_update_avg_wmark(struct tegra_devfreq *tegra,
 					   struct tegra_devfreq_device *dev)
 {
-	unsigned long lower, upper, freq;
+	unsigned long avg_threshold, lower, upper;
 
-	freq = dev->avg_count / ACTMON_SAMPLING_PERIOD * KHZ;
-	tegra_actmon_get_lower_upper(tegra, dev, freq, &lower, &upper);
+	tegra_actmon_get_lower_upper(tegra, dev, dev->avg_freq, &lower, &upper);
+
+	avg_threshold = dev->config->avg_dependency_threshold;
+	avg_threshold = avg_threshold * ACTMON_SAMPLING_PERIOD;
 
 	/*
 	 * We want to get interrupts when MCCPU client crosses the
 	 * dependency threshold in order to take into / out of account
 	 * the CPU's freq.
 	 */
-	if (lower < dev->config->avg_dependency_threshold &&
-	    upper > dev->config->avg_dependency_threshold) {
-		if (dev->avg_count < dev->config->avg_dependency_threshold)
-			upper = dev->config->avg_dependency_threshold;
+	if (lower < avg_threshold && upper > avg_threshold) {
+		if (dev->avg_freq < dev->config->avg_dependency_threshold)
+			upper = avg_threshold;
 		else
-			lower = dev->config->avg_dependency_threshold;
+			lower = avg_threshold;
 	}
 
 	device_writel(dev, lower, ACTMON_DEV_AVG_LOWER_WMARK);
@@ -368,8 +371,7 @@ static void tegra_devfreq_update_wmark(struct tegra_devfreq *tegra,
 	 * device. Once that mark is hit and boosting is stopped, the
 	 * interrupt is disabled by ISR.
 	 */
-	freq = dev->avg_count / ACTMON_SAMPLING_PERIOD * KHZ;
-	tegra_actmon_get_lower_upper(tegra, dev, freq, &lower, &upper);
+	tegra_actmon_get_lower_upper(tegra, dev, dev->avg_freq, &lower, &upper);
 
 	delta = do_percent(upper - lower, dev->config->boost_down_threshold);
 	device_writel(dev, lower + delta, ACTMON_DEV_LOWER_WMARK);
@@ -396,14 +398,16 @@ static void actmon_device_debug(struct tegra_devfreq *tegra,
 static void actmon_isr_device(struct tegra_devfreq *tegra,
 			      struct tegra_devfreq_device *dev)
 {
-	u32 intr_status, dev_ctrl, avg_intr_mask;
+	u32 intr_status, dev_ctrl, avg_intr_mask, avg_count;
 
 	actmon_device_debug(tegra, dev, "isr+");
 
-	dev->avg_count = device_readl(dev, ACTMON_DEV_AVG_COUNT);
 	intr_status = device_readl(dev, ACTMON_DEV_INTR_STATUS);
+	avg_count = device_readl(dev, ACTMON_DEV_AVG_COUNT);
 	dev_ctrl = device_readl(dev, ACTMON_DEV_CTRL);
 
+	dev->avg_freq = avg_count / ACTMON_SAMPLING_PERIOD;
+
 	avg_intr_mask = ACTMON_DEV_INTR_AVG_BELOW_WMARK |
 			ACTMON_DEV_INTR_AVG_ABOVE_WMARK;
 
@@ -457,8 +461,7 @@ static unsigned long actmon_update_target(struct tegra_devfreq *tegra,
 					  struct tegra_devfreq_device *dev)
 {	unsigned long target_freq;
 
-	target_freq = dev->avg_count / ACTMON_SAMPLING_PERIOD + dev->boost_freq;
-	target_freq = min(target_freq, ULONG_MAX / KHZ);
+	target_freq = min(dev->avg_freq + dev->boost_freq, KHZ_MAX);
 	target_freq = tegra_actmon_account_cpu_freq(tegra, dev, target_freq);
 
 	return target_freq;
@@ -495,6 +498,7 @@ static int tegra_actmon_clk_notify_cb(struct notifier_block *nb,
 	struct clk_notifier_data *data = ptr;
 	struct tegra_devfreq_device *dev;
 	struct tegra_devfreq *tegra;
+	unsigned long freq;
 	unsigned int i;
 
 	if (action != POST_RATE_CHANGE)
@@ -502,6 +506,8 @@ static int tegra_actmon_clk_notify_cb(struct notifier_block *nb,
 
 	tegra = container_of(nb, struct tegra_devfreq, clk_rate_change_nb);
 
+	freq = data->new_rate / KHZ;
+
 	/*
 	 * EMC rate could change due to three reasons:
 	 *
@@ -523,7 +529,7 @@ static int tegra_actmon_clk_notify_cb(struct notifier_block *nb,
 		dev = &tegra->devices[i];
 
 		tegra_devfreq_update_avg_wmark(tegra, dev);
-		tegra_devfreq_update_wmark(tegra, dev, data->new_rate);
+		tegra_devfreq_update_wmark(tegra, dev, freq);
 	}
 
 	return NOTIFY_OK;
@@ -563,17 +569,17 @@ static int tegra_actmon_cpu_notify_cb(struct notifier_block *nb,
 static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
 					  struct tegra_devfreq_device *dev)
 {
-	u32 val = 0, target_freq;
+	u32 val = 0;
 
 	/* we don't want boosting on restart */
 	dev->boost_freq = 0;
 
-	target_freq = clk_get_rate(tegra->emc_clock) / KHZ;
-	dev->avg_count = target_freq * ACTMON_SAMPLING_PERIOD;
-	device_writel(dev, dev->avg_count, ACTMON_DEV_INIT_AVG);
+	dev->avg_freq = clk_get_rate(tegra->emc_clock) / KHZ;
+	device_writel(dev, dev->avg_freq * ACTMON_SAMPLING_PERIOD,
+		      ACTMON_DEV_INIT_AVG);
 
 	tegra_devfreq_update_avg_wmark(tegra, dev);
-	tegra_devfreq_update_wmark(tegra, dev, target_freq);
+	tegra_devfreq_update_wmark(tegra, dev, dev->avg_freq);
 
 	device_writel(dev, ACTMON_COUNT_WEIGHT, ACTMON_DEV_COUNT_WEIGHT);
 	device_writel(dev, ACTMON_INTR_STATUS_CLEAR, ACTMON_DEV_INTR_STATUS);
@@ -685,7 +691,7 @@ static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
 	rate = dev_pm_opp_get_freq(opp);
 	dev_pm_opp_put(opp);
 
-	err = clk_set_min_rate(tegra->emc_clock, rate);
+	err = clk_set_min_rate(tegra->emc_clock, rate * KHZ);
 	if (err)
 		return err;
 
@@ -708,7 +714,7 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
 	struct tegra_devfreq_device *actmon_dev;
 	unsigned long cur_freq;
 
-	cur_freq = clk_get_rate(tegra->emc_clock);
+	cur_freq = clk_get_rate(tegra->emc_clock) / KHZ;
 
 	/* To be used by the tegra governor */
 	stat->private_data = tegra;
@@ -725,7 +731,7 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
 	stat->busy_time *= 100 / BUS_SATURATION_RATIO;
 
 	/* Number of cycles in a sampling period */
-	stat->total_time = cur_freq / KHZ * ACTMON_SAMPLING_PERIOD;
+	stat->total_time = cur_freq * ACTMON_SAMPLING_PERIOD;
 
 	stat->busy_time = min(stat->busy_time, stat->total_time);
 
@@ -771,7 +777,7 @@ static int tegra_governor_get_target(struct devfreq *devfreq,
 		actmon_device_debug(tegra, dev, "upd");
 	}
 
-	*freq = target_freq * KHZ;
+	*freq = target_freq;
 
 	return 0;
 }
@@ -907,7 +913,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 			goto remove_opps;
 		}
 
-		err = dev_pm_opp_add(&pdev->dev, rate, 0);
+		err = dev_pm_opp_add(&pdev->dev, rate / KHZ, 0);
 		if (err) {
 			dev_err(&pdev->dev, "Failed to add OPP: %d\n", err);
 			goto remove_opps;
@@ -927,6 +933,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	}
 
 	tegra_devfreq_profile.initial_freq = clk_get_rate(tegra->emc_clock);
+	tegra_devfreq_profile.initial_freq /= KHZ;
+
 	devfreq = devfreq_add_device(&pdev->dev, &tegra_devfreq_profile,
 				     "tegra_actmon", NULL);
 	if (IS_ERR(tegra->devfreq)) {
-- 
2.22.0


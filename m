Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE1DB7ADCF
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jul 2019 18:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732848AbfG3Qcd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Jul 2019 12:32:33 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35030 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732820AbfG3Qc3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Jul 2019 12:32:29 -0400
Received: by mail-wr1-f68.google.com with SMTP id y4so66495392wrm.2;
        Tue, 30 Jul 2019 09:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z+D4amdoS+CtUBZsRTGRL9HUIA0YaiJWDQzAsmv9gmA=;
        b=PI29cbH94krRntP73xK6NMMd3mLqHyPk02GdPgVUoao1F3fssiVIHG3iQFJnFNpND9
         fwoA8U3LpRy8MIXusIhFmHSCIHfTxAHO9Hi40d8If2CxHNyhX0u/wJ9HBk8m3GTC+HQq
         blwzxcOStjhV8dNcRavAZ4snIz3unUKSKQ9//YV3oMbIXgVnEYun6XFchjk1zUx5nnQC
         2q1dVM8UqpayuGklXLZ0bU8k2lNTcXoQPmuvEaVNA7eRXr/7WrGMzLJI/Y3SKoJDto4g
         9BRnPwS9pwAbGJHV9IqXfbthzOJf5Z9qAJQB/j9nZ2EjRkTMWAi/PtC0aDiPvK87R4pL
         jTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z+D4amdoS+CtUBZsRTGRL9HUIA0YaiJWDQzAsmv9gmA=;
        b=SZ/jCEKy1XfkRphHDV/0qgxg4KeCC41FVIOcNullk3bqDzEDWFmJcpgvzOZK6kHoRY
         ll1Mzc1k4VPnVNVbtAFDkWGxQ/6lsI29yCoklFIRx/18hSaaJEGHpcyz9ifuDroZ4p3R
         jsONCrDrDsUhxD2MMBuupYneetuHfRdIStX//DGAPr/oQDSi2k+Fc/J+BH8Eabx7mUmO
         lM1Ow2FkkctGHbOl7dXICWnikZ2e9yqjpC7IqKfWclXWQeK+Lcv+RNxAV2VWPdFSIHLX
         ksBQIM9VGlZgLC18oqIeMOd8Y/ohr/Y/T7CRLxYrfmQin/q8I2bSXUb8vChTynkpOjqC
         mz5Q==
X-Gm-Message-State: APjAAAUngdTROTN3apbTlDWbo8Cvy8kNSxg99pIRWRxgMzM2N/wWxZUa
        Fblg8MJeUZ1LRq6zKB6PisefJmMl
X-Google-Smtp-Source: APXvYqxgEYCReKj4DM5k1QJqtUhLErD10myTtsnM3vENPLxeXJDsu975NNJizKsp7M68ST0V2sRmAA==
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr119994980wrs.132.1564504345404;
        Tue, 30 Jul 2019 09:32:25 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.gmail.com with ESMTPSA id c65sm64835175wma.44.2019.07.30.09.32.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 09:32:24 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 05/20] PM / devfreq: tegra30: Set up watermarks properly
Date:   Tue, 30 Jul 2019 19:22:21 +0300
Message-Id: <20190730162236.6063-6-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190730162236.6063-1-digetx@gmail.com>
References: <20190730162236.6063-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The current implementation is inaccurate and results in very intensive
interrupt activity, which neglects the whole idea of polling offload to
hardware. The reason of the shortcoming is that watermarks are not set
up correctly and this results in ACTMON constantly asking to change freq
and then these requests are ignored. The end result of this patch is that
there are few hundreds of ACTMON's interrupts instead of tens thousands
after few minutes of a working devfreq, meanwhile the transitions activity
stays about the same and governor becomes more reactive.

Since watermarks are set precisely correct now, the boosting logic is
changed a tad to accommodate the change. The "average sustain coefficient"
multiplier is gone now since there is no need to compensate the improper
watermarks and EMC frequency-bump happens once boosting hits the upper
watermark enough times, depending on the per-device boosting threshold.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 293 +++++++++++++++++++++---------
 1 file changed, 209 insertions(+), 84 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index ee14bf534c0d..2331052fd8bd 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -47,6 +47,8 @@
 
 #define ACTMON_DEV_INTR_CONSECUTIVE_UPPER			BIT(31)
 #define ACTMON_DEV_INTR_CONSECUTIVE_LOWER			BIT(30)
+#define ACTMON_DEV_INTR_AVG_BELOW_WMARK				BIT(25)
+#define ACTMON_DEV_INTR_AVG_ABOVE_WMARK				BIT(24)
 
 #define ACTMON_ABOVE_WMARK_WINDOW				1
 #define ACTMON_BELOW_WMARK_WINDOW				3
@@ -63,9 +65,8 @@
  * ACTMON_AVERAGE_WINDOW_LOG2: default value for @DEV_CTRL_K_VAL, which
  * translates to 2 ^ (K_VAL + 1). ex: 2 ^ (6 + 1) = 128
  */
-#define ACTMON_AVERAGE_WINDOW_LOG2			6
-#define ACTMON_SAMPLING_PERIOD				12 /* ms */
-#define ACTMON_DEFAULT_AVG_BAND				6  /* 1/10 of % */
+#define ACTMON_AVERAGE_WINDOW_LOG2				6
+#define ACTMON_SAMPLING_PERIOD					12 /* ms */
 
 #define KHZ							1000
 
@@ -142,9 +143,6 @@ struct tegra_devfreq_device {
 	 * watermark breaches.
 	 */
 	unsigned long boost_freq;
-
-	/* Optimal frequency calculated from the stats for this device */
-	unsigned long target_freq;
 };
 
 struct tegra_devfreq {
@@ -156,7 +154,6 @@ struct tegra_devfreq {
 
 	struct clk		*emc_clock;
 	unsigned long		max_freq;
-	unsigned long		cur_freq;
 	struct notifier_block	rate_change_nb;
 
 	struct tegra_devfreq_device devices[ARRAY_SIZE(actmon_device_configs)];
@@ -205,42 +202,182 @@ static unsigned long do_percent(unsigned long val, unsigned int pct)
 	return val * pct / 100;
 }
 
+static unsigned long actmon_cpu_to_emc_rate(struct tegra_devfreq *tegra)
+{
+	struct tegra_actmon_emc_ratio *ratio = actmon_emc_ratios;
+	unsigned int cpu_freq = cpufreq_quick_get(0);
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(actmon_emc_ratios); i++, ratio++) {
+		if (cpu_freq >= ratio->cpu_freq) {
+			if (ratio->emc_freq >= tegra->max_freq)
+				return tegra->max_freq;
+			else
+				return ratio->emc_freq;
+		}
+	}
+
+	return 0;
+}
+
+static unsigned long
+tegra_actmon_account_cpu_freq(struct tegra_devfreq *tegra,
+			      struct tegra_devfreq_device *dev,
+			      unsigned long target_freq)
+{
+	unsigned long static_cpu_emc_freq;
+
+	if (dev->config->avg_dependency_threshold &&
+	    dev->config->avg_dependency_threshold < dev->avg_count) {
+		static_cpu_emc_freq = actmon_cpu_to_emc_rate(tegra);
+		target_freq = max(target_freq, static_cpu_emc_freq);
+	}
+
+	return target_freq;
+}
+
+static unsigned long tegra_actmon_lower_freq(struct tegra_devfreq *tegra,
+					     unsigned long target_freq)
+{
+	unsigned long lower = target_freq;
+	struct dev_pm_opp *opp;
+
+	opp = dev_pm_opp_find_freq_floor(tegra->devfreq->dev.parent, &lower);
+	if (IS_ERR(opp))
+		lower = 0;
+	else
+		dev_pm_opp_put(opp);
+
+	return lower;
+}
+
+static unsigned long tegra_actmon_upper_freq(struct tegra_devfreq *tegra,
+					     unsigned long target_freq)
+{
+	unsigned long upper = target_freq + 1;
+	struct dev_pm_opp *opp;
+
+	opp = dev_pm_opp_find_freq_ceil(tegra->devfreq->dev.parent, &upper);
+	if (IS_ERR(opp))
+		upper = ULONG_MAX;
+	else
+		dev_pm_opp_put(opp);
+
+	return upper;
+}
+
+static void tegra_actmon_get_lower_upper(struct tegra_devfreq *tegra,
+					 struct tegra_devfreq_device *dev,
+					 unsigned long target_freq,
+					 unsigned long *lower,
+					 unsigned long *upper)
+{
+	/*
+	 * Memory frequencies are guaranteed to have 1MHz granularity
+	 * and thus we need this rounding down to get a proper watermarks
+	 * range in a case where target_freq falls into a range of
+	 * next_possible_opp_freq - 1MHz.
+	 */
+	target_freq = round_down(target_freq, 1000000);
+
+	/* watermarks are set at the borders of the corresponding OPPs */
+	*lower = tegra_actmon_lower_freq(tegra, target_freq);
+	*upper = tegra_actmon_upper_freq(tegra, target_freq);
+
+	*lower /= KHZ;
+	*upper /= KHZ;
+
+	/*
+	 * The upper watermark should take into account CPU's frequency
+	 * because cpu_to_emc_rate() may override the target_freq with
+	 * a higher value and thus upper watermark need to be set up
+	 * accordingly to avoid parasitic upper-events.
+	 */
+	*upper = tegra_actmon_account_cpu_freq(tegra, dev, *upper);
+
+	*lower *= ACTMON_SAMPLING_PERIOD;
+	*upper *= ACTMON_SAMPLING_PERIOD;
+}
+
 static void tegra_devfreq_update_avg_wmark(struct tegra_devfreq *tegra,
 					   struct tegra_devfreq_device *dev)
 {
-	u32 avg = dev->avg_count;
-	u32 avg_band_freq = tegra->max_freq * ACTMON_DEFAULT_AVG_BAND / KHZ;
-	u32 band = avg_band_freq * ACTMON_SAMPLING_PERIOD;
+	unsigned long lower, upper, freq;
 
-	device_writel(dev, avg + band, ACTMON_DEV_AVG_UPPER_WMARK);
+	freq = dev->avg_count / ACTMON_SAMPLING_PERIOD * KHZ;
+	tegra_actmon_get_lower_upper(tegra, dev, freq, &lower, &upper);
 
-	avg = max(dev->avg_count, band);
-	device_writel(dev, avg - band, ACTMON_DEV_AVG_LOWER_WMARK);
+	/*
+	 * We want to get interrupts when MCCPU client crosses the
+	 * dependency threshold in order to take into / out of account
+	 * the CPU's freq.
+	 */
+	if (lower < dev->config->avg_dependency_threshold &&
+	    upper > dev->config->avg_dependency_threshold) {
+		if (dev->avg_count < dev->config->avg_dependency_threshold)
+			upper = dev->config->avg_dependency_threshold;
+		else
+			lower = dev->config->avg_dependency_threshold;
+	}
+
+	device_writel(dev, lower, ACTMON_DEV_AVG_LOWER_WMARK);
+	device_writel(dev, upper, ACTMON_DEV_AVG_UPPER_WMARK);
 }
 
 static void tegra_devfreq_update_wmark(struct tegra_devfreq *tegra,
-				       struct tegra_devfreq_device *dev)
+				       struct tegra_devfreq_device *dev,
+				       unsigned long freq)
 {
-	u32 val = tegra->cur_freq * ACTMON_SAMPLING_PERIOD;
+	unsigned long lower, upper, delta;
+
+	/*
+	 * Boosting logic kicks-in once lower / upper watermark is hit.
+	 * The watermarks are based on the updated EMC rate and the
+	 * average activity.
+	 *
+	 * The higher watermark is set in accordance to the EMC rate
+	 * because we want to set it to the highest mark here and EMC rate
+	 * represents that mark. The consecutive-upper interrupts are
+	 * always enabled and we don't want to receive them if they won't
+	 * do anything useful, hence the upper watermark is capped to maximum.
+	 * Note that the EMC rate is changed once boosting pushed the rate
+	 * too high, in that case boosting-up will be stopped because
+	 * upper watermark is much higher now and it is *important* to
+	 * stop the unwanted interrupts.
+	 */
+	tegra_actmon_get_lower_upper(tegra, dev, freq - 1, &lower, &upper);
+
+	delta = do_percent(upper - lower, dev->config->boost_up_threshold);
+	device_writel(dev, lower + delta, ACTMON_DEV_UPPER_WMARK);
 
-	device_writel(dev, do_percent(val, dev->config->boost_up_threshold),
-		      ACTMON_DEV_UPPER_WMARK);
+	/*
+	 * Meanwhile the lower mark is based on the average value
+	 * because it is the lowest possible consecutive-mark for this
+	 * device. Once that mark is hit and boosting is stopped, the
+	 * interrupt is disabled by ISR.
+	 */
+	freq = dev->avg_count / ACTMON_SAMPLING_PERIOD * KHZ;
+	tegra_actmon_get_lower_upper(tegra, dev, freq, &lower, &upper);
 
-	device_writel(dev, do_percent(val, dev->config->boost_down_threshold),
-		      ACTMON_DEV_LOWER_WMARK);
+	delta = do_percent(upper - lower, dev->config->boost_down_threshold);
+	device_writel(dev, lower + delta, ACTMON_DEV_LOWER_WMARK);
 }
 
 static void actmon_isr_device(struct tegra_devfreq *tegra,
 			      struct tegra_devfreq_device *dev)
 {
-	u32 intr_status, dev_ctrl;
+	u32 intr_status, dev_ctrl, avg_intr_mask;
 
 	dev->avg_count = device_readl(dev, ACTMON_DEV_AVG_COUNT);
-	tegra_devfreq_update_avg_wmark(tegra, dev);
-
 	intr_status = device_readl(dev, ACTMON_DEV_INTR_STATUS);
 	dev_ctrl = device_readl(dev, ACTMON_DEV_CTRL);
 
+	avg_intr_mask = ACTMON_DEV_INTR_AVG_BELOW_WMARK |
+			ACTMON_DEV_INTR_AVG_ABOVE_WMARK;
+
+	if (intr_status & avg_intr_mask)
+		tegra_devfreq_update_avg_wmark(tegra, dev);
+
 	if (intr_status & ACTMON_DEV_INTR_CONSECUTIVE_UPPER) {
 		/*
 		 * new_boost = min(old_boost * up_coef + step, max_freq)
@@ -253,8 +390,6 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
 
 		if (dev->boost_freq >= tegra->max_freq)
 			dev->boost_freq = tegra->max_freq;
-		else
-			dev_ctrl |= ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_EN;
 	} else if (intr_status & ACTMON_DEV_INTR_CONSECUTIVE_LOWER) {
 		/*
 		 * new_boost = old_boost * down_coef
@@ -263,63 +398,37 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
 		dev->boost_freq = do_percent(dev->boost_freq,
 					     dev->config->boost_down_coeff);
 
-		dev_ctrl |= ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_EN;
-
 		if (dev->boost_freq < (ACTMON_BOOST_FREQ_STEP >> 1))
 			dev->boost_freq = 0;
-		else
-			dev_ctrl |= ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN;
 	}
 
-	if (dev->config->avg_dependency_threshold) {
-		if (dev->avg_count >= dev->config->avg_dependency_threshold)
-			dev_ctrl |= ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN;
-		else if (dev->boost_freq == 0)
-			dev_ctrl &= ~ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN;
+	if (intr_status & avg_intr_mask) {
+		/*
+		 * Once average watermark is hit, it means that the memory
+		 * activity changed significantly and thus boosting-up shall
+		 * be reset because EMC clock rate will be changed and
+		 * boosting will restart in this case.
+		 */
+		dev->boost_freq = 0;
 	}
 
-	device_writel(dev, dev_ctrl, ACTMON_DEV_CTRL);
+	/* no boosting => no need for consecutive-down interrupt */
+	if (dev->boost_freq == 0)
+		dev_ctrl &= ~ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN;
 
+	device_writel(dev, dev_ctrl, ACTMON_DEV_CTRL);
 	device_writel(dev, ACTMON_INTR_STATUS_CLEAR, ACTMON_DEV_INTR_STATUS);
 }
 
-static unsigned long actmon_cpu_to_emc_rate(struct tegra_devfreq *tegra,
-					    unsigned long cpu_freq)
-{
-	unsigned int i;
-	struct tegra_actmon_emc_ratio *ratio = actmon_emc_ratios;
-
-	for (i = 0; i < ARRAY_SIZE(actmon_emc_ratios); i++, ratio++) {
-		if (cpu_freq >= ratio->cpu_freq) {
-			if (ratio->emc_freq >= tegra->max_freq)
-				return tegra->max_freq;
-			else
-				return ratio->emc_freq;
-		}
-	}
-
-	return 0;
-}
-
-static void actmon_update_target(struct tegra_devfreq *tegra,
-				 struct tegra_devfreq_device *dev)
+static unsigned long actmon_update_target(struct tegra_devfreq *tegra,
+					  struct tegra_devfreq_device *dev)
 {
-	unsigned long cpu_freq = 0;
-	unsigned long static_cpu_emc_freq = 0;
-	unsigned int avg_sustain_coef;
-
-	if (dev->config->avg_dependency_threshold) {
-		cpu_freq = cpufreq_get(0);
-		static_cpu_emc_freq = actmon_cpu_to_emc_rate(tegra, cpu_freq);
-	}
+	unsigned long target_freq;
 
-	dev->target_freq = dev->avg_count / ACTMON_SAMPLING_PERIOD;
-	avg_sustain_coef = 100 * 100 / dev->config->boost_up_threshold;
-	dev->target_freq = do_percent(dev->target_freq, avg_sustain_coef);
-	dev->target_freq += dev->boost_freq;
+	target_freq = dev->avg_count / ACTMON_SAMPLING_PERIOD + dev->boost_freq;
+	target_freq = tegra_actmon_account_cpu_freq(tegra, dev, target_freq);
 
-	if (dev->avg_count >= dev->config->avg_dependency_threshold)
-		dev->target_freq = max(dev->target_freq, static_cpu_emc_freq);
+	return target_freq;
 }
 
 static irqreturn_t actmon_thread_isr(int irq, void *data)
@@ -351,8 +460,8 @@ static int tegra_actmon_rate_notify_cb(struct notifier_block *nb,
 				       unsigned long action, void *ptr)
 {
 	struct clk_notifier_data *data = ptr;
-	struct tegra_devfreq *tegra;
 	struct tegra_devfreq_device *dev;
+	struct tegra_devfreq *tegra;
 	unsigned int i;
 
 	if (action != POST_RATE_CHANGE)
@@ -360,12 +469,28 @@ static int tegra_actmon_rate_notify_cb(struct notifier_block *nb,
 
 	tegra = container_of(nb, struct tegra_devfreq, rate_change_nb);
 
-	tegra->cur_freq = data->new_rate / KHZ;
-
+	/*
+	 * EMC rate could change due to three reasons:
+	 *
+	 *    1. Average watermark hit
+	 *    2. Boosting overflow
+	 *    3. CPU freq change
+	 *
+	 * Once rate is changed, the consecutive watermarks need to be
+	 * updated in order for boosting to work properly and to avoid
+	 * unnecessary interrupts. Note that the consecutive range is set for
+	 * all of devices using the same rate, hence if CPU is doing much
+	 * less than the other memory clients, then its upper watermark will
+	 * be very high in comparison to the actual activity (lower watermark)
+	 * and thus unnecessary upper-interrupts will be suppressed.
+	 *
+	 * The average watermarks also should be updated because of 3.
+	 */
 	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++) {
 		dev = &tegra->devices[i];
 
-		tegra_devfreq_update_wmark(tegra, dev);
+		tegra_devfreq_update_avg_wmark(tegra, dev);
+		tegra_devfreq_update_wmark(tegra, dev, data->new_rate);
 	}
 
 	return NOTIFY_OK;
@@ -374,15 +499,14 @@ static int tegra_actmon_rate_notify_cb(struct notifier_block *nb,
 static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
 					  struct tegra_devfreq_device *dev)
 {
-	u32 val = 0;
-
-	dev->target_freq = tegra->cur_freq;
+	u32 val = 0, target_freq;
 
-	dev->avg_count = tegra->cur_freq * ACTMON_SAMPLING_PERIOD;
+	target_freq = clk_get_rate(tegra->emc_clock) / KHZ;
+	dev->avg_count = target_freq * ACTMON_SAMPLING_PERIOD;
 	device_writel(dev, dev->avg_count, ACTMON_DEV_INIT_AVG);
 
 	tegra_devfreq_update_avg_wmark(tegra, dev);
-	tegra_devfreq_update_wmark(tegra, dev);
+	tegra_devfreq_update_wmark(tegra, dev, target_freq);
 
 	device_writel(dev, ACTMON_COUNT_WEIGHT, ACTMON_DEV_COUNT_WEIGHT);
 	device_writel(dev, ACTMON_INTR_STATUS_CLEAR, ACTMON_DEV_INTR_STATUS);
@@ -469,13 +593,13 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
 	struct tegra_devfreq_device *actmon_dev;
 	unsigned long cur_freq;
 
-	cur_freq = READ_ONCE(tegra->cur_freq);
+	cur_freq = clk_get_rate(tegra->emc_clock);
 
 	/* To be used by the tegra governor */
 	stat->private_data = tegra;
 
 	/* The below are to be used by the other governors */
-	stat->current_frequency = cur_freq * KHZ;
+	stat->current_frequency = cur_freq;
 
 	actmon_dev = &tegra->devices[MCALL];
 
@@ -486,7 +610,7 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
 	stat->busy_time *= 100 / BUS_SATURATION_RATIO;
 
 	/* Number of cycles in a sampling period */
-	stat->total_time = ACTMON_SAMPLING_PERIOD * cur_freq;
+	stat->total_time = cur_freq / KHZ * ACTMON_SAMPLING_PERIOD;
 
 	stat->busy_time = min(stat->busy_time, stat->total_time);
 
@@ -505,6 +629,7 @@ static int tegra_governor_get_target(struct devfreq *devfreq,
 	struct devfreq_dev_status *stat;
 	struct tegra_devfreq *tegra;
 	struct tegra_devfreq_device *dev;
+	unsigned long dev_target_freq;
 	unsigned long target_freq = 0;
 	unsigned int i;
 	int err;
@@ -520,9 +645,9 @@ static int tegra_governor_get_target(struct devfreq *devfreq,
 	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++) {
 		dev = &tegra->devices[i];
 
-		actmon_update_target(tegra, dev);
+		dev_target_freq = actmon_update_target(tegra, dev);
 
-		target_freq = max(target_freq, dev->target_freq);
+		target_freq = max(target_freq, dev_target_freq);
 	}
 
 	*freq = target_freq * KHZ;
@@ -642,7 +767,6 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 		return rate;
 	}
 
-	tegra->cur_freq = clk_get_rate(tegra->emc_clock) / KHZ;
 	tegra->max_freq = rate / KHZ;
 
 	for (i = 0; i < ARRAY_SIZE(actmon_device_configs); i++) {
@@ -671,7 +795,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, tegra);
 
 	tegra->rate_change_nb.notifier_call = tegra_actmon_rate_notify_cb;
-	err = clk_notifier_register(tegra->emc_clock, &tegra->rate_change_nb);
+	err = clk_notifier_register(tegra->emc_clock,
+				    &tegra->rate_change_nb);
 	if (err) {
 		dev_err(&pdev->dev,
 			"Failed to register rate change notifier\n");
-- 
2.22.0


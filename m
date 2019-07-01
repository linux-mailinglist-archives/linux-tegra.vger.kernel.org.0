Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60A0D188C1
	for <lists+linux-tegra@lfdr.de>; Thu,  9 May 2019 13:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfEILLc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 9 May 2019 07:11:32 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40333 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfEILLc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 May 2019 07:11:32 -0400
Received: by mail-wm1-f68.google.com with SMTP id h11so2625696wmb.5
        for <linux-tegra@vger.kernel.org>; Thu, 09 May 2019 04:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7LulJJ0S3g9c4ZB5zK2P4vbeSt5R6AzVP5XZMwFs7gY=;
        b=Uu08UAicY4C7RZWDJG4+i1ZKr/KJka5pFaopy+U1CxXs+Eh+KBy4qT6U4w7Kc7OOk5
         ulsUhtabXTtR7s/lYGW8y3/4rSR21pquhpMtK+QZhXql286TgroEn7+li7k+haz/0EEs
         VqKFLLHDFHm2FDVTD71ND4frC3twwgmHuYdc3+1m1rPL5MnWMHmX+T5+IiBSeuroQnuq
         UZbVvBK+Gk/8luLs8JwUHpd8xAQ3RYTRCWOkhyZlXVipzEUfoGvcwMMEciM99q3K0yCz
         RuDsrWbJ3TkhUwVIKsDNp5FKT0iRydBTauCLixOhSHXRx6wiYDbkGOdcEJSjiPioeqHM
         PtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7LulJJ0S3g9c4ZB5zK2P4vbeSt5R6AzVP5XZMwFs7gY=;
        b=Rvw0ZtdFrADtujndmll288ZbHGWPkcXF5mzRf7C4k37ND5A8e2iBBxIgvuRuFrmhg8
         w4k5mpRxiz1jByeps4GAg8TOl2wzbAsZahF2JJZ3mBAUQaElws2d87ak30fTfPHofSDn
         +LNItAj3o3hQGEXb70rpYIxmCIogG84r/95YhJ/vgiedFvzi/ts/lv9yBrsgarvfji59
         HdBOS9bbquMZ07ClPl13CT8KxDbM/CZ1BrWDSxrokyNy7kt7hwVBJZxEZNCH/++OE04D
         hruS14jfefwAjswthyRg+JdSj1T/71WEdXxQiBKf4Rp7x+aFQRGqUOtQRiWDx0LYJPGg
         BhjQ==
X-Gm-Message-State: APjAAAUVYtAl3HnQy0eMUGFp9jHiM+03eoMjJ4sH8JJQS7l2pYaxhoFX
        JlGRRCV2cPIidc4HDQygZaj+qQ==
X-Google-Smtp-Source: APXvYqyCjZBLDKVms2JtpVsjruRm4gEOrgYhQPlRAok7YLCHVUQ+KuW5FLFfZbfVpQ4r1VUlW0md4g==
X-Received: by 2002:a1c:ed12:: with SMTP id l18mr2616089wmh.13.1557400290437;
        Thu, 09 May 2019 04:11:30 -0700 (PDT)
Received: from mai.irit.fr ([141.115.39.235])
        by smtp.gmail.com with ESMTPSA id z7sm2299778wme.26.2019.05.09.04.11.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 04:11:29 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Subject: [PATCH 03/15] clocksource/drivers/tegra: Rework for compensation of suspend time
Date:   Thu,  9 May 2019 13:10:36 +0200
Message-Id: <20190509111048.11151-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190509111048.11151-1-daniel.lezcano@linaro.org>
References: <7e786ba3-a664-8fd9-dd17-6a5be996a712@linaro.org>
 <20190509111048.11151-1-daniel.lezcano@linaro.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Joseph Lo <josephl@nvidia.com>

Since the clocksource framework has the support for suspend time
compensation. Re-work the driver to use that, so we can reduce the
duplicate code.

Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-tegra20.c | 63 +++++++++--------------------
 1 file changed, 20 insertions(+), 43 deletions(-)

diff --git a/drivers/clocksource/timer-tegra20.c b/drivers/clocksource/timer-tegra20.c
index fdb3d795a409..919b3568c495 100644
--- a/drivers/clocksource/timer-tegra20.c
+++ b/drivers/clocksource/timer-tegra20.c
@@ -60,9 +60,6 @@
 static u32 usec_config;
 static void __iomem *timer_reg_base;
 #ifdef CONFIG_ARM
-static void __iomem *rtc_base;
-static struct timespec64 persistent_ts;
-static u64 persistent_ms, last_persistent_ms;
 static struct delay_timer tegra_delay_timer;
 #endif
 
@@ -199,40 +196,30 @@ static unsigned long tegra_delay_timer_read_counter_long(void)
 	return readl(timer_reg_base + TIMERUS_CNTR_1US);
 }
 
+static struct timer_of suspend_rtc_to = {
+	.flags = TIMER_OF_BASE | TIMER_OF_CLOCK,
+};
+
 /*
  * tegra_rtc_read - Reads the Tegra RTC registers
  * Care must be taken that this funciton is not called while the
  * tegra_rtc driver could be executing to avoid race conditions
  * on the RTC shadow register
  */
-static u64 tegra_rtc_read_ms(void)
+static u64 tegra_rtc_read_ms(struct clocksource *cs)
 {
-	u32 ms = readl(rtc_base + RTC_MILLISECONDS);
-	u32 s = readl(rtc_base + RTC_SHADOW_SECONDS);
+	u32 ms = readl(timer_of_base(&suspend_rtc_to) + RTC_MILLISECONDS);
+	u32 s = readl(timer_of_base(&suspend_rtc_to) + RTC_SHADOW_SECONDS);
 	return (u64)s * MSEC_PER_SEC + ms;
 }
 
-/*
- * tegra_read_persistent_clock64 -  Return time from a persistent clock.
- *
- * Reads the time from a source which isn't disabled during PM, the
- * 32k sync timer.  Convert the cycles elapsed since last read into
- * nsecs and adds to a monotonically increasing timespec64.
- * Care must be taken that this funciton is not called while the
- * tegra_rtc driver could be executing to avoid race conditions
- * on the RTC shadow register
- */
-static void tegra_read_persistent_clock64(struct timespec64 *ts)
-{
-	u64 delta;
-
-	last_persistent_ms = persistent_ms;
-	persistent_ms = tegra_rtc_read_ms();
-	delta = persistent_ms - last_persistent_ms;
-
-	timespec64_add_ns(&persistent_ts, delta * NSEC_PER_MSEC);
-	*ts = persistent_ts;
-}
+static struct clocksource suspend_rtc_clocksource = {
+	.name	= "tegra_suspend_timer",
+	.rating	= 200,
+	.read	= tegra_rtc_read_ms,
+	.mask	= CLOCKSOURCE_MASK(32),
+	.flags	= CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_SUSPEND_NONSTOP,
+};
 #endif
 
 static int tegra_timer_common_init(struct device_node *np, struct timer_of *to)
@@ -385,25 +372,15 @@ static int __init tegra_init_timer(struct device_node *np)
 
 static int __init tegra20_init_rtc(struct device_node *np)
 {
-	struct clk *clk;
+	int ret;
 
-	rtc_base = of_iomap(np, 0);
-	if (!rtc_base) {
-		pr_err("Can't map RTC registers\n");
-		return -ENXIO;
-	}
+	ret = timer_of_init(np, &suspend_rtc_to);
+	if (ret)
+		return ret;
 
-	/*
-	 * rtc registers are used by read_persistent_clock, keep the rtc clock
-	 * enabled
-	 */
-	clk = of_clk_get(np, 0);
-	if (IS_ERR(clk))
-		pr_warn("Unable to get rtc-tegra clock\n");
-	else
-		clk_prepare_enable(clk);
+	clocksource_register_hz(&suspend_rtc_clocksource, 1000);
 
-	return register_persistent_clock(tegra_read_persistent_clock64);
+	return 0;
 }
 TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
 #endif
-- 
2.17.1


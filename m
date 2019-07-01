Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8038856C96
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Jun 2019 16:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbfFZOrf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 26 Jun 2019 10:47:35 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39179 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728269AbfFZOra (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jun 2019 10:47:30 -0400
Received: by mail-wr1-f67.google.com with SMTP id x4so3064218wrt.6
        for <linux-tegra@vger.kernel.org>; Wed, 26 Jun 2019 07:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Y/jkAn3vCT4++dqCh3VgpJih6azC2n9WMcpnAYjdo7g=;
        b=zCRa4KiGwJg3QYoLLuG4sg/cwzELVE1W9AdFPLYWqf58c2G9eBPP6k1fhC5QL3HePt
         NpSQzTw2sNBsZaQ9hHadaGUDhCFa0UYWILqelTzNejqzsMNGOO1bgWKRZbLRCB1xU5p1
         DUAHACuOvIui7p+sojRs7xQaMbN6b4teAHpJ81Ewji4F6oER3YeB8uqEAtZPb7ZiVn1a
         nnh3SeFzvIZSIZnytnRywS5RXNRct3E0MXR24xXzbBjk+lmG9eX/Diwjp2966XFuaLyx
         XZhjyqY3NCTub2mcttaig1fD3wW9bC2RLaS5lDdd5O7Vtc5LJNIskGkOBnWIIhaTrszi
         9CJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Y/jkAn3vCT4++dqCh3VgpJih6azC2n9WMcpnAYjdo7g=;
        b=A41NlbdsSktScAAUzpZCIW+bThkNf2k1RYI9Ng83oPnwRIvZsB4G4JWVNs5K98bsar
         8PB/dJqM5PY/vNFzMxxOOcEuP7JGDwxUB1fe8k3GT4a7DgNESQoUmGhA1j9/EIp8JR7e
         nL4HkkATfDKb+6cMyp0H8JudI9JL1IL5fXWW5IyfX36X0NI9SHBlebGGuO6OZBBxXE0+
         sAAqkRj6xLnnGD9PuzsT17odKIF3mMee+YJ0JQJ74+rUigF/u5l/6YK7ho8X13AEFpLU
         v3Q0tozjrH4tnW8hIL+aQ1cZkESo7l+QqBGz63ccV+9C4QD5a3FF4Fp3jdoGyhbZ59C1
         Wj3w==
X-Gm-Message-State: APjAAAVuPbCiadFZKRt8fWtIUAZMqCoCOp2ez/TuBo9CTyYuNdT/kCmM
        zveB1npkT1HpNzLH8lwJUUsC3TFznRA=
X-Google-Smtp-Source: APXvYqzsT+EllwSjAVLW5u50pIj2VwYxnsGDw07MjWP59b86AMovA52i7jADVBHYVrr3A7ZkyzE2tw==
X-Received: by 2002:adf:ce88:: with SMTP id r8mr4325686wrn.42.1561560448173;
        Wed, 26 Jun 2019 07:47:28 -0700 (PDT)
Received: from mai.imgcgcw.net (26.92.130.77.rev.sfr.net. [77.130.92.26])
        by smtp.gmail.com with ESMTPSA id h84sm2718557wmf.43.2019.06.26.07.47.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 07:47:27 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Subject: [PATCH 10/25] clocksource/drivers/tegra: Minor code clean up
Date:   Wed, 26 Jun 2019 16:46:36 +0200
Message-Id: <20190626144651.16742-10-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626144651.16742-1-daniel.lezcano@linaro.org>
References: <adba7d03-e9bd-9542-60bc-0f2d4874a40e@linaro.org>
 <20190626144651.16742-1-daniel.lezcano@linaro.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

Correct typo and use proper upper casing for acronyms in the comments,
use common style for error messages, prepend error messages with
"tegra-timer:", add error message for cpuhp_setup_state() failure and
clean up whitespaces in the code to fix checkpatch warnings.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-tegra20.c | 43 ++++++++++++++++-------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/clocksource/timer-tegra20.c b/drivers/clocksource/timer-tegra20.c
index e2ef6b8211a5..6a3704142f31 100644
--- a/drivers/clocksource/timer-tegra20.c
+++ b/drivers/clocksource/timer-tegra20.c
@@ -6,6 +6,8 @@
  *	Colin Cross <ccross@google.com>
  */
 
+#define pr_fmt(fmt)	"tegra-timer: " fmt
+
 #include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
@@ -21,13 +23,13 @@
 
 #include "timer-of.h"
 
-#define RTC_SECONDS            0x08
-#define RTC_SHADOW_SECONDS     0x0c
-#define RTC_MILLISECONDS       0x10
+#define RTC_SECONDS		0x08
+#define RTC_SHADOW_SECONDS	0x0c
+#define RTC_MILLISECONDS	0x10
 
-#define TIMERUS_CNTR_1US 0x10
-#define TIMERUS_USEC_CFG 0x14
-#define TIMERUS_CNTR_FREEZE 0x4c
+#define TIMERUS_CNTR_1US	0x10
+#define TIMERUS_USEC_CFG	0x14
+#define TIMERUS_CNTR_FREEZE	0x4c
 
 #define TIMER_PTV		0x0
 #define TIMER_PTV_EN		BIT(31)
@@ -48,7 +50,7 @@ static u32 usec_config;
 static void __iomem *timer_reg_base;
 
 static int tegra_timer_set_next_event(unsigned long cycles,
-					 struct clock_event_device *evt)
+				      struct clock_event_device *evt)
 {
 	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
 
@@ -169,15 +171,17 @@ static struct timer_of suspend_rtc_to = {
 
 /*
  * tegra_rtc_read - Reads the Tegra RTC registers
- * Care must be taken that this funciton is not called while the
+ * Care must be taken that this function is not called while the
  * tegra_rtc driver could be executing to avoid race conditions
  * on the RTC shadow register
  */
 static u64 tegra_rtc_read_ms(struct clocksource *cs)
 {
 	void __iomem *reg_base = timer_of_base(&suspend_rtc_to);
+
 	u32 ms = readl_relaxed(reg_base + RTC_MILLISECONDS);
 	u32 s = readl_relaxed(reg_base + RTC_SHADOW_SECONDS);
+
 	return (u64)s * MSEC_PER_SEC + ms;
 }
 
@@ -222,7 +226,7 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20)
 
 	to = this_cpu_ptr(&tegra_to);
 	ret = timer_of_init(np, to);
-	if (ret < 0)
+	if (ret)
 		goto out;
 
 	timer_reg_base = timer_of_base(to);
@@ -281,8 +285,7 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20)
 		cpu_to->clkevt.cpumask = cpumask_of(cpu);
 		cpu_to->clkevt.irq = irq_of_parse_and_map(np, idx);
 		if (!cpu_to->clkevt.irq) {
-			pr_err("%s: can't map IRQ for CPU%d\n",
-			       __func__, cpu);
+			pr_err("failed to map irq for cpu%d\n", cpu);
 			ret = -EINVAL;
 			goto out_irq;
 		}
@@ -292,8 +295,8 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20)
 				  IRQF_TIMER | IRQF_NOBALANCING,
 				  cpu_to->clkevt.name, &cpu_to->clkevt);
 		if (ret) {
-			pr_err("%s: cannot setup irq %d for CPU%d\n",
-				__func__, cpu_to->clkevt.irq, cpu);
+			pr_err("failed to set up irq for cpu%d: %d\n",
+			       cpu, ret);
 			irq_dispose_mapping(cpu_to->clkevt.irq);
 			cpu_to->clkevt.irq = 0;
 			goto out_irq;
@@ -312,11 +315,14 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20)
 	register_current_timer_delay(&tegra_delay_timer);
 #endif
 
-	cpuhp_setup_state(CPUHP_AP_TEGRA_TIMER_STARTING,
-			  "AP_TEGRA_TIMER_STARTING", tegra_timer_setup,
-			  tegra_timer_stop);
+	ret = cpuhp_setup_state(CPUHP_AP_TEGRA_TIMER_STARTING,
+				"AP_TEGRA_TIMER_STARTING", tegra_timer_setup,
+				tegra_timer_stop);
+	if (ret)
+		pr_err("failed to set up cpu hp state: %d\n", ret);
 
 	return ret;
+
 out_irq:
 	for_each_possible_cpu(cpu) {
 		struct timer_of *cpu_to;
@@ -329,6 +335,7 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20)
 	}
 out:
 	timer_of_cleanup(to);
+
 	return ret;
 }
 
@@ -352,8 +359,6 @@ static int __init tegra20_init_rtc(struct device_node *np)
 	if (ret)
 		return ret;
 
-	clocksource_register_hz(&suspend_rtc_clocksource, 1000);
-
-	return 0;
+	return clocksource_register_hz(&suspend_rtc_clocksource, 1000);
 }
 TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
-- 
2.17.1


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4F756C95
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Jun 2019 16:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbfFZOrd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 26 Jun 2019 10:47:33 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55338 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728286AbfFZOrd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jun 2019 10:47:33 -0400
Received: by mail-wm1-f68.google.com with SMTP id a15so2400506wmj.5
        for <linux-tegra@vger.kernel.org>; Wed, 26 Jun 2019 07:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wdZ7FecC0TRurfVLmuWoSlgUMuXVwscdG5MO2xNw/Ic=;
        b=t579sdMYVNudZHexTNI4IPGizIkbNQKDA+IU2XssndcB2dsFhiFL5x++LJga0MG6Sk
         bsdtLaklcZAatUYpwsAE2a0YTEdMKZcUr0ory80k+eeXAkEzdbcaCAGICSKfetzz8T5T
         rIopJiNV9agiYtFiTaVsHeUyN228aCUTOhdoTGfxhuICf76LhQiVGdNhPdzb7ip18Fw6
         1X5BSpAT7GbyKLNq4cqIx9RUIK1Y3kuIFDT3xg7xsAiP+0WXxg1hXueXysA3a5ZhKw1s
         EPQNllxcS15xjKgqCUYhtRAR1lgV6keRrWbS2wYDlBXR+tfrOrsQIyTscBmTrOmb/IDG
         qrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wdZ7FecC0TRurfVLmuWoSlgUMuXVwscdG5MO2xNw/Ic=;
        b=KQtjCojx2SY9TjkfLG/i7KyQmCgpsE/+L00p5rUP4yjOomWjY4r/Yy52Hawe/OcRQN
         P//u3Xb/ddWT7HM/+s8K3HfmCA5F6EtdtXwq9nFB2/Or+ZzEqc0M3cjHKU2gKLNA3c82
         rmqnN5/4egkEtw/JwtlWuA+iDA+V3nar7yIZ1LqBEKHjnqL1BHTQvWJRYCogrhF0FEQd
         rUTfypoW+7ZjdbexNBYv6HSAz9gUoSyoblNTfcZk64PxVoRMizDacSgxtXo2ATVoUkPu
         c8IGKn6xIXhMARHXHiq2nMfGBhV472LkvCN1G7BKkbQR++gh/tGQTN+viiSsJhICEZsa
         19VQ==
X-Gm-Message-State: APjAAAWcZZx7sDQX/Q4ULVRsl30Fm002k/wXBlENfAgMb5jrCCJruJjv
        JLVwMadC0uzvcgfL8Y3bLsLnww==
X-Google-Smtp-Source: APXvYqyy1OV9Yz61PFs8lU0X/N15FLwXCQNvvHOwhD+YKPKxiC3fsLnBv3dbWUcvK59w05Qw6eoEeg==
X-Received: by 2002:a1c:b707:: with SMTP id h7mr2968190wmf.45.1561560451162;
        Wed, 26 Jun 2019 07:47:31 -0700 (PDT)
Received: from mai.imgcgcw.net (26.92.130.77.rev.sfr.net. [77.130.92.26])
        by smtp.gmail.com with ESMTPSA id h84sm2718557wmf.43.2019.06.26.07.47.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 07:47:30 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Subject: [PATCH 12/25] clocksource/drivers/tegra: Lower clocksource rating for some Tegra's
Date:   Wed, 26 Jun 2019 16:46:38 +0200
Message-Id: <20190626144651.16742-12-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626144651.16742-1-daniel.lezcano@linaro.org>
References: <adba7d03-e9bd-9542-60bc-0f2d4874a40e@linaro.org>
 <20190626144651.16742-1-daniel.lezcano@linaro.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

Arch-timer is more preferable for a range of Tegra SoC generations as
it has higher precision and is not affect by any kind of problems.

Pointed-out-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-tegra20.c | 30 +++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-tegra20.c b/drivers/clocksource/timer-tegra20.c
index 6a3704142f31..ed1454000ea9 100644
--- a/drivers/clocksource/timer-tegra20.c
+++ b/drivers/clocksource/timer-tegra20.c
@@ -109,7 +109,6 @@ static DEFINE_PER_CPU(struct timer_of, tegra_to) = {
 
 	.clkevt = {
 		.name = "tegra_timer",
-		.rating = 460,
 		.features = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_PERIODIC,
 		.set_next_event = tegra_timer_set_next_event,
 		.set_state_shutdown = tegra_timer_shutdown,
@@ -219,7 +218,8 @@ static inline unsigned int tegra_irq_idx_for_cpu(int cpu, bool tegra20)
 	return TIMER10_IRQ_IDX + cpu;
 }
 
-static int __init tegra_init_timer(struct device_node *np, bool tegra20)
+static int __init tegra_init_timer(struct device_node *np, bool tegra20,
+				   int rating)
 {
 	struct timer_of *to;
 	int cpu, ret;
@@ -282,6 +282,7 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20)
 
 		cpu_to = per_cpu_ptr(&tegra_to, cpu);
 		cpu_to->of_base.base = timer_reg_base + base;
+		cpu_to->clkevt.rating = rating;
 		cpu_to->clkevt.cpumask = cpumask_of(cpu);
 		cpu_to->clkevt.irq = irq_of_parse_and_map(np, idx);
 		if (!cpu_to->clkevt.irq) {
@@ -341,13 +342,34 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20)
 
 static int __init tegra210_init_timer(struct device_node *np)
 {
-	return tegra_init_timer(np, false);
+	/*
+	 * Arch-timer can't survive across power cycle of CPU core and
+	 * after CPUPORESET signal due to a system design shortcoming,
+	 * hence tegra-timer is more preferable on Tegra210.
+	 */
+	return tegra_init_timer(np, false, 460);
 }
 TIMER_OF_DECLARE(tegra210_timer, "nvidia,tegra210-timer", tegra210_init_timer);
 
 static int __init tegra20_init_timer(struct device_node *np)
 {
-	return tegra_init_timer(np, true);
+	int rating;
+
+	/*
+	 * Tegra20 and Tegra30 have Cortex A9 CPU that has a TWD timer,
+	 * that timer runs off the CPU clock and hence is subjected to
+	 * a jitter caused by DVFS clock rate changes. Tegra-timer is
+	 * more preferable for older Tegra's, while later SoC generations
+	 * have arch-timer as a main per-CPU timer and it is not affected
+	 * by DVFS changes.
+	 */
+	if (of_machine_is_compatible("nvidia,tegra20") ||
+	    of_machine_is_compatible("nvidia,tegra30"))
+		rating = 460;
+	else
+		rating = 330;
+
+	return tegra_init_timer(np, true, rating);
 }
 TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_timer);
 
-- 
2.17.1


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30CD6338C9
	for <lists+linux-tegra@lfdr.de>; Mon,  3 Jun 2019 21:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfFCTE1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 3 Jun 2019 15:04:27 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37375 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbfFCTEZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Jun 2019 15:04:25 -0400
Received: by mail-lj1-f194.google.com with SMTP id 131so4744734ljf.4;
        Mon, 03 Jun 2019 12:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lQRtuyDNyV7dZwY09phwCLey90itYrHs73do7JB/dQA=;
        b=MXQ+RBFtOXNg/VRjjbgw8XBWSoPNfjHfE0PsR2TDj5a5pfsTeDLIl5RVtB2y4E4bYt
         LVlXPqfg9InuDP+DrFtOt5Mx0tFpQp5OLsWh4/Y4R1GotPV06Nd+bECYj21/4F7xZ/fD
         niLXBCpTy+DNJ2aP5FRL4cKB2HBjHdrvpbqUirdZRkbVJoYKvnPrJJWCCL8q3xsrAx3X
         aGwllE0HRSfrSwdWLyNfFSaq3E/7dhuzahk0El+iMjdKXBFSbtjg3Jw9Ao0jRLyTZmxG
         h0+XbzbmRJH09SDEVG0Xzg+cxvrZC6lSe8r+fqILygiFPc4txZ79BI5UQFVGlnGfSKrW
         I/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lQRtuyDNyV7dZwY09phwCLey90itYrHs73do7JB/dQA=;
        b=WsqW1CekkxG2ZXDgd9o9kxVsAyQSv5OaH0+cwWKCF9+c5kokeoRPNZyHOMyTewj+jf
         jYYD9MUbIjH3aI+36ChmquU9LytynChMca1z1W1CN9mspQ532Rlh0UxpPNr/d0LHTBRA
         ANV+xC+bqHteJ8fYWUaYsnMHbB65UEhC4mrlsarPEkHDh519hP4ZMSQBtRe8dryLvprf
         yixVGSIYfaRbWSiQcJtt0plty/ACqnrDH9lcFu/4OVIf8zU8AWCjRk7G4RPfJv7Sa5vf
         k1Sp/lPUd/KsJCnFKXzMkImL8QZsdtFrBuZjjVp71QB/O6BhusJZ43nNHjKVKr2VofjC
         nY4Q==
X-Gm-Message-State: APjAAAXmqMwxABP9mEqYlqEPOcX/AAiGlVrS0qNuE3KMG3P4xTzxHs8q
        6uG7/3g7hNc7xmv3i1X94jrLKYeD
X-Google-Smtp-Source: APXvYqwlQaCv2KcKz+y9O1+3AEczxnu64bEZRIR3+igJCJoXV4ZPjAqBhBuw4VQQuPPjXrUrHdZTGw==
X-Received: by 2002:a2e:8583:: with SMTP id b3mr14717192lji.136.1559588663943;
        Mon, 03 Jun 2019 12:04:23 -0700 (PDT)
Received: from localhost.localdomain ([94.29.35.141])
        by smtp.gmail.com with ESMTPSA id l22sm2768805ljb.39.2019.06.03.12.04.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 12:04:22 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/10] clocksource/drivers/tegra: Lower clocksource rating for some Tegra's
Date:   Mon,  3 Jun 2019 21:59:47 +0300
Message-Id: <20190603185948.30438-10-digetx@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603185948.30438-1-digetx@gmail.com>
References: <20190603185948.30438-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Arch-timer is more preferable for a range of Tegra SoC generations as
it has higher precision and is not affect by any kind of problems.

Pointed-out-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/timer-tegra20.c | 30 +++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-tegra20.c b/drivers/clocksource/timer-tegra20.c
index 1a3ee928e9a5..9406855781ff 100644
--- a/drivers/clocksource/timer-tegra20.c
+++ b/drivers/clocksource/timer-tegra20.c
@@ -107,7 +107,6 @@ static DEFINE_PER_CPU(struct timer_of, tegra_to) = {
 
 	.clkevt = {
 		.name = "tegra_timer",
-		.rating = 460,
 		.features = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_PERIODIC,
 		.set_next_event = tegra_timer_set_next_event,
 		.set_state_shutdown = tegra_timer_shutdown,
@@ -217,7 +216,8 @@ static inline unsigned int tegra_irq_idx_for_cpu(int cpu, bool tegra20)
 	return TIMER10_IRQ_IDX + cpu;
 }
 
-static int __init tegra_init_timer(struct device_node *np, bool tegra20)
+static int __init tegra_init_timer(struct device_node *np, bool tegra20,
+				   int rating)
 {
 	struct timer_of *to;
 	int cpu, ret;
@@ -280,6 +280,7 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20)
 
 		cpu_to = per_cpu_ptr(&tegra_to, cpu);
 		cpu_to->of_base.base = timer_reg_base + base;
+		cpu_to->clkevt.rating = rating;
 		cpu_to->clkevt.cpumask = cpumask_of(cpu);
 		cpu_to->clkevt.irq = irq_of_parse_and_map(np, idx);
 		if (!cpu_to->clkevt.irq) {
@@ -339,13 +340,34 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20)
 
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
2.21.0


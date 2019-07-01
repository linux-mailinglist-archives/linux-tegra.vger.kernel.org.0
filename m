Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7853D4A35B
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Jun 2019 16:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729389AbfFROEk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Jun 2019 10:04:40 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43623 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfFROEj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Jun 2019 10:04:39 -0400
Received: by mail-lf1-f68.google.com with SMTP id j29so9371640lfk.10;
        Tue, 18 Jun 2019 07:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UStQDGBIbRw+o+Dqy3P0eYDxpcISKuZis1Sl1FbafX8=;
        b=RPxmMbTOPcLqQg1Hr+WSf0nwKlYtrefWWyKMevAQUHGSTiUn7rz9hmMaoAjajXpyVt
         TGwlrw0hT5bDPsghDSOMs2zfEzMDk0YpPBAJ9znP/XBXObCxCz/vlRbWgetMcqlL3aac
         18itnZwLMGBS3VL8eJl6fPR0rLD+1IfH0/Uv/TiHYxeM65vzv1C5jhcgOAb+Twio1u4u
         7FLUZJq58PO4NtG4WSPkCqDYd+ksUtF8x1syiipODUjAPPgIFNzGmTWBcOBjT8SZhTFU
         0N8UHGmEwHaGCUfDaV4IzbtokxL7yl7H7mZbyjbnAqtyVoVf9hRfOcj+LvYHNIXQv3EA
         6z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UStQDGBIbRw+o+Dqy3P0eYDxpcISKuZis1Sl1FbafX8=;
        b=UUeKjDeDcMWzGTHfpaqsFoKWnpVKYZdu7PlVqirE08/IKV0wSn8UO1Nx/TrwPtoYKj
         ItORhcklNIWtANSf+Qhh9N3Tlb6Ip/xUU1benjdob7wg7NlyKzAag3do/1IhTLPZRiQi
         REFbmCKtDkt/Fm/4qCHY5P5jAiXeFdrz8E+DgZedW3dB2UVTfaI17W8tfjqdPXVY9jbl
         uUnlLeSOAcHbJip7BnoYvXNLNHaHR/EzrPps2m1lYDix9vJ7+Y6wSen2UhOsx35RYWhu
         GcNGoCKzzQ+LEymYdw4WuegVJwW+IAjjrsw2KaJIqNxAF3XsKrkIxGJFA/Ao2mplFasV
         xU9A==
X-Gm-Message-State: APjAAAXVDfUq2UygfiwIePrvW+JPUD6baZJZAr7NQo87wLm/85nSvQVZ
        bIhL2Bjs63ouWlxCpDUOsUM=
X-Google-Smtp-Source: APXvYqyrR8/B20wPjKesgsV525ItCFwgjVA7KeHqnnw38W69svkMVZ2/sZYP0xJLuJUxIyij+bgfcQ==
X-Received: by 2002:a19:c301:: with SMTP id t1mr60468781lff.137.1560866677530;
        Tue, 18 Jun 2019 07:04:37 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.gmail.com with ESMTPSA id q6sm2650538lji.70.2019.06.18.07.04.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 07:04:37 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/8] clocksource/drivers/tegra: Remove duplicated use of per_cpu_ptr
Date:   Tue, 18 Jun 2019 17:03:52 +0300
Message-Id: <20190618140358.13148-3-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190618140358.13148-1-digetx@gmail.com>
References: <20190618140358.13148-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

It was left unnoticed by accident, which means that the code could be
cleaned up a tad more.

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/timer-tegra.c | 42 ++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index 501071f09fa8..ff5a4ccb5d52 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -216,6 +216,19 @@ static inline unsigned int tegra_irq_idx_for_cpu(int cpu, bool tegra20)
 	return TIMER10_IRQ_IDX + cpu;
 }
 
+static inline unsigned long tegra_rate_for_timer(struct timer_of *to,
+						 bool tegra20)
+{
+	/*
+	 * TIMER1-9 are fixed to 1MHz, TIMER10-13 are running off the
+	 * parent clock.
+	 */
+	if (tegra20)
+		return 1000000;
+
+	return timer_of_rate(to);
+}
+
 static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 				   int rating)
 {
@@ -268,32 +281,27 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 
 	for_each_possible_cpu(cpu) {
 		struct timer_of *cpu_to = per_cpu_ptr(&tegra_to, cpu);
+		unsigned long flags = IRQF_TIMER | IRQF_NOBALANCING;
+		unsigned long rate = tegra_rate_for_timer(to, tegra20);
 		unsigned int base = tegra_base_for_cpu(cpu, tegra20);
 		unsigned int idx = tegra_irq_idx_for_cpu(cpu, tegra20);
+		unsigned int irq = irq_of_parse_and_map(np, idx);
 
-		/*
-		 * TIMER1-9 are fixed to 1MHz, TIMER10-13 are running off the
-		 * parent clock.
-		 */
-		if (tegra20)
-			cpu_to->of_clk.rate = 1000000;
-		else
-			cpu_to->of_clk.rate = timer_of_rate(to);
-
-		cpu_to = per_cpu_ptr(&tegra_to, cpu);
-		cpu_to->of_base.base = timer_reg_base + base;
-		cpu_to->clkevt.rating = rating;
-		cpu_to->clkevt.cpumask = cpumask_of(cpu);
-		cpu_to->clkevt.irq = irq_of_parse_and_map(np, idx);
-		if (!cpu_to->clkevt.irq) {
+		if (!irq) {
 			pr_err("failed to map irq for cpu%d\n", cpu);
 			ret = -EINVAL;
 			goto out_irq;
 		}
 
+		cpu_to->clkevt.irq = irq;
+		cpu_to->clkevt.rating = rating;
+		cpu_to->clkevt.cpumask = cpumask_of(cpu);
+		cpu_to->of_base.base = timer_reg_base + base;
+		cpu_to->of_clk.rate = rate;
+
 		irq_set_status_flags(cpu_to->clkevt.irq, IRQ_NOAUTOEN);
-		ret = request_irq(cpu_to->clkevt.irq, tegra_timer_isr,
-				  IRQF_TIMER | IRQF_NOBALANCING,
+
+		ret = request_irq(cpu_to->clkevt.irq, tegra_timer_isr, flags,
 				  cpu_to->clkevt.name, &cpu_to->clkevt);
 		if (ret) {
 			pr_err("failed to set up irq for cpu%d: %d\n",
-- 
2.22.0


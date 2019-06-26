Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6C256CBB
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Jun 2019 16:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbfFZOro (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 26 Jun 2019 10:47:44 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33951 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727957AbfFZOrn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jun 2019 10:47:43 -0400
Received: by mail-wr1-f67.google.com with SMTP id k11so3097667wrl.1
        for <linux-tegra@vger.kernel.org>; Wed, 26 Jun 2019 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yqfHGm0TnB/EluOWXQT4ZbDAqP2xMCI6PrNJ2MlYeVk=;
        b=a71rNY30tMc88OSz/m3t84f2lUVWT7mZhl/MxOCDBStOMFmcmyp+0EeBl0cq5GewFx
         VUaTobcEMFxs9V5fU+/dfPBCEVA3H39ox6+4QXJDvLk2FzCwVdIe/oKS7NXNgU70uEcB
         JbJNTzlwSOxEQlywVhrYG4TZaipPcxo0eTTIsoSXbepbQkzyYCc62cVLAJSZXgRmT7qj
         lGn7oceuBdOThW6CENUrTrjdjj576c4AQv2Puhoqm1u2vM2lDtTo1F8QdoMQ68ovHssX
         KNaXaXJ2WH6YTa+jMkqI/RdqOV+m/HHrJbuCtSGPfAWFXvN+Qpk3UgZNQ5qGLlCjHuh1
         8zBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yqfHGm0TnB/EluOWXQT4ZbDAqP2xMCI6PrNJ2MlYeVk=;
        b=Ltd5JrtNeSBH1H0sF7RSeM8a9Nihh3mRMysxPJ/qIA4glwHvh8Wlxhxe73Y3LXSgD1
         uE78rusABzvsdH1E0ILourtF2YC3szTh2PPVH5hY3pBkpBi3/7kGLuHkITMVYjD0pgG8
         NwB1QlNwz2DG0QYc4ILDoIsUPb9mm0TaP9h5CNweh28SGLhzM7o5sJpWM7GgJ0vkBfCw
         ZFjy8FO9aNJ9Bcify9xOxIcl7f8RUAIyA/tTJOic28N+M1tEiJ0CvYGfpvQTt6oD9C7o
         hTY0SFdEKVgiuOiSMK6Ve/Ypnd8GxfwCtb8CNmaFWKowPe1Dcl9nfow+6WBGvqOzH5c1
         6PoQ==
X-Gm-Message-State: APjAAAV4N+R0b8FxPMgu268r02r6FhShENkXmeV16QuGE/Md53k3cUCb
        uqccQodKbmue8e1pkVhlsEfQpw==
X-Google-Smtp-Source: APXvYqwiZIlhM0IIhYBQ3uOr0VubIIIk4zq48f0S/j2B8N8PPz8mVyq7XGXacPm5ZFILJYSrbtW2pw==
X-Received: by 2002:a5d:53d2:: with SMTP id a18mr4156921wrw.98.1561560461122;
        Wed, 26 Jun 2019 07:47:41 -0700 (PDT)
Received: from mai.imgcgcw.net (26.92.130.77.rev.sfr.net. [77.130.92.26])
        by smtp.gmail.com with ESMTPSA id h84sm2718557wmf.43.2019.06.26.07.47.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 07:47:40 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Subject: [PATCH 17/25] clocksource/drivers/tegra: Remove duplicated use of per_cpu_ptr
Date:   Wed, 26 Jun 2019 16:46:43 +0200
Message-Id: <20190626144651.16742-17-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626144651.16742-1-daniel.lezcano@linaro.org>
References: <adba7d03-e9bd-9542-60bc-0f2d4874a40e@linaro.org>
 <20190626144651.16742-1-daniel.lezcano@linaro.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

It was left unnoticed by accident, which means that the code could be
cleaned up a tad more.

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-tegra.c | 42 ++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index 880ba67ca7ee..f172a57cc5fe 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -218,6 +218,19 @@ static inline unsigned int tegra_irq_idx_for_cpu(int cpu, bool tegra20)
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
@@ -270,32 +283,27 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 
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
2.17.1


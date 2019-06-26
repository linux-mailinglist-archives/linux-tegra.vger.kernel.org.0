Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67F3C56CC1
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Jun 2019 16:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbfFZOsl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 26 Jun 2019 10:48:41 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55360 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728338AbfFZOro (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jun 2019 10:47:44 -0400
Received: by mail-wm1-f68.google.com with SMTP id a15so2401164wmj.5
        for <linux-tegra@vger.kernel.org>; Wed, 26 Jun 2019 07:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4IAtyPcsTx9RzQZd9Z8HcSfwjywt5ILpbuYeShXpAGo=;
        b=DxmMYVPxorhNSwCea1YEH3jLyk7q+WYZ272bx3DX92dbN34lb4ZaCbJVBPbx6UP9ry
         lPqdhVvv6Lu+idmdX+4KTIVPn/oUpdhdm0BOyz18hrY8vM3NmSrvPrraDlX9JuEOGFwn
         fxK/mAN/wJTSlAtJ/HXVqeVgbjN6zzHSMSz+Wd6OwBoul9r5M05mJOXKYGKPDgELs6T8
         KL3UG+ajbmt8Bsa0lE39vWB4j+ldDQSWK5wwSazT7wPZ82FjjA1yMUvZX4Vq27NePpBH
         nWdPRfQ1s4gQPDz1SSyRQRSQ5Lzx/56rQ05HOsA9KYJGxYO7Brl8PGKvPMY/isD7tVr8
         g2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4IAtyPcsTx9RzQZd9Z8HcSfwjywt5ILpbuYeShXpAGo=;
        b=Lp2xI+JhtQ+7B7pQKf5Q43GL5M96E+k+QH8CR4L59VYJ3OAKxIp+FrVThtPSgy1KRq
         5Kd5EhR68l00FVhJY5sQQQ4GzfUulSzsyfvoUb1PH77FrDVBQ0GbaUcB7cN4tFYMRu/G
         zu6iuxLft2pCVzBl2NC/wS+CWLjq7l5mMPDuuYptYzzUWmRY9fhLsCD/2H/AxQWWfX6b
         5y7oSx/8Xj1Unnuebi8sjLmnWA3zu2Cew3gXoc1/XLhLvIol+ALOEUwmwnYBfKQYYWo/
         GnbRIBrwhB/eU0rbFdJXs8wXUyOp7OTPYE3c3PWfDKfPBFrIMXH11FjQRxS+KGSQMl/Y
         EGmg==
X-Gm-Message-State: APjAAAXPPAcyyakTwSlR3vp1FbSOwqN8Jd1ez1RwsX0Ah4os2G6922q1
        KXisukZzP3Ti2Go+2rzWd0l2ag==
X-Google-Smtp-Source: APXvYqyNUdSNruHeIloQDC0KHi0G/o6V9M2IYzlQ9dG2v7llKyzHCqfJ6mQZb2Tj/42yd3EExmmzTg==
X-Received: by 2002:a1c:ef10:: with SMTP id n16mr2805661wmh.134.1561560462620;
        Wed, 26 Jun 2019 07:47:42 -0700 (PDT)
Received: from mai.imgcgcw.net (26.92.130.77.rev.sfr.net. [77.130.92.26])
        by smtp.gmail.com with ESMTPSA id h84sm2718557wmf.43.2019.06.26.07.47.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 07:47:41 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Subject: [PATCH 18/25] clocksource/drivers/tegra: Set and use timer's period
Date:   Wed, 26 Jun 2019 16:46:44 +0200
Message-Id: <20190626144651.16742-18-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626144651.16742-1-daniel.lezcano@linaro.org>
References: <adba7d03-e9bd-9542-60bc-0f2d4874a40e@linaro.org>
 <20190626144651.16742-1-daniel.lezcano@linaro.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

The of_clk structure has a period field that is set up initially by
timer_of_clk_init(), that period value need to be adjusted for a case of
TIMER1-9 that are running at a fixed rate that doesn't match the clock's
rate. Note that the period value is currently used only by some of the
clocksource drivers internally and hence this is just a minor cleanup
change that doesn't fix anything.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-tegra.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index f172a57cc5fe..41257f89a216 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -73,9 +73,9 @@ static int tegra_timer_shutdown(struct clock_event_device *evt)
 static int tegra_timer_set_periodic(struct clock_event_device *evt)
 {
 	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
+	unsigned long period = timer_of_period(to_timer_of(evt));
 
-	writel_relaxed(TIMER_PTV_EN | TIMER_PTV_PER |
-		       ((timer_of_rate(to_timer_of(evt)) / HZ) - 1),
+	writel_relaxed(TIMER_PTV_EN | TIMER_PTV_PER | (period - 1),
 		       reg_base + TIMER_PTV);
 
 	return 0;
@@ -299,6 +299,7 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 		cpu_to->clkevt.rating = rating;
 		cpu_to->clkevt.cpumask = cpumask_of(cpu);
 		cpu_to->of_base.base = timer_reg_base + base;
+		cpu_to->of_clk.period = rate / HZ;
 		cpu_to->of_clk.rate = rate;
 
 		irq_set_status_flags(cpu_to->clkevt.irq, IRQ_NOAUTOEN);
-- 
2.17.1


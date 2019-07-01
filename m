Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7887D56C9D
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Jun 2019 16:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728350AbfFZOrs (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 26 Jun 2019 10:47:48 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53195 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728360AbfFZOrs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jun 2019 10:47:48 -0400
Received: by mail-wm1-f66.google.com with SMTP id s3so2402923wms.2
        for <linux-tegra@vger.kernel.org>; Wed, 26 Jun 2019 07:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=v71fsQ7QyhP31JuRKVVsI8LiqKCJEYn7OMik1mGoLt0=;
        b=Nqrwya3TRyYnvJF3BQnilU92ZO48VVczT3CW9qcki1wMMC070R130zAjj4vWi72UUA
         aF6EIxrsr6nTpaGj2OQnsR9EC3Fg1DkCqBbRXNqDeiBtef+8IqQHuFV0FRLYuozla0dD
         +DgdswZjhqmGsad9IhlqOoJGbaG96atZOLESva79eNieLVNyUtW48IWgy9pw1ob7viTf
         4gTZj1d2C0Rv/gikCOyGn/0Ckx6311/9a+h3HrnQ4xoUQUtrbOTydqtg/bXtOJu82oNu
         7o7DE3NGslZ47KvK/yKDfRfxVcTXlYzBMRvCfODSU+TIDXTV8jWrXM0z5WlEVyhM/DtU
         wCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=v71fsQ7QyhP31JuRKVVsI8LiqKCJEYn7OMik1mGoLt0=;
        b=p4jD5sXOAzGbt73NENarYTlP4E7xzhNOY/hkCMKqTG2chAi4wWUrwqpqipj8sadmDk
         L5VFdj4qKXHqam/JWGbcjGD3DIYXRklXK81XuIo8/HdP6npUKnbJksqXG7gYooTd7UBx
         hcc1TcDL4fWQyrlU+C0839NsJ4FlJma+HsxnR3HYqwbLYSStJZ5RU5d1utq8cQLJBO/x
         TL5Vz8ZNUGMYRYpCO5/QUala3V0UP3M9R+3C7ZDDgEt2HbsyY0DqMPWYsfreDEyVeCQk
         DUu0OqH9n802OGiOG28GgPcUYT8+X5I6VxqxGKkmF8rWvNTWSkecdeFpK/3SxAuV/iRG
         a4Vg==
X-Gm-Message-State: APjAAAWZBtyrjGldl2CEgF/07c1muxxspV88GjhZdld6B6YJMpgjHwGR
        j6qNxBakFy3UqNL47l2OqW7R5w==
X-Google-Smtp-Source: APXvYqynXaSxwzqZFYAA9jYXWlOtz58xh3TiXT9jAlfRs+jFVS5cBmnHG9QBgPNkMiFQIpEZ5XKzAw==
X-Received: by 2002:a05:600c:228b:: with SMTP id 11mr3103332wmf.26.1561560465957;
        Wed, 26 Jun 2019 07:47:45 -0700 (PDT)
Received: from mai.imgcgcw.net (26.92.130.77.rev.sfr.net. [77.130.92.26])
        by smtp.gmail.com with ESMTPSA id h84sm2718557wmf.43.2019.06.26.07.47.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 07:47:44 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Subject: [PATCH 20/25] clocksource/drivers/tegra: Add verbose definition for 1MHz constant
Date:   Wed, 26 Jun 2019 16:46:46 +0200
Message-Id: <20190626144651.16742-20-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626144651.16742-1-daniel.lezcano@linaro.org>
References: <adba7d03-e9bd-9542-60bc-0f2d4874a40e@linaro.org>
 <20190626144651.16742-1-daniel.lezcano@linaro.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

Convert all 1MHz literals to a verbose constant for better readability.

Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-tegra.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index f7a09d88dacb..cc90f22c559b 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -46,6 +46,8 @@
 #define TIMER1_IRQ_IDX		0
 #define TIMER10_IRQ_IDX		10
 
+#define TIMER_1MHz		1000000
+
 static u32 usec_config;
 static void __iomem *timer_reg_base;
 
@@ -160,7 +162,7 @@ static unsigned long tegra_delay_timer_read_counter_long(void)
 
 static struct delay_timer tegra_delay_timer = {
 	.read_current_timer = tegra_delay_timer_read_counter_long,
-	.freq = 1000000,
+	.freq = TIMER_1MHz,
 };
 #endif
 
@@ -226,7 +228,7 @@ static inline unsigned long tegra_rate_for_timer(struct timer_of *to,
 	 * parent clock.
 	 */
 	if (tegra20)
-		return 1000000;
+		return TIMER_1MHz;
 
 	return timer_of_rate(to);
 }
@@ -315,11 +317,11 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 		}
 	}
 
-	sched_clock_register(tegra_read_sched_clock, 32, 1000000);
+	sched_clock_register(tegra_read_sched_clock, 32, TIMER_1MHz);
 
 	ret = clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
-				    "timer_us", 1000000,
-				    300, 32, clocksource_mmio_readl_up);
+				    "timer_us", TIMER_1MHz, 300, 32,
+				    clocksource_mmio_readl_up);
 	if (ret)
 		pr_err("failed to register clocksource: %d\n", ret);
 
-- 
2.17.1


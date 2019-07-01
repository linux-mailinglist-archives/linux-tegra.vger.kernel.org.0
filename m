Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32E104A34C
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Jun 2019 16:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729501AbfFROEo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Jun 2019 10:04:44 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39822 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729412AbfFROEm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Jun 2019 10:04:42 -0400
Received: by mail-lf1-f65.google.com with SMTP id p24so9391658lfo.6;
        Tue, 18 Jun 2019 07:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jbSwj9tUYUHF48lpxbApn6xo6/PnzEwRmK2D71mFg54=;
        b=jpqi7QOh3MeuEJ43NFXnswv0GgO4DpujFqguQy7sKDOALjc49PLGlKrghoM+KZQtaR
         CnoZSOa5cBcT+5x6mIdDiGr74pPXaQB1hhXO+X1V5uOFrREJpEjitv1mICyq0KmyiurX
         CVjMcELcvsgwmwmH13glCy8yL8H5LtqdQpS0bdirsadj+48nZUsChcW1KfpoSdOlJ2qE
         1RrAczWpSYp58EHj9eGcqdIUfPCRMfYDPkHWXAl+4nQFrKbJThLtGPtv50mjjzvnLGTk
         pl3mZjCu6gkR/I6vpAeR9jgkxUk6xz5E73wL5E8CFFxoYLMGJnBFQMN2wqTiEGBS3XwG
         4afA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jbSwj9tUYUHF48lpxbApn6xo6/PnzEwRmK2D71mFg54=;
        b=LP3cCwjlI0NVPMpCCuxj+AX0LY98vqlblVFmrJxGqnHJObF/N+D1JI8WeA4gODzmnp
         YnWGpYg1ABJoyakoZWRUyWbn5f5th1QQWYTpQuDTtqPza3OxHBm7gpQydq33qa1O1FOQ
         cVE+1fkYfrJw3a0ImCC4CkYAdyLbxKqCG2PpL7k7b69iuJAgw2nJGD1zP5DMuSu8HSYu
         RyLTVuhvnTA4sq4hkGjhCnAlsuCpI5rQO7/ziBKk9Itf5Y65gpJP1+XVRuBZE3faFb36
         Nt9egUaGBnqs7TDh4dSLU0+05gN3R4HLTbS9JOKnmwyk+PCYdzhZdLvY0+4DZVZztc/E
         OmGw==
X-Gm-Message-State: APjAAAX5HoTZbN++enrMERvR4g+t6/0Qt+nUxDQ8/fQQ6eaUBWZwgdgi
        fHOX+YN8+MOrZBPvbr5l6Kk2KaG8
X-Google-Smtp-Source: APXvYqwAfHaV5/YPnj9tSQVq+uqrTgr3R5Kl/tYaSgQZA4pTCu3nAW7MeK0ZO8ZAqIhDeFNX2p/B2g==
X-Received: by 2002:ac2:5310:: with SMTP id c16mr58074870lfh.119.1560866680518;
        Tue, 18 Jun 2019 07:04:40 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.gmail.com with ESMTPSA id q6sm2650538lji.70.2019.06.18.07.04.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 07:04:40 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/8] clocksource/drivers/tegra: Add verbose definition for 1MHz constant
Date:   Tue, 18 Jun 2019 17:03:55 +0300
Message-Id: <20190618140358.13148-6-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190618140358.13148-1-digetx@gmail.com>
References: <20190618140358.13148-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert all 1MHz literals to a verbose constant for better readability.

Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/timer-tegra.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index 3afa66c6730b..ddf5531c48a9 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -44,6 +44,8 @@
 #define TIMER1_IRQ_IDX		0
 #define TIMER10_IRQ_IDX		10
 
+#define TIMER_1MHz		1000000
+
 static u32 usec_config;
 static void __iomem *timer_reg_base;
 
@@ -158,7 +160,7 @@ static unsigned long tegra_delay_timer_read_counter_long(void)
 
 static struct delay_timer tegra_delay_timer = {
 	.read_current_timer = tegra_delay_timer_read_counter_long,
-	.freq = 1000000,
+	.freq = TIMER_1MHz,
 };
 #endif
 
@@ -224,7 +226,7 @@ static inline unsigned long tegra_rate_for_timer(struct timer_of *to,
 	 * parent clock.
 	 */
 	if (tegra20)
-		return 1000000;
+		return TIMER_1MHz;
 
 	return timer_of_rate(to);
 }
@@ -313,11 +315,11 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
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
2.22.0


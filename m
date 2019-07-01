Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6082056CAF
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Jun 2019 16:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbfFZOsa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 26 Jun 2019 10:48:30 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39964 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728368AbfFZOrt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jun 2019 10:47:49 -0400
Received: by mail-wr1-f68.google.com with SMTP id p11so3065697wre.7
        for <linux-tegra@vger.kernel.org>; Wed, 26 Jun 2019 07:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JJjc1JQr3nhAuAaXUtH5dZp0geSFnyJ4aiNQzKjFRos=;
        b=SE0BjstOMK/odoLOHXMPQOO9gdXALfQsZWWqOLTLPHSVLSuGlYwN1oKzgxTyxImX5j
         d2xbYIRU58sAKJJ9lyP6oYLymRwHdnvCm8j1JjmUKESOLfHST5IrxCIKDJl2UieHTunP
         PRlvQJUSIZbCwWwwuDoJ9+NLBhQ1p/d1Pl2w+oNTBBJZQ6x8Ys/qlsv+qDeTJ/uQk7KB
         GOyOZv7c7MOnVo+4f8cFPLLD1G5PIXlDI56a+MQduJEb2gMFs5yFfyOeqCTCq76CDxcI
         jhHf6Ery9blBEbtUxXdBpUuIjyXW/kCuvxE6DiHVioqlZamtBcXpzJ7zlwHGos/xH5A1
         xS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JJjc1JQr3nhAuAaXUtH5dZp0geSFnyJ4aiNQzKjFRos=;
        b=DDW2J9BrjQSNBne0snbiLQoDS6twJmZ+qIreOy4MONEAoIPyIN3cKk+5vO8CBDet6l
         q68k0ZclKN6Lcj74eQCa61qUW/wyGYZQLUj7mgRSyAIxeDDeBCLHILHCJNH8KopdUpBS
         2kKpqHOa9neRam3ic9dtoYuI6FK5lzxhPmsk5HnoNcFDVUMUnap0kG8yROrvBTxHdIOV
         QJJBjYRRa97z6XBJ0kxjhqbKqbqB5J7vh6g2yOBIDmCTYk/qT4mx/vXBy2V1ZGOWYd7D
         87clftvx7OASV+11EcboOd7c2QV2qRQWa8k+WnPv8s2kcN+JfR60fKKKZy569g18XVWE
         qsFA==
X-Gm-Message-State: APjAAAVyGKfa5TEx253D63H6Qrfzzi8QZTXoGaMMSQkomRo64tCvMNjY
        ZgrFbNNETzJxnw/mfPHWoJ/VAA==
X-Google-Smtp-Source: APXvYqyxEgDaR8PechUZppgNIlEgcO4mmIWW8DDVfGD7qzqiOIaUPSy/TqVv7qajfeQPaYi9BFKBJQ==
X-Received: by 2002:a5d:4a43:: with SMTP id v3mr4116991wrs.151.1561560467437;
        Wed, 26 Jun 2019 07:47:47 -0700 (PDT)
Received: from mai.imgcgcw.net (26.92.130.77.rev.sfr.net. [77.130.92.26])
        by smtp.gmail.com with ESMTPSA id h84sm2718557wmf.43.2019.06.26.07.47.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 07:47:46 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Subject: [PATCH 21/25] clocksource/drivers/tegra: Restore base address before cleanup
Date:   Wed, 26 Jun 2019 16:46:47 +0200
Message-Id: <20190626144651.16742-21-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626144651.16742-1-daniel.lezcano@linaro.org>
References: <adba7d03-e9bd-9542-60bc-0f2d4874a40e@linaro.org>
 <20190626144651.16742-1-daniel.lezcano@linaro.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

We're adjusting the timer's base for each per-CPU timer to point to the
actual start of the timer since device-tree defines a compound registers
range that includes all of the timers. In this case the original base
need to be restore before calling iounmap to unmap the proper address.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index cc90f22c559b..8e70f38f1898 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -347,6 +347,8 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 			irq_dispose_mapping(cpu_to->clkevt.irq);
 		}
 	}
+
+	to->of_base.base = timer_reg_base;
 out:
 	timer_of_cleanup(to);
 
-- 
2.17.1


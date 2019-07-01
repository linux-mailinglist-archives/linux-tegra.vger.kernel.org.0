Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE2533B9F2
	for <lists+linux-tegra@lfdr.de>; Mon, 10 Jun 2019 18:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387674AbfFJQsa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 10 Jun 2019 12:48:30 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45176 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387631AbfFJQs3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 Jun 2019 12:48:29 -0400
Received: by mail-ed1-f67.google.com with SMTP id a14so13523550edv.12;
        Mon, 10 Jun 2019 09:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BxXKYRWk7wLff/X0PCdAhA7tlHzWZaCttQ0fF+vhvTg=;
        b=Xdj5HEagIq9at0zndmhl0YU/6tSpCliQTx7V5rV0vEAO6AyOd8Rju8GO/6Up3Agtoz
         GwdAYJOGiQn5SNwnqbEOzfgidEIZzlRNwZ7/GUI1xnZbbXQgWFiedR+sfem0+w7JpExR
         mKBIKtJyfhrwiXZwnXoIGelLqkepp5Fz8oTTjRXerL3N7E9z4ay6WYKoZbM2J7eVc3km
         S1AOKRDysxidqcmk6P+3Q1M1A64U1PRkVJ87Zx9BbACL1dfQoAUwbW6CJdLoXwMcgiY0
         +tQ7sJ+cmjm0J0UvaD3IYaS5B5QM/KLfzmXSaX/99DDiO5AZYRMVViIu5SDBGWr+SjV5
         1aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BxXKYRWk7wLff/X0PCdAhA7tlHzWZaCttQ0fF+vhvTg=;
        b=Lvwyoh6kAY4tprQxCOcRJPNSfWDNnwLXcg+s0fxiOvF9A8xI34aGFT3IsSip7MaXXA
         48xW0+JfquE9F4cLD4HsqwTG0CoICpIlhDnuwhhD3erQ7W+vmTCB3fHZf2hwM5hT44vA
         Cw61Gw6cPVKEcR2AyRBKkhVkor5ZJ2vANddF8JaUC0RmU/yibILTUewoadbS3ScEWoCo
         65lHTZwjqSS7L5t8rQWCZsYQHK0qid+G4jZRHiErK5Haic7CFIjp8KL8NnSd2JShSzdq
         vaLKPYjppLObQXfYTKHof4xBbkR/+EN3jq7lKk9twbIx7GgAA3fBIxIceNS2mvAtC/Gs
         MP9g==
X-Gm-Message-State: APjAAAV2BGQr6Zzt94b6OHVeGmay4YHt5xZaaQfCzffUFVoAillIFiLi
        obfzUsjlwCdQ7VZfqNj30z8=
X-Google-Smtp-Source: APXvYqxcIZXx5c5l3eAVsYrhZtfTvMKVzaWiRk2WfamNhsAjGYdWWZqiILUTGnjekHyXFLf0vJCY6A==
X-Received: by 2002:a17:906:1f44:: with SMTP id d4mr50587328ejk.195.1560185307551;
        Mon, 10 Jun 2019 09:48:27 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.gmail.com with ESMTPSA id a9sm3075799edc.44.2019.06.10.09.48.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 09:48:27 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] clocksource/drivers/tegra: Restore base address before cleanup
Date:   Mon, 10 Jun 2019 19:44:00 +0300
Message-Id: <20190610164400.11830-7-digetx@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190610164400.11830-1-digetx@gmail.com>
References: <20190610164400.11830-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

We're adjusting the timer's base for each per-CPU timer to point to the
actual start of the timer since device-tree defines a compound registers
range that includes all of the timers. In this case the original base
need to be restore before calling iounmap to unmap the proper address.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/timer-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index 2a428fdf702f..7be91db98bd7 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -345,6 +345,8 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 			irq_dispose_mapping(cpu_to->clkevt.irq);
 		}
 	}
+
+	to->of_base.base = timer_reg_base;
 out:
 	timer_of_cleanup(to);
 
-- 
2.21.0


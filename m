Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A066756CBA
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Jun 2019 16:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbfFZOrm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 26 Jun 2019 10:47:42 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45228 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728323AbfFZOrl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jun 2019 10:47:41 -0400
Received: by mail-wr1-f67.google.com with SMTP id f9so3032201wre.12
        for <linux-tegra@vger.kernel.org>; Wed, 26 Jun 2019 07:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OvrcN7nx43BK8pLnR/sB9l6LAwke86j5KsajSpQYjKA=;
        b=mCICVFSvfWhpDZ5YmmaELz/zznaIpGcdfs8FZgdT3WtG7W8KAiTfLtZ9jZdOgrISVo
         06sq+INZVl02rS6ESmHNfcVirq9QXHHBsVLAt9ufDEuMGzWjJdMooqDDjF+oP1nLwNvc
         df99uupjlfwafO/77yL7yLRY+3lDXv4ow/Y4Y+nrLLT1cAr1jkRedOXcaDEDLXnzamnQ
         inQuHVSlrvWYANKddsP7msozwi04FuIDExLqKpZOaNVCfOZ11oNAUlQVNQZa/tUX9ohm
         1Xek+XJ5eNxXbPec6qESpuHBIak//k3MfxyIXVczUbtMVIkOFV/bdE3i2sY3Jx+56+7N
         1aBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OvrcN7nx43BK8pLnR/sB9l6LAwke86j5KsajSpQYjKA=;
        b=ikkeSonK6DSV2CVcZpDltfinFXjpRSKbb74VVj4R3FuZHdd/Ucio01erogy8VG/aYN
         fs5DqjpzvfBC7zaXf9BBdC8dl//OkBBOqdBoIxDAzfmZF+PXQrhxAWKLtf57l1YjJW0p
         AlyTZMJT9Xe/+IFGtnQrF7YkkYx+1ABDThpfFnxgEt9vz0yw/VTRLsgbIDEj7RRocr7a
         9QDONCheOm4i1YAFWIWNoin0YYWrrgSiTyxx5H/Vd87T/dOkf5+ChnxhoQ4UjdoiNwMl
         /gHk4DYKRGCzVw6lWE9eExEpxwaHq3J3y1G06elyGJDCyvmzWMvGBKXB+/aadRSz3ATV
         x8sQ==
X-Gm-Message-State: APjAAAUva/SIFlMMbvgqb89Ry9fuuQpJMwNPZmNl36bIiO2y2faZti1l
        zFd6LrfoTa0egHE7ZDS+CUGaAw==
X-Google-Smtp-Source: APXvYqzAMPf/Y0b4yUB24DbJ/f5dxbPWkjooxapqlMqClQ6g7CntGHvU80e36lkwFCfqVGx0lfzGNw==
X-Received: by 2002:adf:e3cc:: with SMTP id k12mr3845577wrm.159.1561560459691;
        Wed, 26 Jun 2019 07:47:39 -0700 (PDT)
Received: from mai.imgcgcw.net (26.92.130.77.rev.sfr.net. [77.130.92.26])
        by smtp.gmail.com with ESMTPSA id h84sm2718557wmf.43.2019.06.26.07.47.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 07:47:39 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Subject: [PATCH 16/25] clocksource/drivers/tegra: Restore timer rate on Tegra210
Date:   Wed, 26 Jun 2019 16:46:42 +0200
Message-Id: <20190626144651.16742-16-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626144651.16742-1-daniel.lezcano@linaro.org>
References: <adba7d03-e9bd-9542-60bc-0f2d4874a40e@linaro.org>
 <20190626144651.16742-1-daniel.lezcano@linaro.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

The clocksource rate is initialized only for the first per-CPU clocksource
and then that rate shall be replicated for the rest of clocksource's
because they are initialized manually in the code.

Fixes: 3be2a85a0b61 ("clocksource/drivers/tegra: Support per-CPU timers on all Tegra's")
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index ed1454000ea9..880ba67ca7ee 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -279,6 +279,8 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 		 */
 		if (tegra20)
 			cpu_to->of_clk.rate = 1000000;
+		else
+			cpu_to->of_clk.rate = timer_of_rate(to);
 
 		cpu_to = per_cpu_ptr(&tegra_to, cpu);
 		cpu_to->of_base.base = timer_reg_base + base;
-- 
2.17.1


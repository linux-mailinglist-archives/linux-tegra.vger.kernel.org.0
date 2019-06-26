Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C169E56CB6
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Jun 2019 16:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbfFZOr3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 26 Jun 2019 10:47:29 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54796 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728262AbfFZOr2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jun 2019 10:47:28 -0400
Received: by mail-wm1-f68.google.com with SMTP id g135so2401697wme.4
        for <linux-tegra@vger.kernel.org>; Wed, 26 Jun 2019 07:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8oLgj+UEWnuH/nXzCuT6g/iWSmzVogRXnWTAEILdbE8=;
        b=s6HgvJ8pz1mFKEtN0S8Kx9pkvKR2hjJZQySOrYD5K1+chU0fVGduV7GZMyF3sPX+XP
         645jKICzuF/sRqjhGHXYBtile4u0wJRoXk0iR/C/BjVuJ9Yos7KEMttePh5RkgUEUFZY
         BFWYme23UHytrWrv8RdBL+HhqsGiG7Dg03CXJ7PlKyPswGdl5CQph53Ws44hO8ARRW6U
         6p9rWDsKFXwbHlMiTUnBK0wuZ0MLTHmPNuup5VGhaMWNqd2BCaTsMVA6NnM9zBumwNTY
         /N1p+SPM916dXvzl/I8xgVmELNbCNs3Ip8Plv4gBgFS1poaeG7CoOsIQjoWGZaHiADUQ
         t4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8oLgj+UEWnuH/nXzCuT6g/iWSmzVogRXnWTAEILdbE8=;
        b=Bxr4WIVm3+D98iNE+0qUrjuw2i2KA3TAJygHY/wZGkdMo8V054RLTKk0rUwHbg3jRx
         wQq5n1DE3TrCMizpYg85TzKfQcMCx1UbTKQF4dsKA3/F87ka6qAyEEHWc52OQJEUVFzD
         2vfJ6+CviB2dmmMe8OfH5U4aUpOQm2nS5v63B1zOK1zys/6Aook4PdGgD2LuLznwxZ0J
         euEruaOvsqclu5cpEbEawVzMpNZAaM2S61w2fB9PQrDcgGFdkOLXStN6U/tOubmEFD5J
         dTa5/TpUlBXHXZCGfSpmgy7W2KKI8ad4pyUfs9S7GNRQVdFtTgWVKaIh3POjUB/FP2eD
         VFLQ==
X-Gm-Message-State: APjAAAUfRVH9z4+gG7hs5abMiC+64a5KKoiWbxP0DE7GbUpKm1Q0qY+y
        Qh2uZNyo0WnalqYUzqc5naIsuw==
X-Google-Smtp-Source: APXvYqykht4NS8VD1sBSEX2C9Z71CZayXXzjnTsjQySD6gnTuNYoC0X1KZLlRi3p0hL5bCwStcKRLw==
X-Received: by 2002:a1c:cb4d:: with SMTP id b74mr3154779wmg.43.1561560446690;
        Wed, 26 Jun 2019 07:47:26 -0700 (PDT)
Received: from mai.imgcgcw.net (26.92.130.77.rev.sfr.net. [77.130.92.26])
        by smtp.gmail.com with ESMTPSA id h84sm2718557wmf.43.2019.06.26.07.47.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 07:47:26 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Subject: [PATCH 09/25] clocksource/drivers/tegra: Release all IRQ's on request_irq() error
Date:   Wed, 26 Jun 2019 16:46:35 +0200
Message-Id: <20190626144651.16742-9-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626144651.16742-1-daniel.lezcano@linaro.org>
References: <adba7d03-e9bd-9542-60bc-0f2d4874a40e@linaro.org>
 <20190626144651.16742-1-daniel.lezcano@linaro.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

Release all requested IRQ's on the request error to properly clean up
allocated resources.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-tegra20.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-tegra20.c b/drivers/clocksource/timer-tegra20.c
index 276b55f6ada0..e2ef6b8211a5 100644
--- a/drivers/clocksource/timer-tegra20.c
+++ b/drivers/clocksource/timer-tegra20.c
@@ -284,7 +284,7 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20)
 			pr_err("%s: can't map IRQ for CPU%d\n",
 			       __func__, cpu);
 			ret = -EINVAL;
-			goto out;
+			goto out_irq;
 		}
 
 		irq_set_status_flags(cpu_to->clkevt.irq, IRQ_NOAUTOEN);
@@ -294,7 +294,8 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20)
 		if (ret) {
 			pr_err("%s: cannot setup irq %d for CPU%d\n",
 				__func__, cpu_to->clkevt.irq, cpu);
-			ret = -EINVAL;
+			irq_dispose_mapping(cpu_to->clkevt.irq);
+			cpu_to->clkevt.irq = 0;
 			goto out_irq;
 		}
 	}
-- 
2.17.1


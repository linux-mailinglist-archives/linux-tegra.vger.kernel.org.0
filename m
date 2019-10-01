Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25B80C3350
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Oct 2019 13:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbfJALsd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 07:48:33 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51660 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfJALsd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 07:48:33 -0400
Received: by mail-wm1-f68.google.com with SMTP id 7so3015755wme.1
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2019 04:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B6CrRdrsEtKyU90lmh1sN2x0rTtjsQMj1DEFBb5XXtg=;
        b=HjpPidoFe4pnFmZF/dYZhtHODIvto6KyeDN859wi3xglgE5+PqnQw0SQfISuoM9g7W
         qbFWZ485bAVlJ7kcgKdKKBd6vbc6wk6egckzJwMrcIp6hxzLf3dcaYN1UnWCOWKXEZSd
         vNB2iy/CvMayOPlfNsnRF+xo4/pTZQgTRsKcUspdsDci7McgnsKuGUv+ADYILRGwvmNA
         LoIwFvDmMtZtkXxyHl0cOMs68jQM0oJhV4UWQCJJzxunt0cLA0X4X+1G2uYHS0h7p66J
         T1/T8/A9ZF4umEWLOvuRVz7ncWEHn83h7Fhz0DrcQkbSwuDsiyG46UB43Eoi3MXNKAlc
         Gcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B6CrRdrsEtKyU90lmh1sN2x0rTtjsQMj1DEFBb5XXtg=;
        b=Y+8VYlRVHZ4Qx63MwuymdVR9Q88OT0c8arIbZNn7OQGGQDYmc/g3NYQT/7gf3Lsogl
         7MpClBdse6Z2Plwwzbs6z3nWF0F8px9eySu9qL8Yvr2X/UxyFkhKe4ozjizp9W+D/Sfl
         +YucLe84Wh0XjiwLO0nS8omnXyagt8CwsW77Qm2zbG5LB8Q4AZeFievDVOPG2L24S9bj
         /H9noPrNRJj3jcIvv1FFoeGjdBXiqlN5hvfMt0N4IUFvLt6rQr4qJU9T94/h5m0gbQmr
         J+vGch6ouJZODMYeQ4YuXIVI06r2UxetI+FXfoYTv3rYXovZ3QE1Dxz/uhTYa5Fr4xnb
         ZNcg==
X-Gm-Message-State: APjAAAVc815TWJ7/nUTtnuDt3QFqDiJTXMV8PyfOdh2PBuqQYPnvk1nU
        gXO97VVozV+2nLmqzZIc5x4=
X-Google-Smtp-Source: APXvYqwejExR6A8VZNp+/3+Y9hfgJQhtwfm/JBKW9xwPgPbVnubkpt8AUt2mVwB3RUpXwLLRF0+xXg==
X-Received: by 2002:a1c:7418:: with SMTP id p24mr3203570wmc.132.1569930511937;
        Tue, 01 Oct 2019 04:48:31 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id t6sm4595435wmf.8.2019.10.01.04.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 04:48:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc/tegra: pmc: Fix crashes for hierarchical interrupts
Date:   Tue,  1 Oct 2019 13:48:29 +0200
Message-Id: <20191001114829.3385196-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Interrupts that don't have an associated wake event or GPIO wake events
end up with an associate IRQ chip that is NULL and which causes IRQ code
to crash. This is because we don't implicitly set the parent IRQ chip by
allocating the interrupt at the parent. However, there really isn't a
corresponding interrupt at the parent, so we need to work around this by
setting the special no_irq_chip as the IRQ chip for these interrupts.

Fixes: 19906e6b1667 ("soc/tegra: pmc: Add wake event support")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 9f9c1c677cf4..0447afa970f5 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1899,6 +1899,20 @@ static int tegra_pmc_irq_alloc(struct irq_domain *domain, unsigned int virq,
 							    event->id,
 							    &pmc->irq, pmc);
 
+			/*
+			 * GPIOs don't have an equivalent interrupt in the
+			 * parent controller (GIC). However some code, such
+			 * as the one in irq_get_irqchip_state(), require a
+			 * valid IRQ chip to be set. Make sure that's the
+			 * case by passing NULL here, which will install a
+			 * dummy IRQ chip for the interrupt in the parent
+			 * domain.
+			 */
+			if (domain->parent)
+				irq_domain_set_hwirq_and_chip(domain->parent,
+							      virq, 0, NULL,
+							      NULL);
+
 			break;
 		}
 	}
@@ -1908,10 +1922,22 @@ static int tegra_pmc_irq_alloc(struct irq_domain *domain, unsigned int virq,
 	 * dummy hardware IRQ number. This is used in the ->irq_set_type()
 	 * and ->irq_set_wake() callbacks to return early for these IRQs.
 	 */
-	if (i == soc->num_wake_events)
+	if (i == soc->num_wake_events) {
 		err = irq_domain_set_hwirq_and_chip(domain, virq, ULONG_MAX,
 						    &pmc->irq, pmc);
 
+		/*
+		 * Interrupts without a wake event don't have a corresponding
+		 * interrupt in the parent controller (GIC). Pass NULL for the
+		 * chip here, which causes a dummy IRQ chip to be installed
+		 * for the interrupt in the parent domain, to make this
+		 * explicit.
+		 */
+		if (domain->parent)
+			irq_domain_set_hwirq_and_chip(domain->parent, virq, 0,
+						      NULL, NULL);
+	}
+
 	return err;
 }
 
-- 
2.23.0


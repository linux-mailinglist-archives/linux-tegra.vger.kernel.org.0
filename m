Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACD9C34C99
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Jun 2019 17:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbfFDPvo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Jun 2019 11:51:44 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44945 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728041AbfFDPvo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Jun 2019 11:51:44 -0400
Received: by mail-wr1-f67.google.com with SMTP id w13so16349505wru.11
        for <linux-tegra@vger.kernel.org>; Tue, 04 Jun 2019 08:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qH4FDRgRxazUxppnfy66oz7/ZG4EwLFotnt4vrr38Jk=;
        b=ph1lWQ+lD7EEE/KoatFoMerQik8dUq2QfqaGCfo7jVtKJxMuNmqsThFLNMeeh7kkS+
         FD0nIKmo1GtzpfttCVJcwIMmJyB5JHhFexJ8+8wALREiZztVcbbLGac6k+1wZ4wWMQ9s
         S549TuGx7TdiORJMeoMfamHmIMeL9vhVWIvKklBmPOPrBXdf3KFoneu4kcfpMmIysKvr
         uSRWIkIh4h4kotHAJTFeNJ3qlTXKjXzHdRRumEHoXdy+N3gIqnghr8iBDZuMd1K+4kZq
         C/YWPpXgeDGmws4DQaMkdvTWNtLXBZFlbTRRUiwk4764DdtYBpwO87yIfQElPI88QA2e
         ldaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qH4FDRgRxazUxppnfy66oz7/ZG4EwLFotnt4vrr38Jk=;
        b=CZzm4829tTNwlBbyy2Btb4aRm5zHUl9Ok/wzOm0Kb77pPKC0Xcl0M6yhcpaCfbKG0M
         a6y4wZoMn8XREI1S5sTYZ87+ObXy3eKUg14UbrJxdh6jLysqU291/LALCEBQNTK2RmMQ
         E9m4V8US8sL4m6mQLgy8bzizkkvE3qutf+JCF/X7H35GLBUJ5jd9y/VsOnaFWfMLVeOv
         4T+3cgIrnlCzbMCvEQ4ZVM8uHK9D9ev6hlcef9DiJuXK72HYCaAbLodauR7/k4+FE3BL
         Mrc+KSXdu7JmLhmUvz5SjYLYYLmUSYJC7W24J3/gnIylNPtZHFg8bMw/A+VbboFcB0fC
         dBMw==
X-Gm-Message-State: APjAAAWpYOlWjshe7pN2a7KaectCKTKr9HmE61iCoFNyDrgxvtyULnnS
        UWb+sVCaxOQPoUJhpiNmdPQ=
X-Google-Smtp-Source: APXvYqyJDCOSSw64vLkSR9L4wCqk+kXrRkrMGCNK8o6OONOCjbvwA7NYyHqVoIQWqFYEp/Nq7LQ24g==
X-Received: by 2002:a5d:404a:: with SMTP id w10mr2976806wrp.177.1559663502864;
        Tue, 04 Jun 2019 08:51:42 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id d18sm3511733wrn.26.2019.06.04.08.51.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 08:51:36 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/3] soc/tegra: pmc: Fail to allocate more than one wake IRQ
Date:   Tue,  4 Jun 2019 17:51:33 +0200
Message-Id: <20190604155135.25390-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The code currently doesn't support allocating more than one wake IRQ at
a time. Detect this situation and error out. Also make sure to output a
warning when that happens to help track down callers.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 5648e5c09ef5..653fe2c466f6 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1863,6 +1863,9 @@ static int tegra_pmc_irq_alloc(struct irq_domain *domain, unsigned int virq,
 	unsigned int i;
 	int err = 0;
 
+	if (WARN_ON(num_irqs > 1))
+		return -EINVAL;
+
 	for (i = 0; i < soc->num_wake_events; i++) {
 		const struct tegra_wake_event *event = &soc->wake_events[i];
 
-- 
2.21.0


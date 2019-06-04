Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB1BF34C9B
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Jun 2019 17:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbfFDPvs (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Jun 2019 11:51:48 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35341 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728041AbfFDPvs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Jun 2019 11:51:48 -0400
Received: by mail-wm1-f68.google.com with SMTP id c6so617762wml.0
        for <linux-tegra@vger.kernel.org>; Tue, 04 Jun 2019 08:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z+OhEzHhvUeJebIEatFExcxGd1KsR5MutbeuVcAmdiM=;
        b=IZoG5iQfhwH3WPZ7yI+hJljmBqEI9xfgXEgkUxl7gTycgWFGden7jqMKmTnTQvh+u2
         yMHOBvLA3h8oxxpysF/UgPQrSmeRxjSvx92v/YzblfFF4jRFuyXJHzWATLk/jsv5+O86
         bg4pNSi0dbnzBb070ToI5yPLMbPr4tMH25bK24rnfsfCLA5c7RxSSgq7n0WbXHVziroz
         WlQKYvRbvKpLvYjznY9TJsVjmwIJEdHMRhh5hY10oaM2+YSdXMvGsgkwJpjQc8N2JVXv
         WpNhN+W3C5O+JjEjhoumaTjIB9W7BNEjercK1MWRCXUW7m1uWOiTpP1AK268hRL2IK1b
         /hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z+OhEzHhvUeJebIEatFExcxGd1KsR5MutbeuVcAmdiM=;
        b=TkcuzNh8BHRODcjXcT8moryGSLmVho4/yXzq25KR2NV1yvKHAa0PX1ngw1cKEHP1hQ
         YHCbl2ZgsM9Xy2oOTGAAMIIPHSPM2XLP+RomEIkVlMMOC/hbQ6+Ixzgqte1V9HPS2mVx
         8+BBYrrAopf7OFhLuGHN3oDOK9nCNAABI7LrvgNbJS+o6q/3p3cBgAL35Nzw7DLOfoku
         QbxAL9nvdFpRm3EEVtqFO4rRJ7l/XlUhC+Ts/gvH6ZMsnl5JfEAMSDd25i++VAgJn/ZO
         D33lxXlxJ0FFjrjUEP6l8tVZoDxPg3bFttW+HxJ1/rleFLys9lXNXJfCw78f6+YFmrdm
         uRrA==
X-Gm-Message-State: APjAAAVo5+AFB0TRMwFYSVbeAjeeN8HvXfiGZqnXHBGJZW1/KOMOB0L7
        QlFA8Myuto2IcSt7GJesX5E=
X-Google-Smtp-Source: APXvYqzipgasfebfDR/ejdqGH7KrYRMV/DH+W6zwO2QcBQ3VZMp4cnJ2vJlkoz7iUX8LbNQ0GZifUg==
X-Received: by 2002:a1c:a848:: with SMTP id r69mr17095918wme.12.1559663506048;
        Tue, 04 Jun 2019 08:51:46 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id d18sm3512155wrn.26.2019.06.04.08.51.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 08:51:45 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/3] soc/tegra: pmc: Add comments clarifying wake events
Date:   Tue,  4 Jun 2019 17:51:35 +0200
Message-Id: <20190604155135.25390-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190604155135.25390-1-thierry.reding@gmail.com>
References: <20190604155135.25390-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add some comments to clarify the purpose of the wake event support
implemented in the PMC driver.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 6e66b5e293be..af8f63a844cd 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -241,6 +241,11 @@ struct tegra_pmc_soc {
 	const char * const *reset_levels;
 	unsigned int num_reset_levels;
 
+	/*
+	 * These describe events that can wake the system from sleep (i.e.
+	 * LP0 or SC7). Wakeup from other sleep states (such as LP1 or LP2)
+	 * are dealt with in the LIC.
+	 */
 	const struct tegra_wake_event *wake_events;
 	unsigned int num_wake_events;
 };
@@ -1906,6 +1911,11 @@ static int tegra_pmc_irq_alloc(struct irq_domain *domain, unsigned int virq,
 		}
 	}
 
+	/*
+	 * For interrupts that don't have associated wake events, assign a
+	 * dummy hardware IRQ number. This is used in the ->irq_set_type()
+	 * and ->irq_set_wake() callbacks to return early for these IRQs.
+	 */
 	if (i == soc->num_wake_events)
 		err = irq_domain_set_hwirq_and_chip(domain, virq, ULONG_MAX,
 						    &pmc->irq, pmc);
@@ -1924,6 +1934,7 @@ static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 	unsigned int offset, bit;
 	u32 value;
 
+	/* nothing to do if there's no associated wake event */
 	if (WARN_ON(data->hwirq == ULONG_MAX))
 		return 0;
 
@@ -1954,6 +1965,7 @@ static int tegra_pmc_irq_set_type(struct irq_data *data, unsigned int type)
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
 	u32 value;
 
+	/* nothing to do if there's no associated wake event */
 	if (data->hwirq == ULONG_MAX)
 		return 0;
 
-- 
2.21.0


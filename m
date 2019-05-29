Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD8152DA99
	for <lists+linux-tegra@lfdr.de>; Wed, 29 May 2019 12:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbfE2K1A (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 29 May 2019 06:27:00 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39590 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfE2K1A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 May 2019 06:27:00 -0400
Received: by mail-wr1-f65.google.com with SMTP id x4so1352001wrt.6
        for <linux-tegra@vger.kernel.org>; Wed, 29 May 2019 03:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F4ek3zhf26WPz8SCGgna791YOt0uckHhipVYXfvPpfU=;
        b=n5oxxiJDyt8yneaPCfXwu7Qf4lqKWCndkvzR5bGCkZ9MPGzEORul3krIgIDgl45oGN
         PWUt79YD421ML4vQTauuPSKigORoLW0kbcOgo8l9GQbfaLW6YSzA0/kWc+eJoXPkMYr6
         c17dOtopGGPXF6R/h4HZafeIEVm4xvOQyhScfNEjXEI01dhmeRd8rbgV9DIpnHTDnmqy
         dR3GyA/2sMKBoFxrHKzN42Toj0nG8xEgdldygrVWF2Oo5lhSQQIOul0OXeVe+frc5tFE
         6zuV0vSREi73pASxy66Ys/47ZyrfHBe6QpytHNfzBt/omfnDA3e3VuB0QUASbu0LY3aW
         dSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F4ek3zhf26WPz8SCGgna791YOt0uckHhipVYXfvPpfU=;
        b=FodNU4k6hdc+ux56uWSUTKS/7WHtJxj6OsWGxC07ZsH57ZvthTM+dru/2i6dErBQX1
         PWwR/fl7C7x2AaR7nDQgrQA9NM5ei9wII6aJO5BFYABtJ7dAaXsnZ3eKiykCxqsZULyK
         klhuUywZ7ZnJWmuZygvCxjfKMh4Uxdgs0pGPI01sjibCUFe7OyIk8++q6svP9YKB6LGN
         kb63jnQPH3bh2m8wJRHzJZ/ncDcX+jimSXGt/X/6nxwke1V1NiLmM+OSPRir2zoE1CDK
         lYRWnARH1zFrYrnnQcchyV9lQCwGuReoMoxR+qm5sS8bSFIqaaz3VAykmq43d+4H3+gK
         nWCw==
X-Gm-Message-State: APjAAAWE0oVKrW+Tu4OaYRxqoPIa5pPzgmZaCD64D9aEu0wFfGH2NA/1
        tcvvWARh+2cYV8VxZfU/+X0=
X-Google-Smtp-Source: APXvYqzzqvqYh9R4VEQzQroevdoud8G85S2Hh/csnHhyDgdBiZ+4LqpzQDY8Qqva1KFlLCrzMbuoAQ==
X-Received: by 2002:adf:ef83:: with SMTP id d3mr8922611wro.253.1559125618796;
        Wed, 29 May 2019 03:26:58 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id r8sm498454wrt.92.2019.05.29.03.26.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 29 May 2019 03:26:58 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] soc/tegra: pmc: Avoid crash for non-wake IRQs
Date:   Wed, 29 May 2019 12:26:54 +0200
Message-Id: <20190529102654.14665-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529102654.14665-1-thierry.reding@gmail.com>
References: <20190529102654.14665-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

For interrupts that are not wakeup sources but that may end up getting
mapped through the PMC as interrupt parent (this can happen for GPIOs),
return early in order to avoid a subsequent crash from an out-of-bounds
access to the register region.

Reported-by: Bitan Biswas <bbiswas@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 653fe2c466f6..6e66b5e293be 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1924,6 +1924,9 @@ static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 	unsigned int offset, bit;
 	u32 value;
 
+	if (WARN_ON(data->hwirq == ULONG_MAX))
+		return 0;
+
 	offset = data->hwirq / 32;
 	bit = data->hwirq % 32;
 
-- 
2.21.0


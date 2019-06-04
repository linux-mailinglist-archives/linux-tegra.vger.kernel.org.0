Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94C7034C9A
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Jun 2019 17:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbfFDPvq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Jun 2019 11:51:46 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42296 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728041AbfFDPvq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Jun 2019 11:51:46 -0400
Received: by mail-wr1-f68.google.com with SMTP id o12so9265742wrj.9
        for <linux-tegra@vger.kernel.org>; Tue, 04 Jun 2019 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F4ek3zhf26WPz8SCGgna791YOt0uckHhipVYXfvPpfU=;
        b=XGG7x/0Qq8KnWSmPkGdKfHq1zDE2aAodLekp+OEHF8Tc/V5DFe6NQNd1OygFjjbn9S
         AOXqnPEK9bgacoCJFI/kWmmfYcnOTF2uirOplzw3465/WKxtyWshYUYpzaNPLVKWa69T
         s3oK+2GnKuxF2fRxoaPndZqcIDanJPzyKKwHsqSUTz7jvqT6mncu57KE6soXiVES4uCC
         Uigv2DfwGdj1QnCpVt66+RFxcUEPtJY3nVN8mFa2g+tBGBqMpRJ+Pu/bk7mz71npf86L
         PfCXK+BP8NCU6mCAQBkA4hq+5Ss1ey9+brNxtmMphkPjDep3thoXPkxb1ZmVdxZ2ANkW
         lmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F4ek3zhf26WPz8SCGgna791YOt0uckHhipVYXfvPpfU=;
        b=CB8/VheGohon6cZwMsE3rWRNDifZJizoq4OYLVfvM4CLaM47oV2w0xAQzY4tbuzhv/
         wti4LTodQ7cEfPlBLUDOZ3bduEuGukZWBnJYHUbY8et0o46wkZh5OVuovqt4OF2hOWH1
         mBTndahcnbZDa2IN+/G84QX6dI4Jw/ZCl9+Z+yKz389uZvmwoGBtHQNvYTpTmtckUf21
         iKSniheD3E0ILDzHkvQabV6s3Mc9+tQUbKzqwz3xCKEtF7tSxsW/66lo4gxfqWQRwQVr
         x4rE1TWdrmWCcTlqeouys1AAf0FePJSwFMLs0+IRAo8WJNjoV9bMsW4upKGk8RrXYAX5
         j6ww==
X-Gm-Message-State: APjAAAVCjUyVHrLAqJEuR/MN5H1fwqw9e7tQM0D4XDN2n0xUxw9ExFyt
        tvomCJEDGjyxOo7SgPupNkg=
X-Google-Smtp-Source: APXvYqw4C4LGMN7NBSczIExaeHfJAuBoLFtRAb9hpG/JyhfUy+lb+y4NuU267pEoEav5OxrI3IfdNg==
X-Received: by 2002:a05:6000:1202:: with SMTP id e2mr20691009wrx.239.1559663504460;
        Tue, 04 Jun 2019 08:51:44 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id l8sm13748311wrw.56.2019.06.04.08.51.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 08:51:43 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/3] soc/tegra: pmc: Avoid crash for non-wake IRQs
Date:   Tue,  4 Jun 2019 17:51:34 +0200
Message-Id: <20190604155135.25390-2-thierry.reding@gmail.com>
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


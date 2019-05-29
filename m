Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59BD92DA97
	for <lists+linux-tegra@lfdr.de>; Wed, 29 May 2019 12:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbfE2K07 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 29 May 2019 06:26:59 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41411 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfE2K06 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 May 2019 06:26:58 -0400
Received: by mail-wr1-f65.google.com with SMTP id c2so1337491wrm.8
        for <linux-tegra@vger.kernel.org>; Wed, 29 May 2019 03:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qH4FDRgRxazUxppnfy66oz7/ZG4EwLFotnt4vrr38Jk=;
        b=RgPCHnOIk/VcuuhD4LkWOrkoHFmhwsd+XnEJ0uKI0Y9pFcLjlriu5i/gfZaqJkJujN
         uX0w3ErsriLvqQyvfuHw/+6hzD/3YSqYPn0Ok9CmE+geqXFAhUFw2w9Rpmi9fxUdaSoT
         f8PsppOSw4hmU0VwylunyMWmFY3WF4dXd1VNRV/N2fphARv3Ag67OCa7fqP1RXTHdWEN
         fvFHW1W62sR7GQpBSpZXJtdi/18X+yaqtKkKcyEMVDWq9579Kt2NmIoQ5s/aCDIDEVqx
         +Y9+u1uii1HMVENAm79jR3qM7CuW6h9yq7Vs1947aMQK2Hx5LDPu8larIK/Vv2e3aVX+
         e6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qH4FDRgRxazUxppnfy66oz7/ZG4EwLFotnt4vrr38Jk=;
        b=Guqr02cM6Qws/8CIAasAOWUTwi93dsNJFHr6OiF0NsLPYYoBeF+RlvCFczIVmS3dW/
         7ASUI/ehYTbOQe57EY1dMSLGCjbjiakdLhu4Qtbo03+IoG9Yu35/+f9+yfpg+1QmZVLR
         yMqoA8xn6IuFDFnf2mrOQr0ivEI8NvPWfMmgyhtV8RMx0hB8vb+9roiFA2xpszibk4W8
         FcfN55cmjPCKFSbrZO/CHrJ0PUqYmzaLz3E0A8KRT9jK5cgbTBUPfaQ2AQVXV8QtsntF
         aNWlx9LlfWrcshOOgheODkMRoyZ7Rruj+oJ88ZRUbBx696xFsIFBmiKLnYF1rhJKVPAC
         L/WQ==
X-Gm-Message-State: APjAAAVy1t+EOoKyUsSGhXjfteprnJKJBKYPvokqgmMaohx9YmPeFaAh
        eVJE322lORJ4q8XNRBMJ4Yg=
X-Google-Smtp-Source: APXvYqxpCtSZC0Q2fp8eoEj2RPZV2FI55G/Xb0w+oZGygASEKhSjAxQ5kZ6u9HACyVknmUMaPS9vhA==
X-Received: by 2002:adf:8062:: with SMTP id 89mr11498516wrk.97.1559125617201;
        Wed, 29 May 2019 03:26:57 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id f21sm841586wmb.2.2019.05.29.03.26.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 29 May 2019 03:26:56 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] soc/tegra: pmc: Fail to allocate more than one wake IRQ
Date:   Wed, 29 May 2019 12:26:53 +0200
Message-Id: <20190529102654.14665-1-thierry.reding@gmail.com>
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


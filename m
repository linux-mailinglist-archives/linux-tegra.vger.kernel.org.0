Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3918D7B7B
	for <lists+linux-tegra@lfdr.de>; Tue, 15 Oct 2019 18:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbfJOQ3z (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 15 Oct 2019 12:29:55 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52267 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfJOQ3z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Oct 2019 12:29:55 -0400
Received: by mail-wm1-f66.google.com with SMTP id r19so21578764wmh.2
        for <linux-tegra@vger.kernel.org>; Tue, 15 Oct 2019 09:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8EjDBNijVRoZjfqMLlXDaOnDwnymZTKSpRUqb0jAneU=;
        b=e4QJXQ4+hWtGPr3XXRL/OH8/hcXhMLaLfbqe37lsaMUbNRHvJMGGZp4XqiMur9ZIIc
         JuCMN1+nF/9t76VBmQ+bJFDSWppF2nOw7LSqfJHA9DEsVgtNBbmcgJpX21co1+0bzS7U
         ZDTmR1lzUv9uuaFF4QThMXFdM66UiBcnmiF11V9n7305SH7gf0aI5yrqgt3T8h/6Hs5m
         rb6AzpQ9daKybqWNfHD7m65mrL/RLjzbaZRoKmHGvth2WUrVbieH1uBum2ttR+uAANMh
         /M1hRnoNbhQiSVPrP+GTWO/Cl9Pg6LvKp9UDmIYDWpuJbB9qQf84cAByW1s9aYp4JZQm
         zfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8EjDBNijVRoZjfqMLlXDaOnDwnymZTKSpRUqb0jAneU=;
        b=LwTBGiU0jzwQcviVqali2pF++z+TCWLjFm36IzgjHCucAQUG/Cm5Qkcui0surGOJvV
         DTvUXhCP1LnRQF47DXi8XbLx/ehHHxnFAA/U5aBRh47WFmcdJfglqDnt9ubAw5lHLDLF
         4pwGWh701Hjja3JEWaqiZQYe2m2ar6AV06/zA69lG5qthPCaAnpX8Va4AGyOGsdTjkP5
         nRFZfyQj06Go9GB3jxaUkAi8zy974Nr+RNo+ZlUhC0fVNJQdeHlNy6mrrphb0skCUolm
         oaVGNEW/4NuMG87BzIbUK60vaQW/aS+nCCbiJ8uFheC9E455BonncRPt4YTxLWsO9XcJ
         FJNg==
X-Gm-Message-State: APjAAAXPwGpDXw8J1RG1S/AbfNV5oW+0mKoPXlITt6dfRlizCptsp+Pk
        +dxeWR0sGK3GY1r6SkAB9OQ=
X-Google-Smtp-Source: APXvYqziuZ6APvE5dI6UfqFlO5qrIoevHEqZUCi0rk13IQn0bCyF6RN2yeZd4Q+L34CkWrYJ3uVxGQ==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr21928223wmj.150.1571156992846;
        Tue, 15 Oct 2019 09:29:52 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id t123sm37314754wma.40.2019.10.15.09.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 09:29:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: [RFC 2/3] memory: tegra186: Register as memory controller
Date:   Tue, 15 Oct 2019 18:29:44 +0200
Message-Id: <20191015162945.1203736-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015162945.1203736-1-thierry.reding@gmail.com>
References: <20191015162945.1203736-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Registering as memory controller allows other drivers to obtain a
reference to it. This is mostly useful as a way of ordering probe
between devices depending on one another.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra186.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 441213a35930..e94e960a79f4 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/io.h>
+#include <linux/memory-controller.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
@@ -11,6 +12,7 @@
 #include <dt-bindings/memory/tegra186-mc.h>
 
 struct tegra_mc {
+	struct memory_controller base;
 	struct device *dev;
 	void __iomem *regs;
 };
@@ -548,7 +550,7 @@ static int tegra186_mc_probe(struct platform_device *pdev)
 	if (IS_ERR(mc->regs))
 		return PTR_ERR(mc->regs);
 
-	mc->dev = &pdev->dev;
+	mc->base.dev = &pdev->dev;
 
 	for (i = 0; i < ARRAY_SIZE(tegra186_mc_clients); i++) {
 		const struct tegra_mc_client *client = &tegra186_mc_clients[i];
@@ -571,6 +573,10 @@ static int tegra186_mc_probe(struct platform_device *pdev)
 			client->name, override, security);
 	}
 
+	err = memory_controller_register(&mc->base);
+	if (err < 0)
+		return err;
+
 	platform_set_drvdata(pdev, mc);
 
 	return err;
-- 
2.23.0


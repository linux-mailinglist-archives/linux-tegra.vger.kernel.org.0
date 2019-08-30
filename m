Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A890A30B7
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Aug 2019 09:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbfH3HSK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 30 Aug 2019 03:18:10 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46235 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727854AbfH3HRy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 30 Aug 2019 03:17:54 -0400
Received: by mail-wr1-f68.google.com with SMTP id h7so4523095wrt.13
        for <linux-tegra@vger.kernel.org>; Fri, 30 Aug 2019 00:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vb7GxMox8GW4icSo2qX00cFQWvHnLzZGW13vcUTShQE=;
        b=WAQJlbmkmnmIuVhxCeqPrEzfqnlpYvSOrdixOe4Z9156CTPal3tG1hwcQWWy+Z21tL
         mOiGmwjw5LfRU3lcXsunSl/jw76qkKc8yp1t1pSN/VD7DVAk4t5iQ9U8DBlJUmITUM9d
         2IxSHXLkycIF4k4hvH7PpYZlk+hhcgYSq5dtVERzmteYgGQlVN4d42mVn2UycezdGQMY
         sT9SipL7OZNffBIsqlS2BNojmLw2NFwsp6wHNFmpjYD5irxXIIEnoQ8PciwfpbL6F7SI
         /+ST61Q9PN6QhC7fIe/EyYjna6ppzVFEAoOClugrYP3bXmY1AVjOMWPK8HviQt2kClP1
         iDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vb7GxMox8GW4icSo2qX00cFQWvHnLzZGW13vcUTShQE=;
        b=eLZMcT/s/ZtVkldRmXOTi/CriKOAiFKC1UCzm21pnSXBfe+9TeKZ3n7dMNkp4ork6M
         bDj3/X+ksflHl1RgP9WQnXtsMBAQ13dFVvytlr6RF0+MX9wnTiLG1PIfRf60beaUzi8U
         g6+iWfdCCw/HtPubrrxnv301JUCjcH+6wZCAqMGgkX2vOJ/XOYj3f6k+yDEIeZIkeUuk
         gxoE6yY3gQlZs0QmPRh6AdS4BAf5GMz0w+9VOel4aepmEdx7SxYlslsjExxM6pxyu9te
         EpVUma+a4LxWh7ABYrEORPNBZx6+yO8LOMr2W7JaViDrDvrU/nTz1mCGcxE6nHucV9nJ
         oe2g==
X-Gm-Message-State: APjAAAXc6xk8oRyBc5PqV2uytX0V8HshtD2ptXpcDpbVSHirIuT3ILRs
        uwWHmyh5ugT2JH/8zSINVp6VmA==
X-Google-Smtp-Source: APXvYqxIInMCzWNf34LxcyxSnQVs/J+xN1iNdetlgr35rdEBD2cxk1bJXmhlgRog97aovvym4oXZLQ==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr16210331wrs.347.1567149472173;
        Fri, 30 Aug 2019 00:17:52 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id x6sm7637529wrt.63.2019.08.30.00.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 00:17:51 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jens Axboe <axboe@kernel.dk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/4] ahci: tegra: use regulator_bulk_set_supply_names()
Date:   Fri, 30 Aug 2019 09:17:38 +0200
Message-Id: <20190830071740.4267-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190830071740.4267-1-brgl@bgdev.pl>
References: <20190830071740.4267-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the new regulator helper instead of a for loop.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/ata/ahci_tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
index e3163dae5e85..cb55ebc1725b 100644
--- a/drivers/ata/ahci_tegra.c
+++ b/drivers/ata/ahci_tegra.c
@@ -483,7 +483,6 @@ static int tegra_ahci_probe(struct platform_device *pdev)
 	struct tegra_ahci_priv *tegra;
 	struct resource *res;
 	int ret;
-	unsigned int i;
 
 	hpriv = ahci_platform_get_resources(pdev, 0);
 	if (IS_ERR(hpriv))
@@ -543,8 +542,9 @@ static int tegra_ahci_probe(struct platform_device *pdev)
 	if (!tegra->supplies)
 		return -ENOMEM;
 
-	for (i = 0; i < tegra->soc->num_supplies; i++)
-		tegra->supplies[i].supply = tegra->soc->supply_names[i];
+	regulator_bulk_set_supply_names(tegra->supplies,
+					tegra->soc->supply_names,
+					tegra->soc->num_supplies);
 
 	ret = devm_regulator_bulk_get(&pdev->dev,
 				      tegra->soc->num_supplies,
-- 
2.21.0


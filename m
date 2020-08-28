Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B91C255DFB
	for <lists+linux-tegra@lfdr.de>; Fri, 28 Aug 2020 17:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgH1Ph7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 28 Aug 2020 11:37:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:45064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725814AbgH1Phy (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Aug 2020 11:37:54 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 18676208D5;
        Fri, 28 Aug 2020 15:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598629074;
        bh=bVYPscE2UBKBhFn06TrP+ynYjgB6CV0jt1duhkGi9WM=;
        h=From:To:Subject:Date:From;
        b=DCUJH1irLKUaWrJgPrJ201haS5Iw2ukY/GcMtF5GGEDWVaI99jmPMbb2kO606D7cg
         bu6HmZcN3c5pTyrgGbxkCkIifVWo1mScoxd1h1C9/LsU1+3YLvHokLHxaU4rGXiVx0
         zUIIJGoW1tbAOHVVwxenjzCGH9pp5fms0DGTmngg=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] memory: brcmstb_dpfe: Simplify with dev_err_probe()
Date:   Fri, 28 Aug 2020 17:37:46 +0200
Message-Id: <20200828153747.22358-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/brcmstb_dpfe.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/brcmstb_dpfe.c b/drivers/memory/brcmstb_dpfe.c
index dcf50bb8dd69..f43ba69fbb3e 100644
--- a/drivers/memory/brcmstb_dpfe.c
+++ b/drivers/memory/brcmstb_dpfe.c
@@ -901,11 +901,8 @@ static int brcmstb_dpfe_probe(struct platform_device *pdev)
 	}
 
 	ret = brcmstb_dpfe_download_firmware(priv);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Couldn't download firmware -- %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't download firmware\n");
 
 	ret = sysfs_create_groups(&pdev->dev.kobj, priv->dpfe_api->sysfs_attrs);
 	if (!ret)
-- 
2.17.1


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBA2625B488
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Sep 2020 21:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgIBTiC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Sep 2020 15:38:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:43588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726762AbgIBTiB (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 2 Sep 2020 15:38:01 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AAFBC20E65;
        Wed,  2 Sep 2020 19:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599075480;
        bh=ysxU/OkPk0mx2jmOsOpW9mYF9nZJUrqNoDbkIh/24jA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vpFu8350AnZO/VZulHS3cosgdptpwzKBP54kcGKYYm+c84d7OK0hpajGsgvwtOFKS
         kmJCuXW8VdBTDiKusxw3hbdgYxmp3Agznd240GsJTGXakAFEVej8jF2rXA0RVL33Bn
         QWutahXiiNH/ft4IpIIAIUlTNFX4B8Oe+FxhtXwM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Al Cooper <alcooperx@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-tegra@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT 06/11] mmc: sdhci-brcmstb: Simplify with optional clock and dev_err_probe()
Date:   Wed,  2 Sep 2020 21:36:53 +0200
Message-Id: <20200902193658.20539-7-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902193658.20539-1-krzk@kernel.org>
References: <20200902193658.20539-1-krzk@kernel.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Only -ENOENT from devm_clk_get() means that clock is not present in
device tree.  Other errors have their own meaning and should not be
ignored.

Simplify getting the clock which is in fact optional and also use
dev_err_probe() for handling deferred.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Not tested on HW.
---
 drivers/mmc/host/sdhci-brcmstb.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
index ad01f6451a95..876668827580 100644
--- a/drivers/mmc/host/sdhci-brcmstb.c
+++ b/drivers/mmc/host/sdhci-brcmstb.c
@@ -235,13 +235,11 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "Probe found match for %s\n",  match->compatible);
 
-	clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(clk)) {
-		if (PTR_ERR(clk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		dev_err(&pdev->dev, "Clock not found in Device Tree\n");
-		clk = NULL;
-	}
+	clk = devm_clk_get_optional(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
+				     "Failed to get clock from Device Tree\n");
+
 	res = clk_prepare_enable(clk);
 	if (res)
 		return res;
-- 
2.17.1


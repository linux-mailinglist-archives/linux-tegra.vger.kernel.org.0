Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F089025B47D
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Sep 2020 21:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgIBThh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Sep 2020 15:37:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:42726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgIBThh (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 2 Sep 2020 15:37:37 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 557BD208C7;
        Wed,  2 Sep 2020 19:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599075456;
        bh=5UnpTA5GY8oNqT3vBtcTzkLMcda+odMMYdMuv+NOOyg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l965p2wyuOyXR5gyhwoX1BKPXSLXH5XU7O35v8yUw4at3Ke+NvrG3SwcBNbY6ITLV
         1Z3i1DD307CJIcfZ1SsjhNUJOZ0nJSocEg1djQAl6fz53k17bf9uD9T4bXRKH4igQq
         22YAJw9gPaM9NkfexU0xMCsDCJiHwfGKcxSZcRxA=
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
Subject: [PATCH 03/11] mmc: dw_mmc-zx: Simplify with dev_err_probe()
Date:   Wed,  2 Sep 2020 21:36:50 +0200
Message-Id: <20200902193658.20539-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902193658.20539-1-krzk@kernel.org>
References: <20200902193658.20539-1-krzk@kernel.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mmc/host/dw_mmc-zx.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc-zx.c b/drivers/mmc/host/dw_mmc-zx.c
index eada648b27ec..d9e483432a61 100644
--- a/drivers/mmc/host/dw_mmc-zx.c
+++ b/drivers/mmc/host/dw_mmc-zx.c
@@ -155,7 +155,6 @@ static int dw_mci_zx_parse_dt(struct dw_mci *host)
 	struct device_node *node;
 	struct dw_mci_zx_priv_data *priv;
 	struct regmap *sysc_base;
-	int ret;
 
 	/* syscon is needed only by emmc */
 	node = of_parse_phandle(np, "zte,aon-syscon", 0);
@@ -163,13 +162,9 @@ static int dw_mci_zx_parse_dt(struct dw_mci *host)
 		sysc_base = syscon_node_to_regmap(node);
 		of_node_put(node);
 
-		if (IS_ERR(sysc_base)) {
-			ret = PTR_ERR(sysc_base);
-			if (ret != -EPROBE_DEFER)
-				dev_err(host->dev, "Can't get syscon: %d\n",
-					ret);
-			return ret;
-		}
+		if (IS_ERR(sysc_base))
+			return dev_err_probe(host->dev, PTR_ERR(sysc_base),
+					     "Can't get syscon\n");
 	} else {
 		return 0;
 	}
-- 
2.17.1


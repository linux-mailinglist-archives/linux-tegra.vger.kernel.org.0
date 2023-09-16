Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C60527A2EA8
	for <lists+linux-tegra@lfdr.de>; Sat, 16 Sep 2023 10:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbjIPIMH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 16 Sep 2023 04:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbjIPILm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 16 Sep 2023 04:11:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E47919AD
        for <linux-tegra@vger.kernel.org>; Sat, 16 Sep 2023 01:11:37 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9109FC433CD;
        Sat, 16 Sep 2023 08:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694851896;
        bh=k+EgMO48VJPl+HjO+Hwx9k/pRjhpwRrvBBp+z5uHuOA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gGjbG3NcBcZIJ7tpqtuZoL2zZNoxErWFHC0rmmQ/60zEcbA4EttoGPMInsTX7b1K5
         4D1FOAO6FgVfC/lI8ByZrdzDQAiA92qADKiKGEsjpGEa9IVSJNBn8d56BeFaiaIjs4
         DJFZ0kSEzpV3NdGhGG8VZIij65keerTrL2dsKophdQw+W9OLd4YG4lzTsv+xknAl7G
         3Sal9uC3mIVctoO1DsgUVYQpv9yyNCODVkF9KnTX9dgDGVub1tuo8vngrNM44WfyY5
         MIuqRF9SOV/RrTuDKzMUwWLOCGtn8p2D/4rNOXMoxgyYh1V4vVRV/kSuI1z4MQ3una
         6eiX8kywOVmww==
From:   Jisheng Zhang <jszhang@kernel.org>
To:     Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Samin Guo <samin.guo@starfivetech.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Russell King <linux@armlinux.org.uk>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2 09/23] net: stmmac: dwmac-lpc18xx: use devm_stmmac_probe_config_dt()
Date:   Sat, 16 Sep 2023 15:58:15 +0800
Message-Id: <20230916075829.1560-10-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Simplify the driver's probe() function by using the devres
variant of stmmac_probe_config_dt().

The remove_new() callback now needs to be switched to
stmmac_pltfr_remove_no_dt().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../ethernet/stmicro/stmmac/dwmac-lpc18xx.c   | 21 +++++--------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
index d0aa674ce705..dad23b47f383 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
@@ -37,7 +37,7 @@ static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
@@ -46,8 +46,7 @@ static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 	reg = syscon_regmap_lookup_by_compatible("nxp,lpc1850-creg");
 	if (IS_ERR(reg)) {
 		dev_err(&pdev->dev, "syscon lookup failed\n");
-		ret = PTR_ERR(reg);
-		goto err_remove_config_dt;
+		return PTR_ERR(reg);
 	}
 
 	if (plat_dat->mac_interface == PHY_INTERFACE_MODE_MII) {
@@ -56,23 +55,13 @@ static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 		ethmode = LPC18XX_CREG_CREG6_ETHMODE_RMII;
 	} else {
 		dev_err(&pdev->dev, "Only MII and RMII mode supported\n");
-		ret = -EINVAL;
-		goto err_remove_config_dt;
+		return -EINVAL;
 	}
 
 	regmap_update_bits(reg, LPC18XX_CREG_CREG6,
 			   LPC18XX_CREG_CREG6_ETHMODE_MASK, ethmode);
 
-	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (ret)
-		goto err_remove_config_dt;
-
-	return 0;
-
-err_remove_config_dt:
-	stmmac_remove_config_dt(pdev, plat_dat);
-
-	return ret;
+	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 }
 
 static const struct of_device_id lpc18xx_dwmac_match[] = {
@@ -83,7 +72,7 @@ MODULE_DEVICE_TABLE(of, lpc18xx_dwmac_match);
 
 static struct platform_driver lpc18xx_dwmac_driver = {
 	.probe  = lpc18xx_dwmac_probe,
-	.remove_new = stmmac_pltfr_remove,
+	.remove_new = stmmac_pltfr_remove_no_dt,
 	.driver = {
 		.name           = "lpc18xx-dwmac",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.40.1


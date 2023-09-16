Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC5217A2E9D
	for <lists+linux-tegra@lfdr.de>; Sat, 16 Sep 2023 10:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbjIPILg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 16 Sep 2023 04:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbjIPILS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 16 Sep 2023 04:11:18 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D3D19AD
        for <linux-tegra@vger.kernel.org>; Sat, 16 Sep 2023 01:11:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF26C433C8;
        Sat, 16 Sep 2023 08:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694851873;
        bh=9K+bAgFgRSoe75AY/oNP9w5m5JVVUzg6VzRkj5SAnuM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ljNcgs9nfQ1hLzjCiWOz6Ifb92pKkp4OSzdvFoL7LUfOfCpL1maNkY21Q7cbCnqlr
         XHEqxpM6O99Tf8nTMxbHFjMjR/b2o37aVO60YFYFbzFilO9OwOAiOjvR3Fmn+1bNuX
         ldFbj67aB8I7uScxZrCMHjMIOJzJw43ZI9z9yjC2lWhScWVSuPnz0LTJCnTfcBvVd/
         syxxccX+u3r7/cAzQfut1SPK4vZPKTMSaWWZ3D782P0wffMxhR1ftl4w481v+CFPId
         gCzzHD6yAYkEHgL3vmxxxZ1icD947exPVoB0tri+oWOjNW2DYLPW5rtD8rnzZ0Gf+n
         S/vYs6MxfGbhw==
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
Subject: [PATCH net-next v2 06/23] net: stmmac: dwmac-ingenic: use devm_stmmac_probe_config_dt()
Date:   Sat, 16 Sep 2023 15:58:12 +0800
Message-Id: <20230916075829.1560-7-jszhang@kernel.org>
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
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 35 ++++++-------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 0a20c3d24722..3f87053ffc07 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -241,29 +241,25 @@ static int ingenic_mac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
 	mac = devm_kzalloc(&pdev->dev, sizeof(*mac), GFP_KERNEL);
-	if (!mac) {
-		ret = -ENOMEM;
-		goto err_remove_config_dt;
-	}
+	if (!mac)
+		return -ENOMEM;
 
 	data = of_device_get_match_data(&pdev->dev);
 	if (!data) {
 		dev_err(&pdev->dev, "No of match data provided\n");
-		ret = -EINVAL;
-		goto err_remove_config_dt;
+		return -EINVAL;
 	}
 
 	/* Get MAC PHY control register */
 	mac->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "mode-reg");
 	if (IS_ERR(mac->regmap)) {
 		dev_err(&pdev->dev, "%s: Failed to get syscon regmap\n", __func__);
-		ret = PTR_ERR(mac->regmap);
-		goto err_remove_config_dt;
+		return PTR_ERR(mac->regmap);
 	}
 
 	if (!of_property_read_u32(pdev->dev.of_node, "tx-clk-delay-ps", &tx_delay_ps)) {
@@ -272,8 +268,7 @@ static int ingenic_mac_probe(struct platform_device *pdev)
 			mac->tx_delay = tx_delay_ps * 1000;
 		} else {
 			dev_err(&pdev->dev, "Invalid TX clock delay: %dps\n", tx_delay_ps);
-			ret = -EINVAL;
-			goto err_remove_config_dt;
+			return -EINVAL;
 		}
 	}
 
@@ -283,8 +278,7 @@ static int ingenic_mac_probe(struct platform_device *pdev)
 			mac->rx_delay = rx_delay_ps * 1000;
 		} else {
 			dev_err(&pdev->dev, "Invalid RX clock delay: %dps\n", rx_delay_ps);
-			ret = -EINVAL;
-			goto err_remove_config_dt;
+			return -EINVAL;
 		}
 	}
 
@@ -295,18 +289,9 @@ static int ingenic_mac_probe(struct platform_device *pdev)
 
 	ret = ingenic_mac_init(plat_dat);
 	if (ret)
-		goto err_remove_config_dt;
-
-	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (ret)
-		goto err_remove_config_dt;
-
-	return 0;
-
-err_remove_config_dt:
-	stmmac_remove_config_dt(pdev, plat_dat);
+		return ret;
 
-	return ret;
+	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -385,7 +370,7 @@ MODULE_DEVICE_TABLE(of, ingenic_mac_of_matches);
 
 static struct platform_driver ingenic_mac_driver = {
 	.probe		= ingenic_mac_probe,
-	.remove_new	= stmmac_pltfr_remove,
+	.remove_new	= stmmac_pltfr_remove_no_dt,
 	.driver		= {
 		.name	= "ingenic-mac",
 		.pm		= pm_ptr(&ingenic_mac_pm_ops),
-- 
2.40.1


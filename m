Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3997A2E9F
	for <lists+linux-tegra@lfdr.de>; Sat, 16 Sep 2023 10:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231998AbjIPILh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 16 Sep 2023 04:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232489AbjIPILe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 16 Sep 2023 04:11:34 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2065C19AD
        for <linux-tegra@vger.kernel.org>; Sat, 16 Sep 2023 01:11:30 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6093C433C8;
        Sat, 16 Sep 2023 08:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694851889;
        bh=08rPVmjgSTC5liiFw2rBYcil6Ema5CtgYx2svnPVZ9s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RJ+Cti+Eoi31M9upPtCd/V3Dy9zjfLqjLJ8ymW2fPjh3cBGsvwyt3foSM3X2Lvzly
         F176DdkyuaiJyVeZ8YbAR9fPZtBC0kNTQ3dXyJaWzx++9eQwalLawksMYzretBdns7
         A5NDFD6A0e2Mhjok6m03ntOhIVBzkChFkTqJNmkf0RYPtkGQkRqRwoXkpJClV/Bjo7
         m4mSN5aTce7zZzV5AaeZl9qkegCjOlLbzr62jtcNwF+E4IwcquAbtF6VSGdcrGf6PB
         ZZbseIbpKwKyV7+hg0Vs4UZ3QNHsXgvxZ49SfUAizzvgEDd8J7182hfOT3CTScLsS8
         4OqTv6K7FtJxg==
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
Subject: [PATCH net-next v2 08/23] net: stmmac: dwmac-ipq806x: use devm_stmmac_probe_config_dt()
Date:   Sat, 16 Sep 2023 15:58:14 +0800
Message-Id: <20230916075829.1560-9-jszhang@kernel.org>
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
 .../ethernet/stmicro/stmmac/dwmac-ipq806x.c   | 29 ++++++-------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
index 9b0200749109..a9916fd07616 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
@@ -384,22 +384,20 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 	if (val)
 		return val;
 
-	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
 	gmac = devm_kzalloc(dev, sizeof(*gmac), GFP_KERNEL);
-	if (!gmac) {
-		err = -ENOMEM;
-		goto err_remove_config_dt;
-	}
+	if (!gmac)
+		return -ENOMEM;
 
 	gmac->pdev = pdev;
 
 	err = ipq806x_gmac_of_parse(gmac);
 	if (err) {
 		dev_err(dev, "device tree parsing error\n");
-		goto err_remove_config_dt;
+		return err;
 	}
 
 	regmap_write(gmac->qsgmii_csr, QSGMII_PCS_CAL_LCKDT_CTL,
@@ -459,11 +457,11 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 	if (gmac->phy_mode == PHY_INTERFACE_MODE_SGMII) {
 		err = ipq806x_gmac_configure_qsgmii_params(gmac);
 		if (err)
-			goto err_remove_config_dt;
+			return err;
 
 		err = ipq806x_gmac_configure_qsgmii_pcs_speed(gmac);
 		if (err)
-			goto err_remove_config_dt;
+			return err;
 	}
 
 	plat_dat->has_gmac = true;
@@ -473,21 +471,12 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 	plat_dat->tx_fifo_size = 8192;
 	plat_dat->rx_fifo_size = 8192;
 
-	err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (err)
-		goto err_remove_config_dt;
-
-	return 0;
+	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 
 err_unsupported_phy:
 	dev_err(&pdev->dev, "Unsupported PHY mode: \"%s\"\n",
 		phy_modes(gmac->phy_mode));
-	err = -EINVAL;
-
-err_remove_config_dt:
-	stmmac_remove_config_dt(pdev, plat_dat);
-
-	return err;
+	return -EINVAL;
 }
 
 static const struct of_device_id ipq806x_gmac_dwmac_match[] = {
@@ -498,7 +487,7 @@ MODULE_DEVICE_TABLE(of, ipq806x_gmac_dwmac_match);
 
 static struct platform_driver ipq806x_gmac_dwmac_driver = {
 	.probe = ipq806x_gmac_probe,
-	.remove_new = stmmac_pltfr_remove,
+	.remove_new = stmmac_pltfr_remove_no_dt,
 	.driver = {
 		.name		= "ipq806x-gmac-dwmac",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.40.1


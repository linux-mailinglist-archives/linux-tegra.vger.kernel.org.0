Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 799407A2EBE
	for <lists+linux-tegra@lfdr.de>; Sat, 16 Sep 2023 10:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbjIPINo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 16 Sep 2023 04:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbjIPINS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 16 Sep 2023 04:13:18 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E24DE19AD
        for <linux-tegra@vger.kernel.org>; Sat, 16 Sep 2023 01:13:13 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754C6C43391;
        Sat, 16 Sep 2023 08:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694851993;
        bh=SbggMlwJmGCB60uPWKaRi5TsR0G979nd8MU9xOIf0lo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uXSdb0bhIxN0kQMA76OEwrbI8wVWljqxCRLq7WOcHzQBXC/VR9SL7OiaBND9bS8Ql
         UCugoEdaqhd0REzK1bwto/i5rtvyfhl8jQI1CDtt6dEbsk0yNu4edCMJz9Gdvkgq9+
         +kF2rbFNV1v7YcKqKtLORvAiNQSdiT9wvY7PfB85hCgpefuSM5cKL6xfGvcpMvZtkn
         uD3l0NZRsXjdlgmwkZgH/Sz9IloouFroW6TE8xiAfi8o0GynY8rrnPLj3N5vKLui1n
         ZZXzIHJWxCq1WDxT7bwirT80KL2/joCYGfPGGsbNespTMauW6p1LPvxAbgBjGCtTRz
         Njkq0gUGcXwBg==
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
Subject: [PATCH net-next v2 23/23] net: stmmac: make stmmac_{probe|remove}_config_dt static
Date:   Sat, 16 Sep 2023 15:58:29 +0800
Message-Id: <20230916075829.1560-24-jszhang@kernel.org>
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

Now there's no external users of these two functions, make them static
so that there aren't any new usages of stmmac_probe_config_dt().

To avoid forward declaration, move stmmac_remove_config_dt() location.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Suggested-by: Russell King <linux@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 47 +++++++------------
 .../ethernet/stmicro/stmmac/stmmac_platform.h |  4 --
 2 files changed, 17 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 716434b58321..2063de1683b2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -384,6 +384,22 @@ static int stmmac_of_get_mac_mode(struct device_node *np)
 	return -ENODEV;
 }
 
+/**
+ * stmmac_remove_config_dt - undo the effects of stmmac_probe_config_dt()
+ * @pdev: platform_device structure
+ * @plat: driver data platform structure
+ *
+ * Release resources claimed by stmmac_probe_config_dt().
+ */
+static void stmmac_remove_config_dt(struct platform_device *pdev,
+				    struct plat_stmmacenet_data *plat)
+{
+	clk_disable_unprepare(plat->stmmac_clk);
+	clk_disable_unprepare(plat->pclk);
+	of_node_put(plat->phy_node);
+	of_node_put(plat->mdio_node);
+}
+
 /**
  * stmmac_probe_config_dt - parse device-tree driver parameters
  * @pdev: platform_device structure
@@ -392,7 +408,7 @@ static int stmmac_of_get_mac_mode(struct device_node *np)
  * this function is to read the driver parameters from device-tree and
  * set some private fields that will be used by the main at runtime.
  */
-struct plat_stmmacenet_data *
+static struct plat_stmmacenet_data *
 stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -662,43 +678,14 @@ devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 
 	return plat;
 }
-
-/**
- * stmmac_remove_config_dt - undo the effects of stmmac_probe_config_dt()
- * @pdev: platform_device structure
- * @plat: driver data platform structure
- *
- * Release resources claimed by stmmac_probe_config_dt().
- */
-void stmmac_remove_config_dt(struct platform_device *pdev,
-			     struct plat_stmmacenet_data *plat)
-{
-	clk_disable_unprepare(plat->stmmac_clk);
-	clk_disable_unprepare(plat->pclk);
-	of_node_put(plat->phy_node);
-	of_node_put(plat->mdio_node);
-}
 #else
-struct plat_stmmacenet_data *
-stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
-{
-	return ERR_PTR(-EINVAL);
-}
-
 struct plat_stmmacenet_data *
 devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 {
 	return ERR_PTR(-EINVAL);
 }
-
-void stmmac_remove_config_dt(struct platform_device *pdev,
-			     struct plat_stmmacenet_data *plat)
-{
-}
 #endif /* CONFIG_OF */
-EXPORT_SYMBOL_GPL(stmmac_probe_config_dt);
 EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);
-EXPORT_SYMBOL_GPL(stmmac_remove_config_dt);
 
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
index bb07a99e1248..bb6fc7e59aed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
@@ -11,12 +11,8 @@
 
 #include "stmmac.h"
 
-struct plat_stmmacenet_data *
-stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac);
 struct plat_stmmacenet_data *
 devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac);
-void stmmac_remove_config_dt(struct platform_device *pdev,
-			     struct plat_stmmacenet_data *plat);
 
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res);
-- 
2.40.1


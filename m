Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69EB46D4C1E
	for <lists+linux-tegra@lfdr.de>; Mon,  3 Apr 2023 17:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232947AbjDCPk1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 3 Apr 2023 11:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232937AbjDCPk0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Apr 2023 11:40:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2860426B3
        for <linux-tegra@vger.kernel.org>; Mon,  3 Apr 2023 08:40:25 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMIA-0004gX-3j; Mon, 03 Apr 2023 17:40:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI9-008ibf-2I; Mon, 03 Apr 2023 17:40:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI8-00AHxb-9K; Mon, 03 Apr 2023 17:40:20 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Marc Dietrich <marvin24@gmx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        linux-staging@lists.linux.dev, kernel@pengutronix.de
Subject: [PATCH 18/24] staging: nvec: Convert to platform remove callback returning void
Date:   Mon,  3 Apr 2023 17:40:08 +0200
Message-Id: <20230403154014.2564054-19-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=v4zy4HCqWC6d6NtkhHPv4ftLRwyDuBoR4dXO01W0udY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvNKRqCZFANcwOrFlRNMDzoMEmhGOWfXirNy/ Kh1Mrq+N2uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzSgAKCRCPgPtYfRL+ TiGLB/0YjYWJuDGyqFasGbLZPITvSfXxuodpZ/XCDtiwM+qRt5DD8z2RWcgIdQRP+C1INlLRP31 jJR7FCk81xUDh/z2G0VGnDUTlaC5Sbv+cYfL67fTENL8r+3Fj/rRECB6i2s2LNmEPk7eIV9uhTb YVAHMebWHcfW0ExEYo5pkRZ0U0t9Mova+/Jyc17FZ6842ybgPqY56QQn1DbaFcxOVfTeKMOvZ1W J1VHSfXWesMLfR7P+knpL3nMPb7A47Kb4BMju7xXEAMkUqRswCJWGYRnlCd30xKkuFUvwoPw5ma mpNK+MhcEF6Vg0dQ6oP15LTcjpmP7lned3y/veEJC8dHqaqU
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/staging/nvec/nvec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index b3f114cb00dc..2823cacde130 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -882,7 +882,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_nvec_remove(struct platform_device *pdev)
+static void tegra_nvec_remove(struct platform_device *pdev)
 {
 	struct nvec_chip *nvec = platform_get_drvdata(pdev);
 
@@ -893,8 +893,6 @@ static int tegra_nvec_remove(struct platform_device *pdev)
 	cancel_work_sync(&nvec->tx_work);
 	/* FIXME: needs check whether nvec is responsible for power off */
 	pm_power_off = NULL;
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -942,7 +940,7 @@ MODULE_DEVICE_TABLE(of, nvidia_nvec_of_match);
 
 static struct platform_driver nvec_device_driver = {
 	.probe   = tegra_nvec_probe,
-	.remove  = tegra_nvec_remove,
+	.remove_new = tegra_nvec_remove,
 	.driver  = {
 		.name = "nvec",
 		.pm = &nvec_pm_ops,
-- 
2.39.2


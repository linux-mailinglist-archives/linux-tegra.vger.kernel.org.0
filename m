Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8FD86C5196
	for <lists+linux-tegra@lfdr.de>; Wed, 22 Mar 2023 18:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjCVRC5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 22 Mar 2023 13:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbjCVRCw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Mar 2023 13:02:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5033C637F7
        for <linux-tegra@vger.kernel.org>; Wed, 22 Mar 2023 10:02:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pf1r2-0000PY-24; Wed, 22 Mar 2023 18:02:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pf1r1-005xk1-Bq; Wed, 22 Mar 2023 18:02:27 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pf1r0-0075pX-Lk; Wed, 22 Mar 2023 18:02:26 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 04/12] drm/tegra: dpaux: Convert to platform remove callback returning void
Date:   Wed, 22 Mar 2023 18:02:15 +0100
Message-Id: <20230322170223.410376-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
References: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=6Tyw8Au9KpeTmv6RYa0mwqi6I44JPDfcpUHMvWx+Rmc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGzSSyr/X+oOnKYm6NOiZf0PRm/AbXaEFQOJvq 8uDcTGwH1WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBs0kgAKCRCPgPtYfRL+ Tg1bB/9YomilV0m5Cnr/29R//t7XFy9u2Tk7YvXzL+06/R6FWj7ItkGjCBtEriW2kJieI0Tfqvo 1o2Fhgb3n0NfKMVWZCH/663etX0vGupSoqGENX58RfQkHnSfxn5wi7Z2GfyuTRKx32k2QZBjHmd ebtpEVC4Fs1Zlywd2Tm5maQhZ/sy5qVqMTJLzVTjYsVxaV7+SSxN0uFW2dqr4LrDCthv1oavvJQ Myfunh0T6423aeK/DR4L/1JhNiGn4aDAXuoce5P/XC75LUHLztR4TxggyCDc5xLSuuk4u2sJ49t Bee9eKocbQXp6srCXbfcmhcZml3Ru4GhFuBPm72BCsxW4Rrx
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
 drivers/gpu/drm/tegra/dpaux.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 3c84e73d5051..4d2677dcd831 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -579,7 +579,7 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_dpaux_remove(struct platform_device *pdev)
+static void tegra_dpaux_remove(struct platform_device *pdev)
 {
 	struct tegra_dpaux *dpaux = platform_get_drvdata(pdev);
 
@@ -594,8 +594,6 @@ static int tegra_dpaux_remove(struct platform_device *pdev)
 	mutex_lock(&dpaux_lock);
 	list_del(&dpaux->list);
 	mutex_unlock(&dpaux_lock);
-
-	return 0;
 }
 
 static int tegra_dpaux_suspend(struct device *dev)
@@ -695,7 +693,7 @@ struct platform_driver tegra_dpaux_driver = {
 		.pm = pm_ptr(&tegra_dpaux_pm_ops),
 	},
 	.probe = tegra_dpaux_probe,
-	.remove = tegra_dpaux_remove,
+	.remove_new = tegra_dpaux_remove,
 };
 
 struct drm_dp_aux *drm_dp_aux_find_by_of_node(struct device_node *np)
-- 
2.39.2


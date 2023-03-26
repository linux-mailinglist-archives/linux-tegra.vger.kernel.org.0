Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D56BF6C9523
	for <lists+linux-tegra@lfdr.de>; Sun, 26 Mar 2023 16:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232390AbjCZOci (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 26 Mar 2023 10:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232378AbjCZOch (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2637AB0
        for <linux-tegra@vger.kernel.org>; Sun, 26 Mar 2023 07:32:35 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ5-0007m3-5H; Sun, 26 Mar 2023 16:32:29 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ4-006rZO-El; Sun, 26 Mar 2023 16:32:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ3-0088UP-PV; Sun, 26 Mar 2023 16:32:27 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 010/117] media: tegra_cec: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:37 +0200
Message-Id: <20230326143224.572654-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1802; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=WdH7zj7jJfhuqfwnTFIvZL9loWPxn7zYQd+ZSpifBkg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFaBJ/gZrFMF+ndWuQKY8bBkUcpv6VtZTD1ke iKnnmWfPpWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWgQAKCRCPgPtYfRL+ TqsMB/9bhK7nISK4AJ6iiDvOXMZ0TL7t335DQyf5QD484DG+LlcUDp37CGlG1MZfzi5fckQvF4i LSRyNdQ3wUat+Pfp0WPrlzwVN6/ls+NH039bpF9LVBVIQfUyUWeSuaDCKZq+Hl1AWSFov0RJPB4 oRELcdf/h4URiBQjmqhz6oraiyEzjtKp5/vAF5Wx19n2TsuiM+JRTc93v8TmP2kOuR2+G7lZ3S4 VEf+K1SoOX166LOwKAqi4/OtA9UdHxs9Lb+2EA75JrZhL+yUmy9swIIQOkQxT+t6/ziCePj2YJH s08AbAOnGZ2hv/McNuMT+eKU1scWnkRWgYM4ZaqFkNlZo3Tl
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
 drivers/media/cec/platform/tegra/tegra_cec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/platform/tegra/tegra_cec.c b/drivers/media/cec/platform/tegra/tegra_cec.c
index 5e907395ca2e..04dc06e3c42a 100644
--- a/drivers/media/cec/platform/tegra/tegra_cec.c
+++ b/drivers/media/cec/platform/tegra/tegra_cec.c
@@ -421,7 +421,7 @@ static int tegra_cec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tegra_cec_remove(struct platform_device *pdev)
+static void tegra_cec_remove(struct platform_device *pdev)
 {
 	struct tegra_cec *cec = platform_get_drvdata(pdev);
 
@@ -429,8 +429,6 @@ static int tegra_cec_remove(struct platform_device *pdev)
 
 	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
 	cec_unregister_adapter(cec->adap);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -467,7 +465,7 @@ static struct platform_driver tegra_cec_driver = {
 		.of_match_table = of_match_ptr(tegra_cec_of_match),
 	},
 	.probe = tegra_cec_probe,
-	.remove = tegra_cec_remove,
+	.remove_new = tegra_cec_remove,
 
 #ifdef CONFIG_PM
 	.suspend = tegra_cec_suspend,
-- 
2.39.2


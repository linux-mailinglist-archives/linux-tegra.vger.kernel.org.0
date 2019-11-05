Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD477EFDD0
	for <lists+linux-tegra@lfdr.de>; Tue,  5 Nov 2019 13:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388753AbfKEM7w (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 5 Nov 2019 07:59:52 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:60046 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388678AbfKEM7v (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Nov 2019 07:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=iFTVrYBWldjdkzW4JZSdAbgJD9mchpp3GHteGBcrZ8A=; b=rM8HUP7vSr369xXLxxXEq8irU
        6fYZedFYbcmsD4l6CFVXW6O2OuPWWY2G5S43+xBj28YCuydxJHW9C+7j+97g0dclDqeaqhiB2BRMw
        Neyk4Rv0vCqD3SisQlkqp1TapRCHQMYCdZZY5b+8a0nlxFMV1vmflyeR5jy0Mier7hLjk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iRyR0-0006ao-Nv; Tue, 05 Nov 2019 12:59:46 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id D1134274301E; Tue,  5 Nov 2019 12:59:45 +0000 (GMT)
From:   Mark Brown <broonie@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH] drm/tegra: Fix regulator_get_optional() misuse
Date:   Tue,  5 Nov 2019 12:59:42 +0000
Message-Id: <20191105125943.34729-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The tegra driver requests a supply using regulator_get_optional()
but both the name of the supply and the usage pattern suggest that it is
being used for the main power for the device and is not at all optional
for the device for function, there is no meaningful handling for absent
supplies.  Such regulators should use the vanilla regulator_get()
interface, it will ensure that even if a supply is not described in the
system integration one will be provided in software.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/gpu/drm/tegra/dpaux.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 622cdf1ad246..38686f56ea2f 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -505,18 +505,14 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	dpaux->vdd = devm_regulator_get_optional(&pdev->dev, "vdd");
+	dpaux->vdd = devm_regulator_get(&pdev->dev, "vdd");
 	if (IS_ERR(dpaux->vdd)) {
-		if (PTR_ERR(dpaux->vdd) != -ENODEV) {
-			if (PTR_ERR(dpaux->vdd) != -EPROBE_DEFER)
-				dev_err(&pdev->dev,
-					"failed to get VDD supply: %ld\n",
-					PTR_ERR(dpaux->vdd));
-
-			return PTR_ERR(dpaux->vdd);
-		}
+		if (PTR_ERR(dpaux->vdd) != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"failed to get VDD supply: %ld\n",
+				PTR_ERR(dpaux->vdd));
 
-		dpaux->vdd = NULL;
+		return PTR_ERR(dpaux->vdd);
 	}
 
 	platform_set_drvdata(pdev, dpaux);
@@ -731,11 +727,9 @@ int drm_dp_aux_attach(struct drm_dp_aux *aux, struct tegra_output *output)
 	if (output->panel) {
 		enum drm_connector_status status;
 
-		if (dpaux->vdd) {
-			err = regulator_enable(dpaux->vdd);
-			if (err < 0)
-				return err;
-		}
+		err = regulator_enable(dpaux->vdd);
+		if (err < 0)
+			return err;
 
 		timeout = jiffies + msecs_to_jiffies(250);
 
@@ -767,11 +761,9 @@ int drm_dp_aux_detach(struct drm_dp_aux *aux)
 	if (dpaux->output->panel) {
 		enum drm_connector_status status;
 
-		if (dpaux->vdd) {
-			err = regulator_disable(dpaux->vdd);
-			if (err < 0)
-				return err;
-		}
+		err = regulator_disable(dpaux->vdd);
+		if (err < 0)
+			return err;
 
 		timeout = jiffies + msecs_to_jiffies(250);
 
-- 
2.20.1


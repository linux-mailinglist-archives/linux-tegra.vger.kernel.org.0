Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61A5DE38B0
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439933AbfJXQqh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:37 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43663 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439929AbfJXQqh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:37 -0400
Received: by mail-wr1-f66.google.com with SMTP id c2so21633082wrr.10
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iMW1mQmGwhfwXdD0TwS083j3m2VDJ4duIHXhlFj6dGs=;
        b=QYhXARciu25ZEWJRn9o+psu9voKzav1JhB48fbUwCZSIaXb/PzD+4Mfx41+4A5yTlu
         mubvTGZQxcPDOinhWLRLxW3lUyXSYCTo86ITUpw+s0aE2GI2HhBGZnA9wzAEvLExmmEi
         AgUEdcdNW4dYkMSxEdgCk0P0cxWu9Xzijfo9lHj7c8/fYmZs8J+VaYYFrEt3rWG3H0i/
         hFH50c/1xVaOsOGUZ/ItpPjM/JrOBTkqFfxpYkZefFtEiFfEtTPINmXPwhvD7eU6Xa6e
         /ftBmcMmesrN8ZuGJ/78rtc/FVNDr/6c1CFGyR5CxnxBJF7KjB5EDs3sK1QtPtlwHR4L
         gYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iMW1mQmGwhfwXdD0TwS083j3m2VDJ4duIHXhlFj6dGs=;
        b=Qyfyp7GimW4KvVCsAX8W54z+Y0390lcqUmiFAJ1kpsFJLNDeBef5HwYVtxfwB0fH2I
         4cWkSTh/cOwERHp3xsf7gO7TJbMu04UII6KTKXiNKkul45Y/qL4JgJnbCC3imzfb0NV2
         QoUrPyWt8sbKO+AD+4oiky4Ix1sFx0GTMBDHOwqnyBBEckWFAuMJ0Y00XmWW7C+m2r40
         7HcPRALxeoVIp7j/QHLOoOwL/mw+Gha9uXyEX8OUtQU9/TaA3GAMMRDajkTNKSMtnDD2
         bg7q/6T5RBNta5E2MYqOQyY8Zc5sWQFPi1Vv8csCOuWEcslyXgGXKkrdlP93vldjPONz
         xrKg==
X-Gm-Message-State: APjAAAWr7Vo7qef517RAFKx2GuZ4+aHw9hwvKIS0QN5ykg5/La3dIAGV
        Jpyem7s35eEAYwNvW9nOvOk1Bcjr
X-Google-Smtp-Source: APXvYqwVw44G8up3OS83sLFxGoT/QcfUFY9wLUHtHn16GMxo2IjKgwdHCVgeXS2Uo/LjEyJZNWzk+A==
X-Received: by 2002:a5d:6787:: with SMTP id v7mr4902264wru.392.1571935593949;
        Thu, 24 Oct 2019 09:46:33 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id q18sm82168wmk.39.2019.10.24.09.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:32 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 25/32] drm/tegra: sor: Deduplicate connector type detection code
Date:   Thu, 24 Oct 2019 18:45:27 +0200
Message-Id: <20191024164534.132764-26-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The connector type detection code is duplicated in two places. Keeping
both places in sync is an extra maintenance burden that can be avoided
by comparing the connector type operations that are set upon the first
detection.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 218 ++++++++++++++++++------------------
 1 file changed, 109 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 71a7ed57cb4f..af234d5efbd7 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3135,6 +3135,112 @@ static const struct drm_encoder_helper_funcs tegra_sor_dp_helpers = {
 	.atomic_check = tegra_sor_encoder_atomic_check,
 };
 
+static const struct tegra_sor_ops tegra_sor_edp_ops = {
+	.name = "eDP",
+};
+
+static int tegra_sor_hdmi_probe(struct tegra_sor *sor)
+{
+	int err;
+
+	sor->avdd_io_supply = devm_regulator_get(sor->dev, "avdd-io");
+	if (IS_ERR(sor->avdd_io_supply)) {
+		dev_err(sor->dev, "cannot get AVDD I/O supply: %ld\n",
+			PTR_ERR(sor->avdd_io_supply));
+		return PTR_ERR(sor->avdd_io_supply);
+	}
+
+	err = regulator_enable(sor->avdd_io_supply);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to enable AVDD I/O supply: %d\n",
+			err);
+		return err;
+	}
+
+	sor->vdd_pll_supply = devm_regulator_get(sor->dev, "vdd-pll");
+	if (IS_ERR(sor->vdd_pll_supply)) {
+		dev_err(sor->dev, "cannot get VDD PLL supply: %ld\n",
+			PTR_ERR(sor->vdd_pll_supply));
+		return PTR_ERR(sor->vdd_pll_supply);
+	}
+
+	err = regulator_enable(sor->vdd_pll_supply);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to enable VDD PLL supply: %d\n",
+			err);
+		return err;
+	}
+
+	sor->hdmi_supply = devm_regulator_get(sor->dev, "hdmi");
+	if (IS_ERR(sor->hdmi_supply)) {
+		dev_err(sor->dev, "cannot get HDMI supply: %ld\n",
+			PTR_ERR(sor->hdmi_supply));
+		return PTR_ERR(sor->hdmi_supply);
+	}
+
+	err = regulator_enable(sor->hdmi_supply);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to enable HDMI supply: %d\n", err);
+		return err;
+	}
+
+	INIT_DELAYED_WORK(&sor->scdc, tegra_sor_hdmi_scdc_work);
+
+	return 0;
+}
+
+static int tegra_sor_hdmi_remove(struct tegra_sor *sor)
+{
+	regulator_disable(sor->hdmi_supply);
+	regulator_disable(sor->vdd_pll_supply);
+	regulator_disable(sor->avdd_io_supply);
+
+	return 0;
+}
+
+static const struct tegra_sor_ops tegra_sor_hdmi_ops = {
+	.name = "HDMI",
+	.probe = tegra_sor_hdmi_probe,
+	.remove = tegra_sor_hdmi_remove,
+};
+
+static int tegra_sor_dp_probe(struct tegra_sor *sor)
+{
+	int err;
+
+	sor->avdd_io_supply = devm_regulator_get(sor->dev, "avdd-io-hdmi-dp");
+	if (IS_ERR(sor->avdd_io_supply))
+		return PTR_ERR(sor->avdd_io_supply);
+
+	err = regulator_enable(sor->avdd_io_supply);
+	if (err < 0)
+		return err;
+
+	sor->vdd_pll_supply = devm_regulator_get(sor->dev, "vdd-hdmi-dp-pll");
+	if (IS_ERR(sor->vdd_pll_supply))
+		return PTR_ERR(sor->vdd_pll_supply);
+
+	err = regulator_enable(sor->vdd_pll_supply);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static int tegra_sor_dp_remove(struct tegra_sor *sor)
+{
+	regulator_disable(sor->vdd_pll_supply);
+	regulator_disable(sor->avdd_io_supply);
+
+	return 0;
+}
+
+static const struct tegra_sor_ops tegra_sor_dp_ops = {
+	.name = "DP",
+	.probe = tegra_sor_dp_probe,
+	.remove = tegra_sor_dp_remove,
+};
+
 static int tegra_sor_init(struct host1x_client *client)
 {
 	struct drm_device *drm = dev_get_drvdata(client->parent);
@@ -3145,7 +3251,7 @@ static int tegra_sor_init(struct host1x_client *client)
 	int err;
 
 	if (!sor->aux) {
-		if (sor->soc->supports_hdmi) {
+		if (sor->ops == &tegra_sor_hdmi_ops) {
 			connector = DRM_MODE_CONNECTOR_HDMIA;
 			encoder = DRM_MODE_ENCODER_TMDS;
 			helpers = &tegra_sor_hdmi_helpers;
@@ -3154,11 +3260,11 @@ static int tegra_sor_init(struct host1x_client *client)
 			encoder = DRM_MODE_ENCODER_LVDS;
 		}
 	} else {
-		if (sor->soc->supports_edp) {
+		if (sor->ops == &tegra_sor_edp_ops) {
 			connector = DRM_MODE_CONNECTOR_eDP;
 			encoder = DRM_MODE_ENCODER_TMDS;
 			helpers = &tegra_sor_edp_helpers;
-		} else if (sor->soc->supports_dp) {
+		} else {
 			connector = DRM_MODE_CONNECTOR_DisplayPort;
 			encoder = DRM_MODE_ENCODER_TMDS;
 			helpers = &tegra_sor_dp_helpers;
@@ -3278,112 +3384,6 @@ static const struct host1x_client_ops sor_client_ops = {
 	.exit = tegra_sor_exit,
 };
 
-static const struct tegra_sor_ops tegra_sor_edp_ops = {
-	.name = "eDP",
-};
-
-static int tegra_sor_hdmi_probe(struct tegra_sor *sor)
-{
-	int err;
-
-	sor->avdd_io_supply = devm_regulator_get(sor->dev, "avdd-io");
-	if (IS_ERR(sor->avdd_io_supply)) {
-		dev_err(sor->dev, "cannot get AVDD I/O supply: %ld\n",
-			PTR_ERR(sor->avdd_io_supply));
-		return PTR_ERR(sor->avdd_io_supply);
-	}
-
-	err = regulator_enable(sor->avdd_io_supply);
-	if (err < 0) {
-		dev_err(sor->dev, "failed to enable AVDD I/O supply: %d\n",
-			err);
-		return err;
-	}
-
-	sor->vdd_pll_supply = devm_regulator_get(sor->dev, "vdd-pll");
-	if (IS_ERR(sor->vdd_pll_supply)) {
-		dev_err(sor->dev, "cannot get VDD PLL supply: %ld\n",
-			PTR_ERR(sor->vdd_pll_supply));
-		return PTR_ERR(sor->vdd_pll_supply);
-	}
-
-	err = regulator_enable(sor->vdd_pll_supply);
-	if (err < 0) {
-		dev_err(sor->dev, "failed to enable VDD PLL supply: %d\n",
-			err);
-		return err;
-	}
-
-	sor->hdmi_supply = devm_regulator_get(sor->dev, "hdmi");
-	if (IS_ERR(sor->hdmi_supply)) {
-		dev_err(sor->dev, "cannot get HDMI supply: %ld\n",
-			PTR_ERR(sor->hdmi_supply));
-		return PTR_ERR(sor->hdmi_supply);
-	}
-
-	err = regulator_enable(sor->hdmi_supply);
-	if (err < 0) {
-		dev_err(sor->dev, "failed to enable HDMI supply: %d\n", err);
-		return err;
-	}
-
-	INIT_DELAYED_WORK(&sor->scdc, tegra_sor_hdmi_scdc_work);
-
-	return 0;
-}
-
-static int tegra_sor_hdmi_remove(struct tegra_sor *sor)
-{
-	regulator_disable(sor->hdmi_supply);
-	regulator_disable(sor->vdd_pll_supply);
-	regulator_disable(sor->avdd_io_supply);
-
-	return 0;
-}
-
-static const struct tegra_sor_ops tegra_sor_hdmi_ops = {
-	.name = "HDMI",
-	.probe = tegra_sor_hdmi_probe,
-	.remove = tegra_sor_hdmi_remove,
-};
-
-static int tegra_sor_dp_probe(struct tegra_sor *sor)
-{
-	int err;
-
-	sor->avdd_io_supply = devm_regulator_get(sor->dev, "avdd-io-hdmi-dp");
-	if (IS_ERR(sor->avdd_io_supply))
-		return PTR_ERR(sor->avdd_io_supply);
-
-	err = regulator_enable(sor->avdd_io_supply);
-	if (err < 0)
-		return err;
-
-	sor->vdd_pll_supply = devm_regulator_get(sor->dev, "vdd-hdmi-dp-pll");
-	if (IS_ERR(sor->vdd_pll_supply))
-		return PTR_ERR(sor->vdd_pll_supply);
-
-	err = regulator_enable(sor->vdd_pll_supply);
-	if (err < 0)
-		return err;
-
-	return 0;
-}
-
-static int tegra_sor_dp_remove(struct tegra_sor *sor)
-{
-	regulator_disable(sor->vdd_pll_supply);
-	regulator_disable(sor->avdd_io_supply);
-
-	return 0;
-}
-
-static const struct tegra_sor_ops tegra_sor_dp_ops = {
-	.name = "DP",
-	.probe = tegra_sor_dp_probe,
-	.remove = tegra_sor_dp_remove,
-};
-
 static const u8 tegra124_sor_xbar_cfg[5] = {
 	0, 1, 2, 3, 4
 };
-- 
2.23.0


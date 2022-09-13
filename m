Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9945B6E30
	for <lists+linux-tegra@lfdr.de>; Tue, 13 Sep 2022 15:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbiIMNPV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 13 Sep 2022 09:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231528AbiIMNPP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Sep 2022 09:15:15 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E4411825;
        Tue, 13 Sep 2022 06:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=cC12j9P8ru5KBXVnbrH+bmEMVgxfMYkSNhABeawipyA=; b=oFpiDA7J/BkgsLGxlluEHHWg1t
        l2kISF6/T73kWZtg0WrA/KSmXiHniH9eicbRW7VUvJ3UUJnJHAKR8bSL1dcamxb8QkEZhYWVq4Cyu
        DUl4qjUiMl47Ngb2Jj9qZTxVpx34jf6ZJC6RrKcETUWw6Xcn9BZAhwdXVpJt1hewyx2ED0IXTrKWw
        g50ksP730JIaTn2eeyCTXaEwlwOkVnZ3Q+JDhgi7J+gY+JIc0eDua5xuVEDxrD/XMsF2jOjxSJqM1
        ZkEocClm57Ep723zz2LVBV38xElNsHmn+AFSkY4u8snbri3otFNSLwc+Bx4D3POP6YVDjBzUBXMjx
        gpAb8ltA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1oY5ki-00EVnM-4x; Tue, 13 Sep 2022 16:15:00 +0300
From:   Mikko Perttunen <cyndis@kapsi.fi>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] drm/tegra: nvdec: Support multiple clocks
Date:   Tue, 13 Sep 2022 16:14:44 +0300
Message-Id: <20220913131447.2877280-7-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220913131447.2877280-1-cyndis@kapsi.fi>
References: <20220913131447.2877280-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

NVDEC on Tegra234 requires multiple clocks. Add support for that.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/nvdec.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 276fe0472730..05af4d107421 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2015-2021, NVIDIA Corporation.
+ * Copyright (c) 2015-2022, NVIDIA Corporation.
  */
 
 #include <linux/clk.h>
@@ -28,6 +28,7 @@ struct nvdec_config {
 	const char *firmware;
 	unsigned int version;
 	bool supports_sid;
+	bool has_extra_clocks;
 };
 
 struct nvdec {
@@ -37,7 +38,8 @@ struct nvdec {
 	struct tegra_drm_client client;
 	struct host1x_channel *channel;
 	struct device *dev;
-	struct clk *clk;
+	struct clk_bulk_data clks[3];
+	unsigned int num_clks;
 
 	/* Platform configuration */
 	const struct nvdec_config *config;
@@ -258,7 +260,7 @@ static __maybe_unused int nvdec_runtime_resume(struct device *dev)
 	struct nvdec *nvdec = dev_get_drvdata(dev);
 	int err;
 
-	err = clk_prepare_enable(nvdec->clk);
+	err = clk_bulk_prepare_enable(nvdec->num_clks, nvdec->clks);
 	if (err < 0)
 		return err;
 
@@ -275,7 +277,7 @@ static __maybe_unused int nvdec_runtime_resume(struct device *dev)
 	return 0;
 
 disable:
-	clk_disable_unprepare(nvdec->clk);
+	clk_bulk_disable_unprepare(nvdec->num_clks, nvdec->clks);
 	return err;
 }
 
@@ -285,7 +287,7 @@ static __maybe_unused int nvdec_runtime_suspend(struct device *dev)
 
 	host1x_channel_stop(nvdec->channel);
 
-	clk_disable_unprepare(nvdec->clk);
+	clk_bulk_disable_unprepare(nvdec->num_clks, nvdec->clks);
 
 	return 0;
 }
@@ -383,13 +385,22 @@ static int nvdec_probe(struct platform_device *pdev)
 	if (IS_ERR(nvdec->regs))
 		return PTR_ERR(nvdec->regs);
 
-	nvdec->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(nvdec->clk)) {
-		dev_err(&pdev->dev, "failed to get clock\n");
-		return PTR_ERR(nvdec->clk);
+	nvdec->clks[0].id = "nvdec";
+	nvdec->num_clks = 1;
+
+	if (nvdec->config->has_extra_clocks) {
+		nvdec->num_clks = 3;
+		nvdec->clks[1].id = "fuse";
+		nvdec->clks[2].id = "tsec_pka";
+	}
+
+	err = devm_clk_bulk_get(dev, nvdec->num_clks, nvdec->clks);
+	if (err) {
+		dev_err(&pdev->dev, "failed to get clock(s)\n");
+		return err;
 	}
 
-	err = clk_set_rate(nvdec->clk, ULONG_MAX);
+	err = clk_set_rate(nvdec->clks[0].clk, ULONG_MAX);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to set clock rate\n");
 		return err;
-- 
2.37.0


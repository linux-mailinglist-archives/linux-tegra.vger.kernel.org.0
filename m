Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 660B414F0F9
	for <lists+linux-tegra@lfdr.de>; Fri, 31 Jan 2020 17:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgAaQ7X (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 31 Jan 2020 11:59:23 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40055 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbgAaQ7W (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 Jan 2020 11:59:22 -0500
Received: by mail-wr1-f66.google.com with SMTP id j104so9479449wrj.7
        for <linux-tegra@vger.kernel.org>; Fri, 31 Jan 2020 08:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wQbiMynpfVPPrNJxXYaw3jxoUhpOgBmncIBPZJtRStU=;
        b=MbVYeghzo+NgKiM8ooaeTo4UbkiDXoo9tdGeGtGWXiM/a7e81s4tydAOoUPg0Mchcr
         cZryM0TCxN78C9lcpInk9lS/LyMhh1SyHyXXuk3DCM5ejbnbjpVkLN2VvAbbIbRgIjVe
         NdpCZfc8NE/zarnq0RjBVTAHEbkjO0gw0CVq9xFbaj+IT8G3+iRSpoFiDJTUXHRV6W3G
         FUqsKXh2OmEz/YBe2veJrqLofoQXn2uYtqdbIDJWTWv+yb4ggcJriCTkUtb9NMtQkgqR
         V99CWq92KIRUgkYhvxQj3lT2bWQQQX8GPwfDzl9utyp+wiMCRgSd/XrDycb/Rt11Iw2P
         k+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wQbiMynpfVPPrNJxXYaw3jxoUhpOgBmncIBPZJtRStU=;
        b=uJZHqG8zBl9kL+vv7LafhxvJI+FQkbXuZYaQwl6cDVuNZozeLzGJF5ZE4JFyAlbygk
         B0BCizzQIQXcoo3Gctj/raRQO3lWioQKrx1Myc6N2YOg07iV24ET9dsqXQ5bz6G5bYFm
         bXQC+VANhN5i6PnUoeld/ZIPKN3TFG3hkQAbwv32gjpwXMOCDOszE9ZX61+vADvu8W66
         nYNMrcRhDnkxjOkFVwGMzk8ElK5RDTneszDMlIBmKBYLUDcv1ubRLQ5O21SocvhoUvr5
         Bq+F3ifQpBcos1ZbS/7RCQKaQrI6lRouLRckUx8GgYEi6E1hO3vyx3gPoanBQxgQFIzZ
         torw==
X-Gm-Message-State: APjAAAX15PzXAKCU6315khuevm9tBZXcuV8JwgJQ57hZt33DPkCT3BAd
        rxcWl5QdWjNdp3my2zot71Y=
X-Google-Smtp-Source: APXvYqyn3LNfK3NOmN52oGzs/TpnmrSBuO6kVdIDXHYTYQTNDi1LiYuP4B1iyIfgpm9+T+WpEl85uQ==
X-Received: by 2002:adf:fd8d:: with SMTP id d13mr4346271wrr.208.1580489960712;
        Fri, 31 Jan 2020 08:59:20 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id t81sm11318241wmg.6.2020.01.31.08.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 08:59:19 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 3/3] drm/tegra: sor: Initialize runtime PM before use
Date:   Fri, 31 Jan 2020 17:59:10 +0100
Message-Id: <20200131165910.3443936-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131165910.3443936-1-thierry.reding@gmail.com>
References: <20200131165910.3443936-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Commit fd67e9c6ed5a ("drm/tegra: Do not implement runtime PM") replaced
the generic runtime PM usage by a host1x bus-specific implementation in
order to work around some assumptions baked into runtime PM that are in
conflict with the requirements in the Tegra DRM driver.

Unfortunately the new runtime PM callbacks are not setup yet at the time
when the SOR driver first needs to resume the device to register the SOR
pad clock, and accesses to register will cause the system to hang.

Note that this only happens on Tegra124 and Tegra210 because those are
the only SoCs where the SOR pad clock is registered from the SOR driver.
Later generations use a SOR pad clock provided by the BPMP.

Fix this by moving the registration of the SOR pad clock after the
host1x client has been registered. That's somewhat suboptimal because
this could potentially, though it's very unlikely, cause the Tegra DRM
to be probed if the SOR happens to be the last subdevice to register,
only to be immediately removed again if the SOR pad output clock fails
to register. That's just a minor annoyance, though, and doesn't justify
implementing a workaround.

Fixes: fd67e9c6ed5a ("drm/tegra: Do not implement runtime PM")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index aa4e1695b537..81226a4953c1 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3915,6 +3915,17 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, sor);
 	pm_runtime_enable(&pdev->dev);
 
+	INIT_LIST_HEAD(&sor->client.list);
+	sor->client.ops = &sor_client_ops;
+	sor->client.dev = &pdev->dev;
+
+	err = host1x_client_register(&sor->client);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
+			err);
+		goto rpm_disable;
+	}
+
 	/*
 	 * On Tegra210 and earlier, provide our own implementation for the
 	 * pad output clock.
@@ -3926,13 +3937,13 @@ static int tegra_sor_probe(struct platform_device *pdev)
 				      sor->index);
 		if (!name) {
 			err = -ENOMEM;
-			goto rpm_disable;
+			goto unregister;
 		}
 
 		err = host1x_client_resume(&sor->client);
 		if (err < 0) {
 			dev_err(sor->dev, "failed to resume: %d\n", err);
-			goto rpm_disable;
+			goto unregister;
 		}
 
 		sor->clk_pad = tegra_clk_sor_pad_register(sor, name);
@@ -3941,24 +3952,15 @@ static int tegra_sor_probe(struct platform_device *pdev)
 
 	if (IS_ERR(sor->clk_pad)) {
 		err = PTR_ERR(sor->clk_pad);
-		dev_err(&pdev->dev, "failed to register SOR pad clock: %d\n",
+		dev_err(sor->dev, "failed to register SOR pad clock: %d\n",
 			err);
-		goto rpm_disable;
-	}
-
-	INIT_LIST_HEAD(&sor->client.list);
-	sor->client.ops = &sor_client_ops;
-	sor->client.dev = &pdev->dev;
-
-	err = host1x_client_register(&sor->client);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
-			err);
-		goto rpm_disable;
+		goto unregister;
 	}
 
 	return 0;
 
+unregister:
+	host1x_client_unregister(&sor->client);
 rpm_disable:
 	pm_runtime_disable(&pdev->dev);
 remove:
-- 
2.24.1


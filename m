Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E77DD1101FD
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Dec 2019 17:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbfLCQT2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 3 Dec 2019 11:19:28 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37305 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfLCQT2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Dec 2019 11:19:28 -0500
Received: by mail-wr1-f65.google.com with SMTP id w15so4425742wru.4
        for <linux-tegra@vger.kernel.org>; Tue, 03 Dec 2019 08:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pvQehkVTnZhXOtbF2Az2asg2sLoVMRuQyXqH7URMAHM=;
        b=Mrhr+/Wn9ZoXUAeQh0b/8qtNuL4ue3b/8nabr8jiNHIXLbo3hN56imCCyjJOfDdzab
         IdiNTZEbydnQGfTNkmNJiRIyzZTxNiHICvxxdFq1i150uGN6O3ykVwVIBfEyneDxUQJ3
         WIiTKS1oVmcY2dms0mmP9oeDNk32JgdtgjkE0ia75P/RpIalqMjUHzPuBmtNyNRRWP4a
         2ZF4p0+bMrSbzS2hM0jJxe35/kpTM8NEnnvj69tsr4BzpmDHNYPFE/YG5MV7WeEhb4Fk
         EGwc7Hx0XPciwFIYbT+cMt9uAhXkEKLDBJglbKNQa5HFD11oKRJ0pgpCbCLl1UxzxXOM
         cSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pvQehkVTnZhXOtbF2Az2asg2sLoVMRuQyXqH7URMAHM=;
        b=SWF5xSAA6ArumLh24pCQsGCH6gVLMGtFe0w0wCix+sgcVdH6TxFH4V4NI2OYRhirxA
         a+mweDYxw8B5SgwBFNNzAbJ4DYQTZr9uvo4dt0xPR0ybg5n9t80ZGeQ9YfoZJQdHtN3F
         yOLBbJQuWv7dfDAyZotTRemaoa0K0xLVFTUMaEzdmb+yxWCLxyPGrXHzYWyxY6SWZyw8
         +OvdCgYmkQHu79zcCfJkAdQGFCnZeeC4ZEO9YhsVeWwpeUfxyRfHMs6Dw5N2iBjnOS58
         CXnTKWFk0vKMfKJkGJx+1INKIReTgXPzmW45xq9CO9uA3q5IIF1RFg/R68sMxooqpRLU
         gYLA==
X-Gm-Message-State: APjAAAXIbBldEd+x8wCTjPuB4x6rNXzvxVEsuRdq7lPH5FKL9cVJrYar
        Nq4LmZu+LYdJu0Bxg6/+2+I=
X-Google-Smtp-Source: APXvYqy+DcGAlAhe1ldzMVwN7qNiMU9+r376sbkbfD9Fshi4/avfLvvX5mcOke2PpX86Q3t2S3JqHg==
X-Received: by 2002:adf:814c:: with SMTP id 70mr5814983wrm.157.1575389966593;
        Tue, 03 Dec 2019 08:19:26 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id k13sm2901194wrx.59.2019.12.03.08.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 08:19:25 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 5/9] drm/tegra: sor: Implement system suspend/resume
Date:   Tue,  3 Dec 2019 17:19:10 +0100
Message-Id: <20191203161914.1312555-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203161914.1312555-1-thierry.reding@gmail.com>
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Upon system suspend, make sure the +5V HDMI regulator is disabled. This
avoids potentially leaking current to the HDMI connector. This also
makes sure that upon resume the regulator is enabled again, which in
some cases is necessary to properly restore the state of the supply on
resume.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 615cb319fa8b..2200f4cd397a 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3912,8 +3912,7 @@ static int tegra_sor_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int tegra_sor_suspend(struct device *dev)
+static int tegra_sor_runtime_suspend(struct device *dev)
 {
 	struct tegra_sor *sor = dev_get_drvdata(dev);
 	int err;
@@ -3935,7 +3934,7 @@ static int tegra_sor_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra_sor_resume(struct device *dev)
+static int tegra_sor_runtime_resume(struct device *dev)
 {
 	struct tegra_sor *sor = dev_get_drvdata(dev);
 	int err;
@@ -3967,10 +3966,25 @@ static int tegra_sor_resume(struct device *dev)
 
 	return 0;
 }
-#endif
+
+static int tegra_sor_suspend(struct device *dev)
+{
+	struct tegra_sor *sor = dev_get_drvdata(dev);
+
+	return regulator_disable(sor->hdmi_supply);
+}
+
+static int tegra_sor_resume(struct device *dev)
+{
+	struct tegra_sor *sor = dev_get_drvdata(dev);
+
+	return regulator_enable(sor->hdmi_supply);
+}
 
 static const struct dev_pm_ops tegra_sor_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra_sor_suspend, tegra_sor_resume, NULL)
+	SET_RUNTIME_PM_OPS(tegra_sor_runtime_suspend, tegra_sor_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(tegra_sor_suspend, tegra_sor_resume)
 };
 
 struct platform_driver tegra_sor_driver = {
-- 
2.23.0


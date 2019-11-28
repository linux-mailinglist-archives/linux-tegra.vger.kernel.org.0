Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFA110CBDC
	for <lists+linux-tegra@lfdr.de>; Thu, 28 Nov 2019 16:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbfK1Ph5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 28 Nov 2019 10:37:57 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46068 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfK1Ph5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Nov 2019 10:37:57 -0500
Received: by mail-wr1-f65.google.com with SMTP id j42so5815143wrj.12
        for <linux-tegra@vger.kernel.org>; Thu, 28 Nov 2019 07:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e3Cc2//Jedy29iR0NuLCg+mBJ8hMbnZaK6sR0m6EGNQ=;
        b=RyG9SEIHXQokDPgRMb6Ai6MV7qEqx+HTV6eSrAom/gBWkIthW++azf4Z8u38FcJtPV
         OBInrLDESevAmWoYj+DyRQ/AeDQL+zEAkkUxQybxeczbP2kLmtq1ywsup/QzS7bG7N0v
         ByRETWp/bxEky5PmjWQx2TyvSt8MLmp140oRLYjQU85EfFMdtvdjAyAKcKyWZ1hUN5To
         ug/cFueZ9KYE1BFmMmXnun1B4RaC3wraprTL5v7BuhHkEM4Pj+XXATYC2FbpI66QLoOM
         PY8kMz0lVFSai3b0Az2Xcjr6HrM6s7Bz3jXKCGHzlGK9LIvXXlgPC+oavPcfudb1kQfP
         +blA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e3Cc2//Jedy29iR0NuLCg+mBJ8hMbnZaK6sR0m6EGNQ=;
        b=fsZzT664MgmgvCTE1RjoKXIpO/jx+70N/6JS0CDTAV/ztJG561zNkht6c30//xPfHX
         LE2rQLS6liYJf1xL1Nzw/VROYHwQTkso5Om6hmLh27zX7KI/JlUE2yXEXqOw14dVlmKe
         DrcLqsn5m6OHHxQas0/j58UPjwE00jtD4lI51uYy7PrOo0NARmGeixHsciPl7+UnEjrz
         crVOIRUJptvMOfU5zzmdEBJ9nYvERL4sXj6Y4Y4h9QihwWI5hq8qRFDSCYYL170lcjHs
         MiR8EJWZUOmmBu8LMXTduAitUKNIXpUt0P8cu8C4e53A7mxuk5fw2roSTrFWAzZI0DuT
         pIZA==
X-Gm-Message-State: APjAAAWDafL66eStyZ8qKyXs9GKeYMKjEGwN1lSzPVmr3zZRMuBBpHqq
        zq2aXJCLoUxTFtOvT4ix09U=
X-Google-Smtp-Source: APXvYqznLbmloFE8Kzv2U0a0B5MP/NJG2iQfE289tpiPsFMKGQ9gKYgSUMDx8bFN9WzZ44BhSG8VNg==
X-Received: by 2002:a5d:4d4a:: with SMTP id a10mr41209977wru.220.1574955473108;
        Thu, 28 Nov 2019 07:37:53 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id a184sm1541637wmf.29.2019.11.28.07.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 07:37:52 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 5/9] drm/tegra: sor: Implement system suspend/resume
Date:   Thu, 28 Nov 2019 16:37:37 +0100
Message-Id: <20191128153741.2380419-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128153741.2380419-1-thierry.reding@gmail.com>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
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


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A24314F0F8
	for <lists+linux-tegra@lfdr.de>; Fri, 31 Jan 2020 17:59:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgAaQ7W (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 31 Jan 2020 11:59:22 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35427 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbgAaQ7V (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 Jan 2020 11:59:21 -0500
Received: by mail-wm1-f65.google.com with SMTP id b17so9534076wmb.0
        for <linux-tegra@vger.kernel.org>; Fri, 31 Jan 2020 08:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tFVWuzX4dpiuVcm7bt11QnW0UsmzfKUdG9zKT00asMo=;
        b=U3k8FsFmi8+R7lCOuOopjOLuib6rPTvUGj0/sthF0KAWR0Y8TrrfRIhQSFXasG3jpW
         XG3Z6+8FLNHFPqrrcHLgXiTNlztpvyficzP8sKWHL6Du7WLxz6NgcbhnXx4jupIYWEbI
         zzVIVKu3TjXCJLojyrGW0l5pXSU9oGzLnYmuZ2fuGnfusUZ5fONHFUSMTsu+/nQmiLpf
         QbE4t30lBSrnK03heNyUq0klW26MF2/ctGVmExdFYaXbPBH+0mRvdPuDjG9c0dgDC/cF
         QPgn1M3Z+NIZ9NYRBHbQT4R9ef47SQ8gOt2kvjEtneqdW6MgTFbN3FI99ymWUG/Kk5x3
         y3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tFVWuzX4dpiuVcm7bt11QnW0UsmzfKUdG9zKT00asMo=;
        b=YzGxlz81sCzn62qNmVso4mSVNtNmWGcI781sPyycxpSNBmAzgvEmyUx7RJ3BSDVSQ1
         pRpIBGZSvsPWWq/MIk69sH/8z9hBFqxp7T6kNRVaDFUkSJAhnM69U8qRRpl1PpZ20T/j
         EMJ+YHTCl4wQIZBlOfZKgJXgasuak2y2EPKqNyAXYsQsuX+RokbkRFYveRJXgMBHJRex
         7v61lsNQzVIY7Ts5MCfiAPbpbz3R1N9aHJgzyUY5+x07QkX3pFObKO1+Y8bjWFytL1qW
         9a6BII0jaDHk3QX+u4DLcC72qAISyCr4ArhCWtIjaNteF/NwcVaKCf/x7e4NWMnbKg3n
         KJCw==
X-Gm-Message-State: APjAAAWUqqufwFHQzcZjF8lO9+W5cvLvFl9heKNuCr4oMfP4MIBgo1oQ
        gQVNRE7HndTClao1xCleeVY=
X-Google-Smtp-Source: APXvYqxa/shC66PT99wshHrGseadERprvysLfDHqvWeGihhukMVhIhmJmR2+keZBtUwsRVkuGx+ZJw==
X-Received: by 2002:a7b:c4c5:: with SMTP id g5mr13404678wmk.85.1580489959004;
        Fri, 31 Jan 2020 08:59:19 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id w17sm12206360wrt.89.2020.01.31.08.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 08:59:17 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 2/3] drm/tegra: sor: Disable runtime PM on probe failure
Date:   Fri, 31 Jan 2020 17:59:09 +0100
Message-Id: <20200131165910.3443936-2-thierry.reding@gmail.com>
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

If the driver fails to probe, make sure to disable runtime PM again.

While at it, make the cleanup code in ->remove() symmetric.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 96cd89bb2e82..aa4e1695b537 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3926,13 +3926,13 @@ static int tegra_sor_probe(struct platform_device *pdev)
 				      sor->index);
 		if (!name) {
 			err = -ENOMEM;
-			goto remove;
+			goto rpm_disable;
 		}
 
 		err = host1x_client_resume(&sor->client);
 		if (err < 0) {
 			dev_err(sor->dev, "failed to resume: %d\n", err);
-			goto remove;
+			goto rpm_disable;
 		}
 
 		sor->clk_pad = tegra_clk_sor_pad_register(sor, name);
@@ -3943,7 +3943,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 		err = PTR_ERR(sor->clk_pad);
 		dev_err(&pdev->dev, "failed to register SOR pad clock: %d\n",
 			err);
-		goto remove;
+		goto rpm_disable;
 	}
 
 	INIT_LIST_HEAD(&sor->client.list);
@@ -3954,11 +3954,13 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
-		goto remove;
+		goto rpm_disable;
 	}
 
 	return 0;
 
+rpm_disable:
+	pm_runtime_disable(&pdev->dev);
 remove:
 	if (sor->ops && sor->ops->remove)
 		sor->ops->remove(sor);
@@ -3972,8 +3974,6 @@ static int tegra_sor_remove(struct platform_device *pdev)
 	struct tegra_sor *sor = platform_get_drvdata(pdev);
 	int err;
 
-	pm_runtime_disable(&pdev->dev);
-
 	err = host1x_client_unregister(&sor->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
@@ -3981,6 +3981,8 @@ static int tegra_sor_remove(struct platform_device *pdev)
 		return err;
 	}
 
+	pm_runtime_disable(&pdev->dev);
+
 	if (sor->ops && sor->ops->remove) {
 		err = sor->ops->remove(sor);
 		if (err < 0)
-- 
2.24.1


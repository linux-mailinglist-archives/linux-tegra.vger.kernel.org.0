Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FAD1D6305
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Oct 2019 14:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731431AbfJNMvN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Oct 2019 08:51:13 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53443 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731029AbfJNMvM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Oct 2019 08:51:12 -0400
Received: by mail-wm1-f68.google.com with SMTP id i16so17146965wmd.3
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2019 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B5fuJB7QmtV9h7aBVewhTK71Ks0pgNS4kdo609/xFbo=;
        b=uD7vU7d6OrpaUKwtuchmc0iH50x9zTlPXy7BcOJu4sWXI/SQQ2woE6sEm/DEqC7p1n
         t5RF6Jo+hCWPcJVl5l8AhEWEcVivkgdqVVEgZl1TPZtN2Kx/S4HwH+tkhkBRiTDZxPyo
         VYa2q0F7wCEf3x4dgzkS2OLKnCm22IAZEqDJEZNO+3Yp35cLQQwGwJGDk03BmvH3MKXi
         tuXsqzpUDTXvjtqu7+i3CkiuEV084bh/2vQxvncSjNbE0v+Pc1mwcPAyhhxY+zWcSod1
         syAETGIUdShjefqAwdh5yi085uQ/gOMEIyVZiu+dn1vJIkF8VN+cLxY1fdsa+4Fwokub
         5FgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B5fuJB7QmtV9h7aBVewhTK71Ks0pgNS4kdo609/xFbo=;
        b=NVXjSiUAVYZGEr1+YFXs17O7PGpDdhjePzCVhdzxkAnIEEP6fCKPrT0kg302OdYHdD
         hlA0xU4OS4how2DXyDCWWrifKGyntygdRc3H2n+ZQWA4v6sJVfY891fYPe2/EpDos5Hw
         bASLxn6V3JuRXJ9OW+E2Glhn0xPO7QwCWvcuLBeDDv3Q/1How0KUDPru/FwwaWN8wfO7
         ybDEwlrl0iPoNyCo5pyYpTfgNldOc9OBfcUt6aT4GdFCywJjq+F7jANze9qkZAnpNXr2
         UI3LrceQpIMnknDA6p9eduthNlhBc5gtQHNcyQTo5/aBUCMOT0jWCzDk2VtLSGebFjM1
         cBxw==
X-Gm-Message-State: APjAAAVSOyFbWA5okP6oVoZvnZJaAFXb8Ojrjj/r7FoGiGcP3OC/qxOV
        PY1H3Dc774DaLij/DDulcw4=
X-Google-Smtp-Source: APXvYqxCDvHffZXht1XHuIbS0QlRApgWVwhVUWF+hNratzEVbOVK6iZZnoRmz0hhM8KUZR4o03xguA==
X-Received: by 2002:a1c:1dc9:: with SMTP id d192mr15685966wmd.51.1571057470705;
        Mon, 14 Oct 2019 05:51:10 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id a192sm16440048wma.1.2019.10.14.05.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:51:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 09/14] drm/tegra: vic: Use common IOMMU attach/detach code
Date:   Mon, 14 Oct 2019 14:50:44 +0200
Message-Id: <20191014125049.425101-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Reuse common code to attach to or detach from an IOMMU domain.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index d60e479cde92..e4b17c7ce708 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -34,7 +34,7 @@ struct vic {
 	void __iomem *regs;
 	struct tegra_drm_client client;
 	struct host1x_channel *channel;
-	struct iommu_domain *domain;
+	struct iommu_group *group;
 	struct device *dev;
 	struct clk *clk;
 	struct reset_control *rst;
@@ -183,21 +183,16 @@ static const struct falcon_ops vic_falcon_ops = {
 static int vic_init(struct host1x_client *client)
 {
 	struct tegra_drm_client *drm = host1x_to_drm_client(client);
-	struct iommu_group *group = iommu_group_get(client->dev);
 	struct drm_device *dev = dev_get_drvdata(client->parent);
 	struct tegra_drm *tegra = dev->dev_private;
 	struct vic *vic = to_vic(drm);
 	int err;
 
-	if (group && tegra->domain) {
-		err = iommu_attach_group(tegra->domain, group);
-		if (err < 0) {
-			dev_err(vic->dev, "failed to attach to domain: %d\n",
-				err);
-			return err;
-		}
-
-		vic->domain = tegra->domain;
+	vic->group = host1x_client_iommu_attach(client, false);
+	if (IS_ERR(vic->group)) {
+		err = PTR_ERR(vic->group);
+		dev_err(vic->dev, "failed to attach to domain: %d\n", err);
+		return err;
 	}
 
 	vic->channel = host1x_channel_request(client);
@@ -229,8 +224,7 @@ static int vic_init(struct host1x_client *client)
 free_channel:
 	host1x_channel_put(vic->channel);
 detach:
-	if (group && tegra->domain)
-		iommu_detach_group(tegra->domain, group);
+	host1x_client_iommu_detach(client, vic->group);
 
 	return err;
 }
@@ -238,7 +232,6 @@ static int vic_init(struct host1x_client *client)
 static int vic_exit(struct host1x_client *client)
 {
 	struct tegra_drm_client *drm = host1x_to_drm_client(client);
-	struct iommu_group *group = iommu_group_get(client->dev);
 	struct drm_device *dev = dev_get_drvdata(client->parent);
 	struct tegra_drm *tegra = dev->dev_private;
 	struct vic *vic = to_vic(drm);
@@ -253,11 +246,7 @@ static int vic_exit(struct host1x_client *client)
 
 	host1x_syncpt_free(client->syncpts[0]);
 	host1x_channel_put(vic->channel);
-
-	if (vic->domain) {
-		iommu_detach_group(vic->domain, group);
-		vic->domain = NULL;
-	}
+	host1x_client_iommu_detach(client, vic->group);
 
 	return 0;
 }
-- 
2.23.0


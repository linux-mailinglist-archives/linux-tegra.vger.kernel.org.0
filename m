Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCB07128E51
	for <lists+linux-tegra@lfdr.de>; Sun, 22 Dec 2019 15:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfLVOKq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 22 Dec 2019 09:10:46 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39849 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfLVOKq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 22 Dec 2019 09:10:46 -0500
Received: by mail-wm1-f65.google.com with SMTP id 20so13565686wmj.4;
        Sun, 22 Dec 2019 06:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gypWLRrVcyfmXsR2Lq/xNfZI590shTJoNFs/LRxFM9k=;
        b=fPtWVoeZOG+Jis11ejJC365MxwVBPDZ7g+QyhTF8O+IdzM8l2PadMus/O68hVIW7dS
         kExO0Sd95JI9dUPUMBZ4o2D/rgVdqaks9iXncDetUxmKh3aLr49iOb7pdIDGKNswqNdb
         dTv+eGmE4da/N8WeZaSeM7bnVJpuCmzju1lAFJxNysMvBFhI8tPArJ7fYy5VLHvOHRBl
         GJ7PL5V3b6XI604zjQ7H6S/px+QwhtWSl727uzuTeViD9fRXOx7QnwJWfcYuOILyhUBe
         AJu+FXRo/72xSql53PnOc6CxSfphtgYSFrDd5JdIXj0uzGc5X8uY9X9OPC3FIX67Ldbv
         6Tsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gypWLRrVcyfmXsR2Lq/xNfZI590shTJoNFs/LRxFM9k=;
        b=FJEZX8yK3OwQREg11xrUv8Gp2m4Sxa6xGF1dNOxrn+LjFZXEfPYo+S+/DMMTpdf0W3
         /obIKAU+n8wUAsFERYT0QDEgdyRXpU7NZNaUSlfDXshCB3LL8Kf/m/qQXfXuYgBtkgkz
         vu9Q6BYCdEnbaT0+/9Hfh4bs4BOmhCkhCxIVUG5ftiL3Bv4F494l69UUPNxM/bcOdmMY
         3GWSHBHdfUDaVf2f5au+gKvErt/NCF3xP+/eu6Q618MMDy44zCPH0aDLi7sJB5IOTX1k
         yXcMiwF7C7cT84mvXKhdcz4RoA3anKyGStVlVzYbIxPXU0JTDyozbf6n9ei09dwcAheQ
         owDw==
X-Gm-Message-State: APjAAAXmVRKDPHzhR1gf0BLWJ7VxNxeBzY1kTCRW4XRud97+1Q/fNWF6
        OLTTWRrHg/8qaQlo3GEh1MQ=
X-Google-Smtp-Source: APXvYqwfQQ/i9Xw8UCOw53luspQWYcwLDoCCJmQaYEcZnycgiR6FaeP9pkigflvubw3L7Ds34KO/fg==
X-Received: by 2002:a1c:7901:: with SMTP id l1mr26455323wme.67.1577023844301;
        Sun, 22 Dec 2019 06:10:44 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id c4sm16570126wml.7.2019.12.22.06.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 06:10:43 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 04/13] memory: tegra: Rename tegra_mc to tegra186_mc on Tegra186
Date:   Sun, 22 Dec 2019 15:10:26 +0100
Message-Id: <20191222141035.1649937-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191222141035.1649937-1-thierry.reding@gmail.com>
References: <20191222141035.1649937-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This is just for consistency with the rest of the driver.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra186.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 441213a35930..f72e89877295 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -15,7 +15,7 @@ struct tegra_mc {
 	void __iomem *regs;
 };
 
-struct tegra_mc_client {
+struct tegra186_mc_client {
 	const char *name;
 	unsigned int sid;
 	struct {
@@ -24,7 +24,13 @@ struct tegra_mc_client {
 	} regs;
 };
 
-static const struct tegra_mc_client tegra186_mc_clients[] = {
+struct tegra186_mc {
+	struct memory_controller base;
+	struct device *dev;
+	void __iomem *regs;
+};
+
+static const struct tegra186_mc_client tegra186_mc_clients[] = {
 	{
 		.name = "ptcr",
 		.sid = TEGRA186_SID_PASSTHROUGH,
@@ -534,8 +540,8 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 
 static int tegra186_mc_probe(struct platform_device *pdev)
 {
+	struct tegra186_mc *mc;
 	struct resource *res;
-	struct tegra_mc *mc;
 	unsigned int i;
 	int err = 0;
 
@@ -551,7 +557,7 @@ static int tegra186_mc_probe(struct platform_device *pdev)
 	mc->dev = &pdev->dev;
 
 	for (i = 0; i < ARRAY_SIZE(tegra186_mc_clients); i++) {
-		const struct tegra_mc_client *client = &tegra186_mc_clients[i];
+		const struct tegra186_mc_client *client = &tegra186_mc_clients[i];
 		u32 override, security;
 
 		override = readl(mc->regs + client->regs.override);
-- 
2.24.1


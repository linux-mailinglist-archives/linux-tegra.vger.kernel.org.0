Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68BAF116F0C
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 15:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727621AbfLIOfa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Dec 2019 09:35:30 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41969 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727640AbfLIOf3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Dec 2019 09:35:29 -0500
Received: by mail-wr1-f65.google.com with SMTP id c9so16458850wrw.8
        for <linux-tegra@vger.kernel.org>; Mon, 09 Dec 2019 06:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w+/up9hfq8p4ACSSdrH1ZXd7EiQBLXwMXcYJzFgJaOc=;
        b=HNvyAgdEOD2w1gDlLb7eiaFWs4FgSrRvV87ajeNqAR6zqxVbc1EtNYsigYA/Re5VyY
         81BwPZ6odmVs/63pWoUXexjgYemn9M+NIaeVFVY8O11FoZQo56m9p6GU0GY/4Omh/fwW
         CzIV052dK4C6tpfyQxONgseQzFYtdIFGeHi0lMk8TXhJiOhep9+Lv+uPeGIiEPZg53H+
         2EGKsoz9vDoSd2sLVOxejGewI86bw2FxJXpMM3agj0W2mc7f3/qqUk7eOIWvpIUnfpKo
         TRMqIet8S1BNW0i06AJruQ+gp4uqhT+g15r2yjIqLh6B6Q2oHCAsaali4t+bDnd6ntrY
         iI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w+/up9hfq8p4ACSSdrH1ZXd7EiQBLXwMXcYJzFgJaOc=;
        b=txxuAZaRz7rd8UAkJoZX6xDjycVIJjy7kmzFGCwRiHy6igat69ewWVt7072wFumOjl
         Zpfn8mN2Hc/dAVfCUy1gKv+Ll4YpnuItjHGUG+hPOrCm+a3xsxYqMAF7KWiFutjMA6oI
         kveU+Vpq+SvGG7hi85YB9x7zZBS87pKp71uFLRS8W0Ev/+f3K+vsraR8i+k2YI5saiTu
         BeFOzrxBHxcgN5DeDkgnmFMaigLeGfbi38xbCd6GIYt7zrvO53c2KtqgLF51cC84RyUR
         4bJ1rrXUDvtYLkOup6uzsgJcTp666qqaclqyv45gs4WaDiIR8rWIPguDl+ay9rZIf+B9
         uCuw==
X-Gm-Message-State: APjAAAXRcaCinNxUpBIwbxAYFGkGQrgv5e0g8aUiTT6ZL8vrZXxKa7fL
        BYH+VTXfX+JR0hHo8sUsoSA=
X-Google-Smtp-Source: APXvYqyKds5tu0qb4MmQnhm021ZUXsdo14wPOu8h0clSObyGcgp7AspA9k6XyVybEIAt3zuxM5Qtsw==
X-Received: by 2002:adf:e6c6:: with SMTP id y6mr2574017wrm.284.1575902127288;
        Mon, 09 Dec 2019 06:35:27 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id q6sm28906963wrx.72.2019.12.09.06.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 06:35:26 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] memory: tegra: Extract memory client SID programming
Date:   Mon,  9 Dec 2019 15:35:20 +0100
Message-Id: <20191209143521.2357178-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209143521.2357178-1-thierry.reding@gmail.com>
References: <20191209143521.2357178-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Move programming of the memory client to SID mapping into a separate
function so that it can be reused from multiple call sites.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra186.c | 49 ++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index ad5c353dba6e..57895116c8e5 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -32,6 +32,32 @@ struct tegra186_mc {
 	const struct tegra186_mc_soc *soc;
 };
 
+static void tegra186_mc_program_sid(struct tegra186_mc *mc)
+{
+	unsigned int i;
+
+	for (i = 0; i < mc->soc->num_clients; i++) {
+		const struct tegra186_mc_client *client = &mc->soc->clients[i];
+		u32 override, security;
+
+		override = readl(mc->regs + client->regs.override);
+		security = readl(mc->regs + client->regs.security);
+
+		dev_dbg(mc->dev, "client %s: override: %x security: %x\n",
+			client->name, override, security);
+
+		dev_dbg(mc->dev, "setting SID %u for %s\n", client->sid,
+			client->name);
+		writel(client->sid, mc->regs + client->regs.override);
+
+		override = readl(mc->regs + client->regs.override);
+		security = readl(mc->regs + client->regs.security);
+
+		dev_dbg(mc->dev, "client %s: override: %x security: %x\n",
+			client->name, override, security);
+	}
+}
+
 static const struct tegra186_mc_client tegra186_mc_clients[] = {
 	{
 		.name = "ptcr",
@@ -549,7 +575,6 @@ static int tegra186_mc_probe(struct platform_device *pdev)
 {
 	struct tegra186_mc *mc;
 	struct resource *res;
-	unsigned int i;
 	int err;
 
 	mc = devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
@@ -565,28 +590,8 @@ static int tegra186_mc_probe(struct platform_device *pdev)
 
 	mc->dev = &pdev->dev;
 
-	for (i = 0; i < mc->soc->num_clients; i++) {
-		const struct tegra186_mc_client *client = &mc->soc->clients[i];
-		u32 override, security;
-
-		override = readl(mc->regs + client->regs.override);
-		security = readl(mc->regs + client->regs.security);
-
-		dev_dbg(&pdev->dev, "client %s: override: %x security: %x\n",
-			client->name, override, security);
-
-		dev_dbg(&pdev->dev, "setting SID %u for %s\n", client->sid,
-			client->name);
-		writel(client->sid, mc->regs + client->regs.override);
-
-		override = readl(mc->regs + client->regs.override);
-		security = readl(mc->regs + client->regs.security);
-
-		dev_dbg(&pdev->dev, "client %s: override: %x security: %x\n",
-			client->name, override, security);
-	}
-
 	platform_set_drvdata(pdev, mc);
+	tegra186_mc_program_sid(mc);
 
 	return err;
 }
-- 
2.23.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E449116F0B
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 15:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbfLIOf1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Dec 2019 09:35:27 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38643 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727666AbfLIOf1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Dec 2019 09:35:27 -0500
Received: by mail-wr1-f67.google.com with SMTP id y17so16468087wrh.5
        for <linux-tegra@vger.kernel.org>; Mon, 09 Dec 2019 06:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pVJO7p0o9DPYlpTp+A/mOyMkXB2XW+/pQeD4jA/+TpU=;
        b=slDLM5ysQZRF/kAf091dU61vqS/sYFT6gNsGh2WEcykkjVPXwbeTsxqTNOJcE7Kmd6
         r0FcyA3FvQq3Kg+1fM25y+MtJqKomOzLLMlC3DFSVay3ZXqU3Sxul/A7GmxUk165D98E
         7HMoPXAA/J6Tb+uqx9bhgKyYjA4VTCZv0amIhXDroQeImV1sts1yaMvb3ysJj+Kk2z3y
         mlrhiGK0mY1gb05MxoY9Yaf5Hxt1Sa3rdv7BVjFz/tIbGwq8aMcg+tw4Me/ObWQXbcKC
         ZCCr4EDB6+c13sJy5r81ITSfDIGSDN6ZCGk7s+4klTcgFjoJs+kvyhPSSkoPz4xUBRSs
         cl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pVJO7p0o9DPYlpTp+A/mOyMkXB2XW+/pQeD4jA/+TpU=;
        b=Twht/3iubhX7VUEqWFRY6rttMVTZDvH4xynRjf1Mgw5LoErn1tQs46NPN8kYpYQ/9T
         e4ov8TO8Xr+v9GbDtiO+kiFXE2Q2ZHfv9diC9ss4L3OqqKvozGqRZsLCdl/gq2ecM8nv
         rXlFh7HaAHi4fhczsPUac4PDGzSLTumTcNh/5DarYxW0cbSvJYSSfkRpBfdq6ZG1+sx4
         jXacCkHYKOKWj3bIDzSUYGcoDl/25rvtZC4nX52rPtIamfN5cID9BswLT7GZPmr91gP/
         iLAhidAG3R8E/bekpekaa69W74K02xmdZObRr37JNXhRmRZehwsYy/cs9vQiaXmrrpdZ
         bcnQ==
X-Gm-Message-State: APjAAAXWb1MtwRcgB8bdPY3Bur/lYCHjO8tumDVb4yenFOBxY/EWxfxJ
        MbqNiNf5IaRatH6H1Ua8CYlIftoV
X-Google-Smtp-Source: APXvYqz/ajgYyuq5a7RespWFuz0Vk3jwJqQTXoyxavQFwncKJO/uP48YzzSmJTg1p52aEz3kHpcR2g==
X-Received: by 2002:a5d:6406:: with SMTP id z6mr2401027wru.294.1575902125397;
        Mon, 09 Dec 2019 06:35:25 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id q15sm27625737wrr.11.2019.12.09.06.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 06:35:24 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] memory: tegra: Add per-SoC data for Tegra186
Date:   Mon,  9 Dec 2019 15:35:19 +0100
Message-Id: <20191209143521.2357178-2-thierry.reding@gmail.com>
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

Instead of hard-coding the memory client table, use per-SoC data in
preparation for adding support for other SoCs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra186.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index f72e89877295..ad5c353dba6e 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -6,15 +6,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/memory/tegra186-mc.h>
 
-struct tegra_mc {
-	struct device *dev;
-	void __iomem *regs;
-};
-
 struct tegra186_mc_client {
 	const char *name;
 	unsigned int sid;
@@ -24,10 +20,16 @@ struct tegra186_mc_client {
 	} regs;
 };
 
+struct tegra186_mc_soc {
+	const struct tegra186_mc_client *clients;
+	unsigned int num_clients;
+};
+
 struct tegra186_mc {
-	struct memory_controller base;
 	struct device *dev;
 	void __iomem *regs;
+
+	const struct tegra186_mc_soc *soc;
 };
 
 static const struct tegra186_mc_client tegra186_mc_clients[] = {
@@ -538,17 +540,24 @@ static const struct tegra186_mc_client tegra186_mc_clients[] = {
 	},
 };
 
+static const struct tegra186_mc_soc tegra186_mc_soc = {
+	.num_clients = ARRAY_SIZE(tegra186_mc_clients),
+	.clients = tegra186_mc_clients,
+};
+
 static int tegra186_mc_probe(struct platform_device *pdev)
 {
 	struct tegra186_mc *mc;
 	struct resource *res;
 	unsigned int i;
-	int err = 0;
+	int err;
 
 	mc = devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
 	if (!mc)
 		return -ENOMEM;
 
+	mc->soc = of_device_get_match_data(&pdev->dev);
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	mc->regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(mc->regs))
@@ -556,8 +565,8 @@ static int tegra186_mc_probe(struct platform_device *pdev)
 
 	mc->dev = &pdev->dev;
 
-	for (i = 0; i < ARRAY_SIZE(tegra186_mc_clients); i++) {
-		const struct tegra186_mc_client *client = &tegra186_mc_clients[i];
+	for (i = 0; i < mc->soc->num_clients; i++) {
+		const struct tegra186_mc_client *client = &mc->soc->clients[i];
 		u32 override, security;
 
 		override = readl(mc->regs + client->regs.override);
@@ -583,7 +592,7 @@ static int tegra186_mc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra186_mc_of_match[] = {
-	{ .compatible = "nvidia,tegra186-mc", },
+	{ .compatible = "nvidia,tegra186-mc", .data = &tegra186_mc_soc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, tegra186_mc_of_match);
-- 
2.23.0


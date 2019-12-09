Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6459116F0A
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 15:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbfLIOf0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Dec 2019 09:35:26 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38980 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727038AbfLIOfZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Dec 2019 09:35:25 -0500
Received: by mail-wm1-f66.google.com with SMTP id s14so15170394wmh.4
        for <linux-tegra@vger.kernel.org>; Mon, 09 Dec 2019 06:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BBAexXy6QHb9b0LuhH81Em9Cd0EIq6JiI9qQ4hCSW+k=;
        b=gNRw9VDKotARI9bsXbnGcfwKOXoKZRpJkLpDbHGTHH91cb0RsiLdx7th7wIZ5ILowj
         vcpTphWVbfb/K32PajiDt5MNzJ+VfRGRMlsTwhAJiihkJr2HouyXmb+onQhmHyqvSPBC
         tSEiKhK8lx3spDOuEjRjfg4OlVnzbd247yP6KUKsB3Jr3VFifD3VhhfFHClsWCKVi6SB
         BTxbXbE6w/jLIirDsPi3W/5T3KrF2iw1akIV3CUV6kLice/e2NBpFYakaRqdV3+1GyTL
         e+jAAKG6GSMydBU05dQjc3mdnl/4NvxJGf3jVOB3KQF4m+PUcJiXveibjZmMQAn8Lhru
         GxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BBAexXy6QHb9b0LuhH81Em9Cd0EIq6JiI9qQ4hCSW+k=;
        b=RxkmNTaZ3VXxPZrVWeVw/PpPpVe2pxAo9bqIRjysMdTB3+HFW9LBsaWrbmH9x417AK
         TMA7Yh6OgfazNUnRdTWcL14w7wYWjOW/QNj0b9VJn7oeYfyl9bkGsCrgdIYrWAoeG6/k
         rjAnxy0Enjhh9gIW/oZkJ3SMr8Agxw2NOwQgYTpATJNJ+DgPjXaI6UPWBaj0BX5ONl68
         ie1WBVxMBDjF77LSi8gGBz4S59sn/IBrtc3IjxPV+giOHR0dmPoMLr6Z5cHg27SIRmYk
         lxMTS3oblHPGocYQBqcyitojIOmcRkrQ9pI0XxcrE9WLufU+aQ/ctsjk9rU1xTPZwXHm
         HALQ==
X-Gm-Message-State: APjAAAVmmCaLUxah0PJDgEi01QXLQefYblup7+PLV855BbfSS4bR2tnm
        vGXqi8tCv1wtSf0lAkZNUQg=
X-Google-Smtp-Source: APXvYqzK816vlvz/TWq9VF4WaYU3ZA5UZptXKhUdxphFLCdhJVBFTg0cVPdLNMXFPPNINd1mXAVfDQ==
X-Received: by 2002:a1c:1d8:: with SMTP id 207mr22431650wmb.155.1575902123504;
        Mon, 09 Dec 2019 06:35:23 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id g9sm27131800wro.67.2019.12.09.06.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 06:35:22 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] memory: tegra: Rename tegra_mc to tegra186_mc on Tegra186
Date:   Mon,  9 Dec 2019 15:35:18 +0100
Message-Id: <20191209143521.2357178-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
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
2.23.0


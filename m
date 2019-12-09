Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24DDB116F0D
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 15:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbfLIOfb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Dec 2019 09:35:31 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34860 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727038AbfLIOfb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Dec 2019 09:35:31 -0500
Received: by mail-wr1-f66.google.com with SMTP id g17so16482549wro.2
        for <linux-tegra@vger.kernel.org>; Mon, 09 Dec 2019 06:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ttm9JDpQfFdaivyu5BbcV+zimIykT6JMxYV6nznS1UA=;
        b=gCjs4EjhPSHYsAW88CXORy+zE44wsE1lTpQx0OWcgaWmqOXLNvziJCiN58M091OZDV
         yO00e7ux0J89OhF3MXEF7m36zVfOajSaxdedZKJ7CpT2aSj+MULxVucYhvARR23lpOYg
         T41N0lk4apBmJEvmAjP45oCVT3GfA8D+K4gGz7Ht+Sk39r9W9nRy5YuTlariruguAi9A
         zGSL0oEAEOwOkw8VWuF+iH+pQcaLrVL1vL/SpMhI2IM2rptnNBvgVd0z+fT5ZFuHTPeG
         gRMuc+rO/EqDnYee1TYVZZpd9IYaTBFv9q45wAbZOlj0bFykM+4AHk1FV55kqP45DS/y
         yDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ttm9JDpQfFdaivyu5BbcV+zimIykT6JMxYV6nznS1UA=;
        b=JYO6AWNBskNd/Fzu+85RgOpj6pt62zN99Vqcm3WQ4MMeXn5TTrq+/vYQviSQQ6p+9V
         NCrF72UGenZUZgMCJPjkf/QqazNUEMuFM8eAurqRrlxAH/fUsXXXnKgmUsdIcZFcV+DK
         FIkb1Ato+21+jX6X7I5BVAsrCm1u0LDxcQK/C02cNs8as+WJw8mMNrAeUhgkrztrHOxH
         IlHYR1kGxjcvWw35+GVLhFOqd9oTxfFsk4KyAK1DcbZJRUwlrfbEvI5pMFyBkRXA6X4S
         MYkbE+Nz98ND5cNY7nT0s15OXudYhA42JJp1c051v7p7BqQbPLa8PXb/M3CL96RWs1PI
         tibA==
X-Gm-Message-State: APjAAAWGxt10yVABLE24WOzfILeE61uJN7ATdGH9NE3pIEIp1PRklBCN
        CCg0QpzrOT/CbPuuv+qPEds=
X-Google-Smtp-Source: APXvYqxEVg1sv/FHoGnDe5fHFym5HGmdl2utN2KLxOQtPTp1zpgBVVbM7HzmeOIkpx8OV4eNkdzDmg==
X-Received: by 2002:a05:6000:cf:: with SMTP id q15mr2417471wrx.393.1575902129270;
        Mon, 09 Dec 2019 06:35:29 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id a186sm14283943wmd.41.2019.12.09.06.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 06:35:28 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] memory: tegra: Add system sleep support
Date:   Mon,  9 Dec 2019 15:35:21 +0100
Message-Id: <20191209143521.2357178-4-thierry.reding@gmail.com>
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

Add system suspend/resume support for the memory controller found on
Tegra186 and later. This is required so that the SID registers can be
reprogrammed after their content was lost during system sleep.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra186.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 57895116c8e5..77a313f1bf0e 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -602,10 +602,29 @@ static const struct of_device_id tegra186_mc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra186_mc_of_match);
 
+static int tegra186_mc_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int tegra186_mc_resume(struct device *dev)
+{
+	struct tegra186_mc *mc = dev_get_drvdata(dev);
+
+	tegra186_mc_program_sid(mc);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra186_mc_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(tegra186_mc_suspend, tegra186_mc_resume)
+};
+
 static struct platform_driver tegra186_mc_driver = {
 	.driver = {
 		.name = "tegra186-mc",
 		.of_match_table = tegra186_mc_of_match,
+		.pm = &tegra186_mc_pm_ops,
 		.suppress_bind_attrs = true,
 	},
 	.prevent_deferred_probe = true,
-- 
2.23.0


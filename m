Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6EB30A262
	for <lists+linux-tegra@lfdr.de>; Mon,  1 Feb 2021 08:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbhBAHEY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 1 Feb 2021 02:04:24 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:50714 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231805AbhBAHCT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 1 Feb 2021 02:02:19 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UNVcuD1_1612162845;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UNVcuD1_1612162845)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 01 Feb 2021 15:01:14 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     krzk@kernel.org
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] memory: tegra186-emc: Replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
Date:   Mon,  1 Feb 2021 15:00:40 +0800
Message-Id: <1612162840-52271-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fix the following coccicheck warning:

./drivers/memory/tegra/tegra186-emc.c:158:0-23: WARNING:
tegra186_emc_debug_max_rate_fops should be defined with
DEFINE_DEBUGFS_ATTRIBUTE.

./drivers/memory/tegra/tegra186-emc.c:128:0-23: WARNING:
tegra186_emc_debug_min_rate_fops should be defined with
DEFINE_DEBUGFS_ATTRIBUTE.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/memory/tegra/tegra186-emc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index fa8af17..d65e7c2 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -125,9 +125,9 @@ static int tegra186_emc_debug_min_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(tegra186_emc_debug_min_rate_fops,
-			tegra186_emc_debug_min_rate_get,
-			tegra186_emc_debug_min_rate_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(tegra186_emc_debug_min_rate_fops,
+			  tegra186_emc_debug_min_rate_get,
+			  tegra186_emc_debug_min_rate_set, "%llu\n");
 
 static int tegra186_emc_debug_max_rate_get(void *data, u64 *rate)
 {
@@ -155,9 +155,9 @@ static int tegra186_emc_debug_max_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(tegra186_emc_debug_max_rate_fops,
-			tegra186_emc_debug_max_rate_get,
-			tegra186_emc_debug_max_rate_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(tegra186_emc_debug_max_rate_fops,
+			  tegra186_emc_debug_max_rate_get,
+			  tegra186_emc_debug_max_rate_set, "%llu\n");
 
 static int tegra186_emc_probe(struct platform_device *pdev)
 {
-- 
1.8.3.1


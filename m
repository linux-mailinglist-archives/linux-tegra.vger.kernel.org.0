Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6572D34909F
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Mar 2021 12:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbhCYLgj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 25 Mar 2021 07:36:39 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:14902 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbhCYLeS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 07:34:18 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F5jdL5BxNzkfcT;
        Thu, 25 Mar 2021 19:32:38 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 19:34:15 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <airlied@linux.ie>, <daniel@ffwll.ch>
CC:     <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH] drm/tegra: Remove useless error message
Date:   Thu, 25 Mar 2021 19:34:49 +0800
Message-ID: <1616672089-32934-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fix the following coccicheck report:

drivers/gpu/drm/tegra/dpaux.c:471:2-9:
line 471 is redundant because platform_get_irq() already prints an error
drivers/gpu/drm/tegra/sor.c:3793:2-9:
line 3793 is redundant because platform_get_irq() already prints an error

Remove dev_err() messages after platform_get_irq() failures.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
Signed-off-by: Jay Fang <f.fangjian@huawei.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 4 +---
 drivers/gpu/drm/tegra/sor.c   | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 105fb9c..044e5ee 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -467,10 +467,8 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 		return PTR_ERR(dpaux->regs);
 
 	dpaux->irq = platform_get_irq(pdev, 0);
-	if (dpaux->irq < 0) {
-		dev_err(&pdev->dev, "failed to get IRQ\n");
+	if (dpaux->irq < 0)
 		return -ENXIO;
-	}
 
 	if (!pdev->dev.pm_domain) {
 		dpaux->rst = devm_reset_control_get(&pdev->dev, "dpaux");
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index f02a035..01b9e1d 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3789,10 +3789,8 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	}
 
 	err = platform_get_irq(pdev, 0);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to get IRQ: %d\n", err);
+	if (err < 0)
 		goto remove;
-	}
 
 	sor->irq = err;
 
-- 
2.7.4


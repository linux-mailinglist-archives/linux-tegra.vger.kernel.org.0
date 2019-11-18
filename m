Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7DBF100310
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 11:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbfKRK5o (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 05:57:44 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:6697 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727031AbfKRK5n (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 05:57:43 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 3EB40FFBC374C69FA557;
        Mon, 18 Nov 2019 18:57:39 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 18:57:30 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <treding@nvidia.com>, <kishon@ti.com>, <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH] phy: tegra: Use PTR_ERR_OR_ZERO() to simplify code
Date:   Mon, 18 Nov 2019 19:04:53 +0800
Message-ID: <1574075093-37340-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fixes coccicheck warning:

drivers/phy/tegra/phy-tegra194-p2u.c:95:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/phy/tegra/phy-tegra194-p2u.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/phy/tegra/phy-tegra194-p2u.c b/drivers/phy/tegra/phy-tegra194-p2u.c
index 7042bed..42394d2 100644
--- a/drivers/phy/tegra/phy-tegra194-p2u.c
+++ b/drivers/phy/tegra/phy-tegra194-p2u.c
@@ -92,10 +92,7 @@ static int tegra_p2u_probe(struct platform_device *pdev)
 	phy_set_drvdata(generic_phy, phy);

 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-	if (IS_ERR(phy_provider))
-		return PTR_ERR(phy_provider);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(phy_provider);
 }

 static const struct of_device_id tegra_p2u_id_table[] = {
--
2.7.4


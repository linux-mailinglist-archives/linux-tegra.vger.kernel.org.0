Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD3D92E7118
	for <lists+linux-tegra@lfdr.de>; Tue, 29 Dec 2020 14:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgL2NwN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 29 Dec 2020 08:52:13 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:9946 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgL2NwN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Dec 2020 08:52:13 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4D4wmV5M2fzhysl;
        Tue, 29 Dec 2020 21:50:50 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Tue, 29 Dec 2020 21:51:24 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] clk: tegra: Use kzalloc for allocating only one thing
Date:   Tue, 29 Dec 2020 21:52:02 +0800
Message-ID: <20201229135202.23702-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use kzalloc rather than kcalloc(1,...)

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
@@

- kcalloc(1,
+ kzalloc(
          ...)
// </smpl>

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/clk/tegra/clk-tegra124-emc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
index 745f9faa98d8..7cc89c234eaa 100644
--- a/drivers/clk/tegra/clk-tegra124-emc.c
+++ b/drivers/clk/tegra/clk-tegra124-emc.c
@@ -483,7 +483,7 @@ struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
 	struct clk *clk;
 	int err;
 
-	tegra = kcalloc(1, sizeof(*tegra), GFP_KERNEL);
+	tegra = kzalloc(sizeof(*tegra), GFP_KERNEL);
 	if (!tegra)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.22.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC208F5D3E
	for <lists+linux-tegra@lfdr.de>; Sat,  9 Nov 2019 04:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbfKIDnL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 8 Nov 2019 22:43:11 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:5751 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725895AbfKIDnL (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 8 Nov 2019 22:43:11 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id D2E8558515A670ED1BF6;
        Sat,  9 Nov 2019 11:43:09 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Sat, 9 Nov 2019
 11:43:00 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] clk: tegra: Use match_string() helper to simplify the code
Date:   Sat, 9 Nov 2019 11:42:26 +0800
Message-ID: <20191109034226.21044-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

match_string() returns the array index of a matching string.
Use it instead of the open-coded implementation.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/clk/tegra/clk-emc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index ea39caf..745f9fa 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -403,20 +403,16 @@ static int load_one_timing_from_dt(struct tegra_clk_emc *tegra,
 	}
 
 	timing->parent_index = 0xff;
-	for (i = 0; i < ARRAY_SIZE(emc_parent_clk_names); i++) {
-		if (!strcmp(emc_parent_clk_names[i],
-			    __clk_get_name(timing->parent))) {
-			timing->parent_index = i;
-			break;
-		}
-	}
-	if (timing->parent_index == 0xff) {
+	i = match_string(emc_parent_clk_names, ARRAY_SIZE(emc_parent_clk_names),
+			 __clk_get_name(timing->parent));
+	if (i < 0) {
 		pr_err("timing %pOF: %s is not a valid parent\n",
 		       node, __clk_get_name(timing->parent));
 		clk_put(timing->parent);
 		return -EINVAL;
 	}
 
+	timing->parent_index = i;
 	return 0;
 }
 
-- 
2.7.4



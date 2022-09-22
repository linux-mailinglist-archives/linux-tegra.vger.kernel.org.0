Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A83C75E648B
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Sep 2022 16:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbiIVOAT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 22 Sep 2022 10:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231902AbiIVOAP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Sep 2022 10:00:15 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB01D52DF5;
        Thu, 22 Sep 2022 07:00:10 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MYGym2qK8zlX54;
        Thu, 22 Sep 2022 21:56:00 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 22:00:09 +0800
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 22:00:08 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH 3/4] memory: tegra210-emc: use DEFINE_SHOW_ATTRIBUTE to simplify code
Date:   Thu, 22 Sep 2022 22:33:43 +0800
Message-ID: <20220922143344.3252585-4-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922143344.3252585-1-liushixin2@huawei.com>
References: <20220922143344.3252585-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use DEFINE_SHOW_ATTRIBUTE helper macro to simplify the code.
No functional change.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/memory/tegra/tegra210-emc-core.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index cbe1a7723514..603b306daca1 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -1621,20 +1621,8 @@ static int tegra210_emc_debug_available_rates_show(struct seq_file *s,
 
 	return 0;
 }
+DEFINE_SHOW_ATTRIBUTE(tegra210_emc_debug_available_rates);
 
-static int tegra210_emc_debug_available_rates_open(struct inode *inode,
-						   struct file *file)
-{
-	return single_open(file, tegra210_emc_debug_available_rates_show,
-			   inode->i_private);
-}
-
-static const struct file_operations tegra210_emc_debug_available_rates_fops = {
-	.open = tegra210_emc_debug_available_rates_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
 
 static int tegra210_emc_debug_min_rate_get(void *data, u64 *rate)
 {
-- 
2.25.1


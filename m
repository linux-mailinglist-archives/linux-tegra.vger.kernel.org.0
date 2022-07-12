Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 473605710D3
	for <lists+linux-tegra@lfdr.de>; Tue, 12 Jul 2022 05:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbiGLD1L (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 11 Jul 2022 23:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231802AbiGLD1J (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jul 2022 23:27:09 -0400
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889488FD5C;
        Mon, 11 Jul 2022 20:27:08 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R771e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0VJ6bSV5_1657596423;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VJ6bSV5_1657596423)
          by smtp.aliyun-inc.com;
          Tue, 12 Jul 2022 11:27:05 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH 2/2] soc/tegra: cbb: fix platform_no_drv_owner.cocci warnings
Date:   Tue, 12 Jul 2022 11:26:49 +0800
Message-Id: <20220712032649.98909-2-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220712032649.98909-1-jiapeng.chong@linux.alibaba.com>
References: <20220712032649.98909-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Remove .owner field if calls are used which set it automatically.

Generated by: scripts/coccinelle/api/platform_no_drv_owner.cocci

./drivers/soc/tegra/cbb/tegra234-cbb.c:1093:3-8: No need to set .owner here. The core will do it.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index 8bae8166732c..3528f9e15d5c 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -1090,7 +1090,6 @@ static struct platform_driver tegra234_cbb_driver = {
 	.probe = tegra234_cbb_probe,
 	.remove = tegra234_cbb_remove,
 	.driver = {
-		.owner = THIS_MODULE,
 		.name = "tegra234-cbb",
 		.of_match_table = tegra234_cbb_dt_ids,
 		.acpi_match_table = tegra241_cbb_acpi_ids,
-- 
2.20.1.7.g153144c


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20363564FF9
	for <lists+linux-tegra@lfdr.de>; Mon,  4 Jul 2022 10:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbiGDIqE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 4 Jul 2022 04:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiGDIqD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Jul 2022 04:46:03 -0400
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ADDA5B7ED
        for <linux-tegra@vger.kernel.org>; Mon,  4 Jul 2022 01:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=MuDoe
        08dNNBH2iR8u2GDQUkfwsc1EfDvNcbXMBWHLU8=; b=lgHMQbjTZUcowQct5rv/4
        4H8skZKzpEHwGMudVTI3zMjcRt2EKSJ45nhLLQoKQPlD0YlTBwvEJdxsuiB9J92v
        GBxvYfXMH4wgWYZjQIRrIIA6VMAuHqWH5omEZK1tvjcXPFi8mo0xnWuqhXoWEorp
        yiYYCzUJmds76c6Qu11ZOg=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp2 (Coremail) with SMTP id DMmowAD3Yf6bqMJi275fEQ--.34864S2;
        Mon, 04 Jul 2022 16:45:16 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     jckuo@nvidia.com, kishon@ti.com, vkoul@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        p.zabel@pengutronix.de, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org, windhl@126.com, linmq006@gmail.com
Subject: [PATCH] phy: tegra: Fix missing of_node_put() in tegra210_xusb_padctl_probe()
Date:   Mon,  4 Jul 2022 16:45:14 +0800
Message-Id: <20220704084514.277005-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowAD3Yf6bqMJi275fEQ--.34864S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw4fWF1ktFWUtF13Jw1UJrb_yoW3tFg_WF
        1xZr97XrWvgr4IvFyaqFyIyasrZ3W0qFsYgrs2vr93Ka1jqw1jyryDXry5ur12vw4DJFy7
        Aa4DZF1UAr4rZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREKZXDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBw0F2JVkLyEqQAAsx
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

We should call of_node_put() for the reference 'np' returned by
of_parse_phandle() which will increase the refcount.

Fixes: 2d1021487273 ("phy: tegra: xusb: Add wake/sleepwalk for Tegra210")
Co-authored-by: Miaoqian Lin <linmq006@gmail.com>
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/phy/tegra/xusb-tegra210.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index eedfc7c2cc05..d5eebb7a266c 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -3165,6 +3165,7 @@ tegra210_xusb_padctl_probe(struct device *dev,
 	}
 
 	pdev = of_find_device_by_node(np);
+	of_node_put(np);
 	if (!pdev) {
 		dev_warn(dev, "PMC device is not available\n");
 		goto out;
-- 
2.25.1


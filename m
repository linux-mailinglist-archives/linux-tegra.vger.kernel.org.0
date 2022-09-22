Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 202225E642C
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Sep 2022 15:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbiIVNuM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 22 Sep 2022 09:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231901AbiIVNti (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Sep 2022 09:49:38 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB67731211
        for <linux-tegra@vger.kernel.org>; Thu, 22 Sep 2022 06:49:34 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MYGkX1KN9z14S1L;
        Thu, 22 Sep 2022 21:45:24 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 21:49:32 +0800
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 21:49:31 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
CC:     <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
        "Liu Shixin" <liushixin2@huawei.com>
Subject: [PATCH] gpu: host1x: use DEFINE_SHOW_ATTRIBUTE to simplify host1x_debug/host1x_debug_all
Date:   Thu, 22 Sep 2022 22:23:16 +0800
Message-ID: <20220922142316.3247255-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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
 drivers/gpu/host1x/debug.c | 28 +++-------------------------
 1 file changed, 3 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
index 34c2e36d09e9..6649b04b7131 100644
--- a/drivers/gpu/host1x/debug.c
+++ b/drivers/gpu/host1x/debug.c
@@ -140,7 +140,7 @@ static void show_all(struct host1x *m, struct output *o, bool show_fifo)
 	}
 }
 
-static int host1x_debug_show_all(struct seq_file *s, void *unused)
+static int host1x_debug_all_show(struct seq_file *s, void *unused)
 {
 	struct output o = {
 		.fn = write_to_seqfile,
@@ -151,6 +151,7 @@ static int host1x_debug_show_all(struct seq_file *s, void *unused)
 
 	return 0;
 }
+DEFINE_SHOW_ATTRIBUTE(host1x_debug_all);
 
 static int host1x_debug_show(struct seq_file *s, void *unused)
 {
@@ -163,30 +164,7 @@ static int host1x_debug_show(struct seq_file *s, void *unused)
 
 	return 0;
 }
-
-static int host1x_debug_open_all(struct inode *inode, struct file *file)
-{
-	return single_open(file, host1x_debug_show_all, inode->i_private);
-}
-
-static const struct file_operations host1x_debug_all_fops = {
-	.open = host1x_debug_open_all,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
-
-static int host1x_debug_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, host1x_debug_show, inode->i_private);
-}
-
-static const struct file_operations host1x_debug_fops = {
-	.open = host1x_debug_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(host1x_debug);
 
 static void host1x_debugfs_init(struct host1x *host1x)
 {
-- 
2.25.1


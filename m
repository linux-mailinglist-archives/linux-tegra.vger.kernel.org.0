Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40F472CF4EE
	for <lists+linux-tegra@lfdr.de>; Fri,  4 Dec 2020 20:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbgLDTh7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 4 Dec 2020 14:37:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:60194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730545AbgLDTh7 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 4 Dec 2020 14:37:59 -0500
From:   Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Timo Alho <talho@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: tegra: reduce stack usage
Date:   Fri,  4 Dec 2020 20:37:04 +0100
Message-Id: <20201204193714.3134651-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Building the bpmp-debugfs driver for Arm results in a warning for stack usage:

drivers/firmware/tegra/bpmp-debugfs.c:321:16: error: stack frame size of 1224 bytes in function 'bpmp_debug_store' [-Werror,-Wframe-larger-than=]
static ssize_t bpmp_debug_store(struct file *file, const char __user *buf,

It should be possible to rearrange the code to not require two separate
buffers for the file name, but the easiest workaround is to use dynamic
allocation.

Fixes: 5e37b9c137ee ("firmware: tegra: Add support for in-band debug")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/firmware/tegra/bpmp-debugfs.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index 440d99c63638..e1a6b6add180 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -74,28 +74,34 @@ static void seqbuf_seek(struct seqbuf *seqbuf, ssize_t offset)
 static const char *get_filename(struct tegra_bpmp *bpmp,
 				const struct file *file, char *buf, int size)
 {
-	char root_path_buf[512];
+	char *root_path_buf;
 	const char *root_path;
-	const char *filename;
+	const char *filename = NULL;
 	size_t root_len;
 
+	root_path_buf = kzalloc(512, GFP_KERNEL);
+	if (!root_path_buf)
+		goto out;
+
 	root_path = dentry_path(bpmp->debugfs_mirror, root_path_buf,
 				sizeof(root_path_buf));
 	if (IS_ERR(root_path))
-		return NULL;
+		goto out;
 
 	root_len = strlen(root_path);
 
 	filename = dentry_path(file->f_path.dentry, buf, size);
 	if (IS_ERR(filename))
-		return NULL;
+		goto out;
 
 	if (strlen(filename) < root_len ||
 			strncmp(filename, root_path, root_len))
-		return NULL;
+		goto out;
 
 	filename += root_len;
 
+out:
+	kfree(root_path_buf);
 	return filename;
 }
 
-- 
2.27.0


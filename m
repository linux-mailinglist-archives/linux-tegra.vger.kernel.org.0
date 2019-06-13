Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 038C443B1D
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Jun 2019 17:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728327AbfFMP0W (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Jun 2019 11:26:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:39696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729197AbfFMLpZ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jun 2019 07:45:25 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7FE9C21743;
        Thu, 13 Jun 2019 11:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560426325;
        bh=uwavyTL+MUL4XML+n5pNFVCFkXznzpr7RDurYmJRj6Y=;
        h=Date:From:To:Cc:Subject:From;
        b=lFZ5sZsSCddNtSznPyDu/AIADfVGwapHZHo9abdVrZ2aO7MZcnE3Vx2haW26yRaKd
         xzXR0FxKExKw3bBRS3z6hCULp8aeChJ3TmtPAktG/Q2VFbQHrKeA2WkoEHXAs6vleR
         jHNCMIaiu6HCatII2pfVDzgQZSlBcsyUbmX21VnQ=
Date:   Thu, 13 Jun 2019 13:45:22 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] host1x: debugfs_create_dir() can never return NULL
Message-ID: <20190613114522.GB13119@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

So there is no need to check for a value that can never happen.  No need
to check the return value all anyway, as any debugfs call can take the
result of this function as an option just fine.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/host1x/debug.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
index 329e4a3d8ae7..6c5ee3e39dc6 100644
--- a/drivers/gpu/host1x/debug.c
+++ b/drivers/gpu/host1x/debug.c
@@ -171,9 +171,6 @@ static void host1x_debugfs_init(struct host1x *host1x)
 {
 	struct dentry *de = debugfs_create_dir("tegra-host1x", NULL);
 
-	if (!de)
-		return;
-
 	/* Store the created entry */
 	host1x->debugfs = de;
 
-- 
2.22.0


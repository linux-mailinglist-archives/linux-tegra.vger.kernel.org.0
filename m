Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50258100460
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 12:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfKRLjF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 06:39:05 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7135 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726461AbfKRLjE (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 06:39:04 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id F0562ABE5B338D6644BE;
        Mon, 18 Nov 2019 19:38:59 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 19:38:49 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <treding@nvidia.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <jonathanh@nvidia.com>, <dri-devel@lists.freedesktop.org>,
        <linux-tegra@vger.kernel.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 1/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code in tegra_bo_dumb_create
Date:   Mon, 18 Nov 2019 19:46:11 +0800
Message-ID: <1574077572-59152-2-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
References: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fixes coccicheck warning:

drivers/gpu/drm/tegra/gem.c:457:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/tegra/gem.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 746dae3..dae3efe 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -454,10 +454,7 @@ int tegra_bo_dumb_create(struct drm_file *file, struct drm_device *drm,

 	bo = tegra_bo_create_with_handle(file, drm, args->size, 0,
 					 &args->handle);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(bo);
 }

 static vm_fault_t tegra_bo_fault(struct vm_fault *vmf)
--
2.7.4


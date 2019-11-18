Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C616E10045F
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 12:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfKRLjC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 06:39:02 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7136 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726490AbfKRLjC (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 06:39:02 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 011D0E533B7CE34D698E;
        Mon, 18 Nov 2019 19:39:00 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 19:38:50 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <treding@nvidia.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <jonathanh@nvidia.com>, <dri-devel@lists.freedesktop.org>,
        <linux-tegra@vger.kernel.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 2/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code in tegra_gem_create
Date:   Mon, 18 Nov 2019 19:46:12 +0800
Message-ID: <1574077572-59152-3-git-send-email-zhengbin13@huawei.com>
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

drivers/gpu/drm/tegra/drm.c:350:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/tegra/drm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 56e5e7a..8b6a1f7d 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -347,10 +347,7 @@ static int tegra_gem_create(struct drm_device *drm, void *data,

 	bo = tegra_bo_create_with_handle(file, drm, args->size, args->flags,
 					 &args->handle);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(bo);
 }

 static int tegra_gem_mmap(struct drm_device *drm, void *data,
--
2.7.4


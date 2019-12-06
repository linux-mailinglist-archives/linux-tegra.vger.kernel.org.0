Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2401D114C71
	for <lists+linux-tegra@lfdr.de>; Fri,  6 Dec 2019 07:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbfLFGxK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 6 Dec 2019 01:53:10 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:37418 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725858AbfLFGxK (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 6 Dec 2019 01:53:10 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 5006FFFC772847A8BCAD;
        Fri,  6 Dec 2019 14:53:08 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Fri, 6 Dec 2019
 14:52:59 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <thierry.reding@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <jonathanh@nvidia.com>
CC:     <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] drm/tegra: sor: Fix unused function warnings
Date:   Fri, 6 Dec 2019 14:47:41 +0800
Message-ID: <20191206064741.23432-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

drivers/gpu/drm/tegra/sor.c:3984:12: warning: 'tegra_sor_resume' defined but not used [-Wunused-function]
drivers/gpu/drm/tegra/sor.c:3970:12: warning: 'tegra_sor_suspend' defined but not used [-Wunused-function]
drivers/gpu/drm/tegra/sor.c:3937:12: warning: 'tegra_sor_runtime_resume' defined but not used [-Wunused-function]
drivers/gpu/drm/tegra/sor.c:3915:12: warning: 'tegra_sor_runtime_suspend' defined but not used [-Wunused-function]

Mark these functions as __maybe_unused so gcc can drop them
silently.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/tegra/sor.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index a68d3b3..69b9ebe 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3912,7 +3912,7 @@ static int tegra_sor_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_sor_runtime_suspend(struct device *dev)
+static int __maybe_unused tegra_sor_runtime_suspend(struct device *dev)
 {
 	struct tegra_sor *sor = dev_get_drvdata(dev);
 	int err;
@@ -3934,7 +3934,7 @@ static int tegra_sor_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra_sor_runtime_resume(struct device *dev)
+static int __maybe_unused tegra_sor_runtime_resume(struct device *dev)
 {
 	struct tegra_sor *sor = dev_get_drvdata(dev);
 	int err;
@@ -3967,7 +3967,7 @@ static int tegra_sor_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int tegra_sor_suspend(struct device *dev)
+static int __maybe_unused tegra_sor_suspend(struct device *dev)
 {
 	struct tegra_sor *sor = dev_get_drvdata(dev);
 	int err;
@@ -3981,7 +3981,7 @@ static int tegra_sor_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra_sor_resume(struct device *dev)
+static int __maybe_unused tegra_sor_resume(struct device *dev)
 {
 	struct tegra_sor *sor = dev_get_drvdata(dev);
 	int err;
-- 
2.7.4



Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA1FAE9CC0
	for <lists+linux-tegra@lfdr.de>; Wed, 30 Oct 2019 14:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfJ3Nz6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 30 Oct 2019 09:55:58 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:48622 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726171AbfJ3Nz6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Oct 2019 09:55:58 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 02206D467BC788BFC20A;
        Wed, 30 Oct 2019 21:55:52 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Wed, 30 Oct 2019
 21:55:43 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <thierry.reding@gmail.com>, <mperttunen@nvidia.com>,
        <arnd@arndb.de>, <seanpaul@chromium.org>
CC:     <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] gpu: host1x: Fix compile test failure
Date:   Wed, 30 Oct 2019 21:54:58 +0800
Message-ID: <20191030135458.27960-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

If IOMMU_SUPPORT is not set, but IOMMU_IOVA is m and
COMPILE_TEST is y, building fails:

drivers/gpu/host1x/dev.o: In function `host1x_remove':
dev.c:(.text+0x624): undefined reference to `put_iova_domain'
dev.c:(.text+0x624): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `put_iova_domain'
dev.c:(.text+0x62c): undefined reference to `iova_cache_put'
dev.c:(.text+0x62c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `iova_cache_put'

Select IOMMU_IOVA while COMPILE_TEST is set to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 52499a6ad2ae ("gpu: host1x: select IOMMU_IOVA")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/host1x/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
index cf987a3..354232d 100644
--- a/drivers/gpu/host1x/Kconfig
+++ b/drivers/gpu/host1x/Kconfig
@@ -2,7 +2,7 @@
 config TEGRA_HOST1X
 	tristate "NVIDIA Tegra host1x driver"
 	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
-	select IOMMU_IOVA if IOMMU_SUPPORT
+	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
 	help
 	  Driver for the NVIDIA Tegra host1x hardware.
 
-- 
2.7.4



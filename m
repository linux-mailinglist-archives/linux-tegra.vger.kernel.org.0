Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E647441902B
	for <lists+linux-tegra@lfdr.de>; Mon, 27 Sep 2021 09:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233298AbhI0Hru (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 27 Sep 2021 03:47:50 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:21354 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233223AbhI0Hrt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Sep 2021 03:47:49 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HHvjG6grSzRXBm;
        Mon, 27 Sep 2021 15:41:54 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 27 Sep 2021 15:46:10 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 27 Sep
 2021 15:46:10 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <mperttunen@nvidia.com>
Subject: [PATCH -next] memory: tegra186-emc: Fix error return code in tegra186_emc_probe()
Date:   Mon, 27 Sep 2021 15:51:07 +0800
Message-ID: <20210927075107.2882569-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Return the error code when command fails.

Fixes: 13324edbe926 ("memory: tegra186-emc: Handle errors in BPMP response")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/memory/tegra/tegra186-emc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index abc0c2eeaab7..16351840b187 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -198,6 +198,7 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 		goto put_bpmp;
 	}
 	if (msg.rx.ret < 0) {
+		err = msg.rx.ret;
 		dev_err(&pdev->dev, "EMC DVFS MRQ failed: %d (BPMP error code)\n", msg.rx.ret);
 		goto put_bpmp;
 	}
-- 
2.25.1


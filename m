Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07F0CDAD02
	for <lists+linux-tegra@lfdr.de>; Thu, 17 Oct 2019 14:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502821AbfJQMtQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 17 Oct 2019 08:49:16 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4213 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2502812AbfJQMtP (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Oct 2019 08:49:15 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 4030555D330CE5AF0614;
        Thu, 17 Oct 2019 20:49:12 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Thu, 17 Oct 2019
 20:49:01 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <linus.walleij@linaro.org>, <manivannan.sadhasivam@linaro.org>,
        <afaerber@suse.de>, <f.fainelli@gmail.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <jesper.nilsson@axis.com>, <lars.persson@axis.com>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <baruch@tkos.co.il>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@axis.com>, <linux-oxnas@groups.io>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <vz@mleia.com>, <narmstrong@baylibre.com>,
        <geert+renesas@glider.be>, <daniel@zonque.org>,
        <haojian.zhuang@gmail.com>, <wens@csie.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <agross@kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 24/30] pinctrl: digicolor: use devm_platform_ioremap_resource() to simplify code
Date:   Thu, 17 Oct 2019 20:26:34 +0800
Message-ID: <20191017122640.22976-25-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20191017122640.22976-1-yuehaibing@huawei.com>
References: <20191017122640.22976-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/pinctrl-digicolor.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-digicolor.c b/drivers/pinctrl/pinctrl-digicolor.c
index 7e1ceee..ff702cf 100644
--- a/drivers/pinctrl/pinctrl-digicolor.c
+++ b/drivers/pinctrl/pinctrl-digicolor.c
@@ -270,7 +270,6 @@ static int dc_gpiochip_add(struct dc_pinmap *pmap, struct device_node *np)
 static int dc_pinctrl_probe(struct platform_device *pdev)
 {
 	struct dc_pinmap *pmap;
-	struct resource *r;
 	struct pinctrl_pin_desc *pins;
 	struct pinctrl_desc *pctl_desc;
 	char *pin_names;
@@ -281,8 +280,7 @@ static int dc_pinctrl_probe(struct platform_device *pdev)
 	if (!pmap)
 		return -ENOMEM;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pmap->regs = devm_ioremap_resource(&pdev->dev, r);
+	pmap->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pmap->regs))
 		return PTR_ERR(pmap->regs);
 
-- 
2.7.4



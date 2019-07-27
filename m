Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7916D779D8
	for <lists+linux-tegra@lfdr.de>; Sat, 27 Jul 2019 17:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729128AbfG0PKh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 27 Jul 2019 11:10:37 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3184 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387812AbfG0PKU (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Jul 2019 11:10:20 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 866B8E69F17AE7967257;
        Sat, 27 Jul 2019 23:10:14 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Sat, 27 Jul 2019
 23:10:04 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <eric@anholt.net>, <wahrenst@gmx.net>,
        <f.fainelli@gmail.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <paul@crapouillou.net>, <timur@kernel.org>,
        <nicoleotsuka@gmail.com>, <Xiubo.Lee@gmail.com>,
        <festevam@gmail.com>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <linux-imx@nxp.com>, <matthias.bgg@gmail.com>,
        <jbrunet@baylibre.com>, <khilman@baylibre.com>,
        <daniel@zonque.org>, <haojian.zhuang@gmail.com>,
        <robert.jarzmik@free.fr>, <baohua@kernel.org>,
        <olivier.moysan@st.com>, <arnaud.pouliquen@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <mripard@kernel.org>, <wens@csie.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <yamada.masahiro@socionext.com>,
        <michal.simek@xilinx.com>, <jcmvbkbc@gmail.com>
CC:     <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linuxppc-dev@lists.ozlabs.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-tegra@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
        <gregkh@linuxfoundation.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 14/34] ASoC: xtfpga-i2s: use devm_platform_ioremap_resource() to simplify code
Date:   Sat, 27 Jul 2019 23:07:18 +0800
Message-ID: <20190727150738.54764-15-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20190727150738.54764-1-yuehaibing@huawei.com>
References: <20190727150738.54764-1-yuehaibing@huawei.com>
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

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/xtensa/xtfpga-i2s.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.c
index 9ce2c75..9da395d 100644
--- a/sound/soc/xtensa/xtfpga-i2s.c
+++ b/sound/soc/xtensa/xtfpga-i2s.c
@@ -531,7 +531,6 @@ static int xtfpga_i2s_runtime_resume(struct device *dev)
 static int xtfpga_i2s_probe(struct platform_device *pdev)
 {
 	struct xtfpga_i2s *i2s;
-	struct resource *mem;
 	int err, irq;
 
 	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
@@ -543,8 +542,7 @@ static int xtfpga_i2s_probe(struct platform_device *pdev)
 	i2s->dev = &pdev->dev;
 	dev_dbg(&pdev->dev, "dev: %p, i2s: %p\n", &pdev->dev, i2s);
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2s->regs = devm_ioremap_resource(&pdev->dev, mem);
+	i2s->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2s->regs)) {
 		err = PTR_ERR(i2s->regs);
 		goto err;
-- 
2.7.4



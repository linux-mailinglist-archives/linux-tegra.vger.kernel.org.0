Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0578E7BFF6
	for <lists+linux-tegra@lfdr.de>; Wed, 31 Jul 2019 13:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfGaLcR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 31 Jul 2019 07:32:17 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:35684 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbfGaLaR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 31 Jul 2019 07:30:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=7hJLG8//Tyf0+YxtxJyuLHs8MXWPYgyM07amw97SLrg=; b=i2BWEjRhpNHA
        S1r9VB/U6dLlM1ZuubWWNziSURl6gTrcxx9GGoUYd4G+VcIn/2RNuPKJs6HbZNO9xeHSgJW2/hSMz
        dWZu9dchxJnaWQTd3RIICNLF8eA661/DFLwyE3INaKB4XWHaZzu/ubb/M4gb95CsAI+4aE+A7fKsn
        z3cB8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hsmnf-0001le-PJ; Wed, 31 Jul 2019 11:29:43 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 514542742C99; Wed, 31 Jul 2019 12:29:43 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     alexandre.torgue@st.com, alsa-devel@alsa-project.org,
        arnaud.pouliquen@st.com, baohua@kernel.org,
        bcm-kernel-feedback-list@broadcom.com, broonie@kernel.org,
        daniel@zonque.org, eric@anholt.net, festevam@gmail.com,
        f.fainelli@gmail.com, gregkh@linuxfoundation.org,
        haojian.zhuang@gmail.com, Hulk Robot <hulkci@huawei.com>,
        jbrunet@baylibre.com, jcmvbkbc@gmail.com, jonathanh@nvidia.com,
        kernel@pengutronix.de, khilman@baylibre.com, lgirdwood@gmail.com,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        Mark Brown <broonie@kernel.org>, matthias.bgg@gmail.com,
        mcoquelin.stm32@gmail.com, michal.simek@xilinx.com,
        mripard@kernel.org, nicoleotsuka@gmail.com, olivier.moysan@st.com,
        paul@crapouillou.net, perex@perex.cz, rjui@broadcom.com,
        robert.jarzmik@free.fr, sbranden@broadcom.com,
        s.hauer@pengutronix.de, shawnguo@kernel.org,
        thierry.reding@gmail.com, timur@kernel.org, tiwai@suse.com,
        wahrenst@gmx.net, wens@csie.org, Xiubo.Lee@gmail.com,
        yamada.masahiro@socionext.com
Subject: Applied "ASoC: sunxi: sun50i-codec-analog: use devm_platform_ioremap_resource() to simplify code" to the asoc tree
In-Reply-To: <20190727150738.54764-34-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190731112943.514542742C99@ypsilon.sirena.org.uk>
Date:   Wed, 31 Jul 2019 12:29:43 +0100 (BST)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The patch

   ASoC: sunxi: sun50i-codec-analog: use devm_platform_ioremap_resource() to simplify code

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 54dd39e4aca8edb231e13349ac3a3a44ef28d3d4 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 27 Jul 2019 23:07:37 +0800
Subject: [PATCH] ASoC: sunxi: sun50i-codec-analog: use
 devm_platform_ioremap_resource() to simplify code

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190727150738.54764-34-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun50i-codec-analog.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
index 6d1de565350e..f5b7069bcca2 100644
--- a/sound/soc/sunxi/sun50i-codec-analog.c
+++ b/sound/soc/sunxi/sun50i-codec-analog.c
@@ -459,12 +459,10 @@ MODULE_DEVICE_TABLE(of, sun50i_codec_analog_of_match);
 
 static int sun50i_codec_analog_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct regmap *regmap;
 	void __iomem *base;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		dev_err(&pdev->dev, "Failed to map the registers\n");
 		return PTR_ERR(base);
-- 
2.20.1


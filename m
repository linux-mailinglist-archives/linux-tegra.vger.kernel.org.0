Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66C0F1BBBE3
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Apr 2020 13:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgD1LGh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 28 Apr 2020 07:06:37 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:52798 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726345AbgD1LGh (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Apr 2020 07:06:37 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 17C49FA5ABDC1D5E94A3;
        Tue, 28 Apr 2020 19:06:33 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 28 Apr 2020 19:06:26 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        "Thierry Reding" <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] ASoC: tegra: tegra_wm8903: Use devm_snd_soc_register_card()
Date:   Tue, 28 Apr 2020 11:07:42 +0000
Message-ID: <20200428110742.110335-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Using devm_snd_soc_register_card() can make the code
shorter and cleaner.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 sound/soc/tegra/tegra_wm8903.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 7bf159965c4d..d3ead0213cef 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -351,9 +351,9 @@ static int tegra_wm8903_driver_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = snd_soc_register_card(card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
+		dev_err(&pdev->dev, "devm_snd_soc_register_card failed (%d)\n",
 			ret);
 		return ret;
 	}
@@ -361,15 +361,6 @@ static int tegra_wm8903_driver_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_wm8903_driver_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-
-	snd_soc_unregister_card(card);
-
-	return 0;
-}
-
 static const struct of_device_id tegra_wm8903_of_match[] = {
 	{ .compatible = "nvidia,tegra-audio-wm8903", },
 	{},
@@ -382,7 +373,6 @@ static struct platform_driver tegra_wm8903_driver = {
 		.of_match_table = tegra_wm8903_of_match,
 	},
 	.probe = tegra_wm8903_driver_probe,
-	.remove = tegra_wm8903_driver_remove,
 };
 module_platform_driver(tegra_wm8903_driver);




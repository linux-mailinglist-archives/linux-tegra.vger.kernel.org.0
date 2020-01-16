Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8346613F09D
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jan 2020 19:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392466AbgAPR1Y (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jan 2020 12:27:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:37194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392460AbgAPR1X (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jan 2020 12:27:23 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1E22246C9;
        Thu, 16 Jan 2020 17:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579195642;
        bh=yvtZJ7G06qHmIA9YwZK0mSiWIPHTw3YbdwvdRaviQYo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pjd9ACNqw4hLwObOVPMDYTuGffB0mEz7mJN108mF/b6+Vfo6orfPcAScekLe0eYel
         iZgAgZn5KkddF6uF3O2CNq+egijIzneYXF/Ww5/lanep31Pt8U2bM8VkA8nA6s7Q15
         CS+PPBx9ALpE9KAcd8ggFtiYXwUS0p1sMfcyV96c=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jon Hunter <jonathanh@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
        Sasha Levin <sashal@kernel.org>, dmaengine@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 206/371] dmaengine: tegra210-adma: Fix crash during probe
Date:   Thu, 16 Jan 2020 12:21:18 -0500
Message-Id: <20200116172403.18149-149-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116172403.18149-1-sashal@kernel.org>
References: <20200116172403.18149-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Jon Hunter <jonathanh@nvidia.com>

[ Upstream commit b53611fb1ce9b1786bd18205473e0c1d6bfa8934 ]

Commit f33e7bb3eb92 ("dmaengine: tegra210-adma: restore channel status")
added support to save and restore the DMA channel registers when runtime
suspending the ADMA. This change is causing the kernel to crash when
probing the ADMA, if the device is probed deferred when looking up the
channel interrupts. The crash occurs because not all of the channel base
addresses have been setup at this point and in the clean-up path of the
probe, pm_runtime_suspend() is called invoking its callback which
expects all the channel base addresses to be initialised.

Although this could be fixed by simply checking for a NULL address, on
further review of the driver it seems more appropriate that we only call
pm_runtime_get_sync() after all the channel interrupts and base
addresses have been configured. Therefore, fix this crash by moving the
calls to pm_runtime_enable(), pm_runtime_get_sync() and
tegra_adma_init() after the DMA channels have been initialised.

Fixes: f33e7bb3eb92 ("dmaengine: tegra210-adma: restore channel status")

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/tegra210-adma.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index ac2a6b800db3..4f4733d831a1 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -744,16 +744,6 @@ static int tegra_adma_probe(struct platform_device *pdev)
 		return PTR_ERR(tdma->ahub_clk);
 	}
 
-	pm_runtime_enable(&pdev->dev);
-
-	ret = pm_runtime_get_sync(&pdev->dev);
-	if (ret < 0)
-		goto rpm_disable;
-
-	ret = tegra_adma_init(tdma);
-	if (ret)
-		goto rpm_put;
-
 	INIT_LIST_HEAD(&tdma->dma_dev.channels);
 	for (i = 0; i < tdma->nr_channels; i++) {
 		struct tegra_adma_chan *tdc = &tdma->channels[i];
@@ -771,6 +761,16 @@ static int tegra_adma_probe(struct platform_device *pdev)
 		tdc->tdma = tdma;
 	}
 
+	pm_runtime_enable(&pdev->dev);
+
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret < 0)
+		goto rpm_disable;
+
+	ret = tegra_adma_init(tdma);
+	if (ret)
+		goto rpm_put;
+
 	dma_cap_set(DMA_SLAVE, tdma->dma_dev.cap_mask);
 	dma_cap_set(DMA_PRIVATE, tdma->dma_dev.cap_mask);
 	dma_cap_set(DMA_CYCLIC, tdma->dma_dev.cap_mask);
@@ -812,13 +812,13 @@ static int tegra_adma_probe(struct platform_device *pdev)
 
 dma_remove:
 	dma_async_device_unregister(&tdma->dma_dev);
-irq_dispose:
-	while (--i >= 0)
-		irq_dispose_mapping(tdma->channels[i].irq);
 rpm_put:
 	pm_runtime_put_sync(&pdev->dev);
 rpm_disable:
 	pm_runtime_disable(&pdev->dev);
+irq_dispose:
+	while (--i >= 0)
+		irq_dispose_mapping(tdma->channels[i].irq);
 
 	return ret;
 }
-- 
2.20.1


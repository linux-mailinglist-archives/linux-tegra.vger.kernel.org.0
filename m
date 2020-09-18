Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7FBF26ED9B
	for <lists+linux-tegra@lfdr.de>; Fri, 18 Sep 2020 04:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729744AbgIRCWJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 17 Sep 2020 22:22:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:48014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728051AbgIRCRY (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 22:17:24 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D59423A02;
        Fri, 18 Sep 2020 02:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600395439;
        bh=YdD/Nvo27G+e8nrcZ5gaxYJze7xGEk/EPg48EyObEbQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=boYhox2MjhW2L4KYPNyqw96EC858rsb5ekoc2XWgoRhNGzTqiUdJ6fEjAG8UeAeky
         +cjBaJjY6oXYga4/LLYm86YFcl9sHgzuERKKpKe61oo9unJmAg76+hN+/rIbEemNg1
         Y/xgWrtvVBRlcd0rn8PmBu9kp96FXBXVtG1YQQKU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
        dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 28/64] dmaengine: tegra-apb: Prevent race conditions on channel's freeing
Date:   Thu, 17 Sep 2020 22:16:07 -0400
Message-Id: <20200918021643.2067895-28-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918021643.2067895-1-sashal@kernel.org>
References: <20200918021643.2067895-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

[ Upstream commit 8e84172e372bdca20c305d92d51d33640d2da431 ]

It's incorrect to check the channel's "busy" state without taking a lock.
That shouldn't cause any real troubles, nevertheless it's always better
not to have any race conditions in the code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Link: https://lore.kernel.org/r/20200209163356.6439-5-digetx@gmail.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/tegra20-apb-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index b5cf5d36de2b4..68c460a2b16ea 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1207,8 +1207,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 
 	dev_dbg(tdc2dev(tdc), "Freeing channel %d\n", tdc->id);
 
-	if (tdc->busy)
-		tegra_dma_terminate_all(dc);
+	tegra_dma_terminate_all(dc);
 
 	spin_lock_irqsave(&tdc->lock, flags);
 	list_splice_init(&tdc->pending_sg_req, &sg_req_list);
-- 
2.25.1


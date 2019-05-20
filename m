Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 270A623292
	for <lists+linux-tegra@lfdr.de>; Mon, 20 May 2019 13:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732961AbfETLdB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 20 May 2019 07:33:01 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44260 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732958AbfETLdB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 May 2019 07:33:01 -0400
Received: by mail-pg1-f193.google.com with SMTP id z16so6659433pgv.11
        for <linux-tegra@vger.kernel.org>; Mon, 20 May 2019 04:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=MjWLMAdBW11KI57uPKHpmOc8QO2EQsc2Bw5TFtq2aeM=;
        b=QlKJ6r1aObcZ4e/504tulmS44XDtvOqWXOeJ7wgE1B+qEzdF8A6Ye8ybl6JSbXdowf
         Fbx4Y0P9D/5zijVUhbgS/2hpOtRgBIilgav6Fn3qZV4A3hbgw25/Rzxea6lEyHRrDxBu
         0w+Jp7JdKp0vaJ1ZAHGJtNsZ195h2NaCgScaAnpZoqGbhRlItoawUBO+LTSL5fjnQC3r
         I03Bp6Fj4PFLvnYB8H8DaqWfJ4K4bfuNVzatgSU40EKQZzG31HCHatdZY3FPBK056x7r
         4AMw+Z9y8lJiDFYI3oQodoGTmTvmu9ekhcWYEM4ei6PXFx2sADK/ZiIWk3YLrnnIpeu5
         wUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=MjWLMAdBW11KI57uPKHpmOc8QO2EQsc2Bw5TFtq2aeM=;
        b=KmP/hbq3zs93ATkWzSbYwg6hnt1ZplPZmzTdckKza9c6h+G0l0NTN2j2Mh2bcz4RNC
         R7H7NzA02aITC80pAaSSnk0YKKX9Itxg59KL7p6pIpO5bz9F0zK4iosSD4dFlkbGbDma
         GBKl2N0GIY4mlCWh1BNi9DKHH+OUHaYfXpqICL3D4Z7JPvx43mDSUFI/cR9t5sW90YGn
         9fijOqI04jDDIZhNzedU02s4lEMBKT8cJgkF72EwkcU0V0e104ER9++n2bdgqT4cn53I
         8Cnvr6aP2u6iuQ68yi+G6eF0AFSFeb8dhI7qk+OIcC5xNLjDRylpzxY9vSIGTbk31vpn
         GsJA==
X-Gm-Message-State: APjAAAUqxJwE/KKdgpX/G4Lh+5u2mN8X/bBjI8pVwUmtwM+dybRG/Xc1
        T5I3MN64mgPJAR8THKFYeyFDPA==
X-Google-Smtp-Source: APXvYqzvbnYheVzjLAwm4HomvMFLaeeJKqzxnDKXoHl0dMjK1k4k08i8lD/BQRS3A+Rm2kIGCkj5/Q==
X-Received: by 2002:a65:5302:: with SMTP id m2mr62317316pgq.369.1558351980703;
        Mon, 20 May 2019 04:33:00 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id z124sm21310020pfz.116.2019.05.20.04.32.56
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 04:33:00 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     dan.j.williams@intel.com, vkoul@kernel.org
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, wsa+renesas@sang-engineering.com,
        jroedel@suse.de, vincent.guittot@linaro.org,
        baolin.wang@linaro.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 6/8] dmaengine: mxs-dma: Let the core do the device node validation
Date:   Mon, 20 May 2019 19:32:19 +0800
Message-Id: <15bd5303ecf61f3a3aacd0b078d13f042dea73c6.1558351667.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1558351667.git.baolin.wang@linaro.org>
References: <cover.1558351667.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1558351667.git.baolin.wang@linaro.org>
References: <cover.1558351667.git.baolin.wang@linaro.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Let the DMA engine core do the device node validation instead of drivers.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/dma/mxs-dma.c |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 22cc7f6..8ce5e79 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -716,7 +716,6 @@ static int __init mxs_dma_init(struct mxs_dma_engine *mxs_dma)
 }
 
 struct mxs_dma_filter_param {
-	struct device_node *of_node;
 	unsigned int chan_id;
 };
 
@@ -727,9 +726,6 @@ static bool mxs_dma_filter_fn(struct dma_chan *chan, void *fn_param)
 	struct mxs_dma_engine *mxs_dma = mxs_chan->mxs_dma;
 	int chan_irq;
 
-	if (mxs_dma->dma_device.dev->of_node != param->of_node)
-		return false;
-
 	if (chan->chan_id != param->chan_id)
 		return false;
 
@@ -752,13 +748,13 @@ static struct dma_chan *mxs_dma_xlate(struct of_phandle_args *dma_spec,
 	if (dma_spec->args_count != 1)
 		return NULL;
 
-	param.of_node = ofdma->of_node;
 	param.chan_id = dma_spec->args[0];
 
 	if (param.chan_id >= mxs_dma->nr_channels)
 		return NULL;
 
-	return dma_request_channel(mask, mxs_dma_filter_fn, &param);
+	return __dma_request_channel(&mask, mxs_dma_filter_fn, &param,
+				     ofdma->of_node);
 }
 
 static int __init mxs_dma_probe(struct platform_device *pdev)
-- 
1.7.9.5


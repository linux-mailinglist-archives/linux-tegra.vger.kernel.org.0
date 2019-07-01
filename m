Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 261D015D22
	for <lists+linux-tegra@lfdr.de>; Tue,  7 May 2019 08:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbfEGGKX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 7 May 2019 02:10:23 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37482 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbfEGGKW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 May 2019 02:10:22 -0400
Received: by mail-pg1-f196.google.com with SMTP id e6so7735880pgc.4
        for <linux-tegra@vger.kernel.org>; Mon, 06 May 2019 23:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=zZVeFg3ilWn9d8BrQHwI8nm6+PjT4Uc8w1q60Oaxq8U=;
        b=rPaqrwn1dFRkPgVFFCucjoHDO9tCwtxHdMU6tMSwe80W34i8kOmUplfqdBpDJW71dL
         HM7rhYYCe2OGnSSmfVroNtvEdyr6r7JIRywbildJSl0RVF6A1wLs6aWvKzSZ2PgnRXUr
         cCHXZ+OvTXZRbab/VqQs16S4bcCDRdFSdBLLkKHfQ2NssH3PQGzdeVU7HlXwxk6EchIq
         dOsBethnRBXf/G73slckz7OKvoPkhfOznt28Mc5bFa9lCakZNCytQ77xEb/RWjolQr8b
         0SziRR+oL/8Spt70qUhBz+G15DXEaE9/MAvB/8OqYQXH9eRx9Nm1j2FxuRpLUtg1ymrJ
         HD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=zZVeFg3ilWn9d8BrQHwI8nm6+PjT4Uc8w1q60Oaxq8U=;
        b=SQKm+Ni+5Wqq//J8voawSPaiUoB/rWKvbmOCsVRumuZeJUWyujnbzUApy82PJT72TI
         hdeCIxIsn0L13CxsdhBHXpsgCSGUbQj1lPlpiOBdNy0RIp6KQsOejgCrJL4t1Zc6+s1v
         rigojki/HAeXe0pGc52WmRgjtSQq3zse9DAdgo90b6ebK+NGcLtwQJUgE35RUthbme9B
         okYD3vA0ZOE2ZXCvJNxTzieb6RRSpmOpZYe8/xz/LMFuppDVJUDvhAu40wH/sfbDNlMr
         mAhWJ5Ph3YxtUK67eqrtBWYjAeYq81jE95WmwONrT1xLZfhh98GNZE+rpOHMfRxzwaz2
         M5wA==
X-Gm-Message-State: APjAAAXsX7KXqu9QJGdz1v79tgbsnKeEqWZq3UL9nPPg9WxRsjVFESzN
        CQxMbeWH2aOZO8j4zDVx/dat9w==
X-Google-Smtp-Source: APXvYqx2qWlTeHpIBatZZRSy2fiI3ZlapPkg6bNITXkF5AhanuTKXxUc3Xf9Hd7av0sMdlgfjtY7BA==
X-Received: by 2002:a65:62c4:: with SMTP id m4mr37228778pgv.308.1557209422442;
        Mon, 06 May 2019 23:10:22 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id e184sm30786325pfc.102.2019.05.06.23.10.17
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 06 May 2019 23:10:21 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     dan.j.williams@intel.com, vkoul@kernel.org
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, Zubair.Kakakhel@imgtec.com,
        wsa+renesas@sang-engineering.com, jroedel@suse.de,
        vincent.guittot@linaro.org, baolin.wang@linaro.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/8] dmaengine: imx-sdma: Let the core do the device node validation
Date:   Tue,  7 May 2019 14:09:40 +0800
Message-Id: <60acb5443a9bc18789bd86d6722f4726bf372fbc.1557206859.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1557206859.git.baolin.wang@linaro.org>
References: <cover.1557206859.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1557206859.git.baolin.wang@linaro.org>
References: <cover.1557206859.git.baolin.wang@linaro.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Let the DMA engine core do the device node validation instead of drivers.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/dma/imx-sdma.c                |    9 ++-------
 include/linux/platform_data/dma-imx.h |    1 -
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 5f3c137..1a11118 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -1921,16 +1921,11 @@ static int sdma_init(struct sdma_engine *sdma)
 static bool sdma_filter_fn(struct dma_chan *chan, void *fn_param)
 {
 	struct sdma_channel *sdmac = to_sdma_chan(chan);
-	struct sdma_engine *sdma = sdmac->sdma;
 	struct imx_dma_data *data = fn_param;
 
 	if (!imx_dma_is_general_purpose(chan))
 		return false;
 
-	/* return false if it's not the right device */
-	if (sdma->dev->of_node != data->of_node)
-		return false;
-
 	sdmac->data = *data;
 	chan->private = &sdmac->data;
 
@@ -1958,9 +1953,9 @@ static struct dma_chan *sdma_xlate(struct of_phandle_args *dma_spec,
 	 * be set to sdmac->event_id1.
 	 */
 	data.dma_request2 = 0;
-	data.of_node = ofdma->of_node;
 
-	return dma_request_channel(mask, sdma_filter_fn, &data);
+	return __dma_request_channel(&mask, sdma_filter_fn, &data,
+				     ofdma->of_node);
 }
 
 static int sdma_probe(struct platform_device *pdev)
diff --git a/include/linux/platform_data/dma-imx.h b/include/linux/platform_data/dma-imx.h
index 9daea8d..7d964e7 100644
--- a/include/linux/platform_data/dma-imx.h
+++ b/include/linux/platform_data/dma-imx.h
@@ -55,7 +55,6 @@ struct imx_dma_data {
 	int dma_request2; /* secondary DMA request line */
 	enum sdma_peripheral_type peripheral_type;
 	int priority;
-	struct device_node *of_node;
 };
 
 static inline int imx_dma_is_ipu(struct dma_chan *chan)
-- 
1.7.9.5


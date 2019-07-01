Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8E723295
	for <lists+linux-tegra@lfdr.de>; Mon, 20 May 2019 13:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732975AbfETLdG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 20 May 2019 07:33:06 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44269 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731142AbfETLdG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 May 2019 07:33:06 -0400
Received: by mail-pg1-f195.google.com with SMTP id z16so6659535pgv.11
        for <linux-tegra@vger.kernel.org>; Mon, 20 May 2019 04:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=S4gzzO6EwH6f41hdnpuqebXlIsK5G8TT4DFszJQHgV0=;
        b=kGzjAWx09b8i614qTj93eApuhAYdKFfSCQb0+hZtpocLm2MSIaH0rF9+HiZf0A+vcj
         DFTljdFN5pWcPxuYfUOJ68tQFKj30ZgtibGH2S3BXHbVCKNLZZhwrhp/XsRkXdFInukP
         Xjk9fWaCFqZJ8jZcXhR3aezzU8FJfnpD/f2ytgb8QX23t5dF/R+yuoTqXH0C0ZF9DjXK
         kK/Z6PNz6xn9BbWuEogWU+jIyoiUOisWLQVu90JBLpFdeKSeAFeaYkcaW1tllFwwnKdZ
         nJfsJF6cAcVhHJ/woNRx2z15cQYdmwdMhtceda3QpfeXnUfr/bh84yM2S2fBpXB8Pd1R
         Y6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=S4gzzO6EwH6f41hdnpuqebXlIsK5G8TT4DFszJQHgV0=;
        b=NAHrKtYdOuu6DlqNhBVkEtWhZy9FZvPOFf64lbmFsb5R4YA02+91mON+3QDRcWMjVD
         rpbbZxY9lS9YHzGfg02AplwXTiiDtkA49YV4oev3EUFF80+whO3zIyTxAFCwalc8onKV
         VlBk1HaNFYw7HfFjAgDFDEFWPB7bubhjGI6wFn7fp4EsAQAoSmejum6FSdmAyjKgqbZq
         d7gX9D0khz5SarzjOrLDe0PBfc7D5ZGodz3BalDd0hr1CJ8CtwqhKta5e8rDfWZFNUJK
         8qit4jz+StIYlfTtsA4s7Nc01i60lxnrNRujmQwLAJTrcHILch5i8JY5Lkp6UwoHWt+H
         GUBQ==
X-Gm-Message-State: APjAAAWoWW1NgdP3BcxVW9zjRf0JHqbC1a+SXuXBleQilN2KXJmTMUOY
        35a9ERfSKtRsTYIjD1FLkoTspA==
X-Google-Smtp-Source: APXvYqz1+ao7UVqG40GQmasG5WxCT+39UIx+E5Jw485BRv+ugxfxElvHdFQ11VJd43Wx3nTx7nGipA==
X-Received: by 2002:a63:6cc5:: with SMTP id h188mr13909311pgc.105.1558351985496;
        Mon, 20 May 2019 04:33:05 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id z124sm21310020pfz.116.2019.05.20.04.33.00
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 04:33:05 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     dan.j.williams@intel.com, vkoul@kernel.org
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, wsa+renesas@sang-engineering.com,
        jroedel@suse.de, vincent.guittot@linaro.org,
        baolin.wang@linaro.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 7/8] dmaengine: sh: rcar-dmac: Let the core do the device node validation
Date:   Mon, 20 May 2019 19:32:20 +0800
Message-Id: <6e544656cea22f93bdb2626620b381b00d1b38bf.1558351667.git.baolin.wang@linaro.org>
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
 drivers/dma/sh/rcar-dmac.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 33ab1b6..67df54a 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1654,8 +1654,7 @@ static bool rcar_dmac_chan_filter(struct dma_chan *chan, void *arg)
 	 * Forcing it to call dma_request_channel() and iterate through all
 	 * channels from all controllers is just pointless.
 	 */
-	if (chan->device->device_config != rcar_dmac_device_config ||
-	    dma_spec->np != chan->device->dev->of_node)
+	if (chan->device->device_config != rcar_dmac_device_config)
 		return false;
 
 	return !test_and_set_bit(dma_spec->args[0], dmac->modules);
@@ -1675,7 +1674,8 @@ static struct dma_chan *rcar_dmac_of_xlate(struct of_phandle_args *dma_spec,
 	dma_cap_zero(mask);
 	dma_cap_set(DMA_SLAVE, mask);
 
-	chan = dma_request_channel(mask, rcar_dmac_chan_filter, dma_spec);
+	chan = __dma_request_channel(&mask, rcar_dmac_chan_filter, dma_spec,
+				     ofdma->of_node);
 	if (!chan)
 		return NULL;
 
-- 
1.7.9.5


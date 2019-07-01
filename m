Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 258B32328B
	for <lists+linux-tegra@lfdr.de>; Mon, 20 May 2019 13:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731760AbfETLcw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 20 May 2019 07:32:52 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43303 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732934AbfETLcw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 May 2019 07:32:52 -0400
Received: by mail-pg1-f195.google.com with SMTP id f25so123120pgv.10
        for <linux-tegra@vger.kernel.org>; Mon, 20 May 2019 04:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=Cnx84NxIhSp4uZgqi6VSWZYaVNVqt10XSPlG8JL56aM=;
        b=Mc4UZBCTGeP16M5dC8d43FPiSMsrdIIRD0s1wJ3KIvGHw+JOobzUKZHB0Q73iG3BTg
         V1l22QS5KJy5tXZPxHsQ9Mo7fVFBsMD7FRweoPvewbBbo62lTppD8pPJHBkor7ekGe3j
         PPFqi5Wdl4B9MzR3QJGHoKzN9KO9A5aa2u6lsjS6tZ9ohu5PS1AQTwdCEgh1IVHPURc5
         Py3c2rYZyRrff+CtksSQP1kLT7g3w0aSUXqFbK2960r8YJHBAG0F6FtkWv/SXPaG5Gq8
         XKa7McsxohMfNawU7tUAhFpQfWCIpWFs89ePwMm5HMMISDMi9KE0isl13qia+OwjzVYJ
         H+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=Cnx84NxIhSp4uZgqi6VSWZYaVNVqt10XSPlG8JL56aM=;
        b=aoTpz1EPdH8a9vSJcKD1OR7UtGqxRiPBa/H2cA0x3a6zBaCDH3wrkVziUTQTx/ofLZ
         Kq5JYcgxXe7OgkLY05QQ+V1ydaGhr8lso3MIPok9xok0IU1Cx0LPm1mgDGqPqJcqeTD0
         vLB/6HNYzNDjcthcDcGDLi0N07irh+34B6ZKkCwC49nvfKIrzRc2zmmJrOFXjEfn3MSG
         tBVruMXs77yYDkU2ssfoQ6R3+JRMZMVj7Bx2W0gB7vo6STiWNudQchkF59fIJQ8o2mm/
         +hEV8E47KiOz7lCUc2TtJsoFBbEYPEheupqyjd/fLPq5U0g90PWqLPGkX43dy/k6MtMl
         J+2w==
X-Gm-Message-State: APjAAAWuv9y35SZUCu0+N0YwawaXBkQPly/TkAufQYrW7mksbcVW2ULb
        2gI+4R+yy4qqqjaseNifvnmdYA==
X-Google-Smtp-Source: APXvYqwEGtRYs32a6qVJ0IDeIICdhKvEjXa4z1alPx313+QuihcD0g4n814DyWumr6jWnBbSFvUJJg==
X-Received: by 2002:a65:42cd:: with SMTP id l13mr21734824pgp.72.1558351971654;
        Mon, 20 May 2019 04:32:51 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id z124sm21310020pfz.116.2019.05.20.04.32.47
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 04:32:51 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     dan.j.williams@intel.com, vkoul@kernel.org
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, wsa+renesas@sang-engineering.com,
        jroedel@suse.de, vincent.guittot@linaro.org,
        baolin.wang@linaro.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/8] dmaengine: dma-jz4780: Let the core do the device node validation
Date:   Mon, 20 May 2019 19:32:17 +0800
Message-Id: <231f063f65d0f4ca9a69edfb267fb82500954415.1558351667.git.baolin.wang@linaro.org>
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
 drivers/dma/dma-jz4780.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index 9ce0a38..7e1d381 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -160,7 +160,6 @@ struct jz4780_dma_dev {
 };
 
 struct jz4780_dma_filter_data {
-	struct device_node *of_node;
 	uint32_t transfer_type;
 	int channel;
 };
@@ -765,8 +764,6 @@ static bool jz4780_dma_filter_fn(struct dma_chan *chan, void *param)
 	struct jz4780_dma_dev *jzdma = jz4780_dma_chan_parent(jzchan);
 	struct jz4780_dma_filter_data *data = param;
 
-	if (jzdma->dma_device.dev->of_node != data->of_node)
-		return false;
 
 	if (data->channel > -1) {
 		if (data->channel != jzchan->id)
@@ -790,7 +787,6 @@ static struct dma_chan *jz4780_of_dma_xlate(struct of_phandle_args *dma_spec,
 	if (dma_spec->args_count != 2)
 		return NULL;
 
-	data.of_node = ofdma->of_node;
 	data.transfer_type = dma_spec->args[0];
 	data.channel = dma_spec->args[1];
 
@@ -815,7 +811,8 @@ static struct dma_chan *jz4780_of_dma_xlate(struct of_phandle_args *dma_spec,
 		return dma_get_slave_channel(
 			&jzdma->chan[data.channel].vchan.chan);
 	} else {
-		return dma_request_channel(mask, jz4780_dma_filter_fn, &data);
+		return __dma_request_channel(&mask, jz4780_dma_filter_fn, &data,
+					     ofdma->of_node);
 	}
 }
 
-- 
1.7.9.5


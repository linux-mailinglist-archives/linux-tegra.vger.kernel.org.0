Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2747823299
	for <lists+linux-tegra@lfdr.de>; Mon, 20 May 2019 13:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732999AbfETLdM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 20 May 2019 07:33:12 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34843 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732957AbfETLdL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 May 2019 07:33:11 -0400
Received: by mail-pl1-f193.google.com with SMTP id p1so1219496plo.2
        for <linux-tegra@vger.kernel.org>; Mon, 20 May 2019 04:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=kSx/2bQ8k2nUJmyS2liy45fCcO2iYHSDnrOKKw/RGV4=;
        b=cPRtb7tQHJTTiLOHkiEpYP+wKGEqufi5OlZI8LAVDn750p0hkPo7BlZXT75VNfp9dR
         bKCNesFU3UCDsME+gGsOPK0VHvOUsTWH5NPfg+xK8mJwmFd5vbJmaO0EKQMFmNQ+n19H
         U8mqxoNBif5syGeoUe2lEXsWbDC1YB0BzSBgumFCN8STOyMNeJCtTeNLvgnvh10BAtQu
         5J6eaQFuVUuyZhLT2t+Y0NRhAjRTWOVvbNG74UrINXey6BdbxtdfZyTEs6vh0o0X64Ku
         AulkUGud8AZoQWHpwMC3klVwa3PQ8CDJYu9MkPTAavxbcDPzAhTfuFpg/fcSO03u0aXx
         CAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=kSx/2bQ8k2nUJmyS2liy45fCcO2iYHSDnrOKKw/RGV4=;
        b=JruU2osOoyCryVLpxnFvei3fI8Sg6i6xuH9s6fpfvDMRFw4e9t/RLxCmL8K95ydP+5
         Y1JmsD6ktX2rl5j9cUA1MzvuadwHx06Hn2EVFj3ab6cMnRVPYX4KjUpWt3tySWuaFeD+
         UOvzF9ZMmu+da3E0EzLCR+72yA+bdVsuDaUn0xndALdpIZIXqJTqn0JjImSoomEy5Hfk
         olWOK5d6ZyDv07C7UDrfLaNXfDDmEt5VVdJA1lAXvKibdD5W4YYjGIdvu3/583bfrvue
         EZTsaWOWo+xrgEkx3og4Vx8QD5JulE52BqFMyZEyT4ycE9kOgP5xzLdGSNrxhjZTdwBA
         FSuw==
X-Gm-Message-State: APjAAAVlfc5BxuEAQmYVH01iNLIo9tt9ua5SPE1BN3mvd4ZQC9dCN/YE
        YBZHancuiHLcATjQeFFq4SSYSA==
X-Google-Smtp-Source: APXvYqxhkwURFkAYdOsYEFVXpnFbD8H/TQI0K1REXB9rdjkjQNCy7pJURAn59WPfwElP41gCPmfnxw==
X-Received: by 2002:a17:902:18b:: with SMTP id b11mr50155937plb.264.1558351990778;
        Mon, 20 May 2019 04:33:10 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id z124sm21310020pfz.116.2019.05.20.04.33.05
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 04:33:10 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     dan.j.williams@intel.com, vkoul@kernel.org
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, wsa+renesas@sang-engineering.com,
        jroedel@suse.de, vincent.guittot@linaro.org,
        baolin.wang@linaro.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 8/8] dmaengine: sh: usb-dmac: Let the core do the device node validation
Date:   Mon, 20 May 2019 19:32:21 +0800
Message-Id: <0b4418a1891261a6a4f8e8356b68e38f4ed6a1d5.1558351667.git.baolin.wang@linaro.org>
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
 drivers/dma/sh/usb-dmac.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
index 59403f6..0afabf3 100644
--- a/drivers/dma/sh/usb-dmac.c
+++ b/drivers/dma/sh/usb-dmac.c
@@ -636,9 +636,6 @@ static bool usb_dmac_chan_filter(struct dma_chan *chan, void *arg)
 	struct usb_dmac_chan *uchan = to_usb_dmac_chan(chan);
 	struct of_phandle_args *dma_spec = arg;
 
-	if (dma_spec->np != chan->device->dev->of_node)
-		return false;
-
 	/* USB-DMAC should be used with fixed usb controller's FIFO */
 	if (uchan->index != dma_spec->args[0])
 		return false;
@@ -659,7 +656,8 @@ static struct dma_chan *usb_dmac_of_xlate(struct of_phandle_args *dma_spec,
 	dma_cap_zero(mask);
 	dma_cap_set(DMA_SLAVE, mask);
 
-	chan = dma_request_channel(mask, usb_dmac_chan_filter, dma_spec);
+	chan = __dma_request_channel(&mask, usb_dmac_chan_filter, dma_spec,
+				     ofdma->of_node);
 	if (!chan)
 		return NULL;
 
-- 
1.7.9.5


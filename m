Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7E8315D1D
	for <lists+linux-tegra@lfdr.de>; Tue,  7 May 2019 08:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfEGGKS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 7 May 2019 02:10:18 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39481 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbfEGGKR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 May 2019 02:10:17 -0400
Received: by mail-pf1-f193.google.com with SMTP id z26so8076990pfg.6
        for <linux-tegra@vger.kernel.org>; Mon, 06 May 2019 23:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=fegqHJdxTxrNP4emVZDAfoflYxMDA5HIYSCVsGvvNyk=;
        b=gpuzGeOzJL+S9gtU42ApMv5X8chVRN0hkaUIvi7zD8VoJwnOqdqmXq7dtEBURIpA7j
         G/9Ev+cBM6PV3Go/z0mD8a8YNo5qNaDn0y4C4vJmag/YvzNjrhKByuxYlaoJr0TbQ5eo
         2nfWjzDy/wFJLus92xSxL6b1c35GEBUadXry11rD/4luRTR0OTnpL1BvwojJFoJbTZ3q
         qWa5bLbGM9gj9Fx9aaKvHXZ3P3VInHnxnX37d6LK/Ysm/eB1ph8aMLSOBxn6e7x3Zz1j
         uw+pixeKEBnvOiks2g0sUhhj+flFxFWtez0II53gaB23VlKlK7kIVnWRfR8jUkae/ejN
         WMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=fegqHJdxTxrNP4emVZDAfoflYxMDA5HIYSCVsGvvNyk=;
        b=nueekYSyOXHzL6+QGK/jYXHQzNZ3NkoowDVG0JnPy7cml4eLBYxwTv8ZTc4Etoc2N5
         KRZ0EuVJwOhMf0SQdjGm4m38bCCETOW4ivdSX/3jBu4kFTDky//Hu4uqIyIYc6coogG2
         ALTuU3ldzg/VV1TfwkmGwTmKtUwVXNIPmmlvg1p+ogwQFAGrbR3BEMjCTyyuNy84cJvj
         wcf5/tSFC39uwooHYBfT4G9wH/N0EW1dnXFagWmOZ5DstSblpC1FAU6moF3fZJHwsoH4
         uUO1MijFxoKeEuaR780tX6Ujd2fSB5T5zqVSQMLgccEqR5a7pevU4qkC1i2rPUhupFXV
         5Q5Q==
X-Gm-Message-State: APjAAAWVQHSeXADRCVI5OOcrLYOE2nRRcuLD/WtJ3W457bS0VqgGDCZP
        Gtk+iHFbapLhRn9+cw6xlC4SUQ==
X-Google-Smtp-Source: APXvYqzTNghUUH/vAVAHLtApBnwfwTv9iOi8rSX6GEZxoSO4Ljp5Aibele+BPHXO5ocKnwntiyTY2w==
X-Received: by 2002:a65:5184:: with SMTP id h4mr37881601pgq.109.1557209417270;
        Mon, 06 May 2019 23:10:17 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id e184sm30786325pfc.102.2019.05.06.23.10.12
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 06 May 2019 23:10:16 -0700 (PDT)
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
Subject: [PATCH 2/8] soc: tegra: fuse: Change to the correct __dma_request_channel() prototype
Date:   Tue,  7 May 2019 14:09:39 +0800
Message-Id: <1ddb1abe8722154dd546d265d5c4536480a24a87.1557206859.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1557206859.git.baolin.wang@linaro.org>
References: <cover.1557206859.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1557206859.git.baolin.wang@linaro.org>
References: <cover.1557206859.git.baolin.wang@linaro.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Since we've introduced one device node parameter for __dma_request_channel(),
thus change to the correct function prototype.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/soc/tegra/fuse/fuse-tegra20.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/fuse/fuse-tegra20.c
index 49ff017..e2571b6 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra20.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
@@ -110,7 +110,7 @@ static int tegra20_fuse_probe(struct tegra_fuse *fuse)
 	dma_cap_zero(mask);
 	dma_cap_set(DMA_SLAVE, mask);
 
-	fuse->apbdma.chan = __dma_request_channel(&mask, dma_filter, NULL);
+	fuse->apbdma.chan = __dma_request_channel(&mask, dma_filter, NULL, NULL);
 	if (!fuse->apbdma.chan)
 		return -EPROBE_DEFER;
 
-- 
1.7.9.5


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA8CB294B1F
	for <lists+linux-tegra@lfdr.de>; Wed, 21 Oct 2020 12:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405242AbgJUKLh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 21 Oct 2020 06:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728012AbgJUKLh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Oct 2020 06:11:37 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD6EC0613CE
        for <linux-tegra@vger.kernel.org>; Wed, 21 Oct 2020 03:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=GPk+Vc4MLCkQhOcpoKYqeTnVTWZTfNVL3seSjTjvasM=; b=PMsWf3B3IgHUpQuD5qWcRV1b3T
        8oFszBDd9f+i+GOFqyr/uNgXy30zQd8jU7XeNvk9Hu2BQVQ37gddOx9Abk8sfBhu9ukhPRFVP2V9s
        Gmw+zpfYynke2mcDvqEHxh+4z5R89A/aOWsslIZzM3EFDC3cm4/C9k/hT1i4721uN9INR9zNFhtIy
        JDhHf5KA5kS9lY5lbwLe0otV33ypR1JDAu9a/tdE+3VdMVmNksZzrdt4G1qR0M949FoTD1DQuObOb
        RfYoehL5Qet8KxpDuMaC93gFVvhcoQcJFwEad5RzgERRWGDyo9ywuo1y3gQQkK7DlX84aQZ3/3u7l
        o5x9xbnw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kVB5b-0003nV-33; Wed, 21 Oct 2020 13:11:27 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     pdeschrijver@nvidia.com, mturquette@baylibre.com, sboyd@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        Sivaram Nair <sivaramn@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH] clk: tegra: bpmp: Clamp clock rates on requests
Date:   Wed, 21 Oct 2020 13:10:54 +0300
Message-Id: <20201021101054.2836146-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Sivaram Nair <sivaramn@nvidia.com>

BPMP firmware ABI expects the rate inputs in int64_t. However,
tegra_bpmp_clk_round_rate() and tegra_bpmp_clk_set_rate() functions
directly assign 'unsigned long' inputs to a int64_t value causing
unexpected rounding errors.

Fix this by clipping the input rate to S64_MAX.

Signed-off-by: Sivaram Nair <sivaramn@nvidia.com>
[mperttunen: slight cleanup]
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/clk/tegra/clk-bpmp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index a66263b6490d..6ecf18f71c32 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2016 NVIDIA Corporation
+ * Copyright (C) 2016-2020 NVIDIA Corporation
  */
 
 #include <linux/clk-provider.h>
@@ -174,7 +174,7 @@ static long tegra_bpmp_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	int err;
 
 	memset(&request, 0, sizeof(request));
-	request.rate = rate;
+	request.rate = min_t(u64, rate, S64_MAX);
 
 	memset(&msg, 0, sizeof(msg));
 	msg.cmd = CMD_CLK_ROUND_RATE;
@@ -256,7 +256,7 @@ static int tegra_bpmp_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct tegra_bpmp_clk_message msg;
 
 	memset(&request, 0, sizeof(request));
-	request.rate = rate;
+	request.rate = min_t(u64, rate, S64_MAX);
 
 	memset(&msg, 0, sizeof(msg));
 	msg.cmd = CMD_CLK_SET_RATE;
-- 
2.28.0


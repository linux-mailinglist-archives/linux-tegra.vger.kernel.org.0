Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6144E9424
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Mar 2022 13:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240947AbiC1L02 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Mar 2022 07:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240897AbiC1LYf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Mar 2022 07:24:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D8155BEC;
        Mon, 28 Mar 2022 04:22:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7ACC3611B3;
        Mon, 28 Mar 2022 11:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6379C34111;
        Mon, 28 Mar 2022 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648466571;
        bh=mNU03RKrGsnhzrcliWEfwHVOO2UBDTTyYWKYpovJnz8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WL/hdY8PZFvey3RohjcoIufwAOq1dGdHcVx9enqz8vgfdn+devEHHxHbsb31IiB0j
         ZQjMoctuJ/bfWnnXGZerZxUVeMsczJb0x+xOEHZK6zeB/QfLWmB65OfZzHMOOe8cqd
         67uzBGVXPEkZJ/y5b5bGCJzHSB4QFZ9RdcMJXTAV9PxMwnyT9oWK++src1cFcJKjD/
         GqzN7tW6jTifkuyePbBIWn9L9dgNRYbWEClNF08aaS/7jDtWCdJICSZ1zPCE0dQ0Fb
         63CYIyIBujGEFh3qvq371sXqYnST8G/YgTHhc/X+nYFhcnyY8V4kLiBJgl11WuDO7r
         EB3yHJSYtbIFA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Minghao Chi <chi.minghao@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>,
        Mark Brown <broonie@kernel.org>,
        Sasha Levin <sashal@kernel.org>, ldewangan@nvidia.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 28/29] spi: tegra20: Use of_device_get_match_data()
Date:   Mon, 28 Mar 2022 07:21:30 -0400
Message-Id: <20220328112132.1555683-28-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220328112132.1555683-1-sashal@kernel.org>
References: <20220328112132.1555683-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Minghao Chi <chi.minghao@zte.com.cn>

[ Upstream commit c9839acfcbe20ce43d363c2a9d0772472d9921c0 ]

Use of_device_get_match_data() to simplify the code.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
Link: https://lore.kernel.org/r/20220315023138.2118293-1-chi.minghao@zte.com.cn
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-tegra20-slink.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-slink.c
index 3226c4e1c7c0..3b44ca455049 100644
--- a/drivers/spi/spi-tegra20-slink.c
+++ b/drivers/spi/spi-tegra20-slink.c
@@ -1003,14 +1003,8 @@ static int tegra_slink_probe(struct platform_device *pdev)
 	struct resource		*r;
 	int ret, spi_irq;
 	const struct tegra_slink_chip_data *cdata = NULL;
-	const struct of_device_id *match;
 
-	match = of_match_device(tegra_slink_of_match, &pdev->dev);
-	if (!match) {
-		dev_err(&pdev->dev, "Error: No device match found\n");
-		return -ENODEV;
-	}
-	cdata = match->data;
+	cdata = of_device_get_match_data(&pdev->dev);
 
 	master = spi_alloc_master(&pdev->dev, sizeof(*tspi));
 	if (!master) {
-- 
2.34.1


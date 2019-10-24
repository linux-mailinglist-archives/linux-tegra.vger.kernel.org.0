Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B76DE38AC
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439930AbfJXQqa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:30 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40676 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439916AbfJXQq3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:29 -0400
Received: by mail-wr1-f65.google.com with SMTP id o28so26847495wro.7
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NT91ixyOydK7qB96GIPJOfEspuJPPBJ5IFvHC12wAR8=;
        b=i5ZvW56P9o2vrG223SkKlNPdXMG9zWHHbDYW525HN4gnSUp0eii74knnQ2y/Pm+vGT
         4Le1b81W8dEXQl4E8+TYHNX6b+/jQJcc6EQso72skJUHSTd8s4e2mR5ioivA38VVN0nQ
         WStZKlHF3emj0pIvcqcdlGUA+et2LkbMzZYH2oI191s1rVrapoAc42nApWQ7CeJrQb7K
         ZxRewovB7f6BzxsRViin2EGNObaxcucUfjbaMeOmOBHuFThI3efhWDBA+s/v/n6Nb/XX
         09J8+/lorpSSgqVjboGTqb08EIAUxw98mjBTZB52b4GywsFSJ/9A4MSndZi6MYvclr0L
         K8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NT91ixyOydK7qB96GIPJOfEspuJPPBJ5IFvHC12wAR8=;
        b=blM9Sa9zzl0/1LnH9emmuiN6lgv1Vyo7yZUVz5dEROnA3BvqToKGYL/9m+tohUJLH6
         tn/DqW7waZgt7Ba73ovjVby0IxgkykMXk33GvMWhWWeUg445b5c2TBLtsnrwIeYohrwN
         v/cuc2hPrJOBojqtYpAxoSg235mdlJ05Bkm9qI2QTbbL400gT/++eOMyNauZSdRzxeVG
         46H95WhhtynM/kxKT0N608SWD7EPsLrf24kL7xcWPFWkDYviby5367mx9GJCy2Za3Vrr
         L9OiCgmq2Kh4ADzEkTvIEC8bSnP1QOWdqdCv99Xh4Xc54DkA5CFqCJ7PwRhxscQO8VD6
         q5Iw==
X-Gm-Message-State: APjAAAXRzkrvJtXg4QxfQSwcY4mMpFjMPQihdkiUTMJxUAzNQ60xfi6S
        RYrbl4tzmS4SjrP+vYgfnwORzDw1
X-Google-Smtp-Source: APXvYqxXZcg2upg7fjAz2/y500pwHBj5qwugs8fAt0m2iRpSER2xWrE2PrSTsevL9U61oGwvwU3V0Q==
X-Received: by 2002:a05:6000:11c4:: with SMTP id i4mr4638067wrx.277.1571935586785;
        Thu, 24 Oct 2019 09:46:26 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id g5sm3596115wmg.12.2019.10.24.09.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:25 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 22/32] drm/tegra: sor: Remove tegra186-sor1 support
Date:   Thu, 24 Oct 2019 18:45:24 +0200
Message-Id: <20191024164534.132764-23-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

It turns out that SOR1 is just another instance of the same block as the
SOR0, so there is no need to distinguish them.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 9cf008d7c67b..4e46524f22e3 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3680,23 +3680,6 @@ static const u8 tegra186_sor_pre_emphasis[4][4][4] = {
 };
 
 static const struct tegra_sor_soc tegra186_sor = {
-	.supports_edp = false,
-	.supports_lvds = false,
-	.supports_hdmi = false,
-	.supports_dp = true,
-
-	.regs = &tegra186_sor_regs,
-	.has_nvdisplay = true,
-
-	.xbar_cfg = tegra124_sor_xbar_cfg,
-	.lane_map = tegra124_sor_lane_map,
-	.voltage_swing = tegra186_sor_voltage_swing,
-	.pre_emphasis = tegra186_sor_pre_emphasis,
-	.post_cursor = tegra124_sor_post_cursor,
-	.tx_pu = tegra124_sor_tx_pu,
-};
-
-static const struct tegra_sor_soc tegra186_sor1 = {
 	.supports_edp = false,
 	.supports_lvds = false,
 	.supports_hdmi = true,
@@ -3747,7 +3730,6 @@ static const struct tegra_sor_soc tegra194_sor = {
 
 static const struct of_device_id tegra_sor_of_match[] = {
 	{ .compatible = "nvidia,tegra194-sor", .data = &tegra194_sor },
-	{ .compatible = "nvidia,tegra186-sor1", .data = &tegra186_sor1 },
 	{ .compatible = "nvidia,tegra186-sor", .data = &tegra186_sor },
 	{ .compatible = "nvidia,tegra210-sor1", .data = &tegra210_sor1 },
 	{ .compatible = "nvidia,tegra210-sor", .data = &tegra210_sor },
-- 
2.23.0


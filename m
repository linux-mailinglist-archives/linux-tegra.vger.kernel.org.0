Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50BE61AD10C
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2020 22:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727863AbgDPU0r (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Apr 2020 16:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725991AbgDPU0q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Apr 2020 16:26:46 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7C8C061A0C
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 13:26:46 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t14so9890wrw.12
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 13:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b6MMAjZWva3A98ON/Z211sRWwTT87DwPEC7oQ/eZeGw=;
        b=uXOMna5u2maQ7AyWYbgZEnoMNq0uduKydvcWdPeiVeM1EkUraifp/jClyCIUzoVjeD
         kVwmIUNyNnk3pIs2ipivXAlaUJHABUau73Y8ui5MiSmbzcWNGuuBP3AY1fJhZR5UCT8A
         pkiUVZ1w9TeLxVCNBc94c7gur9tPOq+WaytFoFTR+IHe+/kZaGN3I5HEwKfIwQ6jT7qR
         YtU/EA8euvy4nKbXXLklKQRg+H1NDVqRR79W6YTGZGmu3m+6G7Tgutn4gNybYExtVPtc
         TekN8inBNuNxb0eVyx5Ab3MgJINrpc8u5lWoSoqwcby7mSFHa1EuQ9WrIDCghfDmf6kU
         YdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b6MMAjZWva3A98ON/Z211sRWwTT87DwPEC7oQ/eZeGw=;
        b=UDhLjC/7reQ4Gs7i34wxngGqFaSH8iUCh6V5XG8zhqdAyA4p47R6hUgxfCWnBCBR2U
         TV8wkl4uBZIXr3NqofDcUL1LfH9RlT8m2lOZIw1Sm3yWO1o5PDhcd3pd9BNhZrSLNdJ5
         WNsldntx0FLiCz9w7cnXCqfAzdt/nIpke4cZ0m7gkOUAM+7Y1HlRKFPWpcY3MDi6eHOC
         GLA1/fCjPXkA6gfUp5UuQNjRnGIhtkxmJiFSB1qW0F7PJgqhUAqLfP5Qq+zHmv+14eM1
         9lfGfFXeyHEz3H4BVXhAonGabqSIWBP8a7J8aWxLD+vgW89m5nxNj4JZFEkKg2J8bG0x
         n+PA==
X-Gm-Message-State: AGi0PuZFyvLpLXBAOlwrhcNZytbpu6CRqIryzhILPKvbwmKkKhjeOkV0
        Z04uphUM8iLTqXWr7I6pLlg=
X-Google-Smtp-Source: APiQypK/2LFytp0OnGCxAaLRmBVd5I/sDQsicP+Zua5zN/xHb5nMKyNut4ztnD/wjg7dAkWJqSULqA==
X-Received: by 2002:a5d:4d8c:: with SMTP id b12mr35907239wru.35.1587068805111;
        Thu, 16 Apr 2020 13:26:45 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id t8sm28816937wrq.88.2020.04.16.13.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 13:26:44 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] firmware: tegra: Make BPMP a regular driver
Date:   Thu, 16 Apr 2020 22:26:36 +0200
Message-Id: <20200416202636.1085884-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra BPMP driver typically ends up deferring probe because it wants
to attach to the SMMU, so there's little sense in registering it at the
core init-level.

One side-effect of this is that the driver will be probed later even if
it doesn't want to attach to an SMMU, which means that consumers will
end up deferring probe, which in turn takes care of ordering the suspend
and resume queue in the correct way. Currently since suspend/resume
order depends on instantiation order, and because BPMP is listed at the
very end of the device tree (after most of its consumers), the suspend
and resume queue is ordered wrongly, which can cause issues for drivers
(like I2C) which suspend after and resume before BPMP. In the case of
I2C this typically leads to the clock failing to enable.

Besides fixing this suspend/resume ordering issue, this also has the
added benefit of allowing the driver to be built as a loadable module,
which can help decrease the size of multiplatform kernel.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/firmware/tegra/bpmp.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 6741fcda0c37..30174f35e896 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -6,6 +6,7 @@
 #include <linux/clk/tegra.h>
 #include <linux/genalloc.h>
 #include <linux/mailbox_client.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
@@ -872,9 +873,4 @@ static struct platform_driver tegra_bpmp_driver = {
 	},
 	.probe = tegra_bpmp_probe,
 };
-
-static int __init tegra_bpmp_init(void)
-{
-	return platform_driver_register(&tegra_bpmp_driver);
-}
-core_initcall(tegra_bpmp_init);
+module_platform_driver(tegra_bpmp_driver);
-- 
2.24.1


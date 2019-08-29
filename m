Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02536A2996
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Aug 2019 00:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbfH2WT0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 29 Aug 2019 18:19:26 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35016 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728262AbfH2WT0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Aug 2019 18:19:26 -0400
Received: by mail-ed1-f67.google.com with SMTP id t50so5773885edd.2
        for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2019 15:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AQPujerQOkg9j+eRABYeA6b+a5Y23tZKqHKGuL35Zl4=;
        b=HSvB2BBtVOdt5kXjFyEVz0MRhkImsE381IcFy+pMc5QLazoLSIaM7H4MflY5BU0ebe
         jelt53n20erCnBOi3CkFxAvMrTNfxknk5SPJTN8zVmfoBwXj6/U8weEvcY0tKBhyy6JF
         KR9MNb4u8jZKyHPSmlucSmMpKfnkDHCTN6+xoyfCmnZ3pIGm2pLhGH/mHAzvKFiSqDYQ
         anN0nbPPQKnYY1bTHGlwnAGvZpviry2kkf6ZSBIO+b5BuuNm2WOV3JTNmpy1acu+zIoa
         sJKFFV2OVE+U1FMhYA8Yny5TtvolzmosjxPg4CQH12aEhVkVby/RP0va9c8wDRacB8qW
         KI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AQPujerQOkg9j+eRABYeA6b+a5Y23tZKqHKGuL35Zl4=;
        b=AdHW0Y9qQd+IGKV15po4teCILElMz7jmsKGdgv1t+JL9dlwIiYbowbN+nt9Aj42926
         +a29Gt1UVMwpxajbGw9A2RQ+gMJYmFeyCTn/eLA0DfP5vk6AzNomzv3qumAcFx/Kv7vu
         ynUZrQ4DlJfUgJOJrXd8V+omfCJPfdHxIPw8wx6PU81g8nAjrQPYw9RTWx4iB5bsIvfF
         +8UGaZhmJPGEMh94kdHY1KHyuJpZ7o1UtybxIukFmY6c9Xhitsu8jIInc8GZvqrdtqGO
         AiwX56x17rBqTS+nUS1sn3rpRlnj9jKQylGGG19DiXZMUqReRWJg/QkNsSc2Mq3w3Y2i
         5fjA==
X-Gm-Message-State: APjAAAW6jfdtgXiAN6Cr41mIK3j5aY9ijw9sj7rXXlMfE1aEBuXeXNN5
        b4wmhq9dEn//IpssjlXb5vw=
X-Google-Smtp-Source: APXvYqyd8/Pk9UTGjdgAsiT+fJninnrmPTpt8q83YCbdhH4aR8r52P0DdFr+KHFOfnqv3B0vSFBhLg==
X-Received: by 2002:a17:906:1cce:: with SMTP id i14mr10505321ejh.7.1567117164939;
        Thu, 29 Aug 2019 15:19:24 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id bq18sm440804ejb.84.2019.08.29.15.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 15:19:24 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/7] drm/nouveau: tegra: Use nvmem API
Date:   Fri, 30 Aug 2019 00:19:09 +0200
Message-Id: <20190829221911.24876-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829221911.24876-1-thierry.reding@gmail.com>
References: <20190829221911.24876-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Instead of using the custom Tegra FUSE API to read the calibration fuse
for the clock on GM20B, use the nvmem API. This makes the dependency
between the two devices more explicit and decouples the driver from one
another.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
index b284e949f732..096a8b4b9bb5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
@@ -20,6 +20,8 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/nvmem-consumer.h>
+
 #include <subdev/clk.h>
 #include <subdev/volt.h>
 #include <subdev/timer.h>
@@ -929,7 +931,6 @@ gm20b_clk_new_speedo0(struct nvkm_device *device, int index,
 }
 
 /* FUSE register */
-#define FUSE_RESERVED_CALIB0	0x204
 #define FUSE_RESERVED_CALIB0_INTERCEPT_FRAC_SHIFT	0
 #define FUSE_RESERVED_CALIB0_INTERCEPT_FRAC_WIDTH	4
 #define FUSE_RESERVED_CALIB0_INTERCEPT_INT_SHIFT	4
@@ -945,14 +946,17 @@ static int
 gm20b_clk_init_fused_params(struct gm20b_clk *clk)
 {
 	struct nvkm_subdev *subdev = &clk->base.base.subdev;
+	struct nvkm_device *device = subdev->device;
 	u32 val = 0;
 	u32 rev = 0;
+	int ret;
+
+	ret = nvmem_cell_read_u32(device->dev, "calibration", &val);
+	if (ret < 0)
+		return ret;
 
-#if IS_ENABLED(CONFIG_ARCH_TEGRA)
-	tegra_fuse_readl(FUSE_RESERVED_CALIB0, &val);
 	rev = (val >> FUSE_RESERVED_CALIB0_FUSE_REV_SHIFT) &
 	      MASK(FUSE_RESERVED_CALIB0_FUSE_REV_WIDTH);
-#endif
 
 	/* No fused parameters, we will calibrate later */
 	if (rev == 0)
-- 
2.22.0


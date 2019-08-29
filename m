Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 564ECA2998
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Aug 2019 00:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbfH2WTa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 29 Aug 2019 18:19:30 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42746 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728262AbfH2WT3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Aug 2019 18:19:29 -0400
Received: by mail-ed1-f68.google.com with SMTP id m44so5727358edd.9
        for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2019 15:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I3dBCbPCriJ1MhHHanin6tvTjEPqEJAC2OKYyVBuJ1E=;
        b=AdX2VbAOdZ+H7FSeeFrxQzRRPohJpLM5DZGH3ZkXgoCllCHOPlJUKKPT0l4MrlTYdj
         d/dsXDKnxdKAbmf8/0enJ2OGy/WzxjMHU3dDC2WtKQNyKyVx7HASRB04cm532NWR2/Ha
         CNcvL8L27wMVUe2n5FM2dVqLtVwi5FIwkQptdZH3LZMdT8MHSgQgS/k72pJYsUulTQx9
         spSvmR+KVDe4VNdwgSyfKTfbJgZGnVtcR77MQ6EDYdjuM4hoqvUCvUbcPhIyC3HsJa6o
         Ezx7Q1qwsAq4842kvSCCHbI9N3d/IrPG9y9gaiYwbZBN6Iat6Uwo2VRMxv9Wjs9JfqFL
         Fcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I3dBCbPCriJ1MhHHanin6tvTjEPqEJAC2OKYyVBuJ1E=;
        b=Bqna2JWlCNqtkW4WZXzzl3yataPdJOD/Si0b88Br2lsAU1n0e3M3C1VhcJjZrCc1rE
         GPsQf0WBbN0Qg98I0Zv4MYCdD+UVjtATHCrwFSTCFwudbMoob+cI5JgNF7LzHaqDCHyZ
         eRG/GNQxteEt/HeSOiq5g1/3hW37xfTAlhI/KL+isoTsg8Ge/3RtiYdGD8upAuMiCWTy
         6J0Cxfzpz38OTuJRaRdvU+KYmR7I4tFaQk9NPByA70ODBpdFLCg4mtpLb788CY1tz5a2
         owm0lqzdnA6tRM/lkaMBIhJrBzRmuQc56Wz4C25/pNJV+6jcT+oiOQ+plgw8JXYzmDzb
         gCQw==
X-Gm-Message-State: APjAAAWblFq4pWd+d6uXpN32vAid+N7einqXJWmVI26Na4hZ28/+hkfM
        Ay1Lw81U9wdoMyKuSGDx4Gg=
X-Google-Smtp-Source: APXvYqyzO48Ea8Rk4sdl7C8hYDhlYf9UQpxQ8/17EQU73TkvPYeTy2bbR0MXkZDtfLkxZpcC5oqqsw==
X-Received: by 2002:a17:906:1395:: with SMTP id f21mr10332736ejc.49.1567117167388;
        Thu, 29 Aug 2019 15:19:27 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id t12sm648261edw.40.2019.08.29.15.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 15:19:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/7] phy: tegra: xusb: Use nvmem API
Date:   Fri, 30 Aug 2019 00:19:10 +0200
Message-Id: <20190829221911.24876-7-thierry.reding@gmail.com>
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

Instead of using the custom Tegra FUSE API to read the calibration fuses
for the UPHY, use the nvmem API. This makes the dependency between the
two devices more explicit and decouples the drivers from one another.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra124.c | 10 +++++-----
 drivers/phy/tegra/xusb-tegra186.c |  7 +++----
 drivers/phy/tegra/xusb-tegra210.c | 10 ++++++----
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra124.c b/drivers/phy/tegra/xusb-tegra124.c
index 98d84920c676..f62905ea4ca5 100644
--- a/drivers/phy/tegra/xusb-tegra124.c
+++ b/drivers/phy/tegra/xusb-tegra124.c
@@ -7,6 +7,7 @@
 #include <linux/io.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -14,8 +15,6 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
-#include <soc/tegra/fuse.h>
-
 #include "xusb.h"
 
 #define FUSE_SKU_CALIB_HS_CURR_LEVEL_PADX_SHIFT(x) ((x) ? 15 : 0)
@@ -1653,13 +1652,14 @@ static const struct tegra_xusb_port_ops tegra124_usb3_port_ops = {
 };
 
 static int
-tegra124_xusb_read_fuse_calibration(struct tegra124_xusb_fuse_calibration *fuse)
+tegra124_xusb_read_fuse_calibration(struct tegra124_xusb_padctl *padctl)
 {
+	struct tegra124_xusb_fuse_calibration *fuse = &padctl->fuse;
 	unsigned int i;
 	int err;
 	u32 value;
 
-	err = tegra_fuse_readl(TEGRA_FUSE_SKU_CALIB_0, &value);
+	err = nvmem_cell_read_u32(padctl->base.dev, "calibration", &value);
 	if (err < 0)
 		return err;
 
@@ -1695,7 +1695,7 @@ tegra124_xusb_padctl_probe(struct device *dev,
 	padctl->base.dev = dev;
 	padctl->base.soc = soc;
 
-	err = tegra124_xusb_read_fuse_calibration(&padctl->fuse);
+	err = tegra124_xusb_read_fuse_calibration(padctl);
 	if (err < 0)
 		return ERR_PTR(err);
 
diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 6f3afaf9398f..0663ed00d748 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -6,6 +6,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/regulator/consumer.h>
@@ -13,8 +14,6 @@
 #include <linux/clk.h>
 #include <linux/slab.h>
 
-#include <soc/tegra/fuse.h>
-
 #include "xusb.h"
 
 /* FUSE USB_CALIB registers */
@@ -800,7 +799,7 @@ tegra186_xusb_read_fuse_calibration(struct tegra186_xusb_padctl *padctl)
 	if (!level)
 		return -ENOMEM;
 
-	err = tegra_fuse_readl(TEGRA_FUSE_SKU_CALIB_0, &value);
+	err = nvmem_cell_read_u32(dev, "calibration", &value);
 	if (err) {
 		dev_err(dev, "failed to read calibration fuse: %d\n", err);
 		return err;
@@ -819,7 +818,7 @@ tegra186_xusb_read_fuse_calibration(struct tegra186_xusb_padctl *padctl)
 	padctl->calib.hs_term_range_adj = (value >> HS_TERM_RANGE_ADJ_SHIFT) &
 						HS_TERM_RANGE_ADJ_MASK;
 
-	err = tegra_fuse_readl(TEGRA_FUSE_USB_CALIB_EXT_0, &value);
+	err = nvmem_cell_read_u32(dev, "calibration-ext", &value);
 	if (err) {
 		dev_err(dev, "failed to read calibration fuse: %d\n", err);
 		return err;
diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 0c0df6897a3b..659b62867012 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -10,6 +10,7 @@
 #include <linux/io.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -1946,13 +1947,14 @@ static const struct tegra_xusb_port_ops tegra210_usb3_port_ops = {
 };
 
 static int
-tegra210_xusb_read_fuse_calibration(struct tegra210_xusb_fuse_calibration *fuse)
+tegra210_xusb_read_fuse_calibration(struct tegra210_xusb_padctl *padctl)
 {
+	struct tegra210_xusb_fuse_calibration *fuse = &padctl->fuse;
 	unsigned int i;
 	u32 value;
 	int err;
 
-	err = tegra_fuse_readl(TEGRA_FUSE_SKU_CALIB_0, &value);
+	err = nvmem_cell_read_u32(padctl->base.dev, "calibration", &value);
 	if (err < 0)
 		return err;
 
@@ -1966,7 +1968,7 @@ tegra210_xusb_read_fuse_calibration(struct tegra210_xusb_fuse_calibration *fuse)
 		(value >> FUSE_SKU_CALIB_HS_TERM_RANGE_ADJ_SHIFT) &
 		FUSE_SKU_CALIB_HS_TERM_RANGE_ADJ_MASK;
 
-	err = tegra_fuse_readl(TEGRA_FUSE_USB_CALIB_EXT_0, &value);
+	err = nvmem_cell_read_u32(padctl->base.dev, "calibration-ext", &value);
 	if (err < 0)
 		return err;
 
@@ -1991,7 +1993,7 @@ tegra210_xusb_padctl_probe(struct device *dev,
 	padctl->base.dev = dev;
 	padctl->base.soc = soc;
 
-	err = tegra210_xusb_read_fuse_calibration(&padctl->fuse);
+	err = tegra210_xusb_read_fuse_calibration(padctl);
 	if (err < 0)
 		return ERR_PTR(err);
 
-- 
2.22.0


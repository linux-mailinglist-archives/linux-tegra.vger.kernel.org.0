Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF4AA2995
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Aug 2019 00:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbfH2WT0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 29 Aug 2019 18:19:26 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37934 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728116AbfH2WTZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Aug 2019 18:19:25 -0400
Received: by mail-ed1-f65.google.com with SMTP id r12so5760273edo.5
        for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2019 15:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3MgsHRomQXTKk/AP9VNGxemv52H6Uuxug0JsN0CWanU=;
        b=NZQCdEFsOtdLIKxeK4iSEMS+9uWsq6jPAysC5wKYj585MndErb6CPBKQ03HuRM1CxP
         MlpUXmppMLORkTP8cO3ZvAD4wSoKwkCVdqsAeTY0idayQ9FcK8eCrdMZUOi0sMwhVGsp
         yfWGg3pNnqVTqW3n1riyn2m5n1ThHenEPKzXza0PITJT+7EMQjbnXXMsaoeR2Q2AB+ut
         TMywDSJEIsnvgA+uf4IsqvkrWj6wW1jcXMEf7SU04UkkYXEeE2ZlSOyhep7yxGmpd+n7
         wEA10dAwCiZf9+iwCTolmcfLMABy5neRcy0evAzWN6Z4i0uBJAZA4nBDU8e/Ruy8DlZl
         gBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3MgsHRomQXTKk/AP9VNGxemv52H6Uuxug0JsN0CWanU=;
        b=bMpt19uK5w3bH35wz119QjlTUI+pWKbEVNsUqlOsYQRLXoczecQ9a7I99Of2epTbSI
         z4Xgd3gwpZw9Nwyd43N1+JY9s+8bbVk5VhccYOF0BRkOVcXbr3h+cSKEHD/XDpwuzK3W
         rEEsXFx2NA8kvzhdIV5mmTDG8yKwVPbbkcv0DZZCYMOO+PWAF0IL6EsTPHzejbCLybHZ
         uU9wlDt27J7or5DuCYbgk//23hsOov87mK1jSSsRaifOpOWJENHILhRrW7HL+Mhkf9Cb
         bL0gLvlwfNgXSsOqd9n6ozqVmCXVx2iaxrlR76L8HKyx1OSAxllmvtKA60YdSPn/OeL6
         YONQ==
X-Gm-Message-State: APjAAAUIEXNyOmOfuVYqKpY2J9whtH0qK5XIpOYi5Tii7uhTzQbh8K9e
        5NIWOl/BiMEpgRMCQ01UArw=
X-Google-Smtp-Source: APXvYqy3n3+60HHXGNdciOB0090u/NCNWDnulDa+SB6PEheSbhgmjcky3cXjAYdsQiM3B8ukFE0sTA==
X-Received: by 2002:a05:6402:295:: with SMTP id l21mr12398251edv.13.1567117163188;
        Thu, 29 Aug 2019 15:19:23 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id r10sm665632edp.25.2019.08.29.15.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 15:19:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/7] soc/tegra: fuse: Register cell lookups for compatibility
Date:   Fri, 30 Aug 2019 00:19:08 +0200
Message-Id: <20190829221911.24876-5-thierry.reding@gmail.com>
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

Typically nvmem cells would be stored in device tree. However, for
compatibility with device trees that don't contain nvmem cell
definitions, register lookups for cells currently used by consumers.
This allows the consumers to use the same API to query cells from the
device tree or using the legacy mechanism.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c   |   9 ++
 drivers/soc/tegra/fuse/fuse-tegra30.c | 154 ++++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse.h         |   5 +
 3 files changed, 168 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index c6c6a7746046..6a0e25103e1c 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -420,6 +420,15 @@ static int __init tegra_init_fuse(void)
 	pr_debug("Tegra CPU Speedo ID %d, SoC Speedo ID %d\n",
 		 tegra_sku_info.cpu_speedo_id, tegra_sku_info.soc_speedo_id);
 
+	if (fuse->soc->lookups) {
+		size_t size = sizeof(*fuse->lookups) * fuse->soc->num_lookups;
+
+		fuse->lookups = kmemdup(fuse->soc->lookups, size, GFP_KERNEL);
+		if (!fuse->lookups)
+			return -ENOMEM;
+
+		nvmem_add_cell_lookups(fuse->lookups, fuse->soc->num_lookups);
+	}
 
 	return 0;
 }
diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index be9424a87173..b8daaf5b7291 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of_device.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
@@ -127,6 +128,70 @@ const struct tegra_fuse_soc tegra114_fuse_soc = {
 #endif
 
 #if defined(CONFIG_ARCH_TEGRA_124_SOC) || defined(CONFIG_ARCH_TEGRA_132_SOC)
+static const struct nvmem_cell_lookup tegra124_fuse_lookups[] = {
+	{
+		.nvmem_name = "fuse",
+		.cell_name = "xusb-pad-calibration",
+		.dev_id = "7009f000.padctl",
+		.con_id = "calibration",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "sata-calibration",
+		.dev_id = "70020000.sata",
+		.con_id = "calibration",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-common",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "common",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-realignment",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "realignment",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-cpu0",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "cpu0",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-cpu1",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "cpu1",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-cpu2",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "cpu2",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-cpu3",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "cpu3",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-mem0",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "mem0",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-mem1",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "mem1",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-gpu",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "gpu",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-pllx",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "pllx",
+	},
+};
+
 static const struct tegra_fuse_info tegra124_fuse_info = {
 	.read = tegra30_fuse_read,
 	.size = 0x300,
@@ -137,10 +202,81 @@ const struct tegra_fuse_soc tegra124_fuse_soc = {
 	.init = tegra30_fuse_init,
 	.speedo_init = tegra124_init_speedo_data,
 	.info = &tegra124_fuse_info,
+	.lookups = tegra124_fuse_lookups,
+	.num_lookups = ARRAY_SIZE(tegra124_fuse_lookups),
 };
 #endif
 
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
+static const struct nvmem_cell_lookup tegra210_fuse_lookups[] = {
+	{
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-cpu1",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "cpu1",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-cpu2",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "cpu2",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-cpu0",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "cpu0",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "xusb-pad-calibration",
+		.dev_id = "7009f000.padctl",
+		.con_id = "calibration",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-cpu3",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "cpu3",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "sata-calibration",
+		.dev_id = "70020000.sata",
+		.con_id = "calibration",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-gpu",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "gpu",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-mem0",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "mem0",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-mem1",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "mem1",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-pllx",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "pllx",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "tsensor-common",
+		.dev_id = "700e2000.thermal-sensor",
+		.con_id = "common",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "gpu-calibration",
+		.dev_id = "57000000.gpu",
+		.con_id = "calibration",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "xusb-pad-calibration-ext",
+		.dev_id = "7009f000.padctl",
+		.con_id = "calibration-ext",
+	},
+};
+
 static const struct tegra_fuse_info tegra210_fuse_info = {
 	.read = tegra30_fuse_read,
 	.size = 0x300,
@@ -151,10 +287,26 @@ const struct tegra_fuse_soc tegra210_fuse_soc = {
 	.init = tegra30_fuse_init,
 	.speedo_init = tegra210_init_speedo_data,
 	.info = &tegra210_fuse_info,
+	.lookups = tegra210_fuse_lookups,
+	.num_lookups = ARRAY_SIZE(tegra210_fuse_lookups),
 };
 #endif
 
 #if defined(CONFIG_ARCH_TEGRA_186_SOC)
+static const struct nvmem_cell_lookup tegra186_fuse_lookups[] = {
+	{
+		.nvmem_name = "fuse",
+		.cell_name = "xusb-pad-calibration",
+		.dev_id = "3520000.padctl",
+		.con_id = "calibration",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "xusb-pad-calibration-ext",
+		.dev_id = "3520000.padctl",
+		.con_id = "calibration-ext",
+	},
+};
+
 static const struct tegra_fuse_info tegra186_fuse_info = {
 	.read = tegra30_fuse_read,
 	.size = 0x300,
@@ -164,5 +316,7 @@ static const struct tegra_fuse_info tegra186_fuse_info = {
 const struct tegra_fuse_soc tegra186_fuse_soc = {
 	.init = tegra30_fuse_init,
 	.info = &tegra186_fuse_info,
+	.lookups = tegra186_fuse_lookups,
+	.num_lookups = ARRAY_SIZE(tegra186_fuse_lookups),
 };
 #endif
diff --git a/drivers/soc/tegra/fuse/fuse.h b/drivers/soc/tegra/fuse/fuse.h
index 32bf6c070ae7..0f74c2c34af0 100644
--- a/drivers/soc/tegra/fuse/fuse.h
+++ b/drivers/soc/tegra/fuse/fuse.h
@@ -13,6 +13,7 @@
 #include <linux/dmaengine.h>
 #include <linux/types.h>
 
+struct nvmem_cell_lookup;
 struct nvmem_device;
 struct tegra_fuse;
 
@@ -28,6 +29,9 @@ struct tegra_fuse_soc {
 	int (*probe)(struct tegra_fuse *fuse);
 
 	const struct tegra_fuse_info *info;
+
+	const struct nvmem_cell_lookup *lookups;
+	unsigned int num_lookups;
 };
 
 struct tegra_fuse {
@@ -51,6 +55,7 @@ struct tegra_fuse {
 	} apbdma;
 
 	struct nvmem_device *nvmem;
+	struct nvmem_cell_lookup *lookups;
 };
 
 void tegra_init_revision(void);
-- 
2.22.0


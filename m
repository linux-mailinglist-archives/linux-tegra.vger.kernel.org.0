Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE43222252A
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jul 2020 16:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728863AbgGPOTU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jul 2020 10:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbgGPOTU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jul 2020 10:19:20 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7DBCC061755
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:19 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id rk21so6747969ejb.2
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qRvl4Cg342hduyQ87yrRPUpPC9ZQkFYCJmOo+8OGXrg=;
        b=BUJOV4iY+mmu4QTHeMLd66xownrZFgCNSV0T33X8eEuaIfkHtuNDzbP5MODjumKhtz
         iuRxSGzHM+g/evz0AvHiRp+7R+vbjJQOI95MJOEoxaPQaQY6TmIEcxQ7NNd6jbM+CEn1
         ro8ZgORmpPNewu2cXOJblWHfQ2B8sqDR//YhpFhLXm2JRnP3FYH/S64Ldp3JxEkfuBnY
         B1MmJfdQjsC5MpOgwIRLIiwOisSq8QQIMGBlXG6p1cmyGg6Sm4tT5WP+g0/W9NBQocqx
         fpgUDyiCu89Tahgjz8dw2OsqHpEval/L8S35pHTh3HQ8FE96My1ygMQY6TV9USL6xFws
         AP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qRvl4Cg342hduyQ87yrRPUpPC9ZQkFYCJmOo+8OGXrg=;
        b=XjfkQh9eTBZalO7B0vbrSVlqtfQW3RY7lP8bvk0f3nITZuxsCPQbUySVA3OzaWlYqV
         ySkdi7Q9sL7MAXlLJSEWmxkre4NKtQvAWrI0NICO8g0p8wrSOWyPhkg1Z7/Q3gnqvtpj
         Ih6lSsIlhQDs7uBkeITG4zlxHymq9rU+uHxleM8fBjPegvibPLg8HCimi/pNp2/K4iGq
         v2kdkci0pOnq8wtKvkT9Y4Mco1FkpDcm6xzbadLUh1wCXhLjjK6/2KRfOXfp1tqQNV0V
         fpQ+FwR8H+2Ch4HTnYQQqrlfBkwBkgZSlsMrELoXh4K3GBcaazYLDJAEy+yNUxrr+lf1
         RkHg==
X-Gm-Message-State: AOAM531SMj86uNcrwhGWfbLIQDe4lOsHrCVudbRcFa/7/VetYyAqEHch
        L+ubjFWB7RFqgqRrnV+OYGw=
X-Google-Smtp-Source: ABdhPJyumddGVxVVMPvNRyPqIgX7LqNR8HU5saWv82oSzzEAk+aKg429HNLC+7XNKFs7YeccPxvrgw==
X-Received: by 2002:a17:906:d286:: with SMTP id ay6mr3967155ejb.400.1594909158460;
        Thu, 16 Jul 2020 07:19:18 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id z11sm5177398ejx.17.2020.07.16.07.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:19:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/9] soc/tegra: fuse: Add Tegra234 support
Date:   Thu, 16 Jul 2020 16:18:54 +0200
Message-Id: <20200716141856.544718-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716141856.544718-1-thierry.reding@gmail.com>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add support for FUSE block found on the Tegra234 SoC, which is largely
similar to the IP found on previous generations.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c    |  6 +++++-
 drivers/soc/tegra/fuse/fuse-tegra30.c  | 30 ++++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse.h          | 10 ++++++++-
 drivers/soc/tegra/fuse/tegra-apbmisc.c |  1 +
 include/soc/tegra/fuse.h               |  1 +
 5 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 7e6b6ee59120..94b60a692b51 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -49,6 +49,9 @@ static struct tegra_fuse *fuse = &(struct tegra_fuse) {
 };
 
 static const struct of_device_id tegra_fuse_match[] = {
+#ifdef CONFIG_ARCH_TEGRA_234_SOC
+	{ .compatible = "nvidia,tegra234-efuse", .data = &tegra234_fuse_soc },
+#endif
 #ifdef CONFIG_ARCH_TEGRA_194_SOC
 	{ .compatible = "nvidia,tegra194-efuse", .data = &tegra194_fuse_soc },
 #endif
@@ -326,7 +329,8 @@ const struct attribute_group tegra_soc_attr_group = {
 	.attrs = tegra_soc_attr,
 };
 
-#ifdef CONFIG_ARCH_TEGRA_194_SOC
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
 static ssize_t platform_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index 85accef41fa1..9ea7f0168457 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -356,3 +356,33 @@ const struct tegra_fuse_soc tegra194_fuse_soc = {
 	.soc_attr_group = &tegra194_soc_attr_group,
 };
 #endif
+
+#if defined(CONFIG_ARCH_TEGRA_234_SOC)
+static const struct nvmem_cell_lookup tegra234_fuse_lookups[] = {
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
+static const struct tegra_fuse_info tegra234_fuse_info = {
+	.read = tegra30_fuse_read,
+	.size = 0x300,
+	.spare = 0x280,
+};
+
+const struct tegra_fuse_soc tegra234_fuse_soc = {
+	.init = tegra30_fuse_init,
+	.info = &tegra234_fuse_info,
+	.lookups = tegra234_fuse_lookups,
+	.num_lookups = ARRAY_SIZE(tegra234_fuse_lookups),
+	.soc_attr_group = &tegra194_soc_attr_group,
+};
+#endif
diff --git a/drivers/soc/tegra/fuse/fuse.h b/drivers/soc/tegra/fuse/fuse.h
index 9d4fc315a007..e057a58e2060 100644
--- a/drivers/soc/tegra/fuse/fuse.h
+++ b/drivers/soc/tegra/fuse/fuse.h
@@ -115,9 +115,17 @@ extern const struct tegra_fuse_soc tegra210_fuse_soc;
 extern const struct tegra_fuse_soc tegra186_fuse_soc;
 #endif
 
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
+extern const struct attribute_group tegra194_soc_attr_group;
+#endif
+
 #ifdef CONFIG_ARCH_TEGRA_194_SOC
 extern const struct tegra_fuse_soc tegra194_fuse_soc;
-extern const struct attribute_group tegra194_soc_attr_group;
+#endif
+
+#ifdef CONFIG_ARCH_TEGRA_234_SOC
+extern const struct tegra_fuse_soc tegra234_fuse_soc;
 #endif
 
 #endif
diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index be6b7fc169ca..6aeac5ea2d70 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -56,6 +56,7 @@ bool tegra_is_silicon(void)
 {
 	switch (tegra_get_chip_id()) {
 	case TEGRA194:
+	case TEGRA234:
 		if (tegra_get_platform() == 0)
 			return true;
 
diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index a9db917a1d06..c702bd2911bc 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -14,6 +14,7 @@
 #define TEGRA210	0x21
 #define TEGRA186	0x18
 #define TEGRA194	0x19
+#define TEGRA234	0x23
 
 #define TEGRA_FUSE_SKU_CALIB_0	0xf0
 #define TEGRA30_FUSE_SATA_CALIB	0x124
-- 
2.27.0


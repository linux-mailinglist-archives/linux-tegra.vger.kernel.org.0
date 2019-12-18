Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B84C125080
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 19:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbfLRSYB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 13:24:01 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34942 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbfLRSYB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 13:24:01 -0500
Received: by mail-lj1-f193.google.com with SMTP id j6so3236889lja.2
        for <linux-tegra@vger.kernel.org>; Wed, 18 Dec 2019 10:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YhJ2/uTimh5bD+YwD1PgvcxEdDLu3iHg7JjOqCx1yKA=;
        b=kFsENpM+z+c6udu1XrQUARMi0sBxBvgwiED9+VCsxpBFXPz4I/n/dD6ViUtU6n0g7D
         BvwmOXjhc3zVBNsDBdWgS9pGVEVW6zCp1XtGy1c6LpcgTmQKeyyCpIjKegSgqvES5WzK
         deAY/A/ociC6hsZz0xg8saGujDe2mgMipb5OBy/2vYpCJ+uTSeR6OtTU89xMyerZNTH0
         zW3XVvQYmIk0+rzOMBnmxwBcNH8lq0kbAZbCUfq3Q4Kn5oO+7xYaJ3aibz8G0j5JuZen
         AZr6M0yaIOY2X9HTy8STDaIf+aTE/2WRO/rA33qm8B80ZwpVooDbbcXiwM2uDf4NCabU
         ARNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YhJ2/uTimh5bD+YwD1PgvcxEdDLu3iHg7JjOqCx1yKA=;
        b=MtMHP+VUzjeI+16NxcLJKf9Z3wj7qN1bfoJ1L3ZlYN4clYES+nltF1yNtMWAIf4BYq
         NrvbhUCmnt7D2CuuwYN/FUdLUNRF8oHu34NQmcYTT5T1Bl2mQS+Gy7hVvkP8JGx6F8Mz
         vG07ZcL+iIDOIZt4wdGn/I5rFowmAw/sFw4nEJd4/PBXwJ0PuFr+5IqoDhWsqIerRf9/
         CEbotUbs6pTrKHtx4gMJP4hm/sbevJGi5jMtHx3KcZfs9/QhaVIvTuH64tG45x0pCw91
         q4frUEIJgAK1bUKcK67oTe+u9o/ls4pDWqgZfzpmUQDzELv6SuacdR7/XgXq7M1Az8mb
         sIqw==
X-Gm-Message-State: APjAAAVX8y3/6VuleHCpsncsQ+Y5MTQTNGX3ptffcVTSo6JnjKgYaPjp
        H09HuOKhL9jaN0jh8XXFrow=
X-Google-Smtp-Source: APXvYqzrAaRhebAxUoCxW5onBO2yviwsF9XUTvyi8ZicyE83uONoJOJ46CoVqYszKPqA2i6FpgrvVw==
X-Received: by 2002:a2e:9886:: with SMTP id b6mr2889773ljj.47.1576693439934;
        Wed, 18 Dec 2019 10:23:59 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id s7sm1588154ljo.43.2019.12.18.10.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 10:23:59 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v4 1/4] soc/tegra: fuse: Cache values of straps and Chip ID registers
Date:   Wed, 18 Dec 2019 21:23:01 +0300
Message-Id: <20191218182304.21956-2-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191218182304.21956-1-digetx@gmail.com>
References: <20191218182304.21956-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There is no need to re-read Chip ID and HW straps out from hardware each
time, it is a bit nicer to cache the values in memory.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index a2fd6ccd48f9..7d404eaa1c10 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -21,18 +21,15 @@
 #define PMC_STRAPPING_OPT_A_RAM_CODE_MASK_SHORT	\
 	(0x3 << PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT)
 
-static void __iomem *apbmisc_base;
-static void __iomem *strapping_base;
 static bool long_ram_code;
+static u32 strapping;
+static u32 chipid;
 
 u32 tegra_read_chipid(void)
 {
-	if (!apbmisc_base) {
-		WARN(1, "Tegra Chip ID not yet available\n");
-		return 0;
-	}
+	WARN(!chipid, "Tegra Chip ID not yet available\n");
 
-	return readl_relaxed(apbmisc_base + 4);
+	return chipid;
 }
 
 u8 tegra_get_chip_id(void)
@@ -42,10 +39,7 @@ u8 tegra_get_chip_id(void)
 
 u32 tegra_read_straps(void)
 {
-	if (strapping_base)
-		return readl_relaxed(strapping_base);
-	else
-		return 0;
+	return strapping;
 }
 
 u32 tegra_read_ram_code(void)
@@ -103,6 +97,7 @@ void __init tegra_init_revision(void)
 
 void __init tegra_init_apbmisc(void)
 {
+	void __iomem *apbmisc_base, *strapping_base;
 	struct resource apbmisc, straps;
 	struct device_node *np;
 
@@ -162,10 +157,14 @@ void __init tegra_init_apbmisc(void)
 	apbmisc_base = ioremap(apbmisc.start, resource_size(&apbmisc));
 	if (!apbmisc_base)
 		pr_err("failed to map APBMISC registers\n");
+	else
+		chipid = readl_relaxed(apbmisc_base + 4);
 
 	strapping_base = ioremap(straps.start, resource_size(&straps));
 	if (!strapping_base)
 		pr_err("failed to map strapping options registers\n");
+	else
+		strapping = readl_relaxed(strapping_base);
 
 	long_ram_code = of_property_read_bool(np, "nvidia,long-ram-code");
 }
-- 
2.24.0


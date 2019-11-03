Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81E7CED36C
	for <lists+linux-tegra@lfdr.de>; Sun,  3 Nov 2019 14:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbfKCNMx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 3 Nov 2019 08:12:53 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34231 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbfKCNMw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 3 Nov 2019 08:12:52 -0500
Received: by mail-lj1-f194.google.com with SMTP id 139so14754945ljf.1
        for <linux-tegra@vger.kernel.org>; Sun, 03 Nov 2019 05:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4TVHdsh6uMDAICqoT24b2/6XPX4sUgMiPeLBGaxMIqk=;
        b=f34iofU6nUB7532D/Yt510ZFn852tz6v3I+PgizHnmkPNa64zMaVcyy3vFd2/yPV4G
         l3qYlZHrdYY6SEc+SbCharcJVUvyrELZF9B1wHjcXu/Cubv0vrpBDCjRGR8Nybwl1Q/f
         IZOh721CUCoxmr+WVyno36xZGJlw3uE4NUbMtR/2BeZxuh3Xqv2Jmdvu/wAiw/5Uuell
         k9yIUMNZRxUGdrtxeibcr7JAIr/HQ50wm2VAaX6BqTLnMED/pOfP4n8NrHQZ6/9wsgdT
         io0XGF6jnJGBZwRSFB3814Tv7wI+8Yuewuq3Y9oqaAFNBiDvfK261UOEe+2G1Dc86xVK
         hPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4TVHdsh6uMDAICqoT24b2/6XPX4sUgMiPeLBGaxMIqk=;
        b=j6aXMQFewwNIOBUAzwCmX2W4A6iCsGpbf5pB7wS/t0ugY5QS7an+GJj/HwOTGamBgR
         vBf9Qm3k1u//JLtcNSSV+1FkIomcVSD8ljxanlcW5TO1xNPc0HKwvJKdLApkmYj4SQe7
         1iTITrRGyzaFz/TF4ltRxHZB7GbbijhgQJ1DHmuFFojB9fKZuDHBlzFLgToG+xXbAvbx
         6L8KwCaduWAtR7Xq1NpKxMu2H201+eLGedqBJX17V8rUCog85oCgtQ903dexnGWh8L1b
         M9Ue3fSzX+bo9xT/EKXxr7CXDjryxgxSS5H+DACdkAx/jATNtyMjtBVZlwpFYRRTWWdH
         1sgw==
X-Gm-Message-State: APjAAAVWv2SS/r4rIwcmACyLQge6ZQUaRVeHOLCq/5hl/LDEUj7Hmwg/
        r7mQuy/kLuJMjLqtskRvTAw=
X-Google-Smtp-Source: APXvYqxkrRruZCWnTmfT++zVL+1EWeTlGjzPVL1vAF66IEP9jzR7Rv2iiCPlIMAED9XJQjtIhIsHwA==
X-Received: by 2002:a2e:9546:: with SMTP id t6mr15254320ljh.219.1572786769386;
        Sun, 03 Nov 2019 05:12:49 -0800 (PST)
Received: from localhost.localdomain (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.gmail.com with ESMTPSA id p8sm1700467ljn.0.2019.11.03.05.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 05:12:48 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/3] soc/tegra: fuse: Cache values of straps and Chip ID registers
Date:   Sun,  3 Nov 2019 16:10:21 +0300
Message-Id: <20191103131023.17342-2-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191103131023.17342-1-digetx@gmail.com>
References: <20191103131023.17342-1-digetx@gmail.com>
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
index df76778af601..54aeea1b4500 100644
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
 	apbmisc_base = ioremap_nocache(apbmisc.start, resource_size(&apbmisc));
 	if (!apbmisc_base)
 		pr_err("failed to map APBMISC registers\n");
+	else
+		chipid = readl_relaxed(apbmisc_base + 4);
 
 	strapping_base = ioremap_nocache(straps.start, resource_size(&straps));
 	if (!strapping_base)
 		pr_err("failed to map strapping options registers\n");
+	else
+		strapping = readl_relaxed(strapping_base);
 
 	long_ram_code = of_property_read_bool(np, "nvidia,long-ram-code");
 }
-- 
2.23.0


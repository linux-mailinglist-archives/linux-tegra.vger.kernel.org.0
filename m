Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB2AF8232
	for <lists+linux-tegra@lfdr.de>; Mon, 11 Nov 2019 22:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbfKKV1p (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 11 Nov 2019 16:27:45 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46268 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbfKKV1p (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Nov 2019 16:27:45 -0500
Received: by mail-lj1-f196.google.com with SMTP id e9so15344139ljp.13
        for <linux-tegra@vger.kernel.org>; Mon, 11 Nov 2019 13:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4TVHdsh6uMDAICqoT24b2/6XPX4sUgMiPeLBGaxMIqk=;
        b=nZSYKBz1oAE/hbFYHsK1WZAsf1yEsOMj9YV5AX/Z/zjbBjuygj7XtT5QRCMdhu/7uV
         M47q2DwitePopcbufB+D9VMAstT6z+yUtjvQerr5mFjzuNJkFYfP6Qusp9sTkPXAAX9z
         81fpIcoLiy7v5EyXi7udKwqkHDehJptDeVup3eJ2ZoKvB28pVYsn54+EO/VmVQsh2Nv2
         cLgaLwcBvtpQWrv3O93aOrKZy/LH0XhRo6/KyyEG72MBfPxtZzDNGFg4J10Sw6E4iX1i
         Ej0ZGDe6Xn5s9JAvHbCZN3ausEN7uPgcAaTFn13gd6MIdGb6M452e6nc8EV9H35kkJog
         GXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4TVHdsh6uMDAICqoT24b2/6XPX4sUgMiPeLBGaxMIqk=;
        b=HWLDiQiHCz72zXptNiv/+2AN+1kjqCqnSd4iSLa4lXzmk13mjaq7g79iUUsDSQB+LE
         GIHWh/6hhC4Gt09y9NW5q4veH/+GZ8k9kouOQgVsWT5Tp+5cBvYcVwh7dlvLwekMH8tL
         4lLqjPdmEaK+zBILwvRkvpzFjcwg/alW7eTThjCEbVIRH/kGmuCAGAcIQqOhwcKA4dwH
         AljIOdqTtjddXtjCIn8UjxDbn3Z6uxswVhD12iOC2OENITGkmWkVimpnpj/L282yO+Lv
         tBIOEJKlXxPGfCJPQ4byFqKYD4XsSsaxPJDfITQGDaYjl4pr5lkjZXYEjWz+wfFmztnY
         qtow==
X-Gm-Message-State: APjAAAW3V1WYAGx9IBR2kaEJqhZ5F7MMOdV5bqoRO4HnwqOuRAytNkE3
        gZT0Cfkn532taBfSsDbPMjc=
X-Google-Smtp-Source: APXvYqzc2q1KCbWdDJiJ3ypM7Ju8turvASAMDS7K6SYpB+jIExyMQXmMFfBdA6Afr9U9l3kK0pyerw==
X-Received: by 2002:a05:651c:1127:: with SMTP id e7mr16928883ljo.70.1573507663238;
        Mon, 11 Nov 2019 13:27:43 -0800 (PST)
Received: from localhost.localdomain (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.gmail.com with ESMTPSA id k25sm7344008ljg.22.2019.11.11.13.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 13:27:42 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/3] soc/tegra: fuse: Cache values of straps and Chip ID registers
Date:   Tue, 12 Nov 2019 00:26:35 +0300
Message-Id: <20191111212637.22648-2-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191111212637.22648-1-digetx@gmail.com>
References: <20191111212637.22648-1-digetx@gmail.com>
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


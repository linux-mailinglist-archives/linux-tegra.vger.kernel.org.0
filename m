Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C96DF10092D
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 17:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbfKRQZv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 11:25:51 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33097 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbfKRQZv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 11:25:51 -0500
Received: by mail-lj1-f195.google.com with SMTP id t5so19680263ljk.0
        for <linux-tegra@vger.kernel.org>; Mon, 18 Nov 2019 08:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4TVHdsh6uMDAICqoT24b2/6XPX4sUgMiPeLBGaxMIqk=;
        b=uVBUjeoKKR3jnHKbH7ON1xhSJKJD9gFypu3UXegeRUWzOpT/AyJLiGgzn9o/xkuaNP
         sE+0EvfVf2MkHezLmaXpMmC4laaWSrj3NRLjtAEkn2qKyqysJMhm5h1uQ9YFj3wTiY9+
         dr5Kc6ZRNb0tgVrJaGk28sKHAw6PU4sH7y4WZplSiK9qEhc21SqRsKOQLSRj23ZjNGLq
         af1JPBzhU5vNjOLy9u8HfNZHE6zob1nwrIFZ+mqHqGRzHDaPwGwezAxsJnCECQ347plR
         59HGhxlNuvW3BQo64kX5PgVT/4/RUXes/2JXQlyAsWFUlW22jv0qBtiJqgussB/bTN0i
         E5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4TVHdsh6uMDAICqoT24b2/6XPX4sUgMiPeLBGaxMIqk=;
        b=ea5fmmg705d2sGXbqz9sgLmFnxMdMTJKIDSB5b7pisCXgSmru2OaFBzaAk2OOsDS/F
         O2ucS2c7bHiH3Pr6rUAZBVOsMTxMRqtXXdK8zT/+Q+n1pTizvjCXnWqVmmLJnxfGOA9V
         4PFMML/9RvQD4uqyuMQZ48kRfpsNkzEjqGiYT3AXs7XuSkCfDFt4IFrSLC6W6J09xchT
         Y+2XT2l6RzuXs3h9BLAazrjzmSXFKbb2PruMlfmAdg4L3dI1NMu0HCwXndDAGa8JrLHU
         HRjBc53gideq7nASefZF34Q0XWI3FG89P6Eph/w92X4ZE/5LyXaTMTYx1x+afGpvRzWe
         IduA==
X-Gm-Message-State: APjAAAWlg9f7gk3LAvu/1wJaO8CyF1PmTn+r0uqEHyKWubnTsrbtYWTw
        UVE6EpaDwljESGIlRY46Gvk=
X-Google-Smtp-Source: APXvYqx52yY3UKrhdYJZ0VuCsLjgozmvvM7askg7VB0qguTNvFrFbX22k6UknEyBoe4egzwb6ntVug==
X-Received: by 2002:a05:651c:1109:: with SMTP id d9mr209026ljo.192.1574094347971;
        Mon, 18 Nov 2019 08:25:47 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id d24sm8582872ljg.73.2019.11.18.08.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 08:25:47 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v3 1/4] soc/tegra: fuse: Cache values of straps and Chip ID registers
Date:   Mon, 18 Nov 2019 19:24:57 +0300
Message-Id: <20191118162500.6651-2-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118162500.6651-1-digetx@gmail.com>
References: <20191118162500.6651-1-digetx@gmail.com>
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


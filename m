Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEF110092F
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 17:25:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbfKRQZx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 11:25:53 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35195 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbfKRQZw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 11:25:52 -0500
Received: by mail-lj1-f196.google.com with SMTP id r7so19671960ljg.2
        for <linux-tegra@vger.kernel.org>; Mon, 18 Nov 2019 08:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SVKfdrKQEvYzk1y5WDH8pdDsahD2iy38wDYDrd4fUZ0=;
        b=YO9V7JZ7n36XhVfMH99FLLdzzdDtNwjI3erX03+dY2CF0GulErLoHLfNrkHxow+HI2
         2idvL7F2elQ/cTQZ99VGsNMUc1Ue+3fYUGW5Uji7w2zHhPID26aT7icGzN0fw3asklsb
         1EpxjpzdQOzzPJgu/DF4TaNlBihnJoKyZeueydXPBTdOLXFeO5WMx+Fq+lsJXiWTu2z1
         hbX899gARBV6VMcBHyJPdt170hnLc4X2dV0A76RK2D7nUX6lGpV5NOph9CPaCKwUtNzd
         eLDHqKak0OVf7LzZ4bXfx1dG1s0B/1S6O45TaK+QXTVGnkptXqvI3LhpjM5tkcOCplZs
         BT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SVKfdrKQEvYzk1y5WDH8pdDsahD2iy38wDYDrd4fUZ0=;
        b=BHR8IU88En1ZdaGjnJoUe5kuSIQHX5EeHSVgpzOFXbslnRxSC3o8MIrHy+PQiu5J7E
         3+7lwAg8ZXj+rBGeijwjISjvmlKux64CJIsRtQDF5XKOHRsLNiwfCaBueApGCFSF/mXm
         ZvfVjUBxF+VniG2NHbKplPCSl200KiholyJOuMTwqjhCOt+B9wF/zV18HLUGUmVhKWCb
         kcFeLijF3iHkw5J8Y03ariS+DFp75nOE4OPGItQPw+jPm2jMaexCY2V7DyZ0iZW3+ocs
         jKDecVWvN+gbWB/Nq7ffaY5i0LbYrzQ3aopexaVfgyQACEoI5uv+LLaxM781Z8Uxqi1H
         45kA==
X-Gm-Message-State: APjAAAW3EhGcpxc9GZr6NMYwjtKM6kiTxJMpLz2vpqyor0fQB4bREC6d
        G1Zj89UnwfFoxfNCd8rBepw=
X-Google-Smtp-Source: APXvYqwjM2y9BLfsfHrt1CQBGKr604hbbTaBGOOq045WoSKd7gacGc/h6WCbtFu4ELWoxBv/GOMBYw==
X-Received: by 2002:a05:651c:1066:: with SMTP id y6mr230989ljm.96.1574094350805;
        Mon, 18 Nov 2019 08:25:50 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id d24sm8582872ljg.73.2019.11.18.08.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 08:25:50 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v3 4/4] soc/tegra: fuse: Unmap registers once they are not needed anymore
Date:   Mon, 18 Nov 2019 19:25:00 +0300
Message-Id: <20191118162500.6651-5-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118162500.6651-1-digetx@gmail.com>
References: <20191118162500.6651-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Both Chip ID and strapping registers are now read out during of APB MISC
initialization, the registers' mapping isn't needed anymore once registers
are read. Hence let's unmap registers once they are not needed anymore,
for consistency.

Suggested-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index d4fff96d8407..eaa260526c68 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -157,16 +157,20 @@ void __init tegra_init_apbmisc(void)
 	}
 
 	apbmisc_base = ioremap_nocache(apbmisc.start, resource_size(&apbmisc));
-	if (!apbmisc_base)
+	if (!apbmisc_base) {
 		pr_err("failed to map APBMISC registers\n");
-	else
+	} else {
 		chipid = readl_relaxed(apbmisc_base + 4);
+		iounmap(apbmisc_base);
+	}
 
 	strapping_base = ioremap_nocache(straps.start, resource_size(&straps));
-	if (!strapping_base)
+	if (!strapping_base) {
 		pr_err("failed to map strapping options registers\n");
-	else
+	} else {
 		strapping = readl_relaxed(strapping_base);
+		iounmap(strapping_base);
+	}
 
 	long_ram_code = of_property_read_bool(np, "nvidia,long-ram-code");
 }
-- 
2.23.0


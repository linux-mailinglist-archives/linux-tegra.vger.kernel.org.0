Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A335BF8237
	for <lists+linux-tegra@lfdr.de>; Mon, 11 Nov 2019 22:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfKKV1s (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 11 Nov 2019 16:27:48 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46267 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbfKKV1s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Nov 2019 16:27:48 -0500
Received: by mail-lj1-f193.google.com with SMTP id e9so15344187ljp.13
        for <linux-tegra@vger.kernel.org>; Mon, 11 Nov 2019 13:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h3HT9SF2wrMJkzuNPVnE64pREUnWzAqPVZJ/lAHHyXc=;
        b=aqxSb1qq/JeX8+9lxmuuVfyMHm9lcc/gzMGBar8w4WvOPBDDeYHtfLkiC2+uRuZ9bW
         OFC5vHb532SogOpBGsXFUeIITIeHBPQZYUI+aoWIeSrP1W8rpBxz4CpifZo0bZo6sGOw
         SHI/5syyshgpWso4zsPtIaHLQsiLyKfdYH4aFAfr2IFy+p2R4qteE/OiLqrX5o8cg9WD
         gMetQqEZDP63d+Vws8mpLxi024DZYkFIZbllk4aRJD9nlmX5wZl4RYFIzA3qdLjRULAq
         3KfWdk2BFi7G9jhEXeV6AoMEobvmLykme6buAI6b4eVM86WT3IRgvDbEVnpmE5JAkACk
         62Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h3HT9SF2wrMJkzuNPVnE64pREUnWzAqPVZJ/lAHHyXc=;
        b=ogFW+w2c5grByOrSs1U5nPhmlsg1J+y8Btzuji4zUbaOM/0hnC66XpP9XYbpmAfVXx
         OvxHXj54ROc3Q7XJpL8+ejFR44ErfixtLKt+aLp9XpEAFu95S8Gj3VPrkdgBrSdCP50f
         cjj3n08OcU2S43LDCcR11qgqfuxtC4Ltog19IIKBXpWRvVJasjMvbdetpBLukNI9uf4z
         GTv0pESY9QBHxl7g5LUNb150pLjmV+w2Hw6jHKmo+gB/t6qqQ48wIY6YzJvwOhRm7Hoi
         mLg9cHEmYSyIJKWEOKI8a5Zy/zQGSYB6twdqxCZI7G6LAnG8F7K5BIN4bxCirDYHh9oW
         g9kw==
X-Gm-Message-State: APjAAAUnGhUmuVip6HRxL46GRNgTeI+dvb6WfVlxdvn4pcHpRTlWBguS
        HNxxaABD65nNVeqLwWdFiuXknXzX
X-Google-Smtp-Source: APXvYqzwMBRaWlcnFl5oi7tkN4dePZC3xI+NoJIBiBhRi4n8A+SkQ7dUUWyMZKG6kdMfkJhmNYOqMA==
X-Received: by 2002:a2e:982:: with SMTP id 124mr9220982ljj.48.1573507664697;
        Mon, 11 Nov 2019 13:27:44 -0800 (PST)
Received: from localhost.localdomain (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.gmail.com with ESMTPSA id k25sm7344008ljg.22.2019.11.11.13.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 13:27:44 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v2 3/3] soc/tegra: fuse: Correct straps' address for older Tegra124 device trees
Date:   Tue, 12 Nov 2019 00:26:37 +0300
Message-Id: <20191111212637.22648-4-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191111212637.22648-1-digetx@gmail.com>
References: <20191111212637.22648-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Trying to read out Chip ID before APBMISC registers are mapped won't
succeed, in a result Tegra124 gets a wrong address for the HW straps
register if machine uses an old outdated device tree.

Fixes: 297c4f3dcbff ("soc/tegra: fuse: Restrict legacy code to 32-bit ARM")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index f580b3116bea..d4fff96d8407 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -120,7 +120,7 @@ void __init tegra_init_apbmisc(void)
 			apbmisc.flags = IORESOURCE_MEM;
 
 			/* strapping options */
-			if (tegra_get_chip_id() == TEGRA124) {
+			if (of_machine_is_compatible("nvidia,tegra124")) {
 				straps.start = 0x7000e864;
 				straps.end = 0x7000e867;
 			} else {
-- 
2.23.0


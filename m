Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC6A125083
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 19:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbfLRSYF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 13:24:05 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39057 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbfLRSYE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 13:24:04 -0500
Received: by mail-lj1-f194.google.com with SMTP id l2so3229281lja.6
        for <linux-tegra@vger.kernel.org>; Wed, 18 Dec 2019 10:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BuOP7zNnxuSEBH3edFuIqRpaLwCHLMBjELRB/lNQpKc=;
        b=vTthEOYiaXaTWqW8J4xMMnBBJ63Yoa/XOaTLvKFkDcxB7NXFBWBUAtVvDO7fQ6YmJj
         Ox4bdOqWPsXKFKbaBL0t/aG5KGw5WVDDcCSm2A7YE9luAe9dqDuU/+KXV16qpt1iGi8q
         Hix7bf2sWzgoL5j8x3utajF4/z5MSgmc5Oj3J2DYmO4PL0j6fM7vY98tfvYNWDeAyIUd
         k8BqLrSzFnmv9w/+Lo8v11W9vjzSyBOz6TaLDZ4DKGnARaPim3h5+CMxqfVZRMvHK4LN
         AVu8IWffKcSMJ5NAghWuAiP1UAcfhQ2TpKOvyXHFjqMOG/TFXUUCcyCZ9XDtJ32OK09w
         izhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BuOP7zNnxuSEBH3edFuIqRpaLwCHLMBjELRB/lNQpKc=;
        b=X2+VFi0cH4O6Cj0RuQv+9CDLbIlv/YpHpfm+9n20zJH3ChNC39H4inVZjplF4J+jfk
         8SoSF/QfZ6YmiwUW2zYnV9GWqakvnu4SspKSPtLHYGySyCb74navHhnioounmjCf7Xgk
         4pqr3sTFD2M8AnS6wm+KjoE1+YALwH0UFJelOcXGqUlKslTZQapqSVyW28UJ2/dPDlW8
         fTYcVXaVtwuxcMmf6FfnhL8YxIYXO+6BOcHDmHhtQYl2VSf2Umt9X+PZGnhlGCc3j1X8
         xqZkbp8uzEaqB8S5zPO2kZjibstUyit9U9ib6txo5SWqpogi8ksFxODA81TkVwAQDneZ
         KzPQ==
X-Gm-Message-State: APjAAAWnsFn2a4UF4mrHk0GGy7wYH2UFX3qVui+mci0TppAiOCDQ0HUl
        erwBQg/8GeBrlve6SRa3zOI=
X-Google-Smtp-Source: APXvYqxRZQieoLgzgcgnIfW4rMsUnjLhrZV31ezCkeji1zib7gnbxHLYb6QQJzW9jKdyn1f/iL3Jtg==
X-Received: by 2002:a2e:b058:: with SMTP id d24mr2114116ljl.20.1576693442828;
        Wed, 18 Dec 2019 10:24:02 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id s7sm1588154ljo.43.2019.12.18.10.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 10:24:02 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v4 4/4] soc/tegra: fuse: Unmap registers once they are not needed anymore
Date:   Wed, 18 Dec 2019 21:23:04 +0300
Message-Id: <20191218182304.21956-5-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191218182304.21956-1-digetx@gmail.com>
References: <20191218182304.21956-1-digetx@gmail.com>
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
index 1f4308be6ec4..37a6cb5fe744 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -157,16 +157,20 @@ void __init tegra_init_apbmisc(void)
 	}
 
 	apbmisc_base = ioremap(apbmisc.start, resource_size(&apbmisc));
-	if (!apbmisc_base)
+	if (!apbmisc_base) {
 		pr_err("failed to map APBMISC registers\n");
-	else
+	} else {
 		chipid = readl_relaxed(apbmisc_base + 4);
+		iounmap(apbmisc_base);
+	}
 
 	strapping_base = ioremap(straps.start, resource_size(&straps));
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
2.24.0


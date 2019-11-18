Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59D3F10092E
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 17:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbfKRQZw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 11:25:52 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39876 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbfKRQZv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 11:25:51 -0500
Received: by mail-lf1-f66.google.com with SMTP id f18so1987592lfj.6
        for <linux-tegra@vger.kernel.org>; Mon, 18 Nov 2019 08:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h3HT9SF2wrMJkzuNPVnE64pREUnWzAqPVZJ/lAHHyXc=;
        b=j1XNfzZWZXDQHY4knm6t8YT8oSqFcApLAesz2GIvnlvJsxVoaPVPTuW8vRZQ1/nAll
         Q/TuOW98FRRT7RomrItlqhBOsB7mPdtZQ8P+AmrMmh/gAkszkShEIaofeQJ1zV9AshTN
         uYDsiPuJm6kMs2hG+j+Yy530CYvTsL0Xj78lLagt7dvg4MANnQpMr44Kgv7/MW0GRgQE
         7bi7KOlxCKUfLpud0RkvmBc24oi+AEqhHwi5ZXBHZXYYr8grfFpCgQw3bTsPnDQnVh6Z
         L/DRXbowcuTi06Bhdr31jQoUgnOf7A5iZqcWvg1svYB/mDidNEMR11n3fYl4VCfyi/hn
         gw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h3HT9SF2wrMJkzuNPVnE64pREUnWzAqPVZJ/lAHHyXc=;
        b=SLvODpZzJUuIhOvv3N6KnKA69ARC5CvneqWw3sbcJ0eUhh25oYQ+pqZthrJGCPx8cJ
         NQpBNOeSC7rQF08M4njswLD3TIehcGbt4/Rll6RLtwh5a+67dJRjhJpBTswGSYZ5Qnj1
         RpEZNLNc8y+Jacc41xevuJfB+lUKD/wTjr7Yszqp2Vvi9vgVsF10fvQxOZu944d0FE3J
         CO9+WsMTC8fpbuSmjXX0ph5SzEW3tBH2tbtkIumEkR8aDb/mrfvvIh6Vgih7HBkBT+z/
         lMqTOFwivTGTwHHLTk7MYoVI1TszcTdsdM2I6TYKivbfgxElP71PuVHNy5hKvPsSmPsb
         7utQ==
X-Gm-Message-State: APjAAAVaO/2iUzzyqyFoMqgM60J9U6AE1ZuHXA8T3R38s42to6WsuNlX
        KpSX99GdS+4QlX7JPHqilUF5icGQ
X-Google-Smtp-Source: APXvYqwjE8vKwFUV9RQ9brPNfrQP6lD2VUiz4Go4DIiRgbHVtiHgAu6+7OmIAJ9KDZCFQ88eEkR8wA==
X-Received: by 2002:a19:ca1b:: with SMTP id a27mr177154lfg.93.1574094349841;
        Mon, 18 Nov 2019 08:25:49 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id d24sm8582872ljg.73.2019.11.18.08.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 08:25:49 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v3 3/4] soc/tegra: fuse: Correct straps' address for older Tegra124 device trees
Date:   Mon, 18 Nov 2019 19:24:59 +0300
Message-Id: <20191118162500.6651-4-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118162500.6651-1-digetx@gmail.com>
References: <20191118162500.6651-1-digetx@gmail.com>
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


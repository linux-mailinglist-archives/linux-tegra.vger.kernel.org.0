Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCD38ED36E
	for <lists+linux-tegra@lfdr.de>; Sun,  3 Nov 2019 14:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727607AbfKCNMy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 3 Nov 2019 08:12:54 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37445 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbfKCNMy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 3 Nov 2019 08:12:54 -0500
Received: by mail-lj1-f195.google.com with SMTP id v2so14721085lji.4
        for <linux-tegra@vger.kernel.org>; Sun, 03 Nov 2019 05:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h3HT9SF2wrMJkzuNPVnE64pREUnWzAqPVZJ/lAHHyXc=;
        b=jjD06MfsAd8+YUB67An8j/5YI9XHegWr5tubNkzksi5zj9Rj3WXc56uO/ojoqP8zAZ
         4kKx1PiLMMJLR4AcBb2b3y2zgz4Mt2UcL93VqoP49KqKSNalwwMKh5s0kW0tYVua2yN3
         RBk8hEy37dxBmq9EwIH8erkHVF+Xu0kQZAej61eQHLoR8cxOmGplVv//AoXD+CHUH1IY
         5k/LAGF/Ot7HDBVk3hcwcI917Hp3oMJorqhZpq8boktXsGM8cdDiesIFnwWDD6OtlIZ7
         VylSQFzWh2f0xhFcOzMdANvKFEMoEdaqEK/vZvxAnPkcqExZtKb0WH5v9WhnJKnskg2n
         +T7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h3HT9SF2wrMJkzuNPVnE64pREUnWzAqPVZJ/lAHHyXc=;
        b=qmixhUppIDXdmlq8a7J4Rvm3Su2Sg8wQ4Iu92kVbDzkEGsPywRun3UPRSiVFXS6Qw7
         yoOfy3zcqz/5xay5y+CSdUMKXqxE+M59IRh/xndzXygUxmju0atWgjIHzXt7qw2Z1eW+
         wC3QbsyHZr3dF54XWhzUihRXNo8nhzmdJQxdRnWEL6U8Z8NANjhvVOP3cIM2Ly5BzBWg
         qAh7RegtxVaXs6mhG9rPpzV3KI3FeXWZP2fhRwlQM42bJ6ipHblBbxFDrnoVo58YsWLv
         0k3DDrzdy9E4btdgRgDwCUrief7dMFXfiUvrFw0UzJ0tIdmkevZdThBBT0eI7AgkVAKv
         LSOQ==
X-Gm-Message-State: APjAAAVzKJeWrFT3wo/iP7YSRVSkV48reZcMWkOG9Wp3ufGA40NQ5UZN
        ppkpIzi0CR/B+KSJTIAO13U=
X-Google-Smtp-Source: APXvYqzWYhx1IrhA/opM972SwPFL5tzf8Na9ckiXBbYrSfZLt6xFcbYtNa7gk9w7UuZ0K+/beoeI/w==
X-Received: by 2002:a2e:9985:: with SMTP id w5mr8832178lji.162.1572786770989;
        Sun, 03 Nov 2019 05:12:50 -0800 (PST)
Received: from localhost.localdomain (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.gmail.com with ESMTPSA id p8sm1700467ljn.0.2019.11.03.05.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 05:12:50 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/3] soc/tegra: fuse: Correct straps' address for older Tegra124 device trees
Date:   Sun,  3 Nov 2019 16:10:23 +0300
Message-Id: <20191103131023.17342-4-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191103131023.17342-1-digetx@gmail.com>
References: <20191103131023.17342-1-digetx@gmail.com>
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


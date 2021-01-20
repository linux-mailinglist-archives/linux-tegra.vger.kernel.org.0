Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6EEF2FC666
	for <lists+linux-tegra@lfdr.de>; Wed, 20 Jan 2021 02:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbhATBYy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 19 Jan 2021 20:24:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbhATBYw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 20:24:52 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE86C061757;
        Tue, 19 Jan 2021 17:24:11 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id n11so24166160lji.5;
        Tue, 19 Jan 2021 17:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uj7BT9C+f28xNkznwoNGgGBjdluidQQjv9Qul4Tcuu0=;
        b=cwmxZcEPvwLv/kyqRMBkARFDLnbvaOMuwQ1Ad6KQtMs35OMqAoCEnblKyZ+A/eKgyA
         N864A//qe/1OnirT+gVqN4ehdhJI+oXEdxjrYJQTTEK82X8pwEhNfKJGPbuU3hJNNyYw
         VUPX9tFD6CEygMswsa6GzYw0QLuc55Pgo5LJiLdx3col24gaQRyfmJ/gTHyC8SV1xQMN
         8yedXesZcL/vdZ9YdJli8BqLtNde1bhecLfDpmJzk/91/d+uEbNKx10ZJLYglDqzLe6C
         NB8M5g82kJUitIKF4AwsPorUgOV5kjD+nCSTh+rGzcds+O753ZgMpb38xs32TTXucurg
         GATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uj7BT9C+f28xNkznwoNGgGBjdluidQQjv9Qul4Tcuu0=;
        b=K2ZkOj7NPRhj9U9KH3UjYutxGj7wS+fRRE1XhZNxnSdJXMePcjsN5pI0zu4yo+K+PR
         prT1jOFKBCL3EdyQWBV3Gb+AlB9O0TFjndlyDYtnItynzV64pC+s3/GgEk0ZtWv2qADq
         0uPvU6nlT0cEuzTUh5n7dv7v69RwfIZ2imlrZhZR2S913GbYq8d38DdjCXgzGyf3L/vw
         I7SXX+sZlDj8uwuRB7F8y0HB01X+OtbeOLuhWY4n+3o5m1Tj2qD83QaCNzcRPeqb4agn
         jMASx5U3kbNUVChi5b1RWafheFr1MDOYED6syrQygAOywfRFiX3iUIuDBCReGEXrdlqG
         6s6A==
X-Gm-Message-State: AOAM533rZ3/7/vFTShK7MNkOcEvHqLf+douIZ3oPXqSN3HVxPIcyX6n1
        bi85+hEHiYsqIFgiiA9t9M4=
X-Google-Smtp-Source: ABdhPJw3T0wyb4OJ46VKz6CKlnDUcY6hkqNPg84d5mL9Fge6xXAVcdpa6b1G+0Rwh4H+H0CcHMHQDA==
X-Received: by 2002:a2e:58f:: with SMTP id 137mr3174423ljf.469.1611105850276;
        Tue, 19 Jan 2021 17:24:10 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id c8sm28416lja.80.2021.01.19.17.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 17:24:09 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] soc/tegra: pmc: Fix imbalanced clock disabling in error code path
Date:   Wed, 20 Jan 2021 04:23:53 +0300
Message-Id: <20210120012357.11038-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120012357.11038-1-digetx@gmail.com>
References: <20210120012357.11038-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The tegra_powergate_power_up() has a typo in the error code path where it
will try to disable clocks twice, fix it. In practice that error never
happens, so this is a minor correction.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
[this patch was also boot-tested on some other T20/30/114 devices]
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index df9a5ca8c99c..fd2ba3c59178 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -638,7 +638,7 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
 
 	err = tegra_powergate_enable_clocks(pg);
 	if (err)
-		goto disable_clks;
+		goto powergate_off;
 
 	usleep_range(10, 20);
 
-- 
2.29.2


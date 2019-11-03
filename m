Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B56D7ED36D
	for <lists+linux-tegra@lfdr.de>; Sun,  3 Nov 2019 14:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727490AbfKCNMw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 3 Nov 2019 08:12:52 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36722 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727553AbfKCNMw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 3 Nov 2019 08:12:52 -0500
Received: by mail-lf1-f68.google.com with SMTP id a6so6865925lfo.3
        for <linux-tegra@vger.kernel.org>; Sun, 03 Nov 2019 05:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O1Nw0vEzgAGqkBGVXXYW2HyLesWf5OqF6+ALQmKG8ew=;
        b=nam84omVg4QxMijOaug0jy8DCPxFyJIwqrXCmBxPHR+JfUv6A/gJZXoSJ5+W+Sp4lG
         ZAKlVOfKpdioQbRqmyodgEPfxW9dCAE22kY3htbrGzS3y4zUNyFjCKHqd+AL7Lt8OWRM
         ZhkmsF4TK9W6BEDEhUDyFFercUvOFu66ThIswpM/z/TyufIL0W5SlQhvJ31ldJ/Rznby
         tzR5cEEb8c3JV8v9ta/GAOiEx+7flPlkt80MmDKeWBP7v+uOYDuB5nb+v8MENkmcMPuw
         w905++DIJH8xJB48vJc/wDYU3CD4igUHjYoUGGlOQByxRFl0MxLzokcCD9XY0j3whBek
         +BlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O1Nw0vEzgAGqkBGVXXYW2HyLesWf5OqF6+ALQmKG8ew=;
        b=TM9AyQ04PI4FP99vKj4zP54Ltxij1+G9sd+qvXC5Gbz7Dh7SQGvdLPaQtTwa0mq8Uf
         z7QUMGGuIt+mwKDJ1zJv/zQmd8RRwaMfrHs7HSeGIxjQZtDAPvPtKrjyjiiUMOUbj4d1
         1+KavuxTdYxiu3yi+RVClX49a+CYbBYfwjBiq1hB5D4tAg67n3AR7q/vWNFzm0w5HJEX
         EYXkq4kuK166CBeNRtMw5X4ogsDEFs6JyjjVOIofATfR+gt4Zie4n8NSDasNU9/TScI4
         MpOs6jj3ynEvo2NvDbmVuQ0ZTwz0PrSyUqg13U7SLQydE+/qnERzznEzknB/Sskr+imB
         vMCg==
X-Gm-Message-State: APjAAAW8IvsMcwqcceBaUKWaDM07ZssTziZ6jt8zSL+AMrsVOiaeupJt
        zUwWtlkwGyKOI6IGT6TwsaPsmJdL
X-Google-Smtp-Source: APXvYqwoKA8nr9iGEwFetKK7Df3WzNviAsvB0iEuRVcWEc6SmSGWjnKyefKQCeOoFPae3vflN4SNSg==
X-Received: by 2002:ac2:55a3:: with SMTP id y3mr13472922lfg.108.1572786770216;
        Sun, 03 Nov 2019 05:12:50 -0800 (PST)
Received: from localhost.localdomain (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.gmail.com with ESMTPSA id p8sm1700467ljn.0.2019.11.03.05.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 05:12:49 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/3] soc/tegra: fuse: Warn if straps and not ready
Date:   Sun,  3 Nov 2019 16:10:22 +0300
Message-Id: <20191103131023.17342-3-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191103131023.17342-1-digetx@gmail.com>
References: <20191103131023.17342-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Now both Chip ID and HW straps are becoming available at the same time,
thus we could simply check the availability of the ID in order to check
the availability of the straps. We couldn't check straps for 0x0 because
it could be a correct value.

This change didn't uncover any problems, but anyways it is nicer to have
straps verified for consistency with the Chip ID verification.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 54aeea1b4500..f580b3116bea 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -27,7 +27,7 @@ static u32 chipid;
 
 u32 tegra_read_chipid(void)
 {
-	WARN(!chipid, "Tegra Chip ID not yet available\n");
+	WARN(!chipid, "Tegra ABP MISC not yet available\n");
 
 	return chipid;
 }
@@ -39,6 +39,8 @@ u8 tegra_get_chip_id(void)
 
 u32 tegra_read_straps(void)
 {
+	WARN(!chipid, "Tegra ABP MISC not yet available\n");
+
 	return strapping;
 }
 
-- 
2.23.0


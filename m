Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7979B125081
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 19:24:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbfLRSYC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 13:24:02 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43018 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbfLRSYC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 13:24:02 -0500
Received: by mail-lf1-f67.google.com with SMTP id 9so2384857lfq.10
        for <linux-tegra@vger.kernel.org>; Wed, 18 Dec 2019 10:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c+xhaNLSmxTKnWNqkBtJb9ROGnp9aeDsopsocm1jVBM=;
        b=XD0kEL2VZTZ+5wi2amyEIGuJpWPom5JpwVHJ9owF1VCeG0uN+27ps0+NrXSYI5SUk5
         FB6cpIIxwr74Rt7Gcg5X5mPCMuE6IHK5mg/0OtnFIVF+WoVbqS++4BE/x1RZpYAf+8+F
         4bKT2uCRRDoFZyZ4SGtm/gCRGIEuNh75irMg3tkwGS3PgEWsbCsRwR8fdGJ5PCHKaG7a
         LzeArRZjYwsAwe92HKPbnGhN0eMxQWFnhdIgxJRS0VLg4IV7xAlAQDRU3Ts/FsF1Bi2J
         u27O5q8LYQfKaesM6q58zDqFakPUApCJKum+hMBGo9fGXICYHv3FyDXeSQHxUwTs83Kg
         +XGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c+xhaNLSmxTKnWNqkBtJb9ROGnp9aeDsopsocm1jVBM=;
        b=aSk/jFAfsMWFuOdHXnrdvoF9218EbRkGNm7Fn/HTSouLJN0xScVdayykEM3lRhTX/C
         FBfnRq6ljkMLfyFmoVR+Mx02Nzkxm84etGEpIfJb0sfJIuRSJFMUL+LMTQzu6O0OeQxS
         E2I7XpEwJPuKrEPXPjrx3W6LhZ2ptnTTyPbXpr8g/bMoDFdStp6wt/6ndcvT1spqDCRr
         Zwd6isUq4Ma/zohoycPcJb8WBjPxfYL7q+06qS6Cdxqo748eMq3Ht0YQJZHEb/xh9VBt
         /aKPWl6l+0v8IiGP1o3O+sBXbRDp9as9N8VKvtSrrCxL2bW6zBrYYsbbv/x5f26+sA/q
         XiBw==
X-Gm-Message-State: APjAAAUBgAeRnN2NeSuw+5ztJqujmfTjPQYDHUoRZtL6vexIU7ZjymuF
        7wAPvfhN+x82WxY2SGvRQB0fecqs
X-Google-Smtp-Source: APXvYqymhFocZs07WOGS8LhZ+vs0S+0Z/E6ou0BrhSDRPoHcD0xUOvsdZ3MVzAC9zs+52qHYPsnkkA==
X-Received: by 2002:ac2:59dd:: with SMTP id x29mr2612301lfn.95.1576693440828;
        Wed, 18 Dec 2019 10:24:00 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id s7sm1588154ljo.43.2019.12.18.10.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 10:24:00 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v4 2/4] soc/tegra: fuse: Warn if straps are not ready
Date:   Wed, 18 Dec 2019 21:23:02 +0300
Message-Id: <20191218182304.21956-3-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191218182304.21956-1-digetx@gmail.com>
References: <20191218182304.21956-1-digetx@gmail.com>
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
index 7d404eaa1c10..8d26bee3cedc 100644
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
2.24.0


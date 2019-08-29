Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 586ACA2992
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Aug 2019 00:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbfH2WTT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 29 Aug 2019 18:19:19 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46511 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728255AbfH2WTS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Aug 2019 18:19:18 -0400
Received: by mail-ed1-f65.google.com with SMTP id z51so5696959edz.13
        for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2019 15:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VNjUP90KurMD9/uJH4oScsWAEfGbvaidcWJA5f95CqQ=;
        b=oRIUbZfFbDwGoeJw9Jd45gao5NUkp59Nnmio+2nZTD8zotsl+Iogct9ye7fsoOPO1I
         wqXxLwTC4Ke2n/muYmK7FcagIQzwrl71Yybji4GWVK2iCqwKYRQzEstsQAmcw+ChYI6V
         hceEDfUhTp1e3N7qAWwHmv1Uo7qabvXGBAcWUA9XCd8NkkTtXc8ZnWZv/DHxxnT5pDrv
         YZxzXdTy91xdJtNSsCnIeN9+ne9nnGEeQUWScg0iv7tb53HUJwy5Htyhsxjn+AmF0KFC
         /mrIqC6o+IYKd95pb3JuzlavgHMShiItBkPXEJrIdLBOu8Yl2qpigEKqpY+KojnqP4XU
         Ua2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VNjUP90KurMD9/uJH4oScsWAEfGbvaidcWJA5f95CqQ=;
        b=loEpTgaIjgxAOo0RTujFfXaFUb4A5+f7Hm/XspbUs1vejtuyG0z4y4g6BRUCxH5w07
         7MffrNnwFZFjGZ8e1YqSAV0U2sNvG5dl1EDfD6VdwrMlYuCy4ZN4SbhpCj49hQymGDnY
         OMfhCm93+sLybtBpa4xaMhC8GyKRDAzx35ite/vSrGmpnmsrt6H48q/AfZwl5wgbINyO
         FacPcpgJvPJYlLRUQ59HTz/aOhSo7vFSI9KDJkd5V7o2LlZPoC73RBuo6gLmOUhupSYv
         Vd/UAx2qSHU8PER08tQ6HnsLh23F02Kqt5svdwj7RK+f91zTZL2xCROeqZqgeSYTRwaC
         l7+A==
X-Gm-Message-State: APjAAAV/C8itUSPDuQe97GikDzHn0/sAAz2q67I6aId8Zcms+SJHKvtR
        MPVuaGADRaPVTTVyyXNNZ4FOIkNh
X-Google-Smtp-Source: APXvYqy+GwqVf9tzEp92CGoDtVDnq9MLCVLT8c0gDboF3zfO88SpaLUknILjwH6tPEv6REpbIEhAiQ==
X-Received: by 2002:a17:906:a3c4:: with SMTP id ca4mr10291373ejb.5.1567117157037;
        Thu, 29 Aug 2019 15:19:17 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id o26sm545677ejb.58.2019.08.29.15.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 15:19:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/7] soc/tegra: fuse: Restore base on sysfs failure
Date:   Fri, 30 Aug 2019 00:19:05 +0200
Message-Id: <20190829221911.24876-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829221911.24876-1-thierry.reding@gmail.com>
References: <20190829221911.24876-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Make sure to also restore the register base address on sysfs
registration failure.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 3eb44e65b326..6617a4bd11bb 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -146,20 +146,24 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 
 	if (fuse->soc->probe) {
 		err = fuse->soc->probe(fuse);
-		if (err < 0) {
-			fuse->base = base;
-			return err;
-		}
+		if (err < 0)
+			goto restore;
 	}
 
 	if (tegra_fuse_create_sysfs(&pdev->dev, fuse->soc->info->size,
-				    fuse->soc->info))
-		return -ENODEV;
+				    fuse->soc->info)) {
+		err = -ENODEV;
+		goto restore;
+	}
 
 	/* release the early I/O memory mapping */
 	iounmap(base);
 
 	return 0;
+
+restore:
+	fuse->base = base;
+	return err;
 }
 
 static struct platform_driver tegra_fuse_driver = {
-- 
2.22.0


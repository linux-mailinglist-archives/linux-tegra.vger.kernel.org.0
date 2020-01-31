Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8A014F0F7
	for <lists+linux-tegra@lfdr.de>; Fri, 31 Jan 2020 17:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgAaQ7R (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 31 Jan 2020 11:59:17 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38151 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbgAaQ7R (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 Jan 2020 11:59:17 -0500
Received: by mail-wm1-f68.google.com with SMTP id a9so9501476wmj.3
        for <linux-tegra@vger.kernel.org>; Fri, 31 Jan 2020 08:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4+9+YOngn7wCxXAwmLzBKgvXwvTHWe2ootBn0cGqA+4=;
        b=L9eX/j5QjYRcqhZSxiFQOMhpd0X/OJPvxEjzuudeMCeujb1QspKSoE/0ZJKrrkP3DH
         ndHB8a2l6vtiZj5zasA5iP5tg77GYodcYBqP+WBlIS0XwGOsNNWVJAkuGSYSLIV4IQv2
         WpgAcg7KeKL5jnaGYYRXMJzCFxfBkSkTd3mS7h4oXiFWDHnNnybXZWlHwdaOiba0aFks
         +m2O3m7EorkNFsVCMu53V+R5qAaj2/fJB7d8hsq2H4H2HHIFXEhRQi3PnnUkYpBu0FpG
         60eO2pib23DHXLCJ1UePa7Sk8JV6j5CNLFiKRw12DSSItM3yVpNjdRXqZVKPpFvK38Kd
         gHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4+9+YOngn7wCxXAwmLzBKgvXwvTHWe2ootBn0cGqA+4=;
        b=Dz3OtkXlYPooSHLzCttIcEbwxsP0PwiMFZUggvVEEKmAOzsHpKWFs0IWlSvmB24BRy
         Sa26N46GV5VvL+foQaTS0e6FQPtw9xqMYFw8U9dMv+FI3f95hpyLlPbcZ0eUBy0+lRBS
         Zxmf0Je4LAsngkLkF3RSJGflKjhKVf+sLiArnyQ5Tdp2qGdjtvmzFwDoQ1iRmE04LRgt
         oK3O80xfvbEoqDdKeYcksJnEJcVhV00CGsYj/mEocSFUqmBZaJBElyzjh2q1GyEebLUU
         74K7Kq+y/ASarBIdVqw0XAGZa3yKMdhTjrVcysvXfZm9iVGpdCyv7BScQbMU9pNix65C
         ej4w==
X-Gm-Message-State: APjAAAVAgXvMu37bsNeGrJYryHzahBlYRBFnA6kjuXwWCDb6uAfRmibg
        Zz5IdnoGfI2nl0Mk73a6790=
X-Google-Smtp-Source: APXvYqydfh+5HDpGtkzRmJi7KqUb6YGBeooIrXXuogBUPgomKk22j+8tSWIklwP/JT/QbTFnsVbjDQ==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr13582996wmi.10.1580489955973;
        Fri, 31 Jan 2020 08:59:15 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id q124sm20943533wme.2.2020.01.31.08.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 08:59:14 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 1/3] drm/tegra: sor: Suspend on clock registration failure
Date:   Fri, 31 Jan 2020 17:59:08 +0100
Message-Id: <20200131165910.3443936-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Make sure the SOR module is suspenden after we fail to register the SOR
pad output clock.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 41d24949478e..96cd89bb2e82 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3922,15 +3922,16 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	if (!sor->clk_pad) {
 		char *name;
 
-		err = host1x_client_resume(&sor->client);
-		if (err < 0) {
-			dev_err(sor->dev, "failed to resume: %d\n", err);
+		name = devm_kasprintf(sor->dev, GFP_KERNEL, "sor%u_pad_clkout",
+				      sor->index);
+		if (!name) {
+			err = -ENOMEM;
 			goto remove;
 		}
 
-		name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "sor%u_pad_clkout", sor->index);
-		if (!name) {
-			err = -ENOMEM;
+		err = host1x_client_resume(&sor->client);
+		if (err < 0) {
+			dev_err(sor->dev, "failed to resume: %d\n", err);
 			goto remove;
 		}
 
-- 
2.24.1


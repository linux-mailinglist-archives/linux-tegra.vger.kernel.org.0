Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D95D34C62
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Jun 2019 17:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbfFDPjx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Jun 2019 11:39:53 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41612 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727422AbfFDPjx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Jun 2019 11:39:53 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so16348076wrm.8
        for <linux-tegra@vger.kernel.org>; Tue, 04 Jun 2019 08:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m51YANJEmjl/SYa8rDA/D24WQL30Q8br8DX7MclPk0k=;
        b=nyvvnEvn8/ZndJ+UeWkbY8kLIKETCnbHFo6+J0zJNzYSdE5LhCHx4QPzdisCRH3a4z
         6MyqrCaYJzUilypnUwWiZyXqRmbo9Ei9dN6FTaeOj+UR5u5WlRX3ir/MlciSSXtqlv9B
         KjYllnVLS/5DYF/gSETzxTAB8DRfgyldzMcwGXBIMZvk2SoAPpLQVywj/o9AIYx4zNaA
         xLdkUJZ/jvMHGIPyPabHawxZpSd3x95uNMojqhXMTKg0hX59W5rpkAnTeyPbI1przav4
         F63gFhYGf5dGS76+sepffCUiy1q4sh5ijVzQsluaJGkR7NbNH3yW4yyj2hDJ0b+JYfkW
         Eilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m51YANJEmjl/SYa8rDA/D24WQL30Q8br8DX7MclPk0k=;
        b=bz4hPtzMR74+cImcCaDR1xvzheJM4fXOmfFJbQ8On3jRenYMzx10BwVx5y16sYgISy
         HFSToglBpRxN79CG9pivOlMLuR8yx24z6B4ptC0cVEB8QGg3OnWS0pbI6JHgbpOXvgX5
         dMysRAOW8hxLvM1lbw7SoqvJVD0JaEXIqiMmdhWfrpf/ozypivA+J/C93MCNOmtcHeMJ
         7Lka9ckKd/WRjeM579BGbuWgWPKkA7aGTqblWTq/B4bXcRw20tKP8kwOYc0tpjLBeiI9
         B9xtbz/uL2jwQAGLjkbiEZCItYtgC3q5tyJNz6W7BvIKjnWunE5kBYdVZ9q5dLIBXxqF
         d6+w==
X-Gm-Message-State: APjAAAVLUerBBNfL0vPJUFuu5+NzaRg37K2IokATYM60mNfBQzE3d6t4
        DhwCTubTnBQL1YQP6e/zK+Y=
X-Google-Smtp-Source: APXvYqyap7tRng3LrdNWGz7MAAA9VztCSOyvclnMh67IHJhAolBMnZ2QGPIhKYzj84h4a7RyPYF0ug==
X-Received: by 2002:adf:e6ca:: with SMTP id y10mr7082585wrm.3.1559662791996;
        Tue, 04 Jun 2019 08:39:51 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id l12sm14328243wmj.22.2019.06.04.08.39.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 08:39:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH] soc/tegra: fuse: Do not log error message on deferred probe
Date:   Tue,  4 Jun 2019 17:39:50 +0200
Message-Id: <20190604153950.23801-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Recent changes have made it much more probable that clocks are not
available yet when the FUSE driver is first probed. However, that is a
situation that the driver can cope with just fine.

To avoid confusion, don't output an error when this happens.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 9b84bcc356d0..3eb44e65b326 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -133,8 +133,10 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 
 	fuse->clk = devm_clk_get(&pdev->dev, "fuse");
 	if (IS_ERR(fuse->clk)) {
-		dev_err(&pdev->dev, "failed to get FUSE clock: %ld",
-			PTR_ERR(fuse->clk));
+		if (PTR_ERR(fuse->clk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "failed to get FUSE clock: %ld",
+				PTR_ERR(fuse->clk));
+
 		fuse->base = base;
 		return PTR_ERR(fuse->clk);
 	}
-- 
2.21.0


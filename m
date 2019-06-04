Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8ADC34C47
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Jun 2019 17:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbfFDPby (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Jun 2019 11:31:54 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52624 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727953AbfFDPbx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Jun 2019 11:31:53 -0400
Received: by mail-wm1-f67.google.com with SMTP id s3so537458wms.2
        for <linux-tegra@vger.kernel.org>; Tue, 04 Jun 2019 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FzAtqms2qZg0KXTTwkWYX+8P53MW/o6jogEAnKbVJ4U=;
        b=IAK25dtXQs6if7kM55GjQIS5vLWsCHfZYCu28LQfdF4bSooRpXLilt6hbieqq9GEsJ
         RNLoAvkuuTPIO7sWNxYhV6H0Z2esCjNXvpKMJlSVqcW5Io+ZO4W0vF1FVn/QuA70SVQ/
         hkPFif9Bds1t+h6h5SUIzp/9vBQTDJrF1EdTGBYqzAEyz75Ck/bow/WmUPa/ZVCEG3vA
         /Dat3BIP3z+Gk451GEH9Z2tNWrh1NX9B5HpbZwy/2Jeasv2QjTDaDRLMx7hl3lfsXvA0
         wiQZif3fcbi2KAu+5nmrWIi/WWiXwpm0Ux8hAgw66Xaoe3Ljxuw2hduUcgmPpbQhvFPg
         elbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FzAtqms2qZg0KXTTwkWYX+8P53MW/o6jogEAnKbVJ4U=;
        b=DEp/98jqkSK7nTNKICAT8ofdFA8OpzwhUvBi45Lg+JR6LQxcyN9ziEPZNPQS47EYTq
         3gIpV/6iKnbINDBWZGhydOqellSpFLJA7HfED9aBA+HVGy8uJho6mMw9J/H58T0Ly3Gm
         0AcW5cn1i33LZFsi8y8TQ4jt/2KCMPZkO9JgLqWXPAanTQ2wd1MS4Q7jRZ1/gw8x3nSg
         oOqDnHs4d+iiLbXn70r2aOE4wsBr0jpmgdio1gptKPsoRoICZzbHHv9i2xPI6wjbdhs4
         r2nCEicirgwUH84t6b02OihNAKiXQziNBFnl317jXfVjuRaJgsE4v6dq+Y9cRYsNbhsM
         B7kw==
X-Gm-Message-State: APjAAAWEUHV4xHQFTLkc1UlrOMkr5YuRc/f4jYW6jbVPfuqet8jd/hCF
        58nvDSOK2e/vEgTqnwkWflM=
X-Google-Smtp-Source: APXvYqwBxn3CnKA8kf77hqsi6iM5Il4fkEQqEVHJZEEwZ3SwVEN847ZfXz9PXfOS+w98/6PlEKMC/A==
X-Received: by 2002:a1c:2681:: with SMTP id m123mr3264126wmm.86.1559662311920;
        Tue, 04 Jun 2019 08:31:51 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id r9sm18940857wrq.0.2019.06.04.08.31.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 08:31:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] gpu: host1x: Do not output error message for deferred probe
Date:   Tue,  4 Jun 2019 17:31:50 +0200
Message-Id: <20190604153150.22265-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

When deferring probe, avoid logging a confusing error message. While at
it, make the error message more informational.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index c55e2d634887..5a3f797240d4 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -247,8 +247,11 @@ static int host1x_probe(struct platform_device *pdev)
 
 	host->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(host->clk)) {
-		dev_err(&pdev->dev, "failed to get clock\n");
 		err = PTR_ERR(host->clk);
+
+		if (err != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "failed to get clock: %d\n", err);
+
 		return err;
 	}
 
-- 
2.21.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073C81F7A42
	for <lists+linux-tegra@lfdr.de>; Fri, 12 Jun 2020 17:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgFLPBK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 12 Jun 2020 11:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgFLPBJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Jun 2020 11:01:09 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22496C03E96F
        for <linux-tegra@vger.kernel.org>; Fri, 12 Jun 2020 08:01:08 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id j198so9371952wmj.0
        for <linux-tegra@vger.kernel.org>; Fri, 12 Jun 2020 08:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hPVJde5G6vCu7P63RAneWEkRXL9RWQBNNVI3/sqrw5k=;
        b=h0Vqr9EDa7jv0/PqjhzbsDDXtoiIm581w6Ckjafpp1UmdxjIsJMJXANBz2IaKtSx1y
         8IJvactV9GYUbdDnG4WoGfY3OZd0DdPkij7NxhJUI3S93TgdNUeAPFp74bNLxTLasGT7
         H5BsgaSF9NzrbiYnQ8qEgon83KQx3OVOV37v2yyDiWbO28flyqQzp0uEm0A+B+0ML6cm
         GCyb4dZhVfDv+M1/saDCXuF8BNwuKtdbD+4QjkOJOaK0Z7Xon/el+3aS9+dnszfuRFu4
         e59vrUdYmutSrvlb64mUPYfdUudYeAS8ciuf92gw9YB/QzMjoG1u5tzDAL2qR7dDW/ZC
         gJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hPVJde5G6vCu7P63RAneWEkRXL9RWQBNNVI3/sqrw5k=;
        b=brqSRec2NuU+BM30FstPqkjEeNH6xk5Eq9uS77TyM3dBB0QwSVaAYe1SRvQjxklzkO
         Pzv3N4rkcBDpzGnVnCVAbbdpBdza3Ngo+/rVF2+Wc04DBh2JD+uAH4u9FOaQcgdK/OBH
         Dh74Cfm0EfWksqdp7VM8eMrUBH7NngJzlTYrUg3pi4pM2ZAaz++OyLK0Wq7v7ybEhl5j
         42yWonF4AoFB2ho0AD+G/N5PlIjewtJFpkIRQ6/aXueoaTzmeg71TS5ZBRZA1BeVysUF
         XwR2OSzhyFRZLWD/nC29kR2wQTPlQKiaxwlwveLvCMT7qXFrqwdHskn20B3th2dBMlX9
         GwSA==
X-Gm-Message-State: AOAM530KNPQJqTeaJr8L1opeVvA+BLfNtJh/Hn/F91WzjznYYujGrDjm
        sX8CjeKWsKkqab1yNXVHMvA=
X-Google-Smtp-Source: ABdhPJwpZU/V4xi+IOdUOKQdpzm2cMGHMXYqD43AGxHGGcF2X/iHBTrwTCiSI522GbAql1jPKU+jgQ==
X-Received: by 2002:a1c:a943:: with SMTP id s64mr13613777wme.103.1591974066838;
        Fri, 12 Jun 2020 08:01:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 40sm11203723wrc.15.2020.06.12.08.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 08:01:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] gpu: host1x: Register child devices
Date:   Fri, 12 Jun 2020 17:00:59 +0200
Message-Id: <20200612150100.2419935-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to remove the dependency on the simple-bus compatible string,
which causes the OF driver core to register all child devices, make the
host1x driver explicitly register its children.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 3c0f151847ba..d0ebb70e2fdd 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -470,8 +470,14 @@ static int host1x_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto deinit_debugfs;
 
+	err = devm_of_platform_populate(&pdev->dev);
+	if (err < 0)
+		goto unregister;
+
 	return 0;
 
+unregister:
+	host1x_unregister(host);
 deinit_debugfs:
 	host1x_debug_deinit(host);
 	host1x_intr_deinit(host);
-- 
2.24.1


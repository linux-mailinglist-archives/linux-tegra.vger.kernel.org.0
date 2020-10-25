Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D155298427
	for <lists+linux-tegra@lfdr.de>; Sun, 25 Oct 2020 23:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1418936AbgJYWT4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 25 Oct 2020 18:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1419348AbgJYWSh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 25 Oct 2020 18:18:37 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79126C0613D0;
        Sun, 25 Oct 2020 15:18:36 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id 134so6686569ljj.3;
        Sun, 25 Oct 2020 15:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KYnDvMkLMERuQbQeyFl4CeENAxlm67gUy3culAwcSN0=;
        b=hKDJfgh2nxkwmAvNx9C1gAnn5Nt+v/I/UgZKkNCG1j+HeG+8RwQ1IzNefwNFh7Capj
         37BdEHDnGML8a6bwoSFgHkQNskFux9VLJdGyfaj1mpj4COazb026N5fC8v/RizVRkI99
         oSXqRmXl1aGU02A2JAH3664aPbjC7Le7+OnocBptZxTCibt9Ew3IzN8MEDt9qE47FSbP
         fZHWToFepUA2FKOT7+CQyU1cBQc9ex2DcBcfeEAv7uOO0VoDtGcgtNF3EUySAJkAoaat
         boEsw0R0iEAZl/XVXGVIJgzGud4bpCrlAJ6wG5Y0gg824e+Y4z53hUne6dJ091wOiw4D
         vuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KYnDvMkLMERuQbQeyFl4CeENAxlm67gUy3culAwcSN0=;
        b=cq9OvMzvT0z9hNTFcccP7dEX4fg7ua2woGejGPLjLh9tHqqX12R1VN3UqNsm3JEkg2
         uXeaBZPKsvJm6CIslYohdbiYR4oCu/4Clwb7Lj1sgWLNRI4FsrHNTORkMeKKTiq6BUkU
         nFnt8ZPeY8wo9cN4DW9BnzWEjSt3sILXvVlEMt0K10gfVZ4faGc9Sq2l4ZVKvSyUIuAL
         zx3+dNrq2xtEv6S17xoCxOG6XZGYNj55CFuR90UlBho1fw4RRdd/8uyqCwPIIAs6I7Yk
         OzgKrZY/h4h2uR6izRZ5vDiGaj9JU6BfRXO3lJAMbK+3a/m3mKmkJWxNcJw5kHYNnJBL
         452g==
X-Gm-Message-State: AOAM530aH21PQNfKb+oc5eTygBqLtDzqzLKJH6Uq5aWEAA/4V4fqKlYE
        DWEqS5DJFmjo6uu7O2Xd9iU=
X-Google-Smtp-Source: ABdhPJz62dra825y4ptqKraHUjLbpgvnCmBJFUqz5R61yS0AG9wXG82ZbNL3B9+Ndg61Wnb5c5d6TA==
X-Received: by 2002:a2e:920f:: with SMTP id k15mr4274751ljg.355.1603664315036;
        Sun, 25 Oct 2020 15:18:35 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 15:18:34 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Viresh Kumar <vireshk@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 41/52] memory: tegra124-emc: Use devm_platform_ioremap_resource()
Date:   Mon, 26 Oct 2020 01:17:24 +0300
Message-Id: <20201025221735.3062-42-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use devm_platform_ioremap_resource() helper which makes code a bit
cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra124-emc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 48e772ec544d..2814b1b4a1d9 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1181,7 +1181,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
 	struct tegra_emc *emc;
-	struct resource *res;
 	u32 ram_code;
 	int err;
 
@@ -1191,8 +1190,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	emc->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	emc->regs = devm_ioremap_resource(&pdev->dev, res);
+	emc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(emc->regs))
 		return PTR_ERR(emc->regs);
 
-- 
2.27.0


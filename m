Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65CC2562DC9
	for <lists+linux-tegra@lfdr.de>; Fri,  1 Jul 2022 10:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234866AbiGAIWB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 1 Jul 2022 04:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236241AbiGAIVf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 1 Jul 2022 04:21:35 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7FB71276
        for <linux-tegra@vger.kernel.org>; Fri,  1 Jul 2022 01:21:18 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id s206so1779968pgs.3
        for <linux-tegra@vger.kernel.org>; Fri, 01 Jul 2022 01:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SmGTIYV9FDLFGI4jK1+FoR+lci5+sJh4AzD8/oQcdbg=;
        b=juyeYcmRqKE8ZfARk0lcbwy6tu+ZB0ulGjr/lLCu++TX5ZJk/CNv1KHk6nbl7kDM2m
         FmfADw75Fj/MiatBD/GA+5t+g8s7XaUAWdBMpklU2l0QsCOCirrASDzS33oug+YkJw8r
         FLKihZMXInXOWTmxwTBmz/Wd5iukHZbttsz4adkuxZLgaJbY8CdtXc2g7jscYPrubLNF
         uoxJbxww/g6lo64YvPf3OuQ6p5W0ziZ4mvofrS9xCkCRxv3zO8xy9XaAPlT3sy4cYoN3
         AGzQ4GkFCYgATrIjP2F/EclWnHCLkeIpteF3yJcIEk/AGWd51itQu7O/x0XUIgFZ61Sr
         Q+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SmGTIYV9FDLFGI4jK1+FoR+lci5+sJh4AzD8/oQcdbg=;
        b=kWXdkK0ToEDp4LJZhm2Ywh/aNSYGy8BkC7K347Hu0qlMTUv9rW4S+VH6kpm2bw2DOs
         bWSB7JcO58zzY66TyFhsmyqBLKvq2FedJB8Bh14UfaCL2e5NxVBTLabnm9ZSrhY+eBSV
         48oXtRu/co1RyZol4EEIiruOhzE3ZsCP59SFW61MOvCmJeZlONGaWscxHpUsfomk8+PN
         Jen3LouJ6uiA8JadtoUpSSEzhZV5hQrF1y1Kv3lfu6oTyLae0bIoZkw6i88/GCrTsXAa
         ea4T1L9m/iMpxl0Nx6QtIos+bfLy6FlYZkT8cxgeQT0zzG2wJJtBltk7InB4DVIOu465
         7f7Q==
X-Gm-Message-State: AJIora/LuUBYVk5NB8IAbD1kF4dmO7qAphOBuZZC64hdK7hHz4CaAaPt
        jv1Jk+OZhAIFwbUHoAcCuiWztQ==
X-Google-Smtp-Source: AGRyM1uG7t68HKBiWzgw2xrep0YucaMynfNBRQTv5cXNo7Gg5Z/DX7PdOIAzDwjt/nml3pQ/mZYRaA==
X-Received: by 2002:a63:86c7:0:b0:40d:af99:608 with SMTP id x190-20020a6386c7000000b0040daf990608mr11495152pgd.515.1656663678039;
        Fri, 01 Jul 2022 01:21:18 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id 72-20020a62154b000000b00522c5e40574sm3181115pfv.129.2022.07.01.01.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 01:21:17 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 12/30] devfreq: tegra30: Migrate to dev_pm_opp_set_config()
Date:   Fri,  1 Jul 2022 13:50:07 +0530
Message-Id: <932a2d8ddad8e21456b583faf25a9b2a272d5d72.1656660185.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1656660185.git.viresh.kumar@linaro.org>
References: <cover.1656660185.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The OPP core now provides a unified API for setting all configuration
types, i.e. dev_pm_opp_set_config().

Lets start using it.

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/devfreq/tegra30-devfreq.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 65ecf17a36f4..30382bdfc655 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -830,6 +830,10 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	unsigned int i;
 	long rate;
 	int err;
+	struct dev_pm_opp_config config = {
+		.supported_hw = &hw_version,
+		.supported_hw_count = 1,
+	};
 
 	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
 	if (!tegra)
@@ -874,9 +878,9 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	err = devm_pm_opp_set_supported_hw(&pdev->dev, &hw_version, 1);
+	err = devm_pm_opp_set_config(&pdev->dev, &config);
 	if (err) {
-		dev_err(&pdev->dev, "Failed to set supported HW: %d\n", err);
+		dev_err(&pdev->dev, "Failed to set OPP config: %d\n", err);
 		return err;
 	}
 
-- 
2.31.1.272.g89b43f80a514


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C683633A591
	for <lists+linux-tegra@lfdr.de>; Sun, 14 Mar 2021 16:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234204AbhCNPqB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 14 Mar 2021 11:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234055AbhCNPp1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Mar 2021 11:45:27 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22C8C061762;
        Sun, 14 Mar 2021 08:45:24 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id v4so4450302wrp.13;
        Sun, 14 Mar 2021 08:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jtKR/4JVn6yx/XuU0tntwFP7lcedHE2V/O3j4vKQs0c=;
        b=BAcofkLpBVqClJbWenCsK37zvuwHpYUCtRAMipTF1ZFfV8xbbw2FzWy5r6jPqBWl70
         g9CcWRDzX8dTSa1K9aVJ2QvgNhFRLIlHks/a7w8LuxXObfqWWqoFW9NWTd+sYf+aec/Q
         tSr8A1wP+qezUHSY4j117N0rupg47RHvCjlUSfYmbGTZJPggI+ppViZoWoCPnLw0yG8n
         GwBmrVBXKUvskz47SYfIfsu1FqSPmGljLXM/t4QZmPnd/xviKmDaF/1F3Z2udLn/YxUL
         5aVuafMBKbECt1mhet7fJyaRrCVabbyG7VISG6VUp4MkuiSIZb7uVRR7BJBfCWVZ/HLY
         kIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jtKR/4JVn6yx/XuU0tntwFP7lcedHE2V/O3j4vKQs0c=;
        b=c6VK5JXsoBl9Hs9z+Lk1lBYZrLZ1eO8M3RTN+mqxBnv75GVhqp9DQ1iwaWwaMxGTx5
         rhKFtP4/3sSt+lVSKfyYp5wDrlc1Pzguer84/kQUYPrfXOIkLzcNcKje92BOo78SHqlh
         w+mhoucXIvxQH1upRXTIokZGEmbVrwzSuOGX9lEfiIb0FGCv4tFt6H4tkKhQ3zgFTzJC
         fDC55vqF+jWSXCaeUrqrma5yfiYXadWylE2Cwag2dJ75+uyEIPCyJxGasRjytC7JFaV2
         r/2glaZo8Insr2E7EqAPtmTc/QxihGUkp6jd08MIxDUw/mqdPerPfR6LsBz6m+nWznTO
         gycA==
X-Gm-Message-State: AOAM5333QjMK6YSyahyEQ9YN4MOyRHTlzZYjzb0FD7hJ6zjKhq6UhJYa
        DkHYcRREv/lIUzAZCc9g0AM=
X-Google-Smtp-Source: ABdhPJwAdPZZkDkI3WDmf7HRnWoB6/a6rLAZYs+/kSq8ULgrEagkE3iJo2VjjuK5TrEdqm4M7tF/8A==
X-Received: by 2002:a5d:6290:: with SMTP id k16mr22532255wru.177.1615736723601;
        Sun, 14 Mar 2021 08:45:23 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 08:45:23 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/17] ASoC: tegra30: i2s: Restore hardware state on runtime PM resume
Date:   Sun, 14 Mar 2021 18:44:45 +0300
Message-Id: <20210314154459.15375-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314154459.15375-1-digetx@gmail.com>
References: <20210314154459.15375-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra30 I2S driver syncs regmap cache only on resume from system suspend,
but hardware is reset across the runtime suspend because RPM of the parent
AHUB driver resets the I2S hardware, hence h/w state is lost after each
RPM resume. The problem isn't visible because hardware happens to be fully
reprogrammed after each RPM resume. Move hardware syncing to RPM resume in
order to restore h/w state properly.

Fixes: ed9ce1ed2239 ("ASoC: tegra: ahub: Reset hardware properly")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_i2s.c | 40 +++++++++++------------------------
 1 file changed, 12 insertions(+), 28 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 6740df541508..3d22c1be6f3d 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -58,8 +58,18 @@ static int tegra30_i2s_runtime_resume(struct device *dev)
 	}
 
 	regcache_cache_only(i2s->regmap, false);
+	regcache_mark_dirty(i2s->regmap);
+
+	ret = regcache_sync(i2s->regmap);
+	if (ret)
+		goto disable_clocks;
 
 	return 0;
+
+disable_clocks:
+	clk_disable_unprepare(i2s->clk_i2s);
+
+	return ret;
 }
 
 static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
@@ -551,37 +561,11 @@ static int tegra30_i2s_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int tegra30_i2s_suspend(struct device *dev)
-{
-	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
-
-	regcache_mark_dirty(i2s->regmap);
-
-	return 0;
-}
-
-static int tegra30_i2s_resume(struct device *dev)
-{
-	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
-	int ret;
-
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		pm_runtime_put(dev);
-		return ret;
-	}
-	ret = regcache_sync(i2s->regmap);
-	pm_runtime_put(dev);
-
-	return ret;
-}
-#endif
-
 static const struct dev_pm_ops tegra30_i2s_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra30_i2s_runtime_suspend,
 			   tegra30_i2s_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(tegra30_i2s_suspend, tegra30_i2s_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra30_i2s_driver = {
-- 
2.30.2


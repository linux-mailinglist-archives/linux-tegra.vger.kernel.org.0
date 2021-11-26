Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B43745F217
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Nov 2021 17:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378680AbhKZQjv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Nov 2021 11:39:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350189AbhKZQhs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Nov 2021 11:37:48 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2791AC061D6C;
        Fri, 26 Nov 2021 08:19:51 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id f18so25506565lfv.6;
        Fri, 26 Nov 2021 08:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tbG85K+O8+Dl5om1+PZ6lAYg/7hr7N71/G0INRgPxNw=;
        b=SbQVrq7MGFxE62ut5dReO76clPquqYcsD5seMI2r5Ekfjjt57czFCxJNrK6toz4fjX
         gK/+H/RbcjerAOl2Q+IZnFcr91n/AP4jmXVIUVSKgSFI47xRJr8NDsB9zC7QOxZbqW66
         M3BlaMTKXFOUNW88+Mm9SN1WmrZg+4Rnk+djZujQKMFdF67VQ5FjHE4vaTQTyZ7acQGr
         09nr18Rt/7sGh6+HhfCJYhisArNj4RqK7pLyP+Ppu/Ti+a6HPDSHpxS47gdyECNAEWJ9
         obeZPolP6lQ0yjztIPPRIVjBQ27mOMuk1MjQw6QLtCvSYDplDU2GupVO6W3Jyhnkw2Bi
         +GVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tbG85K+O8+Dl5om1+PZ6lAYg/7hr7N71/G0INRgPxNw=;
        b=EmymV2Q1n5p4hpVvy7xctnZhxBGFeyfCDPUDSmGVF01jjvIt1nifxDAVmIz+nCGXRV
         yl8TdhepBVcto0mRRzuEgsvf4iMW8C68LlFnVA2SBezEZw1uby3W14VDd/0PZVEp80jZ
         F2cFGHyK3yf07DmCUcY+N7fgcCsLQUKXefLI4hbagVxbJV0Z1KAX3vvTg9da9Hpn5vXG
         4+YTt9NwaiEi/od/btdLtu5GxoVVTkd2E4p+g7+O1wX3qrWfzKGtG2BqRhHdOA0ka62j
         x5SwBg5N2MYV+0rmnjykcqH+72YqIX/+DPBa5qv9IxN6heTaDXtP9YTTMG/0k5BQjq1i
         CSEw==
X-Gm-Message-State: AOAM531rZQfhYBomeFWUrYBbZkHM3XP8ioE7sXA5Z/Sy6hvHoP2PWZhf
        OqnlP/A28nPMdIgILxqAvWE=
X-Google-Smtp-Source: ABdhPJwDWO1Vlta1tP9gZbVb8KmrLyN84n3kqDO9aJna1XKbuzUtfmj5/ve/FnkPuT1etUb+1fdSDg==
X-Received: by 2002:a05:6512:2eb:: with SMTP id m11mr29264894lfq.326.1637943589496;
        Fri, 26 Nov 2021 08:19:49 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:19:49 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/20] ASoC: tegra20: spdif: Reset hardware
Date:   Fri, 26 Nov 2021 19:17:57 +0300
Message-Id: <20211126161807.15776-11-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Reset S/PDIF controller on runtime PM suspend/resume to ensure that we
always have a consistent hardware state.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 32 ++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra20_spdif.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 6ca48bc322ae..8b9bac30d5cd 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -14,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -27,6 +29,8 @@ static __maybe_unused int tegra20_spdif_runtime_suspend(struct device *dev)
 {
 	struct tegra20_spdif *spdif = dev_get_drvdata(dev);
 
+	regcache_cache_only(spdif->regmap, true);
+
 	clk_disable_unprepare(spdif->clk_spdif_out);
 
 	return 0;
@@ -37,13 +41,35 @@ static __maybe_unused int tegra20_spdif_runtime_resume(struct device *dev)
 	struct tegra20_spdif *spdif = dev_get_drvdata(dev);
 	int ret;
 
+	ret = reset_control_assert(spdif->reset);
+	if (ret)
+		return ret;
+
 	ret = clk_prepare_enable(spdif->clk_spdif_out);
 	if (ret) {
 		dev_err(dev, "clk_enable failed: %d\n", ret);
 		return ret;
 	}
 
+	usleep_range(10, 100);
+
+	ret = reset_control_deassert(spdif->reset);
+	if (ret)
+		goto disable_clocks;
+
+	regcache_cache_only(spdif->regmap, false);
+	regcache_mark_dirty(spdif->regmap);
+
+	ret = regcache_sync(spdif->regmap);
+	if (ret)
+		goto disable_clocks;
+
 	return 0;
+
+disable_clocks:
+	clk_disable_unprepare(spdif->clk_spdif_out);
+
+	return ret;
 }
 
 static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
@@ -268,6 +294,12 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, spdif);
 
+	spdif->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(spdif->reset)) {
+		dev_err(&pdev->dev, "Can't retrieve spdif reset\n");
+		return PTR_ERR(spdif->reset);
+	}
+
 	spdif->clk_spdif_out = devm_clk_get(&pdev->dev, "spdif_out");
 	if (IS_ERR(spdif->clk_spdif_out)) {
 		dev_err(&pdev->dev, "Could not retrieve spdif clock\n");
diff --git a/sound/soc/tegra/tegra20_spdif.h b/sound/soc/tegra/tegra20_spdif.h
index 1973ffc2d5c7..ff4b79e2052f 100644
--- a/sound/soc/tegra/tegra20_spdif.h
+++ b/sound/soc/tegra/tegra20_spdif.h
@@ -451,6 +451,7 @@ struct tegra20_spdif {
 	struct snd_dmaengine_dai_dma_data capture_dma_data;
 	struct snd_dmaengine_dai_dma_data playback_dma_data;
 	struct regmap *regmap;
+	struct reset_control *reset;
 };
 
 #endif
-- 
2.33.1


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA722DD73E
	for <lists+linux-tegra@lfdr.de>; Thu, 17 Dec 2020 19:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730794AbgLQSJE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 17 Dec 2020 13:09:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730772AbgLQSJB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 13:09:01 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0617FC0617B0;
        Thu, 17 Dec 2020 10:08:02 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id h205so16304239lfd.5;
        Thu, 17 Dec 2020 10:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iUM33vHLNZtsJPVk9A+84cGK/qMnFIOLUNLoWSdi5PE=;
        b=li6sWcps0Q20F/zs74GUHWU1rU3vlb04ApDelSlLDh/E0oz6QSPlp8aG4PB/Ot0zmV
         Q39ydjkjjzhVz4JxTb5Fhl0OpiGVtztulOFN9e7MH4QdpeQPD4Zu71i+ydlWvG84Yheq
         fgdEZ6mhHzVyc+CNrv0X8acaJsUF94TsK1KPJa2qJUAk/ijlpCvgJz24Ab9aESiV1Y+t
         X2Vmb8eL6RWSuRIpEbbgr9nBNRLIaHqWNB3qgb7MVzlAyYPBhnHQ9bvdiz5aJNLoDw9Z
         rJKEodpQ61oklJiE+Uxlkq4UoYdJ82FYGaMZNfM7nJdppa20Lt2sfDrWQ4ds+Y3CMd4/
         s+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iUM33vHLNZtsJPVk9A+84cGK/qMnFIOLUNLoWSdi5PE=;
        b=dLMw+QP0TKpOsM3uQc+S/immDH5rLrINRYlC9rNHMGh4tF+IW4Z7FjMIRGry75VDpx
         1XH5Wmsygs8N5OtstOGcXQHvkLv/CZr4WCQZmHXeq+ZuTGrjl5d2ru1S3NNz0lR46es/
         6DYUyZdK2czuMsLtPKpnTKTtLubo29b6tDNxgG1x/jvbSiCjjDsboBBihb3eILDu7qtz
         H7yVUSwn6ilo080j5p/6nmQqdE2urXjZNk7ryhniEpF/o/jP/rFE7g8x+6ASc2H0fxIO
         9/hY97XHT9AUbTSq+Tt+aAHUTkPDiFs1hA9IpIFuJpJ98Jy99hwWEx7EJf7zHp8GL1D2
         uZgA==
X-Gm-Message-State: AOAM533Jz34QreZu3NCaZSjOFEoiOsgLS/aKc5wmE8Z+P3PrfVkAFIRm
        KeeUEa/LjYeGv2sxmkAyHYg=
X-Google-Smtp-Source: ABdhPJyUG/ZcFCjkb6RTKaSoldzBmwDKOzmClpf4O3p6ruD35zpWUUUeoWGbOBPqW7cQqlBJDK/7Fw==
X-Received: by 2002:ac2:5486:: with SMTP id t6mr16345900lfk.265.1608228480486;
        Thu, 17 Dec 2020 10:08:00 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:08:00 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 35/48] drm/tegra: dc: Support OPP and SoC core voltage scaling
Date:   Thu, 17 Dec 2020 21:06:25 +0300
Message-Id: <20201217180638.22748-36-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add OPP and SoC core voltage scaling support to the display controller
driver. This is required for enabling system-wide DVFS on pre-Tegra186
SoCs.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 66 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index b6676f1fe358..105ad786e432 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -11,9 +11,12 @@
 #include <linux/interconnect.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
 #include <soc/tegra/pmc.h>
 
 #include <drm/drm_atomic.h>
@@ -1699,6 +1702,48 @@ int tegra_dc_state_setup_clock(struct tegra_dc *dc,
 	return 0;
 }
 
+static void tegra_dc_update_voltage_state(struct tegra_dc *dc,
+					  struct tegra_dc_state *state)
+{
+	unsigned long rate, pstate;
+	struct dev_pm_opp *opp;
+	int err;
+
+	/* calculate actual pixel clock rate which depends on internal divider */
+	rate = DIV_ROUND_UP(clk_get_rate(dc->clk) * 2, state->div + 2);
+
+	/* find suitable OPP for the rate */
+	opp = dev_pm_opp_find_freq_ceil(dc->dev, &rate);
+
+	if (opp == ERR_PTR(-ERANGE))
+		opp = dev_pm_opp_find_freq_floor(dc->dev, &rate);
+
+	/* -ENOENT means that this device-tree doesn't have OPP table */
+	if (opp == ERR_PTR(-ENOENT))
+		return;
+
+	if (IS_ERR(opp)) {
+		dev_err(dc->dev, "failed to find OPP for %luHz: %pe\n",
+			rate, opp);
+		return;
+	}
+
+	pstate = dev_pm_opp_get_voltage(opp);
+	dev_pm_opp_put(opp);
+
+	/*
+	 * The minimum core voltage depends on the pixel clock rate (which
+	 * depends on internal clock divider of the CRTC) and not on the
+	 * rate of the display controller clock. This is why we're not using
+	 * dev_pm_opp_set_rate() API and instead controlling the power domain
+	 * directly.
+	 */
+	err = dev_pm_genpd_set_performance_state(dc->dev, pstate);
+	if (err)
+		dev_err(dc->dev, "failed to set power domain state to %lu: %d\n",
+			pstate, err);
+}
+
 static void tegra_dc_commit_state(struct tegra_dc *dc,
 				  struct tegra_dc_state *state)
 {
@@ -1738,6 +1783,8 @@ static void tegra_dc_commit_state(struct tegra_dc *dc,
 	if (err < 0)
 		dev_err(dc->dev, "failed to set clock %pC to %lu Hz: %d\n",
 			dc->clk, state->pclk, err);
+
+	tegra_dc_update_voltage_state(dc, state);
 }
 
 static void tegra_dc_stop(struct tegra_dc *dc)
@@ -1931,6 +1978,8 @@ static void tegra_crtc_atomic_disable(struct drm_crtc *crtc,
 	err = host1x_client_suspend(&dc->client);
 	if (err < 0)
 		dev_err(dc->dev, "failed to suspend: %d\n", err);
+
+	dev_pm_genpd_set_performance_state(dc->dev, 0);
 }
 
 static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
@@ -2523,7 +2572,6 @@ static int tegra_dc_runtime_suspend(struct host1x_client *client)
 
 	clk_disable_unprepare(dc->clk);
 	pm_runtime_put_sync(dev);
-
 	return 0;
 }
 
@@ -2881,6 +2929,18 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 	return 0;
 }
 
+static int tegra_dc_init_opp_table(struct tegra_dc *dc)
+{
+	struct tegra_core_opp_params opp_params = {};
+	int err;
+
+	err = devm_tegra_core_dev_init_opp_table(dc->dev, &opp_params);
+	if (err && err != -ENODEV)
+		return err;
+
+	return 0;
+}
+
 static int tegra_dc_probe(struct platform_device *pdev)
 {
 	struct tegra_dc *dc;
@@ -2939,6 +2999,10 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		tegra_powergate_power_off(dc->powergate);
 	}
 
+	err = tegra_dc_init_opp_table(dc);
+	if (err < 0)
+		return err;
+
 	dc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dc->regs))
 		return PTR_ERR(dc->regs);
-- 
2.29.2


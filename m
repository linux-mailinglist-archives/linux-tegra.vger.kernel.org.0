Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32D639375F
	for <lists+linux-tegra@lfdr.de>; Thu, 27 May 2021 22:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236073AbhE0Uti (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 27 May 2021 16:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236017AbhE0Utf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 May 2021 16:49:35 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE38C061763;
        Thu, 27 May 2021 13:48:00 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id j6so1995016lfr.11;
        Thu, 27 May 2021 13:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+ru1Y5AhCOlhA7q2BKIbg+3l43tX1d5MlWRnc4jqFnM=;
        b=jqtyOz703iLyPWSnLzVdHsndBMgTbIV3w+zIlLSVFaq1VmEAMZ/R1V46l2pnCsx437
         6f/KMq/u4LUga7TcUmsGCYEK7usWkFBaWKg3T2N5xlBlBiQrrP/FjxbPkA/RyRA2degn
         p1GiCf0UaruYdjM5ZxNvzPL156LdTCIjrtCRLcm76Nh+b31u6x8tkzdNJoWTQSftRZg0
         wyiV4FM4cp9RzkxLgxjDRxqNi2pHN10ASXbBj1L9CwGN+3LvOX8qMO9Lk8L38E1sPeds
         a+qM/Y2x0nvvd+vpxeBpXsdFeooKAsnbm92ejFmha/CxlidapuT0LIk06GxSXf+SHhjx
         mndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+ru1Y5AhCOlhA7q2BKIbg+3l43tX1d5MlWRnc4jqFnM=;
        b=d0EC/k6X7MYtLPu2xVAY14RXDe3i55btzkHLsrAY7Vp2ajB7Sbb05JUoFnTeedFQYK
         xbpliqy4zU1gmXqXgX5sclpS2kVuicq9kKZSOFxVtFn0VmTeREzUG9CDZaFC+D7rQDPp
         Ia3vTsKxxirRMmfRJeTldsgZX/MdNCwbG9x9MixfIjfh4PQswNtnPGMOd0aOBf+4HH9f
         wO3RtCzbOv3gEIWJQJvkW5NFl32lL46R0goFfcdNpU3iSRpd4+/xgFiEybCmlLqs8jqJ
         EwGg1FvTHxwf/JTEE78Pc5CiEoLTTn/PN6NL/pH/LWIPSkRheYd4qgE3S4CUd8AvJygj
         wb1A==
X-Gm-Message-State: AOAM533ZSDZooDq/psr4e18EtJ1BD82B+ezi0X4o5S3iNPqAkD8ykzOy
        pPH0SEs2wrVTewxnKZNpsQA=
X-Google-Smtp-Source: ABdhPJxV+zl4M4CVauhIIMxehlxu+zxjdNa5qeGbumXVSxfBB9VKRaWOZGKOMQl2M9CY3S6ULLLNFg==
X-Received: by 2002:a05:6512:348c:: with SMTP id v12mr3586126lfr.258.1622148478587;
        Thu, 27 May 2021 13:47:58 -0700 (PDT)
Received: from localhost.localdomain (46-138-12-55.dynamic.spd-mgts.ru. [46.138.12.55])
        by smtp.gmail.com with ESMTPSA id 10sm347297ljq.39.2021.05.27.13.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 13:47:58 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        =?UTF-8?q?Nikola=20Milosavljevi=C4=87?= <mnidza@outlook.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Paul Fertser <fercerpav@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        linux-clk@vger.kernel.org
Subject: [PATCH v3 04/14] soc/tegra: Add devm_tegra_core_dev_init_opp_table()
Date:   Thu, 27 May 2021 23:47:32 +0300
Message-Id: <20210527204742.10379-5-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210527204742.10379-1-digetx@gmail.com>
References: <20210527204742.10379-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add common helper which initializes OPP table for Tegra SoC core devices.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/common.c | 97 ++++++++++++++++++++++++++++++++++++++
 include/soc/tegra/common.h | 22 +++++++++
 2 files changed, 119 insertions(+)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index 3dc54f59cafe..cd33e99249c3 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -3,9 +3,16 @@
  * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
  */
 
+#define dev_fmt(fmt)	"tegra-soc: " fmt
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/export.h>
 #include <linux/of.h>
+#include <linux/pm_opp.h>
 
 #include <soc/tegra/common.h>
+#include <soc/tegra/fuse.h>
 
 static const struct of_device_id tegra_machine_match[] = {
 	{ .compatible = "nvidia,tegra20", },
@@ -31,3 +38,93 @@ bool soc_is_tegra(void)
 
 	return match != NULL;
 }
+
+static int tegra_core_dev_init_opp_state(struct device *dev)
+{
+	unsigned long rate;
+	struct clk *clk;
+	int err;
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err(dev, "failed to get clk: %pe\n", clk);
+		return PTR_ERR(clk);
+	}
+
+	rate = clk_get_rate(clk);
+	if (!rate) {
+		dev_err(dev, "failed to get clk rate\n");
+		return -EINVAL;
+	}
+
+	/* first dummy rate-setting initializes voltage vote */
+	err = dev_pm_opp_set_rate(dev, rate);
+	if (err) {
+		dev_err(dev, "failed to initialize OPP clock: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+/**
+ * devm_tegra_core_dev_init_opp_table() - initialize OPP table
+ * @dev: device for which OPP table is initialized
+ * @params: pointer to the OPP table configuration
+ *
+ * This function will initialize OPP table and sync OPP state of a Tegra SoC
+ * core device.
+ *
+ * Return: 0 on success or errorno.
+ */
+int devm_tegra_core_dev_init_opp_table(struct device *dev,
+				       struct tegra_core_opp_params *params)
+{
+	u32 hw_version;
+	int err;
+
+	err = devm_pm_opp_set_clkname(dev, NULL);
+	if (err) {
+		dev_err(dev, "failed to set OPP clk: %d\n", err);
+		return err;
+	}
+
+	/* Tegra114+ doesn't support OPP yet */
+	if (!of_machine_is_compatible("nvidia,tegra20") &&
+	    !of_machine_is_compatible("nvidia,tegra30"))
+		return -ENODEV;
+
+	if (of_machine_is_compatible("nvidia,tegra20"))
+		hw_version = BIT(tegra_sku_info.soc_process_id);
+	else
+		hw_version = BIT(tegra_sku_info.soc_speedo_id);
+
+	err = devm_pm_opp_set_supported_hw(dev, &hw_version, 1);
+	if (err) {
+		dev_err(dev, "failed to set OPP supported HW: %d\n", err);
+		return err;
+	}
+
+	/*
+	 * Older device-trees have an empty OPP table, we will get
+	 * -ENODEV from devm_pm_opp_of_add_table() in this case.
+	 */
+	err = devm_pm_opp_of_add_table(dev);
+	if (err) {
+		if (err == -ENODEV)
+			dev_err_once(dev, "OPP table not found, please update device-tree\n");
+		else
+			dev_err(dev, "failed to add OPP table: %d\n", err);
+
+		return err;
+	}
+
+	if (params->init_state) {
+		err = tegra_core_dev_init_opp_state(dev);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_tegra_core_dev_init_opp_table);
diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
index 744280ecab5f..af41ad80ec21 100644
--- a/include/soc/tegra/common.h
+++ b/include/soc/tegra/common.h
@@ -6,15 +6,37 @@
 #ifndef __SOC_TEGRA_COMMON_H__
 #define __SOC_TEGRA_COMMON_H__
 
+#include <linux/errno.h>
 #include <linux/types.h>
 
+struct device;
+
+/**
+ * Tegra SoC core device OPP table configuration
+ *
+ * @init_state: pre-initialize OPP state of a device
+ */
+struct tegra_core_opp_params {
+	bool init_state;
+};
+
 #ifdef CONFIG_ARCH_TEGRA
 bool soc_is_tegra(void);
+
+int devm_tegra_core_dev_init_opp_table(struct device *dev,
+				       struct tegra_core_opp_params *params);
 #else
 static inline bool soc_is_tegra(void)
 {
 	return false;
 }
+
+static inline int
+devm_tegra_core_dev_init_opp_table(struct device *dev,
+				   struct tegra_core_opp_params *params)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __SOC_TEGRA_COMMON_H__ */
-- 
2.30.2


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00BE9A2999
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Aug 2019 00:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbfH2WTc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 29 Aug 2019 18:19:32 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45454 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbfH2WTc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Aug 2019 18:19:32 -0400
Received: by mail-ed1-f67.google.com with SMTP id x19so5694711eda.12
        for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2019 15:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DY2xeg+PNZSiH5DiJA9Ehx5jsjgW8ffYHl9bQf2AqCE=;
        b=XgHQBxdQ6zMFE4C8VOAlL++5bKqnrV/ANOgya9p7CEo9mJ/hZhrAETj7qTjWD8qWc9
         z0hT6DcHVzMLXydCIoyunaA22l3GGp3TokQCuY85iO3+mObCRXaO2rgRVnuENgoFZjrT
         bDazFrNpW8KzZRepqK4SM2lGlR7UMdWywGgrLnLi6D98L2qaa6NJIfbQQO5A7PoinoOy
         4GPuimrJ3nJKae8ZZiYTpDShIYGCc2pjPtk5H4zLxNqhRDnLiigrT0hx0UsxB5DiV2S4
         I5nQSVxkwQyGooBD7Mu8IaD7tioktLieQIJZeT/o8UmeeOjAyA+X5uWYJgThuXUwifIU
         cvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DY2xeg+PNZSiH5DiJA9Ehx5jsjgW8ffYHl9bQf2AqCE=;
        b=RU7kqwwMHC0Bh0QN2YvtZIfPKqQZt0Pk+MlsZLoMwtOBjE6vsA+3Xr29RiKpCk0Vlx
         kewi7XWtJtPaORo1bJ1Z1v+/J0utv00tiZtXqA1SCxelvBfPInf7ehvh0tgbkXECeRkz
         ld3K1KVu83A/evWJMdFgSUrazuYa+YHMjXyrW9fNPtal/xMYouBxPN7fBTsAsmpRCz3x
         iGy34RV6g0kaUnQT2x7a+iOU0X8ODNzod4b8zNi9spjGs3hT2vEVLRKIT9xkc+JEpJqt
         n0BhiTYEHvz9ct0VPo4zIw+prQY6PbjuSlBbY8r5etjsuaGLnN5buKySz9COUzIiNgnZ
         Bmhw==
X-Gm-Message-State: APjAAAWH9eJUcwpzlpeKsMDwoMgLff+js3bz7gpgZzm8X+R/ql6XNKgp
        FWTotTfQ9bjBn6ck0kuXXRg=
X-Google-Smtp-Source: APXvYqyqzciCce72KVZvlt5XSvrtYszLZKEs7OfBW2lMFRcZ4i5hf4zsf+nDkwnhWI23RXyXu5oRXg==
X-Received: by 2002:aa7:dac9:: with SMTP id x9mr12466151eds.271.1567117169985;
        Thu, 29 Aug 2019 15:19:29 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id f6sm671471edn.63.2019.08.29.15.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 15:19:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/7] thermal: tegra: Use nvmem API
Date:   Fri, 30 Aug 2019 00:19:11 +0200
Message-Id: <20190829221911.24876-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829221911.24876-1-thierry.reding@gmail.com>
References: <20190829221911.24876-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Instead of using the custom Tegra FUSE API to read the fuses for TSENSOR
configuration, use the nvmem API. This makes the dependency between the
two devices more explicit and decouples the driver from one another.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/thermal/tegra/soctherm-fuse.c     | 19 ++++++++++---------
 drivers/thermal/tegra/soctherm.c          |  4 ++--
 drivers/thermal/tegra/soctherm.h          |  9 ++++++---
 drivers/thermal/tegra/tegra124-soctherm.c |  8 --------
 drivers/thermal/tegra/tegra132-soctherm.c |  8 --------
 drivers/thermal/tegra/tegra210-soctherm.c |  8 --------
 6 files changed, 18 insertions(+), 38 deletions(-)

diff --git a/drivers/thermal/tegra/soctherm-fuse.c b/drivers/thermal/tegra/soctherm-fuse.c
index 190f95280e0b..c63bef809004 100644
--- a/drivers/thermal/tegra/soctherm-fuse.c
+++ b/drivers/thermal/tegra/soctherm-fuse.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/platform_device.h>
 #include <soc/tegra/fuse.h>
 
@@ -70,14 +71,15 @@ static s64 div64_s64_precise(s64 a, s32 b)
 	return r >> 16;
 }
 
-int tegra_calc_shared_calib(const struct tegra_soctherm_fuse *tfuse,
+int tegra_calc_shared_calib(struct device *dev,
+			    const struct tegra_soctherm_fuse *tfuse,
 			    struct tsensor_shared_calib *shared)
 {
 	u32 val;
 	s32 shifted_cp, shifted_ft;
 	int err;
 
-	err = tegra_fuse_readl(FUSE_TSENSOR_COMMON, &val);
+	err = nvmem_cell_read_u32(dev, "common", &val);
 	if (err)
 		return err;
 
@@ -90,11 +92,9 @@ int tegra_calc_shared_calib(const struct tegra_soctherm_fuse *tfuse,
 		     tfuse->fuse_shift_ft_shift;
 	shifted_ft = sign_extend32(shifted_ft, 4);
 
-	if (tfuse->fuse_spare_realignment) {
-		err = tegra_fuse_readl(tfuse->fuse_spare_realignment, &val);
-		if (err)
-			return err;
-	}
+	err = nvmem_cell_read_u32(dev, "realignment", &val);
+	if (err != -ENOENT)
+		return err;
 
 	shifted_cp = sign_extend32(val, 5);
 
@@ -104,7 +104,8 @@ int tegra_calc_shared_calib(const struct tegra_soctherm_fuse *tfuse,
 	return 0;
 }
 
-int tegra_calc_tsensor_calib(const struct tegra_tsensor *sensor,
+int tegra_calc_tsensor_calib(struct device *dev,
+			     const struct tegra_tsensor *sensor,
 			     const struct tsensor_shared_calib *shared,
 			     u32 *calibration)
 {
@@ -119,7 +120,7 @@ int tegra_calc_tsensor_calib(const struct tegra_tsensor *sensor,
 
 	sensor_group = sensor->group;
 
-	err = tegra_fuse_readl(sensor->calib_fuse_offset, &val);
+	err = nvmem_cell_read_u32(dev, sensor->name, &val);
 	if (err)
 		return err;
 
diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index 43941eb734eb..e632888ff1ae 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -2180,13 +2180,13 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* calculate shared calibration data */
-	err = tegra_calc_shared_calib(soc->tfuse, &shared_calib);
+	err = tegra_calc_shared_calib(&pdev->dev, soc->tfuse, &shared_calib);
 	if (err)
 		return err;
 
 	/* calculate tsensor calibaration data */
 	for (i = 0; i < soc->num_tsensors; ++i) {
-		err = tegra_calc_tsensor_calib(&soc->tsensors[i],
+		err = tegra_calc_tsensor_calib(&pdev->dev, &soc->tsensors[i],
 					       &shared_calib,
 					       &tegra->calib[i]);
 		if (err)
diff --git a/drivers/thermal/tegra/soctherm.h b/drivers/thermal/tegra/soctherm.h
index 70501e73d586..715b4f06e162 100644
--- a/drivers/thermal/tegra/soctherm.h
+++ b/drivers/thermal/tegra/soctherm.h
@@ -93,7 +93,6 @@ struct tegra_tsensor {
 	const char *name;
 	const u32 base;
 	const struct tegra_tsensor_configuration *config;
-	const u32 calib_fuse_offset;
 	/*
 	 * Correction values used to modify values read from
 	 * calibration fuses
@@ -131,9 +130,13 @@ struct tegra_soctherm_soc {
 	struct tsensor_group_thermtrips *thermtrips;
 };
 
-int tegra_calc_shared_calib(const struct tegra_soctherm_fuse *tfuse,
+struct tegra_soctherm;
+
+int tegra_calc_shared_calib(struct device *dev,
+			    const struct tegra_soctherm_fuse *tfuse,
 			    struct tsensor_shared_calib *shared);
-int tegra_calc_tsensor_calib(const struct tegra_tsensor *sensor,
+int tegra_calc_tsensor_calib(struct device *dev,
+			     const struct tegra_tsensor *sensor,
 			     const struct tsensor_shared_calib *shared,
 			     u32 *calib);
 
diff --git a/drivers/thermal/tegra/tegra124-soctherm.c b/drivers/thermal/tegra/tegra124-soctherm.c
index 20ad27f4d1a1..e5bd080e3632 100644
--- a/drivers/thermal/tegra/tegra124-soctherm.c
+++ b/drivers/thermal/tegra/tegra124-soctherm.c
@@ -129,7 +129,6 @@ static const struct tegra_tsensor tegra124_tsensors[] = {
 		.name = "cpu0",
 		.base = 0xc0,
 		.config = &tegra124_tsensor_config,
-		.calib_fuse_offset = 0x098,
 		.fuse_corr_alpha = 1135400,
 		.fuse_corr_beta = -6266900,
 		.group = &tegra124_tsensor_group_cpu,
@@ -137,7 +136,6 @@ static const struct tegra_tsensor tegra124_tsensors[] = {
 		.name = "cpu1",
 		.base = 0xe0,
 		.config = &tegra124_tsensor_config,
-		.calib_fuse_offset = 0x084,
 		.fuse_corr_alpha = 1122220,
 		.fuse_corr_beta = -5700700,
 		.group = &tegra124_tsensor_group_cpu,
@@ -145,7 +143,6 @@ static const struct tegra_tsensor tegra124_tsensors[] = {
 		.name = "cpu2",
 		.base = 0x100,
 		.config = &tegra124_tsensor_config,
-		.calib_fuse_offset = 0x088,
 		.fuse_corr_alpha = 1127000,
 		.fuse_corr_beta = -6768200,
 		.group = &tegra124_tsensor_group_cpu,
@@ -153,7 +150,6 @@ static const struct tegra_tsensor tegra124_tsensors[] = {
 		.name = "cpu3",
 		.base = 0x120,
 		.config = &tegra124_tsensor_config,
-		.calib_fuse_offset = 0x12c,
 		.fuse_corr_alpha = 1110900,
 		.fuse_corr_beta = -6232000,
 		.group = &tegra124_tsensor_group_cpu,
@@ -161,7 +157,6 @@ static const struct tegra_tsensor tegra124_tsensors[] = {
 		.name = "mem0",
 		.base = 0x140,
 		.config = &tegra124_tsensor_config,
-		.calib_fuse_offset = 0x158,
 		.fuse_corr_alpha = 1122300,
 		.fuse_corr_beta = -5936400,
 		.group = &tegra124_tsensor_group_mem,
@@ -169,7 +164,6 @@ static const struct tegra_tsensor tegra124_tsensors[] = {
 		.name = "mem1",
 		.base = 0x160,
 		.config = &tegra124_tsensor_config,
-		.calib_fuse_offset = 0x15c,
 		.fuse_corr_alpha = 1145700,
 		.fuse_corr_beta = -7124600,
 		.group = &tegra124_tsensor_group_mem,
@@ -177,7 +171,6 @@ static const struct tegra_tsensor tegra124_tsensors[] = {
 		.name = "gpu",
 		.base = 0x180,
 		.config = &tegra124_tsensor_config,
-		.calib_fuse_offset = 0x154,
 		.fuse_corr_alpha = 1120100,
 		.fuse_corr_beta = -6000500,
 		.group = &tegra124_tsensor_group_gpu,
@@ -185,7 +178,6 @@ static const struct tegra_tsensor tegra124_tsensors[] = {
 		.name = "pllx",
 		.base = 0x1a0,
 		.config = &tegra124_tsensor_config,
-		.calib_fuse_offset = 0x160,
 		.fuse_corr_alpha = 1106500,
 		.fuse_corr_beta = -6729300,
 		.group = &tegra124_tsensor_group_pll,
diff --git a/drivers/thermal/tegra/tegra132-soctherm.c b/drivers/thermal/tegra/tegra132-soctherm.c
index b76308fdad9e..2f211ae4d6e8 100644
--- a/drivers/thermal/tegra/tegra132-soctherm.c
+++ b/drivers/thermal/tegra/tegra132-soctherm.c
@@ -129,7 +129,6 @@ static struct tegra_tsensor tegra132_tsensors[] = {
 		.name = "cpu0",
 		.base = 0xc0,
 		.config = &tegra132_tsensor_config,
-		.calib_fuse_offset = 0x098,
 		.fuse_corr_alpha = 1126600,
 		.fuse_corr_beta = -9433500,
 		.group = &tegra132_tsensor_group_cpu,
@@ -137,7 +136,6 @@ static struct tegra_tsensor tegra132_tsensors[] = {
 		.name = "cpu1",
 		.base = 0xe0,
 		.config = &tegra132_tsensor_config,
-		.calib_fuse_offset = 0x084,
 		.fuse_corr_alpha = 1110800,
 		.fuse_corr_beta = -7383000,
 		.group = &tegra132_tsensor_group_cpu,
@@ -145,7 +143,6 @@ static struct tegra_tsensor tegra132_tsensors[] = {
 		.name = "cpu2",
 		.base = 0x100,
 		.config = &tegra132_tsensor_config,
-		.calib_fuse_offset = 0x088,
 		.fuse_corr_alpha = 1113800,
 		.fuse_corr_beta = -6215200,
 		.group = &tegra132_tsensor_group_cpu,
@@ -153,7 +150,6 @@ static struct tegra_tsensor tegra132_tsensors[] = {
 		.name = "cpu3",
 		.base = 0x120,
 		.config = &tegra132_tsensor_config,
-		.calib_fuse_offset = 0x12c,
 		.fuse_corr_alpha = 1129600,
 		.fuse_corr_beta = -8196100,
 		.group = &tegra132_tsensor_group_cpu,
@@ -161,7 +157,6 @@ static struct tegra_tsensor tegra132_tsensors[] = {
 		.name = "mem0",
 		.base = 0x140,
 		.config = &tegra132_tsensor_config,
-		.calib_fuse_offset = 0x158,
 		.fuse_corr_alpha = 1132900,
 		.fuse_corr_beta = -6755300,
 		.group = &tegra132_tsensor_group_mem,
@@ -169,7 +164,6 @@ static struct tegra_tsensor tegra132_tsensors[] = {
 		.name = "mem1",
 		.base = 0x160,
 		.config = &tegra132_tsensor_config,
-		.calib_fuse_offset = 0x15c,
 		.fuse_corr_alpha = 1142300,
 		.fuse_corr_beta = -7374200,
 		.group = &tegra132_tsensor_group_mem,
@@ -177,7 +171,6 @@ static struct tegra_tsensor tegra132_tsensors[] = {
 		.name = "gpu",
 		.base = 0x180,
 		.config = &tegra132_tsensor_config,
-		.calib_fuse_offset = 0x154,
 		.fuse_corr_alpha = 1125100,
 		.fuse_corr_beta = -6350400,
 		.group = &tegra132_tsensor_group_gpu,
@@ -185,7 +178,6 @@ static struct tegra_tsensor tegra132_tsensors[] = {
 		.name = "pllx",
 		.base = 0x1a0,
 		.config = &tegra132_tsensor_config,
-		.calib_fuse_offset = 0x160,
 		.fuse_corr_alpha = 1118100,
 		.fuse_corr_beta = -8208800,
 		.group = &tegra132_tsensor_group_pll,
diff --git a/drivers/thermal/tegra/tegra210-soctherm.c b/drivers/thermal/tegra/tegra210-soctherm.c
index d0ff793f18c5..b2f3c775c1bb 100644
--- a/drivers/thermal/tegra/tegra210-soctherm.c
+++ b/drivers/thermal/tegra/tegra210-soctherm.c
@@ -130,7 +130,6 @@ static const struct tegra_tsensor tegra210_tsensors[] = {
 		.name = "cpu0",
 		.base = 0xc0,
 		.config = &tegra210_tsensor_config,
-		.calib_fuse_offset = 0x098,
 		.fuse_corr_alpha = 1085000,
 		.fuse_corr_beta = 3244200,
 		.group = &tegra210_tsensor_group_cpu,
@@ -138,7 +137,6 @@ static const struct tegra_tsensor tegra210_tsensors[] = {
 		.name = "cpu1",
 		.base = 0xe0,
 		.config = &tegra210_tsensor_config,
-		.calib_fuse_offset = 0x084,
 		.fuse_corr_alpha = 1126200,
 		.fuse_corr_beta = -67500,
 		.group = &tegra210_tsensor_group_cpu,
@@ -146,7 +144,6 @@ static const struct tegra_tsensor tegra210_tsensors[] = {
 		.name = "cpu2",
 		.base = 0x100,
 		.config = &tegra210_tsensor_config,
-		.calib_fuse_offset = 0x088,
 		.fuse_corr_alpha = 1098400,
 		.fuse_corr_beta = 2251100,
 		.group = &tegra210_tsensor_group_cpu,
@@ -154,7 +151,6 @@ static const struct tegra_tsensor tegra210_tsensors[] = {
 		.name = "cpu3",
 		.base = 0x120,
 		.config = &tegra210_tsensor_config,
-		.calib_fuse_offset = 0x12c,
 		.fuse_corr_alpha = 1108000,
 		.fuse_corr_beta = 602700,
 		.group = &tegra210_tsensor_group_cpu,
@@ -162,7 +158,6 @@ static const struct tegra_tsensor tegra210_tsensors[] = {
 		.name = "mem0",
 		.base = 0x140,
 		.config = &tegra210_tsensor_config,
-		.calib_fuse_offset = 0x158,
 		.fuse_corr_alpha = 1069200,
 		.fuse_corr_beta = 3549900,
 		.group = &tegra210_tsensor_group_mem,
@@ -170,7 +165,6 @@ static const struct tegra_tsensor tegra210_tsensors[] = {
 		.name = "mem1",
 		.base = 0x160,
 		.config = &tegra210_tsensor_config,
-		.calib_fuse_offset = 0x15c,
 		.fuse_corr_alpha = 1173700,
 		.fuse_corr_beta = -6263600,
 		.group = &tegra210_tsensor_group_mem,
@@ -178,7 +172,6 @@ static const struct tegra_tsensor tegra210_tsensors[] = {
 		.name = "gpu",
 		.base = 0x180,
 		.config = &tegra210_tsensor_config,
-		.calib_fuse_offset = 0x154,
 		.fuse_corr_alpha = 1074300,
 		.fuse_corr_beta = 2734900,
 		.group = &tegra210_tsensor_group_gpu,
@@ -186,7 +179,6 @@ static const struct tegra_tsensor tegra210_tsensors[] = {
 		.name = "pllx",
 		.base = 0x1a0,
 		.config = &tegra210_tsensor_config,
-		.calib_fuse_offset = 0x160,
 		.fuse_corr_alpha = 1039700,
 		.fuse_corr_beta = 6829100,
 		.group = &tegra210_tsensor_group_pll,
-- 
2.22.0


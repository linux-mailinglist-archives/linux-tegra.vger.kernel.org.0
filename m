Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D197396B24
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Jun 2021 04:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232625AbhFACfJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 31 May 2021 22:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232544AbhFACfI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 31 May 2021 22:35:08 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CBEEC061574;
        Mon, 31 May 2021 19:33:27 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id t17so7482735ljk.7;
        Mon, 31 May 2021 19:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i3Db6hbvHeZRlQz3yJZ5MPocVpsCmv5ymDT86VWu2zQ=;
        b=eexriI1CcyYDxiv7XCEde+ex/QbGMVRoTPTmzljVWlEdNijTdy5xISlCZ3UY/kzKPI
         Fd2FalflqR3ucXIDbMa+uyyGs98/Mcrhl8XlneTa7bzDV+deqANNmk1RNXJ/GT8dFt/D
         zH9JrV5GhIQroyCmS3MaoWOzfRfcUCNYePdu+8tIODWYPhenWookV12rcFtTDrtQ7a/9
         YwoCyDGRlODmq6bi+43L1rLtyYb8GsGBIEazQmYmgqhEUa7m7zmPV6BHK7sEGG7Ntrw5
         UcnDc5ni0xFT0iNYdC4QPtp670Z7zL+x7Op83FrF4DImiJb3upqB/KaNuds2GTAWjwR1
         1d/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i3Db6hbvHeZRlQz3yJZ5MPocVpsCmv5ymDT86VWu2zQ=;
        b=qADVZgZvEvO0gVtTVent8ahQoXqg9kY5FjywSbWIKhsps2PjuBbwGaTWKBODpLr4A5
         sspRMvf5XUvxMvjN2/xwz1xtSa+LGUzkgRBwmLpeDQzQ1AbG5vp/v/Ac42ozPncLjZ4B
         82ya0oci02EWTh7MH+vwjOy+vIvYbYjVMP4p5JfzauMYG/WdTRb5sd9BoDL6zxC4Dc8c
         108WTtxj3Fd6BgVrnqiuck8a2k+IX1CP8tlftDVDjpH1Uz3CkmYcGDE3XlePg+bA5z1C
         HmqNJ8HvJxW9/HZkHcfoOujnrXkF1ZXN6/qjiRdJMiOcDIM6tdEX2H6b/8GlHYwiSRGx
         SFvw==
X-Gm-Message-State: AOAM532XZoUrjhuJQQGFv2lnMvAYjujJLaDLQgdOjZR0OM1yxU3S+3WI
        1OmYOYCJzkDyu03D7W0MnQM=
X-Google-Smtp-Source: ABdhPJyRUUhqjtAmnu3RkmLaQmc9d40XBu/+GXOXcOCxUhycgS0M771n6F24+ipZG2lQfo3UkQJnhA==
X-Received: by 2002:a2e:6e09:: with SMTP id j9mr18728000ljc.151.1622514805622;
        Mon, 31 May 2021 19:33:25 -0700 (PDT)
Received: from localhost.localdomain (79-139-170-222.dynamic.spd-mgts.ru. [79.139.170.222])
        by smtp.gmail.com with ESMTPSA id l21sm107848lfc.28.2021.05.31.19.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 19:33:25 -0700 (PDT)
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
Subject: [PATCH v6 02/14] soc/tegra: regulators: Bump voltages on system reboot
Date:   Tue,  1 Jun 2021 05:31:07 +0300
Message-Id: <20210601023119.22044-3-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210601023119.22044-1-digetx@gmail.com>
References: <20210601023119.22044-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Ensure that SoC voltages are at a level suitable for a system reboot.
This is important for some devices that use CPU reset method for the
rebooting. SoC CPU and core voltages now are be restored to a level
that is suitable for rebooting. This patch fixes hang on reboot on
Asus Transformer TF101, it was also reported as fixing some of reboot
issues on Toshiba AC100.

Reported-by: Nikola Milosavljević <mnidza@outlook.com>
Tested-by: Nikola Milosavljević <mnidza@outlook.com> # TF101
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/regulators-tegra20.c | 75 +++++++++++++++++++++++++-
 drivers/soc/tegra/regulators-tegra30.c | 75 +++++++++++++++++++++++++-
 2 files changed, 148 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/regulators-tegra20.c b/drivers/soc/tegra/regulators-tegra20.c
index 367a71a3cd10..3479be5ee494 100644
--- a/drivers/soc/tegra/regulators-tegra20.c
+++ b/drivers/soc/tegra/regulators-tegra20.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regulator/coupler.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
@@ -21,7 +22,10 @@ struct tegra_regulator_coupler {
 	struct regulator_dev *core_rdev;
 	struct regulator_dev *cpu_rdev;
 	struct regulator_dev *rtc_rdev;
-	int core_min_uV;
+	struct notifier_block reboot_notifier;
+	int core_min_uV, cpu_min_uV;
+	bool sys_reboot_mode_req;
+	bool sys_reboot_mode;
 };
 
 static inline struct tegra_regulator_coupler *
@@ -242,6 +246,10 @@ static int tegra20_cpu_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (cpu_uV < 0)
 		return cpu_uV;
 
+	/* store boot voltage level */
+	if (!tegra->cpu_min_uV)
+		tegra->cpu_min_uV = cpu_uV;
+
 	/*
 	 * CPU's regulator may not have any consumers, hence the voltage
 	 * must not be changed in that case because CPU simply won't
@@ -250,6 +258,10 @@ static int tegra20_cpu_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (!cpu_min_uV_consumers)
 		cpu_min_uV = cpu_uV;
 
+	/* restore boot voltage level */
+	if (tegra->sys_reboot_mode)
+		cpu_min_uV = max(cpu_min_uV, tegra->cpu_min_uV);
+
 	if (cpu_min_uV > cpu_uV) {
 		err = tegra20_core_rtc_update(tegra, core_rdev, rtc_rdev,
 					      cpu_uV, cpu_min_uV);
@@ -290,6 +302,8 @@ static int tegra20_regulator_balance_voltage(struct regulator_coupler *coupler,
 		return -EINVAL;
 	}
 
+	tegra->sys_reboot_mode = READ_ONCE(tegra->sys_reboot_mode_req);
+
 	if (rdev == cpu_rdev)
 		return tegra20_cpu_voltage_update(tegra, cpu_rdev,
 						  core_rdev, rtc_rdev);
@@ -303,6 +317,51 @@ static int tegra20_regulator_balance_voltage(struct regulator_coupler *coupler,
 	return -EPERM;
 }
 
+static int tegra20_regulator_prepare_reboot(struct tegra_regulator_coupler *tegra,
+					    bool sys_reboot_mode)
+{
+	int err;
+
+	if (!tegra->core_rdev || !tegra->rtc_rdev || !tegra->cpu_rdev)
+		return 0;
+
+	WRITE_ONCE(tegra->sys_reboot_mode_req, true);
+
+	/*
+	 * Some devices use CPU soft-reboot method and in this case we
+	 * should ensure that voltages are sane for the reboot by restoring
+	 * the minimum boot levels.
+	 */
+	err = regulator_sync_voltage_rdev(tegra->cpu_rdev);
+	if (err)
+		return err;
+
+	err = regulator_sync_voltage_rdev(tegra->core_rdev);
+	if (err)
+		return err;
+
+	WRITE_ONCE(tegra->sys_reboot_mode_req, sys_reboot_mode);
+
+	return 0;
+}
+
+static int tegra20_regulator_reboot(struct notifier_block *notifier,
+				    unsigned long event, void *cmd)
+{
+	struct tegra_regulator_coupler *tegra;
+	int ret;
+
+	if (event != SYS_RESTART)
+		return NOTIFY_DONE;
+
+	tegra = container_of(notifier, struct tegra_regulator_coupler,
+			     reboot_notifier);
+
+	ret = tegra20_regulator_prepare_reboot(tegra, true);
+
+	return notifier_from_errno(ret);
+}
+
 static int tegra20_regulator_attach(struct regulator_coupler *coupler,
 				    struct regulator_dev *rdev)
 {
@@ -335,6 +394,14 @@ static int tegra20_regulator_detach(struct regulator_coupler *coupler,
 {
 	struct tegra_regulator_coupler *tegra = to_tegra_coupler(coupler);
 
+	/*
+	 * We don't expect regulators to be decoupled during reboot,
+	 * this may race with the reboot handler and shouldn't ever
+	 * happen in practice.
+	 */
+	if (WARN_ON_ONCE(system_state > SYSTEM_RUNNING))
+		return -EPERM;
+
 	if (tegra->core_rdev == rdev) {
 		tegra->core_rdev = NULL;
 		return 0;
@@ -359,13 +426,19 @@ static struct tegra_regulator_coupler tegra20_coupler = {
 		.detach_regulator = tegra20_regulator_detach,
 		.balance_voltage = tegra20_regulator_balance_voltage,
 	},
+	.reboot_notifier.notifier_call = tegra20_regulator_reboot,
 };
 
 static int __init tegra_regulator_coupler_init(void)
 {
+	int err;
+
 	if (!of_machine_is_compatible("nvidia,tegra20"))
 		return 0;
 
+	err = register_reboot_notifier(&tegra20_coupler.reboot_notifier);
+	WARN_ON(err);
+
 	return regulator_coupler_register(&tegra20_coupler.coupler);
 }
 arch_initcall(tegra_regulator_coupler_init);
diff --git a/drivers/soc/tegra/regulators-tegra30.c b/drivers/soc/tegra/regulators-tegra30.c
index 0e776b20f625..18fe53d0a870 100644
--- a/drivers/soc/tegra/regulators-tegra30.c
+++ b/drivers/soc/tegra/regulators-tegra30.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regulator/coupler.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
@@ -22,7 +23,10 @@ struct tegra_regulator_coupler {
 	struct regulator_coupler coupler;
 	struct regulator_dev *core_rdev;
 	struct regulator_dev *cpu_rdev;
-	int core_min_uV;
+	struct notifier_block reboot_notifier;
+	int core_min_uV, cpu_min_uV;
+	bool sys_reboot_mode_req;
+	bool sys_reboot_mode;
 };
 
 static inline struct tegra_regulator_coupler *
@@ -172,6 +176,10 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (cpu_uV < 0)
 		return cpu_uV;
 
+	/* store boot voltage level */
+	if (!tegra->cpu_min_uV)
+		tegra->cpu_min_uV = cpu_uV;
+
 	/*
 	 * CPU's regulator may not have any consumers, hence the voltage
 	 * must not be changed in that case because CPU simply won't
@@ -195,6 +203,10 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (err)
 		return err;
 
+	/* restore boot voltage level */
+	if (tegra->sys_reboot_mode)
+		cpu_min_uV = max(cpu_min_uV, tegra->cpu_min_uV);
+
 	if (core_min_limited_uV > core_uV) {
 		pr_err("core voltage constraint violated: %d %d %d\n",
 		       core_uV, core_min_limited_uV, cpu_uV);
@@ -263,9 +275,56 @@ static int tegra30_regulator_balance_voltage(struct regulator_coupler *coupler,
 		return -EINVAL;
 	}
 
+	tegra->sys_reboot_mode = READ_ONCE(tegra->sys_reboot_mode_req);
+
 	return tegra30_voltage_update(tegra, cpu_rdev, core_rdev);
 }
 
+static int tegra30_regulator_prepare_reboot(struct tegra_regulator_coupler *tegra,
+					    bool sys_reboot_mode)
+{
+	int err;
+
+	if (!tegra->core_rdev || !tegra->cpu_rdev)
+		return 0;
+
+	WRITE_ONCE(tegra->sys_reboot_mode_req, true);
+
+	/*
+	 * Some devices use CPU soft-reboot method and in this case we
+	 * should ensure that voltages are sane for the reboot by restoring
+	 * the minimum boot levels.
+	 */
+	err = regulator_sync_voltage_rdev(tegra->cpu_rdev);
+	if (err)
+		return err;
+
+	err = regulator_sync_voltage_rdev(tegra->core_rdev);
+	if (err)
+		return err;
+
+	WRITE_ONCE(tegra->sys_reboot_mode_req, sys_reboot_mode);
+
+	return 0;
+}
+
+static int tegra30_regulator_reboot(struct notifier_block *notifier,
+				    unsigned long event, void *cmd)
+{
+	struct tegra_regulator_coupler *tegra;
+	int ret;
+
+	if (event != SYS_RESTART)
+		return NOTIFY_DONE;
+
+	tegra = container_of(notifier, struct tegra_regulator_coupler,
+			     reboot_notifier);
+
+	ret = tegra30_regulator_prepare_reboot(tegra, true);
+
+	return notifier_from_errno(ret);
+}
+
 static int tegra30_regulator_attach(struct regulator_coupler *coupler,
 				    struct regulator_dev *rdev)
 {
@@ -292,6 +351,14 @@ static int tegra30_regulator_detach(struct regulator_coupler *coupler,
 {
 	struct tegra_regulator_coupler *tegra = to_tegra_coupler(coupler);
 
+	/*
+	 * We don't expect regulators to be decoupled during reboot,
+	 * this may race with the reboot handler and shouldn't ever
+	 * happen in practice.
+	 */
+	if (WARN_ON_ONCE(system_state > SYSTEM_RUNNING))
+		return -EPERM;
+
 	if (tegra->core_rdev == rdev) {
 		tegra->core_rdev = NULL;
 		return 0;
@@ -311,13 +378,19 @@ static struct tegra_regulator_coupler tegra30_coupler = {
 		.detach_regulator = tegra30_regulator_detach,
 		.balance_voltage = tegra30_regulator_balance_voltage,
 	},
+	.reboot_notifier.notifier_call = tegra30_regulator_reboot,
 };
 
 static int __init tegra_regulator_coupler_init(void)
 {
+	int err;
+
 	if (!of_machine_is_compatible("nvidia,tegra30"))
 		return 0;
 
+	err = register_reboot_notifier(&tegra30_coupler.reboot_notifier);
+	WARN_ON(err);
+
 	return regulator_coupler_register(&tegra30_coupler.coupler);
 }
 arch_initcall(tegra_regulator_coupler_init);
-- 
2.30.2


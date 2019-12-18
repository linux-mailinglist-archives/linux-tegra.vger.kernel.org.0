Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93CA1125431
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 22:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbfLRVHP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 16:07:15 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36957 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbfLRVG5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 16:06:57 -0500
Received: by mail-lf1-f66.google.com with SMTP id b15so2734081lfc.4;
        Wed, 18 Dec 2019 13:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZKEEZIia8R+ufMZWjFtVAJL8Wre5/H1rF2/jJQIGBGg=;
        b=MmwNue9TctTSkJGxe+v1oSIctqsaVEA/leGRcn9UQ8C8sItYno0l90KgFGlw/rB7Ge
         QzBU8f55bffjn+RGGwWaUvBdW+nMw7BpJui0oaCMzsWvnPTUEHQW6JVnRbZC5XJmg10l
         woxtBcKxL6icL2ML0NJdYYenDx/ZtnluAYI/4FqYC0weWzsX1d3zi7FQMBtc/TuVU5LC
         qioj1h9tQiux4vIiwjDvuyrxgN/ckjc0gI0/5vcEZix3pXe6SyI0+dVDX2iuI7tF2bgC
         moDNSTRYb0LConYPojrpxszwVM/0NCT+93EqXAIKdiyBHPlFiraHKsU3Z9NdA9hPi5Hb
         lUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZKEEZIia8R+ufMZWjFtVAJL8Wre5/H1rF2/jJQIGBGg=;
        b=OW0Es3a/sBeuaiPlGeyJNJ0oobLBkrmkK+hsWoEREssLL1Ry9499G4YuyxlX4YDoST
         7a4RgTkHHzSoocCS+UCTeMlGzg3QwPkYo5hKvFAVRf2KyWBav1QfKIYNipPnMxAelmBx
         2IAU0qcB45i4BXwbTGNkemL6i7qXWtVF0x3vcQzz8LKsZjnXrUWHjdKCIqwCO8ZkzLn/
         /M20Pa4AD1nrKvmLBS3HhrtzBZyeQekI+6PjxLiiC7ahzg07JO8fbUqIkaiZ8ijUM6lN
         vaItva9lGtPBHhA2JKQHWYjtLjMyeV5h2AbD32VHtSqAMuG4Y8Nq14wetAEhJj9rCkii
         ZufQ==
X-Gm-Message-State: APjAAAW/pq3tkCxNw00ZaEka8a2IXMDhQ5Wp/ElM1nQi5x2TNqlnWfSA
        o6Ipskv28Gmz+M8V7sq4EJs=
X-Google-Smtp-Source: APXvYqxEAZZkjxVZlfuVwyUCnrC87vt6RcGbCpb+xD3vgDJX1pDYBKXuS6i6uK3nopOkJC13HHGdmw==
X-Received: by 2002:a19:5007:: with SMTP id e7mr3123166lfb.153.1576703214235;
        Wed, 18 Dec 2019 13:06:54 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id r15sm1754648ljk.3.2019.12.18.13.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 13:06:53 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 14/17] cpuidle: tegra: Squash Tegra114 driver into the common driver
Date:   Thu, 19 Dec 2019 00:05:00 +0300
Message-Id: <20191218210503.6689-15-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191218210503.6689-1-digetx@gmail.com>
References: <20191218210503.6689-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra20/30/114/124 SoCs have common idling states, thus there is no much
point in having separate drivers for a similar hardware. This patch moves
Tegra114/124 arch/ drivers into the common driver without any functional
changes. The CC6 state is kept disabled on Tegra114/124 because the core
Tegra PM code needs some more work in order to support that state.

Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/Makefile           |  7 --
 arch/arm/mach-tegra/cpuidle-tegra114.c | 90 --------------------------
 arch/arm/mach-tegra/cpuidle.c          | 37 -----------
 arch/arm/mach-tegra/cpuidle.h          | 16 -----
 arch/arm/mach-tegra/tegra.c            |  6 +-
 drivers/cpuidle/cpuidle-tegra.c        | 45 ++++++++++++-
 6 files changed, 48 insertions(+), 153 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra114.c
 delete mode 100644 arch/arm/mach-tegra/cpuidle.c
 delete mode 100644 arch/arm/mach-tegra/cpuidle.h

diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index 99c5f4274e5c..07572b5373b8 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -10,19 +10,12 @@ obj-y					+= sleep.o
 obj-y					+= tegra.o
 obj-y					+= sleep-tegra20.o
 obj-y					+= sleep-tegra30.o
-obj-$(CONFIG_CPU_IDLE)			+= cpuidle.o
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= pm-tegra20.o
 obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= pm-tegra30.o
 obj-$(CONFIG_SMP)			+= platsmp.o
 obj-$(CONFIG_HOTPLUG_CPU)               += hotplug.o
 
 obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= pm-tegra30.o
-ifeq ($(CONFIG_CPU_IDLE),y)
-obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= cpuidle-tegra114.o
-endif
 obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= pm-tegra30.o
-ifeq ($(CONFIG_CPU_IDLE),y)
-obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= cpuidle-tegra114.o
-endif
 
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= board-paz00.o
diff --git a/arch/arm/mach-tegra/cpuidle-tegra114.c b/arch/arm/mach-tegra/cpuidle-tegra114.c
deleted file mode 100644
index 858c30cc5dc7..000000000000
--- a/arch/arm/mach-tegra/cpuidle-tegra114.c
+++ /dev/null
@@ -1,90 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2013, NVIDIA Corporation. All rights reserved.
- */
-
-#include <asm/firmware.h>
-#include <linux/tick.h>
-#include <linux/cpuidle.h>
-#include <linux/cpu_pm.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-#include <linux/firmware/trusted_foundations.h>
-
-#include <soc/tegra/pm.h>
-
-#include <asm/cpuidle.h>
-#include <asm/smp_plat.h>
-#include <asm/suspend.h>
-#include <asm/psci.h>
-
-#include "cpuidle.h"
-#include "sleep.h"
-
-#ifdef CONFIG_PM_SLEEP
-#define TEGRA114_MAX_STATES 2
-#else
-#define TEGRA114_MAX_STATES 1
-#endif
-
-#ifdef CONFIG_PM_SLEEP
-static int tegra114_idle_power_down(struct cpuidle_device *dev,
-				    struct cpuidle_driver *drv,
-				    int index)
-{
-	local_fiq_disable();
-
-	tegra_pm_set_cpu_in_lp2();
-	cpu_pm_enter();
-
-	call_firmware_op(prepare_idle, TF_PM_MODE_LP2_NOFLUSH_L2);
-
-	/* Do suspend by ourselves if the firmware does not implement it */
-	if (call_firmware_op(do_idle, 0) == -ENOSYS)
-		cpu_suspend(0, tegra30_pm_secondary_cpu_suspend);
-
-	cpu_pm_exit();
-	tegra_pm_clear_cpu_in_lp2();
-
-	local_fiq_enable();
-
-	return index;
-}
-
-static void tegra114_idle_enter_s2idle(struct cpuidle_device *dev,
-				       struct cpuidle_driver *drv,
-				       int index)
-{
-       tegra114_idle_power_down(dev, drv, index);
-}
-#endif
-
-static struct cpuidle_driver tegra_idle_driver = {
-	.name = "tegra_idle",
-	.owner = THIS_MODULE,
-	.state_count = TEGRA114_MAX_STATES,
-	.states = {
-		[0] = ARM_CPUIDLE_WFI_STATE_PWR(600),
-#ifdef CONFIG_PM_SLEEP
-		[1] = {
-			.enter			= tegra114_idle_power_down,
-			.enter_s2idle		= tegra114_idle_enter_s2idle,
-			.exit_latency		= 500,
-			.target_residency	= 1000,
-			.flags			= CPUIDLE_FLAG_TIMER_STOP,
-			.power_usage		= 0,
-			.name			= "powered-down",
-			.desc			= "CPU power gated",
-		},
-#endif
-	},
-};
-
-int __init tegra114_cpuidle_init(void)
-{
-	if (!psci_smp_available())
-		return cpuidle_register(&tegra_idle_driver, NULL);
-
-	return 0;
-}
diff --git a/arch/arm/mach-tegra/cpuidle.c b/arch/arm/mach-tegra/cpuidle.c
deleted file mode 100644
index fa0dcf3c2c45..000000000000
--- a/arch/arm/mach-tegra/cpuidle.c
+++ /dev/null
@@ -1,37 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * arch/arm/mach-tegra/cpuidle.c
- *
- * CPU idle driver for Tegra CPUs
- *
- * Copyright (c) 2010-2012, NVIDIA Corporation.
- * Copyright (c) 2011 Google, Inc.
- * Author: Colin Cross <ccross@android.com>
- *         Gary King <gking@nvidia.com>
- *
- * Rework for 3.3 by Peter De Schrijver <pdeschrijver@nvidia.com>
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-
-#include <soc/tegra/fuse.h>
-
-#include "cpuidle.h"
-
-void __init tegra_cpuidle_init(void)
-{
-	switch (tegra_get_chip_id()) {
-	case TEGRA20:
-	case TEGRA30:
-		platform_device_register_simple("tegra-cpuidle", -1, NULL, 0);
-		break;
-	case TEGRA114:
-	case TEGRA124:
-		if (IS_ENABLED(CONFIG_ARCH_TEGRA_114_SOC) ||
-		    IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC))
-			tegra114_cpuidle_init();
-		break;
-	}
-}
diff --git a/arch/arm/mach-tegra/cpuidle.h b/arch/arm/mach-tegra/cpuidle.h
deleted file mode 100644
index 5423a05a69f6..000000000000
--- a/arch/arm/mach-tegra/cpuidle.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2012, NVIDIA Corporation. All rights reserved.
- */
-
-#ifndef __MACH_TEGRA_CPUIDLE_H
-#define __MACH_TEGRA_CPUIDLE_H
-
-#ifdef CONFIG_CPU_IDLE
-int tegra114_cpuidle_init(void);
-void tegra_cpuidle_init(void);
-#else
-static inline void tegra_cpuidle_init(void) {}
-#endif
-
-#endif
diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index 79184a077c84..eeacff626546 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -36,11 +36,11 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/time.h>
 #include <asm/mach-types.h>
+#include <asm/psci.h>
 #include <asm/setup.h>
 
 #include "board.h"
 #include "common.h"
-#include "cpuidle.h"
 #include "iomap.h"
 #include "pm.h"
 #include "reset.h"
@@ -85,7 +85,6 @@ static void __init tegra_dt_init(void)
 static void __init tegra_dt_init_late(void)
 {
 	tegra_init_suspend();
-	tegra_cpuidle_init();
 
 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
 	    of_machine_is_compatible("compal,paz00"))
@@ -98,6 +97,9 @@ static void __init tegra_dt_init_late(void)
 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_3x_SOC) &&
 	    of_machine_is_compatible("nvidia,tegra30"))
 		platform_device_register_simple("tegra20-cpufreq", -1, NULL, 0);
+
+	if (IS_ENABLED(CONFIG_ARM_TEGRA_CPUIDLE) && !psci_smp_available())
+		platform_device_register_simple("tegra-cpuidle", -1, NULL, 0);
 }
 
 static const char * const tegra_dt_board_compat[] = {
diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
index 59398c76cf68..b6cdad8437af 100644
--- a/drivers/cpuidle/cpuidle-tegra.c
+++ b/drivers/cpuidle/cpuidle-tegra.c
@@ -24,6 +24,7 @@
 #include <linux/types.h>
 
 #include <linux/clk/tegra.h>
+#include <linux/firmware/trusted_foundations.h>
 
 #include <soc/tegra/cpuidle.h>
 #include <soc/tegra/flowctrl.h>
@@ -32,6 +33,7 @@
 #include <soc/tegra/pm.h>
 
 #include <asm/cpuidle.h>
+#include <asm/firmware.h>
 #include <asm/smp_plat.h>
 #include <asm/suspend.h>
 
@@ -45,6 +47,11 @@ enum tegra_state {
 static atomic_t tegra_idle_barrier;
 static atomic_t tegra_abort_flag;
 
+static inline bool tegra_cpuidle_using_firmware(void)
+{
+	return firmware_ops->prepare_idle && firmware_ops->do_idle;
+}
+
 static void tegra_cpuidle_report_cpus_state(void)
 {
 	unsigned long cpu, lcpu, csr;
@@ -122,6 +129,16 @@ static int tegra_cpuidle_cc6_enter(unsigned int cpu)
 
 static int tegra_cpuidle_c7_enter(void)
 {
+	int err;
+
+	if (tegra_cpuidle_using_firmware()) {
+		err = call_firmware_op(prepare_idle, TF_PM_MODE_LP2_NOFLUSH_L2);
+		if (err)
+			return err;
+
+		return call_firmware_op(do_idle, 0);
+	}
+
 	return cpu_suspend(0, tegra30_pm_secondary_cpu_suspend);
 }
 
@@ -232,6 +249,13 @@ static int tegra_cpuidle_enter(struct cpuidle_device *dev,
 	return err ? -1 : index;
 }
 
+static void tegra114_enter_s2idle(struct cpuidle_device *dev,
+				  struct cpuidle_driver *drv,
+				  int index)
+{
+	tegra_cpuidle_enter(dev, drv, index);
+}
+
 /*
  * The previous versions of Tegra CPUIDLE driver used a different "legacy"
  * terminology for naming of the idling states, while this driver uses the
@@ -299,6 +323,15 @@ void tegra_cpuidle_pcie_irqs_in_use(void)
 	tegra_cpuidle_disable_state(TEGRA_CC6);
 }
 
+static void tegra_cpuidle_setup_tegra114_c7_state(void)
+{
+	struct cpuidle_state *s = &tegra_idle_driver.states[TEGRA_C7];
+
+	s->enter_s2idle = tegra114_enter_s2idle;
+	s->target_residency = 1000;
+	s->exit_latency = 500;
+}
+
 static int tegra_cpuidle_probe(struct platform_device *pdev)
 {
 	/*
@@ -307,7 +340,9 @@ static int tegra_cpuidle_probe(struct platform_device *pdev)
 	 * is disabled.
 	 */
 	if (!IS_ENABLED(CONFIG_PM_SLEEP)) {
-		tegra_cpuidle_disable_state(TEGRA_C7);
+		if (!tegra_cpuidle_using_firmware())
+			tegra_cpuidle_disable_state(TEGRA_C7);
+
 		tegra_cpuidle_disable_state(TEGRA_CC6);
 	}
 
@@ -325,6 +360,14 @@ static int tegra_cpuidle_probe(struct platform_device *pdev)
 		tegra_cpuidle_disable_state(TEGRA_CC6);
 		break;
 
+	case TEGRA114:
+	case TEGRA124:
+		tegra_cpuidle_setup_tegra114_c7_state();
+
+		/* coupled CC6 (LP2) state isn't implemented yet */
+		tegra_cpuidle_disable_state(TEGRA_CC6);
+		break;
+
 	default:
 		return -EINVAL;
 	}
-- 
2.24.0


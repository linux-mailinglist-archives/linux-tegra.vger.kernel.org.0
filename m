Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 754F916B457
	for <lists+linux-tegra@lfdr.de>; Mon, 24 Feb 2020 23:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbgBXWmp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 24 Feb 2020 17:42:45 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34026 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728286AbgBXWml (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Feb 2020 17:42:41 -0500
Received: by mail-lf1-f68.google.com with SMTP id l18so8090450lfc.1;
        Mon, 24 Feb 2020 14:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yZz7QgsxQ4uyx68/8153bWEF0AWiZKqVTKgRumgoQuo=;
        b=VTWpPhMPY/gx2kYMEUN0bcpzny+WbY64scqPHNOglRbpaEes0HkOBMGJrhNnDkvdsT
         ros54ymnoKNq89puC32FdFFJo21jCQxkK//dpNkclWvl0wXfbyLw25slQfbTeJSoP6/a
         RNueTam9dBZQrxa9ZM7l+bYSmEDNnS8eN7V1DWyU7u4b3IJnQv4uNrmi7Nk5cayz9/og
         xZ3bLWjvijbK+FKRgtrk5bSokdklCmSn4v1LtESJNmAiCAN5KTlxLHp5ivFPXRDcUdtZ
         6E2xvc7vTUP+DtFMq8PQSIQ5HW2TKYnhtopuxiYU+QeTNWILYRx4tumn5ygLamEPeUra
         jCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yZz7QgsxQ4uyx68/8153bWEF0AWiZKqVTKgRumgoQuo=;
        b=k1bKTJo3q/zeI95eHNCAPOeYQ8ZXAxEGUev2A4hRP6k/KlgTUiNiKo6hy0/cdGQipT
         AgI+Mg8ErMAAP6+Se4/mLg9Jhzdlh1QghxPSnkDx0SlmgTTbYAuCVEYk5BFr2hoMrArC
         GAyAfFUFoORhDtUNx14hBx3tpwXHOrfnvRZPwZO9CBT4i4p4BpVO75ORSPyKvARpb7K9
         9L81U3SsYLs1C6m17XJJeQneKYqJi+VLmmzd6ZT0HYDPjD/eRGxTfVyH24BLoLMU1wGB
         OZbn7YOf0qpTRl0eIGS0NO8R+l4af+cehAnAacCAXh0gd2Vdz/lq3Jc3BN8iC96U8Hv5
         7nFA==
X-Gm-Message-State: APjAAAVZQupqfDZ9vh6rKFVMJHJggubrSLw7V0sRUqrtEv2RZVhKg1wC
        hdZxofyaEJFAfuXGvVLRsQu5epzJ
X-Google-Smtp-Source: APXvYqzCvMTAV5yJ1CoyECAEZ/p0qK9Jx4VB6LK1pFm/2xFPOOUyURrRfdJT7UJqZNPdEoVeuuoWQQ==
X-Received: by 2002:a19:6a03:: with SMTP id u3mr3412917lfu.159.1582584159438;
        Mon, 24 Feb 2020 14:42:39 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id j7sm6264833lfh.25.2020.02.24.14.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 14:42:38 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Jasper Korten <jja2000@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v11 05/17] ARM: tegra: Propagate error from tegra_idle_lp2_last()
Date:   Tue, 25 Feb 2020 01:40:45 +0300
Message-Id: <20200224224057.21877-6-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200224224057.21877-1-digetx@gmail.com>
References: <20200224224057.21877-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Technically cpu_suspend() may fail and it's never good to lose information
about failure. For example things like cpuidle core could correctly sample
idling time in the case of failure.

Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Jasper Korten <jja2000@gmail.com>
Tested-by: David Heidelberg <david@ixit.cz>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/cpuidle-tegra20.c | 6 ++++--
 arch/arm/mach-tegra/cpuidle-tegra30.c | 4 +---
 arch/arm/mach-tegra/pm.c              | 8 ++++++--
 arch/arm/mach-tegra/pm.h              | 2 +-
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-tegra/cpuidle-tegra20.c b/arch/arm/mach-tegra/cpuidle-tegra20.c
index 78c20025dcfe..b3087ece9421 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra20.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra20.c
@@ -86,15 +86,17 @@ static bool tegra20_cpu_cluster_power_down(struct cpuidle_device *dev,
 					   struct cpuidle_driver *drv,
 					   int index)
 {
+	bool ret;
+
 	while (!tegra_cpu_rail_off_ready())
 		cpu_relax();
 
-	tegra_idle_lp2_last();
+	ret = !tegra_idle_lp2_last();
 
 	if (cpu_online(1))
 		tegra20_wake_cpu1_from_reset();
 
-	return true;
+	return ret;
 }
 
 #ifdef CONFIG_SMP
diff --git a/arch/arm/mach-tegra/cpuidle-tegra30.c b/arch/arm/mach-tegra/cpuidle-tegra30.c
index a3ce8dabfe18..17cbd118abee 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra30.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra30.c
@@ -68,9 +68,7 @@ static bool tegra30_cpu_cluster_power_down(struct cpuidle_device *dev,
 		return false;
 	}
 
-	tegra_idle_lp2_last();
-
-	return true;
+	return !tegra_idle_lp2_last();
 }
 
 #ifdef CONFIG_SMP
diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index a72f9a2d3cb7..a094acaca307 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -189,14 +189,16 @@ static void tegra_pm_set(enum tegra_suspend_mode mode)
 	tegra_pmc_enter_suspend_mode(mode);
 }
 
-void tegra_idle_lp2_last(void)
+int tegra_idle_lp2_last(void)
 {
+	int err;
+
 	tegra_pm_set(TEGRA_SUSPEND_LP2);
 
 	cpu_cluster_pm_enter();
 	suspend_cpu_complex();
 
-	cpu_suspend(PHYS_OFFSET - PAGE_OFFSET, &tegra_sleep_cpu);
+	err = cpu_suspend(PHYS_OFFSET - PAGE_OFFSET, &tegra_sleep_cpu);
 
 	/*
 	 * Resume L2 cache if it wasn't re-enabled early during resume,
@@ -208,6 +210,8 @@ void tegra_idle_lp2_last(void)
 
 	restore_cpu_complex();
 	cpu_cluster_pm_exit();
+
+	return err;
 }
 
 enum tegra_suspend_mode tegra_pm_validate_suspend_mode(
diff --git a/arch/arm/mach-tegra/pm.h b/arch/arm/mach-tegra/pm.h
index 2c294f6365c0..7d72f31dee77 100644
--- a/arch/arm/mach-tegra/pm.h
+++ b/arch/arm/mach-tegra/pm.h
@@ -25,7 +25,7 @@ void tegra30_sleep_core_init(void);
 
 void tegra_clear_cpu_in_lp2(void);
 void tegra_set_cpu_in_lp2(void);
-void tegra_idle_lp2_last(void);
+int tegra_idle_lp2_last(void);
 extern void (*tegra_tear_down_cpu)(void);
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.24.0


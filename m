Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBA221A5E4
	for <lists+linux-tegra@lfdr.de>; Thu,  9 Jul 2020 19:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgGIRf5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 9 Jul 2020 13:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbgGIRf5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Jul 2020 13:35:57 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9C7C08C5CE;
        Thu,  9 Jul 2020 10:35:56 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b25so3340527ljp.6;
        Thu, 09 Jul 2020 10:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xuU5Q8xIDzmaQFjYQo9uczjci40WPV/HPdosDutctZM=;
        b=BgF7weBn+LAnPcRRxB5SUdxHkt2z1UOU1Liqkqn/2KXh5GPW1DAlyAMc0ce0+cmviy
         6P45eVQZj58xKwPcOYrlyHxlqaeYDvi42uJBzJoncP6bPsDbiJnPDIQJg4P1qJDtCw3y
         mRsFfgMikEYo1kZsj/HJEcjS2yWnYYKGMr05dBM2tuSC9w+PSXOiXwXhzN8o6AlFJNH0
         Dgz5awp3/JEdvi7E27n3c/DB4EC0uitrn1qgVRuRm/H4Es23/vFkuTwL8rekE5q2T4Fj
         vcpx6Kpen3TNhdzenYagkxumLY92sH69Mi3Vg4o1r+/GU4rjSobDvsCuXez13nJWkO2t
         iQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xuU5Q8xIDzmaQFjYQo9uczjci40WPV/HPdosDutctZM=;
        b=Pf2qxKehgUPReZ2PXfB8LxDDq46jOY0fGkkahIOqzo88DhjrL/icFwcVzrxbosI6zT
         6r8y7Nyv9WZH8nf/6YonSjuMU5n7Gk5klXUUJ/XaUfy6f6mjYmydtF8kbZo31IzntjAu
         KMZLCkpMIM6cM6haT70R706sSCCjvgP5rFesRgkB4OMLCARMhMw6ayT2e9Sf40LBh+Kj
         lgvWGMaNA96Y7lGg1PJUjElx+mkGUfLGAYoaCWnr9vY8dlmWscCiauhUdD+KNSSUY42e
         +grOERQ28KgU0EUh1WNISZ7fXfgcIK4nxLX1vVFCR8FPXyAUrzL7j6N4AiiOfRojWatc
         oW5w==
X-Gm-Message-State: AOAM531+xLYRmUFoanO+6/ZOgBGc6xFz0Or6OvSvHdDpEJFPEx2btd1+
        rt+q2hAa6Coej1DXexIXajQ=
X-Google-Smtp-Source: ABdhPJwMNagx5aPAsgSCgYLaxqLoJ1PHy5G/PtnHoKCJlZo4NmcLQdHJjVFavZMAuJYLB6VCT2Jcqg==
X-Received: by 2002:a2e:96d6:: with SMTP id d22mr18672557ljj.67.1594316155104;
        Thu, 09 Jul 2020 10:35:55 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id h9sm1015854lja.35.2020.07.09.10.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 10:35:54 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3] cpuidle: tegra: Correctly handle result of arm_cpuidle_simple_enter()
Date:   Thu,  9 Jul 2020 20:35:32 +0300
Message-Id: <20200709173532.15431-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The enter() callback of CPUIDLE drivers returns index of the entered idle
state on success or a negative value on failure. The negative value could
any negative value, i.e. it doesn't necessarily needs to be a error code.
That's because CPUIDLE core only cares about the fact of failure and not
about the reason of the enter() failure.

Like every other enter() callback, the arm_cpuidle_simple_enter() returns
the entered idle-index on success. Unlike some of other drivers, it never
fails. It happened that TEGRA_C1=index=err=0 in the code of cpuidle-tegra
driver, and thus, there is no problem for the cpuidle-tegra driver created
by the typo in the code which assumes that the arm_cpuidle_simple_enter()
returns a error code.

The arm_cpuidle_simple_enter() also may return a -ENODEV error if CPU_IDLE
is disabled in a kernel's config, but all CPUIDLE drivers are disabled if
CPU_IDLE is disabled, including the cpuidle-tegra driver. So we can't ever
see the error code from arm_cpuidle_simple_enter() today.

Of course the code may get some changes in the future and then the
typo may transform into a real bug, so let's correct the typo! The
tegra_cpuidle_state_enter() is now changed to make it return the entered
idle-index on success and negative error code on fail, which puts it on
par with the arm_cpuidle_simple_enter(), making code consistent in regards
to the error handling.

This patch fixes a minor typo in the code, it doesn't fix any bugs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v3: The tegra_cpuidle_state_enter() now returns entered idle-index on
    success instead of 0. Hence the error message will be shown by the
    tegra-cpuidle driver if arm_cpuidle_simple_enter() will ever fail.
    Again thanks to Jon Hunter!

v2: Improved commit message by clarifying what values are returned by
    arm_cpuidle_simple_enter() and when. Thanks to Jon Hunter for the
    suggestion!

 drivers/cpuidle/cpuidle-tegra.c | 34 +++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
index 150045849d78..30e6816c6737 100644
--- a/drivers/cpuidle/cpuidle-tegra.c
+++ b/drivers/cpuidle/cpuidle-tegra.c
@@ -172,7 +172,7 @@ static int tegra_cpuidle_coupled_barrier(struct cpuidle_device *dev)
 static int tegra_cpuidle_state_enter(struct cpuidle_device *dev,
 				     int index, unsigned int cpu)
 {
-	int ret;
+	int err;
 
 	/*
 	 * CC6 state is the "CPU cluster power-off" state.  In order to
@@ -183,9 +183,9 @@ static int tegra_cpuidle_state_enter(struct cpuidle_device *dev,
 	 * CPU cores, GIC and L2 cache).
 	 */
 	if (index == TEGRA_CC6) {
-		ret = tegra_cpuidle_coupled_barrier(dev);
-		if (ret)
-			return ret;
+		err = tegra_cpuidle_coupled_barrier(dev);
+		if (err)
+			return err;
 	}
 
 	local_fiq_disable();
@@ -194,15 +194,15 @@ static int tegra_cpuidle_state_enter(struct cpuidle_device *dev,
 
 	switch (index) {
 	case TEGRA_C7:
-		ret = tegra_cpuidle_c7_enter();
+		err = tegra_cpuidle_c7_enter();
 		break;
 
 	case TEGRA_CC6:
-		ret = tegra_cpuidle_cc6_enter(cpu);
+		err = tegra_cpuidle_cc6_enter(cpu);
 		break;
 
 	default:
-		ret = -EINVAL;
+		err = -EINVAL;
 		break;
 	}
 
@@ -210,7 +210,7 @@ static int tegra_cpuidle_state_enter(struct cpuidle_device *dev,
 	tegra_pm_clear_cpu_in_lp2();
 	local_fiq_enable();
 
-	return ret;
+	return err ?: index;
 }
 
 static int tegra_cpuidle_adjust_state_index(int index, unsigned int cpu)
@@ -236,21 +236,27 @@ static int tegra_cpuidle_enter(struct cpuidle_device *dev,
 			       int index)
 {
 	unsigned int cpu = cpu_logical_map(dev->cpu);
-	int err;
+	int ret;
 
 	index = tegra_cpuidle_adjust_state_index(index, cpu);
 	if (dev->states_usage[index].disable)
 		return -1;
 
 	if (index == TEGRA_C1)
-		err = arm_cpuidle_simple_enter(dev, drv, index);
+		ret = arm_cpuidle_simple_enter(dev, drv, index);
 	else
-		err = tegra_cpuidle_state_enter(dev, index, cpu);
+		ret = tegra_cpuidle_state_enter(dev, index, cpu);
 
-	if (err && (err != -EINTR || index != TEGRA_CC6))
-		pr_err_once("failed to enter state %d err: %d\n", index, err);
+	if (ret < 0) {
+		if (ret != -EINTR || index != TEGRA_CC6)
+			pr_err_once("failed to enter state %d err: %d\n",
+				    index, ret);
+		index = -1;
+	} else {
+		index = ret;
+	}
 
-	return err ? -1 : index;
+	return index;
 }
 
 static void tegra114_enter_s2idle(struct cpuidle_device *dev,
-- 
2.26.0


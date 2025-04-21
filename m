Return-Path: <linux-tegra+bounces-6027-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF7BA94DC5
	for <lists+linux-tegra@lfdr.de>; Mon, 21 Apr 2025 10:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 819F13AD49E
	for <lists+linux-tegra@lfdr.de>; Mon, 21 Apr 2025 08:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3089B20F07D;
	Mon, 21 Apr 2025 08:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rN12BBXh"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB041C8620;
	Mon, 21 Apr 2025 08:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223216; cv=none; b=XDDw/agVQc/oidJufTb7wmvfm0uEOHJTGBM5FNoyAA4+EWjXMAspT2JFaSWq6N7/HXpZ3UHd9/ofUWpZfRn6lGB1Hjz7c6XmB5T7pWMVJuauUln7c2ChoLMwWqDa68tJbe39FcS9UNjtZ9aiaGe0gOxkTUzDgLQTxGWJuJdqjN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223216; c=relaxed/simple;
	bh=Khsa+9i9dRFR5gzrKgEgqqS4rrQzmjrJoestrYRTkHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfjAz2xEOHnz1tHR/drd4006zPUUyIgXLOWhSMOY87dVxL4YPrqICVvFtJdCFyVoR+rUNtYlUnrqYj2j3RJC7aL3Ah37ISXePRE1yc/9J22scXef9SxLwmkjdlll/CVfMHwCyte2wNcijPk7ouPZXK6bv1gBNWu8CEpXzu7a4wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rN12BBXh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EF5DC4CEEF;
	Mon, 21 Apr 2025 08:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745223215;
	bh=Khsa+9i9dRFR5gzrKgEgqqS4rrQzmjrJoestrYRTkHI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rN12BBXhVtUyI6hDpMajSFaskkKig5wIDW5FHobH+piS++gtMRAQtQaKLCq44ZuWs
	 yiQkvuwU2/+2Ut9714dyLWR4Mb957znhxIFRY6fYVG3LQ+vSBJVxx0YeQWMJSOUK6Q
	 b6Sk5CgMtcT3wvi1/E1FOX65FZWBhKecL5YsV9DHKqNS1ttBXvMLy3MhDZ37Sfucvc
	 lyXfw9qCHK/TBfWEzx4UP5iEVP4w9z8K6AOxq9NCboj43fqEZl6+OAmoU1/Jei77PU
	 vXbcazGNPCXKYJvqLwUZoqRBWHx9lqEy7ciM3qaKQafsB0j9U7JtftHUtTMS9kJLok
	 Rc7hC8AbC/EeQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821DAC369D6;
	Mon, 21 Apr 2025 08:13:35 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 21 Apr 2025 03:13:32 -0500
Subject: [PATCH v2 2/2] cpufreq: tegra124: Allow building as a module
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-tegra124-cpufreq-v2-2-2f148cefa418@gmail.com>
References: <20250421-tegra124-cpufreq-v2-0-2f148cefa418@gmail.com>
In-Reply-To: <20250421-tegra124-cpufreq-v2-0-2f148cefa418@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745223214; l=3413;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=vRnmrx8VjMy/a3Ap0/hznM3tiqHp5F21n3zSs/FfWWw=;
 b=Xilx1II1g1/gQpjQeJrfGcr1RM4Pok+g+IjZLN1zHFbU72TalqpReLFhtNLGgcTjMAarsoCfU
 jPuPjFdQVLrBXfMgia0NpPGjZhH1zMrwyoi4GIXMv4jpbMmwoveMqyq
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

This requires three changes:
* A soft dependency on cpufreq-dt as this driver only handles power
  management and cpufreq-dt does the real operations
* Adding a remove routine to remove the cpufreq-dt device
* Adding a exit routine to handle cleaning up the driver

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/cpufreq/Kconfig.arm        |  2 +-
 drivers/cpufreq/tegra124-cpufreq.c | 28 ++++++++++++++++++++++++----
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index 4f9cb943d945c244eb2b29f543d14df6cac4e5d4..625f6fbdaaf5fd774e3b0bb996eb7ce980da41ee 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -238,7 +238,7 @@ config ARM_TEGRA20_CPUFREQ
 	  This adds the CPUFreq driver support for Tegra20/30 SOCs.
 
 config ARM_TEGRA124_CPUFREQ
-	bool "Tegra124 CPUFreq support"
+	tristate "Tegra124 CPUFreq support"
 	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on CPUFREQ_DT
 	default y
diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
index dc83b1631b13ec428f3b6bbea89462448a62adb4..17f51592bf9fe75921ab4fc4125908e5d941e468 100644
--- a/drivers/cpufreq/tegra124-cpufreq.c
+++ b/drivers/cpufreq/tegra124-cpufreq.c
@@ -16,6 +16,8 @@
 #include <linux/pm_opp.h>
 #include <linux/types.h>
 
+static struct platform_device *platform_device;
+
 struct tegra124_cpufreq_priv {
 	struct clk *cpu_clk;
 	struct clk *pllp_clk;
@@ -174,6 +176,14 @@ static int __maybe_unused tegra124_cpufreq_resume(struct device *dev)
 	return err;
 }
 
+static void tegra124_cpufreq_remove(struct platform_device *pdev)
+{
+	struct tegra124_cpufreq_priv *priv = dev_get_drvdata(&pdev->dev);
+
+	if (!IS_ERR(priv->cpufreq_dt_pdev))
+		platform_device_unregister(priv->cpufreq_dt_pdev);
+}
+
 static const struct dev_pm_ops tegra124_cpufreq_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(tegra124_cpufreq_suspend,
 				tegra124_cpufreq_resume)
@@ -183,12 +193,12 @@ static struct platform_driver tegra124_cpufreq_platdrv = {
 	.driver.name	= "cpufreq-tegra124",
 	.driver.pm	= &tegra124_cpufreq_pm_ops,
 	.probe		= tegra124_cpufreq_probe,
+	.remove		= tegra124_cpufreq_remove,
 };
 
 static int __init tegra_cpufreq_init(void)
 {
 	int ret;
-	struct platform_device *pdev;
 
 	if (!(of_machine_is_compatible("nvidia,tegra124") ||
 		of_machine_is_compatible("nvidia,tegra210")))
@@ -202,15 +212,25 @@ static int __init tegra_cpufreq_init(void)
 	if (ret)
 		return ret;
 
-	pdev = platform_device_register_simple("cpufreq-tegra124", -1, NULL, 0);
-	if (IS_ERR(pdev)) {
+	platform_device = platform_device_register_simple("cpufreq-tegra124", -1, NULL, 0);
+	if (IS_ERR(platform_device)) {
 		platform_driver_unregister(&tegra124_cpufreq_platdrv);
-		return PTR_ERR(pdev);
+		return PTR_ERR(platform_device);
 	}
 
 	return 0;
 }
 module_init(tegra_cpufreq_init);
 
+static void __exit tegra_cpufreq_module_exit(void)
+{
+	if (!IS_ERR(platform_device))
+		platform_device_unregister(platform_device);
+	platform_driver_unregister(&tegra124_cpufreq_platdrv);
+}
+module_exit(tegra_cpufreq_module_exit);
+
+MODULE_SOFTDEP("pre: cpufreq-dt");
 MODULE_AUTHOR("Tuomas Tynkkynen <ttynkkynen@nvidia.com>");
 MODULE_DESCRIPTION("cpufreq driver for NVIDIA Tegra124");
+MODULE_LICENSE("GPL");

-- 
2.48.1




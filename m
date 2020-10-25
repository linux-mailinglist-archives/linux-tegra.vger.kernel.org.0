Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78B0D2984D2
	for <lists+linux-tegra@lfdr.de>; Mon, 26 Oct 2020 00:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1420363AbgJYXCH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 25 Oct 2020 19:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1420359AbgJYXCG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 25 Oct 2020 19:02:06 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114DEC0613CE;
        Sun, 25 Oct 2020 16:02:04 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id h6so9473762lfj.3;
        Sun, 25 Oct 2020 16:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=77w4yjZmIJQHDCRHik6uDl4VQaZFvsvn77X3uS2Z2NE=;
        b=BHaaZ9DKLqcCh2jkjYGhz434hBE2VdOW4cAj3l+Obm3VnanJvkS+vFIFsy7E17j9kq
         WXnPbpvsdkGBdRVIzdj5e9tKjfI6bR1b3pc537ksgxanEO3+XlanClc5EQDzWW4Foo8a
         n2Wblh9b0AssNFkok6HbdQixJnGm1hh31SKhBQWBodvGHiw9doWGRoOIcaR5g8L4VevJ
         5JCSzAwEhnVgJSLH+h6yNRFgZlB2wijTidxJF5x9z7YFLh1tKM1T3sHu2TxmI9zWTNIz
         iCU9ETRFEFD3wFBamTIftlCCFNFCQnvRgB299OZtIYEbb7ybFWya52e4CU4nrxHYS8ug
         0K6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=77w4yjZmIJQHDCRHik6uDl4VQaZFvsvn77X3uS2Z2NE=;
        b=B72kP6vvVKovT7FOUBaAIRh1N4zliTyaHEv2uihZPOlqhYLUmZ+qEXuQYRliQPVdhw
         K1eZWCWQvmNk9MR5r+xigfMpSq3vfSc1VS9PLMt1LkbV07B2LoCfWzzPOpWiDDAh240f
         p5/KXFtt577//0ZuFwBHpCx9B/uPmO2ayq/xdvtvLonsyZmuRBc/NXDX/s8K5d5q9K5W
         YiLNoaqNhY3zoJ5ehKSXu4Z+mpgLt2AdCMoilSrMWVzve8o7K1fxQJjVY3uvH+ewIriW
         7puILQabWxFAqhXCiQGw6hTV+mDSUb0n5JZvD2/9frP9dfWsYxlF+gLQlnWxjZ/tjHeJ
         5kYg==
X-Gm-Message-State: AOAM532sdGC14FyTRMeaJhHza97fOddjfm6W8mT2Esxel+i7Z6dG8Clc
        O47dgZnvOHbyiPTxYlmdgqBgBRQ0XdI=
X-Google-Smtp-Source: ABdhPJxAa31jrgB2UdZLtXbtojn8R893rlNT07YqHYwlbg8j8cBFrQcnDCGZOvTkvZAog4Hj14BDFQ==
X-Received: by 2002:ac2:5c4c:: with SMTP id s12mr3704185lfp.174.1603666922533;
        Sun, 25 Oct 2020 16:02:02 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.gmail.com with ESMTPSA id j16sm949619ljh.48.2020.10.25.16.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 16:02:02 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dan Murphy <dmurphy@ti.com>, Sebastian Reichel <sre@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v4 3/4] power: supply: Add battery gauge driver for Acer Iconia Tab A500
Date:   Mon, 26 Oct 2020 02:01:52 +0300
Message-Id: <20201025230153.11729-4-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025230153.11729-1-digetx@gmail.com>
References: <20201025230153.11729-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch adds battery gauge driver for Acer Iconia Tab A500 device.
The battery gauge function is provided via the Embedded Controller,
which is found on the Acer A500.

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/power/supply/Kconfig             |   6 +
 drivers/power/supply/Makefile            |   1 +
 drivers/power/supply/acer_a500_battery.c | 297 +++++++++++++++++++++++
 3 files changed, 304 insertions(+)
 create mode 100644 drivers/power/supply/acer_a500_battery.c

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index eec646c568b7..bc493173ddbc 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -774,4 +774,10 @@ config RN5T618_POWER
 	  This driver can also be built as a module. If so, the module will be
 	  called rn5t618_power.
 
+config BATTERY_ACER_A500
+	tristate "Acer Iconia Tab A500 battery driver"
+	depends on MFD_ACER_A500_EC
+	help
+	  Say Y to include support for Acer Iconia Tab A500 battery fuel gauge.
+
 endif # POWER_SUPPLY
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index dd4b86318cd9..0607a3d64c0f 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -98,3 +98,4 @@ obj-$(CONFIG_CHARGER_BD70528)	+= bd70528-charger.o
 obj-$(CONFIG_CHARGER_BD99954)	+= bd99954-charger.o
 obj-$(CONFIG_CHARGER_WILCO)	+= wilco-charger.o
 obj-$(CONFIG_RN5T618_POWER)	+= rn5t618_power.o
+obj-$(CONFIG_BATTERY_ACER_A500)	+= acer_a500_battery.o
diff --git a/drivers/power/supply/acer_a500_battery.c b/drivers/power/supply/acer_a500_battery.c
new file mode 100644
index 000000000000..93135933c8af
--- /dev/null
+++ b/drivers/power/supply/acer_a500_battery.c
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Battery driver for Acer Iconia Tab A500.
+ *
+ * Copyright 2020 GRATE-driver project.
+ *
+ * Based on downstream driver from Acer Inc.
+ * Based on NVIDIA Gas Gauge driver for SBS Compliant Batteries.
+ *
+ * Copyright (c) 2010, NVIDIA Corporation.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/power_supply.h>
+#include <linux/regmap.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+
+enum {
+	REG_CAPACITY,
+	REG_VOLTAGE,
+	REG_CURRENT,
+	REG_DESIGN_CAPACITY,
+	REG_TEMPERATURE,
+};
+
+#define EC_DATA(_reg, _psp) {			\
+	.psp = POWER_SUPPLY_PROP_ ## _psp,	\
+	.reg = _reg,				\
+}
+
+static const struct battery_register {
+	enum power_supply_property psp;
+	unsigned int reg;
+} ec_data[] = {
+	[REG_CAPACITY]		= EC_DATA(0x00, CAPACITY),
+	[REG_VOLTAGE]		= EC_DATA(0x01, VOLTAGE_NOW),
+	[REG_CURRENT]		= EC_DATA(0x03, CURRENT_NOW),
+	[REG_DESIGN_CAPACITY]	= EC_DATA(0x08, CHARGE_FULL_DESIGN),
+	[REG_TEMPERATURE]	= EC_DATA(0x0a, TEMP),
+};
+
+static const enum power_supply_property a500_battery_properties[] = {
+	POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
+	POWER_SUPPLY_PROP_CURRENT_NOW,
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_TECHNOLOGY,
+	POWER_SUPPLY_PROP_TEMP,
+	POWER_SUPPLY_PROP_VOLTAGE_NOW,
+};
+
+struct a500_battery {
+	struct delayed_work poll_work;
+	struct power_supply *psy;
+	struct regmap *rmap;
+	unsigned int capacity;
+};
+
+static bool a500_battery_update_capacity(struct a500_battery *bat)
+{
+	unsigned int capacity;
+	int err;
+
+	err = regmap_read(bat->rmap, ec_data[REG_CAPACITY].reg, &capacity);
+	if (err)
+		return false;
+
+	/* capacity can be >100% even if max value is 100% */
+	capacity = min(capacity, 100u);
+
+	if (bat->capacity != capacity) {
+		bat->capacity = capacity;
+		return true;
+	}
+
+	return false;
+}
+
+static int a500_battery_get_status(struct a500_battery *bat)
+{
+	if (bat->capacity < 100) {
+		if (power_supply_am_i_supplied(bat->psy))
+			return POWER_SUPPLY_STATUS_CHARGING;
+		else
+			return POWER_SUPPLY_STATUS_DISCHARGING;
+	}
+
+	return POWER_SUPPLY_STATUS_FULL;
+}
+
+static void a500_battery_unit_adjustment(struct device *dev,
+					 enum power_supply_property psp,
+					 union power_supply_propval *val)
+{
+	const unsigned int base_unit_conversion = 1000;
+	const unsigned int temp_kelvin_to_celsius = 2731;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
+	case POWER_SUPPLY_PROP_CURRENT_NOW:
+	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+		val->intval *= base_unit_conversion;
+		break;
+
+	case POWER_SUPPLY_PROP_TEMP:
+		val->intval -= temp_kelvin_to_celsius;
+		break;
+
+	case POWER_SUPPLY_PROP_PRESENT:
+		val->intval = !!val->intval;
+		break;
+
+	default:
+		dev_dbg(dev,
+			"%s: no need for unit conversion %d\n", __func__, psp);
+	}
+}
+
+static int a500_battery_get_ec_data_index(struct device *dev,
+					  enum power_supply_property psp)
+{
+	unsigned int i;
+
+	/*
+	 * DESIGN_CAPACITY register always returns a non-zero value if
+	 * battery is connected and zero if disconnected, hence we'll use
+	 * it for judging the battery presence.
+	 */
+	if (psp == POWER_SUPPLY_PROP_PRESENT)
+		psp = POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN;
+
+	for (i = 0; i < ARRAY_SIZE(ec_data); i++)
+		if (psp == ec_data[i].psp)
+			return i;
+
+	dev_dbg(dev, "%s: invalid property %u\n", __func__, psp);
+
+	return -EINVAL;
+}
+
+static int a500_battery_get_property(struct power_supply *psy,
+				     enum power_supply_property psp,
+				     union power_supply_propval *val)
+{
+	struct a500_battery *bat = power_supply_get_drvdata(psy);
+	struct device *dev = psy->dev.parent;
+	int ret = 0;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_STATUS:
+		val->intval = a500_battery_get_status(bat);
+		break;
+
+	case POWER_SUPPLY_PROP_TECHNOLOGY:
+		val->intval = POWER_SUPPLY_TECHNOLOGY_LION;
+		break;
+
+	case POWER_SUPPLY_PROP_CAPACITY:
+		a500_battery_update_capacity(bat);
+		val->intval = bat->capacity;
+		break;
+
+	case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
+	case POWER_SUPPLY_PROP_CURRENT_NOW:
+	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+	case POWER_SUPPLY_PROP_PRESENT:
+	case POWER_SUPPLY_PROP_TEMP:
+		ret = a500_battery_get_ec_data_index(dev, psp);
+		if (ret < 0)
+			break;
+
+		ret = regmap_read(bat->rmap, ec_data[ret].reg, &val->intval);
+		break;
+
+	default:
+		dev_err(dev, "%s: invalid property %u\n", __func__, psp);
+		return -EINVAL;
+	}
+
+	if (!ret) {
+		/* convert units to match requirements of power supply class */
+		a500_battery_unit_adjustment(dev, psp, val);
+	}
+
+	dev_dbg(dev, "%s: property = %d, value = %x\n",
+		__func__, psp, val->intval);
+
+	/* return NODATA for properties if battery not presents */
+	if (ret)
+		return -ENODATA;
+
+	return 0;
+}
+
+static void a500_battery_poll_work(struct work_struct *work)
+{
+	struct a500_battery *bat;
+	bool capacity_changed;
+
+	bat = container_of(work, struct a500_battery, poll_work.work);
+	capacity_changed = a500_battery_update_capacity(bat);
+
+	if (capacity_changed)
+		power_supply_changed(bat->psy);
+
+	/* continuously send uevent notification */
+	schedule_delayed_work(&bat->poll_work, 30 * HZ);
+}
+
+static const struct power_supply_desc a500_battery_desc = {
+	.name = "ec-battery",
+	.type = POWER_SUPPLY_TYPE_BATTERY,
+	.properties = a500_battery_properties,
+	.get_property = a500_battery_get_property,
+	.num_properties = ARRAY_SIZE(a500_battery_properties),
+	.external_power_changed = power_supply_changed,
+};
+
+static int a500_battery_probe(struct platform_device *pdev)
+{
+	struct power_supply_config psy_cfg = {};
+	struct a500_battery *bat;
+
+	bat = devm_kzalloc(&pdev->dev, sizeof(*bat), GFP_KERNEL);
+	if (!bat)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, bat);
+
+	psy_cfg.of_node = pdev->dev.parent->of_node;
+	psy_cfg.drv_data = bat;
+
+	bat->rmap = dev_get_regmap(pdev->dev.parent, "KB930");
+	if (!bat->rmap)
+		return -EINVAL;
+
+	bat->psy = devm_power_supply_register_no_ws(&pdev->dev,
+						    &a500_battery_desc,
+						    &psy_cfg);
+	if (IS_ERR(bat->psy))
+		return dev_err_probe(&pdev->dev, PTR_ERR(bat->psy),
+				     "failed to register battery\n");
+
+	INIT_DELAYED_WORK(&bat->poll_work, a500_battery_poll_work);
+	schedule_delayed_work(&bat->poll_work, HZ);
+
+	return 0;
+}
+
+static int a500_battery_remove(struct platform_device *pdev)
+{
+	struct a500_battery *bat = dev_get_drvdata(&pdev->dev);
+
+	cancel_delayed_work_sync(&bat->poll_work);
+
+	return 0;
+}
+
+static int __maybe_unused a500_battery_suspend(struct device *dev)
+{
+	struct a500_battery *bat = dev_get_drvdata(dev);
+
+	cancel_delayed_work_sync(&bat->poll_work);
+
+	return 0;
+}
+
+static int __maybe_unused a500_battery_resume(struct device *dev)
+{
+	struct a500_battery *bat = dev_get_drvdata(dev);
+
+	schedule_delayed_work(&bat->poll_work, HZ);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(a500_battery_pm_ops,
+			 a500_battery_suspend, a500_battery_resume);
+
+static struct platform_driver a500_battery_driver = {
+	.driver = {
+		.name = "acer-a500-iconia-battery",
+		.pm = &a500_battery_pm_ops,
+	},
+	.probe = a500_battery_probe,
+	.remove = a500_battery_remove,
+};
+module_platform_driver(a500_battery_driver);
+
+MODULE_DESCRIPTION("Battery gauge driver for Acer Iconia Tab A500");
+MODULE_AUTHOR("Dmitry Osipenko <digetx@gmail.com>");
+MODULE_ALIAS("platform:acer-a500-iconia-battery");
+MODULE_LICENSE("GPL");
-- 
2.27.0


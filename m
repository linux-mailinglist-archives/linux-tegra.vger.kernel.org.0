Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A19244092
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Aug 2020 23:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgHMVeq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Aug 2020 17:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgHMVel (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Aug 2020 17:34:41 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C430C061757;
        Thu, 13 Aug 2020 14:34:40 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h19so7777607ljg.13;
        Thu, 13 Aug 2020 14:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EqGqa6HvoFlh+c/YAEirRq/tW0ZfROO35qCFwppetS0=;
        b=eq+F5iEl/Etuio9GjQtESMcB/k/q0HAp3tsVxLraGrMOLWJXZebvUElShxzyWhqNMO
         lC9AwhsRuRI0LwEPeUpYmfMbYTievYFqyzMbe4ctL1iIMsHRngKaL5fzL8WLKGhgKqTJ
         M2YnxYsoxgB0k5M4wi54UfXzfjy9hK2Ae4w8q1uKz6e1bts5KxBuqa8cL+jwxY8NYsiN
         MBL/sHSeLZmzl9Au+SG3B1E5f1mXSSFi3xSNsY0OnzVc2pzcyHfWDBoA+Pk4sHPs3SnS
         dF+oTGgmxfGKXFlXyKDGhe5/7qSwWW8J6CFtt149scYXjM/TLdb/lHC6DZMB4qcBPDML
         wyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EqGqa6HvoFlh+c/YAEirRq/tW0ZfROO35qCFwppetS0=;
        b=IEnyFqAMW6cYk4xH2SMLXaQFxpDbfcUGKtC7p41sbPSYsKJ6v48B7hm6ngFGG/8ON0
         7iHoHoyE5+AmYwr6hnIEfBZKk5hfeKiXFw9XdlZcsTdd954F+Mjj4vFInziIT+xyDPzB
         hJ3WP8VkKAXbxHkweGUeV3baFB/fYfZ5ugg2O838hzXY3xKUtsCJY8yGQjHHQX+zF4ro
         IDsNEIAqUvrn8uacnsn0nBi5l5PLLNEP+ESpawAqK0dNo5Q3L6clqE2MgUhjZ7xUqQIW
         aXSJNm3+AD3QackBhZiZbJWk0lKB+LwF62bLnBJdLFHMRDOA3CB/BASqpkuljLcEU877
         GYiA==
X-Gm-Message-State: AOAM531eNXqXw/39Zv74Aobiugtv1bipmosHlgQFnKaKi9FRKnWHAo1c
        sfBxH68MxFiuxvxj+Jf5b94=
X-Google-Smtp-Source: ABdhPJzVF95c0zu0LJ9gugw5NGOqEtyLN8XOwKwwJ5vwtxSrIaw6FOM2w9bHyhMTCdJwbdxR7OvkxQ==
X-Received: by 2002:a05:651c:1349:: with SMTP id j9mr2789261ljb.392.1597354478863;
        Thu, 13 Aug 2020 14:34:38 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j2sm1345309ljb.98.2020.08.13.14.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 14:34:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Heidelberg <david@ixit.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Bruce E . Robertson" <bruce.e.robertson@intel.com>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jonghwa Lee <jonghwa3.lee@samsung.com>,
        John Stultz <john.stultz@linaro.org>,
        Vinay Simha BN <simhavcs@gmail.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 07/10] power: supply: smb347-charger: Remove virtual smb347-battery
Date:   Fri, 14 Aug 2020 00:34:06 +0300
Message-Id: <20200813213409.24222-8-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813213409.24222-1-digetx@gmail.com>
References: <20200813213409.24222-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: David Heidelberg <david@ixit.cz>

SMB347 is a charger and not a battery driver. Secondly, power-supply core
now supports monitored-battery. So the 'fake' battery doesn't do anything
useful for us, and thus, it should be removed.

Transfer smb347-battery functionality into smb347-mains and smb347-usb.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/power/supply/smb347-charger.c | 206 ++++++++------------------
 1 file changed, 60 insertions(+), 146 deletions(-)

diff --git a/drivers/power/supply/smb347-charger.c b/drivers/power/supply/smb347-charger.c
index 90a87e0624a6..335b6ee494e4 100644
--- a/drivers/power/supply/smb347-charger.c
+++ b/drivers/power/supply/smb347-charger.c
@@ -127,7 +127,6 @@
  * @regmap: pointer to driver regmap
  * @mains: power_supply instance for AC/DC power
  * @usb: power_supply instance for USB power
- * @battery: power_supply instance for battery
  * @id: SMB charger ID
  * @mains_online: is AC/DC input connected
  * @usb_online: is USB input connected
@@ -140,7 +139,6 @@ struct smb347_charger {
 	struct regmap		*regmap;
 	struct power_supply	*mains;
 	struct power_supply	*usb;
-	struct power_supply	*battery;
 	unsigned int		id;
 	bool			mains_online;
 	bool			usb_online;
@@ -743,7 +741,10 @@ static irqreturn_t smb347_interrupt(int irq, void *data)
 	 */
 	if (stat_c & STAT_C_CHARGER_ERROR) {
 		dev_err(smb->dev, "charging stopped due to charger error\n");
-		power_supply_changed(smb->battery);
+		if (smb->pdata->use_mains)
+			power_supply_changed(smb->mains);
+		if (smb->pdata->use_usb)
+			power_supply_changed(smb->usb);
 		handled = true;
 	}
 
@@ -753,8 +754,12 @@ static irqreturn_t smb347_interrupt(int irq, void *data)
 	 * disabled by the hardware.
 	 */
 	if (irqstat_c & (IRQSTAT_C_TERMINATION_IRQ | IRQSTAT_C_TAPER_IRQ)) {
-		if (irqstat_c & IRQSTAT_C_TERMINATION_STAT)
-			power_supply_changed(smb->battery);
+		if (irqstat_c & IRQSTAT_C_TERMINATION_STAT) {
+			if (smb->pdata->use_mains)
+				power_supply_changed(smb->mains);
+			if (smb->pdata->use_usb)
+				power_supply_changed(smb->usb);
+		}
 		dev_dbg(smb->dev, "going to HW maintenance mode\n");
 		handled = true;
 	}
@@ -768,7 +773,10 @@ static irqreturn_t smb347_interrupt(int irq, void *data)
 
 		if (irqstat_d & IRQSTAT_D_CHARGE_TIMEOUT_STAT)
 			dev_warn(smb->dev, "charging stopped due to timeout\n");
-		power_supply_changed(smb->battery);
+		if (smb->pdata->use_mains)
+			power_supply_changed(smb->mains);
+		if (smb->pdata->use_usb)
+			power_supply_changed(smb->usb);
 		handled = true;
 	}
 
@@ -936,95 +944,19 @@ static int get_const_charge_voltage(struct smb347_charger *smb)
 	return intval;
 }
 
-static int smb347_mains_get_property(struct power_supply *psy,
-				     enum power_supply_property prop,
-				     union power_supply_propval *val)
-{
-	struct smb347_charger *smb = power_supply_get_drvdata(psy);
-	int ret;
-
-	switch (prop) {
-	case POWER_SUPPLY_PROP_ONLINE:
-		val->intval = smb->mains_online;
-		break;
-
-	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
-		ret = get_const_charge_voltage(smb);
-		if (ret < 0)
-			return ret;
-		else
-			val->intval = ret;
-		break;
-
-	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
-		ret = get_const_charge_current(smb);
-		if (ret < 0)
-			return ret;
-		else
-			val->intval = ret;
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static enum power_supply_property smb347_mains_properties[] = {
-	POWER_SUPPLY_PROP_ONLINE,
-	POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT,
-	POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE,
-};
-
-static int smb347_usb_get_property(struct power_supply *psy,
-				   enum power_supply_property prop,
-				   union power_supply_propval *val)
-{
-	struct smb347_charger *smb = power_supply_get_drvdata(psy);
-	int ret;
-
-	switch (prop) {
-	case POWER_SUPPLY_PROP_ONLINE:
-		val->intval = smb->usb_online;
-		break;
-
-	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
-		ret = get_const_charge_voltage(smb);
-		if (ret < 0)
-			return ret;
-		else
-			val->intval = ret;
-		break;
-
-	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
-		ret = get_const_charge_current(smb);
-		if (ret < 0)
-			return ret;
-		else
-			val->intval = ret;
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static enum power_supply_property smb347_usb_properties[] = {
-	POWER_SUPPLY_PROP_ONLINE,
-	POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT,
-	POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE,
-};
-
-static int smb347_get_charging_status(struct smb347_charger *smb)
+static int smb347_get_charging_status(struct smb347_charger *smb,
+				      struct power_supply *psy)
 {
 	int ret, status;
 	unsigned int val;
 
-	if (!smb347_is_ps_online(smb))
-		return POWER_SUPPLY_STATUS_DISCHARGING;
+	if (psy->desc->type == POWER_SUPPLY_TYPE_USB) {
+		if (!smb->usb_online)
+			return POWER_SUPPLY_STATUS_DISCHARGING;
+	} else {
+		if (!smb->mains_online)
+			return POWER_SUPPLY_STATUS_DISCHARGING;
+	}
 
 	ret = regmap_read(smb->regmap, STAT_C, &val);
 	if (ret < 0)
@@ -1063,29 +995,29 @@ static int smb347_get_charging_status(struct smb347_charger *smb)
 	return status;
 }
 
-static int smb347_battery_get_property(struct power_supply *psy,
-				       enum power_supply_property prop,
-				       union power_supply_propval *val)
+static int smb347_get_property(struct power_supply *psy,
+			       enum power_supply_property prop,
+			       union power_supply_propval *val)
 {
 	struct smb347_charger *smb = power_supply_get_drvdata(psy);
-	const struct smb347_charger_platform_data *pdata = smb->pdata;
 	int ret;
 
-	ret = smb347_update_ps_status(smb);
-	if (ret < 0)
-		return ret;
-
 	switch (prop) {
 	case POWER_SUPPLY_PROP_STATUS:
-		ret = smb347_get_charging_status(smb);
+		ret = smb347_get_charging_status(smb, psy);
 		if (ret < 0)
 			return ret;
 		val->intval = ret;
 		break;
 
 	case POWER_SUPPLY_PROP_CHARGE_TYPE:
-		if (!smb347_is_ps_online(smb))
-			return -ENODATA;
+		if (psy->desc->type == POWER_SUPPLY_TYPE_USB) {
+			if (!smb->usb_online)
+				return -ENODATA;
+		} else {
+			if (!smb->mains_online)
+				return -ENODATA;
+		}
 
 		/*
 		 * We handle trickle and pre-charging the same, and taper
@@ -1104,24 +1036,25 @@ static int smb347_battery_get_property(struct power_supply *psy,
 		}
 		break;
 
-	case POWER_SUPPLY_PROP_TECHNOLOGY:
-		val->intval = pdata->battery_info.technology;
-		break;
-
-	case POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN:
-		val->intval = pdata->battery_info.voltage_min_design;
-		break;
-
-	case POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN:
-		val->intval = pdata->battery_info.voltage_max_design;
+	case POWER_SUPPLY_PROP_ONLINE:
+		if (psy->desc->type == POWER_SUPPLY_TYPE_USB)
+			val->intval = smb->usb_online;
+		else
+			val->intval = smb->mains_online;
 		break;
 
-	case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
-		val->intval = pdata->battery_info.charge_full_design;
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
+		ret = get_const_charge_voltage(smb);
+		if (ret < 0)
+			return ret;
+		val->intval = ret;
 		break;
 
-	case POWER_SUPPLY_PROP_MODEL_NAME:
-		val->strval = pdata->battery_info.name;
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
+		ret = get_const_charge_current(smb);
+		if (ret < 0)
+			return ret;
+		val->intval = ret;
 		break;
 
 	default:
@@ -1131,14 +1064,12 @@ static int smb347_battery_get_property(struct power_supply *psy,
 	return 0;
 }
 
-static enum power_supply_property smb347_battery_properties[] = {
+static enum power_supply_property smb347_properties[] = {
 	POWER_SUPPLY_PROP_STATUS,
 	POWER_SUPPLY_PROP_CHARGE_TYPE,
-	POWER_SUPPLY_PROP_TECHNOLOGY,
-	POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN,
-	POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
-	POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
-	POWER_SUPPLY_PROP_MODEL_NAME,
+	POWER_SUPPLY_PROP_ONLINE,
+	POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT,
+	POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE,
 };
 
 static bool smb347_volatile_reg(struct device *dev, unsigned int reg)
@@ -1308,32 +1239,23 @@ static const struct regmap_config smb347_regmap = {
 static const struct power_supply_desc smb347_mains_desc = {
 	.name		= "smb347-mains",
 	.type		= POWER_SUPPLY_TYPE_MAINS,
-	.get_property	= smb347_mains_get_property,
-	.properties	= smb347_mains_properties,
-	.num_properties	= ARRAY_SIZE(smb347_mains_properties),
+	.get_property	= smb347_get_property,
+	.properties	= smb347_properties,
+	.num_properties	= ARRAY_SIZE(smb347_properties),
 };
 
 static const struct power_supply_desc smb347_usb_desc = {
 	.name		= "smb347-usb",
 	.type		= POWER_SUPPLY_TYPE_USB,
-	.get_property	= smb347_usb_get_property,
-	.properties	= smb347_usb_properties,
-	.num_properties	= ARRAY_SIZE(smb347_usb_properties),
-};
-
-static const struct power_supply_desc smb347_battery_desc = {
-	.name		= "smb347-battery",
-	.type		= POWER_SUPPLY_TYPE_BATTERY,
-	.get_property	= smb347_battery_get_property,
-	.properties	= smb347_battery_properties,
-	.num_properties	= ARRAY_SIZE(smb347_battery_properties),
+	.get_property	= smb347_get_property,
+	.properties	= smb347_properties,
+	.num_properties	= ARRAY_SIZE(smb347_properties),
 };
 
 static int smb347_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
-	static char *battery[] = { "smb347-battery" };
-	struct power_supply_config mains_usb_cfg = {}, battery_cfg = {};
+	struct power_supply_config mains_usb_cfg = {};
 	struct device *dev = &client->dev;
 	struct smb347_charger *smb;
 	int ret;
@@ -1359,8 +1281,6 @@ static int smb347_probe(struct i2c_client *client,
 	if (IS_ERR(smb->regmap))
 		return PTR_ERR(smb->regmap);
 
-	mains_usb_cfg.supplied_to = battery;
-	mains_usb_cfg.num_supplicants = ARRAY_SIZE(battery);
 	mains_usb_cfg.drv_data = smb;
 	mains_usb_cfg.of_node = dev->of_node;
 	if (smb->pdata->use_mains) {
@@ -1377,12 +1297,6 @@ static int smb347_probe(struct i2c_client *client,
 			return PTR_ERR(smb->usb);
 	}
 
-	battery_cfg.drv_data = smb;
-	smb->battery = devm_power_supply_register(dev, &smb347_battery_desc,
-						  &battery_cfg);
-	if (IS_ERR(smb->battery))
-		return PTR_ERR(smb->battery);
-
 	ret = smb347_get_battery_info(smb);
 	if (ret)
 		return ret;
-- 
2.27.0


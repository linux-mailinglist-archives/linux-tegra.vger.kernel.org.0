Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5EC3FC909
	for <lists+linux-tegra@lfdr.de>; Tue, 31 Aug 2021 15:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbhHaN6A (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 31 Aug 2021 09:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbhHaN56 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 31 Aug 2021 09:57:58 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92860C061575;
        Tue, 31 Aug 2021 06:57:02 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bq28so38703686lfb.7;
        Tue, 31 Aug 2021 06:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M8U7E16VGX8CxKkJRXCHT93F41HSxSE0YgI66q/OlMI=;
        b=jfP90AL86PGMD5r1wct+KNrS0wk4s/vxOz/gFD1rlQz6X4QVQ67JsPeYYLQ5KncpKu
         4VhFKk9yhGadsKkFnCK8EiDb65DEt9DotWqwW/PdY0t/KJdpYRawWj4HVZAHy8A58IjZ
         MuVkEX2aLxpkz9goRJ31cdlyh4+6dG/IHJikT3c76Ylsr4GP8WVMtwXobzrwqbX6uVP6
         yc/vR5jnmMshbp29vXPvmjBZwwHn+tSjMtENT9lWzHS6rSe5euFvdMQP9MFngHHm7cER
         /sHuWBTMgYHOWURSrpg15xqNmq2rKmTnEDZydu/FbzLrz6wdu74c1r4mSmql0zmEQNqd
         8exA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M8U7E16VGX8CxKkJRXCHT93F41HSxSE0YgI66q/OlMI=;
        b=LytY4quNE6DBuBxRNmt8FFv+O3NNyWliIpZ1jbHH7FDXXHAQzr6LDvfCZDCKj/3GzN
         xtdUbuXpYLiyYMk7nW6UshfqSkdbmPvAWfXg3IkribG4zxOstlKEb0qSEZkEYdBKKPsw
         S/VpugnrClfNAobPwoCxKRLCqgbCgRLn/wGjjuwFjjFpE83WQ92rJJdhiX8QIQu7VEGK
         lUUhltwbg6X4sRm+Lx+0CLUmP5P1tVcx51UW1py5ClY7D9+3Mp5MbK6TxyzE+YqWZZDg
         YZLks9LHRRNJDFEWRe86v2CAeRUP6cWz5rq8fJiprdWtn8u0lLvmlAE09dOLlBSTZ0Co
         3xsw==
X-Gm-Message-State: AOAM531qYwU3HNuBXZzW8mZPBEWIpTVhLDwU76z0uDdky5eLFokpJKdS
        LUR7VrWAWJ00ODI+Funh3y4=
X-Google-Smtp-Source: ABdhPJyAIg2ZdcBcD2CNj1TGt7NfKafvr1Os4cITSLpy4xasOOF/6eyPlw16ekZJg5RjiiYB3YeVaQ==
X-Received: by 2002:a05:6512:2602:: with SMTP id bt2mr21109410lfb.47.1630418220975;
        Tue, 31 Aug 2021 06:57:00 -0700 (PDT)
Received: from localhost.localdomain (46-138-26-37.dynamic.spd-mgts.ru. [46.138.26.37])
        by smtp.gmail.com with ESMTPSA id x4sm2203622ljm.98.2021.08.31.06.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 06:57:00 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH v10 4/8] PM: domains: Add dev_get_performance_state() callback
Date:   Tue, 31 Aug 2021 16:54:46 +0300
Message-Id: <20210831135450.26070-5-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210831135450.26070-1-digetx@gmail.com>
References: <20210831135450.26070-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add optional dev_get_performance_state() callback that retrieves
performance state of a device attached to a power domain. The new callback
returns performance states of the given device, which should be read out
from hardware.

GENPD core assumes that initially performance state of all devices is
zero and consumer device driver is responsible for management of the
performance state. GENPD core now manages performance state across RPM
suspend/resume of consumer devices by dropping and restoring the state,
this allowed to move a part of performance management code into GENPD
core out of consumer drivers. The part that hasn't been moved to GENPD
core yet is the initialization of the performance state.

Hardware may be preprogrammed to a specific performance state which
isn't zero initially, hence the PD's performance state is inconsistent
with hardware at the init time. This requires each consumer driver to
explicitly sync the state. For some platforms this is a boilerplate code
replicated by each driver.

The new callback allows GENPD core to initialize the performance state,
allowing to remove the remaining boilerplate code from consumer drivers.
Now, when consumer device is resumed for the first time, the performance
state is either already set by GENPD core or it will be set in accordance
to the hardware state that was retrieved using the new callback when device
was attached to a power domain. Still, consumer drivers are free to override
the initial performance state configured by GENPD, if necessary.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/base/power/domain.c | 90 +++++++++++++++++++++++++++++++------
 include/linux/pm_domain.h   |  2 +
 2 files changed, 79 insertions(+), 13 deletions(-)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index 5db704f02e71..598528abce01 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -2644,12 +2644,85 @@ static void genpd_dev_pm_sync(struct device *dev)
 	genpd_queue_power_off_work(pd);
 }
 
+static int genpd_dev_get_current_performance_state(struct device *dev,
+						   struct device *base_dev,
+						   unsigned int index,
+						   bool *state_default,
+						   bool *suspended)
+{
+	struct generic_pm_domain *pd = dev_to_genpd(dev);
+	int ret;
+
+	ret = of_get_required_opp_performance_state(dev->of_node, index);
+	if (ret < 0 && ret != -ENODEV && ret != -EOPNOTSUPP) {
+		dev_err(dev, "failed to get required performance state for power-domain %s: %d\n",
+			pd->name, ret);
+
+		return ret;
+	} else if (ret >= 0) {
+		*state_default = true;
+
+		return ret;
+	}
+
+	if (pd->dev_get_performance_state) {
+		ret = pd->dev_get_performance_state(pd, base_dev);
+		if (ret >= 0)
+			*suspended = pm_runtime_status_suspended(base_dev);
+		else
+			dev_err(dev, "failed to get performance state of %s for power-domain %s: %d\n",
+				dev_name(base_dev), pd->name, ret);
+
+		return ret;
+	}
+
+	return 0;
+}
+
+static int genpd_dev_initialize_performance_state(struct device *dev,
+						  struct device *base_dev,
+						  unsigned int index)
+{
+	struct generic_pm_domain *pd = dev_to_genpd(dev);
+	bool state_default = false, suspended = false;
+	int pstate, err;
+
+	pstate = genpd_dev_get_current_performance_state(dev, base_dev, index,
+							 &state_default,
+							 &suspended);
+	if (pstate <= 0)
+		return pstate;
+
+	/*
+	 * If device is suspended, then performance state will be applied
+	 * on RPM-resume. This prevents potential extra power consumption
+	 * if device won't be resumed soon.
+	 *
+	 * If device is known to be active at the moment, then the performance
+	 * state should be updated immediately to sync state with hardware.
+	 */
+	if (suspended) {
+		dev_gpd_data(dev)->rpm_pstate = pstate;
+	} else {
+		err = dev_pm_genpd_set_performance_state(dev, pstate);
+		if (err) {
+			dev_err(dev, "failed to set performance state for power-domain %s: %d\n",
+				pd->name, err);
+			return err;
+		}
+
+		if (state_default)
+			dev_gpd_data(dev)->default_pstate = pstate;
+	}
+
+	return 0;
+}
+
 static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
 				 unsigned int index, bool power_on)
 {
 	struct of_phandle_args pd_args;
 	struct generic_pm_domain *pd;
-	int pstate;
 	int ret;
 
 	ret = of_parse_phandle_with_args(dev->of_node, "power-domains",
@@ -2693,22 +2766,13 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
 		return -EPROBE_DEFER;
 	}
 
-	/* Set the default performance state */
-	pstate = of_get_required_opp_performance_state(dev->of_node, index);
-	if (pstate < 0 && pstate != -ENODEV && pstate != -EOPNOTSUPP) {
-		ret = pstate;
+	ret = genpd_dev_initialize_performance_state(dev, base_dev, index);
+	if (ret)
 		goto err;
-	} else if (pstate > 0) {
-		ret = dev_pm_genpd_set_performance_state(dev, pstate);
-		if (ret)
-			goto err;
-		dev_gpd_data(dev)->default_pstate = pstate;
-	}
+
 	return 1;
 
 err:
-	dev_err(dev, "failed to set required performance state for power-domain %s: %d\n",
-		pd->name, ret);
 	genpd_remove_device(pd, dev);
 	return ret;
 }
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 67017c9390c8..0a4dd4986f34 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -133,6 +133,8 @@ struct generic_pm_domain {
 						 struct dev_pm_opp *opp);
 	int (*set_performance_state)(struct generic_pm_domain *genpd,
 				     unsigned int state);
+	int (*dev_get_performance_state)(struct generic_pm_domain *genpd,
+					 struct device *dev);
 	struct gpd_dev_ops dev_ops;
 	s64 max_off_time_ns;	/* Maximum allowed "suspended" time. */
 	ktime_t next_wakeup;	/* Maintained by the domain governor */
-- 
2.32.0


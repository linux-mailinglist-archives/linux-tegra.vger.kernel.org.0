Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 729CC125114
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 19:56:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfLRS4I (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 13:56:08 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43406 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbfLRS4I (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 13:56:08 -0500
Received: by mail-lf1-f68.google.com with SMTP id 9so2449549lfq.10
        for <linux-tegra@vger.kernel.org>; Wed, 18 Dec 2019 10:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rOEBpssRPreuK43GnY0IvxzrGvsOE4JXvpybG0rWPf4=;
        b=rtZux+/tVmFCOnbxkr2Nbjm7XvVhZqXX65PAwQz6a4tZhLg43Xs5NF3JEXZeKcFUQ8
         s5MPgC3RByuX2Wd4AovCf0M920fDv6061QmQn7vORk0Mg67Uq78hafQNwUJv+4/v88bG
         e5PM1C0vwty3p0uG/fkUPje9+sQFgXveLZ3O8ziyEoI+Iw5O11t1IeVbi6yh/iZw+6cm
         RTJjl1kTHcPKltnk04GYp5Pq7DuaTjZ+C1osaFwCKVLrZSIbHY+3ZzYl1lHhKZjjwn+Q
         rN7vOMSxzUbeasE8zWPcKKlZzKPQyikz2lnpA2ahwpvM8ttVtIRqnMAiQ6HRvFQW7XUM
         VnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rOEBpssRPreuK43GnY0IvxzrGvsOE4JXvpybG0rWPf4=;
        b=MNCrH5gV34NObahiUCptkbbOm7tT5YxruKwW0mpBOuR/NJw54h1AeYGW7IerQ8Qpva
         KacKzPzr4aOjzXnXdXLyPQcHo4ovRpoigrulpiusZsdpW7nuLkSFErCmq/hjKLNdW0Br
         a2bVgFENJzw83CZ+yC5z3wKBKjBHPcax1Ze/5tN7EIeHLBZ0v4jdzjtfevBgoDBpMLIB
         c1ew5sDO440TC5D919FbMAlo6dW9aHdZ+WrsFYR1Guh5yY4MRLeBguSdqIvA6ALEtDnC
         QIiRVljBhN0yuj7gCLTEtjRapZGVplHvn/4zZrIUmwBPFfbAA6ivy08qbKLFRaq2t0p1
         tOkA==
X-Gm-Message-State: APjAAAVjjyOxsfLbMShsk7MolbrT10DuY/emDZ3VvUQht6fUE48Lr9yZ
        rutG3ShdRPVRzq+KSSfuOSo=
X-Google-Smtp-Source: APXvYqwz9Q9vvX83/UePnu/NZp5ZwgnNbbJ4X1lloC/mfL+EsHIjvEDCAVXgf3Ddj29EiLp9LhqUtw==
X-Received: by 2002:a19:c80a:: with SMTP id y10mr2717459lff.177.1576695366556;
        Wed, 18 Dec 2019 10:56:06 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id q27sm1673790ljc.65.2019.12.18.10.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 10:56:06 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org
Subject: [PATCH v1] soc/tegra: regulators: Do nothing if voltage is unchanged
Date:   Wed, 18 Dec 2019 21:55:35 +0300
Message-Id: <20191218185535.28009-1-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There is no need to re-apply the same voltage. This change is just a minor
cleanup.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/regulators-tegra20.c | 8 +++++++-
 drivers/soc/tegra/regulators-tegra30.c | 6 ++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/regulators-tegra20.c b/drivers/soc/tegra/regulators-tegra20.c
index ea0eede48802..367a71a3cd10 100644
--- a/drivers/soc/tegra/regulators-tegra20.c
+++ b/drivers/soc/tegra/regulators-tegra20.c
@@ -162,6 +162,9 @@ static int tegra20_core_rtc_update(struct tegra_regulator_coupler *tegra,
 			core_target_uV = max(rtc_uV - max_spread, core_target_uV);
 		}
 
+		if (core_uV == core_target_uV)
+			goto update_rtc;
+
 		err = regulator_set_voltage_rdev(core_rdev,
 						 core_target_uV,
 						 core_max_uV,
@@ -170,7 +173,7 @@ static int tegra20_core_rtc_update(struct tegra_regulator_coupler *tegra,
 			return err;
 
 		core_uV = core_target_uV;
-
+update_rtc:
 		if (rtc_uV < rtc_min_uV) {
 			rtc_target_uV = min(rtc_uV + max_spread, rtc_min_uV);
 			rtc_target_uV = min(core_uV + max_spread, rtc_target_uV);
@@ -179,6 +182,9 @@ static int tegra20_core_rtc_update(struct tegra_regulator_coupler *tegra,
 			rtc_target_uV = max(core_uV - max_spread, rtc_target_uV);
 		}
 
+		if (rtc_uV == rtc_target_uV)
+			continue;
+
 		err = regulator_set_voltage_rdev(rtc_rdev,
 						 rtc_target_uV,
 						 rtc_max_uV,
diff --git a/drivers/soc/tegra/regulators-tegra30.c b/drivers/soc/tegra/regulators-tegra30.c
index 8e623ff18e70..7f21f31de09d 100644
--- a/drivers/soc/tegra/regulators-tegra30.c
+++ b/drivers/soc/tegra/regulators-tegra30.c
@@ -209,6 +209,9 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 			cpu_target_uV = max(core_uV - max_spread, cpu_target_uV);
 		}
 
+		if (cpu_uV == cpu_target_uV)
+			goto update_core;
+
 		err = regulator_set_voltage_rdev(cpu_rdev,
 						 cpu_target_uV,
 						 cpu_max_uV,
@@ -231,6 +234,9 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 			core_target_uV = max(core_target_uV, core_uV - core_max_step);
 		}
 
+		if (core_uV == core_target_uV)
+			continue;
+
 		err = regulator_set_voltage_rdev(core_rdev,
 						 core_target_uV,
 						 core_max_uV,
-- 
2.24.0


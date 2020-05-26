Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F27B11DBFE7
	for <lists+linux-tegra@lfdr.de>; Wed, 20 May 2020 22:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbgETUJH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 20 May 2020 16:09:07 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8406 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbgETUJH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 May 2020 16:09:07 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ec58e560002>; Wed, 20 May 2020 13:08:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 20 May 2020 13:09:07 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 20 May 2020 13:09:07 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 May
 2020 20:09:06 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 20 May 2020 20:09:06 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.164.184]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ec58e610004>; Wed, 20 May 2020 13:09:06 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <skomatineni@nvidia.com>, <digetx@gmail.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>
Subject: [PATCH] sdhci: tegra: Avoid reading autocal timeout values when not applicable
Date:   Wed, 20 May 2020 13:08:57 -0700
Message-ID: <1590005337-1087-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1590005334; bh=asVh9rLzkiD5JyaaI6j95vjUXlrE2IDu86+Pd2Cz4zM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=fHmNx+2lYx43GNJpWveADlxwYya+YjTiMTBROfuoxO6BfYFYdKL88jXEWWl8RcMc/
         v1iphoiCiARVwfwnYCpwPcY+qC8yV//Xvd0f/P90lRsdH4ivw0p0cS6L23Ak7BFgMs
         sATl7k0XAKXkhUWcIBVoVBw6PMkhdSCeiMzZCcVa1KlvROoTV548j5jC0H6HUfNIYm
         TBRrHaqqi3mFLUYB5yDOEEaO7aRZ6AhBv5Gi//iHfLiwI4+TzwKX7zZb665VtuLJsu
         QVK23NunEtoELHRvUAa3z8ZBxLeP3FNvCzFG7pckxHxM+VO0jgRIcMQwZ+keZiiA9v
         9gx41ZeN2BnNA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

When auto calibration timeouts, calibration is disabled and fail-safe
drive strength values are programmed based on the signal voltage.

Different fail-safe drive strength values based on voltage are
applicable only for SoCs supporting 3V3 and 1V8 pad controls.

So, this patch avoids reading these properties from the device tree
for SoCs not using pad controls and the warning of missing properties
will not show up on these SoC platforms.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/mmc/host/sdhci-tegra.c | 57 ++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 3e2c510..141b49b 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -605,6 +605,39 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
 		autocal->pull_down_1v8 = 0;
 
 	err = device_property_read_u32(host->mmc->parent,
+			"nvidia,pad-autocal-pull-up-offset-sdr104",
+			&autocal->pull_up_sdr104);
+	if (err)
+		autocal->pull_up_sdr104 = autocal->pull_up_1v8;
+
+	err = device_property_read_u32(host->mmc->parent,
+			"nvidia,pad-autocal-pull-down-offset-sdr104",
+			&autocal->pull_down_sdr104);
+	if (err)
+		autocal->pull_down_sdr104 = autocal->pull_down_1v8;
+
+	err = device_property_read_u32(host->mmc->parent,
+			"nvidia,pad-autocal-pull-up-offset-hs400",
+			&autocal->pull_up_hs400);
+	if (err)
+		autocal->pull_up_hs400 = autocal->pull_up_1v8;
+
+	err = device_property_read_u32(host->mmc->parent,
+			"nvidia,pad-autocal-pull-down-offset-hs400",
+			&autocal->pull_down_hs400);
+	if (err)
+		autocal->pull_down_hs400 = autocal->pull_down_1v8;
+
+	/*
+	 * Different fail-safe drive strength values based on the signaling
+	 * voltage are applicable for SoCs supporting 3V3 and 1V8 pad controls.
+	 * So, avoid reading below device tree properies for SoCs that don't
+	 * have NVQUIRK_NEEDS_PAD_CONTROL.
+	 */
+	if (!(tegra_host->soc_data->nvquirks & NVQUIRK_NEEDS_PAD_CONTROL))
+		return;
+
+	err = device_property_read_u32(host->mmc->parent,
 			"nvidia,pad-autocal-pull-up-offset-3v3-timeout",
 			&autocal->pull_up_3v3_timeout);
 	if (err) {
@@ -647,30 +680,6 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
 				mmc_hostname(host->mmc));
 		autocal->pull_down_1v8_timeout = 0;
 	}
-
-	err = device_property_read_u32(host->mmc->parent,
-			"nvidia,pad-autocal-pull-up-offset-sdr104",
-			&autocal->pull_up_sdr104);
-	if (err)
-		autocal->pull_up_sdr104 = autocal->pull_up_1v8;
-
-	err = device_property_read_u32(host->mmc->parent,
-			"nvidia,pad-autocal-pull-down-offset-sdr104",
-			&autocal->pull_down_sdr104);
-	if (err)
-		autocal->pull_down_sdr104 = autocal->pull_down_1v8;
-
-	err = device_property_read_u32(host->mmc->parent,
-			"nvidia,pad-autocal-pull-up-offset-hs400",
-			&autocal->pull_up_hs400);
-	if (err)
-		autocal->pull_up_hs400 = autocal->pull_up_1v8;
-
-	err = device_property_read_u32(host->mmc->parent,
-			"nvidia,pad-autocal-pull-down-offset-hs400",
-			&autocal->pull_down_hs400);
-	if (err)
-		autocal->pull_down_hs400 = autocal->pull_down_1v8;
 }
 
 static void tegra_sdhci_request(struct mmc_host *mmc, struct mmc_request *mrq)
-- 
2.7.4


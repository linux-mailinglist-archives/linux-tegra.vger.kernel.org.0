Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D80C23AD8F
	for <lists+linux-tegra@lfdr.de>; Mon,  3 Aug 2020 21:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgHCToi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 3 Aug 2020 15:44:38 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6361 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728613AbgHCToh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Aug 2020 15:44:37 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2869170001>; Mon, 03 Aug 2020 12:44:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 03 Aug 2020 12:44:36 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 03 Aug 2020 12:44:36 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 3 Aug
 2020 19:44:34 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 3 Aug 2020 19:44:33 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.221]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f2869200001>; Mon, 03 Aug 2020 12:44:33 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <robh+dt@kernel.org>
CC:     <skomatineni@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>
Subject: [PATCH v1 6/6] sdhci: tegra: Add missing TMCLK for data timeout
Date:   Mon, 3 Aug 2020 12:44:23 -0700
Message-ID: <1596483863-22153-7-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596483863-22153-1-git-send-email-skomatineni@nvidia.com>
References: <1596483863-22153-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596483863; bh=RL0khgNV/Mo7/KVonblpGrj4V0qdU9NA3y6k5mWbFZE=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=I1q4QliHqe6feCiJCJyvviADZUZ0Jd8w2HV1Ik2RcA7YqVVYyMiYharpl+N75ZZZZ
         zYnh8z0JWs1DC/h/h23smxQYa9Jm4j/Q/DuWw4N9Kjtks0bXtDJ8ZhezvyYg2zgHVa
         tJGHpkc0F4ewPE8/e3metpWI3HKNobPMYZkXdXyA5EwvFZKu7UET1u22XTRlQ982Fm
         1uggQ6jLOt1GaDS+xIBMFScb330/x1hCKg6FCrfs7S7Zw+bwWHZ5cProK0blsOmSfy
         rCe9CplU7Ttb7ORSxKFpKGKOs6tkFdHejWJihNdb7CGt7nZ09WxvTOA9EUyjPrlFXn
         /mz2xpwjFkvuQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

commit b5a84ecf025a ("mmc: tegra: Add Tegra210 support")

Tegra210 and later has a separate sdmmc_legacy_tm (TMCLK) used by Tegra
SDMMC hawdware for data timeout to achive better timeout than using
SDCLK and using TMCLK is recommended.

USE_TMCLK_FOR_DATA_TIMEOUT bit in Tegra SDMMC register
SDHCI_TEGRA_VENDOR_SYS_SW_CTRL can be used to choose either TMCLK or
SDCLK for data timeout.

Default USE_TMCLK_FOR_DATA_TIMEOUT bit is set to 1 and TMCLK is used
for data timeout by Tegra SDMMC hardware and having TMCLK not enabled
is not recommended.

So, this patch fixes it.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/mmc/host/sdhci-tegra.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 31ed321..39e2195 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -140,6 +140,7 @@ struct sdhci_tegra_autocal_offsets {
 struct sdhci_tegra {
 	const struct sdhci_tegra_soc_data *soc_data;
 	struct gpio_desc *power_gpio;
+	struct clk *tmclk;
 	bool ddr_signaling;
 	bool pad_calib_required;
 	bool pad_control_available;
@@ -1611,6 +1612,44 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 		goto err_power_req;
 	}
 
+	/*
+	 * Tegra210 has a separate SDMMC_LEGACY_TM clock used for host
+	 * timeout clock and SW can choose TMCLK or SDCLK for hardware
+	 * data timeout through the bit USE_TMCLK_FOR_DATA_TIMEOUT of
+	 * the register SDHCI_TEGRA_VENDOR_SYS_SW_CTRL.
+	 *
+	 * USE_TMCLK_FOR_DATA_TIMEOUT bit default is set to 1 and SDMMC uses
+	 * 12Mhz TMCLK which is advertised in host capability register.
+	 * With TMCLK of 12Mhz provides maximum data timeout period that can
+	 * be achieved is 11s better than using SDCLK for data timeout.
+	 *
+	 * So, TMCLK is set to 12Mhz and kept enabled all the time on SoC's
+	 * supporting SDR104 mode and when not using SDCLK for data timeout.
+	 */
+
+	if ((soc_data->nvquirks & NVQUIRK_ENABLE_SDR104) &&
+	    (!soc_data->pdata->quirks & SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK)) {
+		clk = devm_clk_get(&pdev->dev, "tmclk");
+		if (IS_ERR(clk)) {
+			rc = PTR_ERR(clk);
+			if (rc == -EPROBE_DEFER)
+				goto err_power_req;
+
+			dev_warn(&pdev->dev, "failed to get tmclk: %d\n", rc);
+			clk = NULL;
+		}
+
+		clk_set_rate(clk, 12000000);
+		rc = clk_prepare_enable(clk);
+		if (rc) {
+			dev_err(&pdev->dev,
+				"failed to enable tmclk: %d\n", rc);
+			goto err_power_req;
+		}
+
+		tegra_host->tmclk = clk;
+	}
+
 	clk = devm_clk_get(mmc_dev(host->mmc), NULL);
 	if (IS_ERR(clk)) {
 		rc = PTR_ERR(clk);
@@ -1654,6 +1693,7 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 err_rst_get:
 	clk_disable_unprepare(pltfm_host->clk);
 err_clk_get:
+	clk_disable_unprepare(tegra_host->tmclk);
 err_power_req:
 err_parse_dt:
 	sdhci_pltfm_free(pdev);
@@ -1671,6 +1711,7 @@ static int sdhci_tegra_remove(struct platform_device *pdev)
 	reset_control_assert(tegra_host->rst);
 	usleep_range(2000, 4000);
 	clk_disable_unprepare(pltfm_host->clk);
+	clk_disable_unprepare(tegra_host->tmclk);
 
 	sdhci_pltfm_free(pdev);
 
-- 
2.7.4


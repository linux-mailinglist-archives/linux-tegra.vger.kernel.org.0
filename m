Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB2D23AD7F
	for <lists+linux-tegra@lfdr.de>; Mon,  3 Aug 2020 21:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbgHCToe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 3 Aug 2020 15:44:34 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18156 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728539AbgHCTod (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Aug 2020 15:44:33 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2868bf0000>; Mon, 03 Aug 2020 12:42:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 03 Aug 2020 12:44:32 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 03 Aug 2020 12:44:32 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 3 Aug
 2020 19:44:27 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 3 Aug 2020 19:44:27 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.221]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f28691a0001>; Mon, 03 Aug 2020 12:44:26 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <robh+dt@kernel.org>
CC:     <skomatineni@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>
Subject: [PATCH v1 0/6] Fix timeout clock used by hardware data timeout
Date:   Mon, 3 Aug 2020 12:44:17 -0700
Message-ID: <1596483863-22153-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596483775; bh=DGWxMyHwN4Pwyxz1yo3QTWOM2FBrW8pQbRNaJBSqU7Y=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=e6wSO29e4b3+ovgHvWaZGV/R83n0KjMEN+BhSduyfB04Ddiy/sg2ABUTed8ZMdO8N
         wgpSwv+yEcvkXQAwT/V446KYrEyVrLEiw5/zqj8eAIMMV6jz0M3tf5sAFATgbr42QI
         I0TpPDNpjNEoMmIc3753EvdF6atOwfv+B2G2PC/5RZ5ethhi0ifWJq2xMLJ0nGvCm3
         ijcSotzcaktL5jj8QEg2XLLiWMqkvBOZQZgnaPB6hUVIPnPBiiw5TFxbzGBDwdq7kg
         pyLvNZBi9XgoBfUbnH5IhHCfrANb27WW8VSRdU0X3Ex9NUVZxPzafkRmBh5cXYJiOd
         /uxB8C1ja+yRw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra210/Tegra186/Tegra194 has incorrectly enabled
SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK from the beginning of their support.

Tegra210 and later SDMMC hardware default uses sdmmc_legacy_tm (TMCLK)
all the time for hardware data timeout instead of SDCLK and this TMCLK
need to be kept enabled by Tegra sdmmc driver.

This series includes patches to fix this for Tegra210/Tegra186/Tegra194.

These patches need to be manually backported for 4.9, 4.14, 4.19, 5.4

Will send patches to backport separately once these patches are ack'd.

Sowjanya Komatineni (6):
  sdhci: tegra: Remove SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK for Tegra210
  sdhci: tegra: Remove SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK for Tegra186
  arm64: tegra: Add missing timeout clock to Tegra210 SDMMC
  arm64: tegra: Add missing timeout clock to Tegra186 SDMMC nodes
  arm64: tegra: Add missing timeout clock to Tegra194 SDMMC nodes
  sdhci: tegra: Add missing TMCLK for data timeout

 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 20 +++++++++------
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 15 ++++++-----
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 20 +++++++++------
 drivers/mmc/host/sdhci-tegra.c           | 43 ++++++++++++++++++++++++++++++--
 4 files changed, 74 insertions(+), 24 deletions(-)

-- 
2.7.4


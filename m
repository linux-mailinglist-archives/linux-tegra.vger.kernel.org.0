Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A1923B40E
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Aug 2020 06:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728867AbgHDE3b (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Aug 2020 00:29:31 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9705 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgHDE3a (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Aug 2020 00:29:30 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f28e3c80000>; Mon, 03 Aug 2020 21:27:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 03 Aug 2020 21:29:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 03 Aug 2020 21:29:30 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Aug
 2020 04:29:27 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 4 Aug 2020 04:29:27 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.221]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f28e4270000>; Mon, 03 Aug 2020 21:29:27 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <robh+dt@kernel.org>
CC:     <skomatineni@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>
Subject: [PATCH v2 2/6] sdhci: tegra: Remove SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK for Tegra186
Date:   Mon, 3 Aug 2020 21:29:19 -0700
Message-ID: <1596515363-27235-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596515363-27235-1-git-send-email-skomatineni@nvidia.com>
References: <1596515363-27235-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596515272; bh=Xg0kN+ZLnsmq3g1igRis+krnn+hehdx0cZTx8kHWSnQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=l7SVCG2xy6SqC5vBAynAAvYcQCjmNVXJbUl383WeaEWI8iaZMz+MQHX/f4N00fr56
         FsjRPPgTIfwdwLHBH6uJYVeO74Fd7vyTVMjAmq5xPCTo9uZF0DLw6HAKrM0B5gg/3M
         rE63fykpiLUjeL1DN4jHAzbYBfZpftL/3iD4VS3GBWN+iobLaNZH+U/k/UFz1akfBS
         ZwdoPs4ytAYTyT2A4e8Ewn4NQlc/3sPpP8JTwXS+xGyvth1JvZSALFnxUe3I7mjuYK
         HFxV9Tr9PIkZUmQP30+6vO25aGup0XwtE7FwhfQImkxnIveZ0gO0O0MKuO4YhvdSdU
         VxMPpON/R+rXg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

commit 4346b7c7941d ("mmc: tegra: Add Tegra186 support")

SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK is set for Tegra186 from the
beginning of its support in driver.

Tegra186 SDMMC hardware by default uses timeout clock (TMCLK) instead
of SDCLK and this quirk should not be set.

So, this patch remove this quirk for Tegra186.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/mmc/host/sdhci-tegra.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 2be3511..31ed321 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -1455,7 +1455,6 @@ static const struct sdhci_ops tegra186_sdhci_ops = {
 
 static const struct sdhci_pltfm_data sdhci_tegra186_pdata = {
 	.quirks = SDHCI_QUIRK_BROKEN_TIMEOUT_VAL |
-		  SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK |
 		  SDHCI_QUIRK_SINGLE_POWER_WRITE |
 		  SDHCI_QUIRK_NO_HISPD_BIT |
 		  SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC |
-- 
2.7.4


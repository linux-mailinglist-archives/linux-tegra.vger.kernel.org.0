Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBF11B4A97
	for <lists+linux-tegra@lfdr.de>; Wed, 22 Apr 2020 18:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgDVQdD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 22 Apr 2020 12:33:03 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:7426 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgDVQdD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Apr 2020 12:33:03 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea0714a0000>; Wed, 22 Apr 2020 09:31:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 22 Apr 2020 09:33:02 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 22 Apr 2020 09:33:02 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 16:33:02 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 22 Apr 2020 16:33:02 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.49]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ea071bd0003>; Wed, 22 Apr 2020 09:33:02 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <baolin.wang@linaro.org>, <kstewart@linuxfoundation.org>,
        <tglx@linutronix.de>, <bradleybolen@gmail.com>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <skomatineni@nvidia.com>
CC:     <anrao@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>
Subject: [PATCH 5.5.18 1/2] sdhci: tegra: Implement Tegra specific set_timeout callback
Date:   Wed, 22 Apr 2020 09:32:57 -0700
Message-ID: <1587573178-30326-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587573178-30326-1-git-send-email-skomatineni@nvidia.com>
References: <1587573178-30326-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587573066; bh=kYhxxXI3LV4oeArlKvtdIWzgGCgrp9TkYQa4roEyFZw=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=T7RZktl9cTBHMofEzSCsxdf1S+3ZDhzLuwZRI0zyxZVw7tIcw+94l6yWXPEP6dVeA
         PmMWNv08o3ffVJm1nEz4QslQOcqaoXl1X+hFEYVv7s9e6pLTj5Lwu9pvG2fOth5lVe
         EMuoaOywzlsBbEcm6GIpZY5bS+zCO76JGFPhGevcEZRSlB+8UBOWvSBhD6SMIQ7zL1
         uJpg0Dk/YTx+ml3aQLRkqhBnQNFZm9oUyAv/o957PN3WO1JTS1N9pCCCALpLU2Cw5T
         gpPc0LIw67FRmnuk3KOjcD8dahZqg68+fLxN2CEgQR2hTNcHkOjXUYD0slN/8US3Nh
         87OUbfH2m5fSA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

commit 5e958e4aacf4
("sdhci: tegra: Implement Tegra specific set_timeout callback")

Tegra host supports HW busy detection and timeouts based on the
count programmed in SDHCI_TIMEOUT_CONTROL register and max busy
timeout it supports is 11s in finite busy wait mode.

Some operations like SLEEP_AWAKE, ERASE and flush cache through
SWITCH commands take longer than 11s and Tegra host supports
infinite HW busy wait mode where HW waits forever till the card
is busy without HW timeout.

This patch implements Tegra specific set_timeout sdhci_ops to allow
switching between finite and infinite HW busy detection wait modes
based on the device command expected operation time.

Cc: <stable@vger.kernel.org>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/mmc/host/sdhci-tegra.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index a25c3a4..fa8f6a4 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -45,6 +45,7 @@
 #define SDHCI_TEGRA_CAP_OVERRIDES_DQS_TRIM_SHIFT	8
 
 #define SDHCI_TEGRA_VENDOR_MISC_CTRL			0x120
+#define SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT		BIT(0)
 #define SDHCI_MISC_CTRL_ENABLE_SDR104			0x8
 #define SDHCI_MISC_CTRL_ENABLE_SDR50			0x10
 #define SDHCI_MISC_CTRL_ENABLE_SDHCI_SPEC_300		0x20
@@ -1227,6 +1228,34 @@ static u32 sdhci_tegra_cqhci_irq(struct sdhci_host *host, u32 intmask)
 	return 0;
 }
 
+static void tegra_sdhci_set_timeout(struct sdhci_host *host,
+				    struct mmc_command *cmd)
+{
+	u32 val;
+
+	/*
+	 * HW busy detection timeout is based on programmed data timeout
+	 * counter and maximum supported timeout is 11s which may not be
+	 * enough for long operations like cache flush, sleep awake, erase.
+	 *
+	 * ERASE_TIMEOUT_LIMIT bit of VENDOR_MISC_CTRL register allows
+	 * host controller to wait for busy state until the card is busy
+	 * without HW timeout.
+	 *
+	 * So, use infinite busy wait mode for operations that may take
+	 * more than maximum HW busy timeout of 11s otherwise use finite
+	 * busy wait mode.
+	 */
+	val = sdhci_readl(host, SDHCI_TEGRA_VENDOR_MISC_CTRL);
+	if (cmd && cmd->busy_timeout >= 11 * HZ)
+		val |= SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT;
+	else
+		val &= ~SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT;
+	sdhci_writel(host, val, SDHCI_TEGRA_VENDOR_MISC_CTRL);
+
+	__sdhci_set_timeout(host, cmd);
+}
+
 static const struct cqhci_host_ops sdhci_tegra_cqhci_ops = {
 	.write_l    = tegra_cqhci_writel,
 	.enable	= sdhci_tegra_cqe_enable,
@@ -1366,6 +1395,7 @@ static const struct sdhci_ops tegra210_sdhci_ops = {
 	.set_uhs_signaling = tegra_sdhci_set_uhs_signaling,
 	.voltage_switch = tegra_sdhci_voltage_switch,
 	.get_max_clock = tegra_sdhci_get_max_clock,
+	.set_timeout = tegra_sdhci_set_timeout,
 };
 
 static const struct sdhci_pltfm_data sdhci_tegra210_pdata = {
@@ -1403,6 +1433,7 @@ static const struct sdhci_ops tegra186_sdhci_ops = {
 	.voltage_switch = tegra_sdhci_voltage_switch,
 	.get_max_clock = tegra_sdhci_get_max_clock,
 	.irq = sdhci_tegra_cqhci_irq,
+	.set_timeout = tegra_sdhci_set_timeout,
 };
 
 static const struct sdhci_pltfm_data sdhci_tegra186_pdata = {
-- 
2.7.4


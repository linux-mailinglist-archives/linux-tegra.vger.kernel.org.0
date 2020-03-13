Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B628183E6D
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Mar 2020 02:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgCMBL2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 12 Mar 2020 21:11:28 -0400
Received: from 97-93-29-23.dhcp.snlo.ca.charter.com ([97.93.29.23]:54478 "EHLO
        skomatineni-linux.nvidia.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727220AbgCMBL2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Mar 2020 21:11:28 -0400
Received: by skomatineni-linux.nvidia.com (Postfix, from userid 1000)
        id DCAC81040079; Tue, 10 Mar 2020 17:20:31 -0700 (PDT)
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        baolin.wang@linaro.org, kstewart@linuxfoundation.org,
        tglx@linutronix.de, bradleybolen@gmail.com,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc:     skomatineni@nvidia.com, anrao@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: [PATCH v2 1/2] sdhci: tegra: Implement Tegra specific set_timeout callback
Date:   Tue, 10 Mar 2020 17:20:29 -0700
Message-Id: <1583886030-11339-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

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


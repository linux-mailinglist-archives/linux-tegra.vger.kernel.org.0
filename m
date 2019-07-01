Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D260941A9F
	for <lists+linux-tegra@lfdr.de>; Wed, 12 Jun 2019 05:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406872AbfFLDPC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 11 Jun 2019 23:15:02 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:17962 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406681AbfFLDPB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 Jun 2019 23:15:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d006e320000>; Tue, 11 Jun 2019 20:14:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 11 Jun 2019 20:15:01 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 11 Jun 2019 20:15:01 -0700
Received: from jckuo-lt.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Jun
 2019 03:14:59 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <pdeschrijver@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     JC Kuo <jckuo@nvidia.com>
Subject: [PATCH] clk: tegra210: fix PLLU and PLLU_OUT1
Date:   Wed, 12 Jun 2019 11:14:34 +0800
Message-ID: <20190612031434.10055-1-jckuo@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560309298; bh=5FUPvxEoHIcBrnrq+5lfTwLCptlL0Tbs8/mtenJL3sg=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-Originating-IP:X-ClientProxiedBy:Content-Type;
        b=VuYsSdl52kud6phEwrb3yIIS7CWtmHAP7WKsOhOPBNZLnJwbkGEBQNPts+RSgu5W2
         BuxbmWRVpdR/nyQXpfLwffdym5OemZZuubH707qbcmuuBqw3/fSPLYn4N87AhLZ6B9
         YyySdz+6HaeCbIyIEHwToM+g+WK1a8WeITP0aO66KkVew1Y6SgJYsvI8DS48c0xH/D
         yE+VNgbHHzdPQsnglikeDdRWk2rX4LfBiwzGE8HS81OsYudRhGGVymEC5BwncVQJyr
         0WhDh6nfgNaLyKKfp3YR8CZIMGI/vWLCpC8Rq0tGEMqdO/yPFgTwAdRpcUzcJ4RSy0
         irqY3BtGPltEw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Full-speed and low-speed USB devices do not work with Tegra210
platforms because of incorrect PLLU/PLLU_OUT1 clock settings.

When full-speed device is connected:
[   14.059886] usb 1-3: new full-speed USB device number 2 using tegra-xusb
[   14.196295] usb 1-3: device descriptor read/64, error -71
[   14.436311] usb 1-3: device descriptor read/64, error -71
[   14.675749] usb 1-3: new full-speed USB device number 3 using tegra-xusb
[   14.812335] usb 1-3: device descriptor read/64, error -71
[   15.052316] usb 1-3: device descriptor read/64, error -71
[   15.164799] usb usb1-port3: attempt power cycle

When low-speed device is connected:
[   37.610949] usb usb1-port3: Cannot enable. Maybe the USB cable is bad?
[   38.557376] usb usb1-port3: Cannot enable. Maybe the USB cable is bad?
[   38.564977] usb usb1-port3: attempt power cycle

This commit fixes the issue by:
 1. initializing PLLU_OUT1 before initializing XUSB_FS_SRC clock
    because PLLU_OUT1 is parent of XUSB_FS_SRC.
 2. changing PLLU post-divider to /2 (DIVP=1) according to Technical
    Reference Manual.

Fixes: e745f992cf4b ("clk: tegra: Rework pll_u")
Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index e1ba62d2b1a0..b3e070fb53f9 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2204,9 +2204,9 @@ static struct div_nmp pllu_nmp = {
 };
 
 static struct tegra_clk_pll_freq_table pll_u_freq_table[] = {
-	{ 12000000, 480000000, 40, 1, 0, 0 },
-	{ 13000000, 480000000, 36, 1, 0, 0 }, /* actual: 468.0 MHz */
-	{ 38400000, 480000000, 25, 2, 0, 0 },
+	{ 12000000, 480000000, 40, 1, 1, 0 },
+	{ 13000000, 480000000, 36, 1, 1, 0 }, /* actual: 468.0 MHz */
+	{ 38400000, 480000000, 25, 2, 1, 0 },
 	{        0,         0,  0, 0, 0, 0 },
 };
 
@@ -3333,6 +3333,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA210_CLK_DFLL_REF, TEGRA210_CLK_PLL_P, 51000000, 1 },
 	{ TEGRA210_CLK_SBC4, TEGRA210_CLK_PLL_P, 12000000, 1 },
 	{ TEGRA210_CLK_PLL_RE_VCO, TEGRA210_CLK_CLK_MAX, 672000000, 1 },
+	{ TEGRA210_CLK_PLL_U_OUT1, TEGRA210_CLK_CLK_MAX, 48000000, 1 },
 	{ TEGRA210_CLK_XUSB_GATE, TEGRA210_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA210_CLK_XUSB_SS_SRC, TEGRA210_CLK_PLL_U_480M, 120000000, 0 },
 	{ TEGRA210_CLK_XUSB_FS_SRC, TEGRA210_CLK_PLL_U_48M, 48000000, 0 },
@@ -3357,7 +3358,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA210_CLK_PLL_DP, TEGRA210_CLK_CLK_MAX, 270000000, 0 },
 	{ TEGRA210_CLK_SOC_THERM, TEGRA210_CLK_PLL_P, 51000000, 0 },
 	{ TEGRA210_CLK_CCLK_G, TEGRA210_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA210_CLK_PLL_U_OUT1, TEGRA210_CLK_CLK_MAX, 48000000, 1 },
 	{ TEGRA210_CLK_PLL_U_OUT2, TEGRA210_CLK_CLK_MAX, 60000000, 1 },
 	{ TEGRA210_CLK_SPDIF_IN_SYNC, TEGRA210_CLK_CLK_MAX, 24576000, 0 },
 	{ TEGRA210_CLK_I2S0_SYNC, TEGRA210_CLK_CLK_MAX, 24576000, 0 },
-- 
2.17.1


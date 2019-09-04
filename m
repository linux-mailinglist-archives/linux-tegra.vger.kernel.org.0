Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92FE4A7A41
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Sep 2019 06:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728661AbfIDEno (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 4 Sep 2019 00:43:44 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:7334 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728744AbfIDEnn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Sep 2019 00:43:43 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d6f41020000>; Tue, 03 Sep 2019 21:43:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 03 Sep 2019 21:43:42 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 03 Sep 2019 21:43:42 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Sep
 2019 04:43:42 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 4 Sep 2019 04:43:42 +0000
Received: from kyarlagadda-linux.nvidia.com (Not Verified[10.19.64.169]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d6f40fb0000>; Tue, 03 Sep 2019 21:43:41 -0700
From:   Krishna Yarlagadda <kyarlagadda@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <jslaby@suse.com>
CC:     <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>,
        Shardar Shariff Md <smohammed@nvidia.com>
Subject: [PATCH V2 07/12] serial: tegra: set maximum num of uart ports to 8
Date:   Wed, 4 Sep 2019 10:13:02 +0530
Message-ID: <1567572187-29820-8-git-send-email-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567572187-29820-1-git-send-email-kyarlagadda@nvidia.com>
References: <1567572187-29820-1-git-send-email-kyarlagadda@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1567572226; bh=3x5h3HO0yhl3b9+zjlTEC0WOnx7x2zDMTwrAwuiCHKE=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=l8i58VhmC8jToYHHg8XC9na6ocp2c9b/xn+6VGK3hBfl0h+X1FnS1RIZfTqwUuXNe
         OUvweQ8KIEo4Fg+AWdiv7rjoTebvLcixM0agSGBiTcRm5MRKgsHAOyWW6PDJ6/fz2/
         7XWeiw8PK1Q8KYM62UmC0yA0pNrhPHrPqep2K/oQWkWrszsvAk98lgUAGhkonYLKNK
         vYBazGLXpYqpAPvxS/8h1JqefKjVud8vYWhPU5PlMF0pWQ7DJ7dgv6/+mpF0/pWEDx
         SiK//mTW4PHByCL0zxhJdkB9s3ugFQk2JdHcprolZgb0bGUNGP5iN6l3e35mNALITR
         9WVUONpwyPcCQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Set maximum number of UART ports to 8 as older chips have 5 ports and
Tergra186 and later chips will have 8 ports. Add this info to chip
data. Read device tree compatible of this driver and register uart
driver with max ports of matching chip data.

Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 drivers/tty/serial/serial-tegra.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index 69af621..8422516 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -62,7 +62,7 @@
 #define TEGRA_UART_TX_TRIG_4B			0x20
 #define TEGRA_UART_TX_TRIG_1B			0x30
 
-#define TEGRA_UART_MAXIMUM			5
+#define TEGRA_UART_MAXIMUM			8
 
 /* Default UART setting when started: 115200 no parity, stop, 8 data bits */
 #define TEGRA_UART_DEFAULT_BAUD			115200
@@ -87,6 +87,7 @@ struct tegra_uart_chip_data {
 	bool	allow_txfifo_reset_fifo_mode;
 	bool	support_clk_src_div;
 	bool	fifo_mode_enable_status;
+	int	uart_max_port;
 };
 
 struct tegra_uart_port {
@@ -1322,6 +1323,7 @@ static struct tegra_uart_chip_data tegra20_uart_chip_data = {
 	.allow_txfifo_reset_fifo_mode	= true,
 	.support_clk_src_div		= false,
 	.fifo_mode_enable_status	= false,
+	.uart_max_port			= 5,
 };
 
 static struct tegra_uart_chip_data tegra30_uart_chip_data = {
@@ -1329,6 +1331,7 @@ static struct tegra_uart_chip_data tegra30_uart_chip_data = {
 	.allow_txfifo_reset_fifo_mode	= false,
 	.support_clk_src_div		= true,
 	.fifo_mode_enable_status	= false,
+	.uart_max_port			= 5,
 };
 
 static struct tegra_uart_chip_data tegra186_uart_chip_data = {
@@ -1336,6 +1339,7 @@ static struct tegra_uart_chip_data tegra186_uart_chip_data = {
 	.allow_txfifo_reset_fifo_mode	= false,
 	.support_clk_src_div		= true,
 	.fifo_mode_enable_status	= true,
+	.uart_max_port			= 8,
 };
 
 static const struct of_device_id tegra_uart_of_match[] = {
@@ -1468,11 +1472,22 @@ static struct platform_driver tegra_uart_platform_driver = {
 static int __init tegra_uart_init(void)
 {
 	int ret;
+	struct device_node *node;
+	const struct of_device_id *match = NULL;
+	const struct tegra_uart_chip_data *cdata = NULL;
+
+	node = of_find_matching_node(NULL, tegra_uart_of_match);
+	if (node)
+		match = of_match_node(tegra_uart_of_match, node);
+	if (match)
+		cdata = match->data;
+	if (cdata)
+		tegra_uart_driver.nr = cdata->uart_max_port;
 
 	ret = uart_register_driver(&tegra_uart_driver);
 	if (ret < 0) {
 		pr_err("Could not register %s driver\n",
-			tegra_uart_driver.driver_name);
+		       tegra_uart_driver.driver_name);
 		return ret;
 	}
 
-- 
2.7.4


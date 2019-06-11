Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0D63C97A
	for <lists+linux-tegra@lfdr.de>; Tue, 11 Jun 2019 12:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbfFKK4M (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 11 Jun 2019 06:56:12 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:6304 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfFKK4M (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 Jun 2019 06:56:12 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cff88cc0000>; Tue, 11 Jun 2019 03:56:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 11 Jun 2019 03:56:10 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 11 Jun 2019 03:56:10 -0700
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 11 Jun
 2019 10:51:20 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 11 Jun 2019 10:51:19 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cff87a50000>; Tue, 11 Jun 2019 03:51:19 -0700
From:   Bitan Biswas <bbiswas@nvidia.com>
To:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V5 1/7] i2c: tegra: clean up macros
Date:   Tue, 11 Jun 2019 03:51:08 -0700
Message-ID: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560250572; bh=ottEE2XiiiPbfH/Skr0UtzLGEI1kOObrtR9qGE7imE4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=L4gbdTex/r20AkmMr2mCNWPSLi2t6BZtg1pXS3fSDgtFMlWey7+Suwn9zEzrsnzLq
         0/IWrjCoJi/nyGeHroRBFJXMLx6hDnJRAPDvrdJ5ybNgoG3poES3RnPHXE4fEOoB9Q
         ottN1yf6xav1qtqUeKNIY1qlsQSYb4KcMNKu9UhRrKcx0NGFUpUQzIjeF6MitPtWfI
         OzJM7F7WYyOzb8GEIajv4q4uZJuObhQP7Uh3OUr3Th0tbokAwm8Y8dX/92BtgfEWpG
         ZhzFR6MGKBrq1KmiZLlRqHeujvC7W/N+GL3Ftd83mrWCBpEk9M8HDjtkyV/r4n4jEQ
         XWHzOhmKm4Oyg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Clean up macros by:
1) removing unused macros
2) replace constants by macro BIT()

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1dbba39..00692d8 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -54,20 +54,15 @@
 #define I2C_INT_STATUS				0x068
 #define I2C_INT_BUS_CLR_DONE			BIT(11)
 #define I2C_INT_PACKET_XFER_COMPLETE		BIT(7)
-#define I2C_INT_ALL_PACKETS_XFER_COMPLETE	BIT(6)
-#define I2C_INT_TX_FIFO_OVERFLOW		BIT(5)
-#define I2C_INT_RX_FIFO_UNDERFLOW		BIT(4)
 #define I2C_INT_NO_ACK				BIT(3)
 #define I2C_INT_ARBITRATION_LOST		BIT(2)
 #define I2C_INT_TX_FIFO_DATA_REQ		BIT(1)
 #define I2C_INT_RX_FIFO_DATA_REQ		BIT(0)
 #define I2C_CLK_DIVISOR				0x06c
 #define I2C_CLK_DIVISOR_STD_FAST_MODE_SHIFT	16
-#define I2C_CLK_MULTIPLIER_STD_FAST_MODE	8
 
 #define DVC_CTRL_REG1				0x000
 #define DVC_CTRL_REG1_INTR_EN			BIT(10)
-#define DVC_CTRL_REG2				0x004
 #define DVC_CTRL_REG3				0x008
 #define DVC_CTRL_REG3_SW_PROG			BIT(26)
 #define DVC_CTRL_REG3_I2C_DONE_INTR_EN		BIT(30)
@@ -75,24 +70,21 @@
 #define DVC_STATUS_I2C_DONE_INTR		BIT(30)
 
 #define I2C_ERR_NONE				0x00
-#define I2C_ERR_NO_ACK				0x01
-#define I2C_ERR_ARBITRATION_LOST		0x02
-#define I2C_ERR_UNKNOWN_INTERRUPT		0x04
+#define I2C_ERR_NO_ACK				BIT(0)
+#define I2C_ERR_ARBITRATION_LOST		BIT(1)
+#define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
 
 #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
 #define PACKET_HEADER0_PACKET_ID_SHIFT		16
 #define PACKET_HEADER0_CONT_ID_SHIFT		12
 #define PACKET_HEADER0_PROTOCOL_I2C		BIT(4)
 
-#define I2C_HEADER_HIGHSPEED_MODE		BIT(22)
 #define I2C_HEADER_CONT_ON_NAK			BIT(21)
-#define I2C_HEADER_SEND_START_BYTE		BIT(20)
 #define I2C_HEADER_READ				BIT(19)
 #define I2C_HEADER_10BIT_ADDR			BIT(18)
 #define I2C_HEADER_IE_ENABLE			BIT(17)
 #define I2C_HEADER_REPEAT_START			BIT(16)
 #define I2C_HEADER_CONTINUE_XFER		BIT(15)
-#define I2C_HEADER_MASTER_ADDR_SHIFT		12
 #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
 
 #define I2C_BUS_CLEAR_CNFG			0x084
@@ -106,8 +98,6 @@
 
 #define I2C_CONFIG_LOAD				0x08C
 #define I2C_MSTR_CONFIG_LOAD			BIT(0)
-#define I2C_SLV_CONFIG_LOAD			BIT(1)
-#define I2C_TIMEOUT_CONFIG_LOAD			BIT(2)
 
 #define I2C_CLKEN_OVERRIDE			0x090
 #define I2C_MST_CORE_CLKEN_OVR			BIT(0)
@@ -133,7 +123,6 @@
 #define I2C_STANDARD_MODE			100000
 #define I2C_FAST_MODE				400000
 #define I2C_FAST_PLUS_MODE			1000000
-#define I2C_HS_MODE				3500000
 
 /* Packet header size in bytes */
 #define I2C_PACKET_HEADER_SIZE			12
-- 
2.7.4


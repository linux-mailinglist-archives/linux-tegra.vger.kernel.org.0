Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDE525EFBC
	for <lists+linux-tegra@lfdr.de>; Sun,  6 Sep 2020 20:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729376AbgIFSyP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 6 Sep 2020 14:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729208AbgIFSwD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 6 Sep 2020 14:52:03 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F834C061796;
        Sun,  6 Sep 2020 11:52:01 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id q8so6400556lfb.6;
        Sun, 06 Sep 2020 11:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RFqJabtM9VjAnQjTKMkNTKLQzvGNeUed/phYy3sgVsA=;
        b=EO16ND4PCtTeP01O13vvpPm4TnQtcoJq1ycudBBcl0pkcSaEAWoeixGAptQ2l1fjbh
         TcE2kSrdMC8ggqPy0oB5XVH4WmMW53hzq6wxi/M9GDRgJXtb7D/IW9ejVq9ewBpA72F8
         LJmsMgDd5JnhrNtX3gswecmqZ9JJr4dNjVVCy2+RLNpi9+90tIbc5G8WIwH2K3ABsTk6
         E7GY+A9//eBwcWe+GUOJ7DmRzJu2er2/nLp4ZQARw6+991Acv1HaZSvzuZIeGS5YvGor
         92tRv0kRfBAsPB26unWKcgFSp8ZnILBXklDxtFpJNOpS1z3TqYuUoay1l4+QujZIWs6s
         0lKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RFqJabtM9VjAnQjTKMkNTKLQzvGNeUed/phYy3sgVsA=;
        b=Fb+5fmfpUINQhk//fDEt83kXhxTzg79dAxd5kRHqQm/4mAlnE4FyDr4Lza2NFT+Hzp
         gd95lTgzk2fIhmNt6QjRQvDTKIvdi8NhxRH4tqQz/4GStVs/GChiqMZeJ9yrynNADL27
         wtiGy5b/pT0GpJv2y69zXz8SQnA6AwUwpapxCFzSuWSgogi0sfpAWy/maFr4sW2K2u3j
         mVMbipATiTYUwfPajLG3pIhSk+BO+pEi1YVPE8cY8aTU4t2wjcdW3EI0FYxZz6qMbMZX
         CPd/iApbIVCdt6T7EeNFdrkehpNdlOYky1xU7cfCSpzbUaH4Ccj1QmAYNNxm6ZOCSjF9
         2k9A==
X-Gm-Message-State: AOAM530R0tbjxcdvFfF05oaxFnW2YxLI+jLgtYM3y7PvZ3HzPPTHence
        l8kRz7CCJDnm9gLpYXAxde9tp1LVsDI=
X-Google-Smtp-Source: ABdhPJx/iWDRKUJfI6bVjGX4hGI8aHCF/+vhAy0aNk8mjSt/ag1zineackrBmsqWNhgtQWa3yaDbXw==
X-Received: by 2002:a19:7e8d:: with SMTP id z135mr8633999lfc.158.1599418320071;
        Sun, 06 Sep 2020 11:52:00 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:59 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 24/36] i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_msg()
Date:   Sun,  6 Sep 2020 21:50:27 +0300
Message-Id: <20200906185039.22700-25-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The code related to packet header setting up is a bit messy and makes
tegra_i2c_xfer_msg() more difficult to read than it could be. Let's
factor the packet header setup from tegra_i2c_xfer_msg() into separate
function in order to make code easier to read and follow.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 93 ++++++++++++++++++++--------------
 1 file changed, 54 insertions(+), 39 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 7e1bab9c9ccd..85e4a3b61e4a 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1128,6 +1128,57 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	return -EAGAIN;
 }
 
+static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
+					 struct i2c_msg *msg,
+					 enum msg_end_type end_state)
+{
+	u32 *dma_buf = i2c_dev->dma_buf;
+	u32 packet_header;
+
+	packet_header = FIELD_PREP(PACKET_HEADER0_HEADER_SIZE, 0) |
+			FIELD_PREP(PACKET_HEADER0_PROTOCOL,
+				   PACKET_HEADER0_PROTOCOL_I2C) |
+			FIELD_PREP(PACKET_HEADER0_CONT_ID, i2c_dev->cont_id) |
+			FIELD_PREP(PACKET_HEADER0_PACKET_ID, 1);
+
+	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
+		*dma_buf++ = packet_header;
+	else
+		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
+
+	packet_header = msg->len - 1;
+
+	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
+		*dma_buf++ = packet_header;
+	else
+		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
+
+	packet_header = I2C_HEADER_IE_ENABLE;
+
+	if (end_state == MSG_END_CONTINUE)
+		packet_header |= I2C_HEADER_CONTINUE_XFER;
+	else if (end_state == MSG_END_REPEAT_START)
+		packet_header |= I2C_HEADER_REPEAT_START;
+
+	if (msg->flags & I2C_M_TEN) {
+		packet_header |= msg->addr;
+		packet_header |= I2C_HEADER_10BIT_ADDR;
+	} else {
+		packet_header |= msg->addr << I2C_HEADER_SLAVE_ADDR_SHIFT;
+	}
+
+	if (msg->flags & I2C_M_IGNORE_NAK)
+		packet_header |= I2C_HEADER_CONT_ON_NAK;
+
+	if (msg->flags & I2C_M_RD)
+		packet_header |= I2C_HEADER_READ;
+
+	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
+		*dma_buf++ = packet_header;
+	else
+		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
+}
+
 static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
 				   struct i2c_msg *msg)
 {
@@ -1159,9 +1210,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			      enum msg_end_type end_state)
 {
 	unsigned long time_left, xfer_time = 100;
-	u32 packet_header, int_mask;
-	u32 *buffer = NULL;
 	size_t xfer_size;
+	u32 int_mask;
 	int err;
 
 	err = tegra_i2c_flush_fifos(i2c_dev);
@@ -1216,49 +1266,14 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						i2c_dev->dma_phys,
 						xfer_size,
 						DMA_TO_DEVICE);
-			buffer = i2c_dev->dma_buf;
 		}
 	}
 
-	packet_header = FIELD_PREP(PACKET_HEADER0_HEADER_SIZE, 0) |
-			FIELD_PREP(PACKET_HEADER0_PROTOCOL,
-				   PACKET_HEADER0_PROTOCOL_I2C) |
-			FIELD_PREP(PACKET_HEADER0_CONT_ID, i2c_dev->cont_id) |
-			FIELD_PREP(PACKET_HEADER0_PACKET_ID, 1);
-	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
-		*buffer++ = packet_header;
-	else
-		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
-
-	packet_header = msg->len - 1;
-	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
-		*buffer++ = packet_header;
-	else
-		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
-
-	packet_header = I2C_HEADER_IE_ENABLE;
-	if (end_state == MSG_END_CONTINUE)
-		packet_header |= I2C_HEADER_CONTINUE_XFER;
-	else if (end_state == MSG_END_REPEAT_START)
-		packet_header |= I2C_HEADER_REPEAT_START;
-	if (msg->flags & I2C_M_TEN) {
-		packet_header |= msg->addr;
-		packet_header |= I2C_HEADER_10BIT_ADDR;
-	} else {
-		packet_header |= msg->addr << I2C_HEADER_SLAVE_ADDR_SHIFT;
-	}
-	if (msg->flags & I2C_M_IGNORE_NAK)
-		packet_header |= I2C_HEADER_CONT_ON_NAK;
-	if (msg->flags & I2C_M_RD)
-		packet_header |= I2C_HEADER_READ;
-	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
-		*buffer++ = packet_header;
-	else
-		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
+	tegra_i2c_push_packet_header(i2c_dev, msg, end_state);
 
 	if (!i2c_dev->msg_read) {
 		if (i2c_dev->is_curr_dma_xfer) {
-			memcpy(buffer, msg->buf, msg->len);
+			memcpy(i2c_dev->dma_buf, msg->buf, msg->len);
 			dma_sync_single_for_device(i2c_dev->dev,
 						   i2c_dev->dma_phys,
 						   xfer_size,
-- 
2.27.0


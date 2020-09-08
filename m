Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 991D9260849
	for <lists+linux-tegra@lfdr.de>; Tue,  8 Sep 2020 04:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbgIHCNo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 7 Sep 2020 22:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728396AbgIHCMU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Sep 2020 22:12:20 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5CA1C061797;
        Mon,  7 Sep 2020 19:12:06 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w3so18003237ljo.5;
        Mon, 07 Sep 2020 19:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s4OxMYUpxrlcvwprS6HxjKIWRXowGXnjPJZcDCzog/A=;
        b=l81cf+0HznD8alqlUtXXqzHqe7+BbckiDenUb2EZD9Xq4wt0nmTRYVGbDdePbYSmB1
         167I/3ko1QV3lHz0BcW7F6OMQnInRquw5n1ow0xdkai0zbq8qsVxWVeg2f9ovzMrg8rj
         Mn4ej61MXSmRnsjX8Lug/+5rE4Daw9jUKmU46S+6+QUGLYiv0U6ha+j4ygZDF3A0hbts
         tZujrm6mV0wGAafP6eTczXOcQtmLZySBLHjgn3YX/rMxWaa1rwffzvO3a5ib8bonHND8
         l6tNGcqNF2S9KVmSxs2RLMZgOU1zSqwhMJJUp/+weHpr2LKsGeKeXtw7BmfGfcM/vtuA
         XevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s4OxMYUpxrlcvwprS6HxjKIWRXowGXnjPJZcDCzog/A=;
        b=ag8iYX4KCBubNdpMFY1k5T6kvLE2RXxQopFhN89lxbBeK1Wr5XzgoyK/dnypli0TVb
         zjubCNJUkaSoKOeYrilMXfPrzSpsbRCQHcosCf2oHBWYLMTwmQ6nN6PfEfV3HjRpdRKn
         RkvHdH0326iWVehFqhaSIU6vi/4H9a4J6rmymj2+A1Ua4lDEQ7JBLso/hvqu29R/tJ76
         tVJyD2WEvQmJy0I6yE/PGwkMVqKZl+m5TTiNxajuTMz02rja9umMTR/0DPWAVQ/Gvr40
         MGdwX+/3dRY+Z7/EksHqmJkTH9ivKG3B9hovpgQkwCFDUbNB1aZZOrEMS23ZirRVpPQ9
         c3vQ==
X-Gm-Message-State: AOAM5337WTrEsQAHMU2nQn+cSKFZCqoREw6mqcOxmljPw6e8bhRhIlJR
        4wFnMd7DAyXaxt36iXPa3j4=
X-Google-Smtp-Source: ABdhPJx0nfVAgMLqfwSqS3Drn/GW5CfhFfZveTn0FVFYKxwygDNGWLCBG50M+8nEx9+Si9lj4Yn5UA==
X-Received: by 2002:a2e:93cd:: with SMTP id p13mr12020958ljh.460.1599531125309;
        Mon, 07 Sep 2020 19:12:05 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:12:04 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 33/35] i2c: tegra: Clean up and improve comments
Date:   Tue,  8 Sep 2020 05:10:19 +0300
Message-Id: <20200908021021.9123-34-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Make all comments to be consistent in regards to capitalization and
punctuation, correct spelling and grammar errors, improve wording.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 88 ++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 41 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 56a7f696e425..8b2be44cec2f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -136,7 +136,7 @@
 /* configuration load timeout in microseconds */
 #define I2C_CONFIG_LOAD_TIMEOUT			1000000
 
-/* Packet header size in bytes */
+/* packet header size in bytes */
 #define I2C_PACKET_HEADER_SIZE			12
 
 /*
@@ -148,11 +148,10 @@
 #define I2C_PIO_MODE_PREFERRED_LEN		32
 
 /*
- * msg_end_type: The bus control which need to be send at end of transfer.
- * @MSG_END_STOP: Send stop pulse at end of transfer.
- * @MSG_END_REPEAT_START: Send repeat start at end of transfer.
- * @MSG_END_CONTINUE: The following on message is coming and so do not send
- *		stop or repeat start.
+ * msg_end_type: The bus control which needs to be sent at end of transfer.
+ * @MSG_END_STOP: Send stop pulse.
+ * @MSG_END_REPEAT_START: Send repeat-start.
+ * @MSG_END_CONTINUE: Don't send stop or repeat-start.
  */
 enum msg_end_type {
 	MSG_END_STOP,
@@ -161,10 +160,10 @@ enum msg_end_type {
 };
 
 /**
- * struct tegra_i2c_hw_feature : Different HW support on Tegra
- * @has_continue_xfer_support: Continue transfer supports.
+ * struct tegra_i2c_hw_feature : per hardware generation features
+ * @has_continue_xfer_support: Continue-transfer supported.
  * @has_per_pkt_xfer_complete_irq: Has enable/disable capability for transfer
- *		complete interrupt per packet basis.
+ *		completion interrupt on per packet basis.
  * @has_config_load_reg: Has the config load register to load the new
  *		configuration.
  * @clk_divisor_hs_mode: Clock divisor in HS mode.
@@ -184,7 +183,7 @@ enum msg_end_type {
  * @has_mst_fifo: The I2C controller contains the new MST FIFO interface that
  *		provides additional features and allows for longer messages to
  *		be transferred in one go.
- * @quirks: i2c adapter quirks for limiting write/read transfer size and not
+ * @quirks: I2C adapter quirks for limiting write/read transfer size and not
  *		allowing 0 length transfers.
  * @supports_bus_clear: Bus Clear support to recover from bus hang during
  *		SDA stuck low from device for some unknown reasons.
@@ -245,7 +244,7 @@ struct tegra_i2c_hw_feature {
  * @msg_err: error code for completed message
  * @msg_buf: pointer to current message data
  * @msg_buf_remaining: size of unsent data in the message buffer
- * @msg_read: identifies read transfers
+ * @msg_read: indicates read direction of a transfer
  * @bus_clk_rate: current I2C bus clock rate
  * @multimaster_mode: indicates that I2C controller is in multi-master mode
  * @tx_dma_chan: DMA transmit channel
@@ -306,8 +305,8 @@ static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, u32 reg)
 }
 
 /*
- * i2c_writel and i2c_readl will offset the register if necessary to talk
- * to the I2C block inside the DVC block
+ * If necessary, i2c_writel() and i2c_readl() will offset the register
+ * in order to talk to the I2C block inside the DVC block.
  */
 static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev, u32 reg)
 {
@@ -322,7 +321,7 @@ static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val, u32 reg)
 {
 	writel_relaxed(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 
-	/* Read back register to make sure that register writes completed */
+	/* read back register to make sure that register writes completed */
 	if (reg != I2C_TX_FIFO)
 		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 }
@@ -474,7 +473,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
  * block.  This block is identical to the rest of the I2C blocks, except that
  * it only supports master mode, it has registers moved around, and it needs
  * some extra init to get it into I2C mode.  The register moves are handled
- * by i2c_readl and i2c_writel
+ * by i2c_readl() and i2c_writel().
  */
 static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
 {
@@ -632,7 +631,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		break;
 	}
 
-	/* Make sure clock divisor programmed correctly */
+	/* make sure clock divisor programmed correctly */
 	clk_divisor = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
 				 i2c_dev->hw->clk_divisor_hs_mode) |
 		      FIELD_PREP(I2C_CLK_DIVISOR_STD_FAST_MODE, non_hs_mode);
@@ -645,8 +644,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	}
 
 	/*
-	 * configure setup and hold times only when tsu_thd is non-zero.
-	 * otherwise, preserve the chip default values
+	 * Configure setup and hold times only when tsu_thd is non-zero.
+	 * Otherwise, preserve the chip default values.
 	 */
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
 		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
@@ -690,7 +689,7 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
 
 	/*
 	 * NACK interrupt is generated before the I2C controller generates
-	 * the STOP condition on the bus. So wait for 2 clock periods
+	 * the STOP condition on the bus.  So, wait for 2 clock periods
 	 * before disabling the controller so that the STOP condition has
 	 * been delivered properly.
 	 */
@@ -711,8 +710,8 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 	u32 val;
 
 	/*
-	 * Catch overflow due to message fully sent
-	 * before the check for RX FIFO availability.
+	 * Catch overflow due to message fully sent before the check for
+	 * RX FIFO availability.
 	 */
 	if (WARN_ON_ONCE(!(i2c_dev->msg_buf_remaining)))
 		return -EINVAL;
@@ -725,7 +724,7 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 		rx_fifo_avail = FIELD_GET(I2C_FIFO_STATUS_RX, val);
 	}
 
-	/* Rounds down to not include partial word at the end of buf */
+	/* round down to exclude partial word at the end of buffer */
 	words_to_transfer = buf_remaining / BYTES_PER_FIFO_WORD;
 	if (words_to_transfer > rx_fifo_avail)
 		words_to_transfer = rx_fifo_avail;
@@ -737,8 +736,8 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 	rx_fifo_avail -= words_to_transfer;
 
 	/*
-	 * If there is a partial word at the end of buf, handle it manually to
-	 * prevent overwriting past the end of buf
+	 * If there is a partial word at the end of buffer, handle it
+	 * manually to prevent overwriting past the end of buffer.
 	 */
 	if (rx_fifo_avail > 0 && buf_remaining > 0) {
 		/*
@@ -778,10 +777,15 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		tx_fifo_avail = FIELD_GET(I2C_FIFO_STATUS_TX, val);
 	}
 
-	/* Rounds down to not include partial word at the end of buf */
+	/* round down to exclude partial word at the end of buffer */
 	words_to_transfer = buf_remaining / BYTES_PER_FIFO_WORD;
 
-	/* It's very common to have < 4 bytes, so optimize that case. */
+	/*
+	 * This hunk pushes 4 bytes at a time into the TX FIFO.
+	 *
+	 * It's very common to have < 4 bytes, hence there is no word
+	 * to push if we have less than 4 bytes to transfer.
+	 */
 	if (words_to_transfer) {
 		if (words_to_transfer > tx_fifo_avail)
 			words_to_transfer = tx_fifo_avail;
@@ -805,8 +809,8 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 	}
 
 	/*
-	 * If there is a partial word at the end of buf, handle it manually to
-	 * prevent reading past the end of buf, which could cross a page
+	 * If there is a partial word at the end of buffer, handle it manually
+	 * to prevent reading past the end of buffer, which could cross a page
 	 * boundary and fault.
 	 */
 	if (tx_fifo_avail > 0 && buf_remaining > 0) {
@@ -854,7 +858,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	}
 
 	/*
-	 * I2C transfer is terminated during the bus clear so skip
+	 * I2C transfer is terminated during the bus clear, so skip
 	 * processing the other interrupts.
 	 */
 	if (i2c_dev->hw->supports_bus_clear && (status & I2C_INT_BUS_CLR_DONE))
@@ -890,7 +894,8 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	 * During message read XFER_COMPLETE interrupt is triggered prior to
 	 * DMA completion and during message write XFER_COMPLETE interrupt is
 	 * triggered after DMA completion.
-	 * PACKETS_XFER_COMPLETE indicates completion of all bytes of transfer.
+	 *
+	 * PACKETS_XFER_COMPLETE indicates completion of all bytes of transfer,
 	 * so forcing msg_buf_remaining to 0 in DMA mode.
 	 */
 	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
@@ -908,7 +913,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	}
 	goto done;
 err:
-	/* An error occurred, mask all interrupts */
+	/* mask all interrupts on error */
 	tegra_i2c_mask_irq(i2c_dev, I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST |
 		I2C_INT_PACKET_XFER_COMPLETE | I2C_INT_TX_FIFO_DATA_REQ |
 		I2C_INT_RX_FIFO_DATA_REQ);
@@ -1338,6 +1343,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 		enum msg_end_type end_type = MSG_END_STOP;
 
 		if (i < (num - 1)) {
+			/* check whether follow up message is coming */
 			if (msgs[i + 1].flags & I2C_M_NOSTART)
 				end_type = MSG_END_CONTINUE;
 			else
@@ -1567,7 +1573,6 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_interface_timing_reg = true,
 };
 
-/* Match table for of_platform binding */
 static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
@@ -1591,7 +1596,7 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 	err = of_property_read_u32(np, "clock-frequency",
 				   &i2c_dev->bus_clk_rate);
 	if (err)
-		i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ; /* default clock rate */
+		i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;
 
 	multi_mode = of_property_read_bool(np, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
@@ -1723,11 +1728,13 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		goto release_clocks;
 
 	/*
-	 * VI I2C is in VE power domain which is not always on and not
-	 * an IRQ safe. So, IRQ safe device can't be attached to a non-IRQ
-	 * safe domain as it prevents powering off the PM domain.
-	 * Also, VI I2C device don't need to use runtime IRQ safe as it will
-	 * not be used for atomic transfers.
+	 * VI I2C is in VE power domain which is not always ON and not
+	 * IRQ-safe.  Thus, IRQ-safe device shouldn't be attached to a
+	 * non IRQ-safe domain because this prevents powering off the power
+	 * domain.
+	 *
+	 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
+	 * be used for atomic transfers.
 	 */
 	if (!i2c_dev->is_vi)
 		pm_runtime_irq_safe(i2c_dev->dev);
@@ -1800,9 +1807,8 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 
 	/*
 	 * VI I2C device is attached to VE power domain which goes through
-	 * power ON/OFF during PM runtime resume/suspend. So, controller
-	 * should go through reset and need to re-initialize after power
-	 * domain ON.
+	 * power ON/OFF during of runtime PM resume/suspend, meaning that
+	 * controller needs to be re-initialized after power ON.
 	 */
 	if (i2c_dev->is_vi) {
 		err = tegra_i2c_init(i2c_dev);
-- 
2.27.0


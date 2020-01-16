Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5924713EE55
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jan 2020 19:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394620AbgAPSII (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jan 2020 13:08:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:54892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393303AbgAPRix (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jan 2020 12:38:53 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 04B4E246E1;
        Thu, 16 Jan 2020 17:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579196332;
        bh=GdKoGirsYV+pL2JkHgUCMeVE7Wp5Jmi59sSWNwoXwPU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=s3bLOiYFfAHAHCwN7VNe+ttHg7IPMeRQg90Sx/SoiZQm5NcaBDfx7gj1OyASsA3AZ
         xpLOQoazy2tiGGsF598ixbrbgHAaEWm/XwFag1MuAI2Iwsjhb8mxjRsQzdyTfaKPSB
         QG3v1VWMcQ4JnxLDpaWShzVOYHQnfCWYu9XttSBs=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Sameer Pujar <spujar@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
        dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 132/251] dmaengine: tegra210-adma: restore channel status
Date:   Thu, 16 Jan 2020 12:34:41 -0500
Message-Id: <20200116173641.22137-92-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116173641.22137-1-sashal@kernel.org>
References: <20200116173641.22137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Sameer Pujar <spujar@nvidia.com>

[ Upstream commit f33e7bb3eb922618612a90f0a828c790e8880773 ]

Status of ADMA channel registers is not saved and restored during system
suspend. During active playback if system enters suspend, this results in
wrong state of channel registers during system resume and playback fails
to resume properly. Fix this by saving following channel registers in
runtime suspend and restore during runtime resume.
 * ADMA_CH_LOWER_SRC_ADDR
 * ADMA_CH_LOWER_TRG_ADDR
 * ADMA_CH_FIFO_CTRL
 * ADMA_CH_CONFIG
 * ADMA_CH_CTRL
 * ADMA_CH_CMD
 * ADMA_CH_TC
Runtime PM calls will be inovked during system resume path if a playback
or capture needs to be resumed. Hence above changes work fine for system
suspend case.

Fixes: f46b195799b5 ("dmaengine: tegra-adma: Add support for Tegra210 ADMA")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/tegra210-adma.c | 46 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index e9e46a520745..8c3cab463354 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -98,6 +98,7 @@ struct tegra_adma_chan_regs {
 	unsigned int src_addr;
 	unsigned int trg_addr;
 	unsigned int fifo_ctrl;
+	unsigned int cmd;
 	unsigned int tc;
 };
 
@@ -127,6 +128,7 @@ struct tegra_adma_chan {
 	enum dma_transfer_direction	sreq_dir;
 	unsigned int			sreq_index;
 	bool				sreq_reserved;
+	struct tegra_adma_chan_regs	ch_regs;
 
 	/* Transfer count and position info */
 	unsigned int			tx_buf_count;
@@ -635,8 +637,30 @@ static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
 static int tegra_adma_runtime_suspend(struct device *dev)
 {
 	struct tegra_adma *tdma = dev_get_drvdata(dev);
+	struct tegra_adma_chan_regs *ch_reg;
+	struct tegra_adma_chan *tdc;
+	int i;
 
 	tdma->global_cmd = tdma_read(tdma, ADMA_GLOBAL_CMD);
+	if (!tdma->global_cmd)
+		goto clk_disable;
+
+	for (i = 0; i < tdma->nr_channels; i++) {
+		tdc = &tdma->channels[i];
+		ch_reg = &tdc->ch_regs;
+		ch_reg->cmd = tdma_ch_read(tdc, ADMA_CH_CMD);
+		/* skip if channel is not active */
+		if (!ch_reg->cmd)
+			continue;
+		ch_reg->tc = tdma_ch_read(tdc, ADMA_CH_TC);
+		ch_reg->src_addr = tdma_ch_read(tdc, ADMA_CH_LOWER_SRC_ADDR);
+		ch_reg->trg_addr = tdma_ch_read(tdc, ADMA_CH_LOWER_TRG_ADDR);
+		ch_reg->ctrl = tdma_ch_read(tdc, ADMA_CH_CTRL);
+		ch_reg->fifo_ctrl = tdma_ch_read(tdc, ADMA_CH_FIFO_CTRL);
+		ch_reg->config = tdma_ch_read(tdc, ADMA_CH_CONFIG);
+	}
+
+clk_disable:
 	clk_disable_unprepare(tdma->ahub_clk);
 
 	return 0;
@@ -645,7 +669,9 @@ static int tegra_adma_runtime_suspend(struct device *dev)
 static int tegra_adma_runtime_resume(struct device *dev)
 {
 	struct tegra_adma *tdma = dev_get_drvdata(dev);
-	int ret;
+	struct tegra_adma_chan_regs *ch_reg;
+	struct tegra_adma_chan *tdc;
+	int ret, i;
 
 	ret = clk_prepare_enable(tdma->ahub_clk);
 	if (ret) {
@@ -654,6 +680,24 @@ static int tegra_adma_runtime_resume(struct device *dev)
 	}
 	tdma_write(tdma, ADMA_GLOBAL_CMD, tdma->global_cmd);
 
+	if (!tdma->global_cmd)
+		return 0;
+
+	for (i = 0; i < tdma->nr_channels; i++) {
+		tdc = &tdma->channels[i];
+		ch_reg = &tdc->ch_regs;
+		/* skip if channel was not active earlier */
+		if (!ch_reg->cmd)
+			continue;
+		tdma_ch_write(tdc, ADMA_CH_TC, ch_reg->tc);
+		tdma_ch_write(tdc, ADMA_CH_LOWER_SRC_ADDR, ch_reg->src_addr);
+		tdma_ch_write(tdc, ADMA_CH_LOWER_TRG_ADDR, ch_reg->trg_addr);
+		tdma_ch_write(tdc, ADMA_CH_CTRL, ch_reg->ctrl);
+		tdma_ch_write(tdc, ADMA_CH_FIFO_CTRL, ch_reg->fifo_ctrl);
+		tdma_ch_write(tdc, ADMA_CH_CONFIG, ch_reg->config);
+		tdma_ch_write(tdc, ADMA_CH_CMD, ch_reg->cmd);
+	}
+
 	return 0;
 }
 
-- 
2.20.1


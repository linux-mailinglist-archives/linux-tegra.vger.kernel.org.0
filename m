Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3F7CE78B
	for <lists+linux-tegra@lfdr.de>; Mon,  7 Oct 2019 17:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbfJGPbl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 7 Oct 2019 11:31:41 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:56068 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728390AbfJGPbl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Oct 2019 11:31:41 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iHUz4-0003mf-P5; Mon, 07 Oct 2019 16:31:38 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iHUz4-0001IL-CI; Mon, 07 Oct 2019 16:31:38 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@lists.codethink.co.uk,
        Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v4 4/7] ASoC: tegra: disable rx_fifo after disable stream
Date:   Mon,  7 Oct 2019 16:31:33 +0100
Message-Id: <20191007153136.4920-5-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007153136.4920-1-ben.dooks@codethink.co.uk>
References: <20191007153136.4920-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

We see odd FIFO overruns with this, we assume the best thing to do is
to disable the RX I2S frontend first, and then disable the FIFO that
is using it.

This also fixes an issue where using multi-word frames (TDM) have
partial samples stuck in the FIFO which then get read out when the
next capture is started.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 sound/soc/tegra/tegra30_i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 7382f7949bf4..f87ab1e36369 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -236,9 +236,9 @@ static void tegra30_i2s_start_capture(struct tegra30_i2s *i2s)
 
 static void tegra30_i2s_stop_capture(struct tegra30_i2s *i2s)
 {
-	tegra30_ahub_disable_rx_fifo(i2s->capture_fifo_cif);
 	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL,
 			   TEGRA30_I2S_CTRL_XFER_EN_RX, 0);
+	tegra30_ahub_disable_rx_fifo(i2s->capture_fifo_cif);
 }
 
 static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
-- 
2.23.0


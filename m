Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D284B54FF
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Sep 2019 20:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbfIQSMi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 17 Sep 2019 14:12:38 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:46167 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728514AbfIQSMh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Sep 2019 14:12:37 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iAHxq-0003oD-Ko; Tue, 17 Sep 2019 19:12:34 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iAHxq-0000BF-7H; Tue, 17 Sep 2019 19:12:34 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>
Subject: [PATCH 1/8] ASoC: tegra: Add a TDM configuration callback
Date:   Tue, 17 Sep 2019 19:12:26 +0100
Message-Id: <20190917181233.534-2-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917181233.534-1-ben.dooks@codethink.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Edward Cragg <edward.cragg@codethink.co.uk>

Add a callback to configure TDM settings for the Tegra30 I2S ASoC 'platform'
driver.

Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
---
 sound/soc/tegra/tegra30_i2s.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index ac6983c6bd72..d36b4662b420 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -254,6 +254,39 @@ static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
+/*
+ * Set up TDM
+ */
+static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
+			       unsigned int tx_mask, unsigned int rx_mask,
+			       int slots, int slot_width)
+{
+	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	unsigned int mask = 0, val = 0;
+
+	dev_info(dai->dev, "%s: setting TDM: tx_mask: 0x%08x rx_mask: 0x%08x "
+		 "slots: 0x%08x " "width: %d\n",
+		 __func__, tx_mask, rx_mask, slots, slot_width);
+
+	/* Set up slots and tx/rx masks */
+	mask = TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK |
+	       TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK |
+	       TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_MASK;
+
+	val = (tx_mask << TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_SHIFT) |
+	      (rx_mask << TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT) |
+	      ((slots - 1) << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT);
+
+	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
+
+	/* Set FSYNC width */
+	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL,
+		TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK,
+		(slot_width - 1) << TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT);
+
+	return 0;
+}
+
 static int tegra30_i2s_probe(struct snd_soc_dai *dai)
 {
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
@@ -268,6 +301,7 @@ static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
 	.set_fmt	= tegra30_i2s_set_fmt,
 	.hw_params	= tegra30_i2s_hw_params,
 	.trigger	= tegra30_i2s_trigger,
+	.set_tdm_slot	= tegra30_i2s_set_tdm,
 };
 
 static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
-- 
2.23.0


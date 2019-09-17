Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4A42B54FD
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Sep 2019 20:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728126AbfIQSMi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 17 Sep 2019 14:12:38 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:46162 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728510AbfIQSMh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Sep 2019 14:12:37 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iAHxq-0003oE-Mi; Tue, 17 Sep 2019 19:12:34 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iAHxq-0000BH-8M; Tue, 17 Sep 2019 19:12:34 +0100
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
Subject: [PATCH 2/8] ASoC: tegra: Allow 24bit and 32bit samples
Date:   Tue, 17 Sep 2019 19:12:27 +0100
Message-Id: <20190917181233.534-3-ben.dooks@codethink.co.uk>
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

The tegra3 audio can support 24 and 32 bit sample sizes so add the
 option to the tegra30_i2s_hw_params to configure the S24_LE or
 S32_LE formats when requested.

Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
[ben.dooks@codethink.co.uk: fixup merge of 24 and 32bit]
[ben.dooks@codethink.co.uk: add pm calls around ytdm config]
[ben.dooks@codethink.co.uk: remove debug prints]
---
squash 5aeca5a055fd ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code

ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
---
 sound/soc/tegra/tegra30_i2s.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index d36b4662b420..b5372839f672 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -127,7 +127,7 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct device *dev = dai->dev;
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask, val, reg;
-	int ret, sample_size, srate, i2sclock, bitcnt;
+	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
 	struct tegra30_ahub_cif_conf cif_conf;
 
 	if (params_channels(params) != 2)
@@ -137,8 +137,19 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
 		val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
+		audio_bits = TEGRA30_AUDIOCIF_BITS_16;
 		sample_size = 16;
 		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
+		audio_bits = TEGRA30_AUDIOCIF_BITS_24;
+		sample_size = 24;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
+		audio_bits = TEGRA30_AUDIOCIF_BITS_32;
+		sample_size = 32;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -170,8 +181,8 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	cif_conf.threshold = 0;
 	cif_conf.audio_channels = 2;
 	cif_conf.client_channels = 2;
-	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
-	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
+	cif_conf.audio_bits = audio_bits;
+	cif_conf.client_bits = audio_bits;
 	cif_conf.expand = 0;
 	cif_conf.stereo_conv = 0;
 	cif_conf.replicate = 0;
@@ -264,10 +275,6 @@ static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask = 0, val = 0;
 
-	dev_info(dai->dev, "%s: setting TDM: tx_mask: 0x%08x rx_mask: 0x%08x "
-		 "slots: 0x%08x " "width: %d\n",
-		 __func__, tx_mask, rx_mask, slots, slot_width);
-
 	/* Set up slots and tx/rx masks */
 	mask = TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK |
 	       TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK |
@@ -277,6 +284,8 @@ static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
 	      (rx_mask << TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT) |
 	      ((slots - 1) << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT);
 
+	pm_runtime_get_sync(dai->dev);
+
 	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
 
 	/* Set FSYNC width */
@@ -284,6 +293,7 @@ static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
 		TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK,
 		(slot_width - 1) << TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT);
 
+	pm_runtime_put(dai->dev);
 	return 0;
 }
 
@@ -311,14 +321,18 @@ static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SNDRV_PCM_FMTBIT_S32_LE |
+			   SNDRV_PCM_FMTBIT_S24_LE |
+			   SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.capture = {
 		.stream_name = "Capture",
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SNDRV_PCM_FMTBIT_S32_LE |
+			   SNDRV_PCM_FMTBIT_S24_LE |
+			   SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.ops = &tegra30_i2s_dai_ops,
 	.symmetric_rates = 1,
-- 
2.23.0


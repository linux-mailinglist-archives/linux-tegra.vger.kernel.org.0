Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68B03C2570
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Sep 2019 18:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732349AbfI3Qvg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 Sep 2019 12:51:36 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:48920 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732360AbfI3Qvg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Sep 2019 12:51:36 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iEytZ-0004A1-3G; Mon, 30 Sep 2019 17:51:33 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iEytY-0002mi-PM; Mon, 30 Sep 2019 17:51:32 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v3 2/7] ASoC: tegra: Allow 24bit and 32bit samples
Date:   Mon, 30 Sep 2019 17:51:25 +0100
Message-Id: <20190930165130.10642-3-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
References: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Edward Cragg <edward.cragg@codethink.co.uk>

The tegra3 audio can support 24 and 32 bit sample sizes so add the
option to the tegra30_i2s_hw_params to configure the S24_LE or S32_LE
formats when requested.

Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
[ben.dooks@codethink.co.uk: fixup merge of 24 and 32bit]
[ben.dooks@codethink.co.uk: add pm calls around ytdm config]
[ben.dooks@codethink.co.uk: drop debug printing to dev_dbg]
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
squash 5aeca5a055fd ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code

ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
---
 sound/soc/tegra/tegra30_i2s.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 7f9ef6abeae2..b948b010c057 100644
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
@@ -310,14 +321,18 @@ static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
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


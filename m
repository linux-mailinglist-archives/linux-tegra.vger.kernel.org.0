Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 180F0DC9A7
	for <lists+linux-tegra@lfdr.de>; Fri, 18 Oct 2019 17:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388676AbfJRPsi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 18 Oct 2019 11:48:38 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:36020 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731480AbfJRPsh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Oct 2019 11:48:37 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iLUUV-0006rz-GA; Fri, 18 Oct 2019 16:48:35 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iLUUU-0001z6-Mm; Fri, 18 Oct 2019 16:48:34 +0100
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
Subject: [PATCH v5 5/7] ASoC: tegra: set i2s_offset to 0 for tdm
Date:   Fri, 18 Oct 2019 16:48:31 +0100
Message-Id: <20191018154833.7560-6-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Set the offset to 0 for TDM mode, as per the current setup. Note we also
move the data offset programming to the i2s hw_parameters call as per
the suggestion from Jon Hunter.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
v2:
 - fix the review comments and move the i2s offset setting
v3:
 - fix data-offset for dsp-a and dsp-b
---
 sound/soc/tegra/tegra30_i2s.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 3839e3d955a8..e99126600fc4 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -66,7 +66,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
 				unsigned int fmt)
 {
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-	unsigned int mask = 0, val = 0;
+	unsigned int mask = 0, val = 0, data_offset = 1;
 	unsigned int ch_mask, ch_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
@@ -100,6 +100,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
 		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_POS_EDGE;
 		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
 		val |= TEGRA30_I2S_CTRL_LRCK_R_LOW;
+		data_offset = 0;
 		break;
 	case SND_SOC_DAIFMT_I2S:
 		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_LRCK;
@@ -120,6 +121,10 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
 	pm_runtime_get_sync(dai->dev);
 	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL, mask, val);
 	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL, ch_mask, ch_val);
+	val = (data_offset << TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_SHIFT) |
+		(data_offset << TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_SHIFT);
+	regmap_write(i2s->regmap, TEGRA30_I2S_OFFSET, val);
+
 	pm_runtime_put(dai->dev);
 
 	return 0;
@@ -203,11 +208,6 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	i2s->soc_data->set_audio_cif(i2s->regmap, reg, &cif_conf);
-
-	val = (1 << TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_SHIFT) |
-	      (1 << TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_SHIFT);
-	regmap_write(i2s->regmap, TEGRA30_I2S_OFFSET, val);
-
 	return 0;
 }
 
-- 
2.23.0


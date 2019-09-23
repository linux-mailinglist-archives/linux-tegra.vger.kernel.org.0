Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E477EBB975
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Sep 2019 18:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388829AbfIWQUd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 23 Sep 2019 12:20:33 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:51739 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389055AbfIWQUc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Sep 2019 12:20:32 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iCR4e-0001EU-IU; Mon, 23 Sep 2019 17:20:28 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iCR4d-0003to-V1; Mon, 23 Sep 2019 17:20:27 +0100
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
Subject: [PATCH v2 7/7] ASoC: tegra: take packing settings from the audio cif_config
Date:   Mon, 23 Sep 2019 17:20:26 +0100
Message-Id: <20190923162026.14882-8-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190923162026.14882-1-ben.dooks@codethink.co.uk>
References: <20190923162026.14882-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

If the CIF is not configured as 16 or 8 bit, then the
packing for 8/16 bits should not be enabled as the
hardware only supports 8 or 16 bit packing.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 sound/soc/tegra/tegra30_ahub.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 58e05ceb86da..c2f2e29dd32e 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -96,10 +96,17 @@ int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif rxcif,
 	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
 	val = tegra30_apbif_read(reg);
 	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
-		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
-	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
-	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
-	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
+		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK |
+		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN);
+	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT);
+	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16 ||
+	    cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
+		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN;
+	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16)
+		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
+	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
+		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_8_4;
+
 	tegra30_apbif_write(reg, val);
 
 	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
@@ -203,10 +210,16 @@ int tegra30_ahub_setup_tx_fifo(enum tegra30_ahub_txcif txcif,
 	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
 	val = tegra30_apbif_read(reg);
 	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_MASK |
-		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_MASK);
-	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_SHIFT) |
-	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN |
-	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_16;
+		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_MASK |
+		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN);
+	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_SHIFT);
+	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16 ||
+	    cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
+		val |= TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN;
+	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16)
+		val |= TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_16;
+	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
+		val |= TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_8_4;
 	tegra30_apbif_write(reg, val);
 
 	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
-- 
2.23.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0054BB971
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Sep 2019 18:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389105AbfIWQUb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 23 Sep 2019 12:20:31 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:51736 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389031AbfIWQUb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Sep 2019 12:20:31 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iCR4e-0001EW-KL; Mon, 23 Sep 2019 17:20:29 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iCR4d-0003th-Ra; Mon, 23 Sep 2019 17:20:27 +0100
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
Subject: [PATCH v2 4/7] ASoC: tegra: disable rx_fifo after disable stream
Date:   Mon, 23 Sep 2019 17:20:23 +0100
Message-Id: <20190923162026.14882-5-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190923162026.14882-1-ben.dooks@codethink.co.uk>
References: <20190923162026.14882-1-ben.dooks@codethink.co.uk>
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
index 62377af53ca4..1cc43cdd0eee 100644
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


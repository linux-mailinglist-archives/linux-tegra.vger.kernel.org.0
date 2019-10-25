Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 480C9E4841
	for <lists+linux-tegra@lfdr.de>; Fri, 25 Oct 2019 12:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409126AbfJYKMZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 25 Oct 2019 06:12:25 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:37764 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409104AbfJYKMZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Oct 2019 06:12:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=nPstqSGlbrqx9rYBxlCzkyHpfiX9qsJrrzCx1t+x+fQ=; b=g9hOXz0JaZXi
        R7Se6725Vm54BB16CFopqpneImGrV5To2pAHWXRkhj0ZzEHJKpkn436dd+bWX2V3RWz3oHyQ7JRJA
        GzAfi6Akr4R3QwcnEle3aCjXqaVDcbcWB3cJaokq14A6Pk0s2ufy62ZmOQynR/grtHfa89GHIeW5o
        evBq8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iNwZo-0006du-Ez; Fri, 25 Oct 2019 10:12:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id E42082743293; Fri, 25 Oct 2019 11:12:11 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Edward Cragg <edward.cragg@codethink.co.uk>
Cc:     alsa-devel@alsa-project.org, Ben Dooks <ben.dooks@codethink.co.uk>,
        Jaroslav Kysela <perex@perex.cz>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@lists.codethink.co.uk, linux-tegra@vger.kernel.org,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Applied "ASoC: tegra: add a TDM configuration callback" to the asoc tree
In-Reply-To: <20191018154833.7560-2-ben.dooks@codethink.co.uk>
X-Patchwork-Hint: ignore
Message-Id: <20191025101211.E42082743293@ypsilon.sirena.org.uk>
Date:   Fri, 25 Oct 2019 11:12:11 +0100 (BST)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The patch

   ASoC: tegra: add a TDM configuration callback

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 07932563686a6c51b26266c8572901c46fd1cd55 Mon Sep 17 00:00:00 2001
From: Edward Cragg <edward.cragg@codethink.co.uk>
Date: Fri, 18 Oct 2019 16:48:27 +0100
Subject: [PATCH] ASoC: tegra: add a TDM configuration callback

Add a callback to configure TDM settings for the Tegra30 I2S ASoC 'platform'
driver.

Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
[ben.dooks@codethink.co.uk: merge fix for power management]
[ben.dooks@codethink.co.uk: add review change for fsync of 1 clock]
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Link: https://lore.kernel.org/r/20191018154833.7560-2-ben.dooks@codethink.co.uk
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra30_i2s.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 48a09c9d60be..8f8924060d9d 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -265,6 +265,34 @@ static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
+static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
+			       unsigned int tx_mask, unsigned int rx_mask,
+			       int slots, int slot_width)
+{
+	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	unsigned int mask, val;
+
+	dev_dbg(dai->dev, "%s: txmask=0x%08x rxmask=0x%08x slots=%d width=%d\n",
+		 __func__, tx_mask, rx_mask, slots, slot_width);
+
+	mask = TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK |
+	       TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK |
+	       TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_MASK;
+
+	val = (tx_mask << TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_SHIFT) |
+	      (rx_mask << TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT) |
+	      ((slots - 1) << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT);
+
+	pm_runtime_get_sync(dai->dev);
+	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
+	/* set the fsync width to minimum of 1 clock width */
+	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL,
+			   TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK, 0x0);
+	pm_runtime_put(dai->dev);
+
+	return 0;
+}
+
 static int tegra30_i2s_probe(struct snd_soc_dai *dai)
 {
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
@@ -279,6 +307,7 @@ static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
 	.set_fmt	= tegra30_i2s_set_fmt,
 	.hw_params	= tegra30_i2s_hw_params,
 	.trigger	= tegra30_i2s_trigger,
+	.set_tdm_slot	= tegra30_i2s_set_tdm,
 };
 
 static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
-- 
2.20.1


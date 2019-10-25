Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96A0BE4847
	for <lists+linux-tegra@lfdr.de>; Fri, 25 Oct 2019 12:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409011AbfJYKMe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 25 Oct 2019 06:12:34 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:37662 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409029AbfJYKMW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Oct 2019 06:12:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=hRzOylwwcvGjRwWvhcJxQmB8Nj5XDL65PlfokZkrWsM=; b=LyFs1ygFCWnI
        auiI3IaSgCLtocqZc4DWounRJXgKgoQ8EVD0RhBSexhtKCi9QwJSqbwp/KOVC4WPZpLJz2iEgxWVC
        M9WEeME0/lb2pWkYA8aYVaGuGvrktIZxc6ENGbvxHi66C5r1rcIEoXzyzmukIGpWXL9kr30E/wXBz
        mZlHI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iNwZo-0006dr-95; Fri, 25 Oct 2019 10:12:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id B32C02743273; Fri, 25 Oct 2019 11:12:11 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@lists.codethink.co.uk, linux-tegra@vger.kernel.org,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Applied "ASoC: tegra: disable rx_fifo after disable stream" to the asoc tree
In-Reply-To: <20191018154833.7560-5-ben.dooks@codethink.co.uk>
X-Patchwork-Hint: ignore
Message-Id: <20191025101211.B32C02743273@ypsilon.sirena.org.uk>
Date:   Fri, 25 Oct 2019 11:12:11 +0100 (BST)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The patch

   ASoC: tegra: disable rx_fifo after disable stream

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

From 8c05f6af7b7d713e327cd6df5a8889c32fc1c10f Mon Sep 17 00:00:00 2001
From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Fri, 18 Oct 2019 16:48:30 +0100
Subject: [PATCH] ASoC: tegra: disable rx_fifo after disable stream

We see odd FIFO overruns with this, we assume the best thing to do is
to disable the RX I2S frontend first, and then disable the FIFO that
is using it.

This also fixes an issue where using multi-word frames (TDM) have
partial samples stuck in the FIFO which then get read out when the
next capture is started.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Link: https://lore.kernel.org/r/20191018154833.7560-5-ben.dooks@codethink.co.uk
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra30_i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 8f8924060d9d..dbed3c5408e7 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -231,9 +231,9 @@ static void tegra30_i2s_start_capture(struct tegra30_i2s *i2s)
 
 static void tegra30_i2s_stop_capture(struct tegra30_i2s *i2s)
 {
-	tegra30_ahub_disable_rx_fifo(i2s->capture_fifo_cif);
 	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL,
 			   TEGRA30_I2S_CTRL_XFER_EN_RX, 0);
+	tegra30_ahub_disable_rx_fifo(i2s->capture_fifo_cif);
 }
 
 static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
-- 
2.20.1


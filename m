Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02E63BC4BD
	for <lists+linux-tegra@lfdr.de>; Tue, 24 Sep 2019 11:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729614AbfIXJWg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 24 Sep 2019 05:22:36 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17420 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbfIXJWg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Sep 2019 05:22:36 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d89e0610000>; Tue, 24 Sep 2019 02:22:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 24 Sep 2019 02:22:35 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 24 Sep 2019 02:22:35 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Sep
 2019 09:22:35 +0000
Received: from [10.21.133.50] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Sep
 2019 09:22:33 +0000
Subject: Re: [PATCH v2 1/7] ASoC: tegra: Add a TDM configuration callback
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-kernel@lists.codethink.co.uk>,
        Edward Cragg <edward.cragg@codethink.co.uk>
References: <20190923162026.14882-1-ben.dooks@codethink.co.uk>
 <20190923162026.14882-2-ben.dooks@codethink.co.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <b0574569-8586-87eb-b4ec-6e3445acfc41@nvidia.com>
Date:   Tue, 24 Sep 2019 10:22:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923162026.14882-2-ben.dooks@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1569316962; bh=mg7SvTQAvMgDa1BMkCxk407miBWp5hu5ThaP0Gmsvng=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=X20IqFEzwe5eXVNHK6paQnAtvphbqC7BsA3wsNsasuKfqq27cluOqbvbt45WOGtI0
         +1IReSPcV3BLLv4hFuD332BrcTfIC2b/21H5zfKnDfnsLcj2fJo66HHIB/XleRde68
         6BDVvXQhBpbW7ijMyqQwWh96TO0rTbZSJOlZ9LeIMzZggJoh5ZO8dabuvbJmhF2jgq
         ru2NmirdeldEG2qAVbNWDWz/8ftKilOAQZAmlEYc8EsEjJJr8dcBK30TCWNY0oishA
         XolB/SyxelIEF4AkY0lbnLRLN6sRFIBxCBXftCW7WXi7tjJhnhJR8xzgB44MobhKhR
         JowQCbs/x+ZZQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 23/09/2019 17:20, Ben Dooks wrote:
> From: Edward Cragg <edward.cragg@codethink.co.uk>
> 
> Add a callback to configure TDM settings for the Tegra30 I2S ASoC 'platform'
> driver.
> 
> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
> [ben.dooks@codethink.co.uk: merge fix for power management]
> [ben.dooks@codethink.co.uk: add review change for fsync of 1 clock]
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  sound/soc/tegra/tegra30_i2s.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index ac6983c6bd72..dfed60adbeba 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -254,6 +254,38 @@ static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
>  	return 0;
>  }
>  
> +/*
> + * Set up TDM
> + */
> +static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
> +			       unsigned int tx_mask, unsigned int rx_mask,
> +			       int slots, int slot_width)
> +{
> +	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> +	unsigned int mask, val;
> +
> +	dev_dbg(dai->dev, "%s: txmask=0x%08x rxmask=0x%08x slots=%d width=%d\n",
> +		 __func__, tx_mask, rx_mask, slots, slot_width);
> +
> +	/* Set up slots and tx/rx masks */
> +	mask = TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK |
> +	       TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK |
> +	       TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_MASK;
> +
> +	val = (tx_mask << TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_SHIFT) |
> +	      (rx_mask << TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT) |
> +	      ((slots - 1) << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT);
> +
> +	pm_runtime_get_sync(dai->dev);
> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL,
> +		TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK,
> +		(1 - 1) << TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT);

So this is just 0, so it would be simpler just to write 0. Feel free to
add a comment.

Cheers
Jon

-- 
nvpublic

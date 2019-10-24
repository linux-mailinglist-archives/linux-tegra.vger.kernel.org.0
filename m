Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A21FAE3704
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 17:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409776AbfJXPvE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 11:51:04 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:19169 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407481AbfJXPvE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 11:51:04 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5db1c86c0004>; Thu, 24 Oct 2019 08:51:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 24 Oct 2019 08:51:03 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 24 Oct 2019 08:51:03 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Oct
 2019 15:51:03 +0000
Received: from [10.21.133.51] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Oct
 2019 15:51:00 +0000
Subject: Re: [PATCH v5 1/7] ASoC: tegra: add a TDM configuration callback
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-kernel@lists.codethink.co.uk>,
        Edward Cragg <edward.cragg@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-2-ben.dooks@codethink.co.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c02a1328-b5e9-d664-83e0-846c597c747e@nvidia.com>
Date:   Thu, 24 Oct 2019 16:50:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018154833.7560-2-ben.dooks@codethink.co.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1571932269; bh=/UMnG3zbDJ6aRhIhuPU8fUT/YKNZXu5bwGROSc+RF/M=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=PTqJzAC8ylpld4HbRa5hfXBrp24LwpA+VjHptHpsN1+gkgFDw/gcem+JUSiAhgEq6
         frflg3woY6g5MtQ4AfHjCdXDZQuSmskcZLce/Hiy37Cz82rYybKd7QPhNd4gtGkxUK
         Pmj8usx9DVkpTTnx8wzVzPI1rmYgd+QcpOnitRBLJzUIrlM76CihfAyY/bUpL03Xk8
         xM1+esr3ujauUxBE/SdKpg2wkgAJgls8TKCg1uIKt/p2oge5IpFTWkHrFP6lB64PvF
         oNSlzNfPsiY26o7Hdr36JKlFDkrDyaxGxqiNKIwQ+mye5bQgRral2mTOTd1Lv2pZzx
         cxhu9aF5yF8cQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 18/10/2019 16:48, Ben Dooks wrote:
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
>  sound/soc/tegra/tegra30_i2s.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index ac6983c6bd72..73f0dddeaef3 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -254,6 +254,34 @@ static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
>  	return 0;
>  }
>  
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
> +	/* set the fsync width to minimum of 1 clock width */
> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL,
> +			   TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK, 0x0);
> +	pm_runtime_put(dai->dev);
> +
> +	return 0;
> +}
> +
>  static int tegra30_i2s_probe(struct snd_soc_dai *dai)
>  {
>  	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> @@ -268,6 +296,7 @@ static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
>  	.set_fmt	= tegra30_i2s_set_fmt,
>  	.hw_params	= tegra30_i2s_hw_params,
>  	.trigger	= tegra30_i2s_trigger,
> +	.set_tdm_slot	= tegra30_i2s_set_tdm,
>  };
>  
>  static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {

Thanks!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

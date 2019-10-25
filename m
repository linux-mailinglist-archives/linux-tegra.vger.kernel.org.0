Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC2BE4570
	for <lists+linux-tegra@lfdr.de>; Fri, 25 Oct 2019 10:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405576AbfJYITA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 25 Oct 2019 04:19:00 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:14413 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405413AbfJYITA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Oct 2019 04:19:00 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5db2affb0000>; Fri, 25 Oct 2019 01:19:07 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 25 Oct 2019 01:18:58 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 25 Oct 2019 01:18:58 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 08:18:51 +0000
Received: from [10.21.133.51] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 08:18:49 +0000
Subject: Re: [PATCH v5 6/7] ASoC: tegra: config fifos on hw_param changes
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-kernel@lists.codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-7-ben.dooks@codethink.co.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c88664c5-74ac-d03f-02b4-477f10a27401@nvidia.com>
Date:   Fri, 25 Oct 2019 09:18:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018154833.7560-7-ben.dooks@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1571991547; bh=A76D4qQ0zEUGrlp/BYvvuV2JNWOm7Ihmd2Zf8mEBYu8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=VxZqx/H8yYjW+O+zUg8r8X/waNKGwpt2Z51nFOXW0d3ll0wz7QikNXqepKpmSZfjV
         aHBDBKcabx06PBnRGYSe+rgMptOg2MChHApvDhIH152RUXljCnkooI9/uaIOHqoOT1
         peF49h7VEqnWXZlGdWYTrQ6uOeDZMyNmIaEkltYTRd2jLZJ1o4uEE7aGK88znjDdfI
         6/d15Y90o9okLwBP8jGMi0fYW09NtPm9C27exKIULmWR+x7KZn9yzje6OXp2geTZyI
         dRCPtgMkfvTI9ORb+k1Ly6HJ4pyqlT9PCvvZ570unqXhIpY1eYranWn6jdFY4+eDvl
         XbCyziTw0Uqmg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 18/10/2019 16:48, Ben Dooks wrote:
> If the hw_params uses a different bit or channel count, then we
> need to change both the I2S unit's CIF configuration as well as
> the APBIF one.
> 
> To allow changing the APBIF, add a call to reconfigure the RX or
> TX FIFO without changing the DMA or allocation, and get the I2S
> driver to call it once the hw params have been calculate.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 115 ++++++++++++++++++---------------
>  sound/soc/tegra/tegra30_ahub.h |   5 ++
>  sound/soc/tegra/tegra30_i2s.c  |   2 +
>  3 files changed, 69 insertions(+), 53 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
> index 952381260dc3..24bc03428b45 100644
> --- a/sound/soc/tegra/tegra30_ahub.c
> +++ b/sound/soc/tegra/tegra30_ahub.c
> @@ -84,12 +84,40 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> +int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif rxcif,
> +			       struct tegra30_ahub_cif_conf *cif_conf)
> +{
> +	int channel = rxcif - TEGRA30_AHUB_RXCIF_APBIF_RX0;
> +	u32 reg, val;
> +
> +	pm_runtime_get_sync(ahub->dev);
> +
> +	reg = TEGRA30_AHUB_CHANNEL_CTRL +
> +	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
> +	val = tegra30_apbif_read(reg);
> +	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
> +		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
> +	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
> +	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
> +	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
> +	tegra30_apbif_write(reg, val);
> +
> +	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
> +
> +	reg = TEGRA30_AHUB_CIF_RX_CTRL +
> +	      (channel * TEGRA30_AHUB_CIF_RX_CTRL_STRIDE);
> +	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, cif_conf);
> +
> +	pm_runtime_put(ahub->dev);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(tegra30_ahub_setup_rx_fifo);
> +
>  int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
>  				  char *dmachan, int dmachan_len,
>  				  dma_addr_t *fiforeg)
>  {
>  	int channel;
> -	u32 reg, val;
>  	struct tegra30_ahub_cif_conf cif_conf;
>  
>  	channel = find_first_zero_bit(ahub->rx_usage,
> @@ -104,37 +132,14 @@ int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
>  	*fiforeg = ahub->apbif_addr + TEGRA30_AHUB_CHANNEL_RXFIFO +
>  		   (channel * TEGRA30_AHUB_CHANNEL_RXFIFO_STRIDE);
>  
> -	pm_runtime_get_sync(ahub->dev);
> +	memset(&cif_conf, 0, sizeof(cif_conf));
>  
> -	reg = TEGRA30_AHUB_CHANNEL_CTRL +
> -	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
> -	val = tegra30_apbif_read(reg);
> -	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
> -		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
> -	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
> -	tegra30_apbif_write(reg, val);
> -
> -	cif_conf.threshold = 0;
>  	cif_conf.audio_channels = 2;
>  	cif_conf.client_channels = 2;
>  	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>  	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
> -	cif_conf.expand = 0;
> -	cif_conf.stereo_conv = 0;
> -	cif_conf.replicate = 0;
> -	cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
> -	cif_conf.truncate = 0;
> -	cif_conf.mono_conv = 0;
> -
> -	reg = TEGRA30_AHUB_CIF_RX_CTRL +
> -	      (channel * TEGRA30_AHUB_CIF_RX_CTRL_STRIDE);
> -	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, &cif_conf);
> -
> -	pm_runtime_put(ahub->dev);
>  
> -	return 0;
> +	return tegra30_ahub_setup_rx_fifo(*rxcif, &cif_conf);

I am not sure why it is necessary to call this here now because this is
called everytime you call hw_params() right? It seems redundant to me.

Cheers
Jon

-- 
nvpublic

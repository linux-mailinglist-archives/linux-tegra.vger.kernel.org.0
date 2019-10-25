Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3F77E4622
	for <lists+linux-tegra@lfdr.de>; Fri, 25 Oct 2019 10:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437025AbfJYIrm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 25 Oct 2019 04:47:42 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:15835 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436937AbfJYIrl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Oct 2019 04:47:41 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5db2b6b40002>; Fri, 25 Oct 2019 01:47:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 25 Oct 2019 01:47:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 25 Oct 2019 01:47:39 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 08:47:39 +0000
Received: from [10.21.133.51] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 08:47:37 +0000
Subject: Re: [PATCH v5 7/7] ASoC: tegra: take packing settings from the audio
 cif_config
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-kernel@lists.codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-8-ben.dooks@codethink.co.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <ab8211ea-d4ed-85dc-51f4-ab9c2e134378@nvidia.com>
Date:   Fri, 25 Oct 2019 09:47:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018154833.7560-8-ben.dooks@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1571993268; bh=KnJpJjddREUP29pxiWq2xGT5kBre372ihH0Mi2/QMR8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=gBMQkcb9hWJ1w5qxyEXr4tKLbxLJT+vWuwj2fGq9ZDzCy5GSzfF/SWR6OAEC0nXkQ
         Sv42J0op5kPbyd/kJvdhQIhJifnf67yEaVO/tBnh8grUVTsew+kxj5AWxJova7/JxI
         FRxPjhtAHpZd5C8Ql4TQr87vPSX63bf9GPxs3UxQIbHTgOmdK/MuKl941ahV1Zaz1a
         89GAx0704HCyTg/aTO99ofhBfs72BoNki8OPY7aQzqdtaZq/Seb9qVhL/KlSwpWgjc
         UjLTI6sZ8ienDCLsgupF1NhCxGlt64g0ub2GiH5JTnkj0pQqbiaFOJuTme6b10j5sV
         KCdxzRJlsG95g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 18/10/2019 16:48, Ben Dooks wrote:
> If the CIF is not configured as 16 or 8 bit, then the
> packing for 8/16 bits should not be enabled as the
> hardware only supports 8 or 16 bit packing.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
> index 24bc03428b45..0768c6b6dc25 100644
> --- a/sound/soc/tegra/tegra30_ahub.c
> +++ b/sound/soc/tegra/tegra30_ahub.c
> @@ -96,10 +96,17 @@ int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif rxcif,
>  	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
>  	val = tegra30_apbif_read(reg);
>  	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
> -		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
> -	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
> +		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK |
> +		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN);
> +	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT);
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16 ||
> +	    cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN;
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_8_4;
> +
>  	tegra30_apbif_write(reg, val);
>  
>  	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
> @@ -203,10 +210,16 @@ int tegra30_ahub_setup_tx_fifo(enum tegra30_ahub_txcif txcif,
>  	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
>  	val = tegra30_apbif_read(reg);
>  	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_MASK |
> -		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_MASK);
> -	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_SHIFT) |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_16;
> +		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_MASK |
> +		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN);
> +	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_SHIFT);
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16 ||
> +	    cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN;
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_16;
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_8_4;
>  	tegra30_apbif_write(reg, val);
>  
>  	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
> 

Looks good to me.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

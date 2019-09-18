Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 705FBB5F93
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 10:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbfIRIuc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Sep 2019 04:50:32 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:6733 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbfIRIuc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Sep 2019 04:50:32 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d81efdd0000>; Wed, 18 Sep 2019 01:50:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 18 Sep 2019 01:50:31 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 18 Sep 2019 01:50:31 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 08:50:31 +0000
Received: from [10.21.132.148] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 08:50:29 +0000
Subject: Re: [PATCH 3/8] ASoC: tegra: i2s: Add support for more than 2
 channels
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-kernel@lists.codethink.co.uk>,
        Edward Cragg <edward.cragg@codethink.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-4-ben.dooks@codethink.co.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <b8ccfbd1-3c0f-3cba-40da-a9b0ced54e86@nvidia.com>
Date:   Wed, 18 Sep 2019 09:50:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917181233.534-4-ben.dooks@codethink.co.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1568796637; bh=v7Q5B0cHsJ3ThW91VfNXX137Ea4Q7m990IesFmcHlY4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=OxHAR5k93bXlDiP0tzZC62eLx0PKprR4+BQvJgfIPaPq9W07g9m+JKvx31W1x6Sya
         vvCVkw/1dv6Pu8i7kS6zvFfuBOCudXetNLmGuoPHLsAVHNbG61yg6inJKJyQwmEMfu
         gOdwQXARI52Aho2ZInFcX35hzzpRatGxClO1TW1Ri4kKfviQ21uG3HTFHWlxPzK0N4
         i15M5lgWg4Eu1CoU3OFwk1dhsttFhA2bSm4wmfmHtfrsIOiJ7SWipfDmxAXBxF7UAE
         KsvQ261Kas+3kmYgj1H1zLOyQrLXxbTxiVHKicZq8wXURDbAar8UtO7RMQP1EebAis
         sroQn80GSdQiw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 17/09/2019 19:12, Ben Dooks wrote:
> From: Edward Cragg <edward.cragg@codethink.co.uk>
> 
> The CIF configuration and clock setting is currently hard coded for 2
> channels. Since the hardware is capable of supporting 1-8 channels add
> support for reading the channel count from the supplied parameters to
> allow for better TDM support. It seems the original implementation of this
> driver was fixed at 2 channels for simplicity, and not implementing TDM.
> 
> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
> [ben.dooks@codethink.co.uk: added is_tdm and channel nr check]
> ---
>  sound/soc/tegra/tegra30_i2s.c | 21 +++++++++++++--------
>  sound/soc/tegra/tegra30_i2s.h |  1 +
>  2 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index b5372839f672..40bcc05a9dbb 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -86,14 +86,17 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>  		return -EINVAL;
>  	}
>  
> +	i2s->is_tdm = false;
>  	mask |= TEGRA30_I2S_CTRL_FRAME_FORMAT_MASK |
>  		TEGRA30_I2S_CTRL_LRCK_MASK;
>  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>  	case SND_SOC_DAIFMT_DSP_A:
> +		i2s->is_tdm = true;
>  		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>  		val |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
>  		break;
>  	case SND_SOC_DAIFMT_DSP_B:
> +		i2s->is_tdm = true;
>  		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>  		val |= TEGRA30_I2S_CTRL_LRCK_R_LOW;
>  		break;
> @@ -127,10 +130,13 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
>  	struct device *dev = dai->dev;
>  	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>  	unsigned int mask, val, reg;
> -	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
> +	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits, channels;
>  	struct tegra30_ahub_cif_conf cif_conf;
>  
> -	if (params_channels(params) != 2)
> +	channels = params_channels(params);
> +	if (channels > 8)
> +		return -EINVAL;
> +	if (channels != 2 && !i2s->is_tdm)

I don't think that this additional test is really necessary. I would
just drop this 'is_tdm' variable.

Cheers
Jon

-- 
nvpublic

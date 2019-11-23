Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 924C31080B8
	for <lists+linux-tegra@lfdr.de>; Sat, 23 Nov 2019 22:09:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbfKWVJO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 23 Nov 2019 16:09:14 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40265 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbfKWVJO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 23 Nov 2019 16:09:14 -0500
Received: by mail-lj1-f194.google.com with SMTP id q2so11324894ljg.7
        for <linux-tegra@vger.kernel.org>; Sat, 23 Nov 2019 13:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vUTDzwLJEZ5e31rqYQ2YddmxPWbsZ/6DlrZVyrT6URM=;
        b=hzcdJe3niCw4ldOCm3BfL913+mivy+m5APNdxFkUKAv3+RdjyYqmY1elqHcfDut9/q
         q2gys1yc8EFQh1Umu99Ch9BRLGCL75VUsnoI6N9PDEAiFBQdjaZI9VEsAKHH6chNlWbC
         nmpnC/d6UbF/wYDUAh3+ntvpb5/LXBHUK6JJERsR8LITp70RvrGGwhzZlt59p0kAc0Yo
         XPLXG6EwZAmoyn5OeuY4Pt8w/BU4GcUrftVkVtXFaZMv1Hazo8hGC/4E23ht2MozSzJA
         eWyDK1bQEN1nZRoPxYZPGSG/jL7v/RTMAikE20eOilk1gF9wlJd1Dkh+zQu7feYwXTa3
         kb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vUTDzwLJEZ5e31rqYQ2YddmxPWbsZ/6DlrZVyrT6URM=;
        b=Ow4NeF47xCx3cycusHve/AS1M+6ePGS/3fCli/sniyO5n0MU0HWKM5HiGh5ngdRFAA
         ejTrRqwKMJGkF9F+CfSIVg5R8JxgCv2KHXKsjrcsMBfLZPw+iiVtKJIcVso6y25xI4PA
         IQkcdcpK1PX0QqT7VVgGEHbBFMKnHIHocydELLuiqEKQjdmXtIYLIsybisYkXweq1r8A
         qSInS0MMgEixRHpcYtPiIDYVQPD/KrvwKkBTTDh8zPoX7Mp1bs+eNJTD6j17W8irRcqK
         jBBL5qPcOMz47Raar9pugUJEJDhAjHz5CF9eQhoDE5OkVS+68iTZIUWhdPx5Kkd9mVOj
         okoA==
X-Gm-Message-State: APjAAAU0J4RJOG4AUfbGktSl6SqDth+acqrXj2lzb2YYeoRExkmGDx10
        FpyTw0bY25A1JvQ/fdMDOkk=
X-Google-Smtp-Source: APXvYqy3I+WHtWo/sNzk5bilKI/KTawHty3KlA9n7AZI1PvYcBTWq1kj1B3W5Tr0Y7O9l4NRSVkqYg==
X-Received: by 2002:a2e:a404:: with SMTP id p4mr2879297ljn.234.1574543352138;
        Sat, 23 Nov 2019 13:09:12 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id i23sm1137658lfj.71.2019.11.23.13.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Nov 2019 13:09:11 -0800 (PST)
Subject: Re: [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit samples
To:     Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
Date:   Sun, 24 Nov 2019 00:09:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191018154833.7560-3-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

18.10.2019 18:48, Ben Dooks пишет:
> From: Edward Cragg <edward.cragg@codethink.co.uk>
> 
> The tegra3 audio can support 24 and 32 bit sample sizes so add the
> option to the tegra30_i2s_hw_params to configure the S24_LE or S32_LE
> formats when requested.
> 
> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
> [ben.dooks@codethink.co.uk: fixup merge of 24 and 32bit]
> [ben.dooks@codethink.co.uk: add pm calls around ytdm config]
> [ben.dooks@codethink.co.uk: drop debug printing to dev_dbg]
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> squash 5aeca5a055fd ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
> 
> ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
> ---
>  sound/soc/tegra/tegra30_i2s.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index 73f0dddeaef3..063f34c882af 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -127,7 +127,7 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
>  	struct device *dev = dai->dev;
>  	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>  	unsigned int mask, val, reg;
> -	int ret, sample_size, srate, i2sclock, bitcnt;
> +	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
>  	struct tegra30_ahub_cif_conf cif_conf;
>  
>  	if (params_channels(params) != 2)
> @@ -137,8 +137,19 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
>  	switch (params_format(params)) {
>  	case SNDRV_PCM_FORMAT_S16_LE:
>  		val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
> +		audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>  		sample_size = 16;
>  		break;
> +	case SNDRV_PCM_FORMAT_S24_LE:
> +		val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
> +		audio_bits = TEGRA30_AUDIOCIF_BITS_24;
> +		sample_size = 24;
> +		break;
> +	case SNDRV_PCM_FORMAT_S32_LE:
> +		val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
> +		audio_bits = TEGRA30_AUDIOCIF_BITS_32;
> +		sample_size = 32;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -170,8 +181,8 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
>  	cif_conf.threshold = 0;
>  	cif_conf.audio_channels = 2;
>  	cif_conf.client_channels = 2;
> -	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
> -	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
> +	cif_conf.audio_bits = audio_bits;
> +	cif_conf.client_bits = audio_bits;
>  	cif_conf.expand = 0;
>  	cif_conf.stereo_conv = 0;
>  	cif_conf.replicate = 0;
> @@ -306,14 +317,18 @@ static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
>  		.channels_min = 2,
>  		.channels_max = 2,
>  		.rates = SNDRV_PCM_RATE_8000_96000,
> -		.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +		.formats = SNDRV_PCM_FMTBIT_S32_LE |
> +			   SNDRV_PCM_FMTBIT_S24_LE |
> +			   SNDRV_PCM_FMTBIT_S16_LE,
>  	},
>  	.capture = {
>  		.stream_name = "Capture",
>  		.channels_min = 2,
>  		.channels_max = 2,
>  		.rates = SNDRV_PCM_RATE_8000_96000,
> -		.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +		.formats = SNDRV_PCM_FMTBIT_S32_LE |
> +			   SNDRV_PCM_FMTBIT_S24_LE |
> +			   SNDRV_PCM_FMTBIT_S16_LE,
>  	},
>  	.ops = &tegra30_i2s_dai_ops,
>  	.symmetric_rates = 1,
> 

Hello,

This patch breaks audio on Tegra30. I don't see errors anywhere, but
there is no audio and reverting this patch helps. Please fix it.

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2933D1092CB
	for <lists+linux-tegra@lfdr.de>; Mon, 25 Nov 2019 18:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbfKYR26 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 25 Nov 2019 12:28:58 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38290 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727266AbfKYR26 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Nov 2019 12:28:58 -0500
Received: by mail-lj1-f195.google.com with SMTP id k8so6318276ljh.5
        for <linux-tegra@vger.kernel.org>; Mon, 25 Nov 2019 09:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F06CJ+JlKnOuUWn1ubQ4DCOdsfyHx8+XO8bExvyHTQ8=;
        b=RRZYiTi2E61gwkIyQr4JHzAKWUDaTGOoLFjIZaK+HylH2vzceFTTqgWGXUUfmno8iw
         BksIOE2BqnsFPAaXOZm1/Cq8TJHSGRV3gajzCurQYHDvi/ZbcKDLpRiL60NX4I+YQn5j
         ulSjJv+NIQNqALEDudVMo8+lDSsCiljv3AMdTvvx0l2F+3kDKzU9gFpfJ1zNHOEDzaEc
         vv5AQVO6zyPrQO0XjeTMwqjF4hEqb10WHMVYPwxrYs1POO8YxWIAJBhxuv/6QgqofQW2
         UJ1VHQRnRFWXT8Y0/f3WCpP7qsApfblRBuQsymLMjlOZkoSaiaKe5x4gkC52zS60Mb9S
         pmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F06CJ+JlKnOuUWn1ubQ4DCOdsfyHx8+XO8bExvyHTQ8=;
        b=bdh6rb8Zdi8Mv5OeuUbTA20ikVC6ZWzeq2iLbwNVnGR+eL1raGtpR2CCzdcaI+oyJN
         cmyTMTwF4xyTAaoqJaq5PajROOtS/62vWmRbf5n9m2XPiy98JPsvWastD/i7EFkZn4G1
         RRCEqxyQw1mM4f4xmy57dWDerngMxcadQmLxjWFv22yy5dzyBfqH0CeaqzuPQTzOwXOC
         KQ4HrxnNHRcoiVFzdpIpBKNPBDfqshyPrCmEQCxH3uF3tyKHf5zw/39gz8F5sytWtbgi
         BMj04GCmK7wUeGDwRhAm4OTZdPUMq6RmQwy1lwmcCJz5OQ5y1vaMdrBCyMET+Nit0VCv
         LNXg==
X-Gm-Message-State: APjAAAW35jOXZHasZQtevB5eBZ5TM92z3SWpG5W/R/et/zHs1Q4hgaCo
        DIP3AZkp6yt9R0w6iVG1FQ+AdFFV
X-Google-Smtp-Source: APXvYqynl6JEYfXu2DI+buf8Gwt7XO7eDI3Ugen9KTdtYGKoZRfYcO/PkyiXsUx6eBQ+FW/mMRh/kA==
X-Received: by 2002:a2e:7c12:: with SMTP id x18mr23392150ljc.130.1574702935605;
        Mon, 25 Nov 2019 09:28:55 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id x12sm3968503lfq.52.2019.11.25.09.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2019 09:28:55 -0800 (PST)
Subject: Re: [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit samples
From:   Dmitry Osipenko <digetx@gmail.com>
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
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
Message-ID: <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
Date:   Mon, 25 Nov 2019 20:28:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.11.2019 20:22, Dmitry Osipenko пишет:
> 25.11.2019 13:37, Ben Dooks пишет:
>> On 23/11/2019 21:09, Dmitry Osipenko wrote:
>>> 18.10.2019 18:48, Ben Dooks пишет:
>>>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>>>>
>>>> The tegra3 audio can support 24 and 32 bit sample sizes so add the
>>>> option to the tegra30_i2s_hw_params to configure the S24_LE or S32_LE
>>>> formats when requested.
>>>>
>>>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>>>> [ben.dooks@codethink.co.uk: fixup merge of 24 and 32bit]
>>>> [ben.dooks@codethink.co.uk: add pm calls around ytdm config]
>>>> [ben.dooks@codethink.co.uk: drop debug printing to dev_dbg]
>>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>> ---
>>>> squash 5aeca5a055fd ASoC: tegra: i2s: pm_runtime_get_sync() is needed
>>>> in tdm code
>>>>
>>>> ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
>>>> ---
>>>>   sound/soc/tegra/tegra30_i2s.c | 25 ++++++++++++++++++++-----
>>>>   1 file changed, 20 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/sound/soc/tegra/tegra30_i2s.c
>>>> b/sound/soc/tegra/tegra30_i2s.c
>>>> index 73f0dddeaef3..063f34c882af 100644
>>>> --- a/sound/soc/tegra/tegra30_i2s.c
>>>> +++ b/sound/soc/tegra/tegra30_i2s.c
>>>> @@ -127,7 +127,7 @@ static int tegra30_i2s_hw_params(struct
>>>> snd_pcm_substream *substream,
>>>>       struct device *dev = dai->dev;
>>>>       struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>>>>       unsigned int mask, val, reg;
>>>> -    int ret, sample_size, srate, i2sclock, bitcnt;
>>>> +    int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
>>>>       struct tegra30_ahub_cif_conf cif_conf;
>>>>         if (params_channels(params) != 2)
>>>> @@ -137,8 +137,19 @@ static int tegra30_i2s_hw_params(struct
>>>> snd_pcm_substream *substream,
>>>>       switch (params_format(params)) {
>>>>       case SNDRV_PCM_FORMAT_S16_LE:
>>>>           val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>           sample_size = 16;
>>>>           break;
>>>> +    case SNDRV_PCM_FORMAT_S24_LE:
>>>> +        val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_24;
>>>> +        sample_size = 24;
>>>> +        break;
>>>> +    case SNDRV_PCM_FORMAT_S32_LE:
>>>> +        val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_32;
>>>> +        sample_size = 32;
>>>> +        break;
>>>>       default:
>>>>           return -EINVAL;
>>>>       }
>>>> @@ -170,8 +181,8 @@ static int tegra30_i2s_hw_params(struct
>>>> snd_pcm_substream *substream,
>>>>       cif_conf.threshold = 0;
>>>>       cif_conf.audio_channels = 2;
>>>>       cif_conf.client_channels = 2;
>>>> -    cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>> -    cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>> +    cif_conf.audio_bits = audio_bits;
>>>> +    cif_conf.client_bits = audio_bits;
>>>>       cif_conf.expand = 0;
>>>>       cif_conf.stereo_conv = 0;
>>>>       cif_conf.replicate = 0;
>>>> @@ -306,14 +317,18 @@ static const struct snd_soc_dai_driver
>>>> tegra30_i2s_dai_template = {
>>>>           .channels_min = 2,
>>>>           .channels_max = 2,
>>>>           .rates = SNDRV_PCM_RATE_8000_96000,
>>>> -        .formats = SNDRV_PCM_FMTBIT_S16_LE,
>>>> +        .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>>> +               SNDRV_PCM_FMTBIT_S24_LE |
>>>> +               SNDRV_PCM_FMTBIT_S16_LE,
>>>>       },
>>>>       .capture = {
>>>>           .stream_name = "Capture",
>>>>           .channels_min = 2,
>>>>           .channels_max = 2,
>>>>           .rates = SNDRV_PCM_RATE_8000_96000,
>>>> -        .formats = SNDRV_PCM_FMTBIT_S16_LE,
>>>> +        .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>>> +               SNDRV_PCM_FMTBIT_S24_LE |
>>>> +               SNDRV_PCM_FMTBIT_S16_LE,
>>>>       },
>>>>       .ops = &tegra30_i2s_dai_ops,
>>>>       .symmetric_rates = 1,
>>>>
>>>
>>> Hello,
>>>
>>> This patch breaks audio on Tegra30. I don't see errors anywhere, but
>>> there is no audio and reverting this patch helps. Please fix it.
>>
>> What is the failure mode? I can try and take a look at this some time
>> this week, but I am not sure if I have any boards with an actual useful
>> audio output?
> 
> The failure mode is that there no sound. I also noticed that video
> playback stutters a lot if movie file has audio track, seems something
> times out during of the audio playback. For now I don't have any more info.
> 

Oh, I didn't say how to reproduce it.. for example simply playing
big_buck_bunny_720p_h264.mov in MPV has the audio problem.

https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_h264.mov

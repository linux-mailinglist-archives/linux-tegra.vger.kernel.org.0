Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC8C11279B0
	for <lists+linux-tegra@lfdr.de>; Fri, 20 Dec 2019 11:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbfLTK5Q (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 20 Dec 2019 05:57:16 -0500
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:37620 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727177AbfLTK5Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Dec 2019 05:57:16 -0500
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1iiFxp-0003pW-8D; Fri, 20 Dec 2019 10:56:57 +0000
Subject: Re: [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit samples
To:     Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
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
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <eec79f8c-2ed2-3bc8-e923-ea78be0c12a9@gmail.com>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <634ca912-f9bb-beb7-2c8c-190ad150e41c@codethink.co.uk>
Date:   Fri, 20 Dec 2019 10:56:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <eec79f8c-2ed2-3bc8-e923-ea78be0c12a9@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 19/12/2019 21:21, Dmitry Osipenko wrote:
> 25.11.2019 20:28, Dmitry Osipenko пишет:
>> 25.11.2019 20:22, Dmitry Osipenko пишет:
>>> 25.11.2019 13:37, Ben Dooks пишет:
>>>> On 23/11/2019 21:09, Dmitry Osipenko wrote:
>>>>> 18.10.2019 18:48, Ben Dooks пишет:
>>>>>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>>>>>>
>>>>>> The tegra3 audio can support 24 and 32 bit sample sizes so add the
>>>>>> option to the tegra30_i2s_hw_params to configure the S24_LE or S32_LE
>>>>>> formats when requested.
>>>>>>
>>>>>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>>>>>> [ben.dooks@codethink.co.uk: fixup merge of 24 and 32bit]
>>>>>> [ben.dooks@codethink.co.uk: add pm calls around ytdm config]
>>>>>> [ben.dooks@codethink.co.uk: drop debug printing to dev_dbg]
>>>>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>>> ---
>>>>>> squash 5aeca5a055fd ASoC: tegra: i2s: pm_runtime_get_sync() is needed
>>>>>> in tdm code
>>>>>>
>>>>>> ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
>>>>>> ---
>>>>>>    sound/soc/tegra/tegra30_i2s.c | 25 ++++++++++++++++++++-----
>>>>>>    1 file changed, 20 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/sound/soc/tegra/tegra30_i2s.c
>>>>>> b/sound/soc/tegra/tegra30_i2s.c
>>>>>> index 73f0dddeaef3..063f34c882af 100644
>>>>>> --- a/sound/soc/tegra/tegra30_i2s.c
>>>>>> +++ b/sound/soc/tegra/tegra30_i2s.c
>>>>>> @@ -127,7 +127,7 @@ static int tegra30_i2s_hw_params(struct
>>>>>> snd_pcm_substream *substream,
>>>>>>        struct device *dev = dai->dev;
>>>>>>        struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>>>>>>        unsigned int mask, val, reg;
>>>>>> -    int ret, sample_size, srate, i2sclock, bitcnt;
>>>>>> +    int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
>>>>>>        struct tegra30_ahub_cif_conf cif_conf;
>>>>>>          if (params_channels(params) != 2)
>>>>>> @@ -137,8 +137,19 @@ static int tegra30_i2s_hw_params(struct
>>>>>> snd_pcm_substream *substream,
>>>>>>        switch (params_format(params)) {
>>>>>>        case SNDRV_PCM_FORMAT_S16_LE:
>>>>>>            val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
>>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>>>            sample_size = 16;
>>>>>>            break;
>>>>>> +    case SNDRV_PCM_FORMAT_S24_LE:
>>>>>> +        val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
>>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_24;
>>>>>> +        sample_size = 24;
>>>>>> +        break;
>>>>>> +    case SNDRV_PCM_FORMAT_S32_LE:
>>>>>> +        val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
>>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_32;
>>>>>> +        sample_size = 32;
>>>>>> +        break;
>>>>>>        default:
>>>>>>            return -EINVAL;
>>>>>>        }
>>>>>> @@ -170,8 +181,8 @@ static int tegra30_i2s_hw_params(struct
>>>>>> snd_pcm_substream *substream,
>>>>>>        cif_conf.threshold = 0;
>>>>>>        cif_conf.audio_channels = 2;
>>>>>>        cif_conf.client_channels = 2;
>>>>>> -    cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>>> -    cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>>> +    cif_conf.audio_bits = audio_bits;
>>>>>> +    cif_conf.client_bits = audio_bits;
>>>>>>        cif_conf.expand = 0;
>>>>>>        cif_conf.stereo_conv = 0;
>>>>>>        cif_conf.replicate = 0;
>>>>>> @@ -306,14 +317,18 @@ static const struct snd_soc_dai_driver
>>>>>> tegra30_i2s_dai_template = {
>>>>>>            .channels_min = 2,
>>>>>>            .channels_max = 2,
>>>>>>            .rates = SNDRV_PCM_RATE_8000_96000,
>>>>>> -        .formats = SNDRV_PCM_FMTBIT_S16_LE,
>>>>>> +        .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>>>>> +               SNDRV_PCM_FMTBIT_S24_LE |
>>>>>> +               SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>        },
>>>>>>        .capture = {
>>>>>>            .stream_name = "Capture",
>>>>>>            .channels_min = 2,
>>>>>>            .channels_max = 2,
>>>>>>            .rates = SNDRV_PCM_RATE_8000_96000,
>>>>>> -        .formats = SNDRV_PCM_FMTBIT_S16_LE,
>>>>>> +        .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>>>>> +               SNDRV_PCM_FMTBIT_S24_LE |
>>>>>> +               SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>        },
>>>>>>        .ops = &tegra30_i2s_dai_ops,
>>>>>>        .symmetric_rates = 1,
>>>>>>
>>>>>
>>>>> Hello,
>>>>>
>>>>> This patch breaks audio on Tegra30. I don't see errors anywhere, but
>>>>> there is no audio and reverting this patch helps. Please fix it.
>>>>
>>>> What is the failure mode? I can try and take a look at this some time
>>>> this week, but I am not sure if I have any boards with an actual useful
>>>> audio output?
>>>
>>> The failure mode is that there no sound. I also noticed that video
>>> playback stutters a lot if movie file has audio track, seems something
>>> times out during of the audio playback. For now I don't have any more info.
>>>
>>
>> Oh, I didn't say how to reproduce it.. for example simply playing
>> big_buck_bunny_720p_h264.mov in MPV has the audio problem.
>>
>> https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_h264.mov
>>
> 
> Hello Ben,
> 
> Do you have any updates? I just re-check whether problem persists and
> it's still there using a recent linux-next.
> 
> Interestingly, I can hear some sound now, but it's very distorted.
> 
> If you don't have a solution, then what about to revert the patches for
> now and try again later on?

I will try and have a look later, I had completely forgotten these had
been merged.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1EBB127EEE
	for <lists+linux-tegra@lfdr.de>; Fri, 20 Dec 2019 16:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727407AbfLTPCa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 20 Dec 2019 10:02:30 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44907 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727233AbfLTPC3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Dec 2019 10:02:29 -0500
Received: by mail-lf1-f65.google.com with SMTP id v201so7247067lfa.11
        for <linux-tegra@vger.kernel.org>; Fri, 20 Dec 2019 07:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MlFuak06Cmps6wMpnaD71zwpjTVLzEqESjElloc7LCs=;
        b=bzBksC74unjLUTSNJ9LTu/0jA1k8Eb5ZmZFtmc2XhZV54wcj0Hs2QUlYWGUdAFreHh
         EPDbPz6GLGEB4N1anGt91ZXAfUE1V8o4m0AVYTXWrD5lgf0s6nzutxnCaP9opJLnfpJ+
         EL54Bf30bCl2paqg75VMh/3xHb85kvXluQ95BjhY0tSsIDrgJKacCLReIqAJe6pr40Dd
         LjJwdVP3IznPtdluo19N701g72XbpLuzTaUsiFjfXPCr01HoolPltdNYctbgL8RWVxDg
         77LbI5Uko0Q5U7Wj5whTLa9JcBm+31td5gQJ50UGPQhSOOqLpHAOJJGpV6BCC5Vg5rNR
         KJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MlFuak06Cmps6wMpnaD71zwpjTVLzEqESjElloc7LCs=;
        b=RtrJLxh9T+WgIdJw59ykysfKWU7Z7WWGLYvV6tlnKD6xageNjBG0Iqgzsu0j0T9Sug
         PRS1sbNyytKxrYiLOOqDlZFhHOBKTEVTyY8WUf8OluhsfcG9L2HGqZX6PhbuU05AczRa
         bBF1r9YM3+djYEtz0+hvKTbuidPTczr3eBSG5yehGY2XRN0McCqvtPloIeBrK5vnOMR/
         srXz7a4HvwIlOzybZ0JvuXmqAjDos66Rm1KXwNVh8Ey9n+WArD9aS7PxNaEyg5jR4xJg
         WcE8qKNw5X3E6g3//yGvjDb2g/8kIj30ys8Axm/vkLEYdKOJ+L/sB9yNhovTEdmKvWjv
         FxSw==
X-Gm-Message-State: APjAAAU7VQKaON305DZy++bQSnpVnuTeY9TdPLAujGP/HJ3bloW+QBVL
        GF+C4kYL1v0kRc5EDLjXPtWiRIRC
X-Google-Smtp-Source: APXvYqyUv5bsYT89+s3bGupr3x8zRyZoL7ukNG6hTwbuy8SXSfKcRxMb5xPiTJ1LaCrqDXCo87EveA==
X-Received: by 2002:ac2:4884:: with SMTP id x4mr8997942lfc.92.1576854147072;
        Fri, 20 Dec 2019 07:02:27 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id y7sm4342276ljj.58.2019.12.20.07.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2019 07:02:26 -0800 (PST)
Subject: Re: [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit samples
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
Date:   Fri, 20 Dec 2019 18:02:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

20.12.2019 17:56, Ben Dooks пишет:
> On 20/12/2019 14:43, Dmitry Osipenko wrote:
>> 20.12.2019 16:57, Jon Hunter пишет:
>>>
>>> On 20/12/2019 11:38, Ben Dooks wrote:
>>>> On 20/12/2019 11:30, Jon Hunter wrote:
>>>>>
>>>>> On 25/11/2019 17:28, Dmitry Osipenko wrote:
>>>>>> 25.11.2019 20:22, Dmitry Osipenko пишет:
>>>>>>> 25.11.2019 13:37, Ben Dooks пишет:
>>>>>>>> On 23/11/2019 21:09, Dmitry Osipenko wrote:
>>>>>>>>> 18.10.2019 18:48, Ben Dooks пишет:
>>>>>>>>>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>>>>>>>>>>
>>>>>>>>>> The tegra3 audio can support 24 and 32 bit sample sizes so add
>>>>>>>>>> the
>>>>>>>>>> option to the tegra30_i2s_hw_params to configure the S24_LE or
>>>>>>>>>> S32_LE
>>>>>>>>>> formats when requested.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>>>>>>>>>> [ben.dooks@codethink.co.uk: fixup merge of 24 and 32bit]
>>>>>>>>>> [ben.dooks@codethink.co.uk: add pm calls around ytdm config]
>>>>>>>>>> [ben.dooks@codethink.co.uk: drop debug printing to dev_dbg]
>>>>>>>>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>>>>>>> ---
>>>>>>>>>> squash 5aeca5a055fd ASoC: tegra: i2s: pm_runtime_get_sync() is
>>>>>>>>>> needed
>>>>>>>>>> in tdm code
>>>>>>>>>>
>>>>>>>>>> ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
>>>>>>>>>> ---
>>>>>>>>>>     sound/soc/tegra/tegra30_i2s.c | 25 ++++++++++++++++++++-----
>>>>>>>>>>     1 file changed, 20 insertions(+), 5 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/sound/soc/tegra/tegra30_i2s.c
>>>>>>>>>> b/sound/soc/tegra/tegra30_i2s.c
>>>>>>>>>> index 73f0dddeaef3..063f34c882af 100644
>>>>>>>>>> --- a/sound/soc/tegra/tegra30_i2s.c
>>>>>>>>>> +++ b/sound/soc/tegra/tegra30_i2s.c
>>>>>>>>>> @@ -127,7 +127,7 @@ static int tegra30_i2s_hw_params(struct
>>>>>>>>>> snd_pcm_substream *substream,
>>>>>>>>>>         struct device *dev = dai->dev;
>>>>>>>>>>         struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>>>>>>>>>>         unsigned int mask, val, reg;
>>>>>>>>>> -    int ret, sample_size, srate, i2sclock, bitcnt;
>>>>>>>>>> +    int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
>>>>>>>>>>         struct tegra30_ahub_cif_conf cif_conf;
>>>>>>>>>>           if (params_channels(params) != 2)
>>>>>>>>>> @@ -137,8 +137,19 @@ static int tegra30_i2s_hw_params(struct
>>>>>>>>>> snd_pcm_substream *substream,
>>>>>>>>>>         switch (params_format(params)) {
>>>>>>>>>>         case SNDRV_PCM_FORMAT_S16_LE:
>>>>>>>>>>             val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
>>>>>>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>>>>>>>             sample_size = 16;
>>>>>>>>>>             break;
>>>>>>>>>> +    case SNDRV_PCM_FORMAT_S24_LE:
>>>>>>>>>> +        val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
>>>>>>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_24;
>>>>>>>>>> +        sample_size = 24;
>>>>>>>>>> +        break;
>>>>>>>>>> +    case SNDRV_PCM_FORMAT_S32_LE:
>>>>>>>>>> +        val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
>>>>>>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_32;
>>>>>>>>>> +        sample_size = 32;
>>>>>>>>>> +        break;
>>>>>>>>>>         default:
>>>>>>>>>>             return -EINVAL;
>>>>>>>>>>         }
>>>>>>>>>> @@ -170,8 +181,8 @@ static int tegra30_i2s_hw_params(struct
>>>>>>>>>> snd_pcm_substream *substream,
>>>>>>>>>>         cif_conf.threshold = 0;
>>>>>>>>>>         cif_conf.audio_channels = 2;
>>>>>>>>>>         cif_conf.client_channels = 2;
>>>>>>>>>> -    cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>>>>>>> -    cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>>>>>>> +    cif_conf.audio_bits = audio_bits;
>>>>>>>>>> +    cif_conf.client_bits = audio_bits;
>>>>>>>>>>         cif_conf.expand = 0;
>>>>>>>>>>         cif_conf.stereo_conv = 0;
>>>>>>>>>>         cif_conf.replicate = 0;
>>>>>>>>>> @@ -306,14 +317,18 @@ static const struct snd_soc_dai_driver
>>>>>>>>>> tegra30_i2s_dai_template = {
>>>>>>>>>>             .channels_min = 2,
>>>>>>>>>>             .channels_max = 2,
>>>>>>>>>>             .rates = SNDRV_PCM_RATE_8000_96000,
>>>>>>>>>> -        .formats = SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>>>>> +        .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>>>>>>>>> +               SNDRV_PCM_FMTBIT_S24_LE |
>>>>>>>>>> +               SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>>>>>         },
>>>>>>>>>>         .capture = {
>>>>>>>>>>             .stream_name = "Capture",
>>>>>>>>>>             .channels_min = 2,
>>>>>>>>>>             .channels_max = 2,
>>>>>>>>>>             .rates = SNDRV_PCM_RATE_8000_96000,
>>>>>>>>>> -        .formats = SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>>>>> +        .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>>>>>>>>> +               SNDRV_PCM_FMTBIT_S24_LE |
>>>>>>>>>> +               SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>>>>>         },
>>>>>>>>>>         .ops = &tegra30_i2s_dai_ops,
>>>>>>>>>>         .symmetric_rates = 1,
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Hello,
>>>>>>>>>
>>>>>>>>> This patch breaks audio on Tegra30. I don't see errors
>>>>>>>>> anywhere, but
>>>>>>>>> there is no audio and reverting this patch helps. Please fix it.
>>>>>>>>
>>>>>>>> What is the failure mode? I can try and take a look at this some
>>>>>>>> time
>>>>>>>> this week, but I am not sure if I have any boards with an actual
>>>>>>>> useful
>>>>>>>> audio output?
>>>>>>>
>>>>>>> The failure mode is that there no sound. I also noticed that video
>>>>>>> playback stutters a lot if movie file has audio track, seems
>>>>>>> something
>>>>>>> times out during of the audio playback. For now I don't have any
>>>>>>> more info.
>>>>>>>
>>>>>>
>>>>>> Oh, I didn't say how to reproduce it.. for example simply playing
>>>>>> big_buck_bunny_720p_h264.mov in MPV has the audio problem.
>>>>>>
>>>>>> https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_h264.mov
>>>>>>
>>>>>>
>>>>>
>>>>> Given that the audio drivers uses regmap, it could be good to dump the
>>>>> I2S/AHUB registers while the clip if playing with and without this
>>>>> patch
>>>>> to see the differences. I am curious if the audio is now being
>>>>> played as
>>>>> 24 or 32-bit instead of 16-bit now these are available.
>>>>>
>>>>> You could also dump the hw_params to see the format while playing as
>>>>> well ...
>>>>>
>>>>> $ /proc/asound/<scard-name>/pcm0p/sub0/hw_params
>>>>
>>>> I suppose it is also possible that the codec isn't properly doing >16
>>>> bits and the fact we now offer 24 and 32 could be an issue. I've not
>>>> got anything with an audio output on it that would be easy to test.
>>>
>>> I thought I had tested on a Jetson TK1 (Tegra124) but it was sometime
>>> back. However, admittedly I may have only done simple 16-bit testing
>>> with speaker-test.
>>>
>>> We do verify that all soundcards are detected and registered as expected
>>> during daily testing, but at the moment we don't have anything that
>>> verifies actual playback.
>>
>> Please take a look at the attached logs.
> 
> I wonder if we are falling into FIFO configuration issues with the
> non-16 bit case.
> 
> Can you try adding the following two patches?

It is much better now! There is no horrible noise and no stuttering, but
audio still has a "robotic" effect, like freq isn't correct.

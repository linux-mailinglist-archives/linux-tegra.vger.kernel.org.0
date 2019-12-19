Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A193B126FAA
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Dec 2019 22:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbfLSVVM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 19 Dec 2019 16:21:12 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34209 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbfLSVVM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Dec 2019 16:21:12 -0500
Received: by mail-lj1-f196.google.com with SMTP id z22so2969102ljg.1
        for <linux-tegra@vger.kernel.org>; Thu, 19 Dec 2019 13:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hrHBkQaep6JoKVoAjFMFBIJdnw7horgDntnw6g1jYnQ=;
        b=VDMQA50bZy2cHHQqXOEijfydyzoFBRM8y/7tAdV90QziNqm/2jgHYTOFoPVjsEMrO5
         qo34gchWToB9/soqHX3sR5PvUFiXfdCY9UIR+b3ihTgb43MK39+fi3wLBHBgSKXgfyS7
         16rrUuLrrvSY/QV+VTF4h6S9TnB948toCeU8uektmjEECR02mn6Lxb1J+8L+MOXC0ajT
         HqmrI1Ngcgb+Epsjj8qIhFCQUWF28ZxDc0811bBA0JKudDGNhqJsr2tBMWoTm8aUlQK5
         A2dawVHfg12SaZrboJQSJQ968+FM+45erzSLUqpCJGxNq0F92ws+T1bKS0kqinqb0+J5
         jF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hrHBkQaep6JoKVoAjFMFBIJdnw7horgDntnw6g1jYnQ=;
        b=clun0c03mAzTMm46APyUwjCUFfHjFNm1AkD0TQ5YUBzYmIA/89HdDdPi0/CDclA2mE
         EZ9BslMCujJQXVDa0HODxVsD6m+3lljGWrWSbigNvdVqPOsnjYigyaSQ6ccQxfFhSxgi
         C4rJCIXD7PWYFy+CD0vUqlmKA3lPFQV7eEvBR/DXeQH2nsKwBPImThE5BeZ5XMJSf7ti
         rmjwiUowsBWaNA/65FvB4dngjtEZmKz+ycvfAXRGschKc5p1TtukvWhU48eDPRaLMXT/
         +4VaX+vVkVjUwiqIIMVYlVYyTS+GiFHOFlj+h+PSQLCHJKAAvLGYWFkNVENP9pmGMzRg
         N3qA==
X-Gm-Message-State: APjAAAVREUSGwWZQnC7HZ2eqax+jfa/w9jrkErJo5KB6rRsRgNIiH1/7
        YQQab0jLUdVr9pehkRC8D7A=
X-Google-Smtp-Source: APXvYqxPhvgktTxBr6AhuaKKP/a2PG+9IY6Ut3VgNnkDlDUjUYX5Qvhrag0lrl6g+VI+k6TtCloZ5A==
X-Received: by 2002:a2e:9157:: with SMTP id q23mr7778245ljg.196.1576790470304;
        Thu, 19 Dec 2019 13:21:10 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id d20sm336609ljg.95.2019.12.19.13.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2019 13:21:09 -0800 (PST)
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
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
Message-ID: <eec79f8c-2ed2-3bc8-e923-ea78be0c12a9@gmail.com>
Date:   Fri, 20 Dec 2019 00:21:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.11.2019 20:28, Dmitry Osipenko пишет:
> 25.11.2019 20:22, Dmitry Osipenko пишет:
>> 25.11.2019 13:37, Ben Dooks пишет:
>>> On 23/11/2019 21:09, Dmitry Osipenko wrote:
>>>> 18.10.2019 18:48, Ben Dooks пишет:
>>>>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>>>>>
>>>>> The tegra3 audio can support 24 and 32 bit sample sizes so add the
>>>>> option to the tegra30_i2s_hw_params to configure the S24_LE or S32_LE
>>>>> formats when requested.
>>>>>
>>>>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>>>>> [ben.dooks@codethink.co.uk: fixup merge of 24 and 32bit]
>>>>> [ben.dooks@codethink.co.uk: add pm calls around ytdm config]
>>>>> [ben.dooks@codethink.co.uk: drop debug printing to dev_dbg]
>>>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>> ---
>>>>> squash 5aeca5a055fd ASoC: tegra: i2s: pm_runtime_get_sync() is needed
>>>>> in tdm code
>>>>>
>>>>> ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
>>>>> ---
>>>>>   sound/soc/tegra/tegra30_i2s.c | 25 ++++++++++++++++++++-----
>>>>>   1 file changed, 20 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/sound/soc/tegra/tegra30_i2s.c
>>>>> b/sound/soc/tegra/tegra30_i2s.c
>>>>> index 73f0dddeaef3..063f34c882af 100644
>>>>> --- a/sound/soc/tegra/tegra30_i2s.c
>>>>> +++ b/sound/soc/tegra/tegra30_i2s.c
>>>>> @@ -127,7 +127,7 @@ static int tegra30_i2s_hw_params(struct
>>>>> snd_pcm_substream *substream,
>>>>>       struct device *dev = dai->dev;
>>>>>       struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>>>>>       unsigned int mask, val, reg;
>>>>> -    int ret, sample_size, srate, i2sclock, bitcnt;
>>>>> +    int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
>>>>>       struct tegra30_ahub_cif_conf cif_conf;
>>>>>         if (params_channels(params) != 2)
>>>>> @@ -137,8 +137,19 @@ static int tegra30_i2s_hw_params(struct
>>>>> snd_pcm_substream *substream,
>>>>>       switch (params_format(params)) {
>>>>>       case SNDRV_PCM_FORMAT_S16_LE:
>>>>>           val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>>           sample_size = 16;
>>>>>           break;
>>>>> +    case SNDRV_PCM_FORMAT_S24_LE:
>>>>> +        val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_24;
>>>>> +        sample_size = 24;
>>>>> +        break;
>>>>> +    case SNDRV_PCM_FORMAT_S32_LE:
>>>>> +        val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_32;
>>>>> +        sample_size = 32;
>>>>> +        break;
>>>>>       default:
>>>>>           return -EINVAL;
>>>>>       }
>>>>> @@ -170,8 +181,8 @@ static int tegra30_i2s_hw_params(struct
>>>>> snd_pcm_substream *substream,
>>>>>       cif_conf.threshold = 0;
>>>>>       cif_conf.audio_channels = 2;
>>>>>       cif_conf.client_channels = 2;
>>>>> -    cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>> -    cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>> +    cif_conf.audio_bits = audio_bits;
>>>>> +    cif_conf.client_bits = audio_bits;
>>>>>       cif_conf.expand = 0;
>>>>>       cif_conf.stereo_conv = 0;
>>>>>       cif_conf.replicate = 0;
>>>>> @@ -306,14 +317,18 @@ static const struct snd_soc_dai_driver
>>>>> tegra30_i2s_dai_template = {
>>>>>           .channels_min = 2,
>>>>>           .channels_max = 2,
>>>>>           .rates = SNDRV_PCM_RATE_8000_96000,
>>>>> -        .formats = SNDRV_PCM_FMTBIT_S16_LE,
>>>>> +        .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>>>> +               SNDRV_PCM_FMTBIT_S24_LE |
>>>>> +               SNDRV_PCM_FMTBIT_S16_LE,
>>>>>       },
>>>>>       .capture = {
>>>>>           .stream_name = "Capture",
>>>>>           .channels_min = 2,
>>>>>           .channels_max = 2,
>>>>>           .rates = SNDRV_PCM_RATE_8000_96000,
>>>>> -        .formats = SNDRV_PCM_FMTBIT_S16_LE,
>>>>> +        .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>>>> +               SNDRV_PCM_FMTBIT_S24_LE |
>>>>> +               SNDRV_PCM_FMTBIT_S16_LE,
>>>>>       },
>>>>>       .ops = &tegra30_i2s_dai_ops,
>>>>>       .symmetric_rates = 1,
>>>>>
>>>>
>>>> Hello,
>>>>
>>>> This patch breaks audio on Tegra30. I don't see errors anywhere, but
>>>> there is no audio and reverting this patch helps. Please fix it.
>>>
>>> What is the failure mode? I can try and take a look at this some time
>>> this week, but I am not sure if I have any boards with an actual useful
>>> audio output?
>>
>> The failure mode is that there no sound. I also noticed that video
>> playback stutters a lot if movie file has audio track, seems something
>> times out during of the audio playback. For now I don't have any more info.
>>
> 
> Oh, I didn't say how to reproduce it.. for example simply playing
> big_buck_bunny_720p_h264.mov in MPV has the audio problem.
> 
> https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_h264.mov
> 

Hello Ben,

Do you have any updates? I just re-check whether problem persists and
it's still there using a recent linux-next.

Interestingly, I can hear some sound now, but it's very distorted.

If you don't have a solution, then what about to revert the patches for
now and try again later on?

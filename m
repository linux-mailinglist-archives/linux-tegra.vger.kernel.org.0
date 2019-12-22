Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4AD8128EFE
	for <lists+linux-tegra@lfdr.de>; Sun, 22 Dec 2019 18:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbfLVRIm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 22 Dec 2019 12:08:42 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34771 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfLVRIl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 22 Dec 2019 12:08:41 -0500
Received: by mail-lf1-f66.google.com with SMTP id l18so2736166lfc.1
        for <linux-tegra@vger.kernel.org>; Sun, 22 Dec 2019 09:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XjviABgI8uKT6jfajitLOO1FKERwjoQLoHocvrVg72o=;
        b=lBOnFY3SjyNV+mLXr5VAodcA9UsoqDyherSaxNhPxoC/QZ4L9b6vQdSvK819AFBDKI
         yQ2SE/dFKELWNRGzgYWJm9euqup+1I+pneg8LppYsOVsKAfEDEf2bg83sERfsxkyO8mw
         L7jBmBy+2fRxulXbKP1q/xChybQ9/eWFsaMXZe+1AqGgKaRMnSg5SN9l7A8ntyaRt+FJ
         J3yufFsYhga53LGbTHp2XC7lrO0iBM1pDQW2nk/0Tu+chIRqWAF/S3bdvMWUAbfdy/F+
         tCG1xw8qltt8yHYo0RUkER4vRctWjYfUyN8LO6DgD63rLWQeORm5mnU7Ma2TqP/J6k1v
         91Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XjviABgI8uKT6jfajitLOO1FKERwjoQLoHocvrVg72o=;
        b=st1VbC2JBBbk6fZdLKTpJmP4I2sE/Ghib0feq2oXDys6RPU0NMSbW6s26qnQHYdnc/
         KcBEnjuIF5bVTQpE+w6PZVUjIs0MfVqLCi4pGRaWVBXpdBwRVKyr7YODP7qdTpdIOyLd
         m9+5rc8l6kuHS5gf9LCFvtm9kKsX9prb1wqP0qr6uxHuA+BlesZNaKNL6tVchDHlYw+5
         bLO98LchmRZdnt8zfHEXN1T6+iJWpDjhMNTTtyMa4I0tKg73vdBXnc0KG7adV7WrWxhp
         5wlrTiIlcHYLHCk7+EPXzdJt1C3c3PWWXcR6Dl7bOBX+inAZKOJ6Y6ItJRnaNmz+D5FU
         0oGA==
X-Gm-Message-State: APjAAAWAb37NakzikyE/276jsTkk/EibZiTpNpAc+0g1NJwiLopS+aQ6
        IRvA8J4Au2JQxfGJBDxSPiA=
X-Google-Smtp-Source: APXvYqxbp8UI/QkymBKq3DjOPVLPJClfNyE7gfYuRk2VmJjWAMXYrICeuyMLELXqjGKo5BVN8DPAmg==
X-Received: by 2002:a19:4849:: with SMTP id v70mr14443964lfa.30.1577034518474;
        Sun, 22 Dec 2019 09:08:38 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id u13sm6859516lfq.19.2019.12.22.09.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Dec 2019 09:08:37 -0800 (PST)
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
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
Date:   Sun, 22 Dec 2019 20:08:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

20.12.2019 20:06, Ben Dooks пишет:
> On 20/12/2019 16:40, Dmitry Osipenko wrote:
>> 20.12.2019 18:25, Ben Dooks пишет:
>>> On 20/12/2019 15:02, Dmitry Osipenko wrote:
>>>> 20.12.2019 17:56, Ben Dooks пишет:
>>>>> On 20/12/2019 14:43, Dmitry Osipenko wrote:
>>>>>> 20.12.2019 16:57, Jon Hunter пишет:
>>>>>>>
>>>>>>> On 20/12/2019 11:38, Ben Dooks wrote:
>>>>>>>> On 20/12/2019 11:30, Jon Hunter wrote:
>>>>>>>>>
>>>>>>>>> On 25/11/2019 17:28, Dmitry Osipenko wrote:
>>>>>>>>>> 25.11.2019 20:22, Dmitry Osipenko пишет:
>>>>>>>>>>> 25.11.2019 13:37, Ben Dooks пишет:
>>>>>>>>>>>> On 23/11/2019 21:09, Dmitry Osipenko wrote:
>>>>>>>>>>>>> 18.10.2019 18:48, Ben Dooks пишет:
>>>>>>>>>>>>>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> The tegra3 audio can support 24 and 32 bit sample sizes so
>>>>>>>>>>>>>> add
>>>>>>>>>>>>>> the
>>>>>>>>>>>>>> option to the tegra30_i2s_hw_params to configure the
>>>>>>>>>>>>>> S24_LE or
>>>>>>>>>>>>>> S32_LE
>>>>>>>>>>>>>> formats when requested.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>>>>>>>>>>>>>> [ben.dooks@codethink.co.uk: fixup merge of 24 and 32bit]
>>>>>>>>>>>>>> [ben.dooks@codethink.co.uk: add pm calls around ytdm config]
>>>>>>>>>>>>>> [ben.dooks@codethink.co.uk: drop debug printing to dev_dbg]
>>>>>>>>>>>>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>> squash 5aeca5a055fd ASoC: tegra: i2s:
>>>>>>>>>>>>>> pm_runtime_get_sync() is
>>>>>>>>>>>>>> needed
>>>>>>>>>>>>>> in tdm code
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>       sound/soc/tegra/tegra30_i2s.c | 25
>>>>>>>>>>>>>> ++++++++++++++++++++-----
>>>>>>>>>>>>>>       1 file changed, 20 insertions(+), 5 deletions(-)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> diff --git a/sound/soc/tegra/tegra30_i2s.c
>>>>>>>>>>>>>> b/sound/soc/tegra/tegra30_i2s.c
>>>>>>>>>>>>>> index 73f0dddeaef3..063f34c882af 100644
>>>>>>>>>>>>>> --- a/sound/soc/tegra/tegra30_i2s.c
>>>>>>>>>>>>>> +++ b/sound/soc/tegra/tegra30_i2s.c
>>>>>>>>>>>>>> @@ -127,7 +127,7 @@ static int tegra30_i2s_hw_params(struct
>>>>>>>>>>>>>> snd_pcm_substream *substream,
>>>>>>>>>>>>>>           struct device *dev = dai->dev;
>>>>>>>>>>>>>>           struct tegra30_i2s *i2s =
>>>>>>>>>>>>>> snd_soc_dai_get_drvdata(dai);
>>>>>>>>>>>>>>           unsigned int mask, val, reg;
>>>>>>>>>>>>>> -    int ret, sample_size, srate, i2sclock, bitcnt;
>>>>>>>>>>>>>> +    int ret, sample_size, srate, i2sclock, bitcnt,
>>>>>>>>>>>>>> audio_bits;
>>>>>>>>>>>>>>           struct tegra30_ahub_cif_conf cif_conf;
>>>>>>>>>>>>>>             if (params_channels(params) != 2)
>>>>>>>>>>>>>> @@ -137,8 +137,19 @@ static int tegra30_i2s_hw_params(struct
>>>>>>>>>>>>>> snd_pcm_substream *substream,
>>>>>>>>>>>>>>           switch (params_format(params)) {
>>>>>>>>>>>>>>           case SNDRV_PCM_FORMAT_S16_LE:
>>>>>>>>>>>>>>               val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
>>>>>>>>>>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>>>>>>>>>>>               sample_size = 16;
>>>>>>>>>>>>>>               break;
>>>>>>>>>>>>>> +    case SNDRV_PCM_FORMAT_S24_LE:
>>>>>>>>>>>>>> +        val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
>>>>>>>>>>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_24;
>>>>>>>>>>>>>> +        sample_size = 24;
>>>>>>>>>>>>>> +        break;
>>>>>>>>>>>>>> +    case SNDRV_PCM_FORMAT_S32_LE:
>>>>>>>>>>>>>> +        val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
>>>>>>>>>>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_32;
>>>>>>>>>>>>>> +        sample_size = 32;
>>>>>>>>>>>>>> +        break;
>>>>>>>>>>>>>>           default:
>>>>>>>>>>>>>>               return -EINVAL;
>>>>>>>>>>>>>>           }
>>>>>>>>>>>>>> @@ -170,8 +181,8 @@ static int tegra30_i2s_hw_params(struct
>>>>>>>>>>>>>> snd_pcm_substream *substream,
>>>>>>>>>>>>>>           cif_conf.threshold = 0;
>>>>>>>>>>>>>>           cif_conf.audio_channels = 2;
>>>>>>>>>>>>>>           cif_conf.client_channels = 2;
>>>>>>>>>>>>>> -    cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>>>>>>>>>>> -    cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>>>>>>>>>>> +    cif_conf.audio_bits = audio_bits;
>>>>>>>>>>>>>> +    cif_conf.client_bits = audio_bits;
>>>>>>>>>>>>>>           cif_conf.expand = 0;
>>>>>>>>>>>>>>           cif_conf.stereo_conv = 0;
>>>>>>>>>>>>>>           cif_conf.replicate = 0;
>>>>>>>>>>>>>> @@ -306,14 +317,18 @@ static const struct snd_soc_dai_driver
>>>>>>>>>>>>>> tegra30_i2s_dai_template = {
>>>>>>>>>>>>>>               .channels_min = 2,
>>>>>>>>>>>>>>               .channels_max = 2,
>>>>>>>>>>>>>>               .rates = SNDRV_PCM_RATE_8000_96000,
>>>>>>>>>>>>>> -        .formats = SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>>>>>>>>> +        .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>>>>>>>>>>>>> +               SNDRV_PCM_FMTBIT_S24_LE |
>>>>>>>>>>>>>> +               SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>>>>>>>>>           },
>>>>>>>>>>>>>>           .capture = {
>>>>>>>>>>>>>>               .stream_name = "Capture",
>>>>>>>>>>>>>>               .channels_min = 2,
>>>>>>>>>>>>>>               .channels_max = 2,
>>>>>>>>>>>>>>               .rates = SNDRV_PCM_RATE_8000_96000,
>>>>>>>>>>>>>> -        .formats = SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>>>>>>>>> +        .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>>>>>>>>>>>>> +               SNDRV_PCM_FMTBIT_S24_LE |
>>>>>>>>>>>>>> +               SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>>>>>>>>>           },
>>>>>>>>>>>>>>           .ops = &tegra30_i2s_dai_ops,
>>>>>>>>>>>>>>           .symmetric_rates = 1,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Hello,
>>>>>>>>>>>>>
>>>>>>>>>>>>> This patch breaks audio on Tegra30. I don't see errors
>>>>>>>>>>>>> anywhere, but
>>>>>>>>>>>>> there is no audio and reverting this patch helps. Please
>>>>>>>>>>>>> fix it.
>>>>>>>>>>>>
>>>>>>>>>>>> What is the failure mode? I can try and take a look at this
>>>>>>>>>>>> some
>>>>>>>>>>>> time
>>>>>>>>>>>> this week, but I am not sure if I have any boards with an
>>>>>>>>>>>> actual
>>>>>>>>>>>> useful
>>>>>>>>>>>> audio output?
>>>>>>>>>>>
>>>>>>>>>>> The failure mode is that there no sound. I also noticed that
>>>>>>>>>>> video
>>>>>>>>>>> playback stutters a lot if movie file has audio track, seems
>>>>>>>>>>> something
>>>>>>>>>>> times out during of the audio playback. For now I don't have any
>>>>>>>>>>> more info.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Oh, I didn't say how to reproduce it.. for example simply playing
>>>>>>>>>> big_buck_bunny_720p_h264.mov in MPV has the audio problem.
>>>>>>>>>>
>>>>>>>>>> https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_h264.mov
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Given that the audio drivers uses regmap, it could be good to
>>>>>>>>> dump the
>>>>>>>>> I2S/AHUB registers while the clip if playing with and without this
>>>>>>>>> patch
>>>>>>>>> to see the differences. I am curious if the audio is now being
>>>>>>>>> played as
>>>>>>>>> 24 or 32-bit instead of 16-bit now these are available.
>>>>>>>>>
>>>>>>>>> You could also dump the hw_params to see the format while
>>>>>>>>> playing as
>>>>>>>>> well ...
>>>>>>>>>
>>>>>>>>> $ /proc/asound/<scard-name>/pcm0p/sub0/hw_params
>>>>>>>>
>>>>>>>> I suppose it is also possible that the codec isn't properly
>>>>>>>> doing >16
>>>>>>>> bits and the fact we now offer 24 and 32 could be an issue. I've
>>>>>>>> not
>>>>>>>> got anything with an audio output on it that would be easy to test.
>>>>>>>
>>>>>>> I thought I had tested on a Jetson TK1 (Tegra124) but it was
>>>>>>> sometime
>>>>>>> back. However, admittedly I may have only done simple 16-bit testing
>>>>>>> with speaker-test.
>>>>>>>
>>>>>>> We do verify that all soundcards are detected and registered as
>>>>>>> expected
>>>>>>> during daily testing, but at the moment we don't have anything that
>>>>>>> verifies actual playback.
>>>>>>
>>>>>> Please take a look at the attached logs.
>>>>>
>>>>> I wonder if we are falling into FIFO configuration issues with the
>>>>> non-16 bit case.
>>>>>
>>>>> Can you try adding the following two patches?
>>>>
>>>> It is much better now! There is no horrible noise and no stuttering,
>>>> but
>>>> audio still has a "robotic" effect, like freq isn't correct.
>>>
>>> I wonder if there's an issue with FIFO stoking? I should also possibly
>>> add the correctly stop FIFOs patch as well.
>>
>> I'll be happy to try more patches.
>>
>> Meanwhile sound on v5.5+ is broken and thus the incomplete patches
>> should be reverted.
> 
> Have you checked if just removing the 24/32 bits from .formats in
> the dai template and see if the problem continues? 

It works.

> I will try and
> see if I can find the code that does the fifo level checking and
> see if the problem is in the FIFO fill or something else in the
> audio hub setup.

Ok

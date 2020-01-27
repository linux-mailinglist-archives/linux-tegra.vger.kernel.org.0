Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4634614AA66
	for <lists+linux-tegra@lfdr.de>; Mon, 27 Jan 2020 20:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgA0TYB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 27 Jan 2020 14:24:01 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42543 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgA0TYB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Jan 2020 14:24:01 -0500
Received: by mail-lj1-f193.google.com with SMTP id y4so12092611ljj.9
        for <linux-tegra@vger.kernel.org>; Mon, 27 Jan 2020 11:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OST5SeT3IPtWRL/o8QAYnXMGBOyNWd1HSmdaFnyReAg=;
        b=iCbhUQAMR3apgLO8W8JIWLIrvRCbwx8fy49iKVnrggSc9lkooNK/EtTiNl8UjFdRN2
         SUHM9fgXyDjQsOPPZMJ/EhLmaliu1OnH29BIX0YwKleWRnaCegpSK8qH2z0xWBl6J4VY
         E7Rdfv+j2uRKmCFu9/5F/M44BxW5BCyWwh1k2g+bHE9J8ppvYglpIQZD6gW0Aby7F+/H
         mWBXEqpJuG2OqTOMg2rU6gLVucrWWdcIEbV/bkFiQGGIvAxGRAHf7dzBbLESvnjgWw/7
         a2s6BOI5/0glhD0JUmJ1O+Zuq4m5tBQel8oZMsnG92+58uuSDKs/UYiwWTPN1trbuNnu
         6jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OST5SeT3IPtWRL/o8QAYnXMGBOyNWd1HSmdaFnyReAg=;
        b=QLpTxu3TZynbNl8JGb5ojn9GLcMlXFKYCSD039oaCucYQzFbZi0H5LOs4FBaEPxhh5
         ThQbbZ6B64KKAXwFJRrXCbheOeZllHkVMelIQ1yZ+QR2rrjP1h5Lvd4GREVoaSVzhmoD
         pgqKQB9+6ruP71W+96xt2w1uknCLPHeNYUhnvaunPNNhmptxrTaZRf6MJxZQslsf8jtI
         lwjfoXbpBkg10fHgq0frPyQmBXFtJuz+sdDEuIWAOjdvkFtiycPCYBsJiko2lUWb0Ou1
         pqJKPraBsdwCkhpoiKBUi8/QaAeKgVwTtxJ04B7O2rNB2Gu6Gr1N873VPSbonkF2iUFK
         cfKg==
X-Gm-Message-State: APjAAAWh9MarUQhADfy5wC1fQQuW9gqZSDS8IDjAUs6wpqwjalhesiP4
        SPEMgUXNMz+g/KCgvQpkzJ48A/t7
X-Google-Smtp-Source: APXvYqzA6c9tI9Fe5lCNgTp76JDpXt88HJyn1Rk8L1p7wlLeP3SVW6mSDvD46XFrvYOY7OS2QtFa7g==
X-Received: by 2002:a2e:9d0f:: with SMTP id t15mr11029474lji.171.1580153038548;
        Mon, 27 Jan 2020 11:23:58 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id q10sm8665447ljj.60.2020.01.27.11.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 11:23:57 -0800 (PST)
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra@vger.kernel.org
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
Message-ID: <1aa6a4bf-10ea-001d-2d35-44494d9554f8@gmail.com>
Date:   Mon, 27 Jan 2020 22:23:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

27.01.2020 22:20, Dmitry Osipenko пишет:
> 24.01.2020 19:50, Jon Hunter пишет:
>>
>> On 23/01/2020 19:38, Ben Dooks wrote:
>>> On 07/01/2020 01:39, Dmitry Osipenko wrote:
>>>> 06.01.2020 22:00, Ben Dooks пишет:
>>>>> On 05/01/2020 10:53, Ben Dooks wrote:
>>>>>>
>>>>>>
>>>>>> On 2020-01-05 01:48, Dmitry Osipenko wrote:
>>>>>>> 05.01.2020 03:04, Ben Dooks пишет:
>>>>>>>> [snip]
>>>>>>>>
>>>>>>>> I've just gone through testing.
>>>>>>>>
>>>>>>>> Some simple data tests show 16 and 32-bits work.
>>>>>>>>
>>>>>>>> The 24 bit case seems to be weird, it looks like the 24-bit expects
>>>>>>>> 24 bit samples in 32 bit words. I can't see any packing options to
>>>>>>>> do 24 bit in 24 bit, so we may have to remove 24 bit sample support
>>>>>>>> (which is a shame)
>>>>>>>>
>>>>>>>> My preference is to remove the 24-bit support and keep the 32 bit in.
>>>>>>>>
>>>>>>>
>>>>>>> Interesting.. Jon, could you please confirm that 24bit format isn't
>>>>>>> usable on T30?
>>>>>>
>>>>>> If there is an option of 24 packed into 32, then I think that would
>>>>>> work.
>>>>>>
>>>>>> I can try testing that with raw data on Monday.
>>>>>
>>>>> I need to check some things, I assumed 24 was 24 packed bits, it looks
>>>>> like the default is 24 in 32 bits so we may be ok. However I need to
>>>>> re-write my test case which assumed it was 24bits in 3 bytes (S24_3LE).
>>>>>
>>>>> I'll follow up later,
>>>>
>>>> Okay, the S24_3LE isn't supported by RT5640 codec in my case. I briefly
>>>> looked through the TRM doc and got impression that AHUB could re-pack
>>>> data stream into something that codec supports, but maybe it's a wrong
>>>> impression.
>>>> _________________________________
>>>
>>> I did a quick test with the following:
>>>
>>>  sox -n -b 16 -c 2 -r 44100 /tmp/tmp.wav  synth sine 500 vol 0.5
>>>  sox -n -b 24 -c 2 -r 44100 /tmp/tmp.wav  synth sine 500 vol 0.5
>>>  sox -n -b 32 -c 2 -r 44100 /tmp/tmp.wav  synth sine 500 vol 0.5
>>>
>>> The 16 and 32 work fine, the 24 is showing a playback output freq
>>> of 440Hz instead of 500Hz... this suggests the clock is off, or there
>>> is something else weird going on...
>>
>> I was looking at using sox to create such as file, but the above command
>> generates a S24_3LE file and not S24_LE file. The codec on Jetson-TK1
>> supports S24_LE but does not support S24_3LE and so I cannot test this.
>> Anyway, we really need to test S24_LE and not S24_3LE because this is
>> the problem that Dmitry is having.
>>
>> Ben is S24_3LE what you really need to support?
>>
>> Dmitry, does the following fix your problem?
>>
>> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
>> index dbed3c5408e7..92845c4b63f4 100644
>> --- a/sound/soc/tegra/tegra30_i2s.c
>> +++ b/sound/soc/tegra/tegra30_i2s.c
>> @@ -140,7 +140,7 @@ static int tegra30_i2s_hw_params(struct
>> snd_pcm_substream *substream,
>>                 audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>                 sample_size = 16;
>>                 break;
>> -       case SNDRV_PCM_FORMAT_S24_LE:
>> +       case SNDRV_PCM_FORMAT_S24_3LE:
>>                 val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
>>                 audio_bits = TEGRA30_AUDIOCIF_BITS_24;
>>                 sample_size = 24;
>> @@ -318,7 +318,7 @@ static const struct snd_soc_dai_driver
>> tegra30_i2s_dai_template = {
>>                 .channels_max = 2,
>>                 .rates = SNDRV_PCM_RATE_8000_96000,
>>                 .formats = SNDRV_PCM_FMTBIT_S32_LE |
>> -                          SNDRV_PCM_FMTBIT_S24_LE |
>> +                          SNDRV_PCM_FMTBIT_S24_3LE |
>>                            SNDRV_PCM_FMTBIT_S16_LE,
>>         },
>>         .capture = {
>> @@ -327,7 +327,7 @@ static const struct snd_soc_dai_driver
>> tegra30_i2s_dai_template = {
>>                 .channels_max = 2,
>>                 .rates = SNDRV_PCM_RATE_8000_96000,
>>                 .formats = SNDRV_PCM_FMTBIT_S32_LE |
>> -                          SNDRV_PCM_FMTBIT_S24_LE |
>> +                          SNDRV_PCM_FMTBIT_S24_3LE |
>>                            SNDRV_PCM_FMTBIT_S16_LE,
>>         },
>>         .ops = &tegra30_i2s_dai_ops,
>>
>> Jon
>>
> 
> It should solve the problem in my particular case, but I'm not sure that
> the solution is correct.
> 
> The v5.5 kernel is released now with the broken audio and apparently
> getting 24bit to work won't be trivial (if possible at all). Ben, could
> you please send a patch to fix v5.5 by removing the S24 support
> advertisement from the driver?

I also suspect that s32 may need some extra patches and thus could be
worthwhile to stop advertising it as well.

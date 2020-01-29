Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35B6514CD46
	for <lists+linux-tegra@lfdr.de>; Wed, 29 Jan 2020 16:22:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgA2PWd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 29 Jan 2020 10:22:33 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43218 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgA2PWd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Jan 2020 10:22:33 -0500
Received: by mail-lj1-f193.google.com with SMTP id a13so18853935ljm.10
        for <linux-tegra@vger.kernel.org>; Wed, 29 Jan 2020 07:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GditBgjv04bGKi5ughJOq3WqReWgzWw+7OJFtryNwQY=;
        b=QapQxTJVfP76PPBBJ3+k0t6YauG1bfsaydAmNX0jW/tS37X7uFBwn3rBSK+/t0DNBm
         wXlXGQHn/K5L+khuuAeBFy/yZexQyRpjbc8yp30rFQLAvtHMf86d3+h5dir+xyrDuZMD
         Ozhga00M1apPXuPe1i9duLFbhO6FljsyhAbvXuP8mAMUx9r+iSxA9qSWAAQ1It75h7Iu
         4T38TUqEj8Ri3qfyJPc6VihILIETCT9oScM4zGWc21bDZJrna04NK/k1OVRLK2C8K8ob
         dFix87ZfZNrD1itEGb/KyTdqOVKgXWH1+EEVhlAl4hjGGUslgw9wfWOTJK2D6bW5NNHk
         dVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GditBgjv04bGKi5ughJOq3WqReWgzWw+7OJFtryNwQY=;
        b=HvkBea62VaPkuNl8gb0cogFlFPEJQHaYHMwrr2aZgWyoxQvkHYmqppGPKD4BaeJ0rE
         G5GZcRItDArky53C/zbF5Dsr8qtWkO13lxce+KJiNrdGg0nJYUt5nbtyy5maABJG8CLf
         yqns4iHk5vIDRNBQhoza8Hirr124XyOnlTh1jh0eiJUPFmOqUMFavwJuQxlG3+fBz5Yr
         CYtcy4GPQs69b7d9vvBbVwsQMWXf54/bGmzE8CQNq6x8uFgMhuxHDVHlQD6uOxOUtA29
         efkp/U6+EEkUCYj8jSUV+XgicJNqnZrdh/3Iv0J6OoYBdIxCSY5w0cYbt/Hza88f1/a/
         fM9g==
X-Gm-Message-State: APjAAAW9s4wa/JmZ3/gSDDqhhmE5eUgl9inmfcyViT6EvJK5PZ3IWWRB
        a2oZbbA0MLnyzJSl/W16H2k4+glH
X-Google-Smtp-Source: APXvYqyHTxmhchYypqQ3D/M1NjRJy8h5Jmpf0J5DuiV5vm886ljgNTxQBYcUHuMT8r1CfpWdKQrAdQ==
X-Received: by 2002:a2e:97c1:: with SMTP id m1mr16381367ljj.270.1580311350631;
        Wed, 29 Jan 2020 07:22:30 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id f16sm1134650ljn.17.2020.01.29.07.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2020 07:22:29 -0800 (PST)
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
To:     Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra@vger.kernel.org
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
 <4b90efd2-5d0c-84df-961d-80cee288e0d4@nvidia.com>
 <586ea2b9-c204-2bd1-f8e2-875e0974e42d@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5a239652-0964-7234-21ab-00519c6c40f0@gmail.com>
Date:   Wed, 29 Jan 2020 18:22:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <586ea2b9-c204-2bd1-f8e2-875e0974e42d@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

29.01.2020 17:33, Jon Hunter пишет:
> 
> On 29/01/2020 10:49, Jon Hunter wrote:
>>
>> On 28/01/2020 12:13, Mark Brown wrote:
>>> I really don't understand why this is all taking so long, this thread
>>> just seems to be going round in interminable circles long after it
>>> looked like the issue was understood.  I have to admit I've not read
>>> every single message in the thread but it's difficult to see why it
>>> doesn't seem to be making any progress.
>>
>> Sorry about that. On reviewing this with the audio team at NVIDIA, I was
>> told we don't support S24_LE for I2S. The reason being that the crossbar
>> between the DMA and I2S is not able to extract the correct 24-bits from
>> the 32-bit sample to feed to the I2S interface. The Tegra documentation
>> does show support for 24-bits, but not state explicit support for S24_LE.
>>
>> Now Ben says that he has this working, but I am unable to reproduce
>> this, so before just dropping the S24_LE support, I would like to
>> understand how this is working for Ben in case there is something that
>> we have overlooked here.
> 
> Ah, I see that part of the problem is that patches 6 and 7 are yet to be
> applied and without these the audio is completely distorted because
> there is a mismatch in the data size between the APBIF and I2S
> controller. Applying these patches it is not distorted but now I am
> observing the clocking issue Ben reported and so the tone is not quite
> right.
> 
> Ben, I was able to workaround the clocking issue by making the I2S word
> clock 64 bits long and not 48.
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index bbf81b5aa723..3c9b4779e61b 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -143,7 +143,7 @@ static int tegra30_i2s_hw_params(struct
> snd_pcm_substream *substream,
>         case SNDRV_PCM_FORMAT_S24_LE:
>                 val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
>                 audio_bits = TEGRA30_AUDIOCIF_BITS_24;
> -               sample_size = 24;
> +               sample_size = 32;
>                 break;
>         case SNDRV_PCM_FORMAT_S32_LE:
>                 val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
> 
> For I2S I believe we only care about the edges of the word clock and so
> we make the overall period of the word clock 64 bit clocks then we no
> longer have an issue with the bit clock frequency. I assume that this
> should also be fine for TDM modes as well.
> 
> Can you let me know if this works for you?

cat /proc/asound/card0/pcm0p/sub0/hw_params

access: MMAP_INTERLEAVED
format: S24_LE
subformat: STD
channels: 2
rate: 48000 (48000/1)
period_size: 512
buffer_size: 4096

No distortion at all! Jon, thank you very much!

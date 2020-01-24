Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E79A41477A6
	for <lists+linux-tegra@lfdr.de>; Fri, 24 Jan 2020 05:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729545AbgAXEbj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 23 Jan 2020 23:31:39 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45810 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729017AbgAXEbi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Jan 2020 23:31:38 -0500
Received: by mail-lf1-f67.google.com with SMTP id 203so281196lfa.12
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jan 2020 20:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QFhUPyp2ZW+gx1b8GFNsdGdbU9UNpOwTbLh46EfrnmI=;
        b=epG+XVAkiD9oQ3lcwZLBgL6LLkaxgV0E6tON9yY/XoTfqOzpeL2xU7auI8wRTtjaq3
         WpylvbwvZAX4WO4RGhaDWU3jclnhwNBOpYur762jcX0iv82/M9quQES1r8ZeJF+rsYDz
         ZsY1w4jrsUKzpMPueYCTS3SXHpll1YLpEU6OV2AGw0bv1/fzW0Xnf7tm5y9zPj+1jEVr
         B4pC92PGqwn5GJ11H2xGSF6GBM/sJm2a+jU5hialozktG4ouvPhFM7c7qNgQ/BnGtSd/
         /nZRl1X2yjj4+ZHh7T/q85Ws4ig9eSd+UqP3PlRHVyqqfAjSP0ifvDu/ORijjm0IOPyy
         GRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QFhUPyp2ZW+gx1b8GFNsdGdbU9UNpOwTbLh46EfrnmI=;
        b=AKf8oQWwH9/tEtpQaZ/EdmKdeyWphPcqE4DOhZwZuoPcb0O6afmD8y83i1XGkxaoV9
         eBTNkZb3umHVaduiAWRmsPQADm8KyifqeRR62W7EtLqfmx2TSLK+xgXguFgWrYYPXybu
         xg1R4uW6QPdkP5klk2vKIYIWvNkzRdD86L6n7Oh0h9I3iq3n66CgDUZoa5mZrUYMGVAu
         UQ5+Mr2PL9LRXcihcwGJpWK2sKQD5T579TFw6eiTa7jPqsbNXmJxsihZHr4kNnsxrmd1
         DSP7J9aFVG2orAStmHFDhkTKE721Ymmmk19HfyF/rQvXG2LwcDoRntvEMOASOyKdNUic
         IZog==
X-Gm-Message-State: APjAAAVKqkpQG4gFkX8kPoTQyZlnouWNEaHxg2gBBYZMmBw/b1vqeKBA
        BT2Sqc8rUYtOyKoc95PlI5I=
X-Google-Smtp-Source: APXvYqwT8abn8Fp+QKQOj4+jB1AxghROOkbB5LFcdditta+/+kPJrUGZLN6SCGeomPVro2GcDO1xPg==
X-Received: by 2002:ac2:58ea:: with SMTP id v10mr508226lfo.202.1579840296366;
        Thu, 23 Jan 2020 20:31:36 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id i4sm2267498ljg.102.2020.01.23.20.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2020 20:31:35 -0800 (PST)
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
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
 <9b3a0cdd-34c7-ecb4-4a26-268fd4a63041@codethink.co.uk>
 <76a6a818-ab60-45eb-a85e-fa3090266d6f@gmail.com>
Message-ID: <20be0c65-1071-d24a-7e2d-1d30cbfec452@gmail.com>
Date:   Fri, 24 Jan 2020 07:31:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <76a6a818-ab60-45eb-a85e-fa3090266d6f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

24.01.2020 01:11, Dmitry Osipenko пишет:
> 24.01.2020 00:59, Ben Dooks пишет:
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
>>>>>>>> My preference is to remove the 24-bit support and keep the 32 bit
>>>>>>>> in.
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
>>>   sox -n -b 16 -c 2 -r 44100 /tmp/tmp.wav  synth sine 500 vol 0.5
>>>   sox -n -b 24 -c 2 -r 44100 /tmp/tmp.wav  synth sine 500 vol 0.5
>>>   sox -n -b 32 -c 2 -r 44100 /tmp/tmp.wav  synth sine 500 vol 0.5
>>>
>>> The 16 and 32 work fine, the 24 is showing a playback output freq
>>> of 440Hz instead of 500Hz... this suggests the clock is off, or there
>>> is something else weird going on...
>>>
>>
>> I should have checked pll_a_out0 rate, for 24bit 2ch, I get
>> pll_a_out at which makes:
>>
>> 11289600/(24*2*44100) = 5.3333333333
>>
>> For some reason the PLL can't get a decent divisor for this.
> 
> Have you tried to adjust the predefined PLLA rate? Please see
> tegra_clk_init_table in drivers/clk/tegra/clk-tegra30.c. Will be
> interesting if it works with that.
> 
> Sowjanya said that the PLLA rate setup is going to be moved to the audio
> driver [1], maybe that's what we already need for 24bit.
> 
> [1] https://lkml.org/lkml/2020/1/21/744

Actually, tegra_asoc_utils_set_rate() sets the PLLA rate, but the values
are hardcoded there.

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9827C148CA2
	for <lists+linux-tegra@lfdr.de>; Fri, 24 Jan 2020 18:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389796AbgAXRAL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 24 Jan 2020 12:00:11 -0500
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:36672 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389553AbgAXRAL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jan 2020 12:00:11 -0500
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1iv2JV-0005PN-Cz; Fri, 24 Jan 2020 17:00:09 +0000
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
To:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra@vger.kernel.org
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
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
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <318f0256-fe6d-c34d-4deb-74540fca8d0d@codethink.co.uk>
Date:   Fri, 24 Jan 2020 17:00:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24/01/2020 16:50, Jon Hunter wrote:
> 
> On 23/01/2020 19:38, Ben Dooks wrote:
>> On 07/01/2020 01:39, Dmitry Osipenko wrote:
>>> 06.01.2020 22:00, Ben Dooks пишет:
>>>> On 05/01/2020 10:53, Ben Dooks wrote:
>>>>>
>>>>>
>>>>> On 2020-01-05 01:48, Dmitry Osipenko wrote:
>>>>>> 05.01.2020 03:04, Ben Dooks пишет:
>>>>>>> [snip]
>>>>>>>
>>>>>>> I've just gone through testing.
>>>>>>>
>>>>>>> Some simple data tests show 16 and 32-bits work.
>>>>>>>
>>>>>>> The 24 bit case seems to be weird, it looks like the 24-bit expects
>>>>>>> 24 bit samples in 32 bit words. I can't see any packing options to
>>>>>>> do 24 bit in 24 bit, so we may have to remove 24 bit sample support
>>>>>>> (which is a shame)
>>>>>>>
>>>>>>> My preference is to remove the 24-bit support and keep the 32 bit in.
>>>>>>>
>>>>>>
>>>>>> Interesting.. Jon, could you please confirm that 24bit format isn't
>>>>>> usable on T30?
>>>>>
>>>>> If there is an option of 24 packed into 32, then I think that would
>>>>> work.
>>>>>
>>>>> I can try testing that with raw data on Monday.
>>>>
>>>> I need to check some things, I assumed 24 was 24 packed bits, it looks
>>>> like the default is 24 in 32 bits so we may be ok. However I need to
>>>> re-write my test case which assumed it was 24bits in 3 bytes (S24_3LE).
>>>>
>>>> I'll follow up later,
>>>
>>> Okay, the S24_3LE isn't supported by RT5640 codec in my case. I briefly
>>> looked through the TRM doc and got impression that AHUB could re-pack
>>> data stream into something that codec supports, but maybe it's a wrong
>>> impression.
>>> _________________________________
>>
>> I did a quick test with the following:
>>
>>   sox -n -b 16 -c 2 -r 44100 /tmp/tmp.wav  synth sine 500 vol 0.5
>>   sox -n -b 24 -c 2 -r 44100 /tmp/tmp.wav  synth sine 500 vol 0.5
>>   sox -n -b 32 -c 2 -r 44100 /tmp/tmp.wav  synth sine 500 vol 0.5
>>
>> The 16 and 32 work fine, the 24 is showing a playback output freq
>> of 440Hz instead of 500Hz... this suggests the clock is off, or there
>> is something else weird going on...
> 
> I was looking at using sox to create such as file, but the above command
> generates a S24_3LE file and not S24_LE file. The codec on Jetson-TK1
> supports S24_LE but does not support S24_3LE and so I cannot test this.
> Anyway, we really need to test S24_LE and not S24_3LE because this is
> the problem that Dmitry is having.
> 
> Ben is S24_3LE what you really need to support?

No, it is S24_LE the format this hardware supports. I wonder if
aplay is transforming it.

Plug PCM: Linear conversion PCM (S24_LE)
Its setup is:
   stream       : PLAYBACK
   access       : RW_INTERLEAVED
   format       : S24_3LE
   subformat    : STD
   channels     : 2

So I assume aplay has turned the S24_3LE -> S24_LE



-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

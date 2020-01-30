Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 732EE14D851
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Jan 2020 10:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgA3Jjg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 30 Jan 2020 04:39:36 -0500
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:40286 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726913AbgA3Jjg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Jan 2020 04:39:36 -0500
Received: from [167.98.27.226] (helo=[172.16.102.1])
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1ix6IQ-00044D-6k; Thu, 30 Jan 2020 09:39:34 +0000
Subject: Re: [alsa-devel] (no subject)
To:     Clemens Ladisch <clemens@ladisch.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>
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
 <047c8caa-e715-5295-9794-67ff3e10cea2@gmail.com>
 <70f344bf-f991-606c-55ab-bdadea27d233@nvidia.com>
 <2ff97414-f0a5-7224-0e53-6cad2ed0ccd2@gmail.com>
 <35667c85-67b5-6f6f-ffe8-4fe3455ea4bb@codethink.co.uk>
 <96ed04cb-24ab-7e4d-bd44-6a4bb7c046ac@ladisch.de>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <8161fc88-fa8c-ec92-cc14-1caa5c6f2fe7@codethink.co.uk>
Date:   Thu, 30 Jan 2020 09:39:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <96ed04cb-24ab-7e4d-bd44-6a4bb7c046ac@ladisch.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 30/01/2020 09:31, Clemens Ladisch wrote:
> Ben Dooks wrote:
>> On 29/01/2020 00:17, Dmitry Osipenko wrote:
>>> 28.01.2020 21:19, Jon Hunter пишет:
>>>> On 28/01/2020 17:42, Dmitry Osipenko wrote:
>>>>> 28.01.2020 15:13, Mark Brown пишет:
>>>>>> On Mon, Jan 27, 2020 at 10:20:25PM +0300, Dmitry Osipenko wrote:
>>>>>>> 24.01.2020 19:50, Jon Hunter пишет:
>>>>>>
>>>>>>>>                   .rates = SNDRV_PCM_RATE_8000_96000,
>>>>>>>>                   .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>>>>>>> -                          SNDRV_PCM_FMTBIT_S24_LE |
>>>>>>>> +                          SNDRV_PCM_FMTBIT_S24_3LE |
>>>>>>
>>>>>>> It should solve the problem in my particular case, but I'm not sure that
>>>>>>> the solution is correct.
>>>>>>
>>>>>> If the format implemented by the driver is S24_3LE the driver should
>>>>>> advertise S24_3LE.
>>>>>
>>>>> It should be S24_LE, but seems we still don't know for sure.
>>>>
>>>> Why?
>>> /I think/ sound should be much more distorted if it was S24_3LE, but
>>> maybe I'm wrong.
>>
>> S24_3LE is IICC the wrong thing and we can't support it on the tegra3
> 
> There are three ways of arranging 24-bit samples in memory:
> 
> S24_3LE: 24-bit samples in 24-bit words without padding
> S24_LE:  24-bit samples in 32-bit words, aligned to the LSB
> S32_LE:  24-bit samples in 32-bit words, aligned to the MSB
> 
> It is very unlikely that your hardware implements S24_LE.

Which is wrong, since this is exactly what the hardware implements.

The DMA fetches 32 bit words, and then the front end dispatches only
24 bits of these to the I2S/TDM

> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

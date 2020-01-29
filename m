Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5891214CFE1
	for <lists+linux-tegra@lfdr.de>; Wed, 29 Jan 2020 18:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbgA2RwZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 29 Jan 2020 12:52:25 -0500
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:53444 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726733AbgA2RwZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Jan 2020 12:52:25 -0500
Received: from [167.98.27.226] (helo=[172.16.102.1])
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1iwrVm-00040q-HW; Wed, 29 Jan 2020 17:52:22 +0000
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
To:     Mark Brown <broonie@kernel.org>, Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
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
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <f225524b-91a4-e87d-6834-1b776de774c1@codethink.co.uk>
Date:   Wed, 29 Jan 2020 17:52:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200128121315.GD4689@sirena.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 28/01/2020 12:13, Mark Brown wrote:
> On Mon, Jan 27, 2020 at 10:20:25PM +0300, Dmitry Osipenko wrote:
>> 24.01.2020 19:50, Jon Hunter пишет:
> 
>>>                  .rates = SNDRV_PCM_RATE_8000_96000,
>>>                  .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>> -                          SNDRV_PCM_FMTBIT_S24_LE |
>>> +                          SNDRV_PCM_FMTBIT_S24_3LE |
> 
>> It should solve the problem in my particular case, but I'm not sure that
>> the solution is correct.
> 
> If the format implemented by the driver is S24_3LE the driver should
> advertise S24_3LE.

I am fairly sure the format is S24_LE, the tegra3 hardware only
supports 24bits padded to 32 bits.

>> The v5.5 kernel is released now with the broken audio and apparently
>> getting 24bit to work won't be trivial (if possible at all). Ben, could
>> you please send a patch to fix v5.5 by removing the S24 support
>> advertisement from the driver?
> 
> Why is that the best fix rather than just advertising the format
> implemented by the driver?
> 
> I really don't understand why this is all taking so long, this thread
> just seems to be going round in interminable circles long after it
> looked like the issue was understood.  I have to admit I've not read
> every single message in the thread but it's difficult to see why it
> doesn't seem to be making any progress.
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

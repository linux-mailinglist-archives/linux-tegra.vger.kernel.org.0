Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58BB313076A
	for <lists+linux-tegra@lfdr.de>; Sun,  5 Jan 2020 11:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgAEKyB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 5 Jan 2020 05:54:01 -0500
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:42886 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725897AbgAEKyB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 5 Jan 2020 05:54:01 -0500
Received: from [78.40.148.177] (helo=localhost)
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1io3Xg-0007jP-TJ; Sun, 05 Jan 2020 10:53:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Sun, 05 Jan 2020 10:53:56 +0000
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit samples
In-Reply-To: <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
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
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
User-Agent: Roundcube Webmail/1.4.2
Message-ID: <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 2020-01-05 01:48, Dmitry Osipenko wrote:
> 05.01.2020 03:04, Ben Dooks пишет:
>> [snip]
>> 
>> I've just gone through testing.
>> 
>> Some simple data tests show 16 and 32-bits work.
>> 
>> The 24 bit case seems to be weird, it looks like the 24-bit expects
>> 24 bit samples in 32 bit words. I can't see any packing options to
>> do 24 bit in 24 bit, so we may have to remove 24 bit sample support
>> (which is a shame)
>> 
>> My preference is to remove the 24-bit support and keep the 32 bit in.
>> 
> 
> Interesting.. Jon, could you please confirm that 24bit format isn't
> usable on T30?

If there is an option of 24 packed into 32, then I think that would 
work.

I can try testing that with raw data on Monday.

-- 
Ben


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDC7C148CAF
	for <lists+linux-tegra@lfdr.de>; Fri, 24 Jan 2020 18:03:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387868AbgAXRDK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 24 Jan 2020 12:03:10 -0500
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:37112 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387710AbgAXRDK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jan 2020 12:03:10 -0500
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1iv2MO-0005ZJ-K0; Fri, 24 Jan 2020 17:03:08 +0000
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
To:     Mark Brown <broonie@kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
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
 <9b3a0cdd-34c7-ecb4-4a26-268fd4a63041@codethink.co.uk>
 <26aeb591-e770-5e6a-5ee4-05414ae4ddc6@nvidia.com>
 <20200124170059.GB4918@sirena.org.uk>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <666737c3-69c8-3bd1-e7d3-5c845fe09e60@codethink.co.uk>
Date:   Fri, 24 Jan 2020 17:03:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200124170059.GB4918@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24/01/2020 17:00, Mark Brown wrote:
> On Fri, Jan 24, 2020 at 04:56:41PM +0000, Jon Hunter wrote:
> 
>> Yes that is going to be a problem. I assume that your codec wants a
>> 256*fs MCLK? Maybe in that case you are better off having the codec
>> drive the bit clock and fsync?

Would be lovely, but tegra i2s clock slave is still on the list
of things I have to get into the kernel (it doesn't work and no-one
in the kernel currently uses it...)

>> Is 24-bit critical to what you are doing?
> 
>> Otherwise maybe we should drop the 24-bit support for now and just keep
>> 32-bit.
> 
> Removing the support because one particular board has limited clocks
> isn't good - it'd be better to have components with clocking
> restrictions impose constraints as needed.
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

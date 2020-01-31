Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B990C14EB7B
	for <lists+linux-tegra@lfdr.de>; Fri, 31 Jan 2020 12:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbgAaLMV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 31 Jan 2020 06:12:21 -0500
Received: from webclient5.webclient5.de ([136.243.32.184]:37695 "EHLO
        webclient5.webclient5.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728268AbgAaLMU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 Jan 2020 06:12:20 -0500
X-Greylist: delayed 506 seconds by postgrey-1.27 at vger.kernel.org; Fri, 31 Jan 2020 06:12:20 EST
Received: from aquila.ladisch.de (unknown [46.114.33.10])
        by webclient5.webclient5.de (Postfix) with ESMTPSA id 890ED5786012;
        Fri, 31 Jan 2020 12:03:49 +0100 (CET)
Subject: Re: [alsa-devel] (no subject)
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
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
 <047c8caa-e715-5295-9794-67ff3e10cea2@gmail.com>
 <70f344bf-f991-606c-55ab-bdadea27d233@nvidia.com>
 <2ff97414-f0a5-7224-0e53-6cad2ed0ccd2@gmail.com>
 <35667c85-67b5-6f6f-ffe8-4fe3455ea4bb@codethink.co.uk>
 <96ed04cb-24ab-7e4d-bd44-6a4bb7c046ac@ladisch.de>
 <8161fc88-fa8c-ec92-cc14-1caa5c6f2fe7@codethink.co.uk>
 <182fd434-f15a-f049-1ba1-83bd864b4590@ladisch.de>
 <6ceb0c37867dd9ec9c5285e4470d462b@codethink.co.uk>
From:   Clemens Ladisch <clemens@ladisch.de>
Message-ID: <dbd01efe-bada-5b20-2c5e-ccd0e8f2f5ad@ladisch.de>
Date:   Fri, 31 Jan 2020 12:03:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <6ceb0c37867dd9ec9c5285e4470d462b@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.101.4 at webclient5
X-Virus-Status: Clean
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Ben Dooks wrote:
> On 2020-01-30 14:58, Clemens Ladisch wrote:
>> Ben Dooks wrote:
>>> On 30/01/2020 09:31, Clemens Ladisch wrote:
>>>> S24_LE:  24-bit samples in 32-bit words, aligned to the LSB
>>>> S32_LE:  24-bit samples in 32-bit words, aligned to the MSB
>>>>
>>>> It is very unlikely that your hardware implements S24_LE.
>>>
>>> Which is wrong, since this is exactly what the hardware implements.
>>>
>>> The DMA fetches 32 bit words, and then the front end dispatches only
>>> 24 bits of these to the I2S/TDM
>>
>> Which 24 bits?  Is the padding in the first byte (S32_LE) or in the
>> last byte (S24_LE)?
>
> I think the low 24 bits are sent from the 32 bit word.

This would indeed by S24_LE.  If you change the driver to say that it
supports _only_ S24_LE, is the data then played correctly?


Regards,
Clemens

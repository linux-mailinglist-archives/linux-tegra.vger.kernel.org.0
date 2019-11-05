Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1CD8EFCC5
	for <lists+linux-tegra@lfdr.de>; Tue,  5 Nov 2019 12:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730821AbfKEL6S (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 5 Nov 2019 06:58:18 -0500
Received: from imap1.codethink.co.uk ([176.9.8.82]:45884 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbfKEL6S (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Nov 2019 06:58:18 -0500
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iRxTL-0003s9-I6; Tue, 05 Nov 2019 11:58:07 +0000
Subject: Re: [PATCH v4 3/7] ASoC: tegra: i2s: Add support for more than 2
 channels
To:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>
References: <20191007153136.4920-1-ben.dooks@codethink.co.uk>
 <20191007153136.4920-4-ben.dooks@codethink.co.uk>
 <cfd308bd-290a-f72f-6876-d94151c09843@gmail.com>
 <16910e8d-4745-4e55-0436-9b3200876037@codethink.co.uk>
 <1e43701b-3627-ba6d-ee19-020e25af3ef1@gmail.com>
 <d03a8fa0-3c62-1e32-9ca6-06d1996da11b@nvidia.com>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <5d069991-f5c3-ae14-da9c-9b20555be4f6@codethink.co.uk>
Date:   Tue, 5 Nov 2019 11:58:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d03a8fa0-3c62-1e32-9ca6-06d1996da11b@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24/10/2019 17:11, Jon Hunter wrote:
> 
> On 17/10/2019 18:38, Dmitry Osipenko wrote:
>> 17.10.2019 19:23, Ben Dooks пишет:
>>> On 08/10/2019 16:29, Dmitry Osipenko wrote:
>>>> Hello Ben,
>> Take a look here for example:
>>
>> https://nv-tegra.nvidia.com/gitweb/?p=linux-3.10.git;a=commit;h=49834eef9d51a6eff950e0f52ddc5343d960652e
> 
> That version of the driver is known to be buggy/incorrect. I don't think
> we want to do that. We want to set the polarity based upon the format
> passed and not the mode ...
> 
> https://nv-tegra.nvidia.com/gitweb/?p=linux-nvidia.git;a=blob;f=sound/soc/tegra-alt/tegra210_i2s_alt.c;h=24cf3b55326f687aded22b91182df41c5ae188ac;hb=703aa948d2c92b87fd84f367f43a07778ed098b5#l333

Ok, thanks.

PS the security certificate on that site is still invalid :/


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

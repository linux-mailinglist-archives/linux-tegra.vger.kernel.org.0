Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1C77B6244
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 13:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfIRLbA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Sep 2019 07:31:00 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:36287 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbfIRLbA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Sep 2019 07:31:00 -0400
Received: from [78.40.148.177] (helo=localhost)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iAYAj-0000Uz-Rb; Wed, 18 Sep 2019 12:30:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 18 Sep 2019 12:30:57 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@lists.codethink.co.uk
Subject: Re: [PATCH 6/8] ASoC: tegra: set i2s_offset to 0 for tdm
In-Reply-To: <d79b8148-797b-08b2-09e7-71c11d9acd53@nvidia.com>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-7-ben.dooks@codethink.co.uk>
 <d79b8148-797b-08b2-09e7-71c11d9acd53@nvidia.com>
Message-ID: <75547a2534804b5992ba1bd3984c96a8@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
User-Agent: Roundcube Webmail/1.3.10
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 2019-09-18 10:02, Jon Hunter wrote:
> On 17/09/2019 19:12, Ben Dooks wrote:
>> Set the offset to 0 for TDM mode, as per the current setup.
>> 
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>  sound/soc/tegra/tegra30_i2s.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>> 
>> diff --git a/sound/soc/tegra/tegra30_i2s.c 
>> b/sound/soc/tegra/tegra30_i2s.c
>> index d75ce12fe177..3efef87ed8d8 100644
>> --- a/sound/soc/tegra/tegra30_i2s.c
>> +++ b/sound/soc/tegra/tegra30_i2s.c
>> @@ -206,8 +206,11 @@ static int tegra30_i2s_hw_params(struct 
>> snd_pcm_substream *substream,
>> 
>>  	i2s->soc_data->set_audio_cif(i2s->regmap, reg, &cif_conf);
>> 
>> -	val = (1 << TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_SHIFT) |
>> -	      (1 << TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_SHIFT);
>> +	if (i2s->is_tdm)
>> +		val = 0;
>> +	else
>> +		val = (1 << TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_SHIFT) |
>> +		      (1 << TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_SHIFT);
>>  	regmap_write(i2s->regmap, TEGRA30_I2S_OFFSET, val);
>> 
>>  	return 0;
> 
> Please move this code into tegra30_i2s_set_fmt() as it only needs to be
> set once.
> 
> BTW, if you refer to the following I2S driver for Tegra210, you will 
> see
> how I think that we should handle this ...

Ok, thanks.

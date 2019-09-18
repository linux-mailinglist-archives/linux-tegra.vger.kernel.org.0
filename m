Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8B66B612D
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 12:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729669AbfIRKMc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Sep 2019 06:12:32 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:60962 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729523AbfIRKMb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Sep 2019 06:12:31 -0400
Received: from [78.40.148.177] (helo=localhost)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iAWwn-0005w1-H4; Wed, 18 Sep 2019 11:12:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 18 Sep 2019 11:12:28 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra-owner@vger.kernel.org
Subject: Re: [PATCH 3/8] ASoC: tegra: i2s: Add support for more than 2
 channels
In-Reply-To: <b8ccfbd1-3c0f-3cba-40da-a9b0ced54e86@nvidia.com>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-4-ben.dooks@codethink.co.uk>
 <b8ccfbd1-3c0f-3cba-40da-a9b0ced54e86@nvidia.com>
Message-ID: <f7f01665b51a3758dcaf1c82f44a86d9@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
User-Agent: Roundcube Webmail/1.3.10
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 2019-09-18 09:50, Jon Hunter wrote:
> On 17/09/2019 19:12, Ben Dooks wrote:
>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>> 
>> The CIF configuration and clock setting is currently hard coded for 2
>> channels. Since the hardware is capable of supporting 1-8 channels add
>> support for reading the channel count from the supplied parameters to
>> allow for better TDM support. It seems the original implementation of 
>> this
>> driver was fixed at 2 channels for simplicity, and not implementing 
>> TDM.
>> 
>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>> [ben.dooks@codethink.co.uk: added is_tdm and channel nr check]
>> ---
>>  sound/soc/tegra/tegra30_i2s.c | 21 +++++++++++++--------
>>  sound/soc/tegra/tegra30_i2s.h |  1 +
>>  2 files changed, 14 insertions(+), 8 deletions(-)
>> 
>> diff --git a/sound/soc/tegra/tegra30_i2s.c 
>> b/sound/soc/tegra/tegra30_i2s.c
>> index b5372839f672..40bcc05a9dbb 100644
>> --- a/sound/soc/tegra/tegra30_i2s.c
>> +++ b/sound/soc/tegra/tegra30_i2s.c
>> @@ -86,14 +86,17 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai 
>> *dai,
>>  		return -EINVAL;
>>  	}
>> 
>> +	i2s->is_tdm = false;
>>  	mask |= TEGRA30_I2S_CTRL_FRAME_FORMAT_MASK |
>>  		TEGRA30_I2S_CTRL_LRCK_MASK;
>>  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>>  	case SND_SOC_DAIFMT_DSP_A:
>> +		i2s->is_tdm = true;
>>  		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>>  		val |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
>>  		break;
>>  	case SND_SOC_DAIFMT_DSP_B:
>> +		i2s->is_tdm = true;
>>  		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>>  		val |= TEGRA30_I2S_CTRL_LRCK_R_LOW;
>>  		break;
>> @@ -127,10 +130,13 @@ static int tegra30_i2s_hw_params(struct 
>> snd_pcm_substream *substream,
>>  	struct device *dev = dai->dev;
>>  	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>>  	unsigned int mask, val, reg;
>> -	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
>> +	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits, channels;
>>  	struct tegra30_ahub_cif_conf cif_conf;
>> 
>> -	if (params_channels(params) != 2)
>> +	channels = params_channels(params);
>> +	if (channels > 8)
>> +		return -EINVAL;
>> +	if (channels != 2 && !i2s->is_tdm)
> 
> I don't think that this additional test is really necessary. I would
> just drop this 'is_tdm' variable.

I needed it elsewhere so would prefer to leave this here.

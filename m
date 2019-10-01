Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41D78C3203
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Oct 2019 13:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbfJALK1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 07:10:27 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:48998 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbfJALK1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 07:10:27 -0400
Received: from [167.98.27.226] (helo=[10.35.6.110])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iFG2S-0007Mo-R5; Tue, 01 Oct 2019 12:09:52 +0100
Subject: Re: [PATCH v3 5/7] ASoC: tegra: set i2s_offset to 0 for tdm
To:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-kernel@lists.codethink.co.uk
References: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
 <20190930165130.10642-6-ben.dooks@codethink.co.uk>
 <6d6ae684-dd5f-b180-9114-dafe12886d4f@nvidia.com>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <54bde532-2276-aa4e-6206-7757b482c6fa@codethink.co.uk>
Date:   Tue, 1 Oct 2019 12:09:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6d6ae684-dd5f-b180-9114-dafe12886d4f@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 30/09/2019 21:52, Jon Hunter wrote:
> 
> 
> On 30/09/2019 17:51, Ben Dooks wrote:
>> Set the offset to 0 for TDM mode, as per the current setup. Note we also
>> move the data offset programming to the i2s hw_parameters call as per
>> the suggestion from Jon Hunter.
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>> v2:
>>   - fix the review comments and move the i2s offset setting
>> ---
>>   sound/soc/tegra/tegra30_i2s.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
>> index c573151da341..a03692b0afc3 100644
>> --- a/sound/soc/tegra/tegra30_i2s.c
>> +++ b/sound/soc/tegra/tegra30_i2s.c
>> @@ -66,7 +66,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>>   				unsigned int fmt)
>>   {
>>   	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>> -	unsigned int mask = 0, val = 0;
>> +	unsigned int mask = 0, val = 0, data_offset = 1;
>>   	unsigned int ch_mask, ch_val = 0;
>>   
>>   	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
>> @@ -95,11 +95,13 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>>   		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;
>>   		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>>   		val |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
>> +		data_offset = 0;
>>   		break;
>>   	case SND_SOC_DAIFMT_DSP_B:
>>   		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;
>>   		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>>   		val |= TEGRA30_I2S_CTRL_LRCK_R_LOW;
>> +		data_offset = 0;
> 
> My understanding is that the difference between dsp-a and dsp-b is that
> dsp-a has an offset of 1 and dsp-b has an offset of 0.

Ok, can anyone else check this before I make the change for DSP_B ?


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

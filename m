Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC019DB241
	for <lists+linux-tegra@lfdr.de>; Thu, 17 Oct 2019 18:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731834AbfJQQX7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 17 Oct 2019 12:23:59 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:35537 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730209AbfJQQX7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Oct 2019 12:23:59 -0400
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iL8Yy-0004Hd-Sv; Thu, 17 Oct 2019 17:23:44 +0100
Subject: Re: [PATCH v4 3/7] ASoC: tegra: i2s: Add support for more than 2
 channels
To:     Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>
References: <20191007153136.4920-1-ben.dooks@codethink.co.uk>
 <20191007153136.4920-4-ben.dooks@codethink.co.uk>
 <cfd308bd-290a-f72f-6876-d94151c09843@gmail.com>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <16910e8d-4745-4e55-0436-9b3200876037@codethink.co.uk>
Date:   Thu, 17 Oct 2019 17:23:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cfd308bd-290a-f72f-6876-d94151c09843@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 08/10/2019 16:29, Dmitry Osipenko wrote:
> Hello Ben,
> 
> 07.10.2019 18:31, Ben Dooks пишет:
>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>>
>> The CIF configuration and clock setting is currently hard coded for 2
>> channels. Since the hardware is capable of supporting 1-8 channels add
>> support for reading the channel count from the supplied parameters to
>> allow for better TDM support. It seems the original implementation of this
>> driver was fixed at 2 channels for simplicity, and not implementing TDM.
>>
>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>> [ben.dooks@codethink.co.uk: added is_tdm and channel nr check]
>> [ben.dooks@codethink.co.uk: merge edge control into set-format]
>> [ben.dooks@codethink.co.uk: removed is_tdm and moved edge to hw_params]
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   sound/soc/tegra/tegra30_i2s.c | 21 +++++++++++++--------
>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
>> index 063f34c882af..7382f7949bf4 100644
>> --- a/sound/soc/tegra/tegra30_i2s.c
>> +++ b/sound/soc/tegra/tegra30_i2s.c
>> @@ -67,6 +67,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>>   {
>>   	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>>   	unsigned int mask = 0, val = 0;
>> +	unsigned int ch_mask, ch_val = 0;
>>   
>>   	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
>>   	case SND_SOC_DAIFMT_NB_NF:
>> @@ -75,6 +76,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>>   		return -EINVAL;
>>   	}
>>   
>> +	ch_mask = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_MASK;
>>   	mask |= TEGRA30_I2S_CTRL_MASTER_ENABLE;
>>   	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
>>   	case SND_SOC_DAIFMT_CBS_CFS:
>> @@ -90,10 +92,12 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>>   		TEGRA30_I2S_CTRL_LRCK_MASK;
>>   	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>>   	case SND_SOC_DAIFMT_DSP_A:
>> +		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;
>>   		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>>   		val |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
>>   		break;
>>   	case SND_SOC_DAIFMT_DSP_B:
>> +		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;
> 
> Downstream code sets DSP_B to POS_EDGE, looks like you have a typo here.
> Or does DSP_B happen to work with the NEG_EDGE?

ok, will change, we've only been using SND_SOC_DAIFMT_DSP_A

For reference, is there a git repo with this version of tegra tdm support?


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

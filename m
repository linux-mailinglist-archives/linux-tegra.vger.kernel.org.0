Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0B67C366F
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Oct 2019 15:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388767AbfJAN4c (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 09:56:32 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:52752 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388872AbfJAN4c (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 09:56:32 -0400
Received: from [167.98.27.226] (helo=[10.35.6.110])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iFIdY-00037r-Lo; Tue, 01 Oct 2019 14:56:20 +0100
Subject: Re: [PATCH v3 1/7] ASoC: tegra: add a TDM configuration callback
To:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>
References: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
 <20190930165130.10642-2-ben.dooks@codethink.co.uk>
 <1488a5a8-5c55-5643-1956-0cd9d9c90644@nvidia.com>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <49cfe40c-039e-bcb1-08a3-510f81000e7d@codethink.co.uk>
Date:   Tue, 1 Oct 2019 14:56:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1488a5a8-5c55-5643-1956-0cd9d9c90644@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 01/10/2019 14:40, Jon Hunter wrote:
> 
> On 30/09/2019 17:51, Ben Dooks wrote:
>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>>
>> Add a callback to configure TDM settings for the Tegra30 I2S ASoC 'platform'
>> driver.
>>
>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>> [ben.dooks@codethink.co.uk: merge fix for power management]
>> [ben.dooks@codethink.co.uk: add review change for fsync of 1 clock]
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   sound/soc/tegra/tegra30_i2s.c | 33 +++++++++++++++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
>> index ac6983c6bd72..7f9ef6abeae2 100644
>> --- a/sound/soc/tegra/tegra30_i2s.c
>> +++ b/sound/soc/tegra/tegra30_i2s.c
>> @@ -254,6 +254,38 @@ static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
>>   	return 0;
>>   }
>>   
>> +/*
>> + * Set up TDM
>> + */
>> +static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
>> +			       unsigned int tx_mask, unsigned int rx_mask,
>> +			       int slots, int slot_width)
>> +{
>> +	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>> +	unsigned int mask, val;
>> +
>> +	dev_dbg(dai->dev, "%s: txmask=0x%08x rxmask=0x%08x slots=%d width=%d\n",
>> +		 __func__, tx_mask, rx_mask, slots, slot_width);
>> +
>> +	/* Set up slots and tx/rx masks */
>> +	mask = TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK |
>> +	       TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK |
>> +	       TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_MASK;
>> +
>> +	val = (tx_mask << TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_SHIFT) |
>> +	      (rx_mask << TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT) |
>> +	      ((slots - 1) << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT);
>> +
>> +	pm_runtime_get_sync(dai->dev);
>> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
>> +	// set the fsync width to minimum of 1 clock width
> 
> Please make sure you are consistent with your commenting style and you
> adhere to the kernel coding style.
> 
> Also, I see a lot of ...
> 
> ERROR: trailing whitespace
> #197: FILE: sound/soc/tegra/tegra30_i2s.c:258:
> + * Set up TDM^M$
> 
> ERROR: DOS line endings
> #198: FILE: sound/soc/tegra/tegra30_i2s.c:259:
> + */^M$

I'll go and check that later.
I did assume my colleagues had done the relevant checks themselves...


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

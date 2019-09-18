Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62B9DB611C
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 12:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728649AbfIRKLH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Sep 2019 06:11:07 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:60862 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbfIRKLH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Sep 2019 06:11:07 -0400
Received: from [78.40.148.177] (helo=localhost)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iAWvP-0005qm-SX; Wed, 18 Sep 2019 11:11:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 18 Sep 2019 11:11:03 +0100
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
Subject: Re: [PATCH 1/8] ASoC: tegra: Add a TDM configuration callback
In-Reply-To: <7b21823a-86e8-d3de-10b5-e047a5e025ef@nvidia.com>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-2-ben.dooks@codethink.co.uk>
 <7b21823a-86e8-d3de-10b5-e047a5e025ef@nvidia.com>
Message-ID: <72705cbf3b70934bdf8e7a6116f420b5@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
User-Agent: Roundcube Webmail/1.3.10
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 2019-09-18 09:42, Jon Hunter wrote:
> On 17/09/2019 19:12, Ben Dooks wrote:
>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>> 
>> Add a callback to configure TDM settings for the Tegra30 I2S ASoC 
>> 'platform'
>> driver.
>> 
>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>> ---
>>  sound/soc/tegra/tegra30_i2s.c | 34 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>> 
>> diff --git a/sound/soc/tegra/tegra30_i2s.c 
>> b/sound/soc/tegra/tegra30_i2s.c
>> index ac6983c6bd72..d36b4662b420 100644
>> --- a/sound/soc/tegra/tegra30_i2s.c
>> +++ b/sound/soc/tegra/tegra30_i2s.c
>> @@ -254,6 +254,39 @@ static int tegra30_i2s_trigger(struct 
>> snd_pcm_substream *substream, int cmd,
>>  	return 0;
>>  }
>> 
>> +/*
>> + * Set up TDM
>> + */
>> +static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
>> +			       unsigned int tx_mask, unsigned int rx_mask,
>> +			       int slots, int slot_width)
>> +{
>> +	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>> +	unsigned int mask = 0, val = 0;
>> +
>> +	dev_info(dai->dev, "%s: setting TDM: tx_mask: 0x%08x rx_mask: 0x%08x 
>> "
> 
> dev_dbg() please. Also I don't think it is necessary to print both the
> function name and 'setting TDM', the function name should be 
> sufficient.

Yes, already sorted from previous review.

>> +		 "slots: 0x%08x " "width: %d\n",
> 
> Why are there extra quotes here?

No idea, I'll remove these later.

>> +		 __func__, tx_mask, rx_mask, slots, slot_width)> +
>> +	/* Set up slots and tx/rx masks */
>> +	mask = TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK |
>> +	       TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK |
>> +	       TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_MASK;
>> +
>> +	val = (tx_mask << TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_SHIFT) |
>> +	      (rx_mask << TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT) |
>> +	      ((slots - 1) << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT);
>> +
>> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
>> +
>> +	/* Set FSYNC width */
>> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL,
>> +		TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK,
>> +		(slot_width - 1) << TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT);
> 
> What happens if there is only one slot? The fsync will be the width of
> the slot. Typically, TDM is used with DSP-A/B formats and although the
> driver does not appear to program the fsync width, it probably should
> during the tegra30_i2s_set_fmt() depending on the format used rather
> than here.

Hmm, should we check.

The work was done to keep as close to the original client's 2.6 kernel
as possible which set the fsync field to a whole data word. We could try
and just set this to say 2 here and have a much shorter frame-sync 
pulse.

I'll add a check for slots < 2 and set the fsync width to 2.

Thanks for the review.


> 
> Cheers
> Jon

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C44B2B625D
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 13:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfIRLlr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Sep 2019 07:41:47 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:36825 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfIRLlq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Sep 2019 07:41:46 -0400
Received: from [78.40.148.177] (helo=localhost)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iAYLA-0000uG-Pp; Wed, 18 Sep 2019 12:41:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 18 Sep 2019 12:41:44 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@lists.codethink.co.uk,
        Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 7/8] ASoC: tegra: config fifos on hw_param changes
In-Reply-To: <1956fa67-c654-f719-5c7c-5e4b40d01e3a@nvidia.com>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-8-ben.dooks@codethink.co.uk>
 <1956fa67-c654-f719-5c7c-5e4b40d01e3a@nvidia.com>
Message-ID: <34bd42ccaf388c196d9b7e188c218dae@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
User-Agent: Roundcube Webmail/1.3.10
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 2019-09-18 10:14, Jon Hunter wrote:
> On 17/09/2019 19:12, Ben Dooks wrote:
>> If the hw_params uses a different bit or channel count, then we
>> need to change both the I2S unit's CIF configuration as well as
>> the APBIF one.
>> 
>> To allow changing the APBIF, add a call to reconfigure the RX or
>> TX FIFO without changing the DMA or allocation, and get the I2S
>> driver to call it once the hw params have been calculate.
>> 
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>  sound/soc/tegra/tegra30_ahub.c | 114 
>> ++++++++++++++++++---------------
>>  sound/soc/tegra/tegra30_ahub.h |   5 ++
>>  sound/soc/tegra/tegra30_i2s.c  |   2 +
>>  3 files changed, 69 insertions(+), 52 deletions(-)
>> 
>> diff --git a/sound/soc/tegra/tegra30_ahub.c 
>> b/sound/soc/tegra/tegra30_ahub.c
>> index 952381260dc3..58e05ceb86da 100644
>> --- a/sound/soc/tegra/tegra30_ahub.c
>> +++ b/sound/soc/tegra/tegra30_ahub.c
>> @@ -84,12 +84,40 @@ static int tegra30_ahub_runtime_resume(struct 
>> device *dev)
>>  	return 0;
>>  }
>> 
>> +int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif rxcif,
>> +			       struct tegra30_ahub_cif_conf *cif_conf)
>> +{
>> +	int channel = rxcif - TEGRA30_AHUB_RXCIF_APBIF_RX0;
>> +	u32 reg, val;
>> +
>> +	pm_runtime_get_sync(ahub->dev);
>> +
>> +	reg = TEGRA30_AHUB_CHANNEL_CTRL +
>> +	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
>> +	val = tegra30_apbif_read(reg);
>> +	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
>> +		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
>> +	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
>> +	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
>> +	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
>> +	tegra30_apbif_write(reg, val);
> 
> Aren't you just programming the same value to the APBIF here that was
> previously programmed by the allocate function? I don't see the point 
> in
> moving this? What am I missing here?

IIRC, this was due to trying different types of playback with a 4ch 
32bit
sound output. The ahub and the i2s unit don't have to agreet.


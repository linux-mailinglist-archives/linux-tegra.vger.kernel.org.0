Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A71DBC4CD
	for <lists+linux-tegra@lfdr.de>; Tue, 24 Sep 2019 11:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504189AbfIXJ1H (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 24 Sep 2019 05:27:07 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:35592 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504182AbfIXJ1H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Sep 2019 05:27:07 -0400
Received: from [167.98.27.226] (helo=[10.35.6.110])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iCh5z-000094-OF; Tue, 24 Sep 2019 10:26:55 +0100
Subject: Re: [PATCH v2 1/7] ASoC: tegra: Add a TDM configuration callback
To:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>
References: <20190923162026.14882-1-ben.dooks@codethink.co.uk>
 <20190923162026.14882-2-ben.dooks@codethink.co.uk>
 <b0574569-8586-87eb-b4ec-6e3445acfc41@nvidia.com>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <8d62a19b-4e8d-d933-b364-3357388a6051@codethink.co.uk>
Date:   Tue, 24 Sep 2019 10:26:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b0574569-8586-87eb-b4ec-6e3445acfc41@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

>> +	pm_runtime_get_sync(dai->dev);
>> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
>> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL,
>> +		TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK,
>> +		(1 - 1) << TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT);
> 
> So this is just 0, so it would be simpler just to write 0. Feel free to
> add a comment.
> 
> Cheers
> Jon

Ok, will consider setting this to "0". Thanks.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

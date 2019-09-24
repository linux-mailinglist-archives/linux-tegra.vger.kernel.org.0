Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8C0FBC38E
	for <lists+linux-tegra@lfdr.de>; Tue, 24 Sep 2019 09:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406604AbfIXH7G (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 24 Sep 2019 03:59:06 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:33107 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406009AbfIXH7F (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Sep 2019 03:59:05 -0400
Received: from [167.98.27.226] (helo=[10.35.6.110])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iCfii-0005zt-9b; Tue, 24 Sep 2019 08:58:48 +0100
Subject: Re: [alsa-devel] [PATCH v2 2/7] ASoC: tegra: Allow 24bit and 32bit
 samples
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>
References: <20190923162026.14882-1-ben.dooks@codethink.co.uk>
 <20190923162026.14882-3-ben.dooks@codethink.co.uk>
 <ef013678-01b7-cae6-72f4-a619be428ad5@linux.intel.com>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <024eefe9-d20d-1282-4d4d-4e3fe52728d4@codethink.co.uk>
Date:   Tue, 24 Sep 2019 08:58:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ef013678-01b7-cae6-72f4-a619be428ad5@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 23/09/2019 17:37, Pierre-Louis Bossart wrote:
> 
>> @@ -283,6 +294,7 @@ static int tegra30_i2s_set_tdm(struct snd_soc_dai 
>> *dai,
>>           (1 - 1) << TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT);
>>       pm_runtime_put(dai->dev);
>> +    pm_runtime_put(dai->dev);
>>       return 0;
>>   }
> 
> git squash/merge issue here?

yes, thanks for spotting.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

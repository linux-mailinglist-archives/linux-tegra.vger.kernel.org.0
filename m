Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1812B5FC4
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 11:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730166AbfIRJDD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Sep 2019 05:03:03 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:7496 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfIRJDD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Sep 2019 05:03:03 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d81f2cc0000>; Wed, 18 Sep 2019 02:03:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 18 Sep 2019 02:03:02 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 18 Sep 2019 02:03:02 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 09:03:02 +0000
Received: from [10.21.132.148] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 09:03:00 +0000
Subject: Re: [PATCH 5/8] ASoC: tegra: set edge mode for TDM correctly
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-kernel@lists.codethink.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-6-ben.dooks@codethink.co.uk>
 <c9d2b321-b344-f5db-f2cb-c213bb5894a6@nvidia.com>
Message-ID: <854421d9-8c5b-0960-1864-0cf8f1018696@nvidia.com>
Date:   Wed, 18 Sep 2019 10:02:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c9d2b321-b344-f5db-f2cb-c213bb5894a6@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1568797388; bh=5gjzsaQ5RVPyzWZQSS2jSAST2YzuhSRPnPOTYftoFIs=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=AbdHYOjyiAwpLVWh3rZHvh49mz1oCan6GRLhuIlPRWAmeJG8xUQ+36ApcA3doPLe6
         Sb0Lkq17q9qFrT5/ikLNycJqs10uZUYDMoXhVHjHtJKNmOWf/81SPl/HtUuNGpZ5Wt
         b8pPSQmVZPtq+zuEmZsRQ0qcIeSoVgVc9cM2yZ0UJFqRTS8cWWmni8VHLH9EIcpY/l
         aJmMcT2V6coAsuILCnyyrda9tUUstzifo8zjrw3Z9Bvg5GoVBCYoQ773It+ohAQ5WY
         ldy0JNpYaa/98TzjzigR9bHeOcWrvZMKTlDw8kyyI9OCg+soSD4YXYvj3N47uR8fyg
         lPp381JHLrpZg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 18/09/2019 09:54, Jon Hunter wrote:
> 
> On 17/09/2019 19:12, Ben Dooks wrote:
>> In TDM, use the negative edge to drive data and the positive edge to sample
>> data.
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>  sound/soc/tegra/tegra30_i2s.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
>> index 4222839b63bd..d75ce12fe177 100644
>> --- a/sound/soc/tegra/tegra30_i2s.c
>> +++ b/sound/soc/tegra/tegra30_i2s.c
>> @@ -117,6 +117,8 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>>  	}
>>  
>>  	pm_runtime_get_sync(dai->dev);
>> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL_EGDE_CTRL_MASK,
>> +			   i2s->is_tdm ? TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE : 0);
>>  	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL, mask, val);
>>  	pm_runtime_put(dai->dev);
> 
> I would rather set this in the case statement above where the format is
> parsed and again drop this 'is_tdm' variable.

Actually, this should be implemented as shown in the following ...

https://nv-tegra.nvidia.com/gitweb/?p=linux-nvidia.git;a=blob;f=sound/soc/tegra-alt/tegra210_i2s_alt.c;h=ee482f27ed2e4710e5e7446918887f8f8ef31285;hb=a960d522a5486aee27605f890034869c4f49d94a#l362

Jon

-- 
nvpublic

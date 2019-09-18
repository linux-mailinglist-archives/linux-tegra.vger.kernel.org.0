Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9369B5FA0
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 10:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729762AbfIRIyk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Sep 2019 04:54:40 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:14068 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbfIRIyk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Sep 2019 04:54:40 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d81f0d40001>; Wed, 18 Sep 2019 01:54:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 18 Sep 2019 01:54:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 18 Sep 2019 01:54:39 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 08:54:39 +0000
Received: from [10.21.132.148] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 08:54:36 +0000
Subject: Re: [PATCH 5/8] ASoC: tegra: set edge mode for TDM correctly
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
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c9d2b321-b344-f5db-f2cb-c213bb5894a6@nvidia.com>
Date:   Wed, 18 Sep 2019 09:54:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917181233.534-6-ben.dooks@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1568796884; bh=KNlNBDBlSpS9zqvIkqXCRsuHdeFCNAOwsiyWKAA7L8k=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=EdE4HShNRcemvvfrzrFn4ZyxMgZoaxGznY8BCYyonym7rJg47t9N9jyOMb8BTxm9L
         aMvMDSghMFr0X6qXvaPOtFwnlLfvoGopY0vUmBMEJSbYNuNVIwGR5x2RbA7id1L83T
         qNHYarSZWqH0t7sNKWX6KJtyGiwZfm5FyQWu9a6yeKKmgBZJL18HMzkJxbCebU5ok7
         AHpFe0FqtXmpcyg18aPGoOx48Wg+Q0xaY4nB2Ijy+ANVYWq+wNu8JiPs8vBJnAcvba
         gpbhiRkWE81W0twUx895ilfm9Om605ZNet1a0ipYGvOoynhIo+4OftISWeewbRaCQj
         E5YITiMa7cB4A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 17/09/2019 19:12, Ben Dooks wrote:
> In TDM, use the negative edge to drive data and the positive edge to sample
> data.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  sound/soc/tegra/tegra30_i2s.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index 4222839b63bd..d75ce12fe177 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -117,6 +117,8 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>  	}
>  
>  	pm_runtime_get_sync(dai->dev);
> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL_EGDE_CTRL_MASK,
> +			   i2s->is_tdm ? TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE : 0);
>  	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL, mask, val);
>  	pm_runtime_put(dai->dev);

I would rather set this in the case statement above where the format is
parsed and again drop this 'is_tdm' variable.

Jon

-- 
nvpublic

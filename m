Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63B1AC274E
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Sep 2019 22:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729960AbfI3UwU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 Sep 2019 16:52:20 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:17313 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729503AbfI3UwU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Sep 2019 16:52:20 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d926b0b0005>; Mon, 30 Sep 2019 13:52:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 30 Sep 2019 13:52:20 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 30 Sep 2019 13:52:20 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 30 Sep
 2019 20:52:19 +0000
Received: from [10.26.11.193] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 30 Sep
 2019 20:52:17 +0000
Subject: Re: [PATCH v3 5/7] ASoC: tegra: set i2s_offset to 0 for tdm
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-kernel@lists.codethink.co.uk>
References: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
 <20190930165130.10642-6-ben.dooks@codethink.co.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <6d6ae684-dd5f-b180-9114-dafe12886d4f@nvidia.com>
Date:   Mon, 30 Sep 2019 21:52:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930165130.10642-6-ben.dooks@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1569876748; bh=B+bOA/1BEdGMiJVQNxtEh1S0E93VcCLi3h/Sq2DhnuM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=FsZqusXsLoQaD1YLlaEduilpt2gDH4p4wYckHHXcAnS4i9zhQxl5smZoojlUG9jlU
         tg3iHOMhLxStwM/RtWE7dkJN0nsumgoByusz+YiLGBwl/nc8EA520pU+GGiK3IQoDb
         cKXeCpbZpWKkzRQ7+gBwS78k71KzHYnEhQlwA5ZGWLymn0tTVP4MlfJi3+M5sbgBEm
         4HE5Yb+y7zPKyXh9gr5ZiyEzvstdDWQ3JxZHWVeUqKk2GgYjFdcr7Euc3+ZKORfYbM
         W0P/OLAxkVsIQZ05ltkTrWndQQ6Q8b7lRrJpz75R2HJHy+eYFJwVAyeKnpaMyhXwK8
         v4Ok4iNnI4qHw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 30/09/2019 17:51, Ben Dooks wrote:
> Set the offset to 0 for TDM mode, as per the current setup. Note we also
> move the data offset programming to the i2s hw_parameters call as per
> the suggestion from Jon Hunter.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> v2:
>  - fix the review comments and move the i2s offset setting
> ---
>  sound/soc/tegra/tegra30_i2s.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index c573151da341..a03692b0afc3 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -66,7 +66,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>  				unsigned int fmt)
>  {
>  	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> -	unsigned int mask = 0, val = 0;
> +	unsigned int mask = 0, val = 0, data_offset = 1;
>  	unsigned int ch_mask, ch_val = 0;
>  
>  	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> @@ -95,11 +95,13 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>  		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;
>  		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>  		val |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
> +		data_offset = 0;
>  		break;
>  	case SND_SOC_DAIFMT_DSP_B:
>  		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;
>  		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>  		val |= TEGRA30_I2S_CTRL_LRCK_R_LOW;
> +		data_offset = 0;

My understanding is that the difference between dsp-a and dsp-b is that
dsp-a has an offset of 1 and dsp-b has an offset of 0.

Cheers
Jon

-- 
nvpublic

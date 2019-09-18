Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 886FEB5FBA
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 11:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730089AbfIRJCG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Sep 2019 05:02:06 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:7443 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfIRJCG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Sep 2019 05:02:06 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d81f2930001>; Wed, 18 Sep 2019 02:02:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 18 Sep 2019 02:02:05 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 18 Sep 2019 02:02:05 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 09:02:05 +0000
Received: from [10.21.132.148] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 09:02:03 +0000
Subject: Re: [PATCH 6/8] ASoC: tegra: set i2s_offset to 0 for tdm
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-kernel@lists.codethink.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-7-ben.dooks@codethink.co.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <d79b8148-797b-08b2-09e7-71c11d9acd53@nvidia.com>
Date:   Wed, 18 Sep 2019 10:02:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917181233.534-7-ben.dooks@codethink.co.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1568797331; bh=kUH0fNummL1g7qgoKbXVj+qdqcPfcmIH5HVxPUWjiv4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=q79BPcQ3Ing5g7onNLmWyNYT4LHgC2mA0hnxX0d2LBUWrGQWIXLDwPMHJ8iMw+lOj
         BnLh/5Lr2+Yf/nK0g6YR3X5C2prwSpo1M7T6N6XilFraLOgF+IfGyOBfaUgJGGNgYu
         AN8hrdetz34+DlMdcLrJDX9h2rYSyn0piVoJUQZxVPQfTwKWMvN7fVDWfSid+jGGTi
         9ayxWoJS5fV+RbYlxuQME+fOBrehrX59Moho/Oj9wrlyj/gnOipkCUHHofIiler4+e
         gb7amkRClOn1kr3isT1iZAczvow2rxDr68GwC8Y9ZnLmsyO28zaZINsDusY0bHJ7va
         YyNmwJ6eDdqLA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 17/09/2019 19:12, Ben Dooks wrote:
> Set the offset to 0 for TDM mode, as per the current setup.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  sound/soc/tegra/tegra30_i2s.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index d75ce12fe177..3efef87ed8d8 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -206,8 +206,11 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
>  
>  	i2s->soc_data->set_audio_cif(i2s->regmap, reg, &cif_conf);
>  
> -	val = (1 << TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_SHIFT) |
> -	      (1 << TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_SHIFT);
> +	if (i2s->is_tdm)
> +		val = 0;
> +	else
> +		val = (1 << TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_SHIFT) |
> +		      (1 << TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_SHIFT);
>  	regmap_write(i2s->regmap, TEGRA30_I2S_OFFSET, val);
>  
>  	return 0;

Please move this code into tegra30_i2s_set_fmt() as it only needs to be
set once.

BTW, if you refer to the following I2S driver for Tegra210, you will see
how I think that we should handle this ...

https://nv-tegra.nvidia.com/gitweb/?p=linux-nvidia.git;a=blob;f=sound/soc/tegra-alt/tegra210_i2s_alt.c;h=ee482f27ed2e4710e5e7446918887f8f8ef31285;hb=a960d522a5486aee27605f890034869c4f49d94a#l310

Cheers
Jon	


-- 
nvpublic

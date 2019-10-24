Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FCB0E3794
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436631AbfJXQM1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:12:27 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:1655 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439732AbfJXQM0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:12:26 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5db1cd6f0000>; Thu, 24 Oct 2019 09:12:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 24 Oct 2019 09:12:26 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 24 Oct 2019 09:12:26 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Oct
 2019 16:12:25 +0000
Received: from [10.21.133.51] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Oct
 2019 16:12:23 +0000
Subject: Re: [PATCH v5 3/7] ASoC: tegra: i2s: Add support for more than 2
 channels
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-kernel@lists.codethink.co.uk>,
        Edward Cragg <edward.cragg@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-4-ben.dooks@codethink.co.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <2eef499e-d9d4-732a-ddd6-8d307d8cb08d@nvidia.com>
Date:   Thu, 24 Oct 2019 17:12:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018154833.7560-4-ben.dooks@codethink.co.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1571933551; bh=Em8zJ+xqp5ltYNyIDBW/UWmUoZdgdkvE/oX0EfLEm/w=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=q67wTYVtcDTM32b2GosfMe2EB89bArLonTeE5E5MkOPL/zd/5lZ0bgNL/aE06pWQU
         XIZFbDn0eQWY9hnkqWeV/u7FEaXmYKcOX5wx5U7mFJDeHaPqJmZnj0qR2cOwqZfwj8
         PTPS5wveDFYJCOaubeIEZzcHhh1ehTPj9IV3f5HaWSrI3v8pCaPz7CWiD1NV7qRo/I
         zo3H5kBWr+dybur8UXnlli2IXoGGaHWIDkCb7GIc4YAMuGeGK5wIG8hPqlvC3wN/Cz
         mm6PMnHFME4obvWDSfcOghpj0ht4CoiTpvzymSUMv4CoWq5II+7IcotWC0SkM2JpFI
         weBwpkQwpkCjg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 18/10/2019 16:48, Ben Dooks wrote:
> From: Edward Cragg <edward.cragg@codethink.co.uk>
> 
> The CIF configuration and clock setting is currently hard coded for 2
> channels. Since the hardware is capable of supporting 1-8 channels add
> support for reading the channel count from the supplied parameters to
> allow for better TDM support. It seems the original implementation of this
> driver was fixed at 2 channels for simplicity, and not implementing TDM.
> 
> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
> [ben.dooks@codethink.co.uk: added is_tdm and channel nr check]
> [ben.dooks@codethink.co.uk: merge edge control into set-format]
> [ben.dooks@codethink.co.uk: removed is_tdm and moved edge to hw_params]
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> v2:
> - fix the lrclk for dsp-b format
> ---
>  sound/soc/tegra/tegra30_i2s.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index 063f34c882af..fc77e65a3646 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -67,6 +67,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>  {
>  	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>  	unsigned int mask = 0, val = 0;
> +	unsigned int ch_mask, ch_val = 0;
>  
>  	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
>  	case SND_SOC_DAIFMT_NB_NF:
> @@ -75,6 +76,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>  		return -EINVAL;
>  	}
>  
> +	ch_mask = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_MASK;
>  	mask |= TEGRA30_I2S_CTRL_MASTER_ENABLE;
>  	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
>  	case SND_SOC_DAIFMT_CBS_CFS:
> @@ -90,10 +92,12 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>  		TEGRA30_I2S_CTRL_LRCK_MASK;
>  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>  	case SND_SOC_DAIFMT_DSP_A:
> +		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;

Sorry, I just saw the feedback on the previous iteration. I don't think
we want to set the polarity but based upon the format that is passed ...

https://nv-tegra.nvidia.com/gitweb/?p=linux-nvidia.git;a=blob;f=sound/soc/tegra-alt/tegra210_i2s_alt.c;h=24cf3b55326f687aded22b91182df41c5ae188ac;hb=703aa948d2c92b87fd84f367f43a07778ed098b5#l333

Cheers
Jon

-- 
nvpublic

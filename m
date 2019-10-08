Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4C93CFDA4
	for <lists+linux-tegra@lfdr.de>; Tue,  8 Oct 2019 17:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfJHP3i (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 8 Oct 2019 11:29:38 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33512 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbfJHP3e (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Oct 2019 11:29:34 -0400
Received: by mail-lf1-f68.google.com with SMTP id y127so12331147lfc.0
        for <linux-tegra@vger.kernel.org>; Tue, 08 Oct 2019 08:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EoX9RU7OCgSyJHiOI8NfYUW65KmpDnDk4jkS5zSGB9s=;
        b=g+atH4RR+l46NAMJ3DqRlKJUAMis6AcCZ1tJMS5RVuFp5DTe94KtqVXhvq9mtoNqco
         6ChZ/TEBoMsReXuVJrQG41hqDlh7+g28w8vcLD3EhvpkbNdTRYWjezUmKp73knV0U7TR
         js+OEI0AHB3DBYLFsB/WBYudQAiJzum63PeU0Wb2wpIqkR4C44nZ2y3hx6vmliOKKA2d
         G3jKLJY63PMGYTyXHygSqe0J28VwCH3gzM7qWFYDKAwh2WAczejyCGWsoQrN+Vbn9PEZ
         wsTn7IFPikBI82v1ka6TTu0rx1T+NZ2UKPF1Iwod7izBSeVtIHh8YUu4LSFh9+c1yDLN
         HX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EoX9RU7OCgSyJHiOI8NfYUW65KmpDnDk4jkS5zSGB9s=;
        b=E4+acSEU05bTa72+RnrJf6u7whyCy68jsu8JaAFDwZYNkKBesEtaf1Km+Y9fv/wrEY
         4DA108ZJDxC36zkuxFFDqWtPBuoSW4cOR4AvvJnqgSDFLScTBCLWuCrLHgUieFUg7S3A
         u4y6usG6k2p7aWT3AW7jQ0ql3gcvJJ5oFPEGlqt7E4H/44PojhsZS6/817N2O7hiOd4x
         QGyRBS+2WaV00BdmGpo+qSJwopfhteTsRzg1HyBzDXjtcBt6bQxE+7MYsJvj1hQpuzcN
         9oIse9HGlF+rKOJOvsNEoLDvw9mrbBunpori80xU4Kt+iQmhB3CRDS/mYb3Qz8tTeGWw
         856Q==
X-Gm-Message-State: APjAAAUyazUep8mgu/SfNQsIfvQhXHCLYjR+p1zBNtNHRleUwfopT7ZT
        pokSJuKJOL5xifLrhAk4TRo=
X-Google-Smtp-Source: APXvYqwv1K851gyM8g3svkjPhroLjas4RSV8Eg6gjfULB12mo5/kTVn0KV7uCHyj3I5OYwKZr12wKA==
X-Received: by 2002:ac2:5a19:: with SMTP id q25mr11525365lfn.178.1570548573599;
        Tue, 08 Oct 2019 08:29:33 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.34.231])
        by smtp.googlemail.com with ESMTPSA id j5sm3745231lfj.77.2019.10.08.08.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2019 08:29:32 -0700 (PDT)
Subject: Re: [PATCH v4 3/7] ASoC: tegra: i2s: Add support for more than 2
 channels
To:     Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>
References: <20191007153136.4920-1-ben.dooks@codethink.co.uk>
 <20191007153136.4920-4-ben.dooks@codethink.co.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cfd308bd-290a-f72f-6876-d94151c09843@gmail.com>
Date:   Tue, 8 Oct 2019 18:29:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191007153136.4920-4-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello Ben,

07.10.2019 18:31, Ben Dooks пишет:
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
>  sound/soc/tegra/tegra30_i2s.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index 063f34c882af..7382f7949bf4 100644
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
>  		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>  		val |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
>  		break;
>  	case SND_SOC_DAIFMT_DSP_B:
> +		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;

Downstream code sets DSP_B to POS_EDGE, looks like you have a typo here.
Or does DSP_B happen to work with the NEG_EDGE?

[snip]

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C22CFDB37B
	for <lists+linux-tegra@lfdr.de>; Thu, 17 Oct 2019 19:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440573AbfJQRi0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 17 Oct 2019 13:38:26 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43787 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503130AbfJQRiZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Oct 2019 13:38:25 -0400
Received: by mail-lj1-f195.google.com with SMTP id n14so3434791ljj.10
        for <linux-tegra@vger.kernel.org>; Thu, 17 Oct 2019 10:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=98c8LVtjKUr2K/g2lcYCoBp2CmHqhMtP4y0d2mR2xZg=;
        b=X5NnkjRM8XYA5w3vvKAfU8s+tUxtQKSChCCvipA+uWZAKMVI3PvClfNgrK55lpIAmS
         tBlIRSsnyJoN9WQvN8WnXHUGt5m9UQFJ9MtOd7BlrQoaTftZcx1Kt5Dms64MDFlgCanm
         xcbrxn7k+txIsvtHDUY7+Yd1yYCn2qXRdR01/c0X/eULbT2ZoOAV5UH1tHDYQ4MWRh6r
         iW73FbaWUodiMa4d18IjwCevNEyTbNeGkZZjCPjE3mYM/cIt7NZND9aYrmGkOiHxrfcM
         Ff0pJFj0mH40jsX0NSlNJD2y3aveWo+r5O491Q07+peA1tres3zR22NoTL84njtpetV7
         4CbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=98c8LVtjKUr2K/g2lcYCoBp2CmHqhMtP4y0d2mR2xZg=;
        b=RGtiwfWd0CKYTfglLRpN2e5R6cE1MU4WuDRovptKLLBRRIJFaP8uKR2w3NEsMbZwqb
         FjS2IZjUgLZwkAL0WrUEbWwHUi9BSXMI514RaFRl4KwEAT6ibZtcryr6T773KzrOMcw8
         Nq7X8reEIsIcH7oZwaKcIXuBfJPPKJb6WRVtaj0RFRfdKMZBxtD3cDTUvFB/czpt83Dg
         fp0wOgQeqw2MX9J5VW1uDn5mI1m6mLaXgblcrHRUQlHzV8r/G/y7jLzGWyRDF8fzUZ0B
         8uvp5aoJTs7DczxRoXKCk3u+SbjTQlZGkVYVrFW0ApRh0s6nv7BWZSEusAQ/6PT1trdH
         uMzA==
X-Gm-Message-State: APjAAAVZasb4oIVENn3fzdCNqT3yjatzgjwKR2qQ8yPQzDme5IRWB4GP
        zcXovjAIhD6JEkFuYipbnlg=
X-Google-Smtp-Source: APXvYqzt2e6gO1zgAn8bv1tC/8yg+7tfeY44gxC5T+nm53J57A6QyDcxfjJU4+Jsj0ifX/S2h4HO/w==
X-Received: by 2002:a2e:9b8a:: with SMTP id z10mr3340209lji.66.1571333902839;
        Thu, 17 Oct 2019 10:38:22 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.10.250])
        by smtp.googlemail.com with ESMTPSA id r19sm1431980ljd.95.2019.10.17.10.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2019 10:38:22 -0700 (PDT)
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
 <cfd308bd-290a-f72f-6876-d94151c09843@gmail.com>
 <16910e8d-4745-4e55-0436-9b3200876037@codethink.co.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1e43701b-3627-ba6d-ee19-020e25af3ef1@gmail.com>
Date:   Thu, 17 Oct 2019 20:38:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <16910e8d-4745-4e55-0436-9b3200876037@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.10.2019 19:23, Ben Dooks пишет:
> On 08/10/2019 16:29, Dmitry Osipenko wrote:
>> Hello Ben,
>>
>> 07.10.2019 18:31, Ben Dooks пишет:
>>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>>>
>>> The CIF configuration and clock setting is currently hard coded for 2
>>> channels. Since the hardware is capable of supporting 1-8 channels add
>>> support for reading the channel count from the supplied parameters to
>>> allow for better TDM support. It seems the original implementation of
>>> this
>>> driver was fixed at 2 channels for simplicity, and not implementing TDM.
>>>
>>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>>> [ben.dooks@codethink.co.uk: added is_tdm and channel nr check]
>>> [ben.dooks@codethink.co.uk: merge edge control into set-format]
>>> [ben.dooks@codethink.co.uk: removed is_tdm and moved edge to hw_params]
>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>> ---
>>>   sound/soc/tegra/tegra30_i2s.c | 21 +++++++++++++--------
>>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/sound/soc/tegra/tegra30_i2s.c
>>> b/sound/soc/tegra/tegra30_i2s.c
>>> index 063f34c882af..7382f7949bf4 100644
>>> --- a/sound/soc/tegra/tegra30_i2s.c
>>> +++ b/sound/soc/tegra/tegra30_i2s.c
>>> @@ -67,6 +67,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai
>>> *dai,
>>>   {
>>>       struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>>>       unsigned int mask = 0, val = 0;
>>> +    unsigned int ch_mask, ch_val = 0;
>>>         switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
>>>       case SND_SOC_DAIFMT_NB_NF:
>>> @@ -75,6 +76,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai
>>> *dai,
>>>           return -EINVAL;
>>>       }
>>>   +    ch_mask = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_MASK;
>>>       mask |= TEGRA30_I2S_CTRL_MASTER_ENABLE;
>>>       switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
>>>       case SND_SOC_DAIFMT_CBS_CFS:
>>> @@ -90,10 +92,12 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai
>>> *dai,
>>>           TEGRA30_I2S_CTRL_LRCK_MASK;
>>>       switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>>>       case SND_SOC_DAIFMT_DSP_A:
>>> +        ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;
>>>           val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>>>           val |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
>>>           break;
>>>       case SND_SOC_DAIFMT_DSP_B:
>>> +        ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;
>>
>> Downstream code sets DSP_B to POS_EDGE, looks like you have a typo here.
>> Or does DSP_B happen to work with the NEG_EDGE?
> 
> ok, will change, we've only been using SND_SOC_DAIFMT_DSP_A
> 
> For reference, is there a git repo with this version of tegra tdm support?

Looks like all downstream kernels that supported T30 are doing the same
thing.

Take a look here for example:

https://nv-tegra.nvidia.com/gitweb/?p=linux-3.10.git;a=commit;h=49834eef9d51a6eff950e0f52ddc5343d960652e

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2523811B8C7
	for <lists+linux-tegra@lfdr.de>; Wed, 11 Dec 2019 17:30:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730315AbfLKQ3u (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 11 Dec 2019 11:29:50 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38053 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730220AbfLKQ3u (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Dec 2019 11:29:50 -0500
Received: by mail-lf1-f66.google.com with SMTP id r14so17203889lfm.5;
        Wed, 11 Dec 2019 08:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hq/yIjv7dQcNk4D9jg8omNMlgridafkSg7EuVHqVUI8=;
        b=puJXdRiIUhKttkBGG+0J8GK5DdigxQWS5y0oM1oC5+9CF74TrqpG88ZsLsEjmjZ2yY
         2KscLXYRz80Y5GDrqhrTmem4sDxVPHlCErAW46n3MGVZyzHOEmoOQub6B2xwtJX1VeaB
         gthpfk21jB5jAI13Wzt9UcBG9N59XPbngstn3EcpBKy930/aV9EgotJRRYln5cY57BwJ
         SsHMAdqGKgmpN2z1zNj/PtS5f5DNePcRkkziFCU8KCBv6osSOg9D93JY3CZJXESYzuEL
         7OS5a/TS2Ig3SSxV9tx/S7CdUKqF2jubT6TP3rOvTHq0FUb9UFHNF3Lpk6zAj2SXbCJr
         PwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hq/yIjv7dQcNk4D9jg8omNMlgridafkSg7EuVHqVUI8=;
        b=r+R8jsc9KOA4vHKPj8GRFsDeJy8KOVofswHU+oqsTBwyah+N/sjKlqSd7bJgAKSpnL
         0M18geg8yKmTIYGzXfhVKXXQ6Vrp71HI/5cCbxg3b3jemj9nGy6NO30kJIKE+eMKG3y8
         +S/ktpeQHmOCnZxKsLo/rLk/3heAs7vWt6UpZ20cuwV4dmRVtDJ55ShgcVwHozE7s5L4
         kAVbmV1gSYSrSUNcInoTEXwTw8NwxwDsZP4EA564G7UAtiaVk5KLV34kU8KwUONpqup/
         MbruoIxK7m6c06N5m82U6NVH1Khhy3OHdRUD2cOSvxPLUrah6SPEK9jkv2Z6AiF5VLPj
         Xxww==
X-Gm-Message-State: APjAAAWe/sdvMdgkK//QMGRL8TAG2WVqDCUSZoOemZ+AsBTuHRVa60Sk
        eMLMdnn+IsbEsT7MpCxQY6hxJcMY
X-Google-Smtp-Source: APXvYqyKKItBY/TV7QIeWXK15sGg4bEGTqPgEOhYsCHm66OSwEDfAD/6aejDpGg7n4OGpXSQo9JS7g==
X-Received: by 2002:a19:4a:: with SMTP id 71mr2802487lfa.50.1576081788085;
        Wed, 11 Dec 2019 08:29:48 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id i13sm1438903ljg.89.2019.12.11.08.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 08:29:47 -0800 (PST)
Subject: Re: [PATCH v1] sdhci: tegra: Add workaround for Broadcom WiFi
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191210014011.21987-1-digetx@gmail.com>
 <CAPDyKFpMe09PNQqinvvidF+wfASx2nuvgf7=Hx5+cGni8pdcRA@mail.gmail.com>
 <28045442-6a1c-1e0b-0dfe-c36fa9de149a@gmail.com>
 <CAPDyKFpWO_McZEoefX1T=SE=RYm_GU3S+LgYZrgJY_SJgv7egA@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <44f99e56-468e-c3f9-3785-73c2cf8ba118@gmail.com>
Date:   Wed, 11 Dec 2019 19:29:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpWO_McZEoefX1T=SE=RYm_GU3S+LgYZrgJY_SJgv7egA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.12.2019 19:10, Ulf Hansson пишет:
> On Wed, 11 Dec 2019 at 16:46, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Hello Ulf,
>>
>> 11.12.2019 11:11, Ulf Hansson пишет:
>>> On Tue, 10 Dec 2019 at 02:40, Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>
>>>> All Tegra20 boards that have embedded Broadcom WiFi SDIO chip are affected
>>>> by a problem where WiFi chip reports CCCR v1.10, while it should v1.20.
>>>> In a result high-speed mode isn't enabled for the WiFi card and this
>>>> results in a malfunctioning SDIO communication.
>>>
>>> Does that also mean SDIO_SPEED_SHS bit is set when reading SDIO_CCCR_SPEED?
>>
>> Yes, the SDIO_SPEED_SHS bit is set.
>>
>>>>  brcmfmac: brcmf_sdio_readframes: read 304 bytes from channel 1 failed: -84
>>>>  brcmfmac: brcmf_sdio_rxfail: abort command, terminate frame, send NAK
>>>>
>>>> Downstream kernels are overriding card's CCCR info in SDHCI driver to fix
>>>> the problem, let's do the same in upstream.
>>>>
>>>> The change is inspired by omap_hsmmc_init_card() of OMAP's HSMMC driver,
>>>> which overrides card's info for the TI wl1251 WiFi.
>>>
>>> This is a temporary solution and should be replaced by doing the DT
>>> parsing during
>>>
>>> So, yes, let's see if we can use a card quirk instead. That's the first option.
>>>
>>> A second option is simply to parse the DT subnode for a new DT
>>> property during mmc_sdio_init_card(). Along the lines of what we do
>>> for the broken-hpi DT binding for eMMC.
>>
>> Let's try the first option. My understanding is that the problem affects
>> only the specific model of the WiFi chip and it's not a board-specific
>> problem. I'll add Broadcom driver people to CC for the next version of
>> the patch, maybe they'll have something to say.
> 
> Okay, sounds reasonable. By looking at your latest attempt for a fix,
> I have two minor nitpicks, otherwise it looks good.
> 
> The nitpicks:
> I suggest to rename MMC_QUIRK_HIGH_SPEED_CARD to MMC_QUIRK_HIGH_SPEED
> and mmc_card_need_high_speed_toggle() to mmc_card_quirk_hs().

I'll take it into account, thanks.

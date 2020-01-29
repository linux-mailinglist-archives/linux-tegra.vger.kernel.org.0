Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA08214C3DF
	for <lists+linux-tegra@lfdr.de>; Wed, 29 Jan 2020 01:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgA2ASC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 28 Jan 2020 19:18:02 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44129 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgA2ASC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Jan 2020 19:18:02 -0500
Received: by mail-lj1-f195.google.com with SMTP id q8so16556906ljj.11
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jan 2020 16:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YlgM9WZEZDdUs9qVD2FtzJ2n5fMFAKgcgxkNOPf+r3o=;
        b=cYeQlxKij/EYciFyZ2eVgWc7UcfCT5Hftve9Bn429wK6LfhSqhINprvyR406PmDrmb
         xOprsB3Dll0liXDPBDT7BWJahwh55TIuLntwbBoRY7RcXLlnzlUF8BPrv8ds7iQ3Zv95
         Ln/ZJIA+6Mq6sk1RIe6yy8ee+mu/eta6bl2ZNiieojocxbAf//g3ABe8Mm+XCy4qnR9X
         QGjnLjC6granoIrH0NuspheaP1+4L5pVJtuUEP+oUkZUaTvleqOuGgETJtlK9Aoxovcj
         V6F4wi4GobE5/CzFBzapsAUDoH6va+8wfXanK5b4ueA93suxSMqPWlNSwclRv2i5gI6c
         MaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YlgM9WZEZDdUs9qVD2FtzJ2n5fMFAKgcgxkNOPf+r3o=;
        b=Gfxda8+3M+uYBEppL8mYQpHqE1biMjD3EvLILX6lqfxFf5JN8tofjZxw49Q1dH7bnw
         F2Arn3qJ1Z0BR6OUh00xirJjhtB3dd+Qu+efVPmHfAUaWnd88D26Tm8S48LL2/Q3Yeu2
         t+6jp7h+A+8khuFf2vBRwpD1ix5SuyIpiBo9J1rv1s5TxAT9HfMMysbDbrKNJjF6+rns
         G0AncCV74aJr3v2QZccbyNLE3Dp824tXcrC963G8pNwvZEWHdGXrt/O9ZwF3pFmworby
         m+0l87QV6VPrxuTA3Q2/cQDb6yj9fQY/lJ7EwrbKGjTZeajS+hIh8pLCvSEshFn8xbPE
         XdWg==
X-Gm-Message-State: APjAAAWD32hFvF+vIPLPOeBdbFN9S6ZJjNOJWB6V3KktPEbfRUpH8yr4
        8rv/5J15eGtK+Ze3mYA4ejIX1kIS
X-Google-Smtp-Source: APXvYqyPrTRX37Z80j56HOEMPR3REwtI7reHbOy3u8Ry3Yq2ZOQnYCRkIhPUdiubDgVvvDSWJ8BwHw==
X-Received: by 2002:a2e:3619:: with SMTP id d25mr14366306lja.231.1580257080080;
        Tue, 28 Jan 2020 16:18:00 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id m13sm134471lfo.40.2020.01.28.16.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 16:17:59 -0800 (PST)
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
To:     Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra@vger.kernel.org
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
 <047c8caa-e715-5295-9794-67ff3e10cea2@gmail.com>
 <70f344bf-f991-606c-55ab-bdadea27d233@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2ff97414-f0a5-7224-0e53-6cad2ed0ccd2@gmail.com>
Date:   Wed, 29 Jan 2020 03:17:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <70f344bf-f991-606c-55ab-bdadea27d233@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.01.2020 21:19, Jon Hunter пишет:
> 
> On 28/01/2020 17:42, Dmitry Osipenko wrote:
>> 28.01.2020 15:13, Mark Brown пишет:
>>> On Mon, Jan 27, 2020 at 10:20:25PM +0300, Dmitry Osipenko wrote:
>>>> 24.01.2020 19:50, Jon Hunter пишет:
>>>
>>>>>                 .rates = SNDRV_PCM_RATE_8000_96000,
>>>>>                 .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>>>> -                          SNDRV_PCM_FMTBIT_S24_LE |
>>>>> +                          SNDRV_PCM_FMTBIT_S24_3LE |
>>>
>>>> It should solve the problem in my particular case, but I'm not sure that
>>>> the solution is correct.
>>>
>>> If the format implemented by the driver is S24_3LE the driver should
>>> advertise S24_3LE.
>>
>> It should be S24_LE, but seems we still don't know for sure.
> 
> Why?
/I think/ sound should be much more distorted if it was S24_3LE, but
maybe I'm wrong.

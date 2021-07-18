Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399153CCAB0
	for <lists+linux-tegra@lfdr.de>; Sun, 18 Jul 2021 22:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbhGRVCz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 18 Jul 2021 17:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbhGRVCz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 18 Jul 2021 17:02:55 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC2EC061762;
        Sun, 18 Jul 2021 13:59:56 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id x25so26242357lfu.13;
        Sun, 18 Jul 2021 13:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HFfBjstguhvOzoTjqRzCmqrQNY06jti1kOVosp9qHoo=;
        b=hKBuWzKY3JX+7KJrNfurQ8/4u4vSH2Be1XusWO3tT1ymlg/CffYxjBuK3KcPQ/DkDe
         LorBjkCpgbFLN1/mmtLQqkgqMFa2VsuRMAvf+0x0+VhBJlzIaNJX1iPcmWL7m5xvBI/f
         KHpnL9IiltvgeHhZblSBwKHSGgfDwUsWEIDONaN0COpekRLGsSrB+oaD7HyUE9yMnPbK
         hKqYmKkqvxYpcq9Q5mtmYPMZB2Tib8U4xb9TaiCDkbHOo8kqX19OklZ4VdpXgUTvBtrL
         pjPU6VZiaqQaQsIQwY6odMiegIscRLBuNZs1G/k6tjOjC9C4UAfHq0M9h6s4hfR74Z5y
         U06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HFfBjstguhvOzoTjqRzCmqrQNY06jti1kOVosp9qHoo=;
        b=pKirlEgZDZfRn0YTDqSmyIx3C2NMzRamkqYsIbbJKhByitFK5tLg4NyiVUF8nlZ0PU
         P4vvs3s335tnbdrPy0A1Ui4YRIzeXdUoFHLqtL9Uf4kv4IjlNQke2G8nbePosuMmz5GN
         Lge7oVV0KcXaYL+HLqX2rSbJQ+qZlV4Ado/A8dQ1+nSf4kgSeqgWHpL5f21Rd80wapqV
         dYqI008wKfFbrR+f+F4SJIT0UF6O1JsQcYXgX4lnNHRDzzEXhj/At3a2iuuJHMzd/kx7
         aKbdBu195/9tTwT98NzmtgfItax80anMJLAU+b5FEjAbo+Eqr8EMKMWdQEXmB65IVyWk
         zL2g==
X-Gm-Message-State: AOAM532j5FR5cVqrbR3Afn3QKpTTuUv+APb/lTXk3g8fUqDVD7BdeHdK
        moFymOmdGjsGu9Hk7/ePEFs=
X-Google-Smtp-Source: ABdhPJxBALZlF3LK/9JQ15Hk6fkH/d6PnUFIUPJ8LDiKhARAQwVAxPwIBGGdD6Nc68LnFcbMHak0/g==
X-Received: by 2002:ac2:5d2f:: with SMTP id i15mr16052400lfb.134.1626641992999;
        Sun, 18 Jul 2021 13:59:52 -0700 (PDT)
Received: from [192.168.2.145] (46-138-17-53.dynamic.spd-mgts.ru. [46.138.17.53])
        by smtp.googlemail.com with ESMTPSA id k21sm1798140lji.107.2021.07.18.13.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jul 2021 13:59:52 -0700 (PDT)
Subject: Re: [PATCH v18 0/2] Add memory bandwidth management to NVIDIA Tegra
 DRM driver
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Matt Merhar <mattmerhar@protonmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20210601042108.1942-1-digetx@gmail.com>
 <8accfe1e-fc48-21ca-f7c6-bd2d60162e6d@gmail.com>
 <50912a57-aa43-58b0-02d2-6928578d6286@gmail.com>
 <YNBxiFXMS9rfT93c@orome.fritz.box>
 <af058fc3-8696-a8f9-b52d-8e1b2ee760c3@gmail.com>
Message-ID: <0e81b357-d631-fcc1-bc54-946825093642@gmail.com>
Date:   Sun, 18 Jul 2021 23:59:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <af058fc3-8696-a8f9-b52d-8e1b2ee760c3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

21.06.2021 14:43, Dmitry Osipenko пишет:
> 21.06.2021 14:01, Thierry Reding пишет:
>> On Mon, Jun 21, 2021 at 07:19:15AM +0300, Dmitry Osipenko wrote:
>>> 07.06.2021 01:40, Dmitry Osipenko пишет:
>>>> 01.06.2021 07:21, Dmitry Osipenko пишет:
>>>>> This series adds memory bandwidth management to the NVIDIA Tegra DRM driver,
>>>>> which is done using interconnect framework. It fixes display corruption that
>>>>> happens due to insufficient memory bandwidth.
>>>>>
>>>>> Changelog:
>>>>>
>>>>> v18: - Moved total peak bandwidth from CRTC state to plane state and removed
>>>>>        dummy plane bandwidth state initialization from T186+ plane hub. This
>>>>>        was suggested by Thierry Reding to v17.
>>>>>
>>>>>      - I haven't done anything about the cursor's plane bandwidth which
>>>>>        doesn't contribute to overlapping bandwidths for a small sized
>>>>>        window because it works okay as-is.
>>>>
>>>> Thierry, will you take these patches for 5.14?
>>>>
>>>
>>> The display controller does _NOT_WORK_ properly without bandwidth
>>> management.
>>
>> That's surprising. So either it has never worked before (which I think
>> I'd know) or something has caused this regression recently. In the
>> latter case we need to identify what that was and revert (or fix) it.
> 
> The problem is caused by the support of dynamic memory frequency scaling
> which does a good job at keeping memory in a low power state during idle
> time. So display controller may not get enough bandwidth at the start of
> scanout if it won't request BW beforehand. This problem existed for many
> years on T124 and now T20/30 are also affected. The DC of T20 is the
> least tolerant to memory bandwidth troubles.
> 
> This problem is not critical, but it hurts user experience since high
> resolution modes may not work at all and display output may become
> distorted, requiring a DC reset.
> 
>>> Can we get this patch into 5.14? What is the problem?
>>
>> There was not enough time to review and test this, so I didn't feel
>> comfortable picking it up so close to the -rc6 cut-off. I plan to pick
>> this up early in the v5.14 release cycle and target v5.15.
> 
> Thank you for the explanation! It's not uncommon to forget about
> patches, so the silence worries me. I hoped that both the dynamic freq
> scaling and display BW support would be merged around the same time, but
> apparently we got a disconnect here.
> 

Reminder ping :)

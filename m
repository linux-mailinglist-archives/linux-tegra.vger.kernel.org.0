Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3947532B291
	for <lists+linux-tegra@lfdr.de>; Wed,  3 Mar 2021 04:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378874AbhCCDbm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 2 Mar 2021 22:31:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350917AbhCBM7H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 07:59:07 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8282C06178C
        for <linux-tegra@vger.kernel.org>; Tue,  2 Mar 2021 04:58:00 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id u14so19767592wri.3
        for <linux-tegra@vger.kernel.org>; Tue, 02 Mar 2021 04:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bc1uAF3CzOnRDE8Aqgu7wL4LatneRimFe4/16qAiSCU=;
        b=BmyFiKNpnw9zFQ4RoQcXlzKvuhqM79VhJ70dx5VmSsfKdv34gSKvwtWwHPoMw5zS1H
         uWeicpjNjRFWTpOMNQOpDWvlnm+QfuuSGSFhqXt1oQMTB24fqeBgzCRp2U2JBbSJa/BD
         n12n9tc04x1azCa24C4lRScvdTbdL5PXkBy9WhpVgQoVF158VjY0EgdJCIeHxSHQcM3d
         73+zaJz2hMkSKfmydHdpFaZDDC336A/gTwmHjlK4PN/MGqwiGohHchJINSP6mlFv1Yjm
         qW34c5Z2vI0UF8VQFN4BOOT4YFlT5j3fyv301673E7eIhoHVlVZGDME5n7SjbLBp0527
         0g5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bc1uAF3CzOnRDE8Aqgu7wL4LatneRimFe4/16qAiSCU=;
        b=EGZlMEEA097JSUkOUU/+X1e7JxMUBBGPT9y2R1QIVqUVVoQYMpF2V2++ZTyJTq75C9
         KLrY5ev6xqMFgv7N8n1o5wY4GW986kMKOTlnFM+wvLTbe/JWRB96QUZ/fP89NwQqD/5k
         v1lbr6zil7HpOxwAZC0TCSP/wLtK9VQrOiolSv4Ma0+Mno2var/o5X9f5l2AcTiE0AYc
         3gSo0uCeX8MNCE6UacNRHr7NANfUdRyCLECG9yWevPd1n9o14ae2AM3ps8zuR27j5rSg
         /QoxKVLJpGqiJ4emUNq/wCkr7B3c4mqX6VaWjwDe2MLIrFEOWRkQ/DPoe2k9RUC7Cczj
         ckJA==
X-Gm-Message-State: AOAM532sIvpvoYye0vEm1ukBPQ6w7R9ixAx8QKLENGSVF0Tj9jQPIC9H
        dc54c7uxnNeJsOJWakKP9sLSCN46Dp1uYw==
X-Google-Smtp-Source: ABdhPJzgbknmesUIaWl/Uq1TH4TTlNf0NrnJvkouOH1rNm6SEHhgVf0Yy5cMwWgHP6HLRkxdD31BPQ==
X-Received: by 2002:adf:dd81:: with SMTP id x1mr21649271wrl.233.1614689879296;
        Tue, 02 Mar 2021 04:57:59 -0800 (PST)
Received: from [192.168.0.41] (lns-bzn-59-82-252-144-192.adsl.proxad.net. [82.252.144.192])
        by smtp.googlemail.com with ESMTPSA id o124sm2520532wmo.41.2021.03.02.04.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 04:57:58 -0800 (PST)
Subject: Re: [PATCH RESEND v2 2/2] cpuidle: tegra: Remove do_idle firmware
 call
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Anton Bambura <jenneron@protonmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210302095405.28453-1-digetx@gmail.com>
 <20210302095405.28453-2-digetx@gmail.com>
 <dd5cff9e-b86b-7fea-c88b-c32b5c428705@linaro.org>
 <1da82ae3-6b23-2aa0-3275-309ffd8738d0@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <9b744a38-5f43-00bb-1972-86a30efaaa96@linaro.org>
Date:   Tue, 2 Mar 2021 13:57:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1da82ae3-6b23-2aa0-3275-309ffd8738d0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 02/03/2021 13:51, Dmitry Osipenko wrote:
> 02.03.2021 15:45, Daniel Lezcano пишет:
>> On 02/03/2021 10:54, Dmitry Osipenko wrote:
>>> The do_idle firmware call is unused by all Tegra SoCs, hence remove it in
>>> order to keep driver's code clean.
>>>
>>> Tested-by: Anton Bambura <jenneron@protonmail.com> # TF701 T114
>>> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
>>> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---

[ ... ]

>>>  	if (!IS_ENABLED(CONFIG_PM_SLEEP)) {
>>> -		if (!tegra_cpuidle_using_firmware())
>>> -			tegra_cpuidle_disable_state(TEGRA_C7);
>>
>> So firmware_ops->do_idle is always NULL, thus
>> tegra_cpuidle_using_firmware() is always false and
>> tegra_cpuidle_disable_state() always called, right ?
> 
> Yes, the tegra_cpuidle_disable_state(TEGRA_C7) is always
> called if CONFIG_PM_SLEEP is disabled in kernel config.

Ok, thanks.

Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

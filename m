Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C2D348B3D
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Mar 2021 09:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhCYINc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 25 Mar 2021 04:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbhCYINT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 04:13:19 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2CE0C0613E0
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 01:13:18 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id hq27so1425486ejc.9
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 01:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HejjARvJ9xPzmvq9Kb1zqDu3RAw9VmmzKI0Ua2yVZWY=;
        b=kYALy9LoxNSmT31hMkqKdDwmBUCwkQQPfZRxqVfaQNb6SSyyhqEVXORGQlZ/gsHHyL
         rXpU596MLUA5ZE1M/vgYekdE1EiSfL+awNober1qR+38waVNDhZ1gogY3f6If/6rPjhm
         tRHSt8U2JKFMBMwQDjjbXDRbBau0NanR76FFbkd5R/qeAwZ0ZCRAzI7AeMp6TkSG6HQG
         enuNkyUis7EzsT9InqgX6kqC7sIJoX7DJGAu2WSZaeBhJnYPd8xc4IAJ1kkBUp17OoIR
         pSRo1pEVuBU8iSze/ZeCLFzmGo/bjTsymjwcGQ43kDa4b7elG140bCFf2S9J0OvntzLF
         YQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HejjARvJ9xPzmvq9Kb1zqDu3RAw9VmmzKI0Ua2yVZWY=;
        b=ApI0sm/Kx/Jbhit8b7PBeDDSD0DNRaVdnHCfZjSneo71B/8IFqbdXlldCqAcRGRikr
         Q5c2ER2UgCiHNhvP6AZg+OqmhQq2FzK4czR7ndzxBsXF09Nqwu8pwdLxaglBkxq/NIhw
         XIPwKGMnhYsyBYIT3tB0TzEw+5LOYzEztTqHISwgtZDgggKcHofYSDCUSlOSgmBrGmRb
         EWFPY+TGU58Dprx+Xl6MhQ1IWZn2UH4RJsGGKhUdNJWHxCG5n/G/oMxmLysblobG/vGK
         iA4/QT17d2s+WtZZgwjm9qiyKXmxImzGG5wL/nlez2x/3obKn2AWlqMkh4OmMZyA1pfy
         RVOw==
X-Gm-Message-State: AOAM531y6V6k5bRElaN9SYcOjPZqDp2VxZN+TVZ5GcVZya5YWsZQ6wUU
        YiZMKO3e5g+k9Nix506Rm1gzyC3j2yWPTOag49U=
X-Google-Smtp-Source: ABdhPJxQhbpkhmqgC6PVpNJ3hc23dX6UiyLifzKp1AQpw+OE0HW4RV3jfMUeAGihMpu5JSftIMhv/g==
X-Received: by 2002:a17:906:2404:: with SMTP id z4mr7851672eja.14.1616659997026;
        Thu, 25 Mar 2021 01:13:17 -0700 (PDT)
Received: from [192.168.1.54] (hst-208-220.medicom.bg. [84.238.208.220])
        by smtp.googlemail.com with ESMTPSA id u24sm2049805ejr.34.2021.03.25.01.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 01:13:16 -0700 (PDT)
Subject: Re: [PATCH v3 14/15] media: venus: Convert to use resource-managed
 OPP API
To:     Dmitry Osipenko <digetx@gmail.com>, Qiang Yu <yuq825@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yangtao Li <tiny.windzz@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20210314163408.22292-1-digetx@gmail.com>
 <20210314163408.22292-15-digetx@gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <b780c19f-7f5d-5453-dec1-062fa7c1dc07@linaro.org>
Date:   Thu, 25 Mar 2021 10:13:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210314163408.22292-15-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On 3/14/21 6:34 PM, Dmitry Osipenko wrote:
> From: Yangtao Li <tiny.windzz@gmail.com>
> 
> Use resource-managed OPP API to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/core.h      |  1 -
>  .../media/platform/qcom/venus/pm_helpers.c    | 35 +++++--------------
>  2 files changed, 8 insertions(+), 28 deletions(-)


I'll take this through media-tree once OPP API changes are merged.

-- 
regards,
Stan

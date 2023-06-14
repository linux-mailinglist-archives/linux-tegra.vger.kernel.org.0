Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72D3B72DA52
	for <lists+linux-tegra@lfdr.de>; Tue, 13 Jun 2023 09:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240276AbjFMHAo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 13 Jun 2023 03:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240268AbjFMHAh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Jun 2023 03:00:37 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 208AE1732
        for <linux-tegra@vger.kernel.org>; Tue, 13 Jun 2023 00:00:28 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f62b552751so6150767e87.3
        for <linux-tegra@vger.kernel.org>; Tue, 13 Jun 2023 00:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686639626; x=1689231626;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/wlUBkEwgr5eLaMoxO9Mu5KBKJON7zjaoclqydTonU=;
        b=BWbka8DnbzJWXRnq1wydHCY2Zd8Enj9c5X4EA/Zc53VMiM6amzlRsGK3qa54mK3mPu
         x+FJU2DOiTKVenYgWfL1yf7xU5R859nJE2sLd5V6WXIZGd3/ZqF5GLLHccsCiwShdmXe
         LMsJ9RsxDnyKim+9qckRnb4fY05Zt0FRbcrxC+tOsOWEAwXxOwiXOKVSvqorsydju/uH
         GeVuJNww6lGNWSB9oE6x/OBVBx73/av7//qn6Bg9mG8Ws4TlupKFD9x3mWUSLiD+4a3x
         95rkK6ypdgQKc7gF4K2/nAUs+ONiCIciwG/WN/QPDvcpQ8F0JKyouxRDd4BXx0ZZiVWk
         Oyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686639626; x=1689231626;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/wlUBkEwgr5eLaMoxO9Mu5KBKJON7zjaoclqydTonU=;
        b=bvpnBE/qKbGHJBloVAhoNvGBYfzmeqJfBqAYl4DqmV66py0RJOai0wsMGTS8gCMOlr
         F5jlv+E+U/XlV+y4XRNjcac8pUjBtnCB1yLB/GSALgWdayUjM4ZPCfJfWsqzfkZCVeNn
         rLKWW4I1slBVkp+WX6tfiRXZNTiOYVnJLBQXFJvhbIBV27ujW9j4NoypY0E9gjE2McaN
         ev6SNWGrmMJMoDoWGaVucqcGekxYSk16lbQcUNIpQit7cO3nzCej2Ou1HZJlx6gjaOhN
         gZj/CoOZ6W5BXESBqo7x7TsvnED8X1npsbTTJBKg/vRpX/Ljdu4eO6JGuJXIe6c0ySTX
         eZUA==
X-Gm-Message-State: AC+VfDw13syClYBvp/fq8sIj4mHTYQRwLOMToiMFj9NN5SxC/NAS3azd
        YjEqIdfnw0jLM+fg0k0wHReD4A==
X-Google-Smtp-Source: ACHHUZ75OooZv18bJg2Ru9YdEtkgWO9pEkvBldRwekvqgjfVEd2fYR0q4GdmEufu/J0+Dc1j0wMSug==
X-Received: by 2002:a05:6512:ea7:b0:4f4:b397:ebda with SMTP id bi39-20020a0565120ea700b004f4b397ebdamr5164640lfb.56.1686639625978;
        Tue, 13 Jun 2023 00:00:25 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b5a8:28ff:af00:a97f? ([2a05:6e02:1041:c10:b5a8:28ff:af00:a97f])
        by smtp.googlemail.com with ESMTPSA id 11-20020a05600c228b00b003f7361ca753sm13360118wmf.24.2023.06.13.00.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 00:00:25 -0700 (PDT)
Message-ID: <575f0538-1963-59fa-582f-6686f67b2f29@linaro.org>
Date:   Tue, 13 Jun 2023 09:00:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] thermal: Allow selecting the bang-bang governor as
 default
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc:     Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230609124408.3788680-1-thierry.reding@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230609124408.3788680-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 09/06/2023 14:44, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> For many setups the bang-bang governor is exactly what we want. Many
> ARM SoC-based devices use fans to cool down the entire SoC and that
> works well only with the bang-bang governor because it uses the
> hysteresis in order to let the fan run for a while to cool the SoC
> down below the trip point before switching it off again.
> 
> The step-wise governor will behave strangely in these situations. It
> doesn't use the hysteresis, so it can lead to situations where the fan
> is turned on for only a very brief period and then is switched back off,
> only to get switched back on again very quickly because the SoC hasn't
> cooled down very much.

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


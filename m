Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16DD7607569
	for <lists+linux-tegra@lfdr.de>; Fri, 21 Oct 2022 12:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbiJUKvj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 21 Oct 2022 06:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbiJUKvi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Oct 2022 06:51:38 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E8A1885A6
        for <linux-tegra@vger.kernel.org>; Fri, 21 Oct 2022 03:51:35 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id e18so4303965edj.3
        for <linux-tegra@vger.kernel.org>; Fri, 21 Oct 2022 03:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jgt0ycOYJ7G6rNsip+cHgRZva60xBR8mosLwh/fmmCo=;
        b=RvKbBiItCRFasVFV38vBAMddffxsCRIrtLIxpdcAU6gPW8ez0dw3eif8JtpzogBgG7
         h4OLwldd/2eE77Ijnh0bYKpnbkPJ+wIAKfmWeAfFkCREBrV96ErMfffHMPzJ4W0Oh9uV
         IYhdFrSPDsG0S8onAknig4pbG3ASI9R0+6WFsmXEtLzsN3NJSGRkHSQ3v2gam+fmDymk
         FonJYk/vKDPkvkdE+8Q6OqGkq5zTpRyd2KURaumrp/9BLtu0l2Ykt7aPuwHGsrd0YchX
         NSLN65i/iBV5os5uyMKa+5Ug6P4R280H3bvDWyR8H8PS89+FeQoiqnPkUSX8AGYULJG4
         dX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jgt0ycOYJ7G6rNsip+cHgRZva60xBR8mosLwh/fmmCo=;
        b=TRtUSlkCqL73qtKkrPKYyfwM+8Dz3wSpiSNj3WInffZg/Idis7iihY370xgLBO2lsS
         vi4O/YT22nBqkMiprEeqG4zVYu1CP1oCS3K5qrH+Wdb2xTgYsaLh7Iw3G9LNRRsLlGsC
         ezfsZMK4ZysWW8Nv0ShD3rK25O4z3hKAxHHE0tmpNGLOE5f1BMepwfqY5M5S+1eXC+KZ
         aiGIj1AP1YjAQGd7590HxdBH9lJDl+T3wPoPXDY/bL/qDPBArJG1SkS96oaiYATGBweK
         Hcx56Ha2h5J7HDyiYPgEHLEaMJnPRPfZCsAwS89b152WCUgNp/rxsSwnrWYTP29p72DU
         6W9g==
X-Gm-Message-State: ACrzQf2uTNu1jb0o4/ElFCXDK9P3BI4xnKDfhjm7HR8WUuPCtaDb5owu
        QxiQr8JH4FQT3h9w06hZzfeQUA==
X-Google-Smtp-Source: AMsMyM5Ru0+enSG64Hda4euKiqwj4+cbzwvdnozFg+Y03I4uBKi+QUy/KL6kwJ11cpZLangRMU3l6w==
X-Received: by 2002:a17:907:168c:b0:78d:8b6c:a209 with SMTP id hc12-20020a170907168c00b0078d8b6ca209mr15801333ejc.185.1666349493903;
        Fri, 21 Oct 2022 03:51:33 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:25b:e73e:85eb:ae6e? ([2a05:6e02:1041:c10:25b:e73e:85eb:ae6e])
        by smtp.googlemail.com with ESMTPSA id o23-20020a056402039700b00460fae424e2sm1910990edv.11.2022.10.21.03.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 03:51:33 -0700 (PDT)
Message-ID: <75f2ef94-596c-3ce1-ae65-7a1355435151@linaro.org>
Date:   Fri, 21 Oct 2022 12:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] thermal/drivers/tegra: Fix crash when getting critical
 temp
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20221010150311.40384-1-jonathanh@nvidia.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20221010150311.40384-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/10/2022 17:03, Jon Hunter wrote:
> Commit 13bea86623be ("thermal/of: Remove of_thermal_get_crit_temp()")
> removed the function of_thermal_get_crit_temp() and this is causing a
> NULL pointer deference crash when attempting to call the 'get_crit_temp'
> function pointer because this function pointer is no longer initialised.
> Fix this by replacing the call to the 'get_crit_temp' function pointer
> with a call to the function thermal_zone_get_crit_temp() instead.
> 
> Fixes: 13bea86623be ("thermal/of: Remove of_thermal_get_crit_temp()")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 471CA559E5C
	for <lists+linux-tegra@lfdr.de>; Fri, 24 Jun 2022 18:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbiFXQLA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 24 Jun 2022 12:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbiFXQK7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jun 2022 12:10:59 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE7A506F0
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jun 2022 09:10:58 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id c65so4155160edf.4
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jun 2022 09:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GVGaHvLcAZTNe2APbU/fEg0Z2klKQLmnbsFslF8kMQQ=;
        b=Ru5smQhEMboe8UqsC9iYprq3TT+71g4O0eiD+wCzDwQGdwRvArs+NwzLEncqilSNBz
         rpXxPmNVRZrGDaO+wmbOHPEkRmUPhLb8KD7rgRYhwP4uT1Ws3aOOZYEVQs3UbZbWawC1
         y/htZ4R9rIXRbqdEgK8g+2VesdAzs5tPVc3HgM9WhF+aAYv6tUC/EdZ3f9Au+xgyrXjw
         Df53PqYAp/x7h4W5K+D/OsseXXY9h7eyw+WVL/7djRuR5kjbrJS6/kUY1L6sfgawTeff
         QB6naRuyAe2RBQAv1h7/JPoQeZW462/71bOOoXNkemEMnB7gb+C5ewvdVSLXhx8K2GAb
         ZUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GVGaHvLcAZTNe2APbU/fEg0Z2klKQLmnbsFslF8kMQQ=;
        b=KEEz5RbMEzNQhpgc61joutW8IaymuwXlNIkI8g8dCEOtF99bHRiruTEvAHaPfPbPUr
         pDE51IUegPWTunqDRYSaqHfi+JNfADdAeHMJkWWQDtV2POHY/expAE1prIlzyQFKByT6
         teh1ROpXjmbuU7OK1GZ+EOuYyFAjRx7mQaegTQRpgaWZ3SS17P0Sl8oCA7QOkUIh6u4o
         rM3wsisf4ObKsam2eD85S0sPRUdgYxU5sDf0Je2djm+Dvn5nEAc3/ZicomRL33Owtj5Q
         iHaDpFwypmm9GsOanKl6Gy/RHv0WLuMXKBR+X8hDmhNvHgN13GuaipTRP7DG8pb5VccR
         1w1g==
X-Gm-Message-State: AJIora9gHKGlYxCN9/6hm+yX1e0OVe2yn+UqsffvJ63U/G8QyZUmtbvf
        UrsDT+ivbLRMIUqSm1GQGBzpuQOUZqq+bQ==
X-Google-Smtp-Source: AGRyM1vvb73J/VYAt4ux967UEedGM6d2tsVPm8xXwcPRJsbVb+q/9Lewgloj/oyuxkcY7AS92YGRRQ==
X-Received: by 2002:a05:6402:d5e:b0:435:dc14:d457 with SMTP id ec30-20020a0564020d5e00b00435dc14d457mr9586449edb.58.1656087056517;
        Fri, 24 Jun 2022 09:10:56 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s12-20020a1709064d8c00b006fe8ec44461sm1342294eju.101.2022.06.24.09.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 09:10:56 -0700 (PDT)
Message-ID: <d0bc0054-4457-bd56-161b-19808c65c0e9@linaro.org>
Date:   Fri, 24 Jun 2022 18:10:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: (subset) [PATCH net-next v1 3/9] dt-bindings: memory: Add
 Tegra234 MGBE memory clients
Content-Language: en-US
To:     linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, vbhadram@nvidia.com
Cc:     thierry.reding@gmail.com, treding@nvidia.com, robh+dt@kernel.org,
        catalin.marinas@arm.com, krzysztof.kozlowski+dt@linaro.org,
        kuba@kernel.org, jonathanh@nvidia.com, will@kernel.org
References: <20220623074615.56418-1-vbhadram@nvidia.com>
 <20220623074615.56418-3-vbhadram@nvidia.com>
 <165608679241.23612.13616476913302198468.b4-ty@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <165608679241.23612.13616476913302198468.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24/06/2022 18:06, Krzysztof Kozlowski wrote:
> On Thu, 23 Jun 2022 13:16:09 +0530, Bhadram Varka wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Add the memory client and stream ID definitions for the MGBE hardware
>> found on Tegra234 SoCs.
>>
>>
> 
> Applied, thanks!
> 
> [3/9] dt-bindings: memory: Add Tegra234 MGBE memory clients
>       https://git.kernel.org/krzk/linux-mem-ctrl/c/f35756b5fc488912b8bc5f5686e4f236d00923d7
> 

Hmm, actually now I think you might need it for DTS, although there was
no cover letter here explaining merging/dependencies...

I could provide you a tag with it or opposite (take a tag with only the
header).

Best regards,
Krzysztof

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD177C6F46
	for <lists+linux-tegra@lfdr.de>; Thu, 12 Oct 2023 15:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343952AbjJLNct (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 12 Oct 2023 09:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343724AbjJLNcs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Oct 2023 09:32:48 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D8F91
        for <linux-tegra@vger.kernel.org>; Thu, 12 Oct 2023 06:32:46 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c12ae20a5cso11230641fa.2
        for <linux-tegra@vger.kernel.org>; Thu, 12 Oct 2023 06:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697117565; x=1697722365; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k+Zt1DBOvbjWyM5nZyPvW6b5FstKOmZXoPjpZ0uP9fI=;
        b=JV7ZHqiskua2NKFPMIXx5iv9sC4FHshVCmZk21ovx3+W9SDbfIouSWZLz01P2Tahuw
         8+Gw1oeCWRNqf3lT+VhoPBwnj33wjly2PEIgB1vxlf1RyO1KweE9fZGi8HQgYVHIZ8f+
         kEMIzyVrDCFCwi8rPmIntt20eCbgFTKGzWokhjU3eQwNf02Ol7/Pt0pqooZ+Tfin5fFD
         CJpPOm0aPu9k6RN/8L4bdBXm8pL9fYwJQPbi3/B3Z/DNPn7uOGoVYvuE6Zv1J8E57Q1i
         tH+/4+PrcZ1cfKwsWD/xwTwz3RN+96UT9Uu0QuaDZEwZErAPvFgUE7Q8qnbbU9SN/WYs
         M4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697117565; x=1697722365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+Zt1DBOvbjWyM5nZyPvW6b5FstKOmZXoPjpZ0uP9fI=;
        b=cTczbUwb4+sl9GFGKt/vVBtqfDBmHbTXVAbuDuj9PyGmCcEdWzQctU3VwjYtdMGTCO
         S09UDjYZaWscMW6HqF1MdjWgfJ9R9IX2LkFOJbhSsWcha6orUdcf63oqAyNswy5bSEwC
         hzOhLn/Fp2CmG+MdgYjPHi1tKoiLwWF46EHld9VlRm4dv5pXBNn+/RkddYsFHFqaZqj9
         MqocTtwBpcnCO1xq5CmKMzA7DBVOxlWqE/XrYsFjycXuFUmU1rbKRHaZ0DB/JsVTpMtx
         H4lYQT6wGkqbw+wuts7NvNnlwJ66qo+R8SX36TKI0GbPMJL/rf9Wzq1sYuIfNapK0Xee
         Jccg==
X-Gm-Message-State: AOJu0YxbCefMKd1px4yUABtECeixu2rdlPoeVskJPPTfk1qvtjcZIZTe
        FR1fV01ifJC/DGsoDLVs0ex/xg==
X-Google-Smtp-Source: AGHT+IFPs/bLlnKI5rV0riktgZMew+HNuaQ17fiNlXKQMllkX9NsO4fVC7EE3ckESMzjyHW7bqIJ/g==
X-Received: by 2002:a2e:b0ee:0:b0:2bc:d0f8:fb4f with SMTP id h14-20020a2eb0ee000000b002bcd0f8fb4fmr21576574ljl.7.1697117564601;
        Thu, 12 Oct 2023 06:32:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id lf1-20020a170907174100b00992b2c55c67sm11094161ejc.156.2023.10.12.06.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 06:32:44 -0700 (PDT)
Message-ID: <8bdeefb0-4a62-4bcb-be84-1efbc2e18377@linaro.org>
Date:   Thu, 12 Oct 2023 15:32:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v2 2/2] memory: tegra: set BPMP msg flags to reset IPC
 channels
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sumit Gupta <sumitg@nvidia.com>
Cc:     treding@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        bbasu@nvidia.com
References: <20231009100557.18224-1-sumitg@nvidia.com>
 <20231009100557.18224-3-sumitg@nvidia.com> <ZSfR1l3lHMScTyL9@orome.fritz.box>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZSfR1l3lHMScTyL9@orome.fritz.box>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 12/10/2023 13:00, Thierry Reding wrote:
> On Mon, Oct 09, 2023 at 03:35:57PM +0530, Sumit Gupta wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Set the 'TEGRA_BPMP_MESSAGE_RESET' bit in newly added 'flags' field
>> of 'struct tegra_bpmp_message' to request for the reset of BPMP IPC
>> channels. This is used along with the 'suspended' check in BPMP driver
>> for handling early bandwidth requests due to the hotplug of CPU's
>> during system resume before the driver gets resumed.
>>
>> Fixes: f41e1442ac5b ("cpufreq: tegra194: add OPP support and set bandwidth")
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> Co-developed-by: Sumit Gupta <sumitg@nvidia.com>
>> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
>> ---
>>  drivers/memory/tegra/tegra234.c | 4 ++++
>>  1 file changed, 4 insertions(+)
> 
> Krzysztof,
> 
> this one has a build-time dependency on patch 1/2, so it'd make sense
> for me to pick this up into the Tegra tree along with patch 1/2. That
> is slightly easier because I already have a BPMP patch in the tree.

Sounds good.

Best regards,
Krzysztof


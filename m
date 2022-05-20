Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B881E52E557
	for <lists+linux-tegra@lfdr.de>; Fri, 20 May 2022 08:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346113AbiETGvk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 20 May 2022 02:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344624AbiETGvg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 May 2022 02:51:36 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A8BA2228B
        for <linux-tegra@vger.kernel.org>; Thu, 19 May 2022 23:51:34 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id br17so411472lfb.2
        for <linux-tegra@vger.kernel.org>; Thu, 19 May 2022 23:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2sD0n6yJXGuDhEewc3lorHaqBnUR099vPCJ5WEpCDzU=;
        b=mOoGc9M7MZgxeaun4PGlBRo4C1JXBlLpYBpB0L6MScXAzAz4CQjEupqeEEiqIWVtoS
         yzsod5WBURL9tjzxFjdaKzclp79TQIts7pzJufezPjonrPmOg2kLST6Yz5yk0poAdEkv
         1FokQMf2YtyUEt6qDRhGfKp0jAmlbIhEPE0Y9yp1BlWPZddAsy6avCDFyvojQByppw3U
         YZdF+69jR6WSNT6qja7BKlhcm6UOQBYfk6GgCQMdG/v+I34ZPzvjSe2msGn5TGD8lKrK
         CkEzOdKtdYsHqPbRhaDRxiJDH5hUlWVIVsUbCi9Mslb5JOHLhOU32ArxKxPNHc/7iUZR
         xWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2sD0n6yJXGuDhEewc3lorHaqBnUR099vPCJ5WEpCDzU=;
        b=3rsl5pmlAhJG0XIhMi3f6iq74xb/jVwwFoIWeZchc7p1OsDxIwnGnNKMMGPqPOgjKA
         HQmY6P4o5o9BqhRHX8wlUhYZkTGIpuYiwBZZKtCX5Ll6Liy8QPL/y23RHbrSp0iOkTii
         2oTVeIyW0gOCIQJNzsKvNN21rwxWbqYK116Zqe6R6B8ZSWBXuFOrOtmtvAJVOcTt1+Wm
         TZeCjq8EtcsWaC7/RjsquuF+CP78wyLPg3ltzlCkHpBOP16R3IuQKFFNiFfoLmj5UTIp
         BmBaKfU/692q1XvWqnDcSWUDYNeBtHDi+osnFmkPWZSb1dPMEPm/IHBaZ1Edf0Ug5bFR
         03yw==
X-Gm-Message-State: AOAM530mtsM8qvps4DFUoePr4GMPIW24CrLckuo/qug1bb/JiaV20b/z
        pFcrKKwNboIDDdAZ6ivDYWbwSQ==
X-Google-Smtp-Source: ABdhPJzaGbv04buuDHGp4NLG8WTmLEncJfxtJuLSgfyJWSMt4wxUrF1jnVPHvL9DO/40kuanoOGM6w==
X-Received: by 2002:a05:6512:398c:b0:473:ab45:1f7c with SMTP id j12-20020a056512398c00b00473ab451f7cmr5937130lfu.341.1653029492370;
        Thu, 19 May 2022 23:51:32 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g23-20020a2e9e57000000b0024f3d1daebbsm192250ljk.67.2022.05.19.23.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 23:51:31 -0700 (PDT)
Message-ID: <a0eed04a-1380-d96a-a406-217f053354b9@linaro.org>
Date:   Fri, 20 May 2022 08:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/6] ASoC: tegra: Add binding doc for OPE module
Content-Language: en-US
To:     Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        thierry.reding@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        perex@perex.cz, tiwai@suse.com
Cc:     jonathanh@nvidia.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1652895372-29885-1-git-send-email-spujar@nvidia.com>
 <1652895372-29885-2-git-send-email-spujar@nvidia.com>
 <049173a1-0fa6-510b-9169-ebe869b8a3b3@linaro.org>
 <90680cfb-c611-63cd-ab5f-5afb86c91cec@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <90680cfb-c611-63cd-ab5f-5afb86c91cec@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20/05/2022 06:19, Sameer Pujar wrote:
> Thanks Krzysztof for review.
> 
> 
> On 19-05-2022 17:10, Krzysztof Kozlowski wrote:
>> On 18/05/2022 19:36, Sameer Pujar wrote:
>>> +description: |
>>> +  The Multi Band Dynamic Range Compressor (MBDRC) is part of Output
>>> +  Processing Engine (OPE) which interfaces with Audio Hub (AHUB) via
>>> +  Audio Client Interface (ACIF). MBDRC can be used as a traditional
>>> +  single full band or a dual band or a multi band dynamic processor.
>>> +
>>> +maintainers:
>>> +  - Jon Hunter <jonathanh@nvidia.com>
>>> +  - Mohan Kumar <mkumard@nvidia.com>
>>> +  - Sameer Pujar <spujar@nvidia.com>
>>> +
>>> +properties:
>>> +  $nodename:
>>> +    pattern: "^mbdrc@[0-9a-f]*$"
>> Why? We enforce only generic names in shared schemas and this is neither
>> shared schema nor is it generic name.
> 
> Idea was to keep these node names consistent across DT files and parent 
> node can allow a given list of child nodes with strict checks. Does name 
> like "dynamic-range-compressor@xxx"

The checks are not coming from device node name, but from matching
schema to compatible. Why do you need consistent names across DTS files?
They should be anyway generic but what happens if they differ?

Additionally, the parent schema enforces nodes of children, so if this
is included in other schema, then the change is pointless.

I propose to drop it, unless it is a shared schema for many different
vendors.

>>
>>> +
>>> +  compatible:
>>> +    oneOf:
>>> +      - const: nvidia,tegra210-mbdrc
>>> +      - items:
>>> +          - enum:
>>> +              - nvidia,tegra234-mbdrc
>>> +              - nvidia,tegra194-mbdrc
>>> +              - nvidia,tegra186-mbdrc
>>> +          - const: nvidia,tegra210-mbdrc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +
>> No need for space
> 
> will remove
> 
> 
>>> +
>>> +  compatible:
>>> +    oneOf:
>>> +      - const: nvidia,tegra210-ope
>>> +      - items:
>>> +          - enum:
>>> +              - nvidia,tegra234-ope
>>> +              - nvidia,tegra194-ope
>>> +              - nvidia,tegra186-ope
>>> +          - const: nvidia,tegra210-ope
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 1
>>> +
>>> +  ranges: true
>>> +
>>> +  sound-name-prefix:
>>> +    pattern: "^OPE[1-9]$"
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +    properties:
>>> +      port@0:
>>> +        $ref: audio-graph-port.yaml#
>>> +        unevaluatedProperties: false
>>> +        description: |
>> No need for |
> 
> will remove.
> 
> 
>>
>>> +    ope@702d8000 {
>> I would suggest generic node name, if it is possible.
> 
> May be "processing-engine@xxx" ?

Sure.


Best regards,
Krzysztof

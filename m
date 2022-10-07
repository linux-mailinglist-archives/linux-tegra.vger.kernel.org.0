Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99A3F5F7B15
	for <lists+linux-tegra@lfdr.de>; Fri,  7 Oct 2022 17:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbiJGP5e (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 7 Oct 2022 11:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbiJGP5d (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 11:57:33 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601AAA5737
        for <linux-tegra@vger.kernel.org>; Fri,  7 Oct 2022 08:57:31 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id q17so6171670lji.11
        for <linux-tegra@vger.kernel.org>; Fri, 07 Oct 2022 08:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m5HuWaiBxYc9lI4KqIWMCv5yIi0RRFxzG1NnVl7MMOE=;
        b=ak/dQlFN+CtlNnUw49riVpZvBwA21CcPyo4J7WkbfMnXxK+iew8WeMXf/qKQ6zhTBA
         EoE8vIr7FTJqsV5aribkJf+wRUvDeKdC8diY8RmcZDedMs8TeM9RGMsQnKg5k+EzCSlx
         GyzZnbX5NQAxmWCSZ/UBhzf/SbASZFMx1Hr+nQw62HVStTQk7hhgsmVKSnfd1zFqWLB1
         iZIzCZ4KxD1VIYMM2oBhj6LIyYUoZmWtIyyMzNehYf3DTBeDfy8N+h7fEtEB/K3KSkB4
         TvgY9Os3qPd8Jyv7iN8RR7JKM7+/V7CRjp0g+wNEEsgk/Kftw5AdihGzCBK/yaNer+0A
         KGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5HuWaiBxYc9lI4KqIWMCv5yIi0RRFxzG1NnVl7MMOE=;
        b=V1ayCEKSAq35FEz31jsd8A6mpqequQqvtndZ5c2iECfgkrENV7sD5ScQXlWcATl5Pn
         k3t/bvmXTqv1zyzQ742zXiY6RXg3w4GF8CeCSe8LtRfcteF4ZFF3FSMEevtVUWr0HSZP
         czy0SharRXxkmtCKK3aCeWqFrTSN5NJIezIvAQAwDeK/gkTd+Sgfgj1HhuJAw5iLOfS+
         ujiQTJbJZGExqb6PMDxj4Y4sLI1H8awTNPIRLAMdcCrjb1UJe4Jia9O5Qqxx4FAk5A7b
         4NkymZEV4kVmobcVfGMrNVRMcB3RwohgewLW623M0RclEVotoAn00iXWAN7bwWzX8+xt
         17YQ==
X-Gm-Message-State: ACrzQf21ruTj2/9UImxCf78m3YRjg3giOpVwsDU9FOs3zvxPt79Nd+zt
        vuU2jyfQbO88JpD47qtI3nt51A==
X-Google-Smtp-Source: AMsMyM43XNH71np2bAVnS27qMV7G6nXKrqTTHy5zZmJF94oJjA09EWdUEbskt0R24ZpJCmxFUpYVOQ==
X-Received: by 2002:a05:651c:b13:b0:26c:679f:ea66 with SMTP id b19-20020a05651c0b1300b0026c679fea66mr2085382ljr.516.1665158249732;
        Fri, 07 Oct 2022 08:57:29 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id cf11-20020a056512280b00b004a03fd4476esm331324lfb.287.2022.10.07.08.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 08:57:29 -0700 (PDT)
Message-ID: <7bf3f70a-4af6-c62a-75fc-89591d5de04b@linaro.org>
Date:   Fri, 7 Oct 2022 17:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] arm64: tegra: Add Tegra234 SDMMC1 device tree node
Content-Language: en-US
To:     Prathamesh Shete <pshete@nvidia.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     smangipudi@nvidia.com, kyarlagadda@nvidia.com, anrao@nvidia.com
References: <80d046b9-ff8c-58dc-d149-e984d509fe5a@linaro.org>
 <20221007124424.16037-1-pshete@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221007124424.16037-1-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 07/10/2022 14:44, Prathamesh Shete wrote:
> Add device tree node for Tegra234 SDMMC1 instance.
> Add and enable SD card instance in device tree.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

> +
>  		mmc@3460000 {
>  			compatible = "nvidia,tegra234-sdhci", "nvidia,tegra186-sdhci";
>  			reg = <0x03460000 0x20000>;
> @@ -1541,6 +1581,25 @@
>  
>  			#interrupt-cells = <2>;
>  			interrupt-controller;

The blank line which you incorrectly placed, should be here...

> +			sdmmc1_3v3: sdmmc1-3v3 {
> +				pins = "sdmmc1-hv";
> +				power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
> +			};
> +
> +			sdmmc1_1v8: sdmmc1-1v8 {
> +				pins = "sdmmc1-hv";
> +				power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
> +			};
> +
> +			sdmmc3_3v3: sdmmc3-3v3 {
> +				pins = "sdmmc3-hv";
> +				power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
> +			};
> +
> +			sdmmc3_1v8: sdmmc3-1v8 {
> +				pins = "sdmmc3-hv";
> +				power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
> +			};


Best regards,
Krzysztof


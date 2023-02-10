Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38973691A3A
	for <lists+linux-tegra@lfdr.de>; Fri, 10 Feb 2023 09:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbjBJIp4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Feb 2023 03:45:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231524AbjBJIpz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Feb 2023 03:45:55 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3987E113E2
        for <linux-tegra@vger.kernel.org>; Fri, 10 Feb 2023 00:45:54 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so3483842wmb.5
        for <linux-tegra@vger.kernel.org>; Fri, 10 Feb 2023 00:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qA3qvbnssW7q8kXQFDPaNXVdxo8ZJzAN4ti+xF1gQ5M=;
        b=jgpNqU5WlUekv99IWQquuXrNQLE/1uSEKexafpZM3OI/DHNAPIDTQuOv/cMKnEaO3s
         jWyJ4G94/heiFfv6ZPvieOdG0mnBTRijfe21S6sKCHLqc4fDLY2GwnJ07Oy5fNPvI5uz
         2zRaM8D20COYy7LTiWC6LkZC3hOaaCadiVE1CfJjTnCAgIsiI6PDOvcxfA2BkYHmHdoo
         ZevvEya0tneI+VNJQBWOmrpSU5WRObiF/pHuHISmHet5qNl1bCvPucYR1EjepIovc/fo
         HlI/mLpjQq5OpzLN5S2WKr7mN2ePcbN6SY5hDLHJpgxTGU9uH44pbt/9iMthDC3PPUVS
         aSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qA3qvbnssW7q8kXQFDPaNXVdxo8ZJzAN4ti+xF1gQ5M=;
        b=Sm7kyQDZt640Z+pwBUQnsDuQA4Fpblw5/tK1cI4bkkJzYYHILKVVerX3zZDSa+P8Co
         wfuEBOZuNRd5ffabCR1qSR9pL6ny1WNYaEXpYjsoD8Om4K3p0/e9p7hyxZgORaf2QAHy
         ycNjeN0IOYNv8mMs8tNQHXJckBR6GV/oF2U5KywgjOCpYr14DV/xdYr+H+BJI/5PSXL1
         37MdF/H8SMQdt0EjRFtLPmlw/joMTe+BcCafeo5Ob/MgdnBL0eXTu0F0bEzIERQkj4w+
         VFk7lb2WFp8rHxK2UNcwHhzcvlUJ7jhuousKSep5KfmIUAqhYwiohZSUBf9xBd59zYAZ
         vMQw==
X-Gm-Message-State: AO0yUKXQeHjoG6D+o2L14W0sHwXDZgSdiPm+DLK48V/fuOxdkAYn7NFH
        RxvCu02Z8uCA1Jcdk6dUBn0Img==
X-Google-Smtp-Source: AK7set9x6sBH4Hw//pRNQ8QpNO2VKH3YQMChRW1yO4t8kC4SPlcv4uzYZTfstMMz6m3zHCQMBt8S8A==
X-Received: by 2002:a05:600c:35cd:b0:3df:eda1:439c with SMTP id r13-20020a05600c35cd00b003dfeda1439cmr8977658wmq.11.1676018752808;
        Fri, 10 Feb 2023 00:45:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c3b8d00b003dc434900e1sm4753511wms.34.2023.02.10.00.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 00:45:52 -0800 (PST)
Message-ID: <9570b0fb-1fe2-00fe-e224-229752f26a9a@linaro.org>
Date:   Fri, 10 Feb 2023 09:45:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] arm64: tegra: Audio codec support on Jetson AGX Orin
Content-Language: en-US
To:     Sameer Pujar <spujar@nvidia.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, oder_chiou@realtek.com, broonie@kernel.org
Cc:     perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
        kuninori.morimoto.gx@renesas.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org
References: <1675953417-8686-1-git-send-email-spujar@nvidia.com>
 <1675953417-8686-3-git-send-email-spujar@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1675953417-8686-3-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 09/02/2023 15:36, Sameer Pujar wrote:
> Jetson AGX Orin has onboard RT5640 audio codec. This patch adds the
> codec device node and the bindings to I2S1 interface.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 47 +++++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> index 8a97478..5881fbf 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> @@ -3,6 +3,7 @@
>  
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/sound/rt5640.h>
>  
>  #include "tegra234-p3701-0000.dtsi"
>  #include "tegra234-p3737-0000.dtsi"
> @@ -49,7 +50,7 @@
>  
>  							i2s1_dap: endpoint {
>  								dai-format = "i2s";
> -								/* placeholder for external codec */
> +								remote-endpoint = <&rt5640_ep>;
>  							};
>  						};
>  					};
> @@ -2017,6 +2018,32 @@
>  			status = "okay";
>  		};
>  
> +		i2c@31e0000 {
> +			status = "okay";
> +
> +			audio-codec@1c {
> +				status = "okay";

Are you sure you need this?

Best regards,
Krzysztof


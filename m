Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 553D7780845
	for <lists+linux-tegra@lfdr.de>; Fri, 18 Aug 2023 11:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359087AbjHRJaA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 18 Aug 2023 05:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359081AbjHRJ3c (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Aug 2023 05:29:32 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51BD35A4
        for <linux-tegra@vger.kernel.org>; Fri, 18 Aug 2023 02:29:30 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-522dd6b6438so842340a12.0
        for <linux-tegra@vger.kernel.org>; Fri, 18 Aug 2023 02:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692350969; x=1692955769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jTPWfjzgiS6MREC/CQy9YZ7a0Ba4pXdxJTPBP//ZxkQ=;
        b=ChP1wEg29yXYxpK7J9uqfILfPe/L9xBS0HNQPXH54y1zGDEvcdwljY5HVw15zrjTzx
         VpGb3h1ffXsIXv8NTndpsLQEcYlTmf6GA/8cPAvQ5OUfezNHFsG8dA4nQbmzYXZ+EEL/
         +E2hg2SAdUHITLhvITSusy2v1ZLvoO2kw3JiBht3/qHk2OjQyiKqn5GvDCtklD/qqqOS
         WHA7JqYdvqZ/Rjg0POkhOL40Q+5AYUtbCVBLV0PI/oamzCz/eMWcPzEw4/GQHHTTUYwt
         OWzP/mRyk+KkHBFUux84C272URdVjJQPiQUdj9yjv5T/igPb7VaLMxL8ciSwoEZ9ARB8
         hxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692350969; x=1692955769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jTPWfjzgiS6MREC/CQy9YZ7a0Ba4pXdxJTPBP//ZxkQ=;
        b=CoriiBbIO+cay9u5GmT76eX/S3O9eKcL/1Qns86lEQfDib0pIm2rwj2C7axDE5OgoE
         GLBSRzCthz+TZZZr9EPc6M8WokGSUBnqOngcf25jjzTcfsRwJgdvsEJ1tnwfgbHXaLUM
         Sg5F3u8vKK4fA0CzdJemkt2xr2am+5wgNh7njdy7nvsO13xyDpyhchnmzqhgVFwlFct1
         b+Xy93NwudBBSXmGZWAiA0lAfdMmV4JsVdfhQRT92/Ew5vtdhR+rBkYva2ZVgQfHvCjS
         iYsenSw4h7cnGgz6ax1d7oflO9Spw95airjwMvgzNKUvpSobjgGX0ZyUm73wwZP2u1yK
         ydhA==
X-Gm-Message-State: AOJu0YwS8baC0DSqzQOfx9bEZznEUMUyehhZiQHM2mtE+dUbn4+dXCjg
        YRlQM0R8LFkY58OZEumhbpTWgw==
X-Google-Smtp-Source: AGHT+IHd1/56PSeqitQJGalEGxXcH26drQEeAdG2dzNVUp/FxWHNv/06+iWRebGIeZUvbnvpxSWWDA==
X-Received: by 2002:a05:6402:5154:b0:525:466c:5fda with SMTP id n20-20020a056402515400b00525466c5fdamr1836205edd.28.1692350969335;
        Fri, 18 Aug 2023 02:29:29 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.195])
        by smtp.gmail.com with ESMTPSA id e26-20020a056402149a00b005233deb30aesm857895edv.10.2023.08.18.02.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 02:29:28 -0700 (PDT)
Message-ID: <d1c285ff-5eef-4dae-dde0-8946162f19ac@linaro.org>
Date:   Fri, 18 Aug 2023 10:29:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 02/21] dmaengine: at_hdmac: Annotate struct at_desc with
 __counted_by
To:     Kees Cook <keescook@chromium.org>, Vinod Koul <vkoul@kernel.org>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Jie Hai <haijie1@huawei.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Green Wan <green.wan@sifive.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Yu Kuai <yukuai3@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jordy Zomer <jordy@pwning.systems>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
References: <20230817235428.never.111-kees@kernel.org>
 <20230817235859.49846-2-keescook@chromium.org>
Content-Language: en-US
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230817235859.49846-2-keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 8/18/23 00:58, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct at_desc.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: dmaengine@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/dma/at_hdmac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index b2876f67471f..b66c7f416881 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -239,7 +239,7 @@ struct at_desc {
>  	bool				memset_buffer;
>  	dma_addr_t			memset_paddr;
>  	int				*memset_vaddr;
> -	struct atdma_sg			sg[];
> +	struct atdma_sg			sg[] __counted_by(sglen);
>  };
>  
>  /*--  Channels  --------------------------------------------------------*/

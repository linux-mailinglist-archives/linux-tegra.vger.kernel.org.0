Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 196AD7A27B1
	for <lists+linux-tegra@lfdr.de>; Fri, 15 Sep 2023 22:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237024AbjIOUJo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 15 Sep 2023 16:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237269AbjIOUJh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Sep 2023 16:09:37 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0173630FD
        for <linux-tegra@vger.kernel.org>; Fri, 15 Sep 2023 13:08:31 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c43fe0c0bfso6264955ad.1
        for <linux-tegra@vger.kernel.org>; Fri, 15 Sep 2023 13:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808511; x=1695413311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=isVDFfcbmknUPWknowT7LS08Cb3UMEcuJeNo2USTgKI=;
        b=oHfSCuFFJh5f43jjMmzxr2ye9i62r9gUIGZ+ltWgzVvO7QyIamMvsHjlgDy/QDihjg
         79fpf7qy4YMzdkdPZDIoZuOmBNHctOy2AE83ufBXOrf+JZSzsMKRnCWi2/R9U89U/dZx
         oTc457eSKeDC7WtLP5z1+w/Z3k6G8uaV6hEh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808511; x=1695413311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isVDFfcbmknUPWknowT7LS08Cb3UMEcuJeNo2USTgKI=;
        b=kuto5luggg8ncqgXwFB66YbfEm4JZAWmCjZXbMb/TlRkkFyjF9mHkTKyLFjp9Oo0PV
         CV5hY/v/TzGQm4AVD5TwGK3QIOEwpDmoCdBPGhEqaXwUiUwxYh86GaNQONEf0dHuebfu
         qiivEoaGfp41SJ8RPNC02KuENLmn2JkCgAE2rBWi43nLrMezBMaace/1HbMNJhY0zgEt
         2LoHCmMGF8jpS34rzuJMIaB6Y9xO30DtJzUTZfe4JhspvG0M/ZqRtwjGn45VXUfDE6oh
         BHghypyv8B1xh1jdRd81Oz0xgNjkObIUePOlaL7Nhcw0wu1+F/0VxDNWSWBjZnlktjl4
         fZnQ==
X-Gm-Message-State: AOJu0YwgWsBSOn+mVlWmotxnssJ9S5+qLpHlsMbHuOtlTk9yFri53xQ1
        QwZFQLEyGSox97Me6xDj8O2pEQ==
X-Google-Smtp-Source: AGHT+IFm1+jtAdP9L1K8FAr0YTZKF7Q+zfhuSjHQY9X6olemmW7O/o5ALrmJsBZbi3qT/JSSHdFxlQ==
X-Received: by 2002:a17:902:ce85:b0:1bc:5924:2da2 with SMTP id f5-20020a170902ce8500b001bc59242da2mr3104460plg.56.1694808511445;
        Fri, 15 Sep 2023 13:08:31 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a5-20020a1709027d8500b001b896686c78sm3845010plm.66.2023.09.15.13.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:08:30 -0700 (PDT)
Date:   Fri, 15 Sep 2023 13:08:30 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
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
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 00/21] dmaengine: Annotate with __counted_by
Message-ID: <202309151307.F3341BD5A@keescook>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

Just a ping on the series... how do these look to you, Vinod?

If you want I can carry them in my tree. Please let me know.

Thanks!

-Kees

On Thu, Aug 17, 2023 at 04:58:37PM -0700, Kees Cook wrote:
> Hi,
> 
> This annotates several structures with the coming __counted_by attribute
> for bounds checking of flexible arrays at run-time. For more details, see
> commit dd06e72e68bc ("Compiler Attributes: Add __counted_by macro").
> 
> Thanks!
> 
> -Kees
> 
> Kees Cook (21):
>   dmaengine: apple-admac: Annotate struct admac_data with __counted_by
>   dmaengine: at_hdmac: Annotate struct at_desc with __counted_by
>   dmaengine: axi-dmac: Annotate struct axi_dmac_desc with __counted_by
>   dmaengine: fsl-edma: Annotate struct fsl_edma_desc with __counted_by
>   dmaengine: hisilicon: Annotate struct hisi_dma_dev with __counted_by
>   dmaengine: moxart-dma: Annotate struct moxart_desc with __counted_by
>   dmaengine: qcom: bam_dma: Annotate struct bam_async_desc with
>     __counted_by
>   dmaengine: sa11x0: Annotate struct sa11x0_dma_desc with __counted_by
>   dmaengine: sf-pdma: Annotate struct sf_pdma with __counted_by
>   dmaengine: sprd: Annotate struct sprd_dma_dev with __counted_by
>   dmaengine: st_fdma: Annotate struct st_fdma_desc with __counted_by
>   dmaengine: stm32-dma: Annotate struct stm32_dma_desc with __counted_by
>   dmaengine: stm32-mdma: Annotate struct stm32_mdma_desc with
>     __counted_by
>   dmaengine: stm32-mdma: Annotate struct stm32_mdma_device with
>     __counted_by
>   dmaengine: tegra: Annotate struct tegra_dma_desc with __counted_by
>   dmaengine: tegra210-adma: Annotate struct tegra_adma with __counted_by
>   dmaengine: ti: edma: Annotate struct edma_desc with __counted_by
>   dmaengine: ti: omap-dma: Annotate struct omap_desc with __counted_by
>   dmaengine: uniphier-xdmac: Annotate struct uniphier_xdmac_desc with
>     __counted_by
>   dmaengine: uniphier-xdmac: Annotate struct uniphier_xdmac_device with
>     __counted_by
>   dmaengine: usb-dmac: Annotate struct usb_dmac_desc with __counted_by
> 
>  drivers/dma/apple-admac.c      |  2 +-
>  drivers/dma/at_hdmac.c         |  2 +-
>  drivers/dma/dma-axi-dmac.c     |  5 ++---
>  drivers/dma/fsl-edma-common.h  |  2 +-
>  drivers/dma/hisi_dma.c         |  2 +-
>  drivers/dma/moxart-dma.c       |  5 ++---
>  drivers/dma/qcom/bam_dma.c     |  2 +-
>  drivers/dma/sa11x0-dma.c       |  6 +++---
>  drivers/dma/sf-pdma/sf-pdma.h  |  2 +-
>  drivers/dma/sh/usb-dmac.c      |  2 +-
>  drivers/dma/sprd-dma.c         |  2 +-
>  drivers/dma/st_fdma.h          |  2 +-
>  drivers/dma/stm32-dma.c        | 11 ++++-------
>  drivers/dma/stm32-mdma.c       |  9 ++++-----
>  drivers/dma/tegra186-gpc-dma.c |  2 +-
>  drivers/dma/tegra210-adma.c    |  2 +-
>  drivers/dma/ti/edma.c          |  2 +-
>  drivers/dma/ti/omap-dma.c      |  5 ++---
>  drivers/dma/uniphier-xdmac.c   |  8 ++++----
>  19 files changed, 33 insertions(+), 40 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
Kees Cook

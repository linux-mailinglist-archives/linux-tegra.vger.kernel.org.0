Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8D07688D5A
	for <lists+linux-tegra@lfdr.de>; Fri,  3 Feb 2023 03:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbjBCCwg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 2 Feb 2023 21:52:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbjBCCwf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Feb 2023 21:52:35 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB126811C
        for <linux-tegra@vger.kernel.org>; Thu,  2 Feb 2023 18:52:34 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id qw12so11777397ejc.2
        for <linux-tegra@vger.kernel.org>; Thu, 02 Feb 2023 18:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=luv07tBojTy7MY/o/x6jvDqHfjxZ27LUynL/zLyVKVU=;
        b=qRqNR8+nyEtLHlZsejQjsKv1LXzYBM9Rw+XvcEOL2I9GdUGMFq474nl8SljoN3hJD0
         4PagynT8yAuquNNgWmlcGwxzp8XPIZ4smQqcy9NueLPNKkCY4xAZP8tClgdbmh4KwFRB
         x2nscpp2uaBVoOT8z17atSE3o2M+TkTzYS2y+LIth93HBoxfq0hn5sW4pCz24ymSgzif
         IxU12SzVyauGvn2FU8Hv3Du6+qJLnRPMEdNh6UwbMYNpYjxiPjhFGeQb2pEu6e6v2uEb
         wyYJP8Kori99MNH+4DigXEknMfzoMObOUzT/NS/5IQ0QDmvDDML+DaQPpYSo/H7em8+z
         1V9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=luv07tBojTy7MY/o/x6jvDqHfjxZ27LUynL/zLyVKVU=;
        b=Pcxj5lyeglmnpjvV4RmXr1hWO48dTxdppXZaZi+oHpCBqPJFbXchhE4A373G3eUm7L
         jPBUxo9bHKr3qa3KXQ/xsToM6LHYsoO+9QEz3p15gZpiRa7DpWB6ZrX2DGH8e+uuKGuw
         Heegql0GYyorUuXU+aOS8YCABfbGVnTwo+SYbz0n+9GfJfLijhlUB7IEOLDj1KTUTnPe
         cIehk8GIMxnkTpABWrRWyPG3Xi4U1HZaGIZhd5jmDQB+m9131woL/yk7vH6gI4gZQxEH
         6izr80FFgZiqS+2cnTlu/MxFxQndmJcnESRqV0CCSABSTVbGAElpc1V3UfA4cswxCjKL
         231g==
X-Gm-Message-State: AO0yUKWWcdTbmToK4Lvu5Jtr1Dy62KCs1jbp9WWWghBoNbg3tmJzlKoW
        MeWyrQRXiXf/VOtluFMg/1jN3Q==
X-Google-Smtp-Source: AK7set+2Q+lIS7/A1H+HmFJ2+W4s8LEh9MtAQWMxacurGlMZL52NZgqFm+ulHrvoRV0ikL9R7NN3aQ==
X-Received: by 2002:a17:906:261b:b0:887:d8b0:27c5 with SMTP id h27-20020a170906261b00b00887d8b027c5mr9757802ejc.52.1675392752756;
        Thu, 02 Feb 2023 18:52:32 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id rn26-20020a170906d93a00b008845c668408sm655770ejb.169.2023.02.02.18.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 18:52:32 -0800 (PST)
Message-ID: <3e46ab75-9b46-415e-0585-29523c5277b1@linaro.org>
Date:   Fri, 3 Feb 2023 03:52:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 06/23] interconnect: qcom: rpm: fix probe child-node error
 handling
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20230201101559.15529-1-johan+linaro@kernel.org>
 <20230201101559.15529-7-johan+linaro@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230201101559.15529-7-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 1.02.2023 11:15, Johan Hovold wrote:
> Make sure to clean up and release resources properly also in case probe
> fails when populating child devices.
> 
> Fixes: e39bf2972c6e ("interconnect: icc-rpm: Support child NoC device probe")
> Cc: stable@vger.kernel.org      # 5.17
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/interconnect/qcom/icc-rpm.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
> index df3196f72536..91778cfcbc65 100644
> --- a/drivers/interconnect/qcom/icc-rpm.c
> +++ b/drivers/interconnect/qcom/icc-rpm.c
> @@ -541,8 +541,11 @@ int qnoc_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, qp);
>  
>  	/* Populate child NoC devices if any */
> -	if (of_get_child_count(dev->of_node) > 0)
> -		return of_platform_populate(dev->of_node, NULL, NULL, dev);
> +	if (of_get_child_count(dev->of_node) > 0) {
> +		ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> +		if (ret)
> +			goto err;
> +	}
>  
>  	return 0;
>  err:

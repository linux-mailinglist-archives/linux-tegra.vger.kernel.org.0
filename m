Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42B5C688D8E
	for <lists+linux-tegra@lfdr.de>; Fri,  3 Feb 2023 03:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbjBCC51 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 2 Feb 2023 21:57:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232055AbjBCC50 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Feb 2023 21:57:26 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC679611DB
        for <linux-tegra@vger.kernel.org>; Thu,  2 Feb 2023 18:57:00 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id dr8so11654601ejc.12
        for <linux-tegra@vger.kernel.org>; Thu, 02 Feb 2023 18:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ok9gGPenaG0pOj9GcctZNAhyR0+is7FwD5tHMljl+c=;
        b=DonLghx99ZLKNMokYG8i+JU5yhLe+vdPRewmYK7mYHqkScsddLoX0iIzLtxb/TjQU9
         Ge/RtIIGtygzVW3O0URyBA4FiMYP2qMH/9BYP0leBcQd/Tv8VpjO6+VyhhOvW2CeJ+rd
         mUmkwrYpgbuwbsV42yR6eR1Ex7cJbL5ooXZNKEqPL71p5EH5+SBVQ7shL4rmn9hUpyO/
         lLVtI2bRxUGmgbt1Ng7X3FZWf5yWqOLNqDgFopo+/6ySkzgGVlTGSbYxrrwC2/Q/qgIN
         kp34koKN48KM+sVgboXPPavRVkUuQRzsFPdfH0vEuljvHmqMXbWYpr+jAtsv8hLmn3dI
         dOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ok9gGPenaG0pOj9GcctZNAhyR0+is7FwD5tHMljl+c=;
        b=kT6JPf0K/o2eP0m8yQDexioYfNx88elTaJI+fExqDgplEy6N7lkaQCJqfGSP/+rLDv
         tE2cVxL7qsLt3LjedNmkARSdLMHv4zq0zU1cgJNpmhj2VZkTC6v+sTPRlUm9ppoeeuXC
         vcM9Z2REbfXqOBhAwxIJR7P05RAk2bkK0UYLQftgm+Y/hjk/M0qMF2XbD9YPSyVMpqdD
         Fdo9o8TjYWoaPOQhz2AaxehPiBKbd4GFsFVwovac5PR72kP2sZ5zg5aMqI609I9LgIqG
         z9fH+ma2IRIkAJ34p/Z3h5EFOfV8XaiiUT2qVSphhNUNpEGu5DjJpryRTvrxeqf9YRor
         DxKA==
X-Gm-Message-State: AO0yUKV6aWe6QFZ/JUAB59WfpvglcZyGIER4aGVhF/H3quY+Z7I875jj
        /jGyy8/04AmtNl+tOFw2GU2v9Q==
X-Google-Smtp-Source: AK7set/Byn6DoU49uWxDMQUBshfAhbUWyxEUatb8mJo23NUaNotYcfd4KJmg2Qvd0ixB+R/ypE+Eiw==
X-Received: by 2002:a17:907:d08a:b0:883:258d:2951 with SMTP id vc10-20020a170907d08a00b00883258d2951mr437179ejc.4.1675393018937;
        Thu, 02 Feb 2023 18:56:58 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id v9-20020a17090690c900b0088879b211easm677117ejw.69.2023.02.02.18.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 18:56:58 -0800 (PST)
Message-ID: <e0692f25-7114-530e-601c-fa2154fc2347@linaro.org>
Date:   Fri, 3 Feb 2023 03:56:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 12/23] interconnect: qcom: sm8450: fix registration race
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
        stable@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
References: <20230201101559.15529-1-johan+linaro@kernel.org>
 <20230201101559.15529-13-johan+linaro@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230201101559.15529-13-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 1.02.2023 11:15, Johan Hovold wrote:
> The current interconnect provider registration interface is inherently
> racy as nodes are not added until the after adding the provider. This
> can specifically cause racing DT lookups to fail.
> 
> Switch to using the new API where the provider is not registered until
> after it has been fully initialised.
> 
> Fixes: fafc114a468e ("interconnect: qcom: Add SM8450 interconnect provider driver")
> Cc: stable@vger.kernel.org      # 5.17
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/interconnect/qcom/sm8450.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/sm8450.c b/drivers/interconnect/qcom/sm8450.c
> index e3a12e3d6e06..c7a8bbf102a3 100644
> --- a/drivers/interconnect/qcom/sm8450.c
> +++ b/drivers/interconnect/qcom/sm8450.c
> @@ -1876,9 +1876,10 @@ static int qnoc_probe(struct platform_device *pdev)
>  	provider->pre_aggregate = qcom_icc_pre_aggregate;
>  	provider->aggregate = qcom_icc_aggregate;
>  	provider->xlate_extended = qcom_icc_xlate_extended;
> -	INIT_LIST_HEAD(&provider->nodes);
>  	provider->data = data;
>  
> +	icc_provider_init(provider);
> +
>  	qp->dev = &pdev->dev;
>  	qp->bcms = desc->bcms;
>  	qp->num_bcms = desc->num_bcms;
> @@ -1887,12 +1888,6 @@ static int qnoc_probe(struct platform_device *pdev)
>  	if (IS_ERR(qp->voter))
>  		return PTR_ERR(qp->voter);
>  
> -	ret = icc_provider_add(provider);
> -	if (ret) {
> -		dev_err(&pdev->dev, "error adding interconnect provider\n");
> -		return ret;
> -	}
> -
>  	for (i = 0; i < qp->num_bcms; i++)
>  		qcom_icc_bcm_init(qp->bcms[i], &pdev->dev);
>  
> @@ -1905,7 +1900,7 @@ static int qnoc_probe(struct platform_device *pdev)
>  		node = icc_node_create(qnodes[i]->id);
>  		if (IS_ERR(node)) {
>  			ret = PTR_ERR(node);
> -			goto err;
> +			goto err_remove_nodes;
>  		}
>  
>  		node->name = qnodes[i]->name;
> @@ -1919,12 +1914,17 @@ static int qnoc_probe(struct platform_device *pdev)
>  	}
>  	data->num_nodes = num_nodes;
>  
> +	ret = icc_provider_register(provider);
> +	if (ret)
> +		goto err_remove_nodes;
> +
>  	platform_set_drvdata(pdev, qp);
>  
>  	return 0;
> -err:
> +
> +err_remove_nodes:
>  	icc_nodes_remove(provider);
> -	icc_provider_del(provider);
> +
>  	return ret;
>  }
>  
> @@ -1932,8 +1932,8 @@ static int qnoc_remove(struct platform_device *pdev)
>  {
>  	struct qcom_icc_provider *qp = platform_get_drvdata(pdev);
>  
> +	icc_provider_deregister(&qp->provider);
>  	icc_nodes_remove(&qp->provider);
> -	icc_provider_del(&qp->provider);
>  
>  	return 0;
>  }

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF7068652B
	for <lists+linux-tegra@lfdr.de>; Wed,  1 Feb 2023 12:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbjBALQ6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 1 Feb 2023 06:16:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbjBALQ4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Feb 2023 06:16:56 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9ED4941D
        for <linux-tegra@vger.kernel.org>; Wed,  1 Feb 2023 03:16:55 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id m2so49908852ejb.8
        for <linux-tegra@vger.kernel.org>; Wed, 01 Feb 2023 03:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nUrDb3EKbEwP1E+cTaz4aoYhl8shzIQnqUH5alCaiS4=;
        b=CBZPUQGhVvP6T/uXZYCqwU9h2SJ8G56BHcnskNnJ4P0subv/PysGZm16NTqJX1rNSa
         G9qxcy8HOE9gDyCRrxRyRM5n2HElWKS9VoU6rRRLzNkUrYYjn18cQ+QAeZY/agndj2er
         Ma39+WR3sTZ86HZeCDTAe6bLAazBG7aNtTDkQ4dERuKaRm1/irT2MrLCHGvVmA6naIyO
         wXn6L0Un4Hw/JsoKwLHyFJCDa28qry65QnVV2J+JrVksf2q3sdiEn+AjHo2eRJd7+MpF
         +QRfN6Mrbva9jAyigyKP/BWMnZkT7Eyxaq7IP1XZ+cI7JT9U/L3de8S84po2NEGfML3o
         vyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nUrDb3EKbEwP1E+cTaz4aoYhl8shzIQnqUH5alCaiS4=;
        b=EnOwd4v7tZ2mQU+/Ftgz5ZKWN14gqkYTgLQacDAMZbvGS9JOK7D5PZNrRTBeLEQCNE
         /Sk5gNLp4XlQySkxWhbVAwralfQLHGwODEu0hfwWjK2uOKYecRsv5fDuFmwg1F/bxQgT
         xuR7r6U/AR3/qI9Zq+ZFjstLqh2z7/qk+Y+uHTztVrS61b9asL3Kl/qvBGTtymo/q0o5
         BeCXoXUUKYvKUasR6oBqBboBSj90jGEH4uB9fq0OPxf/h6hd2qUo3+5NVy93A6px/BY3
         eNzQXtY+NwUodN/0h0RhF+RpAuJPF8s0G6wu0oHtxBK7yDP3Dd67w6AQ7dC4GIK9WczJ
         NJQg==
X-Gm-Message-State: AO0yUKWAoKA+0Ffe4gixpU1zjRRkBth9rwHjwhWx42guzTVRNM8OXKeT
        s9eHq+MlIa0TIA8i2lzECisO0A==
X-Google-Smtp-Source: AK7set8nZ5tenjhJ1UYP/fKSzZRqpA5VSaBodwJMTzJ2q15pnSFNExgvYIEYEGfWJP3FuMhx61MO4w==
X-Received: by 2002:a17:906:ae5a:b0:878:81d7:9f6f with SMTP id lf26-20020a170906ae5a00b0087881d79f6fmr1945277ejb.67.1675250213863;
        Wed, 01 Feb 2023 03:16:53 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id w5-20020a1709061f0500b0086a2e31d1c1sm9832739ejj.28.2023.02.01.03.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 03:16:53 -0800 (PST)
Message-ID: <9b7813d0-ec4e-a4a1-168f-de0797bcdf64@linaro.org>
Date:   Wed, 1 Feb 2023 12:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 02/23] interconnect: fix icc_provider_del() error handling
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
 <20230201101559.15529-3-johan+linaro@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230201101559.15529-3-johan+linaro@kernel.org>
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
> The interconnect framework currently expects that providers are only
> removed when there are no users and after all nodes have been removed.
> 
> There is currently nothing that guarantees this to be the case and the
> framework does not do any reference counting, but refusing to remove the
> provider is never correct as that would leave a dangling pointer to a
> resource that is about to be released in the global provider list (e.g.
> accessible through debugfs).
> 
> Replace the current sanity checks with WARN_ON() so that the provider is
> always removed.
I spent a considerable amount of time scratching my head what WARN_ON has
to do with removing list items.. I suppose "don't return early and replace
pr_warn with WARN_ON" would have been clearer, but maybe that's just me
in the morning..

> 
> Fixes: 11f1ceca7031 ("interconnect: Add generic on-chip interconnect API")
> Cc: stable@vger.kernel.org      # 5.1: 680f8666baf6: interconnect: Make icc_provider_del() return void
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/interconnect/core.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
> index dc61620a0191..43c5c8503ee8 100644
> --- a/drivers/interconnect/core.c
> +++ b/drivers/interconnect/core.c
> @@ -1062,18 +1062,8 @@ EXPORT_SYMBOL_GPL(icc_provider_add);
>  void icc_provider_del(struct icc_provider *provider)
>  {
>  	mutex_lock(&icc_lock);
> -	if (provider->users) {
> -		pr_warn("interconnect provider still has %d users\n",
> -			provider->users);
> -		mutex_unlock(&icc_lock);
> -		return;
> -	}
> -
> -	if (!list_empty(&provider->nodes)) {
> -		pr_warn("interconnect provider still has nodes\n");
> -		mutex_unlock(&icc_lock);
> -		return;
> -	}
> +	WARN_ON(provider->users);
> +	WARN_ON(!list_empty(&provider->nodes));
>  
>  	list_del(&provider->provider_list);
>  	mutex_unlock(&icc_lock);

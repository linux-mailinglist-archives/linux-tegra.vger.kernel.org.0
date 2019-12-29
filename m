Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7639112BFEB
	for <lists+linux-tegra@lfdr.de>; Sun, 29 Dec 2019 02:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfL2B7J (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 28 Dec 2019 20:59:09 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37187 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfL2B7J (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 28 Dec 2019 20:59:09 -0500
Received: by mail-pl1-f195.google.com with SMTP id c23so13306485plz.4
        for <linux-tegra@vger.kernel.org>; Sat, 28 Dec 2019 17:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=B0YqCZdtASo8W3+DNsZKxEkKUnEoAfpsuE3h6bg+BKA=;
        b=SUBvHzkDy3ObczV/2Tibqb/J+Bch+J+BkQLTRD7VEq1pgSLY5siprwnL8ItHD8F9X0
         CLYNPAl6cuX+YtWyUz4Jv6O3q5S6xdwYdxId7gchqdvDjxrpI174YpeyGAVnq5OCLnYu
         mjnk8FJDiqHP2OyS9LeyMpUTtRHfWnHiSWEIuaxjubiE/JKwwlviZBeCb1t/7K0h+fYh
         0vjWt+KfOtPAEGUy76eHmG3OAfy6XCIgbDlBxBVQINB4iZl4afyF3PioZAzKOKODRE1X
         oQLqq8b0HCjpBZ3AJYpqPIprChvuIUnjenWvUp0O9V64bXJNy2P1yqNwOkoX6pEoUsOG
         rZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=B0YqCZdtASo8W3+DNsZKxEkKUnEoAfpsuE3h6bg+BKA=;
        b=LX4MuznhHbmyFSFgZ/i5ohjgkDUwSHj4Nif2n181VIJsNVjNJ7/e/jA66x9bchZtxb
         jjyo9l75RuoYYlJwASmkBZLd69Tt+lxaIHLDgxFyfTziOiO0KitZvf/cLrsgEoBE24ba
         43gk+S0nAnUey4/3Srm8U9aL2MQP0vUwL4cT/vCU3Yh0h3fDitmr11TTQ78qSNQWsWqW
         LzdvRCFemMuM5RV6VUM0ZShjiRo7wrKzNXzCK7G9mDDcytHq1k4/N9Opc4kqMSsz3QKG
         nciW0xukMa493wQ/koj/DP1s5seqVJPUV/o5pkD44Ggs0AfzXYI9CIjc0TzcJLRgQ+IY
         +Vdg==
X-Gm-Message-State: APjAAAWo5Z/LsFpN2y4ps49bapAPMtKJmWxU+EIl/XO0RwoFntY5qQyn
        AlqC6BUdGSF10UVHCs1aSnJUiw==
X-Google-Smtp-Source: APXvYqwFD0Z6M2ULKf78TvessQAN+owraVNT/WM/LcoBIbydcpRlk+A9rbJjuwmOeeAvLemOFIwgmw==
X-Received: by 2002:a17:90b:d94:: with SMTP id bg20mr34993201pjb.99.1577584748559;
        Sat, 28 Dec 2019 17:59:08 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p185sm46804599pfg.61.2019.12.28.17.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2019 17:59:07 -0800 (PST)
Date:   Sat, 28 Dec 2019 17:59:04 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Yangtao Li <tiny.windzz@gmail.com>
Cc:     jassisinghbrar@gmail.com, nsaenzjulienne@suse.de,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, lftan@altera.com,
        matthias.bgg@gmail.com, agross@kernel.org,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        nios2-dev@lists.rocketboards.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 03/13] mailbox: qcom-apcs: convert to
 devm_platform_ioremap_resource
Message-ID: <20191229015904.GG3755841@builder>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
 <20191228183538.26189-3-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191228183538.26189-3-tiny.windzz@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat 28 Dec 10:35 PST 2019, Yangtao Li wrote:

> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index eeebafd546e5..0faf69137780 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -49,7 +49,6 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  {
>  	struct qcom_apcs_ipc *apcs;
>  	struct regmap *regmap;
> -	struct resource *res;
>  	unsigned long offset;
>  	void __iomem *base;
>  	unsigned long i;
> @@ -64,8 +63,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  	if (!apcs)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(&pdev->dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -- 
> 2.17.1
> 

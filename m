Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6D9434FE4
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Jun 2019 20:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbfFDSf6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Jun 2019 14:35:58 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38795 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbfFDSf5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Jun 2019 14:35:57 -0400
Received: by mail-lf1-f68.google.com with SMTP id b11so17213997lfa.5
        for <linux-tegra@vger.kernel.org>; Tue, 04 Jun 2019 11:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dMJzSs7Yqve4iTATuXAR2qrhZwmQvSvCLABWckgDtq4=;
        b=r+sFj0dAXWKVr4O925lG3dJa+5R7gcBrn604Bl2my/fR1d3/vU8djnB3cNFpnPlPWw
         h7qb/HuGYoxFopunuEMdQ5z/jRHLkWKJsGvOkc6BbqsELF08Z4JEAmLUGXnmavlVhwNc
         oEPXg0WeAllXe8J8Y2kkwxxYXAlEe0Fiay+DkB2T2YpVCdsyU6EO0uDbNXt35Pky+6GB
         Est4s8mB4TSIUKjLEStVmDZ+zin5zyDz2GWLVAFu+FuDXK0YCsc0+uuXAnnuGVT/zwWW
         a4sjUnS5IT0jemU4eoRnuXudhKRL7myfZg0pY1SwyqmEjGSeH8e4mKRJvaCGv6YWoLb6
         kx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dMJzSs7Yqve4iTATuXAR2qrhZwmQvSvCLABWckgDtq4=;
        b=SopZm5C/T4xkJuEtC6fFfrT5Qgv38eU3ljG3oOIoXVHwb4wRqkKiRbw1+bvjqoBjIf
         Hj9hNvyjRoADtrqPgaiTsrsox1lahlFsiyjPec6PsGxu64NXExlv/MTwQF7WewAcC966
         O4uREmSnaHvScglFJU4dTOyivmUWb8y8SAtoPSCwMItWGe3IEglHOm4A+51DRbSyxR6I
         jXhgJxBJLK1iDAUNd8zvvfNUpWw3blxLt5kcHp2XUMedU/dJkeFH6utRD6+32l8Kw1yi
         m2CEUXsD8SZcUDOCW+VAhV+GJzoiceb+f1QFb8FWYhkP3Yay8uadIchXmIoJ8RwpLrum
         wsTw==
X-Gm-Message-State: APjAAAUrFYW5L+5oBvtRqLCbrrzN7vQY532RnHrwK6C/3UmvrCXR4osx
        0esxsn9gOxPqKIj8EdPb10Y=
X-Google-Smtp-Source: APXvYqwpghucZ89udqWXy2FzZ4WdQIq3J6IMGaQULw5YrOnf5jrqzn5o/uFfgW5tlKHzLcy1PD3CZg==
X-Received: by 2002:a19:4a49:: with SMTP id x70mr4901270lfa.151.1559673355500;
        Tue, 04 Jun 2019 11:35:55 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id d10sm3824313lfn.91.2019.06.04.11.35.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 11:35:54 -0700 (PDT)
Subject: Re: [PATCH] gpu: host1x: Do not output error message for deferred
 probe
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20190604153150.22265-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a96b1738-9f7f-69c6-ec44-bc9a355a620a@gmail.com>
Date:   Tue, 4 Jun 2019 21:35:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190604153150.22265-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.06.2019 18:31, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> When deferring probe, avoid logging a confusing error message. While at
> it, make the error message more informational.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/host1x/dev.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index c55e2d634887..5a3f797240d4 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -247,8 +247,11 @@ static int host1x_probe(struct platform_device *pdev)
>  
>  	host->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(host->clk)) {
> -		dev_err(&pdev->dev, "failed to get clock\n");
>  		err = PTR_ERR(host->clk);
> +
> +		if (err != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "failed to get clock: %d\n", err);
> +
>  		return err;
>  	}

The clock driver should be available at the time of host1x's probing on
all Tegra's because it is one of essential core drivers that become
available early during boot.

I guess you're making this change for T186, is it because the BPMP
driver's probe getting deferred? If yes, won't it be possible to fix the
defer of the clock driver instead of making such changes in all of the
affected drivers?

[it appeared to me that first email got dropped by gmail, so I'm
re-sending it second time just in a case]

-- 
Dmitry

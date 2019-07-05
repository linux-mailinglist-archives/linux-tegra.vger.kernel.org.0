Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B74BB6060F
	for <lists+linux-tegra@lfdr.de>; Fri,  5 Jul 2019 14:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbfGEMkY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 5 Jul 2019 08:40:24 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40543 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728898AbfGEMkY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 Jul 2019 08:40:24 -0400
Received: by mail-ot1-f65.google.com with SMTP id e8so8909391otl.7
        for <linux-tegra@vger.kernel.org>; Fri, 05 Jul 2019 05:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kh734GQAOHG1UpY17xEI2o1yu9kYpFamhX1CJVle/PY=;
        b=jx0baOOqQJA11G9mT7UCNY6F5L2AwD+PA3hOWXOKDOpgv7onJ5Vr9jeqbQv1AaY4X/
         A2W3+6Fls4oaR8JMVRsuvG3HtU4rxvaxP1NVy8/z9WvnS5fAkPrB1jt/P24LYmXsQ1oC
         RvlYi6MvYl9jMQbvv2cFjOaL+12vH7xVvVY7Mi91P5yb6jBnwk38VWWYAB+1rZyj9HRC
         70nyoHVYXE73AWZ6x4rJHiSAInmDg/ZI13abxkqKMqZBMWMza63SxMEZPG0msIaaqVQ0
         gx0pfL2crbZ0z0L3xJ0vQSk8N2JA1+mf4jag0lae19tlXoBYYNs3N/FwvlWqbReQy8jj
         5jMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kh734GQAOHG1UpY17xEI2o1yu9kYpFamhX1CJVle/PY=;
        b=EnMSkc2OqLQ+T1HzpC7Dx6hGmgrq3rOtg5vt5i8KJQ30rLcw55b+GarEjF8XtnB/dd
         VrjRMJohyU7j1CK8N2HwlMr3W4Jbb+V2cTVc9jdss5IbqGM9YA+cmdCGg8VyUiW72Xmt
         79F1XYz9UYc+gNtVNm4tYLUn/vShMxDWSOBbCm5F/am4BR2qwP40rq1rdO0Taxd5hTjR
         aBoHmezKAZ4TkZQ7yl6xCZ/hwTRQjFM9Ets1lxwTxu0SMka8nhjPrG4AkgGzwDVQMkfM
         uwWq7A2tOBc4oZEySUGS1OpQ/XYMSqY4+n03Y3xvIhOfGImXeIhM3Jc+upjb5VJ/Mw88
         Ed6A==
X-Gm-Message-State: APjAAAW0CZLC+z6Spt0oVqgyZA74nK08taGvDzPiGDizykVg8sVKZUAZ
        0273t86/kWtiAs3ymlMq6+JCefd7chUBZHVaiFKvlA==
X-Google-Smtp-Source: APXvYqwzcN3vHIJajZ5nQA+Q0EcRxvz2uhmK9Ypym75aCp0Fnsq772P4xs6/K2ETHLBXmeX/KMOMsaJ9dy7zdJDucYk=
X-Received: by 2002:a9d:7352:: with SMTP id l18mr2758476otk.292.1562330423731;
 Fri, 05 Jul 2019 05:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190705123220.54008-1-yuehaibing@huawei.com>
In-Reply-To: <20190705123220.54008-1-yuehaibing@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 5 Jul 2019 14:40:12 +0200
Message-ID: <CAMpxmJVZHJKQ7bbHo=T9R99qguF315bZ=YVRrCdqti2SyzAnDg@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra: Fix build error without CONFIG_DEBUG_FS
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

pt., 5 lip 2019 o 14:34 YueHaibing <yuehaibing@huawei.com> napisa=C5=82(a):
>
> If CONFIG_DEBUG_FS is not set, building fails:
>
> drivers/gpio/gpio-tegra.c: In function tegra_gpio_probe:
> drivers/gpio/gpio-tegra.c:665:2: error: implicit declaration of function =
debugfs_create_file;
>  did you mean bus_create_file? [-Werror=3Dimplicit-function-declaration]
>   debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
>   ^~~~~~~~~~~~~~~~~~~
>   bus_create_file
> drivers/gpio/gpio-tegra.c:666:9: error: tegra_dbg_gpio_fops undeclared (f=
irst use in this function);
>  did you mean tegra_gpio_pm_ops?
>         &tegra_dbg_gpio_fops);
>          ^~~~~~~~~~~~~~~~~~~
>          tegra_gpio_pm_ops
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: a4de43049a1d ("gpio: tegra: Clean-up debugfs initialisation")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpio/gpio-tegra.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 59b99d8..40fd6bd 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -662,8 +662,10 @@ static int tegra_gpio_probe(struct platform_device *=
pdev)
>                 }
>         }
>
> +#ifdef CONFIG_DEBUG_FS
>         debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
>                             &tegra_dbg_gpio_fops);
> +#endif
>
>         return 0;
>  }
> --
> 2.7.4
>
>

Nack, there are inline stubs for all debugfs functions in
./include/linux/debugfs.h if CONFIG_DEBUG_FS is not selected. Just
move the #include <linux/debugfs.h> to the top of the source file.

Bart

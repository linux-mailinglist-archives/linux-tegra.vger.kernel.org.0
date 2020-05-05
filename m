Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5F751C5D42
	for <lists+linux-tegra@lfdr.de>; Tue,  5 May 2020 18:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbgEEQTJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 5 May 2020 12:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729251AbgEEQTJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 May 2020 12:19:09 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D22C061A10
        for <linux-tegra@vger.kernel.org>; Tue,  5 May 2020 09:19:09 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id i68so2429124qtb.5
        for <linux-tegra@vger.kernel.org>; Tue, 05 May 2020 09:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A/Wm3UHNM4qlX8DljPnma9j6lm5XESNuL8D71GdjV38=;
        b=1UfbGhRxXGz3GBtcxR9UNxM68oHkaj/WYVq1O0d/Pzl/wG0nhFdC8YkkSQk7lAfdvH
         5Ak4p4yujEG9sGUn6s8vbQyWJjfBr+jTiWZjH3JkLVJOPH/X0sby/bdWoNE24sm7Ct4u
         FWKT/jmiSIkJO/Tpqt2U+UXw5gSxKbmkry5EDE6mxveyCwgCeSprywvT2XvZob4BTVa/
         e04gJRelogulBVELpi7p7SvrDBnpA/8MZPhnhM+bIV42lT15R3Gjgt1c013K60Yne6VP
         yUpOU4KuQeRRl4T2kKhdlnbD9rTCeGeHobk3zfQ7ulhjY3A0zHfntGGHxEsIfXdU2wvt
         2qLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A/Wm3UHNM4qlX8DljPnma9j6lm5XESNuL8D71GdjV38=;
        b=pVJ1holzF6+yMO9r3kOI8Q7FViAg3ZnBDzSKq85jaUluAjPyCyV4bkYJPzrSovk3Cz
         DEJxUoX6F8u2SrxaO61BGjdM1Wh/SFXTMYFnTcrFYx+qjrZMT2qatFcAxSudB9H/Pq/k
         WhfgXLuuSnuzLRKilNT8js+qOGgMQyCg2TGW1gIn1/cW4JSA9w0OD3zVrpgGgrMjn+dF
         7XIZQmV6+T2lz+snTmCTxSfu9fPLxjnnEpbSWv5gQNOZTOtq67sC0ypbtAhlF5fySu9G
         X6cDNlA4hczEEfH/yPtMCAlRo4nKjpxaXbLnBfyeaWCrXqPd74PwG5EzJY8e7CG+HvIy
         RjjQ==
X-Gm-Message-State: AGi0PuYEopSVwoTDvbk3mgzA2+jDzYzfSWRKCGe3jAG20DPZ+2wNEOTh
        k3m5QHotuDzXCGQUboEQkRSK3Og9LNOSYzBTmpodNQ==
X-Google-Smtp-Source: APiQypLAizKoTqwFtOBKN/f1gzlwNVdkvxN9mo2b50TEgRtyqk55O3/9/e15NFeEPw0uW3ZQMHmqeBZnpb7i4CROJ3I=
X-Received: by 2002:ac8:346f:: with SMTP id v44mr3419058qtb.27.1588695548443;
 Tue, 05 May 2020 09:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200505084501.13170-1-ykaukab@suse.de>
In-Reply-To: <20200505084501.13170-1-ykaukab@suse.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 5 May 2020 18:18:57 +0200
Message-ID: <CAMpxmJXp9uZp=Q5Sm==_d720mg=aYSC1K1=V-P5Tz10gnLYuUQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra186: export MODULE_DEVICE_TABLE
To:     Mian Yousaf Kaukab <ykaukab@suse.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

wt., 5 maj 2020 o 10:45 Mian Yousaf Kaukab <ykaukab@suse.de> napisa=C5=82(a=
):
>
> Export MODULE_DEVICE_TABLE since the driver can be built as a module.
>
> Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
> ---
>  drivers/gpio/gpio-tegra186.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 79b553dc39a3..178e9128ded0 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -894,6 +894,7 @@ static const struct of_device_id tegra186_gpio_of_mat=
ch[] =3D {
>                 /* sentinel */
>         }
>  };
> +MODULE_DEVICE_TABLE(of, tegra186_gpio_of_match);
>
>  static struct platform_driver tegra186_gpio_driver =3D {
>         .driver =3D {
> --
> 2.25.0
>

Patch applied, thanks!

Bart

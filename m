Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC657B7E89
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Oct 2023 13:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233043AbjJDL7s (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 4 Oct 2023 07:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232936AbjJDL7s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Oct 2023 07:59:48 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03FFDBF
        for <linux-tegra@vger.kernel.org>; Wed,  4 Oct 2023 04:59:43 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-45269fe9d6bso1021155137.2
        for <linux-tegra@vger.kernel.org>; Wed, 04 Oct 2023 04:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696420782; x=1697025582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AACATPPHgIuz8FxZ7eCyvrDEuOEhlDx+Kvd4JOYuOA=;
        b=mAQOrt8gTZi0vq7sO1Xt+yd+As6o+i0usTWDB+j7z0PqkPrl5peGoHXfK+Mr/tWL9G
         FHtVkskJtcJbXsyxZ+V04CiyWyZgEo/WNozbtjd/7sjL5/f+iagaILqHbv8TJaFtlfVL
         P9PPfqJ5pV489Cz0iNVmumBfhlYlbRC5/WnnxDUfjSpnw+A2pC7hmFGVy4pzKIjhYfCB
         Ai7ymdGxKduCjHdvM4J7LvVkrdgcBUNMI5GVj0YxqFq4mIJAhVHbrlt4n+fCGQLtvMTN
         7JIbIsOPRF5yMci2nmdSF8FN82PecXEaZ13QnRAXiaM3Eiq9Q8zxtfqkQSjBeDJ9VMig
         22Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696420782; x=1697025582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6AACATPPHgIuz8FxZ7eCyvrDEuOEhlDx+Kvd4JOYuOA=;
        b=diod/hBSjflXnKtKsAcSU9mgt/spDfBPeprP/drxlhr8moRG2IIiqSb5Ft5CgKKGpB
         pcsTiZGzpABzNYu5LTG1DJ7DlZ7K6gAZ5jeMv0t8R7GLiJUXp3O72pwRe/4Xh8kGBG8f
         WhQXURvGcLvWczYjHeLHpdicNGoOT63rFdRDhwEtSANbyQWzc6fRsLKS/SRsPYBogWGQ
         E5q7+oNtuBxIy8+d9Hd7W5r1j0ZckCcY4MlaDK5ovLcfmaJZmRJ5XkBpThj6p4tBEdCk
         QSWK/LJF+op0CwE1YEJDu8pR6J4Rf+e7ForWcfwWbSuLGUsppoV1MxQ5kjRAnQoVXU6F
         L8pg==
X-Gm-Message-State: AOJu0Yw39Ngwfos1HtmCSWBNP6RW3YDjOWnXoAuuekqmeC6INSkQwvRP
        8xBOh634UYR/BAkjzpH0NDr3K3XtsYlWuvu3BRUa6g==
X-Google-Smtp-Source: AGHT+IHumK2wxKHooMcCivaS2pM5etsFaTr9cIpwm6I5vcIaNG/mZmLCE1Sz7hn/phh+XU0GX2azNlHCgSET25mhNNk=
X-Received: by 2002:a67:e3ab:0:b0:452:5798:64bd with SMTP id
 j11-20020a67e3ab000000b00452579864bdmr1197006vsm.35.1696420782057; Wed, 04
 Oct 2023 04:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-16-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-16-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Oct 2023 13:59:31 +0200
Message-ID: <CAMRc=MeBKovkC-VbvWNJWk_UjU4FGguEW7gy=L-2saA7kiPijQ@mail.gmail.com>
Subject: Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> gpiochip_find() is going away as it's not hot-unplug safe. This platform
> is not affected by any of the related problems as this GPIO controller
> cannot really go away but in order to finally remove this function, we
> need to convert it to using gpio_device_find() as well.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm/mach-omap1/board-ams-delta.c | 36 +++++++++++++--------------
>  1 file changed, 17 insertions(+), 19 deletions(-)
>
> diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/=
board-ams-delta.c
> index 9808cd27e2cf..a28ea6ac1eba 100644
> --- a/arch/arm/mach-omap1/board-ams-delta.c
> +++ b/arch/arm/mach-omap1/board-ams-delta.c
> @@ -560,22 +560,6 @@ static struct gpiod_lookup_table *ams_delta_gpio_tab=
les[] __initdata =3D {
>         &ams_delta_nand_gpio_table,
>  };
>
> -/*
> - * Some drivers may not use GPIO lookup tables but need to be provided
> - * with GPIO numbers.  The same applies to GPIO based IRQ lines - some
> - * drivers may even not use GPIO layer but expect just IRQ numbers.
> - * We could either define GPIO lookup tables then use them on behalf
> - * of those devices, or we can use GPIO driver level methods for
> - * identification of GPIO and IRQ numbers. For the purpose of the latter=
,
> - * defina a helper function which identifies GPIO chips by their labels.
> - */
> -static int gpiochip_match_by_label(struct gpio_chip *chip, void *data)
> -{
> -       char *label =3D data;
> -
> -       return !strcmp(label, chip->label);
> -}
> -
>  static struct gpiod_hog ams_delta_gpio_hogs[] =3D {
>         GPIO_HOG(LATCH2_LABEL, LATCH2_PIN_KEYBRD_DATAOUT, "keybrd_dataout=
",
>                  GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW),
> @@ -615,14 +599,28 @@ static void __init modem_assign_irq(struct gpio_chi=
p *chip)
>   */
>  static void __init omap_gpio_deps_init(void)
>  {
> +       struct gpio_device *gdev;
>         struct gpio_chip *chip;
>
> -       chip =3D gpiochip_find(OMAP_GPIO_LABEL, gpiochip_match_by_label);
> -       if (!chip) {
> -               pr_err("%s: OMAP GPIO chip not found\n", __func__);
> +       /*
> +        * Some drivers may not use GPIO lookup tables but need to be pro=
vided
> +        * with GPIO numbers. The same applies to GPIO based IRQ lines - =
some
> +        * drivers may even not use GPIO layer but expect just IRQ number=
s.
> +        * We could either define GPIO lookup tables then use them on beh=
alf
> +        * of those devices, or we can use GPIO driver level methods for
> +        * identification of GPIO and IRQ numbers.
> +        *
> +        * This reference will be leaked but that's alright as this devic=
e
> +        * never goes down.
> +        */
> +       gdev =3D gpio_device_find_by_label(OMAP_GPIO_LABEL);
> +       if (!gdev) {
> +               pr_err("%s: OMAP GPIO device not found\n", __func__);
>                 return;
>         }
>
> +       chip =3D gpio_device_get_chip(gdev);
> +
>         /*
>          * Start with FIQ initialization as it may have to request
>          * and release successfully each OMAP GPIO pin in turn.
> --
> 2.39.2
>

Patch applied, thanks!

Bart

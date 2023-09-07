Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF9B5797954
	for <lists+linux-tegra@lfdr.de>; Thu,  7 Sep 2023 19:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241480AbjIGRLW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 7 Sep 2023 13:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241570AbjIGRLV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 13:11:21 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 025551717
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 10:10:54 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1ccc0d2e697so840887fac.0
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 10:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694106599; x=1694711399; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYCw6MjcMH0VBXX64k2n7JI1Ap28j06fLMRRfYT33EM=;
        b=jtl6zH6Zin8a3BQDiGyZm/45rVOjLeCk7lji4xFmhw4EtiFzz+PuGfogGoL45xX2Pf
         3tBguL8qPbmuoAWdGL8TheYVPIRC8RLr9VL1uwMh0YNYPWZbNBXMOaCPsXPOtqWyNZXr
         6GhQJvqgqIiewJf/lyh1XgkTqwuSUpDSZVtJtzGBXHSxmZ+DeDFCU2kiQONTgWJzbJNv
         GWYZ7gOKuY+HdgOh/71CDrluFLloVyskmnHqd/ATbqpTMjo4Fx6y+TVH+eqTAusv9QWx
         gaeSAg2tsqyUgENZklEZtJAYMxqW9HTPTyDQ48I1fn3C/ckfMPu/yw+uhyeqWJoclxnU
         6RGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694106599; x=1694711399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYCw6MjcMH0VBXX64k2n7JI1Ap28j06fLMRRfYT33EM=;
        b=MF2LeISEvMrE8ES5Z38m4WTmnwoeKYpIZFFR+ln4pLNVudQCUt2dzp4RCgWLjwzrNc
         fqvZOdJHPGdwyRCMxJql7lmVJyVdlrB7YWFDR2WH5f3FqQCGzAzRvekh+3axZXusgNBz
         tEtB4hYP6xRIwaNiJcDnDR87ppMDLA39ilAaV82Pxm8k3ZRbnmDCotYpiClJZED6cT6Y
         QQt1aIeNJhP6zvueCK5gfK8Jprr8izn40iG6py5McP2+ykBdEwr6AXTYTVyb8pUphtLI
         9krn8tiyNu37A0SiCXTQO1TVwkjYeHXmnFfVvN1o2Jc+fweFqsy5QGWUUv7c3i+oJkIJ
         wMsQ==
X-Gm-Message-State: AOJu0YyHbe0nr/vc/OTDIOKMLGGJPF0nUETBEtxI6zdxsm9OFzGi4U3p
        JytI/MM26bvOXUh7Ehy38MXfq4agKktXQb0inlrgtMI046YN2VAY
X-Google-Smtp-Source: AGHT+IEKK3pIZHt2QRqcId7nWRc2DLGZhZ7BIVl+nPAXJnwX2Sf45+9R0pQFVmMx9pkduIAsjCSxAhDM52WNmcfhZPQ=
X-Received: by 2002:a67:fa11:0:b0:44d:6290:e422 with SMTP id
 i17-20020a67fa11000000b0044d6290e422mr4850316vsq.35.1694073434785; Thu, 07
 Sep 2023 00:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-8-brgl@bgdev.pl>
 <CACRpkdbdcPv1LHL2W-enKBJ2OARpduoOJkQ64oL6GSOfmmD3qQ@mail.gmail.com>
In-Reply-To: <CACRpkdbdcPv1LHL2W-enKBJ2OARpduoOJkQ64oL6GSOfmmD3qQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 7 Sep 2023 09:57:03 +0200
Message-ID: <CAMRc=McSBBeHi5jDVYOF6s1etfQzYRNLo25LeY+DWG_2tEf7=w@mail.gmail.com>
Subject: Re: [PATCH 07/21] gpiolib: provide gpio_device_get_base()
To:     Linus Walleij <linus.walleij@linaro.org>,
        Dipen Patel <dipenp@nvidia.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 7, 2023 at 9:17=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Let's start adding getters for the opaque struct gpio_device. Start wit=
h
> > a function allowing to retrieve the base GPIO number.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> I guess you have a solid usecase for drivers needing to do this
> crazy thing, because I suppose you feel as much as me that
> this should rather be gpiolib-internal and confined to
> drivers/gpio/gpiolib.h?
>
> If you add a valid reason for making this globally visible outside
> of drivers/[gpio|pinctrl] to the commit message I guess I can live
> with it because we need to think of the bigger picture:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> It brings to mind the now confusing "base" inside of
> struct gpio_chip. We all know it should go away, but since it
> is never used during the lifetime of the gpio_chip - or SHOULD
> never be used - it should rather be an argument to
> [devm_]gpiochip_add_data( .... int base);...
>
> Maybe something we should add to our TODO file.
>
> Yours,
> Linus Walleij

For this series it's the HTE driver that uses it and I don't have a
good idea about how to change it. Dipen?

I would also love to make pinctrl not use the internal GPIOLIB header
so it'll be another user, unless you can figure out a way to not use
gc->base? :)

I think we're stuck with it for now.

Bart

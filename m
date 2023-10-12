Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398857C6811
	for <lists+linux-tegra@lfdr.de>; Thu, 12 Oct 2023 10:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235399AbjJLIUr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 12 Oct 2023 04:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235397AbjJLIUq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Oct 2023 04:20:46 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F401C4
        for <linux-tegra@vger.kernel.org>; Thu, 12 Oct 2023 01:20:40 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-45290cda80aso339541137.1
        for <linux-tegra@vger.kernel.org>; Thu, 12 Oct 2023 01:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697098839; x=1697703639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBSR0wcYspbRO3qzDDOttNnFk8Qm8m44q1aDPM4j6u0=;
        b=h3VUpP60lCraEgRIeKC+IYT3/zc4QMe3rLOPOeR+C5Z8BViJaIGlA5n0hC6TjTfr6f
         XjL//u7RnExc62XGlH3ad/8VAJMSkrBVrYdKB9E5nvDJ2OhOuvZQouT0c07Vjt68Z4A0
         zqkESMVVM+vFqw815XNAAKnT10KRl4DBDcyWoxhtR9mp9r5QZt4sYOMvta3vSwgJoyIq
         P9Z8pEjEb97LO7UeKZ+SuhZEDUujFS4iEUkqEwG7LpKkc0jiLB4Ur8PTCD35GkgUqRYf
         Luzp8BF1qhlaGv1m9Ck7k4pMw41U5VYmDz1naE2IReGX6EghoguOM5vuiJubfYl60fwi
         3Oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697098839; x=1697703639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBSR0wcYspbRO3qzDDOttNnFk8Qm8m44q1aDPM4j6u0=;
        b=QLkfSpnY1RSRhOHAPYWQbLmNVSKIQD2WN1Ubef3wZpmpJ85Pn4yR9V0uLXAQ2xljqO
         M7s3IU7gHiSlPPgS6gnOJBR/wBJMpXEviELVQ3Q3kWxaLB/ifdyXrc5MjTMpKHGga310
         +FiuTRStB69zXjO29wkviBbQamUEGhdJhNG9zdgAo113hCUNsj9UWod4P0iA7xgShtqi
         h+dJXysai1mMpAgPvl25zk0GGTQnGXlts7Nfnk4L619UtSZCMu1bnamwX2O9+4yn4Bup
         5v/D7D5q3cwwD0TlYw77PE9HhvBmKSFowKTOsB8QIjaFEUQACN8N2nUbARRqYDRIpGaX
         61wA==
X-Gm-Message-State: AOJu0YzB/IOmT6N3RkVBxuO0miqh75o5kPk+uEUf/D4liLk6QX2FZo3K
        BzB5aHp0t1l+lCkdGdR59+zWboWYVWeCdl128kFFYw==
X-Google-Smtp-Source: AGHT+IFU2WYRRKW4Qp7Y1F9HNt5ENojY0muko4VO6nlQ050sR3rUD8QC3m4FSm2ajkrFxiVe+ICyPjzlUKQJfuBVBGM=
X-Received: by 2002:a05:6102:905:b0:457:a912:20c7 with SMTP id
 x5-20020a056102090500b00457a91220c7mr3053797vsh.5.1697098838451; Thu, 12 Oct
 2023 01:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231011202638.372382-1-andriy.shevchenko@linux.intel.com> <75fe5f3f-41d7-76f8-47f9-9178fa030804@nvidia.com>
In-Reply-To: <75fe5f3f-41d7-76f8-47f9-9178fa030804@nvidia.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Oct 2023 10:20:27 +0200
Message-ID: <CAMRc=McMzH4Tsr3wASN+cTfr=W-K4OnD4gO4xOxRO=aVffbpKw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] hte: Improve GPIO handling and other cleanups
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        timestamp@lists.linux.dev, linux-tegra@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
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

On Thu, Oct 12, 2023 at 12:59=E2=80=AFAM Dipen Patel <dipenp@nvidia.com> wr=
ote:
>
> On 10/11/23 1:26 PM, Andy Shevchenko wrote:
> > This is a series that provides a new API to GPIO library (so far only
> > available in the GPIO tree), and respective update to the Tegra
> > HTE driver. On top a couple of other cleaups (patches 3 & 4, they
> > can be applied separately).
> >
> > Patch 2 inherited tags from its respective discussion thread [1].
> >
> > Due to dependencies this either should be applied to the GPIO tree,
> > or to the HTE when GPIO updates land the upstream (optionally with
> > the first patch be applied even now to the GPIO tree independently).
> >
> > Another option is to have an immutable branch or tag, but I assume
> > that was discussed and rejected (?) in [1].
> >
> > In v2:
> > - collected tags (Linus, Dipen)
> > - fixed couple of typos (Dipen)
> >
> > Link: https://lore.kernel.org/linux-gpio/20230905185309.131295-15-brgl@=
bgdev.pl/ [1]
> > Cc: Dipen Patel <dipenp@nvidia.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> >
> > Andy Shevchenko (3):
> >   gpiolib: provide gpio_device_find_by_fwnode()
> >   hte: tegra194: Remove redundant dev_err()
> >   hte: tegra194: Switch to LATE_SIMPLE_DEV_PM_OPS()
> >
> > Bartosz Golaszewski (1):
> >   hte: tegra194: don't access struct gpio_chip
> >
> >  drivers/gpio/gpiolib.c      | 20 ++++++++++++++++
> >  drivers/hte/hte-tegra194.c  | 46 +++++++++++++++++++------------------
> >  include/linux/gpio/driver.h |  1 +
> >  3 files changed, 45 insertions(+), 22 deletions(-)
> >
> Looks great...I am going to assume you are going to push patches 1 and 2 =
through
> gpio subsystem and rest through HTE, right?
>
> Reviewed-by: Dipen Patel <dipenp@nvidia.com>
> Tested-by: Dipen Patel <dipenp@nvidia.com>
>

Yes, let me queue them right away.

Bart

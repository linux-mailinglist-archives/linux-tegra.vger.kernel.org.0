Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADCCB9ACDF
	for <lists+linux-tegra@lfdr.de>; Fri, 23 Aug 2019 12:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390635AbfHWKN7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 23 Aug 2019 06:13:59 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35653 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389867AbfHWKN7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Aug 2019 06:13:59 -0400
Received: by mail-lj1-f193.google.com with SMTP id l14so8371744lje.2
        for <linux-tegra@vger.kernel.org>; Fri, 23 Aug 2019 03:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/C7VGw9oZOsMD4tXHesfuEi9pfMtNfHyHFwEmsIjuAU=;
        b=vkLJgjye9Dqi71Zlu4R7fTf6EXHXXZIY/z2c110qY8RTnSM1rv2WnoInPkxw1ZCAgK
         HD/L6lV0IR/wP4h+jPfz+vcHkVZGfTNY9DXscana1yTpmyQY2u7g25nbgQuMYdfJrctJ
         qaBJkUYHVCvBTc8sGbWb3OL+fsVr5r7QtgJny8AJ0NWY075wYeZeWolWuYaV8zL97SVt
         fUx6L7eyZnh/uuUA3Nkq8G5G/Cn/S9XdRviXrUnQTTwNjjYLzmM2eHTh8Au8Nha55S0x
         E/7Ks6JqyRgKN+J+KeuR01lUhlp9PhGaAsi9rAZfcKJgo4eD6/qBGm+3XPiMbPUs0E7n
         d4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/C7VGw9oZOsMD4tXHesfuEi9pfMtNfHyHFwEmsIjuAU=;
        b=TDE/xl+Z78bEtKGLKGTtjrIdsaXIuire0W4S7D4LyHsHHJQP5cODThNlXnEzn+3KJe
         mwQne4t/jFCsI74tskDZwfcecfJqIK1zDOkeeqkcfIbG6geR3e7nk3yf7s2KcEVkivBE
         8E8JCMGjX+B/+gZZsvIXE6NDa250ABeyxMomPZl+LxWonovDlKnOEnxQfpcSem4tQZCz
         OjEjeGwezkhOHx/c/+O8IuxEYBSgReZC0wp/2TtCiWngPTz+2Rflu3fu/nSfAKeZq0lc
         cb3cu5aqdwxG5eonpnPzRqzlhSK0O3NqQ+MvDk5LyDVhEPsp3/8SDpWJK+EVIeRYzuyo
         NWZQ==
X-Gm-Message-State: APjAAAVhTmuA/SIvzYsFhrYE5rn4KgXELDxohXZBZIBa4/1RhGZmopij
        SjSQA7s4I5/c/7JtvqauIYgDh1tlYqChWGoGiN/3AQ==
X-Google-Smtp-Source: APXvYqwwMLo6BR39Y5BpVTVq87RjNxHWRZqGKdDqgjAbp3rvCSKPYdY6h1gBQMaVhB3omoZEzwmQo3I3DeuiJ8nPS+Y=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr2498948ljo.69.1566555237137;
 Fri, 23 Aug 2019 03:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190808123242.5359-1-linus.walleij@linaro.org>
 <20190816011054.GA1041@onstation.org> <CACRpkdbZSJ4ggprUXaBJ07Hz=eryuy5=AmYOigTUmO9z4yahfQ@mail.gmail.com>
 <63f2d086-eb71-4153-071e-71102fe24a14@arm.com>
In-Reply-To: <63f2d086-eb71-4153-071e-71102fe24a14@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 12:13:46 +0200
Message-ID: <CACRpkdZCusZpzJAAOdEUSDkUKGzvUZAnxHBu6xo+hoqnPkuGQA@mail.gmail.com>
Subject: Re: [PATCH 1/6 v2] gpio: Add support for hierarchical IRQ domains
To:     Marc Zyngier <marc.zyngier@arm.com>
Cc:     Brian Masney <masneyb@onstation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        David Daney <david.daney@cavium.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Aug 23, 2019 at 11:12 AM Marc Zyngier <marc.zyngier@arm.com> wrote:

> > We should be encouraged to operate on IRQ descriptors rather
> > than IRQ numbers when doing this kind of deep core work,
> > right?
>
> Certainly, I'd like to gradually move over from the IRQ number to an
> irq_desc. In interrupt-heavy contexts, this ends up being quite time
> consuming. I have an old patch series somewhere changing irq domains to
> use irq_descs internally instead of IRQ numbers, which I should maybe
> revive.

We currently interact most heavily with the irqchip by way of
mapping GPIO lines to the corresponding IRQs, so I suppose
the existing

int gpiod_to_irq(struct gpio_desc *desc);

Need a corresponding

struct irq_desc *gpiod_to_irq_desc(struct gpio_desc *desc);

at some point, and then we can start to de-pollute the kernel
from this for all drivers using the modern GPIO descriptor
API. It's a big task but can certainly be done with some
help.

On the driver back-end we are in surprisingly good shape
thanks to all the abstractions provided for dealing with IRQ
chip drivers.

Yours,
Linus Walleij

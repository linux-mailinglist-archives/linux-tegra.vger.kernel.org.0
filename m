Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A370A9AA41
	for <lists+linux-tegra@lfdr.de>; Fri, 23 Aug 2019 10:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390170AbfHWIZH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 23 Aug 2019 04:25:07 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45526 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730759AbfHWIZH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Aug 2019 04:25:07 -0400
Received: by mail-lj1-f193.google.com with SMTP id l1so8044182lji.12
        for <linux-tegra@vger.kernel.org>; Fri, 23 Aug 2019 01:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Glz0OwhvEKOoAb5oRJJvTSgEA9gKmwWwKievNCcJKQ=;
        b=uZUjKOsE5/jPMneL47DnFGmzeeLAbZCzHyf6MvJo8nU7wGnh+jouYUqCLIVqYMe5JK
         kW8iW2I59/2pVhtoCXEFyEMJqA7TVACmba4co2d2ncSiSxH0YCITDPt38CkGH3c/a4DA
         bgZtU9G6kryKdaKj/wqLYGOBsvGxWO5gzh5Eh0nKdzBMbGKE5qXRbQntrOneSmnzm6SC
         kE3+TVqmFKc/HO6g8S51spAGAhPNA9N4GlK05uBmXOHHzPGl2HPBd/lve+MgzO4AEM80
         HUDc7hbrrOEhRnT7k+cjAt8iBYaVMvCbJAE6WPXGHxyn+DF/adcGp0K55CmQHUIi1CsK
         Q/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Glz0OwhvEKOoAb5oRJJvTSgEA9gKmwWwKievNCcJKQ=;
        b=dM9XeJcMo69fjxPSZ6WzG4oXLW4CdUYJ8P0yH+gG3NEBOkopyHiyXAX8sgG/G97+z1
         +G0sEis1DbB3l/V0JKkYz6DJKl0QoQoLflKGiaokcCeL48ERHL5Ihk3JuQNLwHla/Tye
         KRDzwzjVXuxmJkI0REYbDWYSo0nR5XvLxJ9C01EuoBgcoOihUYwCHwm0p1YMC33MrRTr
         luQvOhANnm8VqhJqDTxu5F3PZstVAB5mB0xWtbBZQXUyvcVZPJsInbjQH7UEynqPeDf1
         L9RRq0pvrjEDdJzEZjD9AepEV6JcJDtM536gBuIJOa/v9fkpjbnFSrhDjwYywUcD17Fq
         aqfg==
X-Gm-Message-State: APjAAAUdyfevakqSZyFlI4sVn86/obaRQrVrLZlO5wsW9JeqX9Vdonve
        nAwyzLL+3JnaR94suzXyNCs5lYavgJHjv4tC88LMcQ==
X-Google-Smtp-Source: APXvYqwuwG4xNuZjZkxSBKeWiQIyN29Ihec9ptvxODHGofHpDvPXgBtv28RnrJqmnSCq61BDiNLYZg0OQ+SbT72IHLo=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr2161179ljc.28.1566548705194;
 Fri, 23 Aug 2019 01:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190808123242.5359-1-linus.walleij@linaro.org> <20190816011054.GA1041@onstation.org>
In-Reply-To: <20190816011054.GA1041@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 10:24:53 +0200
Message-ID: <CACRpkdbZSJ4ggprUXaBJ07Hz=eryuy5=AmYOigTUmO9z4yahfQ@mail.gmail.com>
Subject: Re: [PATCH 1/6 v2] gpio: Add support for hierarchical IRQ domains
To:     Brian Masney <masneyb@onstation.org>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
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

Hi Brian,

I tried to look into this ssbi-gpio problem...

Paging in Marc Z as well.

On Fri, Aug 16, 2019 at 3:10 AM Brian Masney <masneyb@onstation.org> wrote:

> I started to convert ssbi-gpio over to this and pm8xxx_gpio_to_irq() has
> this little snippet that's different from spmi-gpio:
>
>         [ fwspec mapping code ]
>
>         /*
>          * Cache the IRQ since pm8xxx_gpio_get() needs this to get determine the
>          * line level.
>          */
>         pin->irq = ret;
>
> Here's the relevant code in pm8xxx_gpio_get():
>
>         if (pin->mode == PM8XXX_GPIO_MODE_OUTPUT) {
>                 ret = pin->output_value;
>         } else if (pin->irq >= 0) {
>                 ret = irq_get_irqchip_state(pin->irq, IRQCHIP_STATE_LINE_LEVEL, &state);
>                 ...
>         }

It's a bit annoying that this API (irq_get_irqchip_state()) is relying on
the global irq numbers and the internal function using irqdesc
__irq_get_irqchip_state() is not exported.

We should be encouraged to operate on IRQ descriptors rather
than IRQ numbers when doing this kind of deep core work,
right?

> What do you think about using EXPORT_SYMBOL_GPL() for gpiochip_to_irq() so
> that we can call it in pm8xxx_gpio_to_irq()?

I would like to avoid that because people tend to abuse every
API I expose (leasson learnt: APIs shall be narrow and deep).

> Or do you have any other
> suggestions for how we can get rid of that IRQ cache?

So the issue is that moving this to the hierarchical helpers
rids pm8xxx_gpio_to_irq() and we needed that to map this.

I would rather just add a new driver API to wrap the irqchip
API:

ret = gpiochip_get_irq_state(offset, IRQCHIP_STATE_LINE_LEVEL, &state);

Where int gpiochip_get_own_irq_state(int offset, ...) will figure
out the gpio_desc of the offset and then call gpiod_to_irq()
and then use that irq number to call irq_get_irqchip_state()
and the goal is met.

This should work I think, and expose a more precise
API for what this driver wants.

> I don't see any other issues for ssbi-gpio.

That's good news!

Yours,
Linus Walleij

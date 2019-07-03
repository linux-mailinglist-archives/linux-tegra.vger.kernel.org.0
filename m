Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8828B5E413
	for <lists+linux-tegra@lfdr.de>; Wed,  3 Jul 2019 14:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbfGCMjo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 3 Jul 2019 08:39:44 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46697 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfGCMjo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Jul 2019 08:39:44 -0400
Received: by mail-lj1-f196.google.com with SMTP id v24so2217052ljg.13
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jul 2019 05:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DklxO8bY9y+1KEtywoAmTmeIAIeruqC3jg7uHqcYFaM=;
        b=tcUAwT6hnidAlzpm/SNnRA/csXBqG7JcW5mgulZK2UCfSSNM9gxmq3O7QGcjdlss2U
         8KIw4HL3PZuubK712g7qbm/q508RKfpnD3PhBXCIiMgPpCplFOM02+kVr27wULmDeYOP
         zSZEhsMAwtixbTJJxF5O1kTIMGABG6kOKo0QbNMYzw2ArMFPPL5LcYsXzQ1pfZfTidmZ
         kcMrdpzNkkjzFZsULDjr7PbChbGgXocEquSFLMPgJOEoaSESyyuXjSwRFrpVl/OjeBPN
         m9aSxasRM1iEjzr4Ea6u0gTgzOlA2oMaAhSVFGTp4UYMtMhVJQEMyO5mbLRlBJlVDTof
         v1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DklxO8bY9y+1KEtywoAmTmeIAIeruqC3jg7uHqcYFaM=;
        b=kNxh6fVckb26obBkCC5SOeDj3qyzIc+VIFVD3lZQ9GEImOHi+uXmjuRZ5F24Cq3r1R
         FmcqcP0al54cV2/b9sMGXhh8LZ0JGU1eS/sDfHhfx3/DhHewxSs7UmWu4ecYhsKcj0Jm
         +636fZPd5xofnSA/cDxv63oYCs4jQYPYjK4/x36wk//Y9BfRl9JyhQ0tf0n3VUCiGWVv
         6/tz5k9G6TJnmYSY2E46/qHGKMtwGVxsBCkrOZfLDKjynaQ78LcLtu8jdbOyAqF1Zppn
         l8MATDbvyFMqrRFPjhns1+8Nn8jLDldhcwg39hBY54veRej3AmG/33fJQh11k/2MtZsi
         bSrA==
X-Gm-Message-State: APjAAAU2JxumumXDqb2ANTtICWxn83lavPAwSAsq4HX7Whdpr8O2gj0z
        enoRofrcv5cYqWvoqEEVC75+iWIIkMYFKXlPwSYjTA==
X-Google-Smtp-Source: APXvYqxZRBnGvMRF6tBp3C2/OLtTuTS0lKqo4NzZvUuSWpCW+si5oCjMsGsbzwn/jmNq4IOkkyYTZgGJBJBUeI0YTvI=
X-Received: by 2002:a2e:a0d5:: with SMTP id f21mr21386534ljm.69.1562157582719;
 Wed, 03 Jul 2019 05:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190624132531.6184-1-linus.walleij@linaro.org> <20190703092236.GA15393@onstation.org>
In-Reply-To: <20190703092236.GA15393@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jul 2019 14:39:31 +0200
Message-ID: <CACRpkdab1NQNLwAKTxcuziAxu7oU7+Ypgea08qdZ=3R2Wr9cag@mail.gmail.com>
Subject: Re: [PATCH 1/4 v1] gpio: Add support for hierarchical IRQ domains
To:     Brian Masney <masneyb@onstation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
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

On Wed, Jul 3, 2019 at 11:22 AM Brian Masney <masneyb@onstation.org> wrote:
> On Mon, Jun 24, 2019 at 03:25:28PM +0200, Linus Walleij wrote:
> >  static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
> >  {
> > +     struct irq_domain *domain = chip->irq.domain;
> > +
> >       if (!gpiochip_irqchip_irq_valid(chip, offset))
> >               return -ENXIO;
> >
> > -     return irq_create_mapping(chip->irq.domain, offset);
> > +     if (irq_domain_is_hierarchy(domain)) {
> > +             struct irq_fwspec spec;
> > +
> > +             spec.fwnode = domain->fwnode;
> > +             spec.param_count = 2;
> > +             spec.param[0] = offset;
> > +             spec.param[1] = IRQ_TYPE_NONE;
> > +
> > +             return irq_create_fwspec_mapping(&spec);
> > +     }
>
> spmi-gpio's to_irq() needs to add one to the offset:
>
>         static int pmic_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
>         {
>                 struct pmic_gpio_state *state = gpiochip_get_data(chip);
>                 struct irq_fwspec fwspec;
>
>                 fwspec.fwnode = state->fwnode;
>                 fwspec.param_count = 2;
>                 fwspec.param[0] = pin + PMIC_GPIO_PHYSICAL_OFFSET;
>                 /*
>                  * Set the type to a safe value temporarily. This will be overwritten
>                  * later with the proper value by irq_set_type.
>                  */
>                 fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
>
>                 return irq_create_fwspec_mapping(&fwspec);
>         }
>
> ssbi-gpio will have the same problem as well.
>
> What do you think about adding a new field to the struct gpio_irq_chip
> inside the CONFIG_IRQ_DOMAIN_HIERARCHY ifdef called something like
> to_irq_offset? (I'm bad at naming things.)

I think to cover Lina's need and following the direction set out
by Thierry's desire to have callback so we can control the
parent-to-child translation with code, it might be best to have
an optional callback for translating fwspec.param[0].

Thierry seems to need exactly this for the Tegra driver to,
I think that is why it has custom ops today.

> Also, instead of hardcoding IRQ_TYPE_NONE, what do you think about using
> the default_type field that's available?

I want to get rid of the .default_type in the long run, it is
nominally only for board files where the .set_type() isn't
ever getting called. For anything modern, the .set_type()
callback is always called before any irq is used.

Yours,
Linus Walleij

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDCA84EFA
	for <lists+linux-tegra@lfdr.de>; Wed,  7 Aug 2019 16:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729712AbfHGOnf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 7 Aug 2019 10:43:35 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37794 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729550AbfHGOnf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Aug 2019 10:43:35 -0400
Received: by mail-lf1-f67.google.com with SMTP id c9so64179525lfh.4
        for <linux-tegra@vger.kernel.org>; Wed, 07 Aug 2019 07:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FpNH+fwRD9UslARAv0P6x4oixyqcPMIUztxNUrsHsKk=;
        b=nSwAw8D4dtu+pqJupnBaAovTJFtHiEvwlFnXNTAzDPnfRzlbbito6zePcWXsUekbxm
         kUjUT4kTtVfc/0vDGxRPqhcMx99FgC7sSSt+EbfFWcffcoSaNGI73OT1/+He9uvEzPt/
         83WDuFhUsvFYCbTHSAC+68bnMrcNDA3D4wpnEsEz3NsFrkseeZTwbckhTR9C4PE+YPev
         D8zwc8lgLuwspakO6SI+c2UYNE3+HnGky3kryoVrVyTrPlaCh+ndrXIgrLzaU7dczquu
         0pBBqHgEwup+gKf2agMwLnZMgf1lnvHTScbN4cgbskNywOOuq0ZQ2sy43GGslDhyJHa/
         lYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FpNH+fwRD9UslARAv0P6x4oixyqcPMIUztxNUrsHsKk=;
        b=tCXyTg8dEtNsnqlUTBu4COmpJ7MKO9+oI5FnVyejMbdP/8qonjPi9Dbk7tZT/leokv
         BrVwnUIE9PIJiCnUA+3shOUHh05tgnpDLm6yb2vQv5dLV/bPSiZlPVWhXzhy/dJBMAW8
         R/Sax7gqolrP6aKbeYQnjk7lS4yCuO5bVI8JrIfEoDBeO9Ych/2vd4yifzbYtq7cXnRg
         DUCpyztq9Dl/ObZ/icgVs1bK9zx08XjA6i95Hg5O2+6bf78CeaibQZKWBQWfFymd4tLl
         figgEaNhJslym1kGKj7nX7nLA8U5WSAwTM1kdj4cRhnpNLIw6izK/ewGw+mXnntRJ4Tq
         YoVg==
X-Gm-Message-State: APjAAAUqLfidOggHg58IsA7vXNu/WsySCnPJEWq8KHjLVez8KC+l0vRW
        UajjUg5K1AVNDbn/gdOnzFT1GCgW5JpSbL74pOx0ZQ==
X-Google-Smtp-Source: APXvYqyOTTzh6O8lPGxN8pJ1Lz67M/1gFvwVNQ5VY/dqkrnmktc2tJNFhaktLFn/LmfFpfcS2Bz/L5GTRQJS57p5lwo=
X-Received: by 2002:ac2:5dd6:: with SMTP id x22mr6013591lfq.92.1565189013641;
 Wed, 07 Aug 2019 07:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190624132531.6184-1-linus.walleij@linaro.org> <CAK7LNASX2c6=X7P_qn31MgsgSdiYL7m+fD2wmk5_tn6o+1YJSw@mail.gmail.com>
In-Reply-To: <CAK7LNASX2c6=X7P_qn31MgsgSdiYL7m+fD2wmk5_tn6o+1YJSw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Aug 2019 16:43:21 +0200
Message-ID: <CACRpkdYbTjQR6dDsy3WJ1w89Yyo=qfSgTheaYX8MHW5uE321sA@mail.gmail.com>
Subject: Re: [PATCH 1/4 v1] gpio: Add support for hierarchical IRQ domains
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        David Daney <david.daney@cavium.com>,
        Brian Masney <masneyb@onstation.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Masahiro,

On Thu, Jul 18, 2019 at 1:12 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> On Mon, Jun 24, 2019 at 10:25 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > +static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
> > +                                              unsigned int irq,
> > +                                              unsigned int nr_irqs,
> > +                                              void *data)
> > +{
> > +       struct gpio_chip *gc = d->host_data;
> > +       irq_hw_number_t hwirq;
> > +       unsigned int type = IRQ_TYPE_NONE;
> > +       struct irq_fwspec *fwspec = data;
> > +       int ret;
> > +       int i;
>
> We always expect nr_irqs is 1.
>
> As gpio-uniphier.c, you can error out with WARN_ON
> if nr_irqs != 1

Hm, yes I am pretty sure it is always 1.

But I'd like to defer changing this until/if Marc changes
the signature of the function to not pass nr_irqs anymore.
I try to design for the current prototype because I don't
know how e.g. ACPI works with respect to this.

> I see so many chip_info().
> I think they should be chip_dbg() or removed entirely.

I am keeping that right now as we're testing on several
different systems, so some extra debug prints should be
OK in a transitional period. We might change it into dbg
with a separate patch before the merge window.

The rest of your comments are addressed!

Yours,
Linus Walleij

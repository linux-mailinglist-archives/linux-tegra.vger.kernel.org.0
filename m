Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D917633662
	for <lists+linux-tegra@lfdr.de>; Mon,  3 Jun 2019 19:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727630AbfFCRSe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 3 Jun 2019 13:18:34 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42215 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727606AbfFCRSd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Jun 2019 13:18:33 -0400
Received: by mail-lj1-f193.google.com with SMTP id t28so5861081lje.9
        for <linux-tegra@vger.kernel.org>; Mon, 03 Jun 2019 10:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kj6JT+jHXGMgF6wpvxZYkTfPGiKrPB/frgW1hOjbrMA=;
        b=hyECpzvQd4Hy+9lad6DlatxfjeHDgMuaALhIfrQmsjEQNp6FH3aOgiKvYB0xVpsLYh
         rlGhKICZSmJX0KBEUS9zmukzOXMf4nCXmgLVcwqQu7TNBndtMTtZt5Te0glKDv4bop41
         gZd93FhSHK+rt7ZJbIIs0t/HqSNfzSkWXlfqHpdqgOMaQBBhTJs7guk8iaoyXZ5S1Mtl
         2FBYEqHIgtRVmL4Y9xXMjWLNsewRRMBtCwIpgv8fBTl1az0LTew4CuDdAreBmV4r9aRV
         GRiEeQxzsHui/M+SsD6y2u6aOFTVmUJqrxikIu+0r5Uca5hRAQL/fkgvgqsFO2fOU/So
         WDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kj6JT+jHXGMgF6wpvxZYkTfPGiKrPB/frgW1hOjbrMA=;
        b=MXKb3DFqsL7aYCMJw6nRamRqIEagyDxFwan2x5XuzYTSnLLIxkt+dCxLX61f1q+bbk
         RDnksG46d3AxsQNqUkzUDgirVOTXPaanpqE499jy5RhwzQKCX9RrBVyOw8g2vNGPRGMR
         jRPVEAUMDZz9ySZrqN1aLwI7ImcQdDdco/0Qe4KrGoWu82tPidznf+TF6FNBR7H6+LV4
         SAWmeGGL0/x2qjxjGHyfGTlrS3UrVPVreQpzsK0kWDZl7luOOHlAvkK0EwV/VVF6f2sn
         2cktzn4F3B1p5h7r8AKQl8HX63ghblGqJWCtguEDocLfZnKKZuQjkbPZp0vuvuLeaKbr
         220A==
X-Gm-Message-State: APjAAAUL19glCcSso36dWgBjAnuIYBQCCguvXaiKfjXv3d6pof8hBzNp
        XVlNHFrnB/iSklpWvdv0zzTdWVYAkErVIVA9GgBZ0A==
X-Google-Smtp-Source: APXvYqyFnODudaj909lWUHE37IZ9sbywYN6M0rtVkC2iqcHnFD9xerHpf7WP1RnGxEjy5VPDFLhVtiiV2to5M4DXZw0=
X-Received: by 2002:a2e:9e85:: with SMTP id f5mr8624764ljk.104.1559582311867;
 Mon, 03 Jun 2019 10:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190602205424.28674-1-linus.walleij@linaro.org>
 <20190602205424.28674-2-linus.walleij@linaro.org> <20190603091649.GD27753@ulmo>
In-Reply-To: <20190603091649.GD27753@ulmo>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 3 Jun 2019 19:18:20 +0200
Message-ID: <CACRpkdb_LZZWxfTmMsfXGZ7=GeTvQ_sR8sWp10Q0nMaBnA=vDA@mail.gmail.com>
Subject: Re: [PATCH 2/2] RFC: gpio: ixp4xx: Convert to hieararchical GPIOLIB_IRQCHIP
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jun 3, 2019 at 11:16 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> Me

> > +const struct gpiochip_hierarchy_map ixp4xx_gpiomap[] = {
> > +     { .hwirq = 0, .parent_hwirq = 6, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 1, .parent_hwirq = 7, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 2, .parent_hwirq = 19, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 3, .parent_hwirq = 20, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 4, .parent_hwirq = 21, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 5, .parent_hwirq = 22, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 6, .parent_hwirq = 23, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 7, .parent_hwirq = 24, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 8, .parent_hwirq = 25, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 9, .parent_hwirq = 26, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 10, .parent_hwirq = 27, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 11, .parent_hwirq = 28, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 12, .parent_hwirq = 29, .parent_type = IRQ_TYPE_LEVEL_HIGH },
>
> I think this is a good example of what I was referring to. There's no
> easy way to represent this mapping in code, other than basically writing
> up the table as a switch statement, or a couple of if/else clauses. But
> if you have a large number of pins in the GPIO controller and they all
> can be easily described by just a handful of lines of code, I think it'd
> be nice to avoid all that extra data.

I agree, but we can add those as we go along. I wonder if such code expressions
of the mapping are really that magical? Isn't it simply at best ranges of hwirqs
so a n_hwirqs need to be added to the map and just collapse the above to:

{ .hwirq = 0, .parent_hwirq = 6, .nr_hwirqs = 13, .parent_type =
IRQ_TYPE_LEVEL_HIGH }

I'm up for that. Maybe as a separate patch though.

Yours,
Linus Walleij

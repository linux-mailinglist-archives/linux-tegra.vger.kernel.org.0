Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7776A59906
	for <lists+linux-tegra@lfdr.de>; Fri, 28 Jun 2019 13:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfF1LML (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 28 Jun 2019 07:12:11 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45729 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfF1LML (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Jun 2019 07:12:11 -0400
Received: by mail-lj1-f196.google.com with SMTP id m23so5552453lje.12
        for <linux-tegra@vger.kernel.org>; Fri, 28 Jun 2019 04:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BLYNn2gbiV06OLhtSgaE3edNKHjdYdzufxnKdLIZssI=;
        b=aB4jAYw0ITarTEmVLgxLDcVeY9dDnAqTQrOH+eSQmtxwEnZr2aepU7N1Wuidigxd2D
         ZRT1Z0P6mdrh7K7Fq8WefC0FvS1mttQvM0xqZG6DtdZ0raxdb4UGy533kbl9/k1UI7Ot
         JQxV3TXfEo0qzBlop23mSFlXFT4GJPZnfLpXBcsJzt6y3fbnUyUg+TxqS3aNhnWYZ3u4
         awcfS4M41NAhFFmOlaKCsPUb8n/gAlc4bCy3nz7XKx8BPTISLej0nIK/VWGRFNSKxR0e
         3UEpxeSmarHWcAiGTsp5Mo7lCrMpgRKzOGIrhG11cPB+4uJKK3pqczfI1F6oglcNjBsM
         81bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BLYNn2gbiV06OLhtSgaE3edNKHjdYdzufxnKdLIZssI=;
        b=slxyih3ycOM1+q95GQ7Zi45SIr/000eJtWHyZ/WRUoF1mdpxU0DQ53RLA2dAQ309oy
         9iOPcTDN+N2/WI0LzdXYhxZj+eZeKcHgc6omH3sh9V0w9BxcxlBJqmCxeO3EqEAa7NIa
         h30uGbQJ3mQ8D35Fn+frsphdbQha2mDkjPFX8xyncukHWpFJx2RdH+e+vxngLqp63VFn
         YK9qSV3B1y1lrMTd3a2Sv4g+/Fhwi2r5jnY2RAUhqFGT2gK4eXdZtg0MBM7ylF/36TLU
         h4ptNWk2WSQVwczeDM/oZ6PskWMAM3iEbrBXWeak/ThTDNZiVCODwn6WBvpnCfwnQVKw
         if2Q==
X-Gm-Message-State: APjAAAXakdF4OXkTZdymqobA1GhoUpg+fWiJbHLOZS7kBvuEOfhPUUfL
        dT0DIPlCU68l1Vs0An4uJ+Zj7t/QXRCjDrvqqXoEpQ==
X-Google-Smtp-Source: APXvYqwy5vCgIzc8hAKtHz38Udr2xgppaLDenX2DXviD7lMDZFUZyq+pWqt3ymHcAhiH2VSMYhX9bYFpmLkuJH8CppI=
X-Received: by 2002:a2e:650a:: with SMTP id z10mr5828695ljb.28.1561720329467;
 Fri, 28 Jun 2019 04:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190624132531.6184-1-linus.walleij@linaro.org> <20190628104331.GB17335@onstation.org>
In-Reply-To: <20190628104331.GB17335@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Jun 2019 12:11:57 +0100
Message-ID: <CACRpkdY1SZDphGmEXgFQwirVNO_Nn+qz9oojuQuRoEscgo_22g@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 28, 2019 at 11:43 AM Brian Masney <masneyb@onstation.org> wrote=
:

> I started to convert qcom's spmi-gpio over to this new API. I'm not done
> yet but I noticed that this new API assumes two cells for the parent,
> however spmi-gpio's parent (drivers/spmi/spmi-pmic-arb.c) expects four
> cells. See pmic_gpio_domain_alloc() in
> drivers/pinctrl/qcom/pinctrl-spmi-gpio.c for more details.
>
> What do you think about adding a function pointer to struct
> gpio_irq_chip that is used to populate the parent_fwspec?

I discussed this before with Lina and I na=C3=AFvely thought we
would have only twocell irqchips... OK I was wrong and
Lina is right.

And I agree, let's put a function pointer for this in gpio_irq_chip
and add code so we default to twocell if it is not specified.

You can hack something up if you like and I will just put that
on top of my patch.

Yours,
Linus Walleij

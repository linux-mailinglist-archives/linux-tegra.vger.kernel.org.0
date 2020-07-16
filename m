Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 232DA221F16
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jul 2020 10:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgGPIzp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jul 2020 04:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbgGPIzp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jul 2020 04:55:45 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B80F7C08C5C0
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 01:55:44 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id d17so6291204ljl.3
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 01:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O7M6LSSf0rVr+K5b96y/UgiYQSV5TowURquOXTDyM6o=;
        b=omtXSDk8Er1sr32hkwdG2nNFrUrAK7qFYNj6XlTfU8J9JAHiMCTKCP85i1M564oJcz
         LwP3aV8uokshIL+8No+TG/oBSVb9F+srTh/pD0Dduk0NcRblFbcuWWzQ48LdKqAgrw0s
         dZNa8VX92IC4UwnUtyz4G7GPkVifjb3uYS7DGIGgTii8vURWYQiyYkmMOwymUwaPogHr
         4Lxe2YzF2HXAWJSwTVyUv7u+AZJCCPocO9V0g9dM4uwglrTTvQwev/Ug6I7Ns00+JqQL
         26QBMaPwWd5i1aZ1RWqZpYOPqiHYAmPPBVL5KLPdGZBmzVgiqYcJw8MplXP442zvEZZe
         j7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O7M6LSSf0rVr+K5b96y/UgiYQSV5TowURquOXTDyM6o=;
        b=FdiVQf8kFoMxTfLVea5V3pmtDBfxtcVQqAs2LRwT+XcL3lw1krlSu5Gxv02x8CkFjN
         CvVv8jCmlC6BpOhiQYrGWygGNpTO3MopO4fHpLcfOxF0i3HQWpKvT554tFXtCTgzG8hJ
         Jbski391HTkdIBtr3vmE+SqkL6N7NqYq6xWRH3buy5GmOrj8kn4QNyKfdnMO9Wm9MDK0
         c8momNdxVFh2DeH0SitL7cEQS8ZmuAtquGMtdCEvoojdfgukiXXRlUKlyu50lDjNUcs9
         XZZ90zj4NfLy0qKj0SPu7IHfM7oZo4464VT/KvwIohOxV3fjUuLyordvCMXurAC5d/cr
         XQUw==
X-Gm-Message-State: AOAM531sMEHf3FPaW31kOKHm5q4+e1IdujvjDj7/L8E3D4+lqPw5TkiR
        Y6Nq58Tj5pARoPXWDXhN3r3EZOMQx0f0ka6azDC/gg==
X-Google-Smtp-Source: ABdhPJx1YAsYA09tD3IivtrjldooNtMmVTSRsu2IDcup6l4pXNo9MjDeGkcmelNvwLuv1u6BQRXBxGIZIg+PMLtBIc8=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr1574766ljj.283.1594889743096;
 Thu, 16 Jul 2020 01:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200709171203.12950-1-digetx@gmail.com> <20200709171203.12950-6-digetx@gmail.com>
In-Reply-To: <20200709171203.12950-6-digetx@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 10:55:31 +0200
Message-ID: <CACRpkdbPNRoPGc4UCRZqhE52336d_LxT19A5y2oHK+hW-vn2ng@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] gpio: max77620: Use irqchip template
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jul 9, 2020 at 7:12 PM Dmitry Osipenko <digetx@gmail.com> wrote:

> +       mgpio->gpio_chip.irq.chip = &max77620_gpio_irqchip;
> +       mgpio->gpio_chip.irq.default_type = IRQ_TYPE_NONE;
> +       mgpio->gpio_chip.irq.handler = handle_edge_irq;
> +       mgpio->gpio_chip.irq.threaded = true;

And I didn't even realize one could do this.

> -       gpiochip_irqchip_add_nested(&mgpio->gpio_chip, &max77620_gpio_irqchip,
> -                                   0, handle_edge_irq, IRQ_TYPE_NONE);
> -
(...)
> -       gpiochip_set_nested_irqchip(&mgpio->gpio_chip, &max77620_gpio_irqchip,
> -                                   gpio_irq);

And get rid of these two.

I suppose I can just do the same for the remaining users of
gpiochip_irqchip_add_nested() and gpiochip_set_nested_irqchip()
and get rid of these two functions altogether!

Yours,
Linus Walleij

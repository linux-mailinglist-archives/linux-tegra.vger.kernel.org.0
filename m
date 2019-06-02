Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F87F324C2
	for <lists+linux-tegra@lfdr.de>; Sun,  2 Jun 2019 22:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbfFBUfg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 2 Jun 2019 16:35:36 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44318 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbfFBUfg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 2 Jun 2019 16:35:36 -0400
Received: by mail-lj1-f196.google.com with SMTP id e13so14196446ljl.11
        for <linux-tegra@vger.kernel.org>; Sun, 02 Jun 2019 13:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ua7Bg2WTXh54kp2rUqBSlcTuCgZgsqmLT8oZP4ysRwE=;
        b=mdnOW5bofVv/5/qFr/LOVppZD9jE51jMdGume3hrgp2z/+0KL0LfX2a+FLaQ1PC1eH
         9mkXoLmeN+JU5ulWliHHSAA1RSE577e2u7clzYMm+ZgQ8Io6bgT4b87nkmqobJqLNiL3
         aPMYKoUTq9x+H69c/BFUMyCZdVAwG8/3so6Cy1LTQ1nKFpz8u0UF3Rqr+xfR8S2QILhQ
         CdKKBGI2e/5bf4kcz6c3uWtlXdhcWG1k6Z0f/7odY+EJkxVx6vDH+a0wqpbIojIWGcNZ
         JSzvM48cBA5vA+Raapu2hzogb1GHJHEfTF3kbe+LxkAzqAWI0mZXT/yBrlC3rLdEYtHo
         DPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ua7Bg2WTXh54kp2rUqBSlcTuCgZgsqmLT8oZP4ysRwE=;
        b=H9UMV6G+ijMDBzjsFBbEHB5A7LiY7KD97EdILH5A8FO8UxqLtXxnmauPC09mGMkA9F
         JK0149AUFEprRwr+CQj/lHA5jTwYIlk5C8riRjtyoPZ7Y2gdF6aD2c43r72/r7HPjFu2
         /AEEaAd5TBOF2Lo3+ZUFZt9njKLl1dZLzO5wiQuwJQxF2qo4uv+/GoBFLP58/sQ9CM4U
         8zZ3g6G1PUG31kmrWcqbUVWSb9yJTDiSdLxOL2Z69/IiYOTcpspPggiM1XmdqaVEjpky
         584hjvZRmKsy3pUaAisNICJpjUSITuHeLt/f6c1DT3NG8zSu2IhqOF5TCRNE4U+BlHo7
         svnA==
X-Gm-Message-State: APjAAAWU5sNXblndoJwS4HUuYZ+LoKuemTB8EHzDGL36kJQ3VUuxpdHM
        o0WSTFQCQIW6K8XBSMYsi4aGDuIwT/AHwBvCjfTGbg==
X-Google-Smtp-Source: APXvYqwGsGMLL4jmNK+u3Vc4fpOIFYqvavFRPbb8kW41gazuGxmhrGq1xjBhRInORzT2HTZ0GULsW1cybw3CRQIPBYE=
X-Received: by 2002:a2e:984a:: with SMTP id e10mr4150601ljj.113.1559507734458;
 Sun, 02 Jun 2019 13:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190529145322.20630-1-thierry.reding@gmail.com>
 <20190529145322.20630-2-thierry.reding@gmail.com> <CACRpkda_aK++k0eVHmGszgts86usaxbQ9uU0kqAzAjapK8AOQg@mail.gmail.com>
In-Reply-To: <CACRpkda_aK++k0eVHmGszgts86usaxbQ9uU0kqAzAjapK8AOQg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 2 Jun 2019 22:35:22 +0200
Message-ID: <CACRpkdb6OjHZGgDHXH8gfi0WwzX8170zHJKbpbnSRv+UsZvfhw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: Add support for hierarchical IRQ domains
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Jun 2, 2019 at 3:51 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, May 29, 2019 at 4:53 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Hierarchical IRQ domains can be used to stack different IRQ controllers
> > on top of each other. One specific use-case where this can be useful is
> > if a power management controller has top-level controls for wakeup
> > interrupts. In such cases, the power management controller can be a
> > parent to other interrupt controllers and program additional registers
> > when an IRQ has its wake capability enabled or disabled.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v3:
> > - use irq_create_fwspec_mapping() instead of irq_domain_alloc_irqs()
> > - add missing kerneldoc for new parent_domain field
> > - keep IRQ_DOMAIN dependency for clarity
>
> Actually I applied the patch, and dropped the two lines making
> it possible to override .to_irq() for now, so I can illustrate my
> idea on top. If I manage.

Bah I rewrote the whole think as I want it, maybe my ideas are stupid
but take a look at it, also very interested in input from the irqchip
maintainers.

Sending it out as RFC in a moment.

Yours,
Linus Walleij

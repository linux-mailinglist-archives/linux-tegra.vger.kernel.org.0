Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE7EF32E18
	for <lists+linux-tegra@lfdr.de>; Mon,  3 Jun 2019 12:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbfFCK6R (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 3 Jun 2019 06:58:17 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44889 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbfFCK6R (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Jun 2019 06:58:17 -0400
Received: by mail-lj1-f196.google.com with SMTP id e13so15680193ljl.11
        for <linux-tegra@vger.kernel.org>; Mon, 03 Jun 2019 03:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Hkb6ZGh0otQQtsG7EyeKc0XPVB1qeyVKCVz7z7GAK4=;
        b=MNMZwokibxUU6+0ryf7ELuQ9C9y6uLdFUZOlzwg8shXKvhfYvV5rRTTzeh41/lQAZ0
         1LQYdLODDWtYRXLksN6sfVGsFKWNE/4H3RgIXGAVjS1WA+aSNz/WyaO88z1qtMbacZYi
         uQLRyzQiUXprUBV1rwhQdLbRxTqLq5tncp1K/DcF5kuGm15RXfZlVbfkTKQSq2t+AA7A
         huj8SnqIzDRgQgjB36zFWJgjWu+yJQIQhFigor+UBthANFKjAT+aJXi3GcdwzFWW10EI
         eRIotdz3v5wpob/mQOhREKzUz3fvttn9KQVGTI0T/TaHwb3rwmpTMjPzsCjP0iPCVqn7
         OlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Hkb6ZGh0otQQtsG7EyeKc0XPVB1qeyVKCVz7z7GAK4=;
        b=hhf6JU2x4NPPX80r5HhznbjaSXHlL2BCF+Nn7Z6kqQz87ky2BVd5lJgNceDt2YNd8F
         VFilmF4GEbxJdk8TJ/NGYlhALioJLwy9HG5AzAlgXTuYz3M4RVb9IdE5voo4e4Ob5MpD
         z2V1EqZpJmfNh2MMetxYZ5CwlCFWRuX5MDwx576JH7SmIb4fQOOIoQjr2ejaSwQ3ksM+
         YKncaq0nAQ8uODP6Zh3Qtp9iSWA76GR8o7GVDdeTyCqcY6Lm4Ma1CQHsBM07n72Wq/CW
         vOtgYpi9Orj7YikrMTbUOhf6nPs8iA+Ffq6uA+dkFUhNdxlsxNbJL2S1y9eHKlGJWqej
         Nx2w==
X-Gm-Message-State: APjAAAUsYmdyvJdiIULbdJsAIs9Owm5xOtO3CQd4F6ofQDKVNx5xqn3Z
        t4v4UoQbDlO6X24bQNEMZ4UnACoGAUaKIBTNbok00w==
X-Google-Smtp-Source: APXvYqxo/ADke86oscEtkWdOZe3GDp/cLqsLQ6zE2mLLJbDnU81g0eCO5QoeN9mSyfQkx4QxgcHARZqrEYTDhPchXJA=
X-Received: by 2002:a2e:9018:: with SMTP id h24mr6376615ljg.165.1559559494919;
 Mon, 03 Jun 2019 03:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190529145322.20630-1-thierry.reding@gmail.com>
 <20190529145322.20630-2-thierry.reding@gmail.com> <CACRpkdb5vB6OwcAxtjsKLzHt9V27juEOEEDqqQczKT-3r+7X-g@mail.gmail.com>
 <20190603075324.GA27753@ulmo>
In-Reply-To: <20190603075324.GA27753@ulmo>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 3 Jun 2019 12:58:02 +0200
Message-ID: <CACRpkda47EX981Dw=jLrU=PHn50+AQhJmpVRWJ9uJEQdcAsrTw@mail.gmail.com>
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

On Mon, Jun 3, 2019 at 9:53 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> Me

> > Please drop this. The default .to_irq() should be good for everyone.
> > Also patch 2/2 now contains a identical copy of the gpiolib
> > .to_irq() which I suspect you indended to drop, actually.
>
> It's not actually identical to the gpiolib implementation. There's still
> the conversion to the non-linear DT representation for GPIO specifiers
> from the linear GPIO number space, which is not taken care of by the
> gpiolib variant. That's precisely the point why this patch makes it
> possible to let the driver override things.

OK something is off here, because the purpose of the irqdomain
is exactly to translate between different number spaces, so it should
not happen in the .to_irq() function at all.

Irqdomain uses .map() in the old variant and .translate() in the
hierarchical variant to do this, so something is skewed.

All .to_irq() should ever do is just call the irqdomain to do the
translation, no other logic (unless I am mistaken) so we should
be able to keep the simple .to_irq() logic inside gpiolib.

Yours,
Linus Walleij

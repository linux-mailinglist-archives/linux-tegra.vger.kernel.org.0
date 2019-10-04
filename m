Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A86CCC593
	for <lists+linux-tegra@lfdr.de>; Sat,  5 Oct 2019 00:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730855AbfJDWDx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 4 Oct 2019 18:03:53 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38831 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729586AbfJDWDx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 4 Oct 2019 18:03:53 -0400
Received: by mail-lj1-f196.google.com with SMTP id b20so7962309ljj.5
        for <linux-tegra@vger.kernel.org>; Fri, 04 Oct 2019 15:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A7VFtrYB8LeEaQkJ1DeJb6d8IbIcJQwakcs9Nbpjdm8=;
        b=B/IeFnkkWS3RpKsuLqD1d1bPI4D7V/8A7MG4m7yUC2cY+9s4Q75dqxAlyR8PcF79z/
         UOJkyDyxtiS0NZpzhMffx6CmSGqYLlNm95JLYvaJrnl3f7q7zgi1K2jKCpJ4lHuZapvG
         FbRAvMqIY8ZnzyPbAFLiM4zCQ31RpsgNx1BnXNjeVewFxVt7PIG8MEhV3et2lSf3CFpe
         JcFsTc0AQVR1XcX2PqPUuPNmV1BsFDqAWozTFETRpyVmxzBB0Ca3gUajWcYyScSthkkZ
         miMnbbhj4c2ECvLJCbVJkfJCbUYJn1boYB2dtLSPhubRtu0uHVcvcWMZXJO5i7lOnday
         Y6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A7VFtrYB8LeEaQkJ1DeJb6d8IbIcJQwakcs9Nbpjdm8=;
        b=UfX2wIPkA4bfkzagsrC+fG0F6Z/3O1ms7djVNq/yLdBBpbzlWMnbXd7YqR6bYPsoEb
         GBTFmpR6NzuxyYDK1dxhO2zwUmEhiRjzkH7ThGMhH6ErefjRx4mZSsYwbSMhEqouj0j3
         JYBM6GoRSKskE0whm6tPXZT/n8FSIG3D4jsVq616bg+DVndYDnj569AvZzFfk0phTMbW
         63tfuKUAjmsU5T8w7T6BGyjhE32bwCs5snHkHniPjieT7nw8QJC3zVNKUh46KXJLuNoL
         W55/6YtoC77Yer9xIfi4oJW0YKDYRtpZlQLBqcjIjJLNGpkzM+ajty+mXzRrV3vHhkbb
         ugRA==
X-Gm-Message-State: APjAAAXudbxG4+n8sv1oo6H2JGDoOG2BpXf4/OwjzzfD+k/kRRk2gLLB
        Ai4/eTwCWD1+/IgHGJkwRlUvmNacf2Vw19Lwv4spoA==
X-Google-Smtp-Source: APXvYqyayLEeP5GtY+NODuGBcU+zsbAld/JABRRGHZCAz4et/eo3y8m/dSZIPA8S70tZ6ZYfJ0ig358jv/pC+9AXJKE=
X-Received: by 2002:a2e:9094:: with SMTP id l20mr11194298ljg.35.1570226629592;
 Fri, 04 Oct 2019 15:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191002122825.3948322-1-thierry.reding@gmail.com> <20191002122825.3948322-3-thierry.reding@gmail.com>
In-Reply-To: <20191002122825.3948322-3-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Oct 2019 00:03:37 +0200
Message-ID: <CACRpkdYhSu9feBKqFA4wGdWP81fgjNYPHCdC7zaZ+eqO+caw5Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: max77620: Fix interrupt handling
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Timo Alho <talho@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 2, 2019 at 2:28 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Timo Alho <talho@nvidia.com>
>
> The interrupt-related register fields on the MAX77620 GPIO controller
> share registers with GPIO related fields. If the IRQ chip is implemented
> with regmap-irq, this causes the IRQ controller code to overwrite fields
> previously configured by the GPIO controller code.
>
> Two examples where this causes problems are the NVIDIA Jetson TX1 and
> Jetson TX2 boards, where some of the GPIOs are used to enable vital
> power regulators. The MAX77620 GPIO controller also provides the USB OTG
> ID pin. If configured as an interrupt, this causes some of the
> regulators to be powered off.
>
> Signed-off-by: Timo Alho <talho@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied.

I am looking for ways to pass also nested irqchips along when registering
the gpio_chip but I guess I need to clean up all the chained chips
first (getting there...)

Yours,
Linus Walleij

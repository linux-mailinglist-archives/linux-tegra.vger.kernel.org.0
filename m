Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12F656351D
	for <lists+linux-tegra@lfdr.de>; Tue,  9 Jul 2019 13:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbfGILpJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 9 Jul 2019 07:45:09 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36280 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbfGILpI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 9 Jul 2019 07:45:08 -0400
Received: by mail-lf1-f66.google.com with SMTP id q26so13191180lfc.3
        for <linux-tegra@vger.kernel.org>; Tue, 09 Jul 2019 04:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=seSzBj7AVM5QAXmTv+Gol7Pcz0p7LUdYuUhosI+3OMk=;
        b=IIni4gkwnjWLWCyUw1SdCL25sb64vL0YCG20t+qjKZU2aG8OHTv4Map8ZoiYxfoSAr
         dSZiRr8g1HPLIceVx+A7oA8o7YR85fzdcjp+agRhQQ2YMmBYVYC77S5XRJaxq8+pdFiL
         Br44M5cTSEqno5Wo3p08ugG7lAW/ZecDoB0IuV0OTzQEDEQ7+sGLlIXyCW+9RJzbX6G1
         pJRfumDWsnM9F25A/nwLs1uFEXbTgy5BaHAh2KwLsc8QE5YuwVqcRLHPprMG3lmwu3h7
         CqBJGDwARV32389VNVOzhXPN+5Phff3eq4z8Fzge8n7dpVD9fuq7YlJdT1BhcWqf2jqB
         uPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=seSzBj7AVM5QAXmTv+Gol7Pcz0p7LUdYuUhosI+3OMk=;
        b=VNAvkvsYqMdLkFrp3RYPj+gGeB2ogTKuLaab7Uq+x5FD1uJLVGd3/Am5qG6axnRFpP
         EKbVXdqBJ+i7Lf6/aWQr60ZM8WZuar48pcdKXQWpIyVvEWIl9DupS76APYZHrHe1gKrr
         SlmoEPGvgPMZe+AXwBIufGc2mJWsrq5vDh/sg1g7SEj/yuNBgvyxyG2BtP4QOuN+ucFb
         qkk4rP6Y6ytWpm++SHRBdFqrpOKBsNlWWOgzAh627ceqMU38uoMO7uF3uzfB+djAosqf
         CEyiXjzA7kzD58ecLzWloIexnaRRasfhQ6LaVEg+UqCk1ElYJo33fjp3v1iWDocgeS3P
         e/uw==
X-Gm-Message-State: APjAAAWpnx3FMfg2suR3ljPeW80vgd9VPIC4Qda6CZXefYgMeWYt6v3C
        dzriUl7IBMu9HCyUxRqN3L1RoSzmIR9XLtnu+WJ7Ug==
X-Google-Smtp-Source: APXvYqy/8XcCvB7nFODWD7OENtnuJiJybM+yNUBuqGnuVouCx9mUgPQgu2w6rIbgvNniO8PCprZNbAC9qXzmLQHXU80=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr11675399lfp.61.1562672706813;
 Tue, 09 Jul 2019 04:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190626134258.26991-1-jonathanh@nvidia.com> <CACRpkdaFOs24DJbXg4eKVOAzdGOx__X9rbHPcPUzpTJpZ-jbVw@mail.gmail.com>
 <f5e711a6-4472-8dcb-56b2-b789733231c2@nvidia.com>
In-Reply-To: <f5e711a6-4472-8dcb-56b2-b789733231c2@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Jul 2019 13:44:54 +0200
Message-ID: <CACRpkdbGoh-rHpiKzp+QKirSRdE8uE3nGoUDCxx7USvOkES-kg@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra: Clean-up debugfs initialisation
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jul 9, 2019 at 12:11 PM Jon Hunter <jonathanh@nvidia.com> wrote:
> On 08/07/2019 08:04, Linus Walleij wrote:

> > Sadly I've had to revert this commit because of build errors, but
> > let's see if we can figure it out after the merge window.
>
> Sorry about that. I will be more thorough in future.

Don't beat yourself up about it, happens all the time. I saw Arnd
sent some suggested fixups BTW!

Yours,
Linus Walleij

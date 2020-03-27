Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C784195566
	for <lists+linux-tegra@lfdr.de>; Fri, 27 Mar 2020 11:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgC0KhV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 27 Mar 2020 06:37:21 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39274 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgC0KhU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Mar 2020 06:37:20 -0400
Received: by mail-lf1-f67.google.com with SMTP id h6so1653064lfp.6
        for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2020 03:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Vut7VTM7zs8ysH2B780ttrV051MkOP9F58aRnk6Cy4=;
        b=Kuh6tIjTFFoRTadz8ATz0SFS70JETusKnlolh2hu3umOXxgAaqXAG22Jz0eGeJvuSv
         Py8+njw29WvZ0Mjz7rC76QpmsfhRwfOulZsHidLIPPHKU270HX6SYTbuwkamkVOdM+qs
         Yuv7GQ9/MwN8JX6PsMBwUv6vVFiy28fBwPVc87KzVRNtHV/U6q9v6pIyBDEqRiMGCy4w
         OjgWcrarThtJYwB7cCz0nBYWmHXenzaVyiGZSENgdj4gKqmtzpbH+6IKEQtMTw049iRA
         /vvmVT17EcX610ymkNOegvRb3H7kRZOELLBzB+8Hp1i4uMQCAZohq/qpqqmMtDogmQXL
         Qq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Vut7VTM7zs8ysH2B780ttrV051MkOP9F58aRnk6Cy4=;
        b=oehLmEg8v5piwumZobTKV0WP98fhy8Vv7H297Eqgt2jrj9KUReJ+JJyhWdPZIeUz9r
         7BglMIhBIjPpmXIfJ4ZuHUve8BAcP/KJtOywPHo7KUE9o/WtytVJ7TVmlm6EE1iMiQBh
         IS4UEil6lpsChm2W91UvP5NFlpVIZ/vER9BdvPpvm3SUvSzT+Z5CezvXFNZMZvTqe3LY
         6ZJyVgMKBsqvXla2bQ6busaERzn9vk4C1quvi4Jf8tMmBck7PUCvCnprgFSHeBBf4zSj
         sKgG0z+L8+dFAwsAUCAP47umLegxED07yiGU8pYnsjv9qEV8r5dvv1oyMZtxdErNEAkk
         AuNA==
X-Gm-Message-State: AGi0Pub92qzrHhi0Cb9RmLvYafcZ3VIdCMqw8pOV3OKLagn265CSlZ1p
        avlCsaBXQ1AmOC9gbcErdzoli1XK81tIApVanp79Rg==
X-Google-Smtp-Source: APiQypIR2wA4g/0jaaOBlxu9E5xNVvbe/zDIM3SSAhpl1yLArRSZKVGdzEd6rwtgYKagGojPKD3FAt7LUBSldz2ZbJg=
X-Received: by 2002:a19:be92:: with SMTP id o140mr711841lff.217.1585305438741;
 Fri, 27 Mar 2020 03:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200319122737.3063291-1-thierry.reding@gmail.com> <20200319122737.3063291-2-thierry.reding@gmail.com>
In-Reply-To: <20200319122737.3063291-2-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:37:07 +0100
Message-ID: <CACRpkda5M4NPvMBBLg+_2BJw7ZmryrgN72JZL_XAFQ137s0OLA@mail.gmail.com>
Subject: Re: [PATCH 1/9] gpio: Support GPIO controllers without pin-ranges
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Mar 19, 2020 at 1:27 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Wake gpiochip_generic_request() call into the pinctrl helpers only if a
> GPIO controller had any pin-ranges assigned to it. This allows a driver
> to unconditionally use this helper if it supports multiple devices of
> which only a subset have pin-ranges assigned to them.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied.

We have some drivers like this:
drivers/gpio/gpio-pl061.c:

        if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
                pl061->gc.request = gpiochip_generic_request;
                pl061->gc.free = gpiochip_generic_free;
        }

Should we just make a patch assigning these callbacks
unconditionally as a follow-up?

Yours,
Linus Walleij

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A190AF31E6
	for <lists+linux-tegra@lfdr.de>; Thu,  7 Nov 2019 16:01:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388597AbfKGPBv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 7 Nov 2019 10:01:51 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37488 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387964AbfKGPBv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Nov 2019 10:01:51 -0500
Received: by mail-lj1-f194.google.com with SMTP id l20so2645688lje.4
        for <linux-tegra@vger.kernel.org>; Thu, 07 Nov 2019 07:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jgAkr102LqQKPAr3pGJYhPDK4e/SFK30Vkoy1JW8C9s=;
        b=K6FTWVC18/HyP+n8tnIdWBbmpg4P7IxBIGjTfd3smZOdNgDhapmaHf1IhT8kb2LSeg
         Jp07yGotkBOcA6+pRceCmh3VjtNawsLwxSifx2YACvzh9JDUgrSG5pHHU6YW2cq3V8qi
         wbXClCy8b0xtcYKRt6csHAPi5UH1fVW1AlSaTW87EJcyy26oAX/KQxunAyTCdCbMLQao
         hmwkxLx/5OQRsiBShbFCZRZq+qwSxwx5ReOVAbsv2fE+fKibsPIEhdksbqEEnkH6QekX
         NqQzaZNv//tuRz+X9s5Fgxa3pRbvJVbZDYBy4Ju2n+OYbhL2uB9GnNoF66wM6k4KJ3B1
         J1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jgAkr102LqQKPAr3pGJYhPDK4e/SFK30Vkoy1JW8C9s=;
        b=WgctuAFc3PAytBAx47l9Dw2zD2qqFIrcLDdo8Owp5Nh9aMlv1YhrUmZUnKMvFp5ERe
         Zyz8UNMn4+7U/wRbYQKEnb9DOuiWCgxeymWbRLaP2rV7vYZ20zcNz/1VJ3W/vmHJ/BM8
         o4ReLHynpsFsE7gNbJEckavZpXyUk96Gy1MrLrXuUmgEhAXN7rXAy/NjNaDeaFMGNTnD
         fOqmp3yBFYis0jJW/rGhjY0aGSl/M3KLdOLnbJO3tzEbJEu0j9NlPvSihazg8JwQEwkG
         z82LDPZxSaljjMEeBkpL17DqaNDdCSWxwnGWl/HWfy/G/d+4+/nTwkTaehJ9lcHgt3Do
         JjEg==
X-Gm-Message-State: APjAAAUk8Wv0w4BSKGlLbNhpsNsDDhYedsUiLVMpXb/AGzd+0IbNC5GN
        IeZbwgbmc3mosugkZMbL0dc75vB+aVIjY0zGdIRAxQ==
X-Google-Smtp-Source: APXvYqxEfc/CuHeO/tUPbA/L8KnwpKF2GYeDL5vyFe1U1/wxU4srnu1AJ/8ugakgyWV8GG7sl3Pz4PrhWVkvlJpK/wQ=
X-Received: by 2002:a2e:90b:: with SMTP id 11mr2740565ljj.233.1573138907121;
 Thu, 07 Nov 2019 07:01:47 -0800 (PST)
MIME-Version: 1.0
References: <20191107103540.21088-1-jonathanh@nvidia.com>
In-Reply-To: <20191107103540.21088-1-jonathanh@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Nov 2019 16:01:35 +0100
Message-ID: <CACRpkdZircUVEcQHV2saCk_Mihf-hUWWKUJ=h9jg1it58VeitA@mail.gmail.com>
Subject: Re: [PATCH] gpio: xgs-iproc: Fix crash when driver is built as a module
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-tegra@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Nov 7, 2019 at 11:35 AM Jon Hunter <jonathanh@nvidia.com> wrote:

> Commit 6a41b6c5fc20 ("gpio: Add xgs-iproc driver") introduced a new
> GPIO driver for the Broadcom GPIO controller. When this driver is built
> as a module the following warning is observed because the
> bcm_iproc_gpio_of_match structure is defined with the __initconst
> attribute ...
>
>  MODPOST vmlinux.o
>  WARNING: vmlinux.o(.data+0x834d0): Section mismatch in reference from
>  the variable bcm_iproc_gpio_driver to the variable
>  .init.rodata:bcm_iproc_gpio_of_match
>  The variable bcm_iproc_gpio_driver references
>  the variable __initconst bcm_iproc_gpio_of_match
>
> This then causes a translation fault on boot which and results in a
> system crash. Fix this by dropping the __initconst attribute from the
> bcm_iproc_gpio_of_match structure.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Incidentally Mark Brown already sent an identical patch.

Thanks anyway!

Yours,
Linus Walleij

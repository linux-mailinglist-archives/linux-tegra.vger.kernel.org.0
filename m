Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2164ACC582
	for <lists+linux-tegra@lfdr.de>; Fri,  4 Oct 2019 23:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730836AbfJDV64 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 4 Oct 2019 17:58:56 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35031 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730618AbfJDV6z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 4 Oct 2019 17:58:55 -0400
Received: by mail-lf1-f66.google.com with SMTP id w6so5481435lfl.2
        for <linux-tegra@vger.kernel.org>; Fri, 04 Oct 2019 14:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j453WNsSMfecyCoQY7VzUIyW3gFQh62iMQgb3cot0yo=;
        b=FCCkoMEVZtJTRMDk1y780eRkneHFdnF4M3fUod6sSrVPv2h4Bswq9TrSTKb8nVuU94
         yHwzKE807k5FccoAl8T5t1M50cnGwzyUw2IedUw6JSIBak/NvtILQH3CzuWTG0ydrEDD
         IHSeQdsWuXBkO0Tk5i0ngM2xcI/JFm2E6oQAiQjIVnfjoVT7EdnuaGhrHUzP4gfrNSEf
         gbu3d9zNlvBE4J2c7XUJOdXXj7TeP4HNIv5agGU7HUgei8nszcLfid709lp1pV6XAFv3
         +EP+WWBQd1cYmVxTM4u/wavzkaO/qeLYhe724YFhCDPtjGAvI2gHC4XtdrTPRWqc3sSd
         9bLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j453WNsSMfecyCoQY7VzUIyW3gFQh62iMQgb3cot0yo=;
        b=lxi8Jm0+IArhsdLxmPHLs24rVZecBS7SKEbOM16soWCHO8pTZ8l7c5S8BLqmC06YFa
         XLGTAve26Xn+3SS6tIzy02A8XFxxVgWHI4D7BbvO24X4M0VSREwtnIsJaXM5Xf8IXtRX
         O0ym7g7b554csX5zbgO6XWa01v8ufe2SZ3alNdNW14bRJitZV2GYSMSgQQh8IqPywfO1
         3sMe1Z9lVy67rsJGeacLeFof4pvQGCO+hc6BrHLsnHUeS4OPA1atuUQulxV9FOwgE46O
         46V5AhFVWhOEpJTDFG4vYQ6F9kaKzZR5JtqyoZ/EiOoxkNmzJbU0fdWzC98RAFdlFcYq
         fSCQ==
X-Gm-Message-State: APjAAAVap+cJaX3AhhqTXJmednpyzKPABhcd5OUfXH3MSG66CL0s1LBf
        TmEUVBbxpsEu0gTF384uwm8E/2bnRAEzOBmCLKfWLw==
X-Google-Smtp-Source: APXvYqy3Z3ai5AV08IvVin/TZlw4UG/kdlBlNxOsNMKq/7fVtBn2PEOEbUPCbfoSvLfZseN9UdTg8Hk1wFafNOLhEZg=
X-Received: by 2002:a19:14f:: with SMTP id 76mr9856396lfb.92.1570226332814;
 Fri, 04 Oct 2019 14:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191002122825.3948322-1-thierry.reding@gmail.com>
In-Reply-To: <20191002122825.3948322-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:58:41 +0200
Message-ID: <CACRpkdYS+nH5jVixrJbxV4wqPgibp_JS+q=YCVwTMMND6ccwKQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: max77620: Use correct unit for debounce times
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

> From: Thierry Reding <treding@nvidia.com>
>
> The gpiod_set_debounce() function takes the debounce time in
> microseconds. Adjust the switch/case values in the MAX77620 GPIO to use
> the correct unit.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied for fixes.

Yours,
Linus Walleij

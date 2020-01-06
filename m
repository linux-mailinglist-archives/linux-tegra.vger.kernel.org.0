Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFDB131BFB
	for <lists+linux-tegra@lfdr.de>; Tue,  7 Jan 2020 00:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbgAFXBB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 6 Jan 2020 18:01:01 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41338 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727299AbgAFXBB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Jan 2020 18:01:01 -0500
Received: by mail-lj1-f195.google.com with SMTP id h23so52676060ljc.8
        for <linux-tegra@vger.kernel.org>; Mon, 06 Jan 2020 15:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x35O4zv+MmKkyxLx20K7qZ5rGN6z5t0hn5W8N9EKK6o=;
        b=E6hKWjGLmZ8ZQoHt18sYPe3krcxXh3c8CGs29Xtrln4dJkHF3hVWFGZRrAfQZ8ftEf
         VgAHMmt2JbI477eK4ihBH3mxcqmPqE+7VhuRIWrmcaytAmIBXhJPBDkueETmxO/WqHCC
         g5MUXXyBNNvLqJt5SYf7I1INe4YgRXpPVq6M6ZNyyul0/TW3YaKLMjzradzgf/7r7pX7
         vlpnW5qiK9GugwaH5tdw50uUITLTii0E9u3asCofWLSkBbdjZ4fdyh97uxsh1IayV2zY
         89YRd+goR3SgbahjeyGwlm+NB20U/633y+Dg7huT9mukODe1fbkIbrkqsgmEWj1gakg6
         hrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x35O4zv+MmKkyxLx20K7qZ5rGN6z5t0hn5W8N9EKK6o=;
        b=DfWskrzwqGO0sNqUJ8pBgArZOuBTIU7yA5iG4Ybv4c/Am7eSR9A/BSAqkY6FqWqwOu
         saXdaD24CAvawphp9HDd1TZpDk1oUVDmGJ2t8J+LfQkOxeahMeEvJeQYzjEve25vVxEk
         mypeONtIX2Nlwu0N7fsx2itnG1g4PG0SDl1ET5qZTtDqoVlu+Lbw+qpzcAAK5Yicsojx
         wZLghbGQCm1U5paId5eoMeeB38GwGefFpSU+FkGRNnleFCBVe+ndzCYWTjv47uMMpJ17
         zhTuUhvxItyf8k4+8S05U2vnhHlEV7d66/0hIEyE3KagSfO+QXmM3Y4gAnqlqafs2vTw
         qRPw==
X-Gm-Message-State: APjAAAUMYFPFg0S2VmdH70IRbG7tjcNGHezregOTDSqG4HNw8wvtkgQf
        dOAvwXEMA+jAhX3Cdyy1nRq94L73H3YmMypnbMwZkg==
X-Google-Smtp-Source: APXvYqw+30qfrnMTbleKw8z8hjUd46irlCKr1QGJePyP0TmOpc/5UKkeZNI7uZYDjMYXzy8GioZTga7MDKJHa5S7pLw=
X-Received: by 2002:a2e:844e:: with SMTP id u14mr62027794ljh.183.1578351659340;
 Mon, 06 Jan 2020 15:00:59 -0800 (PST)
MIME-Version: 1.0
References: <20191218110456.2533088-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20191218110456.2533088-1-ben.dooks@codethink.co.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 00:00:48 +0100
Message-ID: <CACRpkdaULw+=1Sz2pY3sRhooxu2xVJnpCB7wJcYqBfMXnyTFgA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra: fix missing __iomem in suspend/resume
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Dec 18, 2019 at 12:04 PM Ben Dooks (Codethink)
<ben.dooks@codethink.co.uk> wrote:

> The functions should have __iomem on the register pointer
> so add that to silence the following sparse warnings:
>
> drivers/pinctrl/tegra/pinctrl-tegra.c:657:22: warning: incorrect type in assignment (different address spaces)
> drivers/pinctrl/tegra/pinctrl-tegra.c:657:22:    expected unsigned int [usertype] *regs
> drivers/pinctrl/tegra/pinctrl-tegra.c:657:22:    got void [noderef] <asn:2> *
> drivers/pinctrl/tegra/pinctrl-tegra.c:659:42: warning: incorrect type in argument 1 (different address spaces)
> drivers/pinctrl/tegra/pinctrl-tegra.c:659:42:    expected void const volatile [noderef] <asn:2> *addr
> drivers/pinctrl/tegra/pinctrl-tegra.c:659:42:    got unsigned int [usertype] *
> drivers/pinctrl/tegra/pinctrl-tegra.c:675:22: warning: incorrect type in assignment (different address spaces)
> drivers/pinctrl/tegra/pinctrl-tegra.c:675:22:    expected unsigned int [usertype] *regs
> drivers/pinctrl/tegra/pinctrl-tegra.c:675:22:    got void [noderef] <asn:2> *
> drivers/pinctrl/tegra/pinctrl-tegra.c:677:25: warning: incorrect type in argument 2 (different address spaces)
> drivers/pinctrl/tegra/pinctrl-tegra.c:677:25:    expected void volatile [noderef] <asn:2> *addr
> drivers/pinctrl/tegra/pinctrl-tegra.c:677:25:    got unsigned int [usertype] *
>
> Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
> ---
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org

Patch applied with the ACKs.

Yours,
Linus Walleij

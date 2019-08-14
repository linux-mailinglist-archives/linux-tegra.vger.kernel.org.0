Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E55658CE2D
	for <lists+linux-tegra@lfdr.de>; Wed, 14 Aug 2019 10:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727465AbfHNISb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 14 Aug 2019 04:18:31 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36223 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfHNISb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Aug 2019 04:18:31 -0400
Received: by mail-lj1-f193.google.com with SMTP id u15so9022131ljl.3
        for <linux-tegra@vger.kernel.org>; Wed, 14 Aug 2019 01:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m0wjk5E/4x5K91cIqKBkHlxSBbHGEXxN+dABmdb1znY=;
        b=HXYD3A+fwqt/PKidk2m58VKvGG4sRsUQIr6r2XXSzqfwobtUxVMzGKKH2MUjGoJpuW
         Y2zkAy5nA1VzsN0U1aOBUxlGAoMzojbuigNte352tNiW+yF9ywySROsNWUuegooza4Hd
         qI9aiDZG+f17RKc1xXfaAtVHrTBG34GftwfepjbsxdrV52k9FUUOU9BQFrFg2K7vLZcS
         Jml+6QIwXexZm1bWyQsI/iYiJZ6zXTYb+sauRoAdXQidamPSPii/zJdSrvT1ysmT4ruH
         AgSi1Z+M7yLU729X0ixSoj20EttQ0v3s50jk7aThrJzZ1AdvOjQyV5g+mKKVs8EgVRda
         rxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m0wjk5E/4x5K91cIqKBkHlxSBbHGEXxN+dABmdb1znY=;
        b=kCGHyTit506OkTN5B84Hk+jt383MTOXPLu35NQRGf/6PgX8QgHZ7GxXbweWTLsmJ6K
         Eyw8XfjlBmuUCg+IksigOuROZWfAvgYcHsjmXcH3ltOUBFdtAufoyGSUDQAuGMWNdX1y
         cCBqotmCiGmJwpojsR7Ip3vpv2oEOR0365QLB1KuRyqdxn600aRkg8KUvrj80xxQ7ASV
         LInhnsOp8uXGuGajDNAWiEDadYeAKPWyvji8t3ED7yv7kAIVL4VTAf1tXnqo80Oc6BRn
         tXKlBDo4zdNL/wkKNsN/X89M+yKuBNDw5eSTJ2C0WLqzs4g9v4Xylkj0r0IUMkgJs2YI
         shDw==
X-Gm-Message-State: APjAAAUUTmliD0kMHhiVqhpK69XCPnmTuTUDLJGe5k7b25qKA4Gm6C5x
        sAv/6diZ00Tt0MALvDlzvWzVOIY0nU0jgWUS9jua1Q==
X-Google-Smtp-Source: APXvYqzLLOoVw3kVXVgx3yXJr9522cUBCimMwSqR12tyG2Idqh+DoGMnmwHpfho9LwjJJ12Fkv9YSmL/uuc4GD/ihEM=
X-Received: by 2002:a2e:810b:: with SMTP id d11mr4787060ljg.62.1565770708715;
 Wed, 14 Aug 2019 01:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190808123242.5359-1-linus.walleij@linaro.org>
In-Reply-To: <20190808123242.5359-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Aug 2019 10:18:17 +0200
Message-ID: <CACRpkdZOUoeE4Ldzg_wAUqNxpZC3UBUSXBsMBU481oU_UHffbA@mail.gmail.com>
Subject: Re: [PATCH 1/6 v2] gpio: Add support for hierarchical IRQ domains
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        David Daney <david.daney@cavium.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Brian Masney <masneyb@onstation.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Aug 8, 2019 at 2:32 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> Hierarchical IRQ domains can be used to stack different IRQ
> controllers on top of each other.

This is now applied so we get a solid base for testing in linux-next.
Address further concerns with incremental patches, either written
by yourselves or by poking me to do them :)

Yours,
Linus Walleij

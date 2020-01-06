Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76716131BF0
	for <lists+linux-tegra@lfdr.de>; Mon,  6 Jan 2020 23:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbgAFW7P (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 6 Jan 2020 17:59:15 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40957 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727270AbgAFW7O (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Jan 2020 17:59:14 -0500
Received: by mail-lj1-f195.google.com with SMTP id u1so52637324ljk.7
        for <linux-tegra@vger.kernel.org>; Mon, 06 Jan 2020 14:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C0KNG+0OExH+PgE3Je4nnY6Td9Ccw4KBccd9DW70NKo=;
        b=F1W6FrjBpZ29K0G9T9CoWndO9TPARRdTZkCrQ+TZ6DnirL28X/Ao01Xngla2oAx8aD
         wZg6KYQYKH495KPdcHL0gPBqyRskLBesIDSTE2LPxinAoggI0DaNjYwa6+9jREEcZgZW
         qSm6vVsfwPwEU+8R2hR9CdCbg1FILYS7Y85J0xzQbXGcGanAZ6VUxW6/JvhIPDPQIf+y
         7VWfuWdwEEL4LQV5mals5C2khcjyQksim3mb2q/O5Qt7Df3ojZbW8A90z+ROMB/hjTzW
         kAgoeDeN5DHHqv5zQSJ9m7pMwOMWBTjjssM5TxjH7MILgz8N6clZFh/F+CKbj7y9cQc5
         6AHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C0KNG+0OExH+PgE3Je4nnY6Td9Ccw4KBccd9DW70NKo=;
        b=C8T+FCAdZaaa1Bqh/VJMThtUlgL/cMMUhWvir9ridTAkygvn6HGBP8ScyBamorOoZI
         17MBX6hmQKBnijqUJwvb2L1wSGSUoEgHo8YdNKQg/oQorl0Wd7EFot7qRoajcvtqSHaX
         PObx6pSkif6nShQo4K+KeYmeqgh4ZNIaM6oWjVDypnWP7/nOisQlBTwHO4X/ZzKjrkCh
         33dp2Hh9L4tSD5ZEd3ZRfcp6rZHJKlhxg9ZuGMD0s6T3dUbZyfzAWzNXjOb2Oo8RfErp
         q+150dOi5Zt4Wr/ay/UvNCVIwQg6cyVlc1lIcrKS0TkXhu9j3d3K1FPFcePbgwkt2PzL
         gqNg==
X-Gm-Message-State: APjAAAXvSDMDDMyIDxv50z71DP1026zedZBAN0QCFygw0pvUyfApoCme
        9AT9mQlHgzw+EioAANRJGQ1m8FEuid3SJom1Kap+xg==
X-Google-Smtp-Source: APXvYqzDJbaUismLGujeor0umiyYbHuGqsL7l41pJ5HBf+0/0CpHdmcEUNRW/RHFYfBWr5eT4fcWBMlE9u0L9WYEDME=
X-Received: by 2002:a2e:85cd:: with SMTP id h13mr59765545ljj.191.1578351552102;
 Mon, 06 Jan 2020 14:59:12 -0800 (PST)
MIME-Version: 1.0
References: <20191215183047.9414-1-digetx@gmail.com>
In-Reply-To: <20191215183047.9414-1-digetx@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Jan 2020 23:59:01 +0100
Message-ID: <CACRpkdYAKS50-CNmE0nRNQanFxKejoHrwxho3fZXROoLZUb4+Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Tegra GPIO: Minor code clean up
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Dec 15, 2019 at 7:31 PM Dmitry Osipenko <digetx@gmail.com> wrote:

> I was investigating why CPU hangs during of GPIO driver suspend and in
> the end it turned out that it is a Broadcom WiFi driver problem because
> it keeps OOB wake-interrupt enabled while WLAN interface is DOWN and this
> may cause a bit weird CPU hang on writing to INT_ENB register during of
> GPIO driver suspend. Meanwhile I also noticed that a few things could be
> improved in the driver, that's what this small series addresses.
>
> Dmitry Osipenko (3):
>   gpio: tegra: Use generic readl_relaxed/writel_relaxed accessors
>   gpio: tegra: Properly handle irq_set_irq_wake() error
>   gpio: tegra: Use NOIRQ phase for suspend/resume

All three patches applied with Thierry's review/test tag.

Yours,
Linus Walleij

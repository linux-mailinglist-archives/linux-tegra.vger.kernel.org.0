Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9948E132247
	for <lists+linux-tegra@lfdr.de>; Tue,  7 Jan 2020 10:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbgAGJ32 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 7 Jan 2020 04:29:28 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36381 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgAGJ32 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Jan 2020 04:29:28 -0500
Received: by mail-lj1-f195.google.com with SMTP id r19so53968437ljg.3
        for <linux-tegra@vger.kernel.org>; Tue, 07 Jan 2020 01:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QC9ax52njxZvfMScI+pYnjQCr3iWMenb27w408KKrvk=;
        b=VawLg59+alC4Ja6gv1Z3uCiXgCNzcJLJpvipMvn2OVSXu2KNmIuRsXFGua6ptiTh/w
         qSdYqTAEKZo8pIoRpmX2NKPkmOiPtuJawUbLF9dkcNAKwiAZNSrf1VzxsQc9sGovj5Bi
         3XZ36wmH4gl0oK+E1maUaLZbgFYEe8PsbKukmE/0L5HHkkesnEjA+o0yjHGchS/VsaRZ
         5zehEYxQiEh/uAlwFmemlszl/W8fqp1SkB26V0BPLy3tHmWzZJpFiLAAg84dfiE6XTsX
         haZ+flyh7QGPii5Bbp99VziRU3hhv8ZWxX/jC1QYphoMccZEVmGXxtRsuIb7N4KZr9Ey
         Z6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QC9ax52njxZvfMScI+pYnjQCr3iWMenb27w408KKrvk=;
        b=qnq+FxWFB+qihPnhGI55RiaJWqxfuixoSq6wwFoIELl+Q3NNUSvZlPIX56JFcgS8WJ
         Lg4Ol6K/KS5cAcUqPL+xdQtr5EskqkDvDFiYz0s5/0zpvXKts44kKVwpullPF7/yRnzG
         mRYT/VFBSW8u+BecdNq1o4dKtIl+Cjrpv94r7ObRJ2stmrlT6GJK/AGj+tJvNrlo9eLU
         Vy5Pq+ZoUTtLUljNmvVn5rABUkcxH0/Y1U/aQCe1DR7GfmwmyY/akYsDE+dY6xluOoLq
         XPMMqmg/MOqKTcCMqS+AsoRbglNRcGjaSewxOf81oPpwcLWA+OnZFtLqDwA8S1RV3Yxi
         cLvw==
X-Gm-Message-State: APjAAAXV8OqsLEQxebwAAg2ObXjmAkSwFeETnPAlbmQdq++VphwlHo8t
        2uC87dVRp6yTy11a7fUDqTSDz0DuBAQLuGdjg84CWA==
X-Google-Smtp-Source: APXvYqwwJvG6nEjsJq9xGfjG/kmOi0JGnHLKITQfD4l4UDDPnalI+bHc11y+yVlnnuEjiIhEiQoZl0ssMyyQlW0D+js=
X-Received: by 2002:a2e:844e:: with SMTP id u14mr63371948ljh.183.1578389366818;
 Tue, 07 Jan 2020 01:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20191215183047.9414-1-digetx@gmail.com> <CACRpkdYAKS50-CNmE0nRNQanFxKejoHrwxho3fZXROoLZUb4+Q@mail.gmail.com>
 <CAMpxmJVi1hy6a72M7rAHP0AXW1Z4cGp8H0O6ayLMwFm9UL3WPQ@mail.gmail.com>
In-Reply-To: <CAMpxmJVi1hy6a72M7rAHP0AXW1Z4cGp8H0O6ayLMwFm9UL3WPQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 10:29:15 +0100
Message-ID: <CACRpkdaNAzpDu6uxETnuDGxnXTJTh0LhcE=9DL9-Kwi4butZLA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Tegra GPIO: Minor code clean up
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jan 7, 2020 at 9:25 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> pon., 6 sty 2020 o 23:59 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
> > On Sun, Dec 15, 2019 at 7:31 PM Dmitry Osipenko <digetx@gmail.com> wrot=
e:
> >
> > > I was investigating why CPU hangs during of GPIO driver suspend and i=
n
> > > the end it turned out that it is a Broadcom WiFi driver problem becau=
se
> > > it keeps OOB wake-interrupt enabled while WLAN interface is DOWN and =
this
> > > may cause a bit weird CPU hang on writing to INT_ENB register during =
of
> > > GPIO driver suspend. Meanwhile I also noticed that a few things could=
 be
> > > improved in the driver, that's what this small series addresses.
> > >
> > > Dmitry Osipenko (3):
> > >   gpio: tegra: Use generic readl_relaxed/writel_relaxed accessors
> > >   gpio: tegra: Properly handle irq_set_irq_wake() error
> > >   gpio: tegra: Use NOIRQ phase for suspend/resume
> >
> > All three patches applied with Thierry's review/test tag.
> >
> > Yours,
> > Linus Walleij
>
> Ugh, I now noticed I responded to Thierry only after applying this to my =
tree.
>
> Anyway, it shouldn't be a problem. I'll take more care next time.

OK shall I drop the patches from my tree then? No big deal.

Thanks,
Linus Walleij

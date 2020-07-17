Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C68C22451F
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Jul 2020 22:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbgGQUXT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-tegra@lfdr.de>); Fri, 17 Jul 2020 16:23:19 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:46773 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgGQUXT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Jul 2020 16:23:19 -0400
Received: from mail-qk1-f177.google.com ([209.85.222.177]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MeTwa-1kWy6D1wdo-00aUGw for <linux-tegra@vger.kernel.org>; Fri, 17 Jul
 2020 22:23:17 +0200
Received: by mail-qk1-f177.google.com with SMTP id 11so485302qkn.2
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 13:23:17 -0700 (PDT)
X-Gm-Message-State: AOAM530d8y0kktGnYEHAQooOVeeUwGHGWttQ5I2wkrmBcKeVGc7SsGUC
        /qHgPAlvCtbZ4sdnB1B8j+dkvPGXBrzqarF6v4c=
X-Google-Smtp-Source: ABdhPJxPu2KLH6FekmlVew985LcUBtfP3OaFHddT22RGu0hrBiIaUfr6Iw0Z1pdGmsVIG4lEf+9CUIYLFhCScuvmQ4w=
X-Received: by 2002:a05:620a:1654:: with SMTP id c20mr10631928qko.138.1595017396321;
 Fri, 17 Jul 2020 13:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200717161300.1661002-1-thierry.reding@gmail.com>
 <20200717161300.1661002-6-thierry.reding@gmail.com> <CAK8P3a1niUF7xK_bmz=8NJbRGxs7iFzNnRgRS9H=bXpMqarsWg@mail.gmail.com>
 <a6f83a03-3a8f-47d0-6770-fe0e2595cde5@gmail.com>
In-Reply-To: <a6f83a03-3a8f-47d0-6770-fe0e2595cde5@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 17 Jul 2020 22:23:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3nSYfotK=0ZL9XqeMi-v0nqxFZnFKy4OAbvnc9qzN8Xw@mail.gmail.com>
Message-ID: <CAK8P3a3nSYfotK=0ZL9XqeMi-v0nqxFZnFKy4OAbvnc9qzN8Xw@mail.gmail.com>
Subject: Re: [GIT PULL 6/7] ARM: tegra: Default configuration changes for v5.9-rc1
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:Nyiq8qLJcv+2PMwD19W6fvAXHBNS6bBb15hhn8pmN8TgZ4GtIXD
 U7SDcxxc/z7nTMRKLqWX2wnLowHrwybJc2Fr0xpQSVT8xDWPe0aAt/ndZ9R4EcJErcmgX78
 xt5VIh/1pWO5xxY4SrFki5Z1lru+l9PaD1VYk0Hlv9nw0dyrR/tF1JRqfiVZpH9y5WRTSt5
 yx7FQ0JmcaexwykmyTCBw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/bikSQbFQDs=:T3Ipp/qLUU7mMPQiAmO3oH
 /0x66aOHpbcQ2zp/HufLmBDIkRAzGcImgJzk4mxkNQQ+nGO9gfLEm+yIh1tB1vJWGDEMuET4n
 5XSvKecGE5F6GQRYlKc5W2ObSj8NW2tloU5S3kSUN67k7JYEOLHGI9ebK2GOxeJi9Th+gsE2S
 tSwHVwLlHo1Fd2DUvJkzBN++hTHRxrwoWcI8lt0zKJ+yH7a+bUHxze9BbuZPCAr55/83RdiWf
 OXjc9ZG0dxpMwGiHJ0PQp8rtYNsSQDa4pi3CTeQaJeTho7bS7omaXz9RR9Er2m7AEwxKe+6XE
 2c4aOuy1VZL6MdHkaW8chbwCW/xAotIxNd1hjWsrFKvvmco6KaVmCSVtm1nQb+kJftgO+P1ql
 stYWWnBHF0k3jWkDP10SL62hLeXlFMDvgwAht/8yZt/izx50Z5FLxK7j6+WpAqIBMhB9cJicK
 Dy4aBwQBluc/UWYlgUpFyQBqINTnzfvyxg3yJate0l8eAR7BaMOZi5XDsGYPpT3481HfsT1iZ
 ahZQw8PV4oilDh2ml2RrHM8uU46U72oI9OZOdj8ABbyCtfF1HEAUcvIX8WauA8uJgeoP6D/hN
 oxmippjEOuEbuEi6QpTwaPQSmMn9S3RpjGuTM2iMGPgJ6epsCBbo21hRVcNyjSCTFjiJG/CJn
 YJOEUGwOQ6zHnmCtOl5NFeenG0u1l5EQBo52WoIpR8L3dv5j+GrN51YMlMz/ydzRpq2iCyyAm
 ufF1dTp/Niq1k95EbizkWIa/SIKxmPP9hQ20gQlJrTOu9W4eTkk3ynJIRNTC1Lk7NlIoDYocx
 15WwzZn4VeXtsmwgv5f3/Q65AmOCq0aELNeG7/WOvZj/oNW9m3hK84BBZgkVSJpBLEfbgWvU6
 FBLHBdD6zYC9V7iYQ9YW9cacUqePdQROEfeJdm/LHDeJy6F5tGREFrc5iDlJyTC4dbwhTf4Dl
 rSYwYzFiMhuytEg7eIAchErO7G04ChXW0ZP3qsxd+GonANxO48iH4
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 17, 2020 at 10:13 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 17.07.2020 22:24, Arnd Bergmann пишет:
> > On Fri, Jul 17, 2020 at 6:13 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> >> ARM: tegra: Default configuration changes for v5.9-rc1
> >>
> >> Enables a few new configuration options that are useful on the new Nexus
> >> 7 and Acer A500 devices, as well as the userspace CPU frequency governor
> >> that's mainly used for testing.
> >
> > I've pulled all the other branches, but I'm a little bit wary about
> > this one since
> > Dmitry's patch enables a number of options that would increase the kernel
> > size, and I see no indication that it has been reviewed by anyone else.
> >
> > I think the changes all make sense, but I would prefer to have a wider
> > audience for that patch and get some Acks. If you like, you can send the
> > tegra specific changes in a new pull request in the meantime, and then
> > send the remaining additions to the usual suspects as an RFC, with
> > Cc:soc@kernel.org, so I can apply it later if everyone is happy enough
> > with it.
>
> Hello, Arnd!
>
> But these are already the tegra specific changes. The patch changes
> tegra_defconfig and not the multi_v7_defconfig.
>
> Could you please clarify from whom would you expect to get more Acks if
> not from the tegra maintainers?
>
> In practice nobody uses upstream defconfig as-is, it's only used as
> initial template. So I'm not sure why tegra-kernel size makes you to
> worry. Could you please explain?

It was a mistake on my end, for some reason I thought you were
changing the arm64 defconfig, which does not have per-platform
files.

The patch is good, and I'll pull the branch as soon as I get to it
(it's a bit late for today).

      Arnd

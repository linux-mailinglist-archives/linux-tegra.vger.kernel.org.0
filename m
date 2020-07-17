Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7412D22442A
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Jul 2020 21:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbgGQTY0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Jul 2020 15:24:26 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:42079 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727999AbgGQTYZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Jul 2020 15:24:25 -0400
Received: from mail-qv1-f54.google.com ([209.85.219.54]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N5mOb-1ktuwV0psR-017Fzb for <linux-tegra@vger.kernel.org>; Fri, 17 Jul
 2020 21:24:24 +0200
Received: by mail-qv1-f54.google.com with SMTP id t11so4739710qvk.1
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 12:24:24 -0700 (PDT)
X-Gm-Message-State: AOAM530JHPAxXdLTeJwJaFeaH14YtkgHjx4EjQBenM9G/72jEgKNrsLM
        c+RMl7Z9pSikEo0Zj20mFRLKZctTLNoIs2dcZjY=
X-Google-Smtp-Source: ABdhPJyT6569MMXY8IDE+0Q0/sl008Mo/f+pl9/QikauaqKRFN00SSzW96tok1f648kbGEmeuuXDvO1w/T2QQNUJ1js=
X-Received: by 2002:a05:6214:1926:: with SMTP id es6mr10552135qvb.222.1595013863135;
 Fri, 17 Jul 2020 12:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200717161300.1661002-1-thierry.reding@gmail.com> <20200717161300.1661002-6-thierry.reding@gmail.com>
In-Reply-To: <20200717161300.1661002-6-thierry.reding@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 17 Jul 2020 21:24:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1niUF7xK_bmz=8NJbRGxs7iFzNnRgRS9H=bXpMqarsWg@mail.gmail.com>
Message-ID: <CAK8P3a1niUF7xK_bmz=8NJbRGxs7iFzNnRgRS9H=bXpMqarsWg@mail.gmail.com>
Subject: Re: [GIT PULL 6/7] ARM: tegra: Default configuration changes for v5.9-rc1
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:CJ7z9ACv3h8Ng9eLBNlDGsYJzOItmGWpIHtgrOphBZQkJ1ICEGL
 QMlFxTh1lnv4xcc7yLZwrCjWirHk7Vyf4Rbe/OjGOM8wZvd92a0mYvqwxB+ZUyzRdYldfFV
 7DkMilyWoaJzeQzYLoNY/qET8a3n95WQUaHmhnNKfBG2CXhMHc3N1wJO88sHLI5jVT4HLXV
 /KPcU51gvXHjYk5q+l44g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yYN+rBSj3dw=:+LvImO3HPlmCsDhADnm+gk
 zjSrxzovQ+wPO9Bm8i3g8Y4D5NEc1P5S40do7wUa63NK6ExFm9NyLWzLz+kSZvtyzWY9UUmzN
 n30pa5cMMjzTaTewLwciZjUS3G6HMUBInGB2rAM9x1isqrrFrT2RJ3DqGLm0XD39RB1x5CQVA
 JAvPtH3XIkRknS4EQdojkyQxUzinCQxI1i97bspNOSLO9EjeaWLkSE/hn8yVDBRpEWsfUvu90
 vIRtqljNs1d5mbo9mGCUzcQTz426MzE4OOZV1TD36sSPbZdqmTe3Xu6YQWxr56Kes7K79SjyF
 e0AUcVPNY8lMYyvuayNcBxzl/85PtV1PNpjZzerfohrCX2+g/OpuEoEaoLa6qC4nQlsZaLBKp
 eiaq3yPo0Gwd+PzUGdqRsk5nfuuwvTmlufwGW6O62qOAcDWbT0+gm7eRf9dLQ4dJt7tcJNpNy
 5JoOcCWSK/3LtI2SD3Yhi8gvescbcKNAVe0Bu3KYLFG3nDMvelOkVc2HZRnq+3z+y/p2ofWd3
 3WcIhgN9o11tVq2uxrUJhZ3Hh86Y5rWg8K6AnVSwPqGCR89xaFHfnmB/w0WPdTVo8FCjnNvnh
 4m93hsoxFh5J0U+mZ94+EPHKXfsbbmVNrKwdlouJW/zqEa8KWh1DEOou2Wdl8qravS+GCDdJP
 Al9rFAAdUOtspQktJDHsa5n9wPtWAXHt+dNry1T6IrgZpb5M50BzKDFcEYiKlFlX9iU9LNxgb
 EVP1ZGS8WbWzKGw5Z+D7d6K7KJroyv0NNeNYtNsp9Pnhj0BbyicVGbjQXkv7JcdizqSnoxft4
 T8qhwRZpIJXkbrE96g/ImudwelqTsBgGORPGegcSv424izhVDeM0bAl4VgI9+Ra/70fVs25pb
 2y2SSAiP7P/9+gtyScyb2XK9xFijnyiy4O3zuYi78ea3t+AuHSniUXEV0Ju31c1rw56D8WPbK
 CG0bvM5Rv5dRwixdTcVMTpvFySB/zIZP/IXXSlqAaATGosCgmXh3v
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 17, 2020 at 6:13 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> ARM: tegra: Default configuration changes for v5.9-rc1
>
> Enables a few new configuration options that are useful on the new Nexus
> 7 and Acer A500 devices, as well as the userspace CPU frequency governor
> that's mainly used for testing.

I've pulled all the other branches, but I'm a little bit wary about
this one since
Dmitry's patch enables a number of options that would increase the kernel
size, and I see no indication that it has been reviewed by anyone else.

I think the changes all make sense, but I would prefer to have a wider
audience for that patch and get some Acks. If you like, you can send the
tegra specific changes in a new pull request in the meantime, and then
send the remaining additions to the usual suspects as an RFC, with
Cc:soc@kernel.org, so I can apply it later if everyone is happy enough
with it.

      Arnd

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55CC4224424
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Jul 2020 21:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbgGQTUr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Jul 2020 15:20:47 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:44707 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728188AbgGQTUq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Jul 2020 15:20:46 -0400
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Ma1wY-1kJUr31Wb6-00Vzvn for <linux-tegra@vger.kernel.org>; Fri, 17 Jul
 2020 21:20:45 +0200
Received: by mail-qk1-f173.google.com with SMTP id k18so9787473qke.4
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 12:20:45 -0700 (PDT)
X-Gm-Message-State: AOAM533FXqY2NQS1s4fi4XYXdGMPLtNuWHSov4Q7ZqxNJIWVgNSDGgxQ
        DFFEsat6sAXtZQQIFtiOFDQwKarpXNsu2T0Amvc=
X-Google-Smtp-Source: ABdhPJy2yBi37PoyD3XK1wtfzJepsQxv5Aj5aIW3O/KxaqB09unPZ+e+ca3fKH4DozZ4RQjoD/dDb7wm1LOMxqS1k5E=
X-Received: by 2002:a05:620a:1654:: with SMTP id c20mr10405958qko.138.1595013644194;
 Fri, 17 Jul 2020 12:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200717161300.1661002-1-thierry.reding@gmail.com> <20200717161300.1661002-5-thierry.reding@gmail.com>
In-Reply-To: <20200717161300.1661002-5-thierry.reding@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 17 Jul 2020 21:20:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2VBcM6TKdtMcBAZZyU9QA1MJ-=djGQZHnBrK4ufpmBXg@mail.gmail.com>
Message-ID: <CAK8P3a2VBcM6TKdtMcBAZZyU9QA1MJ-=djGQZHnBrK4ufpmBXg@mail.gmail.com>
Subject: Re: [GIT PULL 5/7] ARM: tegra: Device tree changes for v5.9-rc1
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:q1ZshR3ZUkFULsC0gz5YC9TRFnjBi9gh2YygwHAvSIUKBXtK+Oq
 HLn/hPA65LWmJkceJRJQwcwb0Nn6jjHINf45k2bFeXc55OtWDOdpqOTqkpkqhQBpmI6Opoq
 e58wBgEhl3tMl5r1iBTq5qOX0t2c2W53+ULb/e539Qbm/a0jvSoXUqxyUWpdlm2AtucrVjR
 1hOyyqI57VelJm8hX2V7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sSyL3d7xZ3Y=:fTk5neQ6EeLNAXh068lMp+
 3GWI+rQpRkPYj5Ko+IAVSJebbHclxgF8zLuOEb7ab910062frngkvFNhPEmY8cmhUwfgBUO1E
 C/PyNEtAI/z3I6500fDRb1lE7DWOzX6vExoaL9vpppBeiE3M+ZYS+wePLrPVQdwejRH0zaNKS
 sgV+yldPuWy+IT4grIk5quUgDNjrcXvi7SNyByaJ84NgsctqxwKYEbAeWbHl7wMdY1GEknfsB
 fbr4E8qJkSR4hDKas90kS4soEYA8yUNU3S8Ov8JqTZPy0Wq1NesvSSnQF8RkrGdZ3KlH6r4qW
 2wBPKCec4/YTwJA/r9NwK5bdNJrENsBF7/O8ZDP6AWkdAUXLCjcgpirxSdNvUWkat5dbysx5l
 JgDh4oJt6Y2JwaBiqN5aeODgo/iOtindqWkau9bI4okrsNsM7LM+yrYYFU5r4Ny5S08Hq9ZcX
 21CmdaqtRQJpDPbbOVOG96dMsxSnuJbYkuRtjWNAYW66NgdaO+WNeJ7JzixNoG2TRCEOnUjkZ
 eQbqBmw8KjHDgMY4wn0qWIuPee6b9PTOKiUDMZ/95TXX2lm/TX0RghzXbrrn72uo7HYObbz3+
 DDtMlwJUdtMMtjSwRswSvWOQz7T6qB8wmUnfN0ou5VyIKLiahY7KoF3rP8Cg5rVY7adr5HtC1
 Z9Y0/3sVLnH76hI+w36gYPx/0p/PogI9Iyis7Ro5lUXrThJo0M/G0bD6zPpZfAdiZkEmhu3CX
 YLVg5hIRhCEOi6oC5WGjQim8wd93j0AQweHz19tfsBvzCyMAeql5huUJI1QLzMcfcSMH2HIxn
 tCXnVtmvxz/cvqiJUWw60ocQH4kQGNqvgGUXR4/WNkFRXrlSO/2viGCNulan/jblBtGw469l2
 K4WV1Z+zKwsIfR+NK5KL4Vfno7Y7mbMNDQcmNg7MRnIrT+pRDpNkhJ3Xl6AgK/g3hQyNgtJz2
 AQz0EkNEJvCR0NmS725PFh4d/uybQH3/84ccrI6hVUP4rfxAGealU
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 17, 2020 at 6:13 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> Hi ARM SoC maintainers,
>
> The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:
>
>   Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.9-arm-dt
>
> for you to fetch changes up to 2720008f4239cf36d57b8d0b3cb2a49d4368a378:
>
>   ARM: tegra: Add device-tree for ASUS Google Nexus 7 (2020-07-16 14:21:31 +0200)
>
> Thanks,
> Thierry
>
> ----------------------------------------------------------------
> ARM: tegra: Device tree changes for v5.9-rc1
>
> This adds device trees for the ASUS Google Nexus 7 and Acer Iconia Tab
> A500. In addition there are a slew of fixes to existing device trees in
> preparation for validating the DTBs against json-schema.
>
> ----------------------------------------------------------------
> Dmitry Osipenko (2):
>       ARM: tegra: Add device-tree for Acer Iconia Tab A500
>       ARM: tegra: Add device-tree for ASUS Google Nexus 7
>

Nice, maybe I can put my Nexus 7 into use again now ;-)

      Arnd

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1911A18444E
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Mar 2020 11:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgCMKF1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Mar 2020 06:05:27 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37644 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgCMKF1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Mar 2020 06:05:27 -0400
Received: by mail-wm1-f67.google.com with SMTP id a141so9590889wme.2
        for <linux-tegra@vger.kernel.org>; Fri, 13 Mar 2020 03:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7A08Rj8P2xGcyK9AB5G4W7ODgf9lGGlI82SYTmkYv3s=;
        b=D/DpgEg7QQzJfqKNUl5khuQLcYUbGC22joQsDqsWmXaZ8s2qUjOKDJikJzae8B1z2L
         K+ARroJwkcNl1XwIYeePVG0Hy/f0ro8Zh1qyLoIudtv3k22kPtv0edlXLXIRgsnao4Vo
         F2wPorPZxp5iQEHNFFeemtS6QxDWkHyzQB1vgur+6a9lgN8/hixZvM9g+QVBUzjY/fVm
         sw+tfKPeDpoof9TtodfR4XapiwS6kZDSTvzxbdGAjnFSeAU2Z0jhFWUyf1/SJX/feta5
         hoei5nJCk0K4h42a9KchmMflcxOQ5vdIvDyff1Xdaf0Xan0euJAoqfyMVuOGx9eMeia/
         /mBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7A08Rj8P2xGcyK9AB5G4W7ODgf9lGGlI82SYTmkYv3s=;
        b=RiS70BUvdIaKJYfdFsNGQMjvfUr91NOY/CZMBmBPwVFLMXPwe1S1Zz7HSPdkcbYhN2
         K54zpczjy5ghkZRRpb5sRjWfq3D6Hnq4I8JADCHGCz6MJBOmERLKQd2u7Lagv2XtZ0HC
         Ado6WjMldNlbUzNtKSrf4uoSdq87OX20ifRXb0f/PCrtahlJBQuY5jloNtE38e7QUEjt
         c9LOo2UFphIYB8J+mOK/Klbdju2kcYfisxkY7PTLjbSRDAm1bo1Wn9zknPzADPTBaMEg
         hSOXVxAAI3CO6F49ulxSFRVkReI5s/y0r6vte0Yp/XxWml2PVDu2tyK2Ux37RCJZAuqT
         B93A==
X-Gm-Message-State: ANhLgQ12PlkRTKdHkK65gXNgVtue6WgaSVNzGMdPbeHJlpYd+8tZzPOE
        1H5hZZIlTFZEZnDJTcRy6d9MjXZt1Ts8UWnl7gY=
X-Google-Smtp-Source: ADFU+vu0PpaCkNgoXeULQRHRdjU6VS+GANZ8PsV6W1M39IY8FgdOGV7zlfz6j1KcE0519wldZVdh6IhYJ76cnzKqPV0=
X-Received: by 2002:a05:600c:2244:: with SMTP id a4mr9578436wmm.147.1584093925714;
 Fri, 13 Mar 2020 03:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200313090104.20750-1-digetx@gmail.com>
In-Reply-To: <20200313090104.20750-1-digetx@gmail.com>
From:   Nicolas Chauvet <kwizart@gmail.com>
Date:   Fri, 13 Mar 2020 11:05:14 +0100
Message-ID: <CABr+WTka7KirNLT=ZptxxZ+L-ZoNKfKwL7RrjZR=ksZh0MAPwg@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: tegra: Correct PL310 Auxiliary Control Register initialization
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Le ven. 13 mars 2020 =C3=A0 10:02, Dmitry Osipenko <digetx@gmail.com> a =C3=
=A9crit :
>
> The PL310 Auxiliary Control Register shouldn't have the "Full line of
> zero" optimization bit being set before L2 cache is enabled. The L2X0
> driver takes care of enabling the optimization by itself.
>
> This patch fixes a noisy error message on Tegra20 and Tegra30 telling
> that cache optimization is erroneously enabled without enabling it for
> the CPU:
>
>         L2C-310: enabling full line of zeros but not enabled in Cortex-A9
>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>

This was tested on paz00 (tegra20).
Also tested that suspend still works.

Thanks for fixing this long standing issue!

--=20
-

Nicolas (kwizart)

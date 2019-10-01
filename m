Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA7AC34C1
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Oct 2019 14:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387862AbfJAMtv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 08:49:51 -0400
Received: from mail-qk1-f177.google.com ([209.85.222.177]:32836 "EHLO
        mail-qk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfJAMtv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 08:49:51 -0400
Received: by mail-qk1-f177.google.com with SMTP id x134so11079385qkb.0
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2019 05:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LHHv/SgxLg6Q800PzDsrjS5a+W/nLyAUzs1S0vkSYb4=;
        b=Gpywrp02eYO8/eYAduf3ZB8H8oRS9qNhe3EP0+cdEvkj14KTYmHhQXMQKZIKTBgVZv
         uauyNAkdcZKFg4VcTbK8dfL9Bg3K5KI76mkiY+QaOhtgHhzzWmFkFU/3jw+0TYUyJ9EP
         Yv3rJ4ky9UmjiWQWbAwGzOYZ2GIzy1CSpFwwRl5+qa+nRQGHNsRZVkmHQB6rcLKdBfw/
         oi+JDC7A+2ztMu9CNE5IH986BZ/aWHE1XLjljjZBauhi+nachaExoPWPLL6R4M4GRFXX
         j3M5eDS6o6ap/dM6N5O+l91u9ZGM3tA+5CxpCcP/SjXQGbMBec79uNlXfSOHtDF2aPX1
         YHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LHHv/SgxLg6Q800PzDsrjS5a+W/nLyAUzs1S0vkSYb4=;
        b=aQP7ZWx/jY+OElvGEv5LCXTBwI04Qs+CF/djkT3X0QzqsVhtI6CqBCxtYytR+nK8IZ
         p5I3wrZv8FdNJm9HX0Ux3EsA9ZLfZWKeYEOqCKWF0D1qf+tYRAapvYI/EFHqptOtqgy/
         HoXc8SZYGhvmtREpB4mxPCbS8udJ2mjA7UQR+tZzocXY6dEHPrEFyqo5mJb5a0eNdbju
         hS16Jz1g8qdOrmU/XGGgbr0Xddn/2bs3FHQxLu84LyX8+olyHAXrJ7EISv11NlW5Ja3E
         Sn06PZpL/Blw0l20xcTo5M52D+GboZp+5Bw9Tq3dDI5A00INxXSskzASszxNHlF8U7JY
         BuZA==
X-Gm-Message-State: APjAAAU+lGe0kBJyqQF7TJ2i4ANGshM4gPDMQqpfOl18yEkPZVjtkT7x
        GbD/tA5gK7hpWGS4WkJtB7M3YiDq8+0Px1dCnFg=
X-Google-Smtp-Source: APXvYqx3YS/IDFVqnDBRpsV2J3CYykDnMvTjwSIDZIEFiMZx6TYrboj6AApQs7sUUvPBUMdvdLeGnHYux1Vx/dFUvNE=
X-Received: by 2002:a37:61c9:: with SMTP id v192mr5601672qkb.262.1569934189791;
 Tue, 01 Oct 2019 05:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
 <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
 <CAMdYzYq9ovn3JnSmRks2WHJe3haF8kGEkVpO_UShQLCkX8vgJA@mail.gmail.com>
 <33559f3b-780a-1e37-3d7c-d61357d32e43@gmail.com> <CAMdYzYoT6ZG0Qaj9FxgnjLhzwFmo0580F4JgSH2-o9B-Ei-ciw@mail.gmail.com>
 <7b20bd86-08a9-a4de-cb8c-a7624d7df6cb@gmail.com> <CAMdYzYqOWsD8ypmANJ32m0A=qYmoaWbPKNB_xRuVS34Fjo1wGA@mail.gmail.com>
 <2e3bb349-fb62-180b-5f07-402500d4e427@gmail.com> <CAMdYzYr3MikMF721PCZmAhFxrmJHt6ZtmYruF_i8tbhpkGPq2g@mail.gmail.com>
 <9f9939ba-e28b-74f6-a852-8a76ce9a6b42@gmail.com> <f61aea11-47b5-ec00-9e4f-3938b0e78694@gmail.com>
In-Reply-To: <f61aea11-47b5-ec00-9e4f-3938b0e78694@gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Tue, 1 Oct 2019 08:49:38 -0400
Message-ID: <CAMdYzYr7irO-qLKws2cFZm6y1iuBj7RQRmUA4Zzx7vO-QoEKVw@mail.gmail.com>
Subject: Re: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Sep 30, 2019 at 5:27 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 30.09.2019 23:55, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 30.09.2019 23:05, Peter Geis =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> Good Afternoon,
> >>
> >> I have prepped the patch for the tegra-udc driver to fail out in host
> >> mode and load as a peripheral in otg mode.
>
> Just to be clear, this part is good to me. Although, doesn't CI driver
> operates by default in a peripheral mode when drm_mode=3Dotg?
>
The code sets OTG mode in the case of mode is unknown.
Based off the code path and behavior on my devices, I'm pretty sure it
defaults to host unless something intervenes in the process, such as
extcon.

I'll see if I can get host mode working, as I'd really like to see
your Tegra30 cpufreq drivers land.

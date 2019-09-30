Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0886DC2852
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Sep 2019 23:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729740AbfI3VKU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 Sep 2019 17:10:20 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:35737 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732549AbfI3VKU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Sep 2019 17:10:20 -0400
Received: by mail-qt1-f196.google.com with SMTP id m15so18952032qtq.2
        for <linux-tegra@vger.kernel.org>; Mon, 30 Sep 2019 14:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WD9pCvY5ztgS1IUkBGe3YhicsDB5am4uZIakHWng1zM=;
        b=eikQ9XZ8ADAC4vVMR4GmYyXjCnx6fOk2wzPfcbTv/rrTOFjBixQXiw9jcUTrpKevas
         eItFlPJq3lWZ0PAaJ6Y40p1lzU8J8nLIVSMB3Fe4w7QxytCR/s//hcxAXvC1zg1sFtYg
         9v7Av0iL8lGzCMrAOCC41Xxc1OJosIhaBMleIYoFcwP4/GGaN294HW7tTcOdRbOmdt6V
         JNQtMCl5xJc4TOOi3/lHBJl2EcE9RADymgJeCy99s1uXJW+d0/S1s/1U+OBb6FykfutZ
         6XO+mXUwcezY8ugiUyPQJLaL7R+GCJR3C0BVZGuBosL2jU4zaQOEx2maTkLoEr6J9vTt
         nMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WD9pCvY5ztgS1IUkBGe3YhicsDB5am4uZIakHWng1zM=;
        b=jmuulm59HwrUYSOjX0bQlwWm8/yJoZ4qcRUiiO3pnJM49HsjIY8+wCmbaCA/96+rvZ
         ZmeHDDvlz0bvDvCmc/Hlr2nmmVHQ647fh/7nIsN3AOffAAWkId00TpvuEVZY57Dv4mTM
         Mtc7DlHBuaHKBR9urpCdFDorq8rY8sYpiAyY+Nogp8hDwIbg/KnmoVvhWQVxqylyV7ZG
         6c13eNWo/lWwMoVS7t3Rp85h2y3+3fsiALz26PIg79+0IkXv60KLZsrmIe55fZsVduvb
         Ltxb8Rd8xQh8LiDcuPobvEzDVEpKGVyMTYZjx2zu4dj5mgrtR8hIuEoeTWNCbJpFb7UV
         vnhg==
X-Gm-Message-State: APjAAAXkh/0L8efoJ28j0XMX9PZAdXEqpA3dmJ9a2xPwwJu3fy50isNT
        05+i8Vwj2DpSpfs69Omthm0K6L5SFHk3lTyCcUMyRj6JZKQ=
X-Google-Smtp-Source: APXvYqxeNsz066g6y1mOi4BIXReQX7cNwNI7XiFMuC0qrsGDgLQlMB75y2x2gnXiBSFxZInW30lRiJZw+euT3tvHHvo=
X-Received: by 2002:ac8:1616:: with SMTP id p22mr25393828qtj.356.1569865613802;
 Mon, 30 Sep 2019 10:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
 <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
 <CAMdYzYq9ovn3JnSmRks2WHJe3haF8kGEkVpO_UShQLCkX8vgJA@mail.gmail.com>
 <33559f3b-780a-1e37-3d7c-d61357d32e43@gmail.com> <CAMdYzYoT6ZG0Qaj9FxgnjLhzwFmo0580F4JgSH2-o9B-Ei-ciw@mail.gmail.com>
 <7b20bd86-08a9-a4de-cb8c-a7624d7df6cb@gmail.com>
In-Reply-To: <7b20bd86-08a9-a4de-cb8c-a7624d7df6cb@gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Mon, 30 Sep 2019 13:46:38 -0400
Message-ID: <CAMdYzYqOWsD8ypmANJ32m0A=qYmoaWbPKNB_xRuVS34Fjo1wGA@mail.gmail.com>
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

On Mon, Sep 30, 2019 at 1:42 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 30.09.2019 18:54, Peter Geis =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Dmitry,
> >
> > As far as I can tell the cpuidle drivers work perfectly, but I don't
> > have full power management yet on either my T20 device nor my T30
> > device.
> > They aren't the cause of this though.
> >
> > I've been sticking to the mainline release code since 5.3 landed, as
> > something was merged into linux-next that breaks brcm4329/brcm4330
> > firmware loading.
> >
> > Jumping to linux-next to test your driver just revealed the behavior.
> >
> > On my T20 device I haven't encountered issues, but that operates
> > almost exclusively in gadget mode.
> > On my T30 device tegra-udc is misbehaving, especially on linux-next.
> >
> > By removing the hardcoded LL_DEBUG config and moving to a command line
> > earlycon statement, I seem to be making progress in capturing what's
> > going on.
> > With the following actions, I got a panic crash dump:
> > phy set to peripheral, boot with tegra-ehci in host mode, usb hub plugg=
ed in.
> > Booted successfully, hub enumerated, passed data through attached
> > ethernet device.
> > Unbind the tegra-ehci driver, bind the tegra-udc driver.
> > Hub enumerates, as well as attached ethernet device, but writes to the
> > device throw constant errors.
>
> Is the host mode working properly when booting with the tegra-udc as a
> primary driver?

I actually got it working <once>.
It threw constant reset errors though.
Afterwards a soft reboot caused the kernel to crash with an irq-init error.
tegra-ehci is the only stable host driver.

>
> > Unbind the tegra-udc driver, produces the following panic:
>
> Looks like it is a CI driver bug, perhaps timer's tear down isn't
> performed correctly. Maybe it is related to the errors you're seeing and
> something getting stuck with the offending timer being active during of
> the driver's unbinding..
>
> Probably Peter Chen could help with that.
>
> [snip]

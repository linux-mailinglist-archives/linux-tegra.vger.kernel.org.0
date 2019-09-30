Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25CD5C276B
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Sep 2019 22:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbfI3Uz0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 Sep 2019 16:55:26 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:39189 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727767AbfI3Uz0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Sep 2019 16:55:26 -0400
Received: by mail-qk1-f194.google.com with SMTP id 4so9118397qki.6
        for <linux-tegra@vger.kernel.org>; Mon, 30 Sep 2019 13:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/u4thuhyUkpoik2lUqGfIIsP23oE2WLXkhFZyVfD6ic=;
        b=uI1WoQrWg06uDCpTFhzWWFRVYbyFuRg6wOqCFcnM901b/rOEbkOf+zOuQqG7tx2OT5
         wgvXUfxMAeYgQXyjMg5wE36IfnWygeQiTleHfMSJv11izki1rUxu8mtBFZdj8HQ2q/rZ
         pH45NmpZHSrOZ5gdKcKiaWzznJrOewG8TXz2wHGdiLa3COC/sBG8QEOKxhSloNe6kzZ+
         MEE57kx+5gs3LZ2H0Sm6kBqwY0sA3VJgO7jWhKDA405TQ/veOYSTo498wg8+vJUgQQHZ
         hEz+LvLTVUdz/WRdimy2NsXqVFdoHJ3Sa+H1RP3DnZwxbLG4zIXHkRN/sEtJ6YFOZIFG
         G08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/u4thuhyUkpoik2lUqGfIIsP23oE2WLXkhFZyVfD6ic=;
        b=OMViR+p64GEe2O3KILJH6LWRTM2p8dUST3B4nbNktWtBwm1mCm6hULe4NPNdWnVZEI
         SzPXhkeR9VaznqgJg/WNLnYZfpI/+BbrAFJnVAh7BCFKgR3NOmE4g5tgR4AsFe4UBUgB
         ypqbJ8P7tQjGhYhnF6xL9h0DIIrOFpeIrAovzOqxpJNyFnfYzp9sv4JtBJZnciYFG6XK
         4xdJpi1FxipoBKd7/IVmSdHSnBS2MWrvwjV+a5tdvw2NR+IAWa2/of94TN8qPvySllnS
         2Cxr69yIoCrWRoKnpNxtvGE5SrhGrSqqhnhbO/R7gPdZCZg9Db9GTe78qX06PwYaLtM8
         C1yw==
X-Gm-Message-State: APjAAAU8w3pxVm/fOWNW4Al1Glm4Pci2WpIHuEVTUU0nhm0MJ5kyXLOi
        Q1VHz1cysgI+i5A/tRkAl+60RNzgW5kZP6Z6IVG09x+eD7rN6g==
X-Google-Smtp-Source: APXvYqxiJwGLbSumVhvLME4KmvsWF3m3jjG78vZHpRlL9Q+020/eQc2waJ9org7vZr+xZt1i4peWBiHouJcvnDAxDbc=
X-Received: by 2002:a37:76c3:: with SMTP id r186mr52677qkc.224.1569873923818;
 Mon, 30 Sep 2019 13:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
 <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
 <CAMdYzYq9ovn3JnSmRks2WHJe3haF8kGEkVpO_UShQLCkX8vgJA@mail.gmail.com>
 <33559f3b-780a-1e37-3d7c-d61357d32e43@gmail.com> <CAMdYzYoT6ZG0Qaj9FxgnjLhzwFmo0580F4JgSH2-o9B-Ei-ciw@mail.gmail.com>
 <7b20bd86-08a9-a4de-cb8c-a7624d7df6cb@gmail.com> <CAMdYzYqOWsD8ypmANJ32m0A=qYmoaWbPKNB_xRuVS34Fjo1wGA@mail.gmail.com>
 <2e3bb349-fb62-180b-5f07-402500d4e427@gmail.com>
In-Reply-To: <2e3bb349-fb62-180b-5f07-402500d4e427@gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Mon, 30 Sep 2019 16:05:08 -0400
Message-ID: <CAMdYzYr3MikMF721PCZmAhFxrmJHt6ZtmYruF_i8tbhpkGPq2g@mail.gmail.com>
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

Good Afternoon,

I have prepped the patch for the tegra-udc driver to fail out in host
mode and load as a peripheral in otg mode.
My reasoning for this is as follows:
host mode allows devices to enumerate, but data cannot transmit correctly
otg mode allows mode switching which is broken and was never supported
peripheral mode is the only function that behaves correctly

My presumption is this is caused by the chipidea driver not handling
the tegra specific quirks.
Reading through how nice and clean the tegra-ehci driver is, I'm
wondering if it would be better to simply pull the requisite gadget
stuff into the ehci driver, vice trying to wedge into the chipidea
driver.

What do y'all think?

On Mon, Sep 30, 2019 at 1:55 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 30.09.2019 20:46, Peter Geis =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, Sep 30, 2019 at 1:42 PM Dmitry Osipenko <digetx@gmail.com> wrot=
e:
> >>
> >> 30.09.2019 18:54, Peter Geis =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> Dmitry,
> >>>
> >>> As far as I can tell the cpuidle drivers work perfectly, but I don't
> >>> have full power management yet on either my T20 device nor my T30
> >>> device.
> >>> They aren't the cause of this though.
> >>>
> >>> I've been sticking to the mainline release code since 5.3 landed, as
> >>> something was merged into linux-next that breaks brcm4329/brcm4330
> >>> firmware loading.
> >>>
> >>> Jumping to linux-next to test your driver just revealed the behavior.
> >>>
> >>> On my T20 device I haven't encountered issues, but that operates
> >>> almost exclusively in gadget mode.
> >>> On my T30 device tegra-udc is misbehaving, especially on linux-next.
> >>>
> >>> By removing the hardcoded LL_DEBUG config and moving to a command lin=
e
> >>> earlycon statement, I seem to be making progress in capturing what's
> >>> going on.
> >>> With the following actions, I got a panic crash dump:
> >>> phy set to peripheral, boot with tegra-ehci in host mode, usb hub plu=
gged in.
> >>> Booted successfully, hub enumerated, passed data through attached
> >>> ethernet device.
> >>> Unbind the tegra-ehci driver, bind the tegra-udc driver.
> >>> Hub enumerates, as well as attached ethernet device, but writes to th=
e
> >>> device throw constant errors.
> >>
> >> Is the host mode working properly when booting with the tegra-udc as a
> >> primary driver?
> >
> > I actually got it working <once>.
> > It threw constant reset errors though.
> > Afterwards a soft reboot caused the kernel to crash with an irq-init er=
ror.
> > tegra-ehci is the only stable host driver.
>
> Okay, I guess the host mode requires some extra configuration (or some
> quirk) that is currently missing in the tegra-udc. You may try to
> compare what tegra-ehci and tegra-udc do differently and then figure out
> how make it to work, for now I don't have any better advises.
>
> >>> Unbind the tegra-udc driver, produces the following panic:
> >>
> >> Looks like it is a CI driver bug, perhaps timer's tear down isn't
> >> performed correctly. Maybe it is related to the errors you're seeing a=
nd
> >> something getting stuck with the offending timer being active during o=
f
> >> the driver's unbinding..
> >>
> >> Probably Peter Chen could help with that.
> >>
> >> [snip]
>

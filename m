Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFAAC2F4125
	for <lists+linux-tegra@lfdr.de>; Wed, 13 Jan 2021 02:24:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbhAMBX5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 12 Jan 2021 20:23:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbhAMBX4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 20:23:56 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9932C061786
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 17:23:15 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id q25so415918oij.10
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 17:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ftDS6LJvKcuupUK2HTpTwWJJm0o4zAXyt2XBFRBfiB8=;
        b=GgS835YI4alinTp8g6T5BF0BVLpt2qeTxrUjdDgdPUokl/aqTGBkqsiVQn53DaOPmJ
         FRmWfu+9+6viyfctTPQyXkWEYZZDrhcf1KqISQ7SJwdEMKCEtUqcgA7pZoVbB0OD/D0D
         QLuA/rr/vviM3GjiFaiEm2m31rOoz+/1Om38Um3eQTF81YrrVTFqyotPQuUs8WpohWhC
         VJluCVY3vy5cxXabhTr+u+JGnq4JZiHOVqIHvYS3SObKum7Go8ZqRMFrOxsdKoKFVEgk
         idC4bafDiNrKyAewNbIXoBOtrx8p0GwGf+5Nkh+ZQdGTjBCNvStMFO74XpFYL/oMeMoK
         UQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ftDS6LJvKcuupUK2HTpTwWJJm0o4zAXyt2XBFRBfiB8=;
        b=sz9SuMLE1iXrrBF2cLF+6nabDTyHIsmFmd9uLKjM5SYv4ltSSzlsFhS7P6mJEfwMaZ
         A9owpCjDy2nlhI6lAbcn1utevLdGJTErMETHFq8GXAHYaCygQ3edk6ncUuMbtPKjBrA6
         GnP7FqVn+uYo4qZe5loNzAnupjm99/cWSiHdJZmkFwNYfQkSJeAKPDSwNSzK3UoRzSDr
         +aHf+2dFUtHVv55NB0uN2m5dq85iCnlvDJyihalv2/x7/gN/XSS5MaYP5XnRG+EfLihP
         fOwNKTDHbqoQEHI7kkvMQH/uM9myCYLGeWmlUKoZKC+srfCqMrlOqOEzZofZYIoXTPxy
         qCaA==
X-Gm-Message-State: AOAM531gz4ClxdwlGUzDwzABC7ZCnemQTS3fk3QtCt3vW3nhn0qHWiGs
        zkQpejJEKpP3Oio/XEZQ0WBJBvee+H/K2AugECO2gg==
X-Google-Smtp-Source: ABdhPJyeQF7SeqlcjskyirEM0E/F9YB1gpWpXlnjMpiWSCheBuS1ltb9OsF72K5nHsejgaJH7AIqqd9i2/0SIumTmPY=
X-Received: by 2002:aca:1110:: with SMTP id 16mr252695oir.12.1610500995010;
 Tue, 12 Jan 2021 17:23:15 -0800 (PST)
MIME-Version: 1.0
References: <20201201213019.1558738-1-furquan@google.com> <e77e0569-568a-f7fb-9f0d-e64943b467f0@gmail.com>
 <CAJZ5v0jhniqG43F6hCqXdxQiQZRc67GdkdP0BXcRut=P7k7BVQ@mail.gmail.com> <X/2fzghPXnuDNBPU@kroah.com>
In-Reply-To: <X/2fzghPXnuDNBPU@kroah.com>
From:   Furquan Shaikh <furquan@google.com>
Date:   Tue, 12 Jan 2021 17:22:57 -0800
Message-ID: <CAEGmHFEpPTuRuWFt0ba022BmGfaDmSTAgEApW9EzAa5CitmtbA@mail.gmail.com>
Subject: Re: [PATCH] drivers: core: Detach device from power domain on shutdown
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jan 12, 2021 at 5:09 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jan 12, 2021 at 01:45:25PM +0100, Rafael J. Wysocki wrote:
> > On Tue, Jan 12, 2021 at 10:55 AM Dmitry Osipenko <digetx@gmail.com> wro=
te:
> > >
> > > 02.12.2020 00:30, Furquan Shaikh =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > When the system is powered off or rebooted, devices are not detache=
d
> > > > from their PM domain. This results in ACPI PM not being invoked and
> > > > hence PowerResouce _OFF method not being invoked for any of the
> > > > devices. Because the ACPI power resources are not turned off in cas=
e
> > > > of poweroff and reboot, it violates the power sequencing requiremen=
ts
> > > > which impacts the reliability of the devices over the lifetime of t=
he
> > > > platform. This is currently observed on all Chromebooks using ACPI.
> > > >
> > > > In order to solve the above problem, this change detaches a device
> > > > from its PM domain whenever it is shutdown. This action is basicall=
y
> > > > analogous to ->remove() from driver model perspective. Detaching th=
e
> > > > device from its PM domain ensures that the ACPI PM gets a chance to
> > > > turn off the power resources for the device thus complying with its
> > > > power sequencing requirements.
> > > >
> > > > Signed-off-by: Furquan Shaikh <furquan@google.com>
> > > > ---
> > > >  drivers/base/core.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > > > index d661ada1518f..5823f1d719e1 100644
> > > > --- a/drivers/base/core.c
> > > > +++ b/drivers/base/core.c
> > > > @@ -23,6 +23,7 @@
> > > >  #include <linux/of_device.h>
> > > >  #include <linux/genhd.h>
> > > >  #include <linux/mutex.h>
> > > > +#include <linux/pm_domain.h>
> > > >  #include <linux/pm_runtime.h>
> > > >  #include <linux/netdevice.h>
> > > >  #include <linux/sched/signal.h>
> > > > @@ -4057,6 +4058,8 @@ void device_shutdown(void)
> > > >                       dev->driver->shutdown(dev);
> > > >               }
> > > >
> > > > +             dev_pm_domain_detach(dev, true);
> > > > +
> > > >               device_unlock(dev);
> > > >               if (parent)
> > > >                       device_unlock(parent);
> > > >
> > >
> > > This patch broke system shutdown on NVIDIA Tegra using today's
> > > linux-next because power domain can't be turned off until device driv=
ers
> > > handed control over device resets to the power domain of Power
> > > Management controller on Tegra. This patch introduced the wrong
> > > behaviour, apparently it should be made specific to ACPI only.
> > >
> > > Please fix, thanks in advance.

Sorry about the breakage. I am working on an alternate solution that
Rafael suggested.

> >
> > OK, so Greg please drop it.
>
> Now reverted, thanks.

Thanks Greg!

>
> greg k-h

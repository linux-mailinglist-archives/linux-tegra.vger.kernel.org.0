Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E140631918F
	for <lists+linux-tegra@lfdr.de>; Thu, 11 Feb 2021 18:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232684AbhBKRvL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 11 Feb 2021 12:51:11 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:35901 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbhBKRtd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Feb 2021 12:49:33 -0500
Received: by mail-wm1-f43.google.com with SMTP id i9so6595403wmq.1;
        Thu, 11 Feb 2021 09:49:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fCJHjf1MjgpxPkhng9R5nM8PO3m4mG6rPr4oi+gwZSk=;
        b=LzmQ/pz8erjaQ0/Z07kqfkWyC8IhJZA9Z3lQeyH6bGwQEUI6MV3nC7p6yxj0/Z7H9T
         d8ydRecpPFNi2P8l7VIaBUga8EDCgYgNy3oH/2UA4/1uJO3/6TzOxzan7qk2D9rCar40
         AYkpWTyQBgLFR6fk9WhY4SkM0IJa/CRf2BHR+PH+GFENdu6YiseKOG6SufE1J/dz8TTN
         iAGqGzZcD+tQR6mEEKNcrhy/S2x9R8A7nlOI8uXPMr3chPCetyxrR6uOyEIo/bgUYKqc
         FsGg+vy1b/k0oLfgGGRRaSKZifUYDspoged5Mtco0b404HBv0WHUw2iAtBv20xFBChv1
         EZhw==
X-Gm-Message-State: AOAM532CtM2sNrqK99hpWnEccfZEshli8ncP31RIufyNBD9rryvnXYDd
        kjfO5oJ7fJD2oZ/YMLcsm2yuVkxW9YSassY3p+Q=
X-Google-Smtp-Source: ABdhPJxMcqspNOmle6ZKTyY8kLNaG+NsymGJ6QBeHtJ36F63+UmcV5iSWbai/XyWqB8G01YsWnFaeuhJNDuRsljEPDM=
X-Received: by 2002:a1c:bc89:: with SMTP id m131mr6197346wmf.32.1613065730253;
 Thu, 11 Feb 2021 09:48:50 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <56f7d032-ba5a-a8c7-23de-2969d98c527e@nvidia.com> <CAGETcx9FAAa+gUOTJX76DGGOAE4g3cTbZhwNQ-pLioYzg=fTOw@mail.gmail.com>
 <17939709-f6f4-fa9c-836f-9779081c4087@nvidia.com> <CAGETcx_1x7LFprsEM+-X8Y42-sbajBav5Bik4U=s4Z5XCSZtUg@mail.gmail.com>
 <e11bc6a2-ec9d-ea3b-71f7-13c9f764bbfc@nvidia.com> <6a43e209-1d2d-b10a-4564-0289d54135d3@nvidia.com>
 <CAGETcx9ZaBLRVPqiSkPf_4Tm5dDLNbLBM2RmHk1jr7yLp_1CCQ@mail.gmail.com>
 <CAJZ5v0iv9fRzM8cbGrPhutPNpod-gLWcZ8fWzDpfJ=NUVmm5Og@mail.gmail.com> <CAGETcx9qA-nq01ojfP73UJ0KjJCxd3Qhes0hatQGzNKYxuUj-w@mail.gmail.com>
In-Reply-To: <CAGETcx9qA-nq01ojfP73UJ0KjJCxd3Qhes0hatQGzNKYxuUj-w@mail.gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 11 Feb 2021 18:48:38 +0100
Message-ID: <CAJZ5v0g+cd_r=UzzEXAQAqVnVyN3czv4WCyBib5=e2a4X53VNA@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Enable fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Android Kernel Team <kernel-team@android.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Marc Zyngier <maz@kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Feb 11, 2021 at 6:15 PM Saravana Kannan <saravanak@google.com> wrote:
>
> On Thu, Feb 11, 2021 at 7:03 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Thu, Feb 11, 2021 at 1:02 AM Saravana Kannan <saravanak@google.com> wrote:
> > >
> > > On Thu, Jan 28, 2021 at 7:03 AM Jon Hunter <jonathanh@nvidia.com> wrote:
> > > >
> > > >
> > > > On 14/01/2021 16:56, Jon Hunter wrote:
> > > > >
> > > > > On 14/01/2021 16:47, Saravana Kannan wrote:
> > > > >
> > > > > ...
> > > > >
> > > > >>> Yes this is the warning shown here [0] and this is coming from
> > > > >>> the 'Generic PHY stmmac-0:00' device.
> > > > >>
> > > > >> Can you print the supplier and consumer device when this warning is
> > > > >> happening and let me know? That'd help too. I'm guessing the phy is
> > > > >> the consumer.
> > > > >
> > > > >
> > > > > Sorry I should have included that. I added a print to dump this on
> > > > > another build but failed to include here.
> > > > >
> > > > > WARNING KERN Generic PHY stmmac-0:00: supplier 2200000.gpio (status 1)
> > > > >
> > > > > The status is the link->status and looks like the supplier is the
> > > > > gpio controller. I have verified that the gpio controller is probed
> > > > > before this successfully.
> > > > >
> > > > >> So the warning itself isn't a problem -- it's not breaking anything or
> > > > >> leaking memory or anything like that. But the device link is jumping
> > > > >> states in an incorrect manner. With enough context of this code (why
> > > > >> the device_bind_driver() is being called directly instead of going
> > > > >> through the normal probe path), it should be easy to fix (I'll just
> > > > >> need to fix up the device link state).
> > > > >
> > > > > Correct, the board seems to boot fine, we just get this warning.
> > > >
> > > >
> > > > Have you had chance to look at this further?
> > >
> > > Hi Jon,
> > >
> > > I finally got around to looking into this. Here's the email[1] that
> > > describes why it's done this way.
> > >
> > > [1] - https://lore.kernel.org/lkml/YCRjmpKjK0pxKTCP@lunn.ch/
> > >
> > > >
> > > > The following does appear to avoid the warning, but I am not sure if
> > > > this is the correct thing to do ...
> > > >
> > > > index 9179825ff646..095aba84f7c2 100644
> > > > --- a/drivers/base/dd.c
> > > > +++ b/drivers/base/dd.c
> > > > @@ -456,6 +456,10 @@ int device_bind_driver(struct device *dev)
> > > >  {
> > > >         int ret;
> > > >
> > > > +       ret = device_links_check_suppliers(dev);
> > > > +       if (ret)
> > > > +               return ret;
> > > > +
> > > >         ret = driver_sysfs_add(dev);
> > > >         if (!ret)
> > > >                 driver_bound(dev);
> > >
> > > So digging deeper into the usage of device_bind_driver and looking at
> > > [1], it doesn't look like returning an error here is a good option.
> > > When device_bind_driver() is called, the driver's probe function isn't
> > > even called. So, there's no way for the driver to even defer probing
> > > based on any of the suppliers. So, we have a couple of options:
> > >
> > > 1. Delete all the links to suppliers that haven't bound.
> >
> > Or maybe convert them to stateless links?  Would that be doable at all?
>
> Yeah, I think it should be doable.
>
> >
> > > We'll still leave the links to active suppliers alone in case it helps with
> > > suspend/resume correctness.
> > > 2. Fix the warning to not warn on suppliers that haven't probed if the
> > > device's driver has no probe function. But this will also need fixing
> > > up the cleanup part when device_release_driver() is called. Also, I'm
> > > not sure if device_bind_driver() is ever called when the driver
> > > actually has a probe() function.
> > >
> > > Rafael,
> > >
> > > Option 1 above is pretty straightforward.
> >
> > I would prefer this ->
>
> Ok
>
> >
> > > Option 2 would look something like what's at the end of this email +
> > > caveat about whether the probe check is sufficient.
> >
> > -> because "fix the warning" really means that we haven't got the
> > device link state machine right and getting it right may imply a major
> > redesign.
> >
> > Overall, I'd prefer to take a step back and allow things to stabilize
> > for a while to let people catch up with this.
>
> Are you referring to if/when we implement Option 2? Or do you want to
> step back for a while even before implementing Option 1?

I would do option 1 and if then see what happens and maybe go back
from there if need be until getting a reasonably stable situation
(that is all of the systems that used to work before still work at
least).

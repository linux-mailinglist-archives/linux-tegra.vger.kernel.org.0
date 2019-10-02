Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A506C8816
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 14:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfJBMPo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Oct 2019 08:15:44 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:46640 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbfJBMPo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Oct 2019 08:15:44 -0400
Received: by mail-qk1-f196.google.com with SMTP id 201so14672406qkd.13
        for <linux-tegra@vger.kernel.org>; Wed, 02 Oct 2019 05:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wSHRXrLor6fsvGroKxnCym2w9Y0BefJfOTdoTIEBeRA=;
        b=QmvB/bL2+WIPIT9ruv2sHTdLE5gJJEQwC39XCMNbRPpk/hrRX8ZYDw4CSfuIHZZ153
         d72nzU5NS2FXavMXqzvx/cN5Jjqd0sJerP2cYE7mPJjqQ59gvTRcIEmvB8LLFcMxGuXO
         6eeUkBXxPgPt6fY/V4i4L+d/Qk0W6e+6I3NjF6vfprcilQkKBL1+1igYN7znsrrPJFqF
         61f515m0HxF99B/3+sDi0Gui1GO+3ASGG64TD6wh41NRAF+YSOyrBn79w/qdi/NgKByo
         5ZD5KlfdM+RIV2brJ/R+fGgV/g9s0g6eUAR05ZnkujETY4vr/8tpyZcTB8jE8K7JVNEp
         0xHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wSHRXrLor6fsvGroKxnCym2w9Y0BefJfOTdoTIEBeRA=;
        b=FsQbkUY//NGUioPyliVa6inhK18a+QmIwtDs+WhmXoxiXqjxJPUdELyNi9Vs2wnQJ/
         b0CP8Pyd+jMZNe0w+MM6yhQUKnhak05UU63fAsxYosEXyZcWLBcqM7drS53uNYR7QSCk
         23x0iYIlsQB6PBIz6azqoPHA8cD4CFX6g0iQdu4605wfRvUYOTEGb3PGewuPqfbV+/aT
         sAvl6hKTQK1kzSB4bL5ifkxP+ZI3vc7FMw/CFdsk5gNOEXRwrh0hSV7g3cwFpJDkx9qU
         nu2JcQCreBaubT8urn7FzXPtX0iOAEXCcoYIH+FbLypkv21KRc/xJENVDZ04UKjt7JKW
         9xSw==
X-Gm-Message-State: APjAAAXUGUUg+iZCcFSuMcP3Gs5OuOrg4aurnUuxP6otMiAJFRtBa5O9
        qR4Pr8W4Pfj0OsN+I7T35qzrnQvSGsQLmGfO52o=
X-Google-Smtp-Source: APXvYqyu7g2aQDlgHuYdcGl2H+bxUTGvA7A+a31ENGWzZGztJmlo/lOj8+MIxqJr7AemplmdaT7f5mPhzdJs0OFatt0=
X-Received: by 2002:a37:a38c:: with SMTP id m134mr3260782qke.484.1570018542730;
 Wed, 02 Oct 2019 05:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191002014153.29831-1-pgwipeout@gmail.com> <20191002014153.29831-6-pgwipeout@gmail.com>
 <20191002113543.GO3716706@ulmo>
In-Reply-To: <20191002113543.GO3716706@ulmo>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 2 Oct 2019 08:15:26 -0400
Message-ID: <CAMdYzYoh9E+BuA_WY+eN3rL9KrBXD3p_otNL-=pYzpxAAWw=4w@mail.gmail.com>
Subject: Re: [PATCH 5/5] usb: chipidea: tegra: enable tegra-udc host mode
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Peter Chen <peter.chen@nxp.com>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 2, 2019 at 7:35 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Tue, Oct 01, 2019 at 09:41:53PM -0400, Peter Geis wrote:
> > Add the functions to the chipidea host driver to enable tegra specific
> > dma alignment and reset handlers.
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_tegra.c |  7 +++++++
> >  drivers/usb/chipidea/host.c          | 13 +++++++++++++
> >  2 files changed, 20 insertions(+)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > index 29415c3a2f48..2f7d542d2273 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > @@ -118,6 +118,13 @@ static int tegra_udc_probe(struct platform_device *pdev)
> >       udc->data.usb_phy = udc->phy;
> >       udc->data.capoffset = DEF_CAPOFFSET;
> >
> > +     /* check the double reset flag */
> > +     if (of_property_read_bool(pdev->dev.of_node,
> > +                             "nvidia,needs-double-reset")) {
> > +             dev_dbg(&pdev->dev, "setting double reset flag\n");
> > +             udc->data.flags |= CI_HDRC_TEGRA_DOUBLE_RESET;
> > +     }
>
> Like I said, I think it'd be better to put this into the same patch that
> adds the flag.
>
> > +
> >       udc->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
> >                                     pdev->num_resources, &udc->data);
> >       if (IS_ERR(udc->dev)) {
> > diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> > index b45ceb91c735..e95b7cb8c54d 100644
> > --- a/drivers/usb/chipidea/host.c
> > +++ b/drivers/usb/chipidea/host.c
> > @@ -20,6 +20,7 @@
> >  #include "ci.h"
> >  #include "bits.h"
> >  #include "host.h"
> > +#include "tegra.h"
> >
> >  static struct hc_driver __read_mostly ci_ehci_hc_driver;
> >  static int (*orig_bus_suspend)(struct usb_hcd *hcd);
> > @@ -275,6 +276,13 @@ static int ci_ehci_hub_control(
> >               goto done;
> >       }
> >
> > +     /* For Tegra USB1 port we need to issue Port Reset twice internally */
> > +     if (ci->platdata->flags & CI_HDRC_TEGRA_DOUBLE_RESET &&
> > +     (typeReq == SetPortFeature && wValue == USB_PORT_FEAT_RESET)) {
> > +             spin_unlock_irqrestore(&ehci->lock, flags);
> > +             return tegra_ehci_internal_port_reset(ehci, status_reg);
> > +     }
> > +
> >       /*
> >        * After resume has finished, it needs do some post resume
> >        * operation for some SoCs.
> > @@ -364,6 +372,11 @@ int ci_hdrc_host_init(struct ci_hdrc *ci)
> >       rdrv->name      = "host";
> >       ci->roles[CI_ROLE_HOST] = rdrv;
> >
> > +     if (ci->platdata->flags & CI_HDRC_TEGRA_HOST) {
> > +             ci_ehci_hc_driver.map_urb_for_dma = tegra_ehci_map_urb_for_dma;
> > +             ci_ehci_hc_driver.unmap_urb_for_dma = tegra_ehci_unmap_urb_for_dma;
> > +     }
>
> Same here.
>
> That said, there are a few other bits in ehci-tegra.c that we may need.
> For example, the tegra_ehci_reset() function sets different values for
> the TX FIFO threshold, which we don't do for ChipIdea as far as I can
> tell. We also differentiate between Tegra20 and later generations with
> respect to whether or not they have the HOSTPC registers.
>
> tegra_ehci_hub_control() also seems to have a number of other work-
> arounds that are not yet ported as part of this series. And then there
> is the matter of tegra_reset_usb_controller(). I recall that this has
> caused severe headaches in the past, so we need to be very careful when
> changing to the ChipIdea driver that we don't reintroduce old bugs
> again.
>
> Thierry

I saw the patch around Tegra20's FIFO pipeline, I have a Tegra20
device to test on so I'll look if that's still necessary.
The tegra_ehci driver appeared to implement only what was necessary to
make the controller work, as there's a lot of overlap with the
chipidea driver.
Since the tegra-udc driver worked with very little code, I figured the
chipidea driver handled most everything correctly already.

As such I looked mostly at the workarounds that were tegra specific.

This is also why I requested multiple eyes, as I don't have the
benefit of historical context beyond the commit messages.
>
> > +
> >       return 0;
> >  }
> >
> > --
> > 2.17.1
> >

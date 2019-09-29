Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABD8C19B8
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Sep 2019 00:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729091AbfI2WPw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 29 Sep 2019 18:15:52 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:37809 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729022AbfI2WPw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 29 Sep 2019 18:15:52 -0400
Received: by mail-qk1-f195.google.com with SMTP id u184so6166114qkd.4
        for <linux-tegra@vger.kernel.org>; Sun, 29 Sep 2019 15:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VdLw2xemxiBOcIt9IhRUCa2FfG4rw32ynHQ5iPB73ZQ=;
        b=qLladMtjWaIhvpCG2yhX9MrfBdTf/uEahL9M3q+DCf2tI6kkkh6t2CfwVnzMKjIyBC
         O/GA9StskM38vZz12ydTV1PSEt8xQGX3484mc6q4KsbC+/JAe/CteozpXO3n6nkE+x5E
         Wzp/M/y5vjZ3E0TZ7SwXYDeaukyyeAgqMosgnhPbkEvAexkhkejrNudAVqwqjaCS2gVS
         rqIxE6fFvwI//sWxpNqlvwFP1ubCN9r0p250KHDNbkVV9a0LAQFtTwltLEQPGRYcBd/n
         V2WyZxDS8nwygDGRklHP/osNfOSIXKsFJOSaM69/aViGjqk1Z9d2OeaZppQ4aSIDlrqt
         7bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VdLw2xemxiBOcIt9IhRUCa2FfG4rw32ynHQ5iPB73ZQ=;
        b=QaihBHfsP7GnKAOJOXHWb4xhbFkOtHUiR6BMIeqrUETVqqrDoBRfC6D8fz7Q9jLvXO
         ZaCRhG9rLgihhMpwkNPtJS7JzYE56w248aG4OWFUjmFxe1dKJ6Pr+zHHP4Jl4JZl114N
         JMqYF8wXA3b65yHs8ZSZkmbHnFyBwiTd1nR8CEaNIrS02D7tRe/Zpwvnt4qpgt5Uycp1
         xEDlebR1P22uaujDvilNgygCmCmA0Ov8YBTYHQLcHMhuWr6BvJ1aOSpEHYPXsPTUsZ/R
         YPgDNQWgIPLmZB6Ni7wZTECDuKXHfnrDMtxitfUvY0riR6I4t4uct3IKTQ7e3/WTkbMs
         fg1A==
X-Gm-Message-State: APjAAAUW/5iB230+E3NUah5UUic7KfD44lJeGSIE8zoq1dF38/KWoQuQ
        ktPjjQOUDRAkzrXbBe5gTvSh6K65FMToDRgm0UU=
X-Google-Smtp-Source: APXvYqw4GF6xk/pflqI+fv1WbrTwFhfIYIFSO6X1q68nvbZ8xLxpPeckV8vVGl2xupxVRWCl/FBLpBQjq/z0XVSftBU=
X-Received: by 2002:a37:61c9:: with SMTP id v192mr15645604qkb.262.1569795351606;
 Sun, 29 Sep 2019 15:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
 <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Sun, 29 Sep 2019 18:15:40 -0400
Message-ID: <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
Subject: Re: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
To:     Peter Chen <peter.chen@nxp.com>, Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Good Afternoon,

So I have dug a bit further into it.
The tegra-udc driver defaults to host mode when set to otg.
If the tegra-udc driver is in host mode while plugged into another
host, the kernel will hard lock.
If the tegra-udc driver is in host mode with a device attached the
device enumerates correctly.
In this state, if you change the state to gadget, the driver goes into
a broken state.
The gadget side is in gadget mode, but the host does not enumerate the device.

As it stands the code path for the tegra-udc driver is broken in OTG mode.
Without proper extcon support we can't support dynamic switching
correctly anyways.
My hack around method of retaining the phy in peripheral mode and
switching drivers to change modes only works because both code paths
are incomplete as well, and should not be relied upon.

I think for the time being, the tegra-udc driver should check for
host, peripheral, or otg mode.
If it detects the device is set to otg mode, it should print an error
message describing the current situation and fail out.

If I had a device to test against with an extcon capable port, I'd try
some more experimenting with the chipidea drivers to see if I can get
it to work.

What do you think?

Dmitry,
Do you have any devices to experiment with this?

Thank you for your time,
Peter

On Sat, Sep 28, 2019 at 11:36 PM Peter Chen <peter.chen@nxp.com> wrote:
>
>
> >
> > I've encountered an odd situation where the CI Dual Role driver hard locks the
> > kernel on the Ouya (Tegra 3).
> > I was attempting to set up manual mode switching in the kernel, as the Ouya lacks
> > hardware support for the ID pin and no voltage output on that port.
> > I found that the kernel was hard locking whenever I had the dr_mode = "otg" set in
> > the devicetree.
>
> It seems Tegra doesn't support host mode using chipidea driver. The ci_hdrc_tegra.c
> only supports device mode. Thierry, could you confirm that?
>
> Peter
>
> > No further output was seen on the console, and sysreq does not respond.
> > It occurs both in module and builtin mode.
> >
> > I have however found a workaround.
> > By setting the dual role usb device to:
> > compatible = "nvidia,tegra30-ehci", "nvidia,tegra30-udc"; and setting the assigned
> > phy to:
> > dr_mode = "peripheral";
> > I can achieve rudimentary live switching of roles.
> > The device defaults to host mode, as the ehci driver enumerates first.
> > By unbinding the tegra-ehci driver and binding the tegra-udc driver, I can switch to
> > gadget mode.
> > The reverse also works.
> > The PHY driver does not appear to care if it is always in peripheral mode.
> >
> > Thank you for your time,
> > Peter Geis

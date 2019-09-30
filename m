Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7C00C19E2
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Sep 2019 02:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729124AbfI3AeF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 29 Sep 2019 20:34:05 -0400
Received: from mail-qt1-f171.google.com ([209.85.160.171]:37058 "EHLO
        mail-qt1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729091AbfI3AeE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 29 Sep 2019 20:34:04 -0400
Received: by mail-qt1-f171.google.com with SMTP id l3so14827844qtr.4
        for <linux-tegra@vger.kernel.org>; Sun, 29 Sep 2019 17:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X+BlDGwItYeF0Dy9SmDQdob/RG8//Dup6amQw5Xfjk4=;
        b=oQgucJOjUx7MjWEjQIG0BfnjTY9msc15/149Hv+WT1A7c9LGtZ/eUFttf2JX3AYmpE
         UzMyLylNskRddgywtaidR1YWy+6FCkifQqKAIrVQprgsee/NYWzKOKomS0nRj80iQQbe
         97o8j37shSLnnkZt1LD1UNz5ffNj2J3Ji7MF8f/VxVMmJva7e4/F2jT8uvduRqiW1dhP
         bwYWT0bTgPDJ+M2RcSPPPkZRjKUDnhapDxXZrY5TbcabaJMRvBpbUrQ8fwuMnxB/89uw
         zhIVHH/KNQUTcr0uPpZiE6sNRgXqcOg2u/k+aMmORc51+xrLUfYd1FzS/m1RayWmmp8Q
         OtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X+BlDGwItYeF0Dy9SmDQdob/RG8//Dup6amQw5Xfjk4=;
        b=Ahsgpr9EBawE03auRPCb8baaQs16eXHA44+S5Zz4aeVMfCfMHkzMcPfJbYKe72ugJq
         RuSJ/ToMtgWBCf6jpFeTTeRdqtHoO0ljMZGqUdbR3YFtZFBR2j7xjJc3n4kDo7er87jM
         GR/aTDT/pZYR1zLZ1zLw49i5hcja2xhAzlaiaOp0UsSuMgnVpe2k9DOMyBW0E7Cv18La
         uSkgju8eyse0sszZz3QfeAKGSfVOTDfU8t1chWzwl2C4xnDlIswBciAX8MYpCWRG1ZDO
         eNz8y3sEmIkrzMT8cqTMZdBNE59q9rbsydEAFYTQEn/3Zv78gScAISDlOcUVgcBXlxp2
         qEdA==
X-Gm-Message-State: APjAAAXCIPKNglA00aEj98yc/BKX0qfmmJc1MseB9Vg7pUo4PnddBJB+
        oR2nlu5KV8PN8XQzxrm9bqP7QfMYwuWBD5WPWAs=
X-Google-Smtp-Source: APXvYqzAHXkIqJIPTSLN6V16oYIi7r+sJ/NXhq5CF/xymb1b8YXADlj5ZF3CKdloG4bbmicEzJh4HJyNkjBsEuOrHRY=
X-Received: by 2002:a0c:fa49:: with SMTP id k9mr18564279qvo.72.1569803641796;
 Sun, 29 Sep 2019 17:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
 <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
In-Reply-To: <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Sun, 29 Sep 2019 20:33:50 -0400
Message-ID: <CAMdYzYq9ovn3JnSmRks2WHJe3haF8kGEkVpO_UShQLCkX8vgJA@mail.gmail.com>
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

Good Evening,

While testing Dmitry's cpuidle driver I found that tegra-udc is broken
completely on linux-next.
Even in peripheral mode, disconnected from the host, it locks at the same place.

[    2.864983] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.871723] tegra-ehci: Tegra EHCI driver
[    2.880593] tegra-ehci 7d004000.usb: EHCI Host Controller
[    2.886484] tegra-ehci 7d004000.usb: new USB bus registered,
assigned bus number 1
[    2.895250] tegra-ehci 7d004000.usb: irq 88, io mem 0x7d004000
[    2.916528] tegra-ehci 7d004000.usb: USB 2.0 started, EHCI 1.00
[    2.927441] hub 1-0:1.0: USB hub found
[    2.931479] hub 1-0:1.0: 1 port detected
[    2.939124] usbcore: registered new interface driver cdc_acm
[    2.944889] cdc_acm: USB Abstract Control Model driver for USB
modems and ISDN adapters
[    2.953185] usbcore: registered new interface driver cdc_wdm
[    2.959107] usbcore: registered new interface driver uas
[    2.964824] usbcore: registered new interface driver usb-storage
[    2.974726] tegra-udc 7d000000.usb: 7d000000.usb supply vbus not
found, using dummy regulator
[    2.990506] ci_hdrc ci_hdrc.0: EHCI Host Controller
[    2.992320] udc ci_hdrc.0: registering UDC driver [g_ncm]
[    2.995708] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus number 2
[    3.001232] using random self ethernet address
[    3.012631] using random host ethernet address
[    3.017190] g_ncm gadget: adding config #1 'CDC Ethernet (NCM)'/(ptrval)
[    3.020523] ci_hdrc ci_hdrc.0: USB 2.0 started, EHCI 1.00
[    3.024058] g_ncm gadget: adding 'cdc_network'/(ptrval) to config
'CDC Ethernet (NCM)'/(ptrval)
[    3.033578] hub 2-0:1.0: USB hub found
[    3.041721] usb0: HOST MAC 9e:a2:94:94:76:53
[    3.042085] hub 2-0:1.0: 1 port detected
[    3.046706] usb0: MAC b2:13:8e:20:a9:fa
[    3.054215] g_ncm gadget: CDC Network: dual speed IN/ep1in
OUT/ep1out NOTIFY/ep2in
[    3.061861] g_ncm gadget: cfg 1/(ptrval) speeds: high full
[    3.067402] g_ncm gadget:   interface 0 = cdc_network/(ptrval)
[    3.073292] g_ncm gadget:   interface 1 = cdc_network/(ptrval)
[    3.079206] g_ncm gadget: NCM Gadget
[    3.082843] g_ncm gadget: g_ncm ready
[    3.091020] rtc rtc1: alarm rollover: day
[    3.096710] tegra_rtc 7000e000.rtc: char device (253:1)
[    3.102059] tegra_rtc 7000e000.rtc: registered as rtc1
[    3.107257] tegra_rtc 7000e000.rtc: Tegra internal Real Time Clock
[    3.114270] i2c /dev entries driver
[    3.118781] tegra-apbdma 6000a000.dma: private_candidate: dma0chan0 busy
[    3.128234] tegra-apbdma 6000a000.dma: private_candidate: dma0chan0 busy
[    3.135069] tegra-apbdma 6000a000.dma: private_candidate: dma0chan1 busy
[    3.141875] tegra-apbdma 6000a000.dma: private_candidate: dma0chan0 busy
[    3.148644] tegra-apbdma 6000a000.dma: private_candidate: dma0chan1 busy
[    3.155402] tegra-apbdma 6000a000.dma: private_candidate: dma0c

Thank you for your time,
Peter

On Sun, Sep 29, 2019 at 6:15 PM Peter Geis <pgwipeout@gmail.com> wrote:
>
> Good Afternoon,
>
> So I have dug a bit further into it.
> The tegra-udc driver defaults to host mode when set to otg.
> If the tegra-udc driver is in host mode while plugged into another
> host, the kernel will hard lock.
> If the tegra-udc driver is in host mode with a device attached the
> device enumerates correctly.
> In this state, if you change the state to gadget, the driver goes into
> a broken state.
> The gadget side is in gadget mode, but the host does not enumerate the device.
>
> As it stands the code path for the tegra-udc driver is broken in OTG mode.
> Without proper extcon support we can't support dynamic switching
> correctly anyways.
> My hack around method of retaining the phy in peripheral mode and
> switching drivers to change modes only works because both code paths
> are incomplete as well, and should not be relied upon.
>
> I think for the time being, the tegra-udc driver should check for
> host, peripheral, or otg mode.
> If it detects the device is set to otg mode, it should print an error
> message describing the current situation and fail out.
>
> If I had a device to test against with an extcon capable port, I'd try
> some more experimenting with the chipidea drivers to see if I can get
> it to work.
>
> What do you think?
>
> Dmitry,
> Do you have any devices to experiment with this?
>
> Thank you for your time,
> Peter
>
> On Sat, Sep 28, 2019 at 11:36 PM Peter Chen <peter.chen@nxp.com> wrote:
> >
> >
> > >
> > > I've encountered an odd situation where the CI Dual Role driver hard locks the
> > > kernel on the Ouya (Tegra 3).
> > > I was attempting to set up manual mode switching in the kernel, as the Ouya lacks
> > > hardware support for the ID pin and no voltage output on that port.
> > > I found that the kernel was hard locking whenever I had the dr_mode = "otg" set in
> > > the devicetree.
> >
> > It seems Tegra doesn't support host mode using chipidea driver. The ci_hdrc_tegra.c
> > only supports device mode. Thierry, could you confirm that?
> >
> > Peter
> >
> > > No further output was seen on the console, and sysreq does not respond.
> > > It occurs both in module and builtin mode.
> > >
> > > I have however found a workaround.
> > > By setting the dual role usb device to:
> > > compatible = "nvidia,tegra30-ehci", "nvidia,tegra30-udc"; and setting the assigned
> > > phy to:
> > > dr_mode = "peripheral";
> > > I can achieve rudimentary live switching of roles.
> > > The device defaults to host mode, as the ehci driver enumerates first.
> > > By unbinding the tegra-ehci driver and binding the tegra-udc driver, I can switch to
> > > gadget mode.
> > > The reverse also works.
> > > The PHY driver does not appear to care if it is always in peripheral mode.
> > >
> > > Thank you for your time,
> > > Peter Geis

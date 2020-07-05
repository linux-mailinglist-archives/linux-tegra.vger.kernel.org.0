Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4104A214DAD
	for <lists+linux-tegra@lfdr.de>; Sun,  5 Jul 2020 17:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgGEPf3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 5 Jul 2020 11:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726956AbgGEPf3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 5 Jul 2020 11:35:29 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22674C061794
        for <linux-tegra@vger.kernel.org>; Sun,  5 Jul 2020 08:35:29 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id h13so9348202otr.0
        for <linux-tegra@vger.kernel.org>; Sun, 05 Jul 2020 08:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0UEn2Uz/DDiqECjV/SxhnGXb+GfcAHdDb4/9W7vQgiE=;
        b=a2NAiqC/6SGIppO2dN6yC18R5Qrfcq3CQtwqcRm2k/ZMEVq6Nu14EvjImI0B1Zh4HK
         tQ1V5K0JUgaprzzx+ytMc2XRrpxvswkEIjpAgyXffiUjLXnz+mrKUBfgAYYctCn3FQrx
         iODd+PQwFFoPI6U3xeDX3dbT0nDi7+ZDRtDSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0UEn2Uz/DDiqECjV/SxhnGXb+GfcAHdDb4/9W7vQgiE=;
        b=CrdegkwY0ppFAnq/Gc1+hSYVH92kxRRBpx+NfUBgXsFaGXvf4T98aR1jMOWj8Ve9Fa
         0X+QBHlV+fzTcyOhB6cN6baPUEfmETbjYRmYM5+O0zDu4uw8OQH1/0qG06AyFUMnVYWU
         YCa7/9PKY02nbk0LCU4Il0MxVwgr3580ug5ftTWSJnR/n9yQg266KYjrm3MUk6eHqEyJ
         3ehAd+aa9Vx/jZK+onliKJyJ+trbvykXgCNMkWwj/AcJEaYCU7GEp6DZkEy5ACFcn09N
         7o80A3SqShvsOU32tTlrVKHTnX5bXWsbT3SqixdTnZ8F/3HKAv+Zk5aoYqT2QmcU3JIz
         pWJQ==
X-Gm-Message-State: AOAM532MNVi8zWVTGXBW4VVky9NpIjjJIpHE9T3er95VeZXJ5X3CqtC3
        frhxp1ye90gKOqpGbSwWLogIiYGVBbPmpDZioiLDnojql4o=
X-Google-Smtp-Source: ABdhPJwK2Cnk0Y3BFgLqngZRojCMdzi1UK3vSJ0R14ms45k9QaNVn7L+jv36vwJqH0FcZIcWNqyYd6vUBrue/5SbOcI=
X-Received: by 2002:a9d:5784:: with SMTP id q4mr36139030oth.356.1593963327846;
 Sun, 05 Jul 2020 08:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
 <CAPnjgZ2NxmsXUSNQtaLFxp3Qnx2O1ZqtQGQ5-9-z6vbb8ykW0g@mail.gmail.com> <CAMdYzYraKVxsE0NLvqRXXfP=oxw+fGZrrJC2aFQ4hp4hfAkrqQ@mail.gmail.com>
In-Reply-To: <CAMdYzYraKVxsE0NLvqRXXfP=oxw+fGZrrJC2aFQ4hp4hfAkrqQ@mail.gmail.com>
From:   Simon Glass <sjg@chromium.org>
Date:   Sun, 5 Jul 2020 09:35:16 -0600
Message-ID: <CAPnjgZ3S+sic-FcHU=1jW-9A=W-+HjjJ_UF50j9khvm5CUxGRA@mail.gmail.com>
Subject: Re: Chainloading U-Boot from Fastboot on Tegra30
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     U-Boot Mailing List <u-boot@lists.denx.de>,
        linux-tegra@vger.kernel.org,
        Stephen Warren <swarren@wwwdotorg.org>,
        Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Peter,

On Sun, 5 Jul 2020 at 05:33, Peter Geis <pgwipeout@gmail.com> wrote:
>
> On Sat, Jul 4, 2020 at 3:53 PM Simon Glass <sjg@chromium.org> wrote:
> >
> > Hi Peter,
> >
> > On Fri, 3 Jul 2020 at 06:33, Peter Geis <pgwipeout@gmail.com> wrote:
> > >
> > > Good Morning,
> > >
> > > I am attempting to expand on the work for chainloading U-Boot on the
> > > nyan-big in order to chainload U-Boot on the Ouya Tegra30 device from fastboot.
> > > I have so far been unsuccessful at getting any output from U-Boot
> > > through this method.
> > >
> > > I'm building the cardhu board with tweaks for Ouya's specifications
> > > similar to my work for the linux kernel.
> > > I build the image using mkbootimg --kernel u-boot.bin --ramdisk
> > > /dev/null --output u-boot-android.bin.
> > > I then fastboot boot u-boot-android.bin.
> > >
> > > I've tried tweaking the text base and tried both standard debug and
> > > low level debug.
> > >
> > > Do you think you could give me some insight into where I'm going wrong?
> >
> > Is it possible that fastboot expects a relocatable image? If you set
> > up the debug UART very early you might be able to output a character
> > in start.S ?
>
> Yes, fastboot expects a relocatable image.
> As I understand it though, if I get the text base correct, U-boot will
> not need to relocate.
>
> The debug UART is already set up when it fastboot jumps to the loaded kernel,
> So I should be able to dump data to the expected raw address and it
> will show up?

Yes, so long as you know the address. Is the MMU turned off? Cache?

>
> >
> > BTW does U-Boot have support for the fastboot protocol? Perhaps you
> > could just use U-Boot?
>
> The Ouya is locked with a signed boot loader, like most consumer
> android devices.
> Unlike most other devices, it does not have a hardware method for
> entering the bootloader in case of a brick.
> We are currently using a hacked kernel that stores another kernel in
> "safe" ram via kexec and hard resets the board, but a proper
> bootloader would be much more preferable.

OK. Maybe there is someone on this list with a bit more Android
booting experienec?

>
> I found one example of where fastboot chainloaded u-boot successfully
> on the galaxy nexus, from 2013.
> https://forum.xda-developers.com/galaxy-nexus/bootloader-boot-multi-boot-support-t2201146

OK, I'm sure it is possible. Do you have the source code for the
fastboot code that boots U-Boot?

Regards,
Simon

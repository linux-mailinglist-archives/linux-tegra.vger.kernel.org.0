Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADF1215C1E
	for <lists+linux-tegra@lfdr.de>; Mon,  6 Jul 2020 18:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729610AbgGFQnx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 6 Jul 2020 12:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729537AbgGFQnw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Jul 2020 12:43:52 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A64A9C061755
        for <linux-tegra@vger.kernel.org>; Mon,  6 Jul 2020 09:43:52 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 18so32122065otv.6
        for <linux-tegra@vger.kernel.org>; Mon, 06 Jul 2020 09:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZLLRmmxYllhDmTNTDDQREXimionPVVx7FhB6L8CZJ7I=;
        b=IH9GmTxQAZkH46716oi27xSLyb1hN4SjaizoBZYsXT05v9XcMK/3WU1zRNC0mY58f6
         kI+aHcKb/x4YqLSyLf+Xp0CHw3jAwsBggTxIY9KbyD6LtuNcUfdcjEZviZWRaEVIKbER
         mL7H5vDs2vMBdg2o+maAKu5lpYjEk47ungqj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZLLRmmxYllhDmTNTDDQREXimionPVVx7FhB6L8CZJ7I=;
        b=EHSyghe9pTW62Wi2zkehgpG1Uv1CAhhLLcLsryIr4nx8OWmNc9aPwz7ZpVTMPUTlwn
         PRgjRI9puGXd9aHrMZ84Fq+aKyz68r/faBIsN+Ux2y+NqTV1BxLV8br/py9O8uuRcW8w
         p6w++fd1uTWEAqrITmVaw40pO8uOhqlGxHFJYWCw5rUQAyXXJBAh/Wq6h3lGkrcW4Jpp
         ynoqqcI6xY3GzamNRUTCnVYLelotTCE4/0ob5J1YtakezJ1z73kBfti8YnrjKy1BnNzp
         w1PMze2wnDx3ravePDfzL0bCuOFPs3qcAHanIRT2M5YaRNQ72E4Y8xaacbZ31voDm7fm
         246g==
X-Gm-Message-State: AOAM533GAe2PjE7B9PizcKrgjLIbNTy0LGppuKblg7T+NVvakQ2QVuas
        U6EanV9v5Ui/LmEBXh6ih0vFTJg4VhrQt2kowyFqzQ==
X-Google-Smtp-Source: ABdhPJz89KluCkDz4BoV90yb2TGdFg/tdsPK1Iq0jR1duj4BStv0dGALi+JCcSqPjxCLwvIjqPtn2vLtuERpRxLI/5Y=
X-Received: by 2002:a9d:7982:: with SMTP id h2mr27913540otm.100.1594053831609;
 Mon, 06 Jul 2020 09:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
 <CAPnjgZ2NxmsXUSNQtaLFxp3Qnx2O1ZqtQGQ5-9-z6vbb8ykW0g@mail.gmail.com>
 <CAMdYzYraKVxsE0NLvqRXXfP=oxw+fGZrrJC2aFQ4hp4hfAkrqQ@mail.gmail.com>
 <CAPnjgZ3S+sic-FcHU=1jW-9A=W-+HjjJ_UF50j9khvm5CUxGRA@mail.gmail.com> <CAMdYzYrEZfSD4m1iJY0duTp37WUCW9kbbAt3mM8HQSuWGBh91w@mail.gmail.com>
In-Reply-To: <CAMdYzYrEZfSD4m1iJY0duTp37WUCW9kbbAt3mM8HQSuWGBh91w@mail.gmail.com>
From:   Simon Glass <sjg@chromium.org>
Date:   Mon, 6 Jul 2020 10:43:40 -0600
Message-ID: <CAPnjgZ2WBfeQeyDQVvSGonp_KvGRO7X59dqAaAiQqizdsZqHdA@mail.gmail.com>
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

On Mon, 6 Jul 2020 at 05:52, Peter Geis <pgwipeout@gmail.com> wrote:
>
> On Sun, Jul 5, 2020 at 11:35 AM Simon Glass <sjg@chromium.org> wrote:
> >
> > Hi Peter,
> >
> > On Sun, 5 Jul 2020 at 05:33, Peter Geis <pgwipeout@gmail.com> wrote:
> > >
> > > On Sat, Jul 4, 2020 at 3:53 PM Simon Glass <sjg@chromium.org> wrote:
> > > >
> > > > Hi Peter,
> > > >
> > > > On Fri, 3 Jul 2020 at 06:33, Peter Geis <pgwipeout@gmail.com> wrote:
> > > > >
> > > > > Good Morning,
> > > > >
> > > > > I am attempting to expand on the work for chainloading U-Boot on the
> > > > > nyan-big in order to chainload U-Boot on the Ouya Tegra30 device from fastboot.
> > > > > I have so far been unsuccessful at getting any output from U-Boot
> > > > > through this method.
> > > > >
> > > > > I'm building the cardhu board with tweaks for Ouya's specifications
> > > > > similar to my work for the linux kernel.
> > > > > I build the image using mkbootimg --kernel u-boot.bin --ramdisk
> > > > > /dev/null --output u-boot-android.bin.
> > > > > I then fastboot boot u-boot-android.bin.
> > > > >
> > > > > I've tried tweaking the text base and tried both standard debug and
> > > > > low level debug.
> > > > >
> > > > > Do you think you could give me some insight into where I'm going wrong?
> > > >
> > > > Is it possible that fastboot expects a relocatable image? If you set
> > > > up the debug UART very early you might be able to output a character
> > > > in start.S ?
> > >
> > > Yes, fastboot expects a relocatable image.
> > > As I understand it though, if I get the text base correct, U-boot will
> > > not need to relocate.
> > >
> > > The debug UART is already set up when it fastboot jumps to the loaded kernel,
> > > So I should be able to dump data to the expected raw address and it
> > > will show up?
> >
> > Yes, so long as you know the address. Is the MMU turned off? Cache?
>
> It is unknown what state either of these are in, since I am unfamiliar
> at all with how fastboot functions with these.
> In U-boot yes the MMU was enabled as well as both I and D cache.
>
> >
> > >
> > > >
> > > > BTW does U-Boot have support for the fastboot protocol? Perhaps you
> > > > could just use U-Boot?
> > >
> > > The Ouya is locked with a signed boot loader, like most consumer
> > > android devices.
> > > Unlike most other devices, it does not have a hardware method for
> > > entering the bootloader in case of a brick.
> > > We are currently using a hacked kernel that stores another kernel in
> > > "safe" ram via kexec and hard resets the board, but a proper
> > > bootloader would be much more preferable.
> >
> > OK. Maybe there is someone on this list with a bit more Android
> > booting experienec?
> >
> > >
> > > I found one example of where fastboot chainloaded u-boot successfully
> > > on the galaxy nexus, from 2013.
> > > https://forum.xda-developers.com/galaxy-nexus/bootloader-boot-multi-boot-support-t2201146
> >
> > OK, I'm sure it is possible. Do you have the source code for the
> > fastboot code that boots U-Boot?
>
> No, we have the reference code here:
> https://android.googlesource.com/platform/bootable/bootloader/legacy/+/b1fde5cd7d5158b8e6876139ca76a341d0e49708/usbloader/usbloader.c
>
> Unfortunately the behavior observed in the Ouya shows it has been
> heavily modified from this baseline.
>
> I've reached out to the dev who performed the work on u-boot for
> insight as well.

If you have a kernel that loads at the same address that works, and it
can display a UART character very early, then you should be able to
make a U-Boot that does the same in the first few instructions. If you
can't get that far, something else is going on. Do you have JTAG
access?

Regards,
Simon

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B50CC2156B6
	for <lists+linux-tegra@lfdr.de>; Mon,  6 Jul 2020 13:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgGFLwO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 6 Jul 2020 07:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbgGFLwO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Jul 2020 07:52:14 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57BBC061794
        for <linux-tegra@vger.kernel.org>; Mon,  6 Jul 2020 04:52:13 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id p20so41974174ejd.13
        for <linux-tegra@vger.kernel.org>; Mon, 06 Jul 2020 04:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KyM87wGitBE2F1H7qRb7iJvYmu71C8vDv3jhxKALMlk=;
        b=mIBiflbbq1/nsrab3da/pdNtXDenvx68oslAQ0am0CJ7p2RbZwYf4X83aGSEiq4xg+
         SDfedsDReyfZ3LZ1TNtU4nVrSr+rpBKsKA59fS0junqgxGXE5uwMX3ZvCBg/rBL7jR16
         bF0fxtg0lKNyJIIZ4PYzZ8bEP/QHP1B0EB0FgV4IUwgdk4TB9+VsRuNrSbjoeD8DGmFK
         HE/EUfpRWbJqCg0AhgJCWVSoYcawMrVCBHKP6jmaofhsN2Es8pQawEXfS1EQfghOkme7
         CYM43qxw8RYoRTJiLCj2KGFk2jg6HizoJjw8FX8WdF4CSuMJGec3MdgrU695Ubt7pHGL
         87xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KyM87wGitBE2F1H7qRb7iJvYmu71C8vDv3jhxKALMlk=;
        b=dtB2HvMtxD/a6owssacEsmkieiPdj0f5WWzPVy3suGp4FtloCmqNjU8sJUy/nZRt2Y
         HwTBZQG7hoiSjafNp4pGjq50Cq6bAgEQ+2otm97KIGOBGXFRMExjBJTFKF+7sE7InOWN
         EveeSzapo6zt0jb/gcNnlFy0H14ZLK0UaCAi3liT6jC+pjTDSt4l7PZZ9h+U+PgJo7vL
         GGULY1uRy6Jh4StqJxM4Lq/SjEYFnhBRge86XLLSYajZQZl+6jON+N4o6jYUUs6Zv976
         QUxPTye4Zyj0mkdCsVvyQ4O0TuV0v2STjPIwKqSaKO1mCXwatjtINYEyYpdcpMR6hwr1
         a/zg==
X-Gm-Message-State: AOAM531wBSKNKluS33Pn5U4qTHyCGKq0M5o/jTPksHCk7GqvHzLYhwk3
        lV9Icj9O+XHEWU38wOMAwVBgi/u3/7WgrK/ynm8=
X-Google-Smtp-Source: ABdhPJxqhkwhUri9LT1f4nM2zEVnqruA/vuLrNtBqaxFsQSv+lVpfPZixqcTrB5pCXIijS17Yv/wgHc2xzqRmu9T3S4=
X-Received: by 2002:a17:906:fac3:: with SMTP id lu3mr36359208ejb.374.1594036332226;
 Mon, 06 Jul 2020 04:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
 <CAPnjgZ2NxmsXUSNQtaLFxp3Qnx2O1ZqtQGQ5-9-z6vbb8ykW0g@mail.gmail.com>
 <CAMdYzYraKVxsE0NLvqRXXfP=oxw+fGZrrJC2aFQ4hp4hfAkrqQ@mail.gmail.com> <CAPnjgZ3S+sic-FcHU=1jW-9A=W-+HjjJ_UF50j9khvm5CUxGRA@mail.gmail.com>
In-Reply-To: <CAPnjgZ3S+sic-FcHU=1jW-9A=W-+HjjJ_UF50j9khvm5CUxGRA@mail.gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Mon, 6 Jul 2020 07:52:00 -0400
Message-ID: <CAMdYzYrEZfSD4m1iJY0duTp37WUCW9kbbAt3mM8HQSuWGBh91w@mail.gmail.com>
Subject: Re: Chainloading U-Boot from Fastboot on Tegra30
To:     Simon Glass <sjg@chromium.org>
Cc:     U-Boot Mailing List <u-boot@lists.denx.de>,
        linux-tegra@vger.kernel.org,
        Stephen Warren <swarren@wwwdotorg.org>,
        Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Jul 5, 2020 at 11:35 AM Simon Glass <sjg@chromium.org> wrote:
>
> Hi Peter,
>
> On Sun, 5 Jul 2020 at 05:33, Peter Geis <pgwipeout@gmail.com> wrote:
> >
> > On Sat, Jul 4, 2020 at 3:53 PM Simon Glass <sjg@chromium.org> wrote:
> > >
> > > Hi Peter,
> > >
> > > On Fri, 3 Jul 2020 at 06:33, Peter Geis <pgwipeout@gmail.com> wrote:
> > > >
> > > > Good Morning,
> > > >
> > > > I am attempting to expand on the work for chainloading U-Boot on the
> > > > nyan-big in order to chainload U-Boot on the Ouya Tegra30 device from fastboot.
> > > > I have so far been unsuccessful at getting any output from U-Boot
> > > > through this method.
> > > >
> > > > I'm building the cardhu board with tweaks for Ouya's specifications
> > > > similar to my work for the linux kernel.
> > > > I build the image using mkbootimg --kernel u-boot.bin --ramdisk
> > > > /dev/null --output u-boot-android.bin.
> > > > I then fastboot boot u-boot-android.bin.
> > > >
> > > > I've tried tweaking the text base and tried both standard debug and
> > > > low level debug.
> > > >
> > > > Do you think you could give me some insight into where I'm going wrong?
> > >
> > > Is it possible that fastboot expects a relocatable image? If you set
> > > up the debug UART very early you might be able to output a character
> > > in start.S ?
> >
> > Yes, fastboot expects a relocatable image.
> > As I understand it though, if I get the text base correct, U-boot will
> > not need to relocate.
> >
> > The debug UART is already set up when it fastboot jumps to the loaded kernel,
> > So I should be able to dump data to the expected raw address and it
> > will show up?
>
> Yes, so long as you know the address. Is the MMU turned off? Cache?

It is unknown what state either of these are in, since I am unfamiliar
at all with how fastboot functions with these.
In U-boot yes the MMU was enabled as well as both I and D cache.

>
> >
> > >
> > > BTW does U-Boot have support for the fastboot protocol? Perhaps you
> > > could just use U-Boot?
> >
> > The Ouya is locked with a signed boot loader, like most consumer
> > android devices.
> > Unlike most other devices, it does not have a hardware method for
> > entering the bootloader in case of a brick.
> > We are currently using a hacked kernel that stores another kernel in
> > "safe" ram via kexec and hard resets the board, but a proper
> > bootloader would be much more preferable.
>
> OK. Maybe there is someone on this list with a bit more Android
> booting experienec?
>
> >
> > I found one example of where fastboot chainloaded u-boot successfully
> > on the galaxy nexus, from 2013.
> > https://forum.xda-developers.com/galaxy-nexus/bootloader-boot-multi-boot-support-t2201146
>
> OK, I'm sure it is possible. Do you have the source code for the
> fastboot code that boots U-Boot?

No, we have the reference code here:
https://android.googlesource.com/platform/bootable/bootloader/legacy/+/b1fde5cd7d5158b8e6876139ca76a341d0e49708/usbloader/usbloader.c

Unfortunately the behavior observed in the Ouya shows it has been
heavily modified from this baseline.

I've reached out to the dev who performed the work on u-boot for
insight as well.

>
> Regards,
> Simon

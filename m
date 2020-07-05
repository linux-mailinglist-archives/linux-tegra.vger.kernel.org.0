Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F210F214C0A
	for <lists+linux-tegra@lfdr.de>; Sun,  5 Jul 2020 13:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgGELdj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 5 Jul 2020 07:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbgGELdi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 5 Jul 2020 07:33:38 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C7DFC061794
        for <linux-tegra@vger.kernel.org>; Sun,  5 Jul 2020 04:33:38 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id dr13so39509532ejc.3
        for <linux-tegra@vger.kernel.org>; Sun, 05 Jul 2020 04:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ceIhECjDVoNf77FCw9J/YXV5pqG7MJOCSsLaxb2nBLI=;
        b=MeLfaGtu9d66E+04Q5fasKLLD76cFZn6MdwHzZfILlkrQVy9UY7JnnwRHQzKrIgdaw
         bAjOvgN5vDntPsl8BTyykUD1pp3mmnNTZF5aYP9FO+kBYwVCMEsealD2AX11bBtFMDIK
         rAOTKywKECzpCwRebXKVwFDjfHykqovcZsLCn8ugFE8rPL7mnYB6y6FJi8Vw4RQcLmhs
         7ZV1Cy963dloiwGraRimpRlL9IBJ70eyAjG2YJaNRAcxoPzLoz2t9JhNX57UTS7yYOxc
         9v+4OgInNta+dgicKWaGbfuvaHLcYcYFppaZSGUZWyaVQVGX7NOBz4oKFN3XS9X+CyFY
         Qh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ceIhECjDVoNf77FCw9J/YXV5pqG7MJOCSsLaxb2nBLI=;
        b=d2tDkrY8xdFtJQhvH0TfEysFoAZ+ps8BPBwfqZZTuI6yH1n1q0IZaq1IaekFfPrj8r
         4U3tlFSkP2NCeqBQoVdWgO3+CUvjAZqmx+Jp8GuWnNYkgMPUIPWSfZBdm2ZDzNrH+j3T
         uwBdDLQIc5ck+HO6yTRclquAQkF14L1/5FKCqQbNAXBdWNBF1a71tHOl0TBlZAoH8yvr
         JeQ/2ATMIKKAg4YBH+Lz5Ts6w0aVuOR1GhiQRDT8EN8CWm1jJgxaCu+9QcmOb0SyYcCS
         /jy+KU4FAjHe4L8e38E0E+8EA2LYJA+6iqA7bXhPaSYetPlZ5b815sXY9EE9N5NKxW/l
         vXNA==
X-Gm-Message-State: AOAM530sctqbRbYl/j6dgnPaET+A7Sjb7nonPjmcBzrXiSy0J6W2xQOx
        usu1ZdNM+C4/Sknj1TaYKkmlsRYx3JkdLZi7gJg=
X-Google-Smtp-Source: ABdhPJxJtdjIAI3p628cKZCLZBn8XAn/3C19Ft5dgkStM89DSF4e5gdx2fLyrXUKv3GgXaUKF4IRAzpyVzv3+TG/NKg=
X-Received: by 2002:a17:906:57c5:: with SMTP id u5mr23552628ejr.311.1593948816993;
 Sun, 05 Jul 2020 04:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
 <CAPnjgZ2NxmsXUSNQtaLFxp3Qnx2O1ZqtQGQ5-9-z6vbb8ykW0g@mail.gmail.com>
In-Reply-To: <CAPnjgZ2NxmsXUSNQtaLFxp3Qnx2O1ZqtQGQ5-9-z6vbb8ykW0g@mail.gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Sun, 5 Jul 2020 07:33:26 -0400
Message-ID: <CAMdYzYraKVxsE0NLvqRXXfP=oxw+fGZrrJC2aFQ4hp4hfAkrqQ@mail.gmail.com>
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

On Sat, Jul 4, 2020 at 3:53 PM Simon Glass <sjg@chromium.org> wrote:
>
> Hi Peter,
>
> On Fri, 3 Jul 2020 at 06:33, Peter Geis <pgwipeout@gmail.com> wrote:
> >
> > Good Morning,
> >
> > I am attempting to expand on the work for chainloading U-Boot on the
> > nyan-big in order to chainload U-Boot on the Ouya Tegra30 device from fastboot.
> > I have so far been unsuccessful at getting any output from U-Boot
> > through this method.
> >
> > I'm building the cardhu board with tweaks for Ouya's specifications
> > similar to my work for the linux kernel.
> > I build the image using mkbootimg --kernel u-boot.bin --ramdisk
> > /dev/null --output u-boot-android.bin.
> > I then fastboot boot u-boot-android.bin.
> >
> > I've tried tweaking the text base and tried both standard debug and
> > low level debug.
> >
> > Do you think you could give me some insight into where I'm going wrong?
>
> Is it possible that fastboot expects a relocatable image? If you set
> up the debug UART very early you might be able to output a character
> in start.S ?

Yes, fastboot expects a relocatable image.
As I understand it though, if I get the text base correct, U-boot will
not need to relocate.

The debug UART is already set up when it fastboot jumps to the loaded kernel,
So I should be able to dump data to the expected raw address and it
will show up?

>
> BTW does U-Boot have support for the fastboot protocol? Perhaps you
> could just use U-Boot?

The Ouya is locked with a signed boot loader, like most consumer
android devices.
Unlike most other devices, it does not have a hardware method for
entering the bootloader in case of a brick.
We are currently using a hacked kernel that stores another kernel in
"safe" ram via kexec and hard resets the board, but a proper
bootloader would be much more preferable.

I found one example of where fastboot chainloaded u-boot successfully
on the galaxy nexus, from 2013.
https://forum.xda-developers.com/galaxy-nexus/bootloader-boot-multi-boot-support-t2201146

>
> Regards,
> Simon

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8E6380942
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 06:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbfHDE2V (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 00:28:21 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:36662 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbfHDE2V (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 00:28:21 -0400
Received: by mail-qt1-f193.google.com with SMTP id z4so78004480qtc.3
        for <linux-tegra@vger.kernel.org>; Sat, 03 Aug 2019 21:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1H1+rlJ6SD+44R7pGQZ7vthtIH3lGGxC7PwH28CcjfE=;
        b=smcGVglE+t2HaHm8doaNhCgGPITR6e5PauCq2M9jplEXREPkga0rsKeda4QUMk+0+T
         hUkrK5XQItZSimEdw31IaBcLGSo/JtwiaZRNktjXjRq8/i2k9K1cltp1r9XralM3FV7a
         aTkV33CuJOOK9ZCnjJcmqV4YvsV+TuPxFRZlVFt+WbZgd5jieARZFcjUAZU1S1nJKJ18
         95o03xSazyFPliZ6ejc/eaKKN1nWbJhlQla8kc2SuYyLyxgNguJd0ImU4orw2lzbA96i
         Hh53ghV4Wio4y2FlFOCtHsatxrCpcYgTefv4rIYKPrCyYXs+F9preZgA42x5BmM5QI//
         xu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1H1+rlJ6SD+44R7pGQZ7vthtIH3lGGxC7PwH28CcjfE=;
        b=HRnxKMaedtXAi3LObZUyaA2DMTFodzw91fsuGvdyGhAkNm9+JXuwqKGJsjTRjBWVFQ
         fsnZw8gKvBWf9Ucc/n+/O8l5/+XcRuYcJgJgmnqlokPX80aBxyZGznLOJYCdlV3I/56k
         zCnZE6w2YRe1ILI0HwFK0F7yL6xf97zUJk5sNmHAIXU13foXXa88ECG5/AmMcmn90Xu8
         IqP5/CxiLYqs/DMQkdLylMyvvLcZCNFgkRVInlXtNRRtGg3C3ZC/ljZMeLDCaSonL8BF
         +phPkXNYWQ960EjhVlx934gH4Yvzaz/uzRqK/5ZF0pRkEEmjDf6yw+0Tc6emvG0hOlJZ
         kyPg==
X-Gm-Message-State: APjAAAUbe9SB7zLhwj5ASssjlM9Bh/tGTYHvqanVJaqNhY2DCa2O08cN
        r6JC5Wxwj3b7LklqEEy8UWeJPqajjvD6ezScgXM=
X-Google-Smtp-Source: APXvYqydRLgLRamcRvgoUr8U5fm7ids8sdNBJFrZlycVsn4Emob4Ts8SKkpIaiW4KU0wZ5bFDxuXzJ4GzmSq1Udhz18=
X-Received: by 2002:aed:3ed5:: with SMTP id o21mr102857080qtf.369.1564892900175;
 Sat, 03 Aug 2019 21:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAB9DXsEueDnFRMK1VgxVJfjsGrwADkEuMfe+EYujnWOTfi35wQ@mail.gmail.com>
 <20190802131347.GA3740@ulmo>
In-Reply-To: <20190802131347.GA3740@ulmo>
From:   =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska@gmail.com>
Date:   Sun, 4 Aug 2019 06:27:52 +0200
Message-ID: <CAFCWPP+rC9jHpR9-5FEuy_Ec7GdS3h7UsuRZEBqdhSptbuOF9w@mail.gmail.com>
Subject: Re: Running ArchLinux on Jetson Nano
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Anthony MOI <anthony@huggingface.co>, linux-tegra@vger.kernel.org,
        Lysandre Debut <lysandre@huggingface.co>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

so 3. 8. 2019 v 2:03 odes=C3=ADlatel Thierry Reding
<thierry.reding@gmail.com> napsal:
>
> On Fri, Jul 05, 2019 at 08:06:16PM -0400, Anthony MOI wrote:
> > Hi Thierry,
> >
> > Thank you immensely for your work on the Jetson Nano and Linux Tegra. W=
e
> > are two developers that are trying to install Arch Linux on a Jetson Na=
no,
> > and you have helped us tremendously with your multiple tutorials.
> >
> > We are reaching out today because we feel like we have hit a wall and w=
e
> > would be very grateful if you could give us any indication whatsoever a=
s to
> > what the next step could be.
> >
> > Allow us to give you background on what we have done so far:
> >
> > - We can easily flash the provided sample root file system and get a
> > running Ubuntu.
> > - We managed to flash an ArchLinux-aarch64, putting all the drivers
> > manually. With this installation, we have the 4.9 Kernel provided with =
the
> > L4T drivers package. Everything seems to be working fine, except that w=
e
> > can't get Xorg to run.
> > - We can update/upgrade the arch system as long as we don't update the
> > kernel/firmware
> > - We tried to compile both U-Boot and the kernel using your `p3450`
> > branches. We can boot using both but in the end, Xorg doesn't work eith=
er,
> > and the USB firmware does not load.
> >
> > We have what seems to be a fully working Arch Linux system right now,
> > except for the actual display (and the USB with the custom kernel).
> >
> > When we try to launch our X server, we have the following error:
> > [   540.384] (EE) NVIDIA(GPU-0): Failed to initialize the NVIDIA graphi=
cs
> > device!
> > [   540.384] (EE) NVIDIA(0): Failing initialization of X screen 0
> > When running the command `shasum -c /etc/nv_tegra_release`, all our dri=
vers
> > return OK.
> >
> > We are at a loss at what to do next, we have tried everything we could
> > think of, and would love to have your opinion on the matter.
> >
> > Thank you so much for everything you=E2=80=99ve done,
>
> Hi,
>
> sorry this got burried in my inbox and I only stumbled across it by
> accident.
>
> First of all, the p3450 branch for the Linux kernel is mostly stale
> at this point. You should get equivalent, if not better, functionality
> using a recent linux-next release.
>
> Second, if I understand correctly, you're trying to run the L4T
> userspace on top of an upstream kernel. However, that's not supported
> and will not work. If you want to use an upstream kernel you're going
> to have to stick to an upstream graphics stack, which for X means the
> modesetting driver (which is built into recent X servers) and Mesa.
> The version of Mesa that ships with Arch Linux should support Tegra X1
> and therefore Jetson Nano out of the box.
>
> If you need to stick with the L4T driver package, then I'm afraid but
> you also need to stick with the L4T kernel image.
>
> Thierry

Hello.
Perhaps this will help solve the problem.
https://elinux.org/Jetson/Porting_Arch#X11_Support
I don't know ...

Milan

--=20

Remember, no question is too stupid and no problem too small
                           -- We've all been beginners

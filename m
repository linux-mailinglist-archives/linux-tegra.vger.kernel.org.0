Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 886727F83A
	for <lists+linux-tegra@lfdr.de>; Fri,  2 Aug 2019 15:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731729AbfHBNNv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 2 Aug 2019 09:13:51 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38625 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727949AbfHBNNu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Aug 2019 09:13:50 -0400
Received: by mail-ed1-f67.google.com with SMTP id r12so37557948edo.5
        for <linux-tegra@vger.kernel.org>; Fri, 02 Aug 2019 06:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Gn4AnZo+UU26q63DnQuFbgg304Lrwu63MnjSt46NRL4=;
        b=P7hN7kPYzzvpx0ZUVkkwf3isKFOOCL3rQHU143skJw/agAPHVa8svctnkwXmFuEMkh
         MI9aqW2FLyIP5l/aTQP8S+YFH0jvwqfFHu0tgYU+2w5kAALud1hjkHKJZjJx7VMtTq2/
         rrdZiggWgPIsBZ+zpinA9o4p1HqTkKziEUu88v1ErwPBvDWCf/OlSx8WXiOocn98fvKM
         IynjtIuhaBLnatRU5ChX+wrm19gi3VnYa94/CV0gnqRchjFmmx5KSoOmxxT7ZvLp+Z6R
         EK6mhUDcxp9zIToJNXVpe/838t+mZ0O6fVbGyQTN1eWYN3cOkCBkLMHfm8CFd2fkLPk7
         WHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Gn4AnZo+UU26q63DnQuFbgg304Lrwu63MnjSt46NRL4=;
        b=qyjKdZJlDqmXlE4AQTlcNFsLA8SU0JSSBSQk47DOmZmR9isbumEZ5aGuSX3mSbucy2
         DMksBSgGtFg4NVps4g6ZoDNUdrF+rNdSdOFFyAnAZZmdAdhCZDR/xWD3M9/M5Jk/w+n0
         VADsLgIwHwgd4bM8yWNx2wMt4rcBtKn0het0Y9J+cS5F05wJSR/CxLwyCcp3mHf3arrI
         SyOM8aIk4jyIJ7oZj+zuMk/yg9d8SxoN3GmdL3fS0WykzBGBHYfBoRT0pNaKKPZQqRpZ
         QdRQ9E7FYyH3HJg3QcgHly3kPgkaeW/DNF92xpNaPHSBDJte0dLSc3DBsFgytDZP0CUb
         AdvQ==
X-Gm-Message-State: APjAAAWP6dAkM55K5s3lEwZzouyOtkGxtPSL/RizNgLya2soeMrC8LUE
        OIPkALMFUf4OcZKI6cw5Iwo=
X-Google-Smtp-Source: APXvYqyhLRCvTfoQv0T7p7jLmclqgKVgL0PiqOOKQ5CxwaKlknEO838LoY+2HRDuusTojGKZxw02cA==
X-Received: by 2002:a50:a942:: with SMTP id m2mr119419886edc.73.1564751628972;
        Fri, 02 Aug 2019 06:13:48 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id h10sm18609854edh.64.2019.08.02.06.13.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 02 Aug 2019 06:13:48 -0700 (PDT)
Date:   Fri, 2 Aug 2019 15:13:47 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Anthony MOI <anthony@huggingface.co>
Cc:     linux-tegra@vger.kernel.org,
        Lysandre Debut <lysandre@huggingface.co>
Subject: Re: Running ArchLinux on Jetson Nano
Message-ID: <20190802131347.GA3740@ulmo>
References: <CAB9DXsEueDnFRMK1VgxVJfjsGrwADkEuMfe+EYujnWOTfi35wQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <CAB9DXsEueDnFRMK1VgxVJfjsGrwADkEuMfe+EYujnWOTfi35wQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 05, 2019 at 08:06:16PM -0400, Anthony MOI wrote:
> Hi Thierry,
>=20
> Thank you immensely for your work on the Jetson Nano and Linux Tegra. We
> are two developers that are trying to install Arch Linux on a Jetson Nano,
> and you have helped us tremendously with your multiple tutorials.
>=20
> We are reaching out today because we feel like we have hit a wall and we
> would be very grateful if you could give us any indication whatsoever as =
to
> what the next step could be.
>=20
> Allow us to give you background on what we have done so far:
>=20
> - We can easily flash the provided sample root file system and get a
> running Ubuntu.
> - We managed to flash an ArchLinux-aarch64, putting all the drivers
> manually. With this installation, we have the 4.9 Kernel provided with the
> L4T drivers package. Everything seems to be working fine, except that we
> can't get Xorg to run.
> - We can update/upgrade the arch system as long as we don't update the
> kernel/firmware
> - We tried to compile both U-Boot and the kernel using your `p3450`
> branches. We can boot using both but in the end, Xorg doesn't work either,
> and the USB firmware does not load.
>=20
> We have what seems to be a fully working Arch Linux system right now,
> except for the actual display (and the USB with the custom kernel).
>=20
> When we try to launch our X server, we have the following error:
> [   540.384] (EE) NVIDIA(GPU-0): Failed to initialize the NVIDIA graphics
> device!
> [   540.384] (EE) NVIDIA(0): Failing initialization of X screen 0
> When running the command `shasum -c /etc/nv_tegra_release`, all our drive=
rs
> return OK.
>=20
> We are at a loss at what to do next, we have tried everything we could
> think of, and would love to have your opinion on the matter.
>=20
> Thank you so much for everything you=E2=80=99ve done,

Hi,

sorry this got burried in my inbox and I only stumbled across it by
accident.

First of all, the p3450 branch for the Linux kernel is mostly stale
at this point. You should get equivalent, if not better, functionality
using a recent linux-next release.

Second, if I understand correctly, you're trying to run the L4T
userspace on top of an upstream kernel. However, that's not supported
and will not work. If you want to use an upstream kernel you're going
to have to stick to an upstream graphics stack, which for X means the
modesetting driver (which is built into recent X servers) and Mesa.
The version of Mesa that ships with Arch Linux should support Tegra X1
and therefore Jetson Nano out of the box.

If you need to stick with the L4T driver package, then I'm afraid but
you also need to stick with the L4T kernel image.

Thierry

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1ENwgACgkQ3SOs138+
s6FdZA//drlAhUAQumUMLp0UZZOYze8bYM+Z6E+fAocOlHdycZ0O1Qy8ordvlMKi
7WBzUl/qOBs9CYnw+VBrvgXY/GQK6PbikMmULhDnS6jbFhuUN+EDZDUpxo5kMisM
IRTIwkd6bZETgxz7+spGigaKT7DA8skFPrdMw02701GB8ukYrb3oAspUPRD3dYY2
0Ud9tuAi+Jnne8lxSoFJ9OjwTE2F4FGUtkjnhMV96Ayw/sJc9HmhAQfn4hh/y6SY
cu7eKMYv2gUD3TQd08/foW1wAXbq6WCKZvQ4aIUS1CbKwbR9Kqxxbw+31YkLrOdx
9eK6Y9TdEogz2HdVkQeBumqQD3OLlOSjFxT3MKvlG+ncItTsgcEpxVMHbuPsSIah
8Zb7X/kidIIVQQpa3n8jcp9GhQBUsTbuV3nrmqvRnocR5IPq8MnRt6L05xBTCRJa
tWZ/fLLKv5TXJLKYLmi+i0OAlIb9cxDtHXlPJtYeFadtSC6tQMPAm54mZKbK1in9
OgrAH8lqLfRRK4CDhHs878TAtNxLLy8IW8dYTq4sy7ne+FL6dS6P7WmGWxy7N9dy
pnGoEtwVyUrX5mHmjZZZtl7amz/P2CB0nDGfBClFGY0ByZM3uY66hfjyI85BJxvH
Rs04YQgzxcMXbdNQ98fEbdeeAro3ON7apTVVr1rndCg5juWGKuw=
=OjZs
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--

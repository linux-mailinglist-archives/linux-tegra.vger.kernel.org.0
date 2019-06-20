Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54A144D492
	for <lists+linux-tegra@lfdr.de>; Thu, 20 Jun 2019 19:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731567AbfFTRIf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 20 Jun 2019 13:08:35 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51068 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbfFTRIf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 Jun 2019 13:08:35 -0400
Received: by mail-wm1-f65.google.com with SMTP id c66so3836378wmf.0
        for <linux-tegra@vger.kernel.org>; Thu, 20 Jun 2019 10:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uz+mhHWqJu5W51phZe+YwIkqo1ZzdpMiKSfx+tEOH+I=;
        b=VRM3OZKLaPb9eHlqozTuDhcKNK4Ch46gsJNxrRDQJcHudaUiSwOCpsm5qB8VuTmx+t
         X6mIFRCyL915RCx6ekbR6sozaMPztRnDNrWtLDcSf1+yNM/qsWtOSlvSmdYEW5445sNR
         s9hTpmxo2i36mESgPPKM3QhuvFwLvdz/noyaB7Pf1VsIgsdkxcdPiwFX8m4HKoejPtie
         5b98E7G/nfqnFghfEQp33hMIvhaluwLWcrqaox+cK/+fLxS1mT5SW4iCp2Fy+15lkAaD
         ijCmhIhKJ/jCm/hqGoVki9oMQKhZd19CxBuIBQy2mZnw/pv20OzBwhR4HHHtWp67QLfX
         tLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uz+mhHWqJu5W51phZe+YwIkqo1ZzdpMiKSfx+tEOH+I=;
        b=WDqDfHhUuwi2E1lJKYS0MTBtY4MXb1gF/pIgfmbWs56ZyEGZ7O3bU9nL3PHftU+280
         HNGZRxGQDG+PT5ipsHvfCZXUsaj+QYW4v0HsEUjy6Efm83dwLeHfHpSPI0nnImoyUGwb
         xedv7U8dlmJHycVXQJ7d5WSH+cbZAGMmOrmXwlHfdrtDtWxC7xd7DGFa+X4srlsXupSZ
         uKxapaM4a3pouUz7zIvdWVl5EQKuidmSmVN4nEJgM4nee/WLAZYHw01Wsk+fBtPLQouB
         15L2bkvlgsoUt7mJDMoibZaLNajzX96ytUM1y5IlbU1DnXcNfjjaxLrkqirGDfoWuQqx
         705g==
X-Gm-Message-State: APjAAAU2ZLzHxbKFpcNr3vT6SkULjpFkZqNENyIiJ/oecUJvThsRsIlh
        IhoK58BYQasBKhTGUow6r9U=
X-Google-Smtp-Source: APXvYqxGHIj+gpssVdiGV1fl5VCV1vUfKpqEfoftjkQHED+xKiPb0DHRZm8Yd82ZBdHjdhf4v41a3A==
X-Received: by 2002:a7b:cae2:: with SMTP id t2mr384335wml.157.1561050513226;
        Thu, 20 Jun 2019 10:08:33 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id w2sm226444wrr.31.2019.06.20.10.08.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 10:08:32 -0700 (PDT)
Date:   Thu, 20 Jun 2019 19:08:31 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Warren <swarren@wwwdotorg.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org
Subject: Re: [pinmux scripts PATCH 1/3] Update kernel driver template
Message-ID: <20190620170831.GA20367@ulmo>
References: <20190620170055.19771-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
In-Reply-To: <20190620170055.19771-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2019 at 07:00:53PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Some changes in recent years have modified the upstream kernel driver in
> some ways that make it incompatible with the current template. Update
> the template to take into account changes introduced by the following
> commits:
>=20
> 	commit e3d2160f12d6aa7a87d9db09d8458b4a3492cd45
> 	Author: Paul Gortmaker <paul.gortmaker@windriver.com>
> 	Date:   Mon May 22 16:56:47 2017 -0400
>=20
> 	    pinctrl: tegra: clean up modular vs. non-modular distinctions
>=20
> 	    None of the Kconfigs for any of these drivers are tristate,
> 	    meaning that they currently are not being built as a module by anyon=
e.
>=20
> 	    Lets remove the modular code that is essentially orphaned, so that
> 	    when reading the drivers there is no doubt they are builtin-only.  A=
ll
> 	    drivers get similar changes, so they are handled in batch.
>=20
> 	    We remove module.h from code that isn't doing anything modular at
> 	    all;  if they have __init sections, then replace it with init.h.
>=20
> 	    A couple drivers have module_exit() code that is essentially orphane=
d,
> 	    and so we remove that.
>=20
> 	    Quite a few bool drivers (hence non-modular) are converted over to
> 	    to builtin_platform_driver().
>=20
> 	    Since module_platform_driver() uses the same init level priority as
> 	    builtin_platform_driver() the init ordering remains unchanged with
> 	    this commit.
>=20
> 	    Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>=20
> 	    We also delete the MODULE_LICENSE tag etc. since all that information
> 	    was (or is now) contained at the top of the file in the comments.
>=20
> 	    Cc: Linus Walleij <linus.walleij@linaro.org>
> 	    Cc: Stephen Warren <swarren@wwwdotorg.org>
> 	    Cc: Thierry Reding <thierry.reding@gmail.com>
> 	    Cc: Alexandre Courbot <gnurou@gmail.com>
> 	    Cc: Pritesh Raithatha <praithatha@nvidia.com>
> 	    Cc: Ashwini Ghuge <aghuge@nvidia.com>
> 	    Cc: linux-gpio@vger.kernel.org
> 	    Cc: linux-tegra@vger.kernel.org
> 	    Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> 	    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> 	commit 3c94d2d08a032d911bbe34f2edb24cb63a63644a
> 	Author: Stefan Agner <stefan@agner.ch>
> 	Date:   Thu Jul 26 17:40:24 2018 +0200
>=20
> 	    pinctrl: tegra: define GPIO compatible node per SoC
>=20
> 	    Tegra 2 uses a different GPIO controller which uses "tegra20-gpio" as
> 	    compatible string.
>=20
> 	    Make the compatible string the GPIO node is using a SoC specific
> 	    property. This prevents the kernel from registering the GPIO range
> 	    twice in case the GPIO range is specified in the device tree.
>=20
> 	    Fixes: 9462510ce31e ("pinctrl: tegra: Only set the gpio range if nee=
ded")
> 	    Signed-off-by: Stefan Agner <stefan@agner.ch>
> 	    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> 	commit 1e0813ee5599932c856bda64a568895ed7a33d3a
> 	Author: Dmitry Osipenko <digetx@gmail.com>
> 	Date:   Thu Aug 2 14:11:43 2018 +0300
>=20
> 	    pinctrl: tegra: Move drivers registration to arch_init level
>=20
> 	    There is a bug in regards to deferred probing within the drivers core
> 	    that causes GPIO-driver to suspend after its users. The bug appears =
if
> 	    GPIO-driver probe is getting deferred, which happens after introduci=
ng
> 	    dependency on PINCTRL-driver for the GPIO-driver by defining "gpio-r=
anges"
> 	    property in device-tree. The bug in the drivers core is old (more th=
an 4
> 	    years now) and is well known, unfortunately there is no easy fix for=
 it.
> 	    The good news is that we can workaround the deferred probe issue by
> 	    changing GPIO / PINCTRL drivers registration order and hence by movi=
ng
> 	    PINCTRL driver registration to the arch_init level and GPIO to the
> 	    subsys_init.
>=20
> 	    Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 	    Acked-by: Stefan Agner <stefan@agner.ch>
> 	    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Note that the last one is something that we probably should fix
> correctly by using device links rather than working around it by playing
> init level tricks.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  soc-to-kernel-pinctrl-driver.py | 27 +++++++++++----------------
>  1 file changed, 11 insertions(+), 16 deletions(-)

There was supposed to be a cover letter for this... Anyway, patches 1
and 2 basically get the kernel driver template up to date with the
latest kernel driver. Patch 3 is Sowjanya's patch from yesterday but
with one suggestion worked in to make the parked_bitmask field take 0
as the special value meaning "unsupported".

I've also sent out two patches that are the result of regenerating the
various SoC drivers from the updated script and tables.

Thierry

>=20
> diff --git a/soc-to-kernel-pinctrl-driver.py b/soc-to-kernel-pinctrl-driv=
er.py
> index 65e4c604f1c9..37f34b15db2b 100755
> --- a/soc-to-kernel-pinctrl-driver.py
> +++ b/soc-to-kernel-pinctrl-driver.py
> @@ -41,22 +41,16 @@ if dbg: print(args)
>  soc =3D tegra_pmx_soc_parser.load_soc(args.soc)
> =20
>  print('''\
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Pinctrl data for the NVIDIA %s pinmux
>   *
> - * Copyright (c) %s, NVIDIA CORPORATION.  All rights reserved.
> - *
> - * This program is free software; you can redistribute it and/or modify =
it
> - * under the terms and conditions of the GNU General Public License,
> - * version 2, as published by the Free Software Foundation.
> + * Author: %s
>   *
> - * This program is distributed in the hope it will be useful, but WITHOUT
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> - * more details.
> + * Copyright (c) %s, NVIDIA CORPORATION.  All rights reserved.
>   */
> =20
> -#include <linux/module.h>
> +#include <linux/init.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pinctrl/pinctrl.h>
> @@ -68,7 +62,7 @@ print('''\
>   * Most pins affected by the pinmux can also be GPIOs. Define these firs=
t.
>   * These must match how the GPIO driver names/numbers its pins.
>   */
> -''' % (soc.titlename, soc.kernel_copyright_years), end=3D'')
> +''' % (soc.titlename, soc.kernel_author, soc.kernel_copyright_years), en=
d=3D'')
> =20
>  # Do not add any more exceptions here; new SoCs should be formatted corr=
ectly
>  if soc.name =3D=3D 'tegra30':
> @@ -615,6 +609,7 @@ print('''\
> =20
>  static const struct tegra_pinctrl_soc_data %(soc)s_pinctrl =3D {
>  	.ngpios =3D NUM_GPIOS,
> +	.gpio_compatible =3D "nvidia,%(soc)s-gpio",
>  	.pins =3D %(soc)s_pins,
>  	.npins =3D ARRAY_SIZE(%(soc)s_pins),
>  	.functions =3D %(soc)s_functions,
> @@ -635,7 +630,6 @@ static const struct of_device_id %(soc)s_pinctrl_of_m=
atch[] =3D {
>  	{ .compatible =3D "nvidia,%(soc)s-pinmux", },
>  	{ },
>  };
> -MODULE_DEVICE_TABLE(of, %(soc)s_pinctrl_of_match);
> =20
>  static struct platform_driver %(soc)s_pinctrl_driver =3D {
>  	.driver =3D {
> @@ -644,9 +638,10 @@ static struct platform_driver %(soc)s_pinctrl_driver=
 =3D {
>  	},
>  	.probe =3D %(soc)s_pinctrl_probe,
>  };
> -module_platform_driver(%(soc)s_pinctrl_driver);
> =20
> -MODULE_AUTHOR("%(author)s");
> -MODULE_DESCRIPTION("NVIDIA %(usoc)s pinctrl driver");
> -MODULE_LICENSE("GPL v2");
> +static int __init %(soc)s_pinctrl_init(void)
> +{
> +	return platform_driver_register(&%(soc)s_pinctrl_driver);
> +}
> +arch_initcall(%(soc)s_pinctrl_init);
>  ''' % socvars, end=3D'')
> --=20
> 2.21.0
>=20

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LvYsACgkQ3SOs138+
s6HHjhAAuqA0I/eqpH3qFG3M9jaZyguW1CbMtrtssUsPuZAsRPW8IaesRtyX0x5G
wBQm1bgWn88VyNSPWJJWpcb6GyXmMj4NCmwo1F0rn4jpIy1G5Bhzl7dQTcPuXaes
KBObP9gl9bGXKDDqc2Kq7i0IKjDUz7CpUUVDqjG1d5y18UVlRSpuV+pxouMWDM8j
S6OcEU2JeW90ZVW33mPnQJg12sdN9bE4118MsjaJiOnErmTg6mdQp/a5ptDtJZWt
1cwA4VXNcEoRQwrRuVadwm0NsODxIWGqsTyzLBNp+DTjtuqDSpe1liA2emjbk1rd
6C0ArghdLlGVfCiBX6y6GV5Lj5zLdt9ZCSmznKHUr6yqwWdGSZkCjpVv2t+bfD/I
GujEAUuI1HOG61EonqKm5o8ahOnUkn3tmTA93bDuGp79xdNXcNBxB/WGNtZO1ME+
m/bTT4ujEXmorfcbcL6Cwtelm6navpbZ9c0dYXCp++Dc0nLmdWDaLmKRH+czReIX
UdW8ehdsXMwlfsRkUP3IpceGoar3g8NYm3u+DEfSpMU+h4xdYBwh7WnAOon7vm0c
BmBtISHJitnt2RWupSKWQT5F/x7ryilQMx2XU2Xa2uE5i2LXwh7/aBF131bCRLfO
eq0mHANirEgyisRcC5hljA6Xwgg71OWx0r4CKaxRFeJGbgTHejw=
=nhQE
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--

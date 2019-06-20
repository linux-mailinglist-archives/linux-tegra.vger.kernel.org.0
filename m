Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1104D10A
	for <lists+linux-tegra@lfdr.de>; Thu, 20 Jun 2019 16:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbfFTO51 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 20 Jun 2019 10:57:27 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52864 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbfFTO51 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 Jun 2019 10:57:27 -0400
Received: by mail-wm1-f65.google.com with SMTP id s3so3399528wms.2
        for <linux-tegra@vger.kernel.org>; Thu, 20 Jun 2019 07:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jVeVd/SOgfJIfQYBg3GapZljoFKEHSza1escPVxTheM=;
        b=lnVcpu9jdw1fkvNGkw5nqzives27bpvn/3g7rn5ckjaMvaS+bazWp6gOzk+qjJMCi2
         xP5kHhwHCbJmdpCgGgr6I2OorfLGFbuTeTfbb8ENR+uiuuqpH4U5v91PJGbJ/UBI/now
         l3FbH0A9CIg9tE2CJlDfoXrxjtVxcEhSXwZRwa63M2sCHdsQ28vwRaIpuK9KXUAQrxN5
         e88LbZu/tsZnqp96IfL3QblctoNVxPWYOJ8d44Lwx25X4BAhMdX9koIlqILh5IfxqE0l
         2g20jVeiX1o3sfq7qkE4IJ5QJ4RGTaKWSB71uJTu/gIrHh8j1aFkudyY0DN2vSohVdIE
         IMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jVeVd/SOgfJIfQYBg3GapZljoFKEHSza1escPVxTheM=;
        b=Hc36k1mG3OeJoQRlbJ4Nl9PrUpvbfCW7Y55/CfMs/nUWNakahYAZXrAQHUA4ylfQC1
         6QCo1MB6PsDB/aBUhrG8uJUuf9Ull3aEHSHXO+D+igC7GSMFU7k81RPXAc7AdXRH4k2H
         dnrUBK0FPsOmI5EaQL+kq2JdI7Y0EtWuKADN+gmCju7wsgamu0C85gczVcqlv63OOo9M
         685ehhEnswFHa1Asi4VK1nMXwOlCrVc5SnHIqat1uxPqocqFdns8hnGsw6w7W+MuoqRC
         F5+ZSMOmrazdaIuqKpD/CAWFNWUoGWxPaJAoP7CHY3f1L/y6UiiK604ydGXs3jGFMyj7
         yR5Q==
X-Gm-Message-State: APjAAAV6Vm77w5jSglMAjCxt8Hn1YJSNj0iWNyegsTzPbEpFToSqokEN
        f5mXSVH5M4iR5rfR4bfQO9k=
X-Google-Smtp-Source: APXvYqyYiQPkAZJf+o+9K/gQbBobSmxW98WPFXYmR02C5XP8G0IXMBpJ17YMUS+ZeWNvdlCtlZbBCQ==
X-Received: by 2002:a1c:2c6:: with SMTP id 189mr53068wmc.108.1561042644895;
        Thu, 20 Jun 2019 07:57:24 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id 72sm18649464wrk.22.2019.06.20.07.57.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 07:57:24 -0700 (PDT)
Date:   Thu, 20 Jun 2019 16:57:23 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: drm connectors, tegra,  and the web they weave (was Re: [PATCH
 58/59] drm/todo: Add new debugfs todo)
Message-ID: <20190620145723.GC15501@ulmo>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-59-daniel.vetter@ffwll.ch>
 <20190618151938.GA2567@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vOmOzSkFvhd7u8Ms"
Content-Disposition: inline
In-Reply-To: <20190618151938.GA2567@kroah.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--vOmOzSkFvhd7u8Ms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 05:19:38PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Jun 14, 2019 at 10:36:14PM +0200, Daniel Vetter wrote:
> > Greg is busy already, but maybe he won't do everything ...
> >=20
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  Documentation/gpu/todo.rst | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 9717540ee28f..026e55c517e1 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -375,6 +375,9 @@ There's a bunch of issues with it:
> >    this (together with the drm_minor->drm_device move) would allow us t=
o remove
> >    debugfs_init.
> > =20
> > +- Drop the return code and error checking from all debugfs functions. =
Greg KH is
> > +  working on this already.
>=20
>=20
> Part of this work was to try to delete drm_debugfs_remove_files().
>=20
> There are only 4 files that currently still call this function:
> 	drivers/gpu/drm/tegra/dc.c
> 	drivers/gpu/drm/tegra/dsi.c
> 	drivers/gpu/drm/tegra/hdmi.c
> 	drivers/gpu/drm/tegra/sor.c
>=20
> For dc.c, the driver wants to add debugfs files to the struct drm_crtc
> debugfs directory.  Which is fine, but it has to do some special memory
> allocation to get the debugfs callback to point not to the struct
> drm_minor pointer, but rather the drm_crtc structure.

Actually the reason why the memory allocation is done is because there
can be multiple instances of the display controller. In fact, there's
always at least two (and up to four in later Tegra generations). The DRM
debugfs infrastructure, however, doesn't automatically duplicate the
data for each drm_debugfs_create_files() call and at the same time it
does not allow you to specify driver-private data other than by
embedding it in the drm_info_list structure. So rather than manually
create the drm_info_list for each display controller instance, the code
creates a template that is then duplicated and for which the driver-
private is then set. That way multiple invocations end up with different
data.

This is because of the extra indirection that the DRM debugfs
infrastructure introduces. It's in fact much easier to do this with just
plain debugfs function calls. The only downside is the boilerplate
required to make that happen.

Thierry

--vOmOzSkFvhd7u8Ms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LntIACgkQ3SOs138+
s6Ec6g//cyahw97qX6MVrsqeWZdi0lCt9yzfOA36w8oeensdVxwAld5K7dDQOGy5
g9qbcdy+u5QWNnV9UWOl51RRJN34hiH01OV38QRq0T+cMzFZIvFcuU7RBCSWk/LN
edpFR83XlgnQ3NzNfXHPSNTSkHzUmuJ/9j129Vguawx4HBpfB9sJ4jObJGBS+HT9
+noFFGkqxyvjThPS/g7X3GuotSASX1I11fhK6ApqFS7yp5arzPAUw5yPMz/1Ti9a
DQg/VYuX52SOlTVY6JIo9ZCs6ifPQbUkQN1YMEmavePm36KBpBpQC8sb+vTBU+d1
xlOo1eTnL448MCtc6/TzBCYbYT+Bc/At1/stUdH5MFx+3GfqIPx/jBY7Qg1zCY6K
fmayiJZJukL0IDlA/kCJa8eWA+X0zYIyND9LI07yZoP/i6SiOvi92GraGv7aK4aN
1pba/s7nA3XlVzDWzM0Mmtqx/ziNTrKcWXdccS/V7RKd4KHS7JNR7bBNvzsK2BxJ
B+OXJ7GjVk5/4hX+JOn4hcOhkPmGt4ftWACPaaiVG0sFSt8gGKPVkiH7JKfWofkp
GVI/WGL8hzmpqA8Orfs8am5/x14K2Y1mUseW2XC5DS/T7PzeQMBDwyB1hmB8KYwq
CxRXBTsK+YlJxN3Z496TaPtCzEsu2XzmSzDYDkOC2cXrK0Dk5yU=
=KmPe
-----END PGP SIGNATURE-----

--vOmOzSkFvhd7u8Ms--

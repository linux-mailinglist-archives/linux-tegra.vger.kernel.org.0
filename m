Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9F1C1C21
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Sep 2019 09:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbfI3HgT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 Sep 2019 03:36:19 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55237 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729215AbfI3HgT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Sep 2019 03:36:19 -0400
Received: by mail-wm1-f68.google.com with SMTP id p7so12129470wmp.4
        for <linux-tegra@vger.kernel.org>; Mon, 30 Sep 2019 00:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zSXl0hb/0/FWlDKdvIWQoYRrFkhZDfZ63bko8/Gnd/U=;
        b=p6we775OuK3uojgcpZLUvzPfSnUXN3kH/5IIG1nZ3kzKU1TaiqygZ8M5kfBKca3drR
         C4yvDxqixTg+MriHAH8xN5Kmhj4VG46FGE6+Wiq7XVvhVITDHgI1YKPngrHYPmLinOh+
         MTxM3jgRqD/ORUpNgS6x8MmiHLPR2JB7CAOWSfwPlI+cpJc7ecVytk95zsW8UeXKaxLy
         ikmCOrNuiW5y1p6zs7CLq+FNflLGh43wfgpTlv2Ua/hYVbPXlQp3aEz5oHQufq8se87z
         aqpIBkPF6v5ZxbzkhIJZIOs/HBzxKp+n0N7kBmowwtl9g8qF1gNcCmPbdDI8AtLGjkVo
         +l4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zSXl0hb/0/FWlDKdvIWQoYRrFkhZDfZ63bko8/Gnd/U=;
        b=W8Cmet3hu8DOwCdFLnshEG9ECw3P+PyVeMly0AlhORNeKRTP0lnFYo2ePvVuUsPF9x
         +pC05YRNMq7EkSuqbSiKYYgPaZO+Y/BgnqB/O2Is4FSBeWUP6GgQBwpEnB4Rezy8GjH+
         VGjJGD9h7qUDPR0NpBJnV7ePhZU/ZZXanwXoKFbZDG92VFNglDn9rXe6JgYXBQTWe/6C
         pF0qwLaiHa/xS/UTtne238JP8nR67sKI4PG5BZ3CCDiDf3sc5YXyiuUMo5er8+pzboVb
         ceAo/M3IBYxniRfxCkStXxUvmNXwhxVMBqXcS8aqm81ElMl4BTSF9unp84/uhlleEuc5
         hTsA==
X-Gm-Message-State: APjAAAWmwFRg85N6Zg/uR53ux+2MvbfTmBVU1tMpsanxKFUxUFO6Z96+
        UwUDfqkswIE4Q1EID48BVnQ=
X-Google-Smtp-Source: APXvYqyONkxEzBuGkZCZMlqaRP2IxX0cXrcNbRQcYWa/VlWrQwYViA7Sm0oMKv49+YRp+oEUzmY+HQ==
X-Received: by 2002:a7b:cf33:: with SMTP id m19mr16797761wmg.143.1569828976418;
        Mon, 30 Sep 2019 00:36:16 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id a192sm14214162wma.1.2019.09.30.00.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 00:36:14 -0700 (PDT)
Date:   Mon, 30 Sep 2019 09:36:13 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Peter Geis <pgwipeout@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
Message-ID: <20190930073613.GB1518582@ulmo>
References: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
 <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Content-Disposition: inline
In-Reply-To: <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 29, 2019 at 03:36:35AM +0000, Peter Chen wrote:
> =20
> >=20
> > I've encountered an odd situation where the CI Dual Role driver hard lo=
cks the
> > kernel on the Ouya (Tegra 3).
> > I was attempting to set up manual mode switching in the kernel, as the =
Ouya lacks
> > hardware support for the ID pin and no voltage output on that port.
> > I found that the kernel was hard locking whenever I had the dr_mode =3D=
 "otg" set in
> > the devicetree.
>=20
> It seems Tegra doesn't support host mode using chipidea driver. The ci_hd=
rc_tegra.c
> only supports device mode. Thierry, could you confirm that?

Yes, correct. I recall doing some work at the time to move host mode
support from ehci-tegra to the ChipIdea driver, but never managed to
make it work, unfortunately.

Thierry

> > No further output was seen on the console, and sysreq does not respond.
> > It occurs both in module and builtin mode.
> >=20
> > I have however found a workaround.
> > By setting the dual role usb device to:
> > compatible =3D "nvidia,tegra30-ehci", "nvidia,tegra30-udc"; and setting=
 the assigned
> > phy to:
> > dr_mode =3D "peripheral";
> > I can achieve rudimentary live switching of roles.
> > The device defaults to host mode, as the ehci driver enumerates first.
> > By unbinding the tegra-ehci driver and binding the tegra-udc driver, I =
can switch to
> > gadget mode.
> > The reverse also works.
> > The PHY driver does not appear to care if it is always in peripheral mo=
de.
> >=20
> > Thank you for your time,
> > Peter Geis

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2RsGsACgkQ3SOs138+
s6Hjeg//d+VOwpr3rDscvxm85Fz85MP3IHO1914/TcWbTeVzUXhpxNIPXIpNL2vR
GMEJRFNpqc3z3hyDH5khRLAlrmegKIDTqOcDNckBzTfYJqrfun3kCVcOUlLW5rM3
p+RglpjHQkrswUPM/D4gNkvqh3UPaFj4HySqqCL6HNJRi2Mt9FRnzc0ODLixEp4+
ZJi97ZwU7Z3PHe4F95B7MBb+otq8IwfGApELNiuBXSpDnispbVfVabVey5K3xGZq
oAIz88IHrlhBHCBUyizlWa0i35sPQL2kS+cOHvqrxzKYkmuJCe/ysmC53I6upEYX
UZlIR3h5CrmmwkC9+/8jSeJALLm+HbVnjs7l3pdrwVPcGNrtq+OI6ImvMGAebe1k
5H42yCQgvvxYZp3/PnaSAa1PZvLCIbAn4AP+MHaDN8cYnqvAfvMZD74ITf2kcqg0
c5V9UWGd4I6zAUWmR6uFmDEa3fAO8FYVVK0MQez86Tolwy5VT40EDOmFa3Q/ZPAP
qnuZ3KqYLNsYYogk3nK2fEM/nfqu8zOzeYSV/Wcmdteixa2M1iMt2TBcYcOHcW4q
Y31cDdCO79qpSsXhBMeBjnUNvr7XvteDBdOfLhmf2mr5wlfnBxgE3VlcomZMySbS
7DU5fX70eZ7SmL8Nj18TE8sgK18+WI+w3dohGhwjkQKvdeLzbE8=
=EXGa
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--

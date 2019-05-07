Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F66C16B87
	for <lists+linux-tegra@lfdr.de>; Tue,  7 May 2019 21:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfEGTjr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 7 May 2019 15:39:47 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:10482 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbfEGTjr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 May 2019 15:39:47 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd1dedf0000>; Tue, 07 May 2019 12:39:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 May 2019 12:39:46 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 May 2019 12:39:46 -0700
Received: from localhost (10.124.1.5) by HQMAIL101.nvidia.com (172.20.187.10)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 May 2019 19:39:46
 +0000
Date:   Tue, 7 May 2019 21:39:43 +0200
From:   Thierry Reding <treding@nvidia.com>
To:     Bernd Kubu <bernd@kubu.at>
CC:     Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        <linux-tegra@vger.kernel.org>
Subject: Re: Patch: PCI: tegra: Use generic accessors where possible
Message-ID: <20190507193942.GA1090@ulmo>
References: <e6ea626b-21c2-9b7a-9776-e333609c350b@kubu.at>
MIME-Version: 1.0
In-Reply-To: <e6ea626b-21c2-9b7a-9776-e333609c350b@kubu.at>
X-NVConfidentiality: public
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557257951; bh=ADS3Ws7ARwAyjiQbWStSvcFRftmjnTtAh4dLhqnXqh0=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:In-Reply-To:X-NVConfidentiality:User-Agent:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:
         Content-Disposition;
        b=qlG8ZbFQcai0BinVR1u4leXeMudt3wMGiH7bR/FLZ4/QswodvJcPZ0co5gzaHttgy
         yYBeFelgwKRihEf5kx7TxQfHRTkYPQ/Fg6mXnEmQx/CB1VVSsIDpFL/M2AGpgJVPJM
         0iHx/Hbnu04tab9Z8CHHlVmbeztgpKN+N4CUZmEsLBBic9HkgaR5PGK1xGhFLxSN3g
         jC5G4Ck63ICWqc4tav87zvqXMwvw7JiDsdRefga4Bv1vQU2aS9FdUH4OVaWQYvxpB4
         k4g/SwMK+dHHxEt/vx+ZJLtaQkc/o5jXFCf8kAr51zYLICXluFXyp8NbBh1Ju6d0vG
         FwNmg6j+ng4+g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2019 at 04:03:37PM +0200, Bernd Kubu wrote:
> Hello Thierry,
>=20
> I have troubles with this patch: https://patchwork.kernel.org/patch/99673=
99/
>=20
> My Intel Ethernet Network Controller (igb [8086:157b]) on the "Toradex Ap=
alis
> TK1 2GB V1.1A" does not work with the current Ubuntu Bionic Kernel (with
> patches from http://git.toradex.com/cgit/meta-toradex-tegra.git/tree/
> recipes-kernel/linux/linux-toradex-mainline-4.14?h=3Drocko).

Looks like the baseline for that is 4.14. The patch that you referenced
above was applied to 4.15 and is not part of that Toradex patchset
either, so...

> I get the following messages in dmesg:
> [    4.913881] pci 0000:01:00.0: [8086:157b] type 10 class 0x020000
> [    4.913913] pci 0000:01:00.0: unknown header type 10, ignoring device
>=20
> After removing the changes from the patch https://patchwork.kernel.org/pa=
tch/
> 9967399/
> ---------
>=20
> > +}
> > +
> >  static struct pci_ops tegra_pcie_ops =3D {
> >         .add_bus =3D tegra_pcie_add_bus,
> >         .remove_bus =3D tegra_pcie_remove_bus,
> >         .map_bus =3D tegra_pcie_map_bus,
> > -       .read =3D pci_generic_config_read32,
> > -       .write =3D pci_generic_config_write32,
> > +       .read =3D tegra_pcie_config_read,
> > +       .write =3D tegra_pcie_config_write,
> >  };
> >
>=20
> ------
>=20
> the Network Controller work.
> So it seems this model has issues with other than 32-bit access.

=2E.. I'm not sure how that would be related here. Unless I'm misunder-
standing what you're saying. You are saying that if you use
pci_generic_config_{read,write}32() for all accesses, that the network
controller works for you? And it doesn't work if you use the
tegra_pcie_config_{read,write}() functions for accesses?

I'd be somewhat surprised if this wasn't working. I'm not aware of any
similar reports against the upstream kernel. Have you tried building a
recent linux-next, or -rc or something like the latest release (5.1)?

Adding Marcel here, perhaps he's encountered a similar issue. Also
adding the linux-tegra mailing list for broader visibility.

Thierry

>=20
> Best regards,
>=20
>     Bernd
>=20
> --
> Bernd Kubu - IT Services
>=20
> Heufeldstrasse 24
> A-2640 Gloggnitz
>=20
> Tel.: +43-699-13002768
> E-Mail: mailto:bernd@kubu.at
>=20

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzR3voACgkQ3SOs138+
s6HBug/9EOxyD79rSqS9Khrhli/YT3Re4eDFgzbJAkJKfRcOSMVyeu9y1JvqvELv
3KCzbYAqJoaC1ZnIbztK2gcv8HlC667L7yN//n6gHlc8px4muJQOrorlyohu33m2
RxMT0em9d0T1tsC4T92JmLBcE3UPp9FtZqe8fZPSwEbsdCUsXYzeLIILdjqARhVq
1DRlTesrSQ1n7S+BxtXcInvA/9sCPzW5txpOPi9afSx8hSsE49OoXuOwkgeWHZxS
2QuLe6f9RaExW09D+LyScPCMjBf9rL84vCYXgxOrGSHou6rPN16Fo4knV5HqqC4t
O/sm3v9ScO80rguDWCgpL/pqUz5+S3TL3kgUTiDKjiEmIU6/nXJDX4pOTkZilguM
B5BRmEgr1vad0cOeLQHUHIRH/xjYNiLfkLPEQTB8aKlpXFYLWcXINR6JXWMj6sis
LQra8ngotijSYGHME1j0Bj7qDUBq1CtoT1tbgHkAnt65sjyhCiM6EVnpUCY48HFZ
S9bkrToTx6UcJyDyM/FgWGZt98iUDWiuBQzLBhSFO6qoQjo6B7lTLu0a6YxSbA2z
mxR3Noc7PU7iSM8Mp4cD04cLTJ81xmlg44IZqJiuLS0R/nwyDw9s7fCVCgW7d44m
GLXQpvk1tX3gyOOc3GnGlZz3yoDLiP9So3YB1YL5nzKWUbzPZx8=
=Vhj0
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--

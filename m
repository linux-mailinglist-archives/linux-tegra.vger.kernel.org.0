Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EACFD1FCF61
	for <lists+linux-tegra@lfdr.de>; Wed, 17 Jun 2020 16:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgFQOVL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 17 Jun 2020 10:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgFQOVK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Jun 2020 10:21:10 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CBB1C06174E
        for <linux-tegra@vger.kernel.org>; Wed, 17 Jun 2020 07:21:10 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e1so2549558wrt.5
        for <linux-tegra@vger.kernel.org>; Wed, 17 Jun 2020 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wnkF0qAd0m6lU0nAw6xOw+RvpdtRu+AUHGX38SZX7AU=;
        b=EcAqQG8Z9FtoT4kcyTuD+2yqmQD7Je8v3O2rOBZmh4yDyJYStlLPTLfJs585qxCniO
         A9dSN5fRFKV41jzll9NMn9KYoqURUTem0OjeIJ2s5AildJ9euNly49VGd1MbGZHcOiVt
         mwrxo25n3RPAecyVac/5IAhzFmqrXEdg67nKT2iLDu9Y4CCriLet9gLb7I0s7hyefP3+
         87Ip69rznoGZXj9CdzZzIyZ1NwV+7F2vqx0FpTXW+WX+l1+Dz/vYP5hMKq3Owz9M1NPm
         CcGKoXttH33WiW77WEw6mkkB0clMNQlJRquKlVdl13R/UiowfPFWTpZkXPG6vEy5WQ47
         H5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wnkF0qAd0m6lU0nAw6xOw+RvpdtRu+AUHGX38SZX7AU=;
        b=EuXB/D4ACXTXeT4wSQ1Mx0R0WVw4O7omdEN9g2wh0V5hK+V4qP7Ni90+fll0YaVWua
         1yDaE5cCW4WTEIUcYx5BKc1j2g9/CjkKjdvyx42mTWIb4aITEbZcUZv9/ORPJYlFx5j1
         6+e139T3GRD/blSPGMFK27xUuaBjJL/OnbWSDbx2yxUzNAAVmAwuqcDqe9M5MEBHB//G
         kWwymh6/onv3dyMzy8wKiQlu/nxr9OJmVPNcgvPhRFXN/qGuVCHRaPFYmrm8rakLUnae
         BPxsWF5Huqws+NVFsjMEX2Vo6OaoulWOlDQfO+aPLZDL0eJ0XTX4tZ8JUYkUkJbE0K5V
         goeg==
X-Gm-Message-State: AOAM5303/U3Ev1DcVo3DVs17OuH+o/pOBjtr6j0BSyQ3Y9OAtcUZ2GOH
        tcz55/r9qKxJiEfWNgBnCVxFWUFL
X-Google-Smtp-Source: ABdhPJw7ZsUd1dV8adTs5lqVaiySNQwkutQ7QFw6eBubQEc4eriuo/jkNZZXjvWUOwhTI1iSyhYDqA==
X-Received: by 2002:a5d:4d89:: with SMTP id b9mr9367838wru.210.1592403669213;
        Wed, 17 Jun 2020 07:21:09 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id k64sm584323wmf.34.2020.06.17.07.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 07:21:06 -0700 (PDT)
Date:   Wed, 17 Jun 2020 16:21:05 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/73] ARM: tegra: Remove simple clocks bus
Message-ID: <20200617142105.GD3536291@ulmo>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-3-thierry.reding@gmail.com>
 <74f8be81-216b-b69b-4517-c90d5f7d578a@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NklN7DEeGtkPCoo3"
Content-Disposition: inline
In-Reply-To: <74f8be81-216b-b69b-4517-c90d5f7d578a@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--NklN7DEeGtkPCoo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 08:06:56PM +0100, Jon Hunter wrote:
>=20
>=20
> On 16/06/2020 14:51, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The standard way to do this is to list out the clocks at the top-level.
> > Adopt the standard way to fix validation.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm/boot/dts/tegra114-dalmore.dts    | 15 ++++-----------
> >  arch/arm/boot/dts/tegra114-roth.dts       | 15 ++++-----------
> >  arch/arm/boot/dts/tegra114-tn7.dts        | 15 ++++-----------
> >  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 15 ++++-----------
> >  arch/arm/boot/dts/tegra124-nyan.dtsi      | 15 ++++-----------
> >  arch/arm/boot/dts/tegra124-venice2.dts    | 15 ++++-----------
> >  arch/arm/boot/dts/tegra20-harmony.dts     | 15 ++++-----------
> >  arch/arm/boot/dts/tegra20-paz00.dts       | 15 ++++-----------
> >  arch/arm/boot/dts/tegra20-seaboard.dts    | 15 ++++-----------
> >  arch/arm/boot/dts/tegra20-trimslice.dts   | 19 ++++++-------------
> >  arch/arm/boot/dts/tegra20-ventana.dts     | 15 ++++-----------
> >  arch/arm/boot/dts/tegra30-beaver.dts      | 15 ++++-----------
> >  arch/arm/boot/dts/tegra30-cardhu.dtsi     | 15 ++++-----------
> >  13 files changed, 54 insertions(+), 145 deletions(-)
>=20
> ...
>=20
> > diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dt=
s/tegra20-trimslice.dts
> > index 8debd3d3c20d..5b26482a55b7 100644
> > --- a/arch/arm/boot/dts/tegra20-trimslice.dts
> > +++ b/arch/arm/boot/dts/tegra20-trimslice.dts
> > @@ -366,30 +366,23 @@ usb-phy@c5008000 {
> >  		status =3D "okay";
> >  	};
> > =20
> > -	sdhci@c8000000 {
> > +	mmc@c8000000 {
> >  		status =3D "okay";
> >  		broken-cd;
> >  		bus-width =3D <4>;
> >  	};
> > =20
> > -	sdhci@c8000600 {
> > +	mmc@c8000600 {
> >  		status =3D "okay";
> >  		cd-gpios =3D <&gpio TEGRA_GPIO(P, 1) GPIO_ACTIVE_LOW>;
> >  		wp-gpios =3D <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
> >  		bus-width =3D <4>;
> >  	};
>=20
> I think that the above belongs in patch 13/73.

Good catch!

Thierry

--NklN7DEeGtkPCoo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7qJtEACgkQ3SOs138+
s6HcrxAAicsQoBWmck3fLH4YsCVXI4UjmKyIslIPaDhNvYpcReFd1VVFxJAD5JSJ
7M028pMWqTYgpFRbgLUKGiDSeWjyu3lD55fIGCOqkEPS1X6hMxMjt0uF2St4RJX6
blvW0Y7AgM8ScVyLGvTYiPU+ILofcRP7YKFAATLMfqeXuEPgx+eT0aPcayUnGxi0
1DEOsjWRmCx9NELuSDLPpIImApVPR8TMNeV0BwhuITZbRbqtBzP0UBi+P4P+M84I
sqJp94fa4wzFRjITjyPYUFxaNL/VeBz+aVVetvjN4bICANNm24vxGBsMZ/Y3+iXI
u0AMcJCGH5XXKuM1uV3NE5ear/oFzpUCoOz6DyzeuyK3NZpiDfRMZhSOtEL3EGFP
rqlWcldeqaN4pik0nUbOVIcXTUKqhW9jL1ulPJl4V9jQhQiKMcM+bRXz4BvwO4ur
bt3WxFqhJyru3eBxl6Cf4RkeKGVB417k4bXStYvBKbAJWHI1RIptE8ovK+tJ1Lxr
iFK4UqdXIUJRQdv4AHzRTIhcwcaJwjmfBshfoNvNL2W3YYP+9bDXOuEnpcADkWIc
kxZAF/SxU4DG6Lae0/uDEYAg/kSObYSQdydNoq/vrpV9DmhKjRN+0DmYNLkZfHVS
o9Mq9b4RWP+k6VznumN+an5Qd5fWN9GW+JLdl+2tO0Tw57zzxYk=
=ME3C
-----END PGP SIGNATURE-----

--NklN7DEeGtkPCoo3--

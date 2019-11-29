Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2FCD10D458
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Nov 2019 11:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfK2KoR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 29 Nov 2019 05:44:17 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33584 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfK2KoR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Nov 2019 05:44:17 -0500
Received: by mail-wr1-f65.google.com with SMTP id b6so4926423wrq.0
        for <linux-tegra@vger.kernel.org>; Fri, 29 Nov 2019 02:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eurNCSwC3LD6NpAG4KMDPTRG38ZQRaxJF+kqME8pF6A=;
        b=V/7eBF73MxPSnLcon5XudasOsXBysgQ60MHS4BUPB1bIH8kQ0g2S4FfKZzxJ1ZUFkr
         FbHvr69Dn1scgF7Jog01xZTi6BpgmvsrKpHVP/UOhSRQibHwHXvS8JpW0/Btnzo2hVEN
         w6q7HDpqJ3vvneE8U3Hg4Yh96cLOyDQhd6uH8fu2UXJgQ89K/0cz0zbMNabNf0V7gTkG
         xWKogpboCqmLv8Z5h6OPx0ggLSWoBU2Dzr0JbLijIU8IOMx1JSWhKyhRPFW0lb3yzc44
         v8/1I1qnCICd6ecL++7HQEs3HSyd8dzJkj1KtBlFXcALg9Nd1nN7DQ1pYxswyJp8fy+w
         0a2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eurNCSwC3LD6NpAG4KMDPTRG38ZQRaxJF+kqME8pF6A=;
        b=oqdv2LDPSRtfsyWN9PxnpqTgrgq9BHGJ9/ecNrbEEUTpAe3AkJ0FhlaevTGEsyBWUd
         e2jHd84n3UnNrZLOXvGRdFq1wI+KPqPgkeaLbJ0VWxvke5+UQu2Jt5Fy+RCSdUxWp0/x
         1XUX+eLERaQs/K9xvo4TWemMoGqk5lhZWf1A05F2A43WCSiCLW16c5t677eOMjOi3nxO
         mljnc/tZEc7EnEv4sn8p05/AtGDewYjnB7TsmzTJclLR5hJCSYQfk7ybcMGXnZ2k+Mpk
         ib052fIaAs3TJWW9jcV+tKmTlKLfxxLfKFN/LuXzl6B7c5D1Azid8l9bodOlZ8YyNHHj
         ApwQ==
X-Gm-Message-State: APjAAAVT8lO6eqcwWs047oKavl/u/FtBBCRxK5Pf4GPQXkTWxaaVgfq/
        wtdGYLppf1XyBMcgi6mQmyGN8khdyL0=
X-Google-Smtp-Source: APXvYqxZYhJiyU4Uc17lCY3C6eT+scqo9XI7AK8OhO1y9svl4uJ3RfRCdPUTbTX2/vyZaD4br51UkQ==
X-Received: by 2002:a5d:4085:: with SMTP id o5mr17211435wrp.321.1575024254336;
        Fri, 29 Nov 2019 02:44:14 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id h97sm29406969wrh.56.2019.11.29.02.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 02:44:13 -0800 (PST)
Date:   Fri, 29 Nov 2019 11:44:12 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 8/9] drm/tegra: dpaux: Add missing runtime PM references
Message-ID: <20191129104412.GD2771912@ulmo>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-9-thierry.reding@gmail.com>
 <20191129092319.GD624164@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5CUMAwwhRxlRszMD"
Content-Disposition: inline
In-Reply-To: <20191129092319.GD624164@phenom.ffwll.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--5CUMAwwhRxlRszMD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2019 at 10:23:19AM +0100, Daniel Vetter wrote:
> On Thu, Nov 28, 2019 at 04:37:40PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Ensure that a runtime PM reference is acquired each time the DPAUX
> > registers are accessed. Otherwise the code may end up running without
> > the controller being powered, out-of-reset or clocked in some corner
> > cases, resulting in a crash.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> On patches 4,5,7 in this series Acked-by: Daniel Vetter <daniel.vetter@ff=
wll.ch>
>=20
> On this one here I'm very confused.
>=20
> - Why do you drop the runtime pm between enable and disable? Is that just
>   how the hw works, i.e. the pad config stays, just the registers go away?

Now you've made me doubt this. I don't think the pad configuration stays
across runtime suspend/resume, so you're right, this shouldn't work.
I'll need to go retest this one specifically.

I had added these runtime PM references to ensure the device was
properly configured at resume from suspend, but there ended up being an
additional issue with the I2C driver that relies on this, so perhaps
this may not be necessary in the end.

> - I'm not seeing any locking between the different users (dp aux and
>   pinctrl). We might want to change drm_dp_aux->hw_mutex to a pointer to
>   make this easier (but I'm not super fond of that pattern from i2c).

There should be no need to lock here. DP AUX transfers will only be used
between drm_dp_aux_enable() and drm_dp_aux_disable().

> - Your drm_dp_aux_enable/disable needs to be moved into the ->transfer
>   callback, otherwise the various userspace interface (dp aux, but also
>   i2c on top of that) won't work. Some pre/post_transfer functions like
>   i2c has might be useful for stuff like this.

I suppose it would be possible for someone to attempt to use those
userspace interfaces outside of drm_dp_aux_enable()/drm_dp_aux_disable()
and then the locking would be required.

I'll look into that.

Thierry

>=20
> Cheers, Daniel
>=20
> > ---
> >  drivers/gpu/drm/tegra/dpaux.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpau=
x.c
> > index 622cdf1ad246..4b2b86aed1a5 100644
> > --- a/drivers/gpu/drm/tegra/dpaux.c
> > +++ b/drivers/gpu/drm/tegra/dpaux.c
> > @@ -434,8 +434,13 @@ static int tegra_dpaux_set_mux(struct pinctrl_dev =
*pinctrl,
> >  			       unsigned int function, unsigned int group)
> >  {
> >  	struct tegra_dpaux *dpaux =3D pinctrl_dev_get_drvdata(pinctrl);
> > +	int err;
> > +
> > +	pm_runtime_get_sync(dpaux->dev);
> > +	err =3D tegra_dpaux_pad_config(dpaux, function);
> > +	pm_runtime_put(dpaux->dev);
> > =20
> > -	return tegra_dpaux_pad_config(dpaux, function);
> > +	return err;
> >  }
> > =20
> >  static const struct pinmux_ops tegra_dpaux_pinmux_ops =3D {
> > @@ -809,15 +814,22 @@ enum drm_connector_status drm_dp_aux_detect(struc=
t drm_dp_aux *aux)
> >  int drm_dp_aux_enable(struct drm_dp_aux *aux)
> >  {
> >  	struct tegra_dpaux *dpaux =3D to_dpaux(aux);
> > +	int err;
> > +
> > +	pm_runtime_get_sync(dpaux->dev);
> > +	err =3D tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_AUX);
> > +	pm_runtime_put(dpaux->dev);
> > =20
> > -	return tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_AUX);
> > +	return err;
> >  }
> > =20
> >  int drm_dp_aux_disable(struct drm_dp_aux *aux)
> >  {
> >  	struct tegra_dpaux *dpaux =3D to_dpaux(aux);
> > =20
> > +	pm_runtime_get_sync(dpaux->dev);
> >  	tegra_dpaux_pad_power_down(dpaux);
> > +	pm_runtime_put(dpaux->dev);
> > =20
> >  	return 0;
> >  }
> > --=20
> > 2.23.0
> >=20
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--5CUMAwwhRxlRszMD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3g9nkACgkQ3SOs138+
s6Hj3A/+PqCFRb0VVrY3Li6fcisTc3P2IclxOVXVwXKk6+cuXJfVSs0i8Zd7JAzO
jWIP8S82xEh5H338AzCy2r4hncl5YoDhHEb8Sppj/iK8aFI96CELE0+kEsamb+52
EEn32SEgheYnSh2UcZTDqjPDW91yda6WHDRb6c33V86KEne9lf/KI0DzizsG4UZ9
nO9nUx2a1AI38UH3czWKph+PrM594PJ0UQdZT0nP0rTDaJPmznDP0obzjiHXXS/D
1X6qALYHNPOqZMJvPOSERY7qc9arHLbrtjMDy+qcJTKgg9Azuqzdv/ribuEHzuW0
yH63gpK8gLsIZPss6t4EcVDn8o/fxDnUk1glQgOduBZWCMT6ukQTlRePuDICVsrA
OUDLfWLeFD9U1OA5EMdBqaWG/dOFiK0yHUr8hEn7K/UIv+ofT4eg6cyX0HWlm1KH
Kb/wsckpFDi/+1b9RarFUu643BvmVRvYbNWCARcfUxf4A2cLmszJ692vPCNJlWUs
XteAG+lY8qhH+j8c/OGMuQYwWE/NpxSli/YF0cvXjSwXe4iDTqNfI0OGsFsiSHQ1
zZjqxyd63LDdYJM/IfhdLu0Y6PQSD2NK4shyRog4wcHKlfslZ5WJGAoKa5FFbh9k
tu+HPnoVLVORfCoX3GWVfkMy89BxWPWwe82QGpZSFgx7lc1V4+4=
=Sf/5
-----END PGP SIGNATURE-----

--5CUMAwwhRxlRszMD--

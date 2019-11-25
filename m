Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2E5108C06
	for <lists+linux-tegra@lfdr.de>; Mon, 25 Nov 2019 11:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbfKYKpi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 25 Nov 2019 05:45:38 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54131 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727593AbfKYKpi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Nov 2019 05:45:38 -0500
Received: by mail-wm1-f65.google.com with SMTP id u18so14907922wmc.3
        for <linux-tegra@vger.kernel.org>; Mon, 25 Nov 2019 02:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3EhgiVzcB+B7/tcWX45FO10T+t4+zhKvLeC5lwd3Vs8=;
        b=frlCJhkjZGV4RfNjfGgZEWF2CP7xtod1lHFKdh0svjbaeHBHd7hxxmTfjrSelT2l0q
         /sJkhuP8+f7wRSgMDXjLEzM+jvg4P+pn2YknwHC7CvBArS9YqcmsWUs2Q+q5Mw832P9S
         7afqEWEjoRvIR5VtMA97/96Fr6Wqq9u7SLGCPc3unZINFt6h/87YgLfoZJMiWkjmS4Wx
         2xXH4ZreOKrW/kt7wN1Ye958lvpDcSyzfmyYuM6pGXi15wGM5+cEMp7sZhrckYF114f5
         tJcKYCwKMnZ7uSU49TCRy2Tsblz4xzZcLqLbZrKbsK9lNwuBL/rYkev4ClQpaz6jlS/M
         VgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3EhgiVzcB+B7/tcWX45FO10T+t4+zhKvLeC5lwd3Vs8=;
        b=rJiZe/vHkpRsNx8zTtIrC/ipjDabeSqi8WGFvlYdVmmMVrpCiA8wZZ3PGJlfyikNVi
         i6aaYezQ4tTrNCU0mibcqwRYe2kAC89ThhPzrAjpbB58IKbA14p921+y8IEcB38XRh0D
         1OULRZ2pjgUWvsXUtB9IjF1XlYTMDFwHw5fw45CVKa07mNYcqvwAe1Y88Xc2WVsCcRFb
         hbvJd742m1aH4daWtVECEHC8Pp47r5vaK5n4cE73YZByuc16PFg7NEtl1zT1093L/SX8
         5fAF9FPM4V5P0QLTj0IvPEQnC9qkjw3OAoYgjcfC71M06rC/qjpl0igxjiqFOoSF9j2I
         HpAQ==
X-Gm-Message-State: APjAAAVNgowt+9JQYLHYvAE2Tc7vvztHQnNQ5FOIlzz5YInPlZqVuIes
        nQaQc4/dGN+8VAI+c09IZuoWp0fhAtM=
X-Google-Smtp-Source: APXvYqxtxkO/uahjUiCPPubzQMtg7uuuuAYKUY2iIYUWSWUfXhVkHdZJkqzwWQqrn51C7u0pdizkIQ==
X-Received: by 2002:a7b:c0d3:: with SMTP id s19mr8948106wmh.101.1574678735924;
        Mon, 25 Nov 2019 02:45:35 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id t185sm8390658wmf.45.2019.11.25.02.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 02:45:34 -0800 (PST)
Date:   Mon, 25 Nov 2019 11:45:33 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] drm/tegra: vic: Export module device table
Message-ID: <20191125104533.GF1409040@ulmo>
References: <20191122133215.1317039-1-thierry.reding@gmail.com>
 <20191125095629.GK29965@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FeAIMMcddNRN4P4/"
Content-Disposition: inline
In-Reply-To: <20191125095629.GK29965@phenom.ffwll.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--FeAIMMcddNRN4P4/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2019 at 10:56:29AM +0100, Daniel Vetter wrote:
> On Fri, Nov 22, 2019 at 02:32:15PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Export the module device table to ensure the VIC compatible strings are
> > listed in the module's aliases table. This in turn causes the driver to
> > be automatically loaded on boot if VIC is the only enabled subdevice of
> > the logical host1x DRM device.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> I noticed that the drm subdev driver also lacks the matches. How does that
> work? Just by getting loaded when any of the subdev drivers match?

Yeah, basically the host1x DRM driver registration causes a logical
device to be created. The driver will then finally bind to the device
after all the subdevices have been registered. Since all the subdevice
drivers are linked into a single module, all the module device tables
end up in that kernel module and that's enough to trigger the whole
process.

I ran into this issue when I was trying to run the Tegra DRM driver in
a "headless" configuration where all the display-related devices were
disabled via DT. Without exporting the VIC module device table, there
were no entries in the module's aliases list that would match the set
of devices registered to the system and the driver wouldn't load.

Thierry

> -Daniel
>=20
> > ---
> >  drivers/gpu/drm/tegra/vic.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> > index 9444ba183990..c4d82b8b3065 100644
> > --- a/drivers/gpu/drm/tegra/vic.c
> > +++ b/drivers/gpu/drm/tegra/vic.c
> > @@ -386,13 +386,14 @@ static const struct vic_config vic_t194_config =
=3D {
> >  	.supports_sid =3D true,
> >  };
> > =20
> > -static const struct of_device_id vic_match[] =3D {
> > +static const struct of_device_id tegra_vic_of_match[] =3D {
> >  	{ .compatible =3D "nvidia,tegra124-vic", .data =3D &vic_t124_config },
> >  	{ .compatible =3D "nvidia,tegra210-vic", .data =3D &vic_t210_config },
> >  	{ .compatible =3D "nvidia,tegra186-vic", .data =3D &vic_t186_config },
> >  	{ .compatible =3D "nvidia,tegra194-vic", .data =3D &vic_t194_config },
> >  	{ },
> >  };
> > +MODULE_DEVICE_TABLE(of, tegra_vic_of_match);
> > =20
> >  static int vic_probe(struct platform_device *pdev)
> >  {
> > @@ -516,7 +517,7 @@ static const struct dev_pm_ops vic_pm_ops =3D {
> >  struct platform_driver tegra_vic_driver =3D {
> >  	.driver =3D {
> >  		.name =3D "tegra-vic",
> > -		.of_match_table =3D vic_match,
> > +		.of_match_table =3D tegra_vic_of_match,
> >  		.pm =3D &vic_pm_ops
> >  	},
> >  	.probe =3D vic_probe,
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

--FeAIMMcddNRN4P4/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3bsMoACgkQ3SOs138+
s6FoThAAhUfcvm5SqZ+TIOqRgajhQnfgkHhwZDhfHicescpanDkDVBEOAdBTa73I
ptkelRjZe2JADaQoOULcHA5Gy8e2cPXIXNMfmtvM3qvevYwnJu4Ts10fIWhUDgSq
UFjD7Ki8qDF+aFxTpXwSdV2Igt7jVsG/6rjEvVRVnHQKwcPFfP9ubWGkwiVfUce9
Y5N2vNI0neyeStrdkvpCOTowjTx4HxK8n3RS4IFpsoj0IEoAu6GgJoBMfzzEsf4+
aenWXcczAVjXxbkdLFNJA5aqyL1fcG7YJF9+bEf9+sU6kSPQfaQYyymFPBCZe4mz
gK/U9HX78ucvjtbzyfXKErzXIwCBUICdWQEi+K8uaqiNh3xrdaDbHZsRdvsyYcMw
fNmIjGiXkU7FgpxZVYnSygLfW5I0jQwIJg1tIjb50AfUx6+AwLXQZlN13XaUoMOf
yfXbdCYudBRB/9CcwYoUnmRUD0QNSaEOfdWs4yB1k9fitc4Dng+qQQc0N/HVRZ/o
ZamHoPqHzRJurHlYQBFOXldBHuQOVqpMGqgmWPRUVq7D62Pp71Owbz1cKJyg68ri
EEnRyQgf6AkIwh0hFvghJ0T02NE0uUl0xzMvDrbiv/F7hW4GWSLNii+q2LotEnKO
25dPSMDIoZ8MtB8W7u16kx5KZtNDtcglNeMj60Vqeg4RaTmKkC4=
=79xx
-----END PGP SIGNATURE-----

--FeAIMMcddNRN4P4/--

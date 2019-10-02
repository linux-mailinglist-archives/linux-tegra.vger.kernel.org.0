Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2A99C8704
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 13:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbfJBLJ4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Oct 2019 07:09:56 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34898 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728123AbfJBLJ4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Oct 2019 07:09:56 -0400
Received: by mail-wr1-f68.google.com with SMTP id v8so19186415wrt.2
        for <linux-tegra@vger.kernel.org>; Wed, 02 Oct 2019 04:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NTaCpohC2Z/VS3ScIY8EzP/BV9pfxKXfaxk2yvi8A60=;
        b=NWQacgXlW/7o2ZzsRjLJHfGneRkelQU6usrm/nTWnk7IrKihv093+mcG4hWzCoM6kk
         nWdcvl8cdpyAHNruZDuI2uX+kE4JrTS9Kr/2ieknK0BuoqDqutK1Ep/uYip6nOBMcoP1
         lj0K9wkyXa1r95T4GgP4ncwNGdXHOOlAb3/M3O7nQfW0NvCPt+BidkIyZdVFUIUw6NWr
         SUCQj/hw6tShWcCKi2N7pHDhC66na3GfQLW0BdS6Bvoa1dGdRj1jZxOFaNus2Me0ad5u
         z1O4EjfZm4Y63FOVsUhqX432RTDPxvi0iqY448zuFJ/U4YFelOejYVT2CQx9MKnRWVb5
         mV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NTaCpohC2Z/VS3ScIY8EzP/BV9pfxKXfaxk2yvi8A60=;
        b=NhFFFmeRgVt4AuBgZzHy3+GTXBzHis460BMTvPjPpku7RfvFFy+zv0sTtjjucT6Sk/
         5WIHIh9CUen7oQNHOMRwe0j8ZNIu4dU/VP41HXaevYBKYqKN2oNpO2iNKa96chlhlN96
         i0qv6b0R9Rex8o8kou6WzOKoTNEALqlSayEHNKHWSes3StHN3AfAX2VB5xGXB2XowPIh
         RwRC68MrWQsZRhTbKEE9FwwMvCIgcM63VZkMShAulADe3r2jUv9/NYGkJAV/NlowVNnp
         NGzmBINNGC5DWijQVbYRbgQwGqYZGePGijHs4lBP144QJFm62dhqYBdeJ9s8gcHeePoy
         +AOA==
X-Gm-Message-State: APjAAAWh4Q9MPWhtYrqXgreNGJqhgih+AlXhgFFBt4nerB5dYtL9j9k3
        tnwXuOcDPrK3zIqM6lCiABA=
X-Google-Smtp-Source: APXvYqwpF8/wLV8YQQbuQmMSUtEj6NiJMozdqKuaNKeylQi1lZ1YKb2xDQkCqGiJBeBBemX8Xl96ow==
X-Received: by 2002:a5d:62c6:: with SMTP id o6mr2152074wrv.243.1570014592769;
        Wed, 02 Oct 2019 04:09:52 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id x2sm26755097wrn.81.2019.10.02.04.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 04:09:51 -0700 (PDT)
Date:   Wed, 2 Oct 2019 13:09:50 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Peter Chen <peter.chen@nxp.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/5] usb: chipidea: tegra: clean up tegra_udc flag code
Message-ID: <20191002110950.GL3716706@ulmo>
References: <20191002014153.29831-1-pgwipeout@gmail.com>
 <20191002014153.29831-3-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nhAUiXSLan16V5i8"
Content-Disposition: inline
In-Reply-To: <20191002014153.29831-3-pgwipeout@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--nhAUiXSLan16V5i8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2019 at 09:41:50PM -0400, Peter Geis wrote:
> All Tegra devices handled by tegra-udc use the same flags.
> Consolidate all the entries under one roof.
>=20
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 22 +++++-----------------
>  1 file changed, 5 insertions(+), 17 deletions(-)

The idea was that these would need to be differentiated at some point,
but I guess they don't, so:

Acked-by: Thierry Reding <treding@nvidia.com>

>=20
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/=
ci_hdrc_tegra.c
> index 12025358bb3c..0c9911d44ee5 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -24,35 +24,23 @@ struct tegra_udc_soc_info {
>  	unsigned long flags;
>  };
> =20
> -static const struct tegra_udc_soc_info tegra20_udc_soc_info =3D {
> -	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA,
> -};
> -
> -static const struct tegra_udc_soc_info tegra30_udc_soc_info =3D {
> -	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA,
> -};
> -
> -static const struct tegra_udc_soc_info tegra114_udc_soc_info =3D {
> -	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA,
> -};
> -
> -static const struct tegra_udc_soc_info tegra124_udc_soc_info =3D {
> +static const struct tegra_udc_soc_info tegra_udc_soc_info =3D {
>  	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA,
>  };
> =20
>  static const struct of_device_id tegra_udc_of_match[] =3D {
>  	{
>  		.compatible =3D "nvidia,tegra20-udc",
> -		.data =3D &tegra20_udc_soc_info,
> +		.data =3D &tegra_udc_soc_info,
>  	}, {
>  		.compatible =3D "nvidia,tegra30-udc",
> -		.data =3D &tegra30_udc_soc_info,
> +		.data =3D &tegra_udc_soc_info,
>  	}, {
>  		.compatible =3D "nvidia,tegra114-udc",
> -		.data =3D &tegra114_udc_soc_info,
> +		.data =3D &tegra_udc_soc_info,
>  	}, {
>  		.compatible =3D "nvidia,tegra124-udc",
> -		.data =3D &tegra124_udc_soc_info,
> +		.data =3D &tegra_udc_soc_info,
>  	}, {
>  		/* sentinel */
>  	}
> --=20
> 2.17.1
>=20

--nhAUiXSLan16V5i8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2UhX4ACgkQ3SOs138+
s6G3tg/9FUW3YbiUBJQqzJJRET8g2AOlhqnENm8IAkxUfjeqn7bNOGNXRfjj3gkR
s6GaOt19EUntDb/6Z6Zj18Ps/buoVRU/Oo4NA6qqoxNYZGa9XF63tFIlk2g3xfgx
PL7cMIXsn3D1fXiTG0Lxpxf0/Ri0M4wGQXzrUVJbdmAZluIhRdJ8jxSW+un4OdiO
yCzPBSZ0m8sBEltMDtEra8ua8QGqfmFNs2qD0GCyNgIpGrz7cI9Lz1mIyt2khdhi
f8U83anc5zDya4ahTQxnfY/aN4HmmJC639OTIcRzV+e53G4tIRQbxlt/QfJt7e3i
rVuJJm8oKJiFa50m7dzlxGAt8nQagUVoTuITARJs08bwGCtPSHKt/uSUTt0UEdD9
RM2UhzN3/y8g7N6fppzDeAGYiKV4GyLMvov8Kke8n85uGEUj5BRns/ylrdJQGES+
/e3Ut7wo+ZanGAG8Wj2QcamQJU2KX9VY+v5TRlhl8X8fF57fwI61Y2y+XnxocvQ7
2f1IDVnKrihUuZT1uSf3L3hOWPlx6EnTGCZ3BA3eAiyd5K1wWvcL1pWodiXB+mb2
LDYy4nmRmsCEjIsgcD2rbQ/WfxF6zmX83HvItcnxP93Q/itOfJ90w0qET09s13hr
9zbxOuXw74pJNksE4Ot7IVGZPLbm7yIOzJ8ZprrJ98oH2KEOJF8=
=XsQi
-----END PGP SIGNATURE-----

--nhAUiXSLan16V5i8--

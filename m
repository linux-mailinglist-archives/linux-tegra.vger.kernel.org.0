Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECE7AC86FF
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 13:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfJBLJS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Oct 2019 07:09:18 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50874 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfJBLJS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Oct 2019 07:09:18 -0400
Received: by mail-wm1-f67.google.com with SMTP id 5so6741196wmg.0
        for <linux-tegra@vger.kernel.org>; Wed, 02 Oct 2019 04:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jgjMsC7beB8zo8v1aQO1WszGxosYgUMZyGMZlQt0X2s=;
        b=a0tBJV9aMhV4TOpNnff91qpWUbuiJ1FJLfDus5Wb4wVvD0dbwx65FV26qN7bBn/A84
         F0dT1cNbyZ+uqpbUzK1ZNn4f0/x7biw1H6+eEl0M0yLHWDcYWvDuiCjP9ni9OaKpaDZ3
         qRxG1nbEFl6BXa3sMe5KR1+sr3cjcdUvRg++aGx10F1C7vGVVLan8fUbGkFux4jA5cTE
         SE8aPByT+1pDqFQ1FqkPH1+V3a+rdtKpmRtJeDlJzaA71dh9gTUDAS8IX84+MuIom6E9
         V3nIUfDNB6a7wmegzhz3mrUB3X4sJRGpyaganIg4KgrMJ97klYWpZ42XZOWi5nConPja
         ysQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jgjMsC7beB8zo8v1aQO1WszGxosYgUMZyGMZlQt0X2s=;
        b=fDKe33f01ek4a3CQ7NtGOz5lz7qNDB0/HvwvE8oFdHjCoKO3MNXTDX06C+3T1pPkdN
         0aNZphEkkjeaE+KvZR7UxZeGUsadhvY9tR6EG4o++0RYrp4egitg5SnPBWPWV7hZJq+3
         +cHfvUYJBHANFSuch8fTvPMH00wmtZH2DvHQKPHYtmgcqY2/1vDVrymw3lyJJht87Sno
         o9diW9rGj+6gP+UdreUNzSVxpsCE1fCrDjJ4nZCJuoCnpuIMFpD77c3mJ1kdBwgA2D3S
         dOHiw+MVSiP1d9VPLffIp/R5zfZzc66BFgDGFxE0qTUZCz3HyiJRaHlXYk+nLmcF0rUT
         oqOA==
X-Gm-Message-State: APjAAAUIs0p9iWziFnUk1UvVsioNq8nNKtiUoGjEwxJY7aDRDGugA3uw
        QUMlOQXvYVzQKrjHbh1Dv8w=
X-Google-Smtp-Source: APXvYqwZBlp9R/2yB52jvb+2UUbUrXni8zclxLYt4JX/cVOh8e4e1ldzz17CloXFqcg0c9PtEyZwew==
X-Received: by 2002:a1c:c1cc:: with SMTP id r195mr2557255wmf.50.1570014556611;
        Wed, 02 Oct 2019 04:09:16 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id e9sm8184242wme.3.2019.10.02.04.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 04:09:15 -0700 (PDT)
Date:   Wed, 2 Oct 2019 13:09:14 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Peter Chen <peter.chen@nxp.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 3/5] usb: chipidea: tegra: add dr_mode checking to
 tegra-udc
Message-ID: <20191002110914.GK3716706@ulmo>
References: <20191002014153.29831-1-pgwipeout@gmail.com>
 <20191002014153.29831-4-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bgLLobvf7eP6VP5c"
Content-Disposition: inline
In-Reply-To: <20191002014153.29831-4-pgwipeout@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--bgLLobvf7eP6VP5c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2019 at 09:41:51PM -0400, Peter Geis wrote:
> As the tegra-udc driver does not yet support all modes, add dr_mode
> checking capability.
> Warn about invalid configurations and explicitly assign dr_mode before
> handing off to the chipidea core driver.
>=20
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/=
ci_hdrc_tegra.c
> index 0c9911d44ee5..29415c3a2f48 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -25,7 +25,7 @@ struct tegra_udc_soc_info {
>  };
> =20
>  static const struct tegra_udc_soc_info tegra_udc_soc_info =3D {
> -	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA,
> +	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA | CI_HDRC_TEGRA_HOST,

This seems to be not at all related to the rest of this patch. Also, I
think this patch makes sense standalone, so it may be worth sending it
out separately, perhaps marked for integration into stable branches if
you think it worth it.

Thierry

>  };
> =20
>  static const struct of_device_id tegra_udc_of_match[] =3D {
> @@ -63,6 +63,28 @@ static int tegra_udc_probe(struct platform_device *pde=
v)
>  		return -EINVAL;
>  	}
> =20
> +	/* check the dual mode and warn about bad configurations */
> +	switch (usb_get_dr_mode(&pdev->dev)) {
> +	case USB_DR_MODE_HOST:
> +		dev_dbg(&pdev->dev, "dr_mode is set to host\n");
> +		udc->data.dr_mode =3D USB_DR_MODE_HOST;
> +		break;
> +
> +	case USB_DR_MODE_UNKNOWN:
> +		dev_warn(&pdev->dev, "dr_mode is unset or unknown, setting host mode\n=
");
> +		udc->data.dr_mode =3D USB_DR_MODE_HOST;
> +		break;
> +
> +	case USB_DR_MODE_PERIPHERAL:
> +		dev_dbg(&pdev->dev, "dr_mode is set to peripheral\n");
> +		udc->data.dr_mode =3D USB_DR_MODE_PERIPHERAL;
> +		break;
> +
> +	case USB_DR_MODE_OTG:
> +		dev_err(&pdev->dev, "dr_mode is otg, tegra-udc does not support otg at=
 this time\n");
> +		return -EINVAL;
> +	}
> +
>  	udc->phy =3D devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
>  	if (IS_ERR(udc->phy)) {
>  		err =3D PTR_ERR(udc->phy);
> --=20
> 2.17.1
>=20

--bgLLobvf7eP6VP5c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2UhVoACgkQ3SOs138+
s6FRkg/+M3PtQVSXqs3vu9Yxv8y2AvO8ugBD2J/NDZhzKx8qV9Q4JMjn9nNmTONe
Y56uXwjdfG1FF4ChkXGlH61EGCM5iTT4rFdq5Bq6iFY4TUDU4K+drWPAaKRWOL+P
lbquD16LQaDAhfVDIvncbj4QM1cP2hy3urDxpZD/Yl+7ssPj+Pab3atNjz8Xo9Hr
s98z2YC27gtgYekE41dH46YClbHTpVA1wTV4jrmyx7ZSILwhrTLO7peYaRkArJJn
Y8koUfClszb/n3Y2TJEsnYr28bfQ91jxrqjAGj+aNkZo2gj3mX9vxvXjb/NPkwkQ
4Nr8Je8+CsfqVHYtAuqRgl5jjb6Ioj63OwA7QN6GC/TITzfmEr9UbxyYUzdASRXa
Gg92JL4wHpKOJO/Q85L/tKiLadgrqJF2ECAFcuUsXCie3nQt5AHIemkWcO0I8gan
VEvTwTU2VQ0D1yvnLqhr1LVyMtO4uDkBq0i/WHc+TG7GiMfLYvYz70t/GKcV7q8i
b9taQr71Pq52t+zJGFS2L55SMfaAxloyrlRW0ClL7d0A+M7+qQsaC9njByH7EKNs
h0Gnpakb7TCGD0nViQhuaxSr5spAoIEUO9pYDCamRrCqlkBCFY2pa7/R6oSzeBkb
Lp3x2z1TVxGb023GIJiiYnynX31w1PJH4a5Wbo9+rrzb7qJJgCg=
=Unek
-----END PGP SIGNATURE-----

--bgLLobvf7eP6VP5c--

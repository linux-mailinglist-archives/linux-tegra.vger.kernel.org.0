Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 815D0203AAE
	for <lists+linux-tegra@lfdr.de>; Mon, 22 Jun 2020 17:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729216AbgFVPWO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 22 Jun 2020 11:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729149AbgFVPWO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 22 Jun 2020 11:22:14 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8210C061573
        for <linux-tegra@vger.kernel.org>; Mon, 22 Jun 2020 08:22:13 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id z17so2011790edr.9
        for <linux-tegra@vger.kernel.org>; Mon, 22 Jun 2020 08:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EOCOFYBKcG2qqQrFUfqalp0If0MlnohLo+c9qKg2DLk=;
        b=KaP8DItI9o0zmbSl2pQFtHawOPkVGUoTgu24SGLMjzIifn24a5klYMSYLEGdp/sdpU
         JH5Z+KDit5wa2n86gQCzuVeWvTXWqwMvjuuT1yo2RT4hM0asWBEfYtiBfPCaVVIgQPuc
         oDBTSf6q2tw8cMpHMdDyFpDjBA8+aDNgE3P+e6bQWwITDXuJOjHa+F/UDtnDYWv0+dSD
         0vtNPkYkRHglhguWaiP6i/7bqzxEYhpwPBf1v4WOHdY2QflhP9NL64tzZg5zP4ajdGIK
         UjcP5k2WVvH0rb6bGnLA5wrcqx05kusFnnEil+BWezV9bdRZnHw8CpKiZEoFASEDlvP8
         dRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EOCOFYBKcG2qqQrFUfqalp0If0MlnohLo+c9qKg2DLk=;
        b=fHZBD55WKdIeP6oK66kn0Jb8Kix+cN1txFWl40fgGD+r4+5vrjnlYLtQniL487Z0QT
         V/LSmpU0TsTaZZkrJg7zhl/S47X7cDpy3Gwdij74DhMoBvAWfqN8e69ZA6qV0FYzDp2v
         DRFJ/eeNSzeeuS3Lwkkn2HMWn5zkEWauATMI93f4LzxR2YUOStRLADEk1nbDvO6RCXlN
         CTphM1EJlcHFCZ3j9tWdcxlbNW5RMUmxwd9JHM45tXoTA+sGwH/1tdeKoZQhze+LOX4m
         8dONWk5dzBAOlzRtroU8svBCuQbuGZKubAER1iAsoqxKFPewSyw3ER0RhtP+LTpCFPZ9
         LXYw==
X-Gm-Message-State: AOAM530OIbLfTnN4kRVioXWQg4i+3myQv5RofzHG/P6UeN9Qod5gAOxZ
        2wnsNGAj+KbP9R8kQH3MJPY=
X-Google-Smtp-Source: ABdhPJytuHBrr2Ixf/0eO4HSWgXHSTAsHRlVWsP7HyYqNe4blDYz9PYPBGtOBkBnVuwZIfjyJPcX7Q==
X-Received: by 2002:a50:ee84:: with SMTP id f4mr5293914edr.183.1592839331881;
        Mon, 22 Jun 2020 08:22:11 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id z38sm13479630ede.96.2020.06.22.08.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 08:22:10 -0700 (PDT)
Date:   Mon, 22 Jun 2020 17:22:09 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 09/73] ARM: tegra: gr2d is not backwards-compatible
Message-ID: <20200622152209.GA4008275@ulmo>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-10-thierry.reding@gmail.com>
 <9f56be9a-1a79-07cc-371f-f3abcd20701e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <9f56be9a-1a79-07cc-371f-f3abcd20701e@gmail.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 07:21:30PM +0300, Dmitry Osipenko wrote:
> 16.06.2020 16:51, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The instantiation of gr2d in Tegra114 is not backwards-compatible with
> > the version found on earlier chips. Remove the misleading compatible
> > string.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm/boot/dts/tegra114.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra1=
14.dtsi
> > index a0ac9ea9ec9d..d583dfba688f 100644
> > --- a/arch/arm/boot/dts/tegra114.dtsi
> > +++ b/arch/arm/boot/dts/tegra114.dtsi
> > @@ -35,7 +35,7 @@ host1x@50000000 {
> >  		ranges =3D <0x54000000 0x54000000 0x01000000>;
> > =20
> >  		gr2d@54140000 {
> > -			compatible =3D "nvidia,tegra114-gr2d", "nvidia,tegra20-gr2d";
> > +			compatible =3D "nvidia,tegra114-gr2d";
> >  			reg =3D <0x54140000 0x00040000>;
> >  			interrupts =3D <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> >  			clocks =3D <&tegra_car TEGRA114_CLK_GR2D>;
> >=20
>=20
> Could you please explain what's the difference? AFAIK, the 2D HW is
> identical on T20/30/114.

My understanding is that the IP core itself is identical. However, the
compatible string really describes the integration of the IP, which in
case of Tegra114 is slightly different in that it's part of the HEG
power partition, whereas it wasn't previously.

That means that without knowledge of the power partition we won't be
able to access the gr2d IP on Tegra114 at all and hence it isn't
backwards compatible with Tegra20.

Thierry

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7wzJ4ACgkQ3SOs138+
s6G7gQ/8DA0LKvoArm/z8bzEwzWzRS2C4E4lRfioD6TQSQ/+J/J4YpPm3YGMLgH9
/F6xR9x5DGsru53Idf6wyvIf0hs+1jFszKlAnMxffJUxh5V08MicRDXbnc1N7a7h
yLcyp4hWZBPtXSXI/kmd0sZZfwiPtV+I2rcjU5/sSKh2JiT6Oa0sTLxZtq8edXGi
k0yBFkgpunhzth5LSfj2WdaBS7brk8mkJszv+wLv4P0YDQZabXpbgy/7fwoitbPK
Pt8R72pfqCE+1AMh5Y4q6GATN9ZcSeu0QiVjsKCHXOIUGQXywB9DtjEp6WzqveQ6
Y01QrRuNjRr6M60Hg9ErluV5OKxCW3dF661jybZzsBpQ3rM3XY6+gOoteetT471r
0tH9SccZINqoQDa5A3Yn41g+urpbVemJhLVCkMAhZuvlU5/xbX2QRoIn/Vs6UACN
Ktda/rdbG9ie2JZ06pZrDBtNvC4JGwpibtsji6999+5YBxJIeLG4vnVu630a8pIU
D5Dtf76qR94Pz5jIE7sjJui0577Akymr3NaPWrcN3V4EQIQtc1AJtLE/BQ/49vKX
fPW+KieLW+G9psLWWGUUHqoW8vdlrBNzvzLyqmKXGKm2zTRnXBme29764PPWGcYu
45NFReGyIrAyv2yzRxfMm+se8N5DlOYrkIsSxTiKW/vQas3WOYA=
=zA7d
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--

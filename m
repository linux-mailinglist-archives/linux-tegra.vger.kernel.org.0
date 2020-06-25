Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B349209A9C
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jun 2020 09:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390250AbgFYHhl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 25 Jun 2020 03:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390040AbgFYHhk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Jun 2020 03:37:40 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658C8C061573
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2020 00:37:40 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id g20so3180957edm.4
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2020 00:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wdRm8JiRn8ZIVWS/nELlT+8THIV83UbGYn4itX5cs+M=;
        b=Vss8WPFzKWmlnt6jhrUa+/5u5QdUKfWPkmn4LuDPc/T7GeoY46jA2ZvO8VWUTimFji
         Ox1+FtsAwZMSed8fX/AkNAO7rsa5JVK1l8gmn2TEG8l/0Z4fkxTfXpuBQQeGGj6Q+sE2
         b+AIcqmlhOjd/cqq2JTxgYvwdvxuupg47vSAYs1HueHkxf0S07mZBzo/+pXVMPcB2xpg
         6Ge8A2eKr873fxcUCgTU3muc+/iAeUT9Fy6y2e611PIF04PRxtI8dqEGvs/htLyXXON7
         WBkwOjnwtqL0UPv4BpVbfgvFN+Xksg1RqxF68vrdDEoYb4gdxHaRln246tqlt61pGZzR
         X2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wdRm8JiRn8ZIVWS/nELlT+8THIV83UbGYn4itX5cs+M=;
        b=h5o0t6p3xXjkrpgRmoMMnU1Lq2qsdDc5bpYv334MqaBosljkExS0HCIlbHnJFAjW2Q
         CMFujMYukSWVZfArniJI5m9SAaWWK89wmXcNkxoYau8aJnRpDpO/8jeDgyItscvsHKPV
         mz9jPsaWsxBBgLt5gVMu2PpACZBq2QUWhn4WYP6uMXsWmcTjNuarGEDT/cZ+PaIsXWrz
         iK9gq0kbShxP4MABe+bEQ2vwYj/vmsBmLemfjyu0t4qvUbsqnc4teqgCTHVw+Zf434mC
         7qXSjftkWvIxwW8X9ERNlom7mTrIA4t1crPCgxYn8rrbsZPHX63/TyelEGfvHEhT/vZ8
         ++xw==
X-Gm-Message-State: AOAM531iu8a/ENq29pkt4n30i7YGMt3anYWofwN8B6qJ/fLFGAKhnWF4
        CHIR74FRoGS+x5QB8bcmM2QquJ0B
X-Google-Smtp-Source: ABdhPJxjAdTGqBrNvSrM0sM74Qmq9b1P3KorN/9GUMvi5vss0dxXpkF1uQH6q4umHRHry6yF8oy3EA==
X-Received: by 2002:a05:6402:642:: with SMTP id u2mr30413461edx.230.1593070659024;
        Thu, 25 Jun 2020 00:37:39 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v5sm1669545ede.35.2020.06.25.00.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 00:37:37 -0700 (PDT)
Date:   Thu, 25 Jun 2020 09:37:36 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 12/73] ARM: tegra: Drop display controller parent clocks
 on Tegra114
Message-ID: <20200625073736.GA2800220@ulmo>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-13-thierry.reding@gmail.com>
 <0bc2ec0e-f863-207a-d61b-058503598139@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline
In-Reply-To: <0bc2ec0e-f863-207a-d61b-058503598139@gmail.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2020 at 07:19:26PM +0300, Dmitry Osipenko wrote:
> 16.06.2020 16:51, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The parent clocks are determined by the output that will be used, not by
> > the display controller that drives the output. Drop the parent clocks
> > from the display controller device tree nodes.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm/boot/dts/tegra114.dtsi | 10 ++++------
> >  arch/arm/boot/dts/tegra124.dtsi | 10 ++++------
> >  arch/arm/boot/dts/tegra20.dtsi  | 10 ++++------
> >  arch/arm/boot/dts/tegra30.dtsi  | 10 ++++------
> >  4 files changed, 16 insertions(+), 24 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra1=
14.dtsi
> > index a06b88b01ef3..23df7a5f37d3 100644
> > --- a/arch/arm/boot/dts/tegra114.dtsi
> > +++ b/arch/arm/boot/dts/tegra114.dtsi
> > @@ -59,9 +59,8 @@ dc@54200000 {
> >  			compatible =3D "nvidia,tegra114-dc";
> >  			reg =3D <0x54200000 0x00040000>;
> >  			interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks =3D <&tegra_car TEGRA114_CLK_DISP1>,
> > -				 <&tegra_car TEGRA114_CLK_PLL_P>;
> > -			clock-names =3D "dc", "parent";
> > +			clocks =3D <&tegra_car TEGRA114_CLK_DISP1>;
> > +			clock-names =3D "dc";
> >  			resets =3D <&tegra_car 27>;
> >  			reset-names =3D "dc";
> > =20
> > @@ -78,9 +77,8 @@ dc@54240000 {
> >  			compatible =3D "nvidia,tegra114-dc";
> >  			reg =3D <0x54240000 0x00040000>;
> >  			interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks =3D <&tegra_car TEGRA114_CLK_DISP2>,
> > -				 <&tegra_car TEGRA114_CLK_PLL_P>;
> > -			clock-names =3D "dc", "parent";
> > +			clocks =3D <&tegra_car TEGRA114_CLK_DISP2>;
> > +			clock-names =3D "dc";
> >  			resets =3D <&tegra_car 26>;
> >  			reset-names =3D "dc";
> > =20
> > diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra1=
24.dtsi
> > index 1afed8496c95..2c992e8e3594 100644
> > --- a/arch/arm/boot/dts/tegra124.dtsi
> > +++ b/arch/arm/boot/dts/tegra124.dtsi
> > @@ -105,9 +105,8 @@ dc@54200000 {
> >  			compatible =3D "nvidia,tegra124-dc";
> >  			reg =3D <0x0 0x54200000 0x0 0x00040000>;
> >  			interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks =3D <&tegra_car TEGRA124_CLK_DISP1>,
> > -				 <&tegra_car TEGRA124_CLK_PLL_P>;
> > -			clock-names =3D "dc", "parent";
> > +			clocks =3D <&tegra_car TEGRA124_CLK_DISP1>;
> > +			clock-names =3D "dc";
> >  			resets =3D <&tegra_car 27>;
> >  			reset-names =3D "dc";
> > =20
> > @@ -120,9 +119,8 @@ dc@54240000 {
> >  			compatible =3D "nvidia,tegra124-dc";
> >  			reg =3D <0x0 0x54240000 0x0 0x00040000>;
> >  			interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks =3D <&tegra_car TEGRA124_CLK_DISP2>,
> > -				 <&tegra_car TEGRA124_CLK_PLL_P>;
> > -			clock-names =3D "dc", "parent";
> > +			clocks =3D <&tegra_car TEGRA124_CLK_DISP2>;
> > +			clock-names =3D "dc";
> >  			resets =3D <&tegra_car 26>;
> >  			reset-names =3D "dc";
> > =20
> > diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20=
=2Edtsi
> > index f0a172c61b26..8b6909839f59 100644
> > --- a/arch/arm/boot/dts/tegra20.dtsi
> > +++ b/arch/arm/boot/dts/tegra20.dtsi
> > @@ -103,9 +103,8 @@ dc@54200000 {
> >  			compatible =3D "nvidia,tegra20-dc";
> >  			reg =3D <0x54200000 0x00040000>;
> >  			interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks =3D <&tegra_car TEGRA20_CLK_DISP1>,
> > -				 <&tegra_car TEGRA20_CLK_PLL_P>;
> > -			clock-names =3D "dc", "parent";
> > +			clocks =3D <&tegra_car TEGRA20_CLK_DISP1>;
> > +			clock-names =3D "dc";
> >  			resets =3D <&tegra_car 27>;
> >  			reset-names =3D "dc";
> > =20
> > @@ -120,9 +119,8 @@ dc@54240000 {
> >  			compatible =3D "nvidia,tegra20-dc";
> >  			reg =3D <0x54240000 0x00040000>;
> >  			interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks =3D <&tegra_car TEGRA20_CLK_DISP2>,
> > -				 <&tegra_car TEGRA20_CLK_PLL_P>;
> > -			clock-names =3D "dc", "parent";
> > +			clocks =3D <&tegra_car TEGRA20_CLK_DISP2>;
> > +			clock-names =3D "dc";
> >  			resets =3D <&tegra_car 26>;
> >  			reset-names =3D "dc";
> > =20
> > diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30=
=2Edtsi
> > index 27000f0ba35b..23fedb76e5ae 100644
> > --- a/arch/arm/boot/dts/tegra30.dtsi
> > +++ b/arch/arm/boot/dts/tegra30.dtsi
> > @@ -200,9 +200,8 @@ dc@54200000 {
> >  			compatible =3D "nvidia,tegra30-dc", "nvidia,tegra20-dc";
> >  			reg =3D <0x54200000 0x00040000>;
> >  			interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks =3D <&tegra_car TEGRA30_CLK_DISP1>,
> > -				 <&tegra_car TEGRA30_CLK_PLL_P>;
> > -			clock-names =3D "dc", "parent";
> > +			clocks =3D <&tegra_car TEGRA30_CLK_DISP1>;
> > +			clock-names =3D "dc";
> >  			resets =3D <&tegra_car 27>;
> >  			reset-names =3D "dc";
> > =20
> > @@ -219,9 +218,8 @@ dc@54240000 {
> >  			compatible =3D "nvidia,tegra30-dc";
> >  			reg =3D <0x54240000 0x00040000>;
> >  			interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks =3D <&tegra_car TEGRA30_CLK_DISP2>,
> > -				 <&tegra_car TEGRA30_CLK_PLL_P>;
> > -			clock-names =3D "dc", "parent";
> > +			clocks =3D <&tegra_car TEGRA30_CLK_DISP2>;
> > +			clock-names =3D "dc";
> >  			resets =3D <&tegra_car 26>;
> >  			reset-names =3D "dc";
> > =20
> >=20
>=20
> Hello Thierry,
>=20
> Tegra DRM fails to probe after this change using next-20200624 on T20/30
> (T124 also should be broken):
>=20
>  tegra-dc 54200000.dc: failed to get parent clock
>  tegra-dc 54200000.dc: failed to probe RGB output: -2

Indeed. I had completely missed that we used to have this RGB output on
prior chips and therefore do need the parent clock. As of Tegra124 that
RGB output is no longer present, so this isn't needed anymore.

> BTW, the commit's title is misleading since the patch touches all SoCs
> and not only the T114.

Good catch. I've replaced this with the following:

--- >8 ---
commit afd92390fcaa784a6d064f3b07c8d8124e43e5d1
Author: Thierry Reding <treding@nvidia.com>
Date:   Thu Jun 11 19:09:36 2020 +0200

    ARM: tegra: Drop display controller parent clocks on Tegra124
   =20
    The parent clocks are determined by the output that will be used, not by
    the display controller that drives the output. On previous generations a
    simple RGB output used to be part of the display controller and hence an
    explicit parent clock needed to be assigned to the display controller to
    drive the RGB output. Starting with Tegra124, that RGB output has been
    dropped and the parent clock can therefore be removed from the display
    controller device tree nodes.
   =20
    Signed-off-by: Thierry Reding <treding@nvidia.com>

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.d=
tsi
index 1afed8496c95..2c992e8e3594 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -105,9 +105,8 @@ dc@54200000 {
 			compatible =3D "nvidia,tegra124-dc";
 			reg =3D <0x0 0x54200000 0x0 0x00040000>;
 			interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
-			clocks =3D <&tegra_car TEGRA124_CLK_DISP1>,
-				 <&tegra_car TEGRA124_CLK_PLL_P>;
-			clock-names =3D "dc", "parent";
+			clocks =3D <&tegra_car TEGRA124_CLK_DISP1>;
+			clock-names =3D "dc";
 			resets =3D <&tegra_car 27>;
 			reset-names =3D "dc";
=20
@@ -120,9 +119,8 @@ dc@54240000 {
 			compatible =3D "nvidia,tegra124-dc";
 			reg =3D <0x0 0x54240000 0x0 0x00040000>;
 			interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-			clocks =3D <&tegra_car TEGRA124_CLK_DISP2>,
-				 <&tegra_car TEGRA124_CLK_PLL_P>;
-			clock-names =3D "dc", "parent";
+			clocks =3D <&tegra_car TEGRA124_CLK_DISP2>;
+			clock-names =3D "dc";
 			resets =3D <&tegra_car 26>;
 			reset-names =3D "dc";
--- >8 ---

Thierry

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl70VD0ACgkQ3SOs138+
s6FFzBAAo/d7tW+bWArDQmse5y8uTXq9jzqaVKBHJKPXQcDjXVIZjF9zojwpdOV/
sMp+iYRZH/18OARVC8UT0JjWx2ojDQ/z3HAey001Zxu/icnX1ossvtFJDUG/Bucf
6HFfJYJDlHvnfCvDQPrB7yUTURyVX6fOP1fBE4REKwl0cGuaPwGET4bzgsq8Ooon
E/I/3jpGs/hSacDNy2Y9J1Br3W+Ws6FVQPFH50yqN4nQr+QCQ6/1IrOcbsrR4Run
umDwM0YcokY1HQkHuTExa+tS2mzb1OQxrNIJdvy8Hdny5R2NNeFZgDN0lJV6/zta
zYJAQXEGKKVmDslX9jJV3U5uUphatqi5oMobOUdXSbpYs62kEtkSA2sVDr69uKwi
PChhy1fqeL7qt0aDj6kX6TxiLRZHN5odHFyEvisiONZx/Wqq16Z8NhkzoY/Mnu9P
oysqzR6cP8vNz0Wo/wuT/rwjVoM/e0Vq8G1YrFKavCKd77+85mzgXlOrQJW1spW4
d06TMEXk7Oc98/56PTwDPPOWFS7ywQPNspS7D7N031wIdxQreVb/e9z24M1B7hWP
loSF+CtLv5mI+XikVmSj4Ap1J5HFJXkd9mZwTNFadppnnHCKK6OWJXFEc6rZHuAY
R2tBiT7Ou2JkNtsKDl/1UeokEamJ5EZsSk6cuzMAbYJdHXw/miU=
=oiOs
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F130429AD50
	for <lists+linux-tegra@lfdr.de>; Tue, 27 Oct 2020 14:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2900711AbgJ0NaR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 27 Oct 2020 09:30:17 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40244 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2900708AbgJ0NaR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Oct 2020 09:30:17 -0400
Received: by mail-ed1-f67.google.com with SMTP id p93so1430841edd.7;
        Tue, 27 Oct 2020 06:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wudM5QwSA7l9nftYeilMZoiCCrd5fiqvQMUjjhFgGSI=;
        b=PYVULImcz4Gnw1D04xpjc7uvWArCoNx6vXY4XNxSB1csz3VRtD5dmEaYz8rBijDZrV
         Lnx6KlbQB5TfWQMwSmg1VSKDph3GRaYI8gCg2s1VXSyZp8AVZAt5VDEv5V2HA3xFtCWH
         FMAlOkuUl+Jah3vd4YXsfW1CpfJdxHwAfSZx7HM1aai17vpMwEgAjOqtu6YDKp73YO0s
         9ZTWzN7l04bvlMX9VZThvwmO0UbES/E82rcU/aGpH+3Xt7NF2jKZCz9HuBfZYvZu8EqS
         cdKznbSFIPbsVZpjMeTFDdHqCcpxmfyiqWlHYBvTROodcB1FYiF6XXEnd5Z3tlyD2AX6
         2qzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wudM5QwSA7l9nftYeilMZoiCCrd5fiqvQMUjjhFgGSI=;
        b=US2CR5Rz0JbhYKqFS7uVY5DTbT5qAPnab6uxzV8Y7rwdhVTZlSSlDxL65FYgLuCG2r
         oaoTgfLw099cKg3kCnh8q6WWrD4K2sq984pe6sInD5U0gQZcaEhoP3N7+vUXKn7mZICj
         tGaNnmLWBjK5rwXVBbUSbNHmjhda00PD3Sf0O9lhgaWfOuee4GKH0dLclGEqdn8aaCkx
         k0yUYIobguFzvOE4JZbHnPTMMxISW5UQ8vOoTWBRL1XFAX4O9kk0j5tjjwd/GZHR5DD1
         VJ1G4hTgtTih3DotbHGDItwtmeKNklFlk9N2/0SmP6sxB3TZ6uUHVsIkElPl4j+syDbv
         7igw==
X-Gm-Message-State: AOAM533VFGgYXEihXsnb/hLVnmnNZG7qyF69FKKGsqix8DpbIxebH09N
        eEv663JKsLGDdA42nM4PZCw=
X-Google-Smtp-Source: ABdhPJyKqvL1G68+mtN3mL7LT5Bd5npDhA+ZcNbEOm7IUY11Z/Hx999HcvRW/1K0hoGytjj30+zKTA==
X-Received: by 2002:a50:fb13:: with SMTP id d19mr2265371edq.215.1603805411492;
        Tue, 27 Oct 2020 06:30:11 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id s12sm990258edu.28.2020.10.27.06.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 06:30:10 -0700 (PDT)
Date:   Tue, 27 Oct 2020 14:30:08 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Viresh Kumar <vireshk@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 21/52] ARM: tegra: Add interconnect properties to
 Tegra20 device-tree
Message-ID: <20201027133008.GH1822510@ulmo>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-22-digetx@gmail.com>
 <20201027091247.GK4244@kozik-lap>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="e5bfZ/T2xnjpUIbw"
Content-Disposition: inline
In-Reply-To: <20201027091247.GK4244@kozik-lap>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--e5bfZ/T2xnjpUIbw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2020 at 10:12:47AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2020 at 01:17:04AM +0300, Dmitry Osipenko wrote:
> > Add interconnect properties to the Memory Controller, External Memory
> > Controller and the Display Controller nodes in order to describe hardwa=
re
> > interconnection.
> >=20
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  arch/arm/boot/dts/tegra20.dtsi | 26 +++++++++++++++++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20=
=2Edtsi
> > index 9347f7789245..2e1304493f7d 100644
> > --- a/arch/arm/boot/dts/tegra20.dtsi
> > +++ b/arch/arm/boot/dts/tegra20.dtsi
> > @@ -111,6 +111,17 @@ dc@54200000 {
> > =20
> >  			nvidia,head =3D <0>;
> > =20
> > +			interconnects =3D <&mc TEGRA20_MC_DISPLAY0A &emc>,
>=20
> I think you just added the defines and did not include them here, so
> this should not even build. Did you test it?

The dt-bindings/memory/tegra20-mc.h header is already included in
existing DTS files for MC hot flush resets, so this should be fine.

Thierry

--e5bfZ/T2xnjpUIbw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+YIOAACgkQ3SOs138+
s6GYyg/9G9pB/bwzgqQzz+wOHyuNUCHPbkIx9CUIUnXDndybQYoKI/moPxY1ulfd
AygGLzhvDB/jOVPQbwykmE08zxduCfUaJrN0gSRpK1UjaUJ8DTW5Et4cvYegiH0C
nq1edcOtncfzxoeOCR4FdBMML1WxzfU5io5SEhaVcVgvyj6Av4MEfjLUSZX6aNzQ
vtmdx6GE5/ppkA47N/45K/p4ltdUo79NaFFocOoTM2LIAyR5b1wCpxzdQHivcsNI
6pqTq6jcXI2OMPl6/RGb0adksk7r4xJ5X/om6TxMSm9rds6TZWJujmhs4QH/WLFp
CBUQRWDFFic15MG6gaamN/bvUPE7w6Ue90b/c53CT0mYI6KhxpNoAUsJKWhgxWWx
iBOmUo1g1Wh50meliaNrvMdwyEJfi1ZDGEecz8LTXwX8jXMTiW8B9Nq/I1nGSy+T
iwkzs4cqWkQKjd9JsHKxWNAvHx/MNr6ilMssX8EPoG14xb+5bkwtPA94Dm5IbC3l
JMng8h98+LVsBd6JiJQnuyDv5AmaE3Tr5qHVA3NWXMatKKhOWzmqjyPrDQcCuvKJ
VGYb6t8ZpyedxjJjBUpkKp4yBD7bkuNBMaQ/QTsd5rNSF2PVoSLn5REgnFl9jSfB
gK5H5gs9J5ihRLtZQ7Lw2JyoTZ2vCMnAAW65LoFJp/oqp8A3O4c=
=uebE
-----END PGP SIGNATURE-----

--e5bfZ/T2xnjpUIbw--

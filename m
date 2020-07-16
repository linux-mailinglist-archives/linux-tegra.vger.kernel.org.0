Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C7E2223B4
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jul 2020 15:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgGPNR6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jul 2020 09:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbgGPNR5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jul 2020 09:17:57 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7308EC061755
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 06:17:57 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id a8so4756780edy.1
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oSvvDmmskMklKZHM3n6fMylLnzgfxl9CNhA+tjWlzsY=;
        b=kQZobFbzxq6iRm7uN7TGdWcVZWGTorSFSvxf1naEf++zNuGbQvBoOZZfUN1cNhSpk5
         GewGvtztqeOlzMfQ1Sa10w5+sAHyGIPHZ3MdJ4XWafWOK1aREmap3FFrLUYcv18SOCfP
         VUUngu04p9EC8LD1jfuZrorAnbiJhuIcvIRY2CS307IpbKhjUeonLDFMvLyCY/8fxxMo
         vDrznQae0k8AR7kDMqLNkwfgeEWzPkDRFPIoYwfn8KHLheU+iBi2L16SuRGNBkhFQf9O
         ild30LWxvkF9I8/wNqb3JubLpGoBy88wP5+DOjacgNPjTLv0vXWfHh64o6P9Yb91Bu0C
         EL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oSvvDmmskMklKZHM3n6fMylLnzgfxl9CNhA+tjWlzsY=;
        b=IiGxW8s377+LJtiF4gB54fuJ1JVP2tprIzkKSq9o7RE+a95IsKglbIzYe0A7wtxgIL
         mJLz2BR6Qe/VApI8fV5W3QjYzlwC4eD6/CAD+QoTm1RYMqwtLw/eWeC3Q9nyKodP90z3
         RAGrCOgdIlYpxwA3YIqx41r2+wvKa4vyV65l4JOdPQEDSDf6mgR4glfHhj/aOKE+ELw6
         ugy7Jh972Q2clQvyu6OSN7Z2PPOr2kFZmFgxH8AMIuf93AXIheeLd2jN0E7rh3nktBiZ
         Jmru4BHZloI2AqyZ4Zr2B0wCdrMkwDbd6D7Vh/dzSVMC+zF+mY4OS/b2KknBH9JhGvPz
         X9zA==
X-Gm-Message-State: AOAM530YmCvBZyYpRPNZwWE+CPNwyCVmWQxnVMTfCaRrXQDz+RD+zgfT
        LK1FP7HManBZyqAF6g4S9tusXSHw
X-Google-Smtp-Source: ABdhPJzIYhWHGe0ywZspXN15H6wY4S3BPTZXrIJ3Ap2EQ7Vcy4Mlh7tSI9z+Y+Uy/X7dphTBdqdqEg==
X-Received: by 2002:a50:eac5:: with SMTP id u5mr4601126edp.6.1594905476182;
        Thu, 16 Jul 2020 06:17:56 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y22sm4991203ejj.67.2020.07.16.06.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 06:17:54 -0700 (PDT)
Date:   Thu, 16 Jul 2020 15:17:53 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, Debarshi Dutta <ddutta@nvidia.com>,
        Terje Bergstrom <tbergstrom@nvidia.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: tegra: Add the GPU on Tegra194
Message-ID: <20200716131753.GG535268@ulmo>
References: <20200716120138.532906-1-thierry.reding@gmail.com>
 <3748e071-4d08-8e77-43f6-de37f5a7eb1e@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="doKZ0ri6bHmN2Q5y"
Content-Disposition: inline
In-Reply-To: <3748e071-4d08-8e77-43f6-de37f5a7eb1e@nvidia.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--doKZ0ri6bHmN2Q5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2020 at 01:59:33PM +0100, Jon Hunter wrote:
>=20
> On 16/07/2020 13:01, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The GPU found on NVIDIA Tegra194 SoCs is a Volta generation GPU called
> > GV11B.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 33 ++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra194.dtsi
> > index 259e40469908..f559fe983ebe 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > @@ -1395,6 +1395,39 @@ sor3: sor@15bc0000 {
> >  				nvidia,interface =3D <3>;
> >  			};
> >  		};
> > +
> > +		gpu@17000000 {
> > +			compatible =3D "nvidia,gv11b";
>=20
> I think we also need to add the to binding doc.

I've got a patch that converts the nvidia,gk20a.txt to the json-schema
format and then a patch on top that adds this compatible string. Since
that patch is part of a larger series that's a bit stalled, I'll add
this to the existing bindings for now.

> > +			reg =3D <0x17000000 0x10000000>,
> > +			      <0x18000000 0x10000000>;
> > +			interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names =3D "stall", "nonstall";
> > +			clocks =3D <&bpmp TEGRA194_CLK_GPCCLK>,
> > +				 <&bpmp TEGRA194_CLK_GPU_PWR>;
> > +			clock-names =3D "gpu", "pwr";
> > +			resets =3D <&bpmp TEGRA194_RESET_GPU>;
> > +			reset-names =3D "gpu";
> > +			status =3D "disabled";
> > +
> > +			power-domains =3D <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
> > +			interconnects =3D <&mc TEGRA194_MEMORY_CLIENT_NVL1R &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL1RHP &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL1W &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL2R &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL2RHP &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL2W &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL3R &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL3RHP &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL3W &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL4R &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL4RHP &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL4W &emc>;
> > +			interconnect-names =3D "dma-mem", "read-0-hp", "write-0",
> > +					     "read-1", "read-1-hp", "write-1",
> > +					     "read-2", "read-2-hp", "write-2",
> > +					     "read-3", "read-3-hp", "write-3";
> > +		};
> >  	};
>=20
> I also see that for gv11b we populate 'dma-coherent' and so we should
> probably add this as well.

Do we know for certain that the GPU is DMA coherent? I've only tested
this (with local patches to Nouveau) without dma-coherent, so I have not
actually verified that it works without.

I vaguely recall reading that there are different apertures for sysmem,
one for coherent sysmem and another for non-coherent sysmem. So I'm not
sure if dma-coherent here will work without additional code in the
driver to ensure that all memory is allocated from the coherent sysmem
aperture.

I'd suggest we leave this as-is for now until we're further along with
GPU support and we can properly test this. Leaving out dma-coherent
should be harmless and in the worst case unnecessarily flushes caches.

Thierry

--doKZ0ri6bHmN2Q5y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8QU38ACgkQ3SOs138+
s6G23A/+JGq1eXi2Wl1m1cgp1KNRfwUw1v3aZF4quY2ZYcPFiF8bYE2Eq8H3dBWb
k4vo0mJyxoaLZ9IZI3QPEtFsNc5wbIAsAmHcW8u5OqSO5Z3oW1C/sLJqkX6GzVef
E9c7k2+4GXsDVCb6YC/VqvR0shnQofg7EwFhqlfvxukrqA68Wem6y4KZoOnUs2WZ
oDnKyaKU+fCiP8UexyD0bad9qGNeNvoVS3yV0Hj8Wv/XlTWpZChi3bpcyQ70n5Aj
T+qyMq7DZ/tCEwVrFfNucEeDdxiwzch/QjEU/95ttDQFZ1QaXOHWENeBfNsS26fe
BTw9mWnNJCBJhwtp4gFrf6Z8OeRMByccfAcgYSX388zQB7ZZNd4E9hGOuwQrppJx
olr/gZqcjOPnsRynHL50T3rvQ1gtXKW2c19X67EBmi7cjg6x2RO3VPusCE1jVAAd
SxyHa8D9zN+Nx0M6TCo751FBgF4/W7BNtBO00cU1nfb2mv8060nn38S7WRIAPEm9
Dr6AGybIUR5rwl25p2Gev3E8aG9KrcV9i0V7T97+scsMMYHRIV4FknnghTSb4Lq9
E0Y12VDV6W2wo3v25Ny9Br4YLO7lq60NaJD/4y07qHR7Ktw4widLkxGDDGnGKu9F
5+qORB3Lh64Zfk/R8YjnyimGnW4y0F8kNs7fOuyXb01qdZguOQU=
=heBN
-----END PGP SIGNATURE-----

--doKZ0ri6bHmN2Q5y--

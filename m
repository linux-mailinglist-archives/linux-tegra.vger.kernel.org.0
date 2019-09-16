Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 852BFB3E37
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Sep 2019 17:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730026AbfIPP53 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Sep 2019 11:57:29 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37126 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730023AbfIPP52 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Sep 2019 11:57:28 -0400
Received: by mail-ed1-f65.google.com with SMTP id r4so555703edy.4
        for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2019 08:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1G2GyAcMjr+WReTYYdtI6usrVRqEUOo7wzjfE5a56v4=;
        b=CoK1gbCFBh6LsA/YvW8QQM9qYj8dT2lwlMYYcBahwlDvwfxJw9vpiOLJNzL0GNafpz
         Fg9uAmYYfRHeJdoGsNvUg/gvozckgedieDs3Ln9KjuXM0rLgvkLpF9YKlYoHBb3b6BRk
         y3ihXbbgGzWY02To1Z/2m+6YIJrX5GY1ePNc7EzNEajSFNBjZ/2MexD2qFYGgDmzezK2
         iqZT+s6Ym+8YNfFBq9wBIjneAMyhbRGVe/OoEIS1vZr63zStiMzZXrldhGOo0SRixAxn
         tHYgCmhMdt+TAFY5PlmJznWMSjAYg9m1KGInHzA/dExXtwkUpE3CfFlTgaOAKyIJnHHm
         /Q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1G2GyAcMjr+WReTYYdtI6usrVRqEUOo7wzjfE5a56v4=;
        b=ly/gNMGt2fbafJVZlcs4avbs6WuvKtJKHUasZoYhzTROE3EWOk1D8Bi5bWexKyanH2
         dZVmj9RgHsaWH5JBLd8hSqlwL8Y2rbs0jUMMKmens12ByLvdY1ZINY15ceLqrNQ0kRKo
         w267Ah87os4iFNhuRq7cb+vndMuHnrJPK8ObqB7M9kzTl+nbBwNpZIMjOVbCBv0x6dvr
         2n02zIHQTFXWKg6J/VpNL2AcfyKKjmnqE1+KdQ+cvk9zMosSiZHj6fzl/tdyJyBI0wSh
         tmU75o7q8DTkXNARmHnxRuXjm30enbnquiavvspzndJzlXhXea2sqNXrjYoZkhYpBUck
         pHUA==
X-Gm-Message-State: APjAAAVB1faCn6PeHEHrExUd9MXXCsZXRHHKe4p/YmCTf2Zv3/gsgN5p
        ft+XCPj0cLafZgWHV9bfyT8=
X-Google-Smtp-Source: APXvYqxTqyGYQ4NjhCx+qeS0QPFvKWpNnahbiy9luaj/D6ZMuw4FMUU7wqvL0oPHXxv5skAqmUepqw==
X-Received: by 2002:a50:9734:: with SMTP id c49mr63049160edb.93.1568649446935;
        Mon, 16 Sep 2019 08:57:26 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id k9sm1507855edr.88.2019.09.16.08.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 08:57:25 -0700 (PDT)
Date:   Mon, 16 Sep 2019 17:57:24 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Ben Skeggs <bskeggs@redhat.com>, linux-tegra@vger.kernel.org,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 08/11] drm/nouveau: tegra: Skip IOMMU initialization if
 already attached
Message-ID: <20190916155724.GG7488@ulmo>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
 <20190916150412.10025-9-thierry.reding@gmail.com>
 <156993ea-ece6-9eb5-b664-a55c631e2600@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4ndw/alBWmZEhfcZ"
Content-Disposition: inline
In-Reply-To: <156993ea-ece6-9eb5-b664-a55c631e2600@arm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--4ndw/alBWmZEhfcZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2019 at 04:29:18PM +0100, Robin Murphy wrote:
> Hi Thierry,
>=20
> On 16/09/2019 16:04, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > If the GPU is already attached to an IOMMU, don't detach it and setup an
> > explicit IOMMU domain. Since Nouveau can now properly handle the case of
> > the DMA API being backed by an IOMMU, just continue using the DMA API.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   .../drm/nouveau/nvkm/engine/device/tegra.c    | 19 +++++++------------
> >   1 file changed, 7 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drive=
rs/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> > index d0d52c1d4aee..fc652aaa41c7 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> > @@ -23,10 +23,6 @@
> >   #ifdef CONFIG_NOUVEAU_PLATFORM_DRIVER
> >   #include "priv.h"
> > -#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
> > -#include <asm/dma-iommu.h>
> > -#endif
> > -
> >   static int
> >   nvkm_device_tegra_power_up(struct nvkm_device_tegra *tdev)
> >   {
> > @@ -109,14 +105,13 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_=
tegra *tdev)
> >   	unsigned long pgsize_bitmap;
> >   	int ret;
> > -#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
> > -	if (dev->archdata.mapping) {
> > -		struct dma_iommu_mapping *mapping =3D to_dma_iommu_mapping(dev);
> > -
> > -		arm_iommu_detach_device(dev);
> > -		arm_iommu_release_mapping(mapping);
> > -	}
> > -#endif
> > +	/*
> > +	 * Skip explicit IOMMU initialization if the GPU is already attached
> > +	 * to an IOMMU domain. This can happen if the DMA API is backed by an
> > +	 * IOMMU.
> > +	 */
> > +	if (iommu_get_domain_for_dev(dev))
> > +		return;
>=20
> Beware of "iommu.passthrough=3D1" - you could get a valid default domain =
here
> yet still have direct/SWIOTLB DMA ops. I guess you probably want to
> double-check the domain type as well.

Good point. An earlier version of this patch had an additional check for
IOMMU_DOMAIN_DMA, but then that failed on 32-bit ARM because there the
DMA API can also use IOMMU_DOMAIN_UNMANAGED type domains. Checking for
IOMMU_DOMAIN_IDENTIFY should be safe, though. That doesn't seem to
appear in arch/arm, arch/arm64 or drivers/iommu/dma-iommu.c.

Thierry

--4ndw/alBWmZEhfcZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1/sOQACgkQ3SOs138+
s6G9lxAAqj/Wt4i1/qIqPUnA23oLf9oCnL1Yb6LcxcrqC2WAk/tKXoPLNaiPRm5y
zDP837onw4dnW5PuXrx/r6GiK6I6Uyo48t0Zx9VCqrM5ZJqCEQf95KhOp8vLEmap
LiCDigG53Gjr9oVRENvPzXpwZjaGtAX1R45K3Rl2PpGnkRQVMsznXpzkaKh2H4Pf
Vf2wv8PsNztbDeJKtEFbSDn3EOmKbZeBJ+XtYCl8sR40RLE1hmjT27kCBsNK9aBz
LAnPdU3noP5B356AIsJrcl7r12mBH/dEgfOvWEKAIraUefEBuzO6EgY9bavaPnfO
id/JMqq/A2J/2swMusvTkPx8OwI3aqf+1dMByXSyVNp0RtIJoJbWy3R4BjHDrjO9
gpZ7kaQ8TujNkSYF2TrKc1nHQtZfrcmniNAA+nI3utSbduEfbYKAagQpPqCh+/tn
Qo1bc08Pn2QOwfZwYtJOl68nPZ5PwBqyX2/yBPjqS2DY5yCyhLgP/HumMA4roFEQ
GYAUYaqaKzij6X6+J42UfE7O61N+uy50NfKQKtwjlc7m55H7UTglC+W0vR8jkav/
5qTd3p22XJ+Iw3JlO4Dh/nw9AE/VRHylsBBbcFWK9UjhiuB45dw5I56r16J+edlc
8c/KtpmQR+NmpVaj6NuQGuz7eJ3siyQqprRigyR0hi5ftgz23Fs=
=hD6x
-----END PGP SIGNATURE-----

--4ndw/alBWmZEhfcZ--

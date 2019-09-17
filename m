Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73C5FB48AD
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Sep 2019 09:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732078AbfIQH7j (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 17 Sep 2019 03:59:39 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46148 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727321AbfIQH7j (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Sep 2019 03:59:39 -0400
Received: by mail-ed1-f65.google.com with SMTP id t3so202104edw.13
        for <linux-tegra@vger.kernel.org>; Tue, 17 Sep 2019 00:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZHGwUNOCyjOPDdx+Yrefit8eCw93ObtYl/8hRGsz09E=;
        b=gFsLnygtUgh0OalHHJCYidLRZwxJE324ArlZhQpf8nQ6yarOj+CThBCq0+kDtbfwCL
         6vE9rjU3bg4Wr1Y9m8y64e+J1orAbMNXE5cAaphPnxOR660wWOepFEB/T64n6ElPb2lr
         8aQlkNCD9rR9U29a0WScUKtfe2UR98bHLlb4Vlj1rYic8VYuyAQmP7evNpOy3UYX5Qpt
         OJeXrudOo/d3fetiFy7Mld85PZeNn2FSeEUH5YW64axsHbDxZvvKqfwksp4dpJtQ8Gc3
         gvQGKrbzT2KJ8HTUn9BciFE2hiCD+S8pwrEJUf5pj/dj5fyYCf1/U9BXVXfNemgiUJzx
         qbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZHGwUNOCyjOPDdx+Yrefit8eCw93ObtYl/8hRGsz09E=;
        b=ZCu/3ATEfH6UNOHNrFzklipl1kgWdQ+N2OBKxbdzLtuWSgdJ4mdN+V4YJTktUdaxhI
         lPXJrPSK/R8fEfKKyXiWgJgvWCEkaIOQ9jxjZdLWa0Dl26BsBQhhwwzAF6LYFIP90UG9
         6iAP7esO3OomN4pHRZ7cgQTR8jPMkwzN4CjxQetX0B6SM3MZEifAq5RYyv11PR0ntNp2
         CQLT3nHMODlIShHyd08ZBMF4BT28K1LzinS6A7tKkV5X9JKvxYH/47atFmFFDRRCQpvZ
         f+XaY5YJe5YqT0rH+KZXGVCXu4Lvvaw1JABEZ5EQW0TwSmfOunLJE+8pauRe/q5K2Aw9
         iNWg==
X-Gm-Message-State: APjAAAWdDlBPTboKHOKXM1cTL+k6ghFcZxNaAMo39oHE+s/1mc5UH8mG
        Ku4qBJ5gKZ558lmyhqK2gSo=
X-Google-Smtp-Source: APXvYqzM+xCQRgTQDsb2mdu5TFdC68GXX72wg8XT5iVM/08xxe39qMIFdJKseU6I330sGm6I8Cj4mg==
X-Received: by 2002:a50:d096:: with SMTP id v22mr3291356edd.81.1568707176926;
        Tue, 17 Sep 2019 00:59:36 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id br15sm171293ejb.2.2019.09.17.00.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 00:59:35 -0700 (PDT)
Date:   Tue, 17 Sep 2019 09:59:34 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Ben Skeggs <bskeggs@redhat.com>, linux-tegra@vger.kernel.org,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 08/11] drm/nouveau: tegra: Skip IOMMU initialization if
 already attached
Message-ID: <20190917075934.GA17854@ulmo>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
 <20190916150412.10025-9-thierry.reding@gmail.com>
 <156993ea-ece6-9eb5-b664-a55c631e2600@arm.com>
 <20190916155724.GG7488@ulmo>
 <ee285d4f-e5ff-e043-35cd-1338b1bb238f@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <ee285d4f-e5ff-e043-35cd-1338b1bb238f@arm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2019 at 05:15:25PM +0100, Robin Murphy wrote:
> On 16/09/2019 16:57, Thierry Reding wrote:
> > On Mon, Sep 16, 2019 at 04:29:18PM +0100, Robin Murphy wrote:
> > > Hi Thierry,
> > >=20
> > > On 16/09/2019 16:04, Thierry Reding wrote:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >=20
> > > > If the GPU is already attached to an IOMMU, don't detach it and set=
up an
> > > > explicit IOMMU domain. Since Nouveau can now properly handle the ca=
se of
> > > > the DMA API being backed by an IOMMU, just continue using the DMA A=
PI.
> > > >=20
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > ---
> > > >    .../drm/nouveau/nvkm/engine/device/tegra.c    | 19 +++++++------=
------
> > > >    1 file changed, 7 insertions(+), 12 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/d=
rivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> > > > index d0d52c1d4aee..fc652aaa41c7 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> > > > @@ -23,10 +23,6 @@
> > > >    #ifdef CONFIG_NOUVEAU_PLATFORM_DRIVER
> > > >    #include "priv.h"
> > > > -#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
> > > > -#include <asm/dma-iommu.h>
> > > > -#endif
> > > > -
> > > >    static int
> > > >    nvkm_device_tegra_power_up(struct nvkm_device_tegra *tdev)
> > > >    {
> > > > @@ -109,14 +105,13 @@ nvkm_device_tegra_probe_iommu(struct nvkm_dev=
ice_tegra *tdev)
> > > >    	unsigned long pgsize_bitmap;
> > > >    	int ret;
> > > > -#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
> > > > -	if (dev->archdata.mapping) {
> > > > -		struct dma_iommu_mapping *mapping =3D to_dma_iommu_mapping(dev);
> > > > -
> > > > -		arm_iommu_detach_device(dev);
> > > > -		arm_iommu_release_mapping(mapping);
> > > > -	}
> > > > -#endif
> > > > +	/*
> > > > +	 * Skip explicit IOMMU initialization if the GPU is already attac=
hed
> > > > +	 * to an IOMMU domain. This can happen if the DMA API is backed b=
y an
> > > > +	 * IOMMU.
> > > > +	 */
> > > > +	if (iommu_get_domain_for_dev(dev))
> > > > +		return;
> > >=20
> > > Beware of "iommu.passthrough=3D1" - you could get a valid default dom=
ain here
> > > yet still have direct/SWIOTLB DMA ops. I guess you probably want to
> > > double-check the domain type as well.
> >=20
> > Good point. An earlier version of this patch had an additional check for
> > IOMMU_DOMAIN_DMA, but then that failed on 32-bit ARM because there the
> > DMA API can also use IOMMU_DOMAIN_UNMANAGED type domains. Checking for
> > IOMMU_DOMAIN_IDENTIFY should be safe, though. That doesn't seem to
> > appear in arch/arm, arch/arm64 or drivers/iommu/dma-iommu.c.
>=20
> Right, "domain && domain->type !=3D IOMMU_DOMAIN_IDENTITY" should be
> sufficient to answer "is the DMA layer managing my address space for me?"
> unless and until some massive API change happens (which I certainly don't
> foresee).

Might be a good idea to roll that up into a function to have a standard
way for drivers to check for this rather than open-coding the same
condition everywhere (and maybe get things wrong). As an additional
advantage, if that massive API change ever does happen we don't have to
go and update all the callers.

Something like this perhaps?

	static inline bool iommu_managed(struct device *dev)
	{
		struct iommu_domain *domain =3D iommu_get_domain_for_dev(dev);

		return domain && domain->type !=3D IOMMU_DOMAIN_UNMANAGED;
	}

Thierry

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2AkmMACgkQ3SOs138+
s6EcaA//TNs1sJ9eP9hen7EqmO83waX5OeHPZSc0qZBn2O5QDEi/myOyEDyyM99X
3kRZGNe8kWGgOeOdmNHHBufu8q4nC3OubH+qc6pC3iLCX7mTRUOKmY7WgMqk3min
mj3/Yy5+rTfxCAEpJJ3y3Ml29WoHxAPD00QjkZVZJe/Cnf6fZn4YX7iejfx6Fp+k
TSzICC9FWjVXxCbwLMw7iN79DCydNyLv9jRlZGHk9eJ1DUAwdtlWBNfqmQSSOI0B
Je1SuzT3AvL3kORC7vySzPF5PIn1VReXU2AgYKTBmtuAHhFOdBmUmCn629khTHqY
RUXmMm2uRhzA8y57egMTHZQkqO0XkBhv0KUECPKhCcWpjQjTjdmaLMWYrb5f5VD6
4/zLSbtyCH98PBd1amOJeIC7b8GXUbKJ0069kSTgleLRA0afMQEAM7sLKB3WSRdI
9Lw85Q3nxot/h+icCZwkM0wJsTmq7J34RZMmIIk4+b+1y9jnI+Edzb5rfD2hm410
W+vwRsfG60eEiQ8FiODNv9fmykn0eSc0IfJRL0TBTN4LQ5hV10Gh5b9HE/2rxnZE
vSFBxPBfBZxDw1BAtVp0qQyHqcWs2jzLkdNPpwr3pPm9HkkoNeusPbExaSJ00qD1
s1eW4oxqW0aywBubPduFvy2qmI+rGRfvRedOCHCEEz04haHJax4=
=UbIy
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--

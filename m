Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFDD8347DEB
	for <lists+linux-tegra@lfdr.de>; Wed, 24 Mar 2021 17:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbhCXQmO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 24 Mar 2021 12:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236432AbhCXQl7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Mar 2021 12:41:59 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89ACFC061763
        for <linux-tegra@vger.kernel.org>; Wed, 24 Mar 2021 09:41:58 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id x13so25104730wrs.9
        for <linux-tegra@vger.kernel.org>; Wed, 24 Mar 2021 09:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yFuD5kE4ig+KmNmiAK6IsVcqgLWwZ8COd231G21/TNc=;
        b=h+Mwwt/8E1OI/JatcAt4beMS9HJWlp1Vw37gQM4amdehoAS7zbJ847Wos9uNqSrIMT
         v4DmPcDNuWqZ0E4acMo9HW5fKjctgT9b1bVHZ6LFGNHg9hybkFBa8SO9FtqO7nSdTMmH
         apNM9aq1IzM8j6QOI9L0FxclukMpoIP23mL74ZX7kE6mPdUQaf4+feHSz2GB/Mn2oS5M
         /BqyrV/OvmbsUGRJsJdny2miRccYYol1/Azaka4h/FKf9ioMnoAI9vEn7oCDC61Yde7l
         vfd7stuKNpHFp3oL03mAIp4nTpSnl/efhP+EVlcZ/CWjqMVt+UVI533VQg/PzG0zds6c
         CfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yFuD5kE4ig+KmNmiAK6IsVcqgLWwZ8COd231G21/TNc=;
        b=BEmHLPD/KS73USLftBPLHXQSbCS3RnaWOISHzuhqFLDqai9hiaxtyBHNvwkeZXR8Lk
         3ckMBM2v/6B//hMeaFjrzaYAMc3isXX1AAHmKiKpfLZ+Jn4Wq3GSJ3j6cge7i2+81QxW
         kRGvPIGGJpD4nZMlG2RbkfBDAG1SWYIaYcbi7LCbwi2ZSFrw+qnk3DJzgBUgQ5kpeqEv
         oRmEmqife+0XDXZ0u9lK36+zgcsRLcYsGyVj0Qy5Jcz6Ipgo7iSrSuQkhe7n8Bb7IP6d
         kKFyVBkDMCkDrVnWOM4sGb1MFAKUNK7Jb4EYR/R0v/tnxET8+9NbjXCUXT0xLopCtkW2
         4GQQ==
X-Gm-Message-State: AOAM532Ey6b10vlTTwsKiSFRvOLVyj9a/y3lRiqwTk+lOI9IoqDMxJ5R
        rqSPhn2fWY73Zyo1gSvsPHU=
X-Google-Smtp-Source: ABdhPJzCRUXufe2Fne/B+cfq0D5xSWLekQ1bsdVejxsWFAxhD22yOGQSB2gfmh/gMoUF3ECa+JejeA==
X-Received: by 2002:adf:f2c3:: with SMTP id d3mr4509630wrp.380.1616604117203;
        Wed, 24 Mar 2021 09:41:57 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id k12sm4016371wrx.7.2021.03.24.09.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:41:56 -0700 (PDT)
Date:   Wed, 24 Mar 2021 17:42:17 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Mikko Perttunen <cyndis@kapsi.fi>, David Airlie <airlied@linux.ie>,
        James Jones <jajones@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 6/9] drm/tegra: gem: Add a clarifying comment
Message-ID: <YFtr6f3N3o11DfBc@orome.fritz.box>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
 <20210323155437.513497-7-thierry.reding@gmail.com>
 <21d2e691-6404-503b-422a-be97a7b9d1b4@gmail.com>
 <YFtUalHlk9YiH03n@orome.fritz.box>
 <c231415d-bb4c-6e8a-d384-4ded8f4d27d1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Bm2GMUcQ410Ig2yG"
Content-Disposition: inline
In-Reply-To: <c231415d-bb4c-6e8a-d384-4ded8f4d27d1@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Bm2GMUcQ410Ig2yG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 06:45:30PM +0300, Dmitry Osipenko wrote:
> 24.03.2021 18:02, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Mar 24, 2021 at 05:41:08PM +0300, Dmitry Osipenko wrote:
> >> 23.03.2021 18:54, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> Clarify when a fixed IOV address can be used and when a buffer has to
> >>> be mapped before the IOVA can be used.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>  drivers/gpu/drm/tegra/plane.c | 8 ++++++++
> >>>  1 file changed, 8 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/pl=
ane.c
> >>> index 19e8847a164b..793da5d675d2 100644
> >>> --- a/drivers/gpu/drm/tegra/plane.c
> >>> +++ b/drivers/gpu/drm/tegra/plane.c
> >>> @@ -119,6 +119,14 @@ static int tegra_dc_pin(struct tegra_dc *dc, str=
uct tegra_plane_state *state)
> >>>  		dma_addr_t phys_addr, *phys;
> >>>  		struct sg_table *sgt;
> >>> =20
> >>> +		/*
> >>> +		 * If we're not attached to a domain, we already stored the
> >>> +		 * physical address when the buffer was allocated. If we're
> >>> +		 * part of a group that's shared between all display
> >>> +		 * controllers, we've also already mapped the framebuffer
> >>> +		 * through the SMMU. In both cases we can short-circuit the
> >>> +		 * code below and retrieve the stored IOV address.
> >>> +		 */
> >>>  		if (!domain || dc->client.group)
> >>>  			phys =3D &phys_addr;
> >>>  		else
> >>>
> >>
> >> This comment is correct, but the logic feels a bit lame because it
> >> should be wasteful to re-map DMA on each FB flip. Personally I don't
> >> care much about this since older Tegras use pinned buffers by default,
> >> but this shouldn't be good for T124+ users.
> >=20
> > I'm not terribly thrilled by this either, but it's the only way to do
> > this when using the DMA API because we don't know at allocation time (or
> > import time for that matter) which of the (up to) 4 display controllers
> > a framebuffer will be shown on. tegra_dc_pin() is the earliest where
> > this is known and worst case that's called once per flip.
> >=20
> > When the IOMMU API is used explicitly, we always map framebuffers into
> > the IOMMU domain shared by all display controllers at allocation or
> > import time and then we don't need to pin at flip time anymore.
> >=20
> > I do have a work-in-progress patch somewhere that creates a mapping
> > cache to mitigate this problem to some degree. I need to dig that up and
> > do a few measurements because I vaguely recall this speeding up flips by
> > quite a bit (well, except for the very first mapping, obviously).
> >=20
> >> Perhaps dumb buffers should be pinned to display by default and then we
> >> should extend the Tegra UAPI to support BO mapping to display client(?=
).
> >=20
> > That would kind of defeat the purpose of a generic KMS UAPI.
>=20
> Couldn't the BOs be mapped when FB is created, i.e. by tegra_fb_create?

I suppose that would be possible. However, tegra_fb_create() doesn't
know a thing about display controllers, so we'd have to add extra code
to it to iterate over all display controllers and do a dma_map_sg() of
the GEM object for each of them.

It's also somewhat wasteful because now we get a mapping for each
framebuffer for each display controller. So if you've got, say, a four
UHD screen setup (which is something that Tegra194 supports), you could
end up with 8 UHD framebuffers (two for each display, for double-
buffering) at 32 MiB each for a whopping 256 MiB of memory that needs to
be mapped for each of the four display controllers. That 1 GiB worth of
page table updates, whereas you really only need one fourth of that.

Granted, this will make flipping a bit faster, and IOVA space isn't
really a problem on Tegra194. It would still waste a bit of RAM for all
those page table entries that we don't really need, though.

A mapping cache seems like a much better compromise because the cache
lookup should be quite fast compared to a mapping operation and we waste
just a couple dozen bytes per mapping perhaps as opposed to a few
megabytes for the gratuitous, preemptive mappings.

Thierry

--Bm2GMUcQ410Ig2yG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBba+YACgkQ3SOs138+
s6FELxAAmMPuIPItghRshGyfHVPKyetRGocZFsc1fq2C/XKkM9LELwDY7E1W6DPc
kOgCW4+6zUarpsLvuUgJErPIXQkIjjnHPrYere9Vz31/346jezJZWmod62XeFe7t
pVWs3s9/KZCeHmtk+q3nUeKBNvbHZ8+37f65L0qRUVfDibN5rhP2IK11ScgW7N8f
7jTWzxNygsnQGvkKnaniQH9e3hJre7Kj3QUCE+vTGgHwcT2XNCKPnSslbMZ01JcD
vTMdU6XLw2VZixBIfJeAfMjcAhWVIielLMEwjQHnifn3NL12PwmyzVkczfaFuoZF
K5HXv8MEhixrNYQbQhUHH4u/IDT7g8tXII5SgvgVUrDNmVcTMsO7ZvO3M3t/GJ/I
oq3w1OzJpL0DDb+2eE19BUHSvanbyiCAXRD/ukjvKMiXvxYQLk1r+agi3q9SlEzX
/Pr5JUyeesJgQ2TThRhlbFzENV5E6vLMju+RqnLTa+Ol5fVuS8M1yTHhnAf8J2Ij
S/DcKdYT4XGn6TuKodp7zTH+4G7HQmOXFrg8nyohZZI+zWYYrzOoZTweGUuipLlY
GFq8xddYl29Yd9+0SUVh5k3C4k/0PhWUtj2N8XXTIc8MYng7CmRuCAau1k+M4RYg
mQ6LyCjEvgjfS9vwBp/dzmc2iL3ZL+r5Ccq3nvgxTMg/nATtmvY=
=tfpk
-----END PGP SIGNATURE-----

--Bm2GMUcQ410Ig2yG--

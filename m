Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEC0020AD3D
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jun 2020 09:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgFZHef (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Jun 2020 03:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgFZHef (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Jun 2020 03:34:35 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D4FC08C5C1
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2020 00:34:34 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id h15so8445707wrq.8
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2020 00:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QrHJMYmFvRuS0JNwNeJK8Q48bdBNPHoEUry2smUVwlA=;
        b=t1yTOHM5uewpX2Ibxw9hTk6UltxJUR+eQlloeDlZ1RkDLCx0pIgixSJ+U2qh1CkoYN
         HzNQEeVR33ve3nyrLhDkVXVnLYJyY1NU5idpblx/WbSUXf+defCyzWXfQNfbkr2NJtdC
         aqqnthTde3ILcbUN0ePVxmXyNAIyrQ0N2gqZYtugNFyUp/geBhlHwp+cdLWjrDVuWoev
         WuNCZHJ2nqNjLSdd1UWwW50Q4fhDtoTl9qHdOXDsts8cuT79gpXiwyd6puM9E0j2B3Vc
         lrOoGU//1kRhT2X8ikydcIcF0c8ECyLLtU7ReXG9zjd2yYNtf1T4LaYDnieyGCqIeFE4
         b/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QrHJMYmFvRuS0JNwNeJK8Q48bdBNPHoEUry2smUVwlA=;
        b=FdHJVYpcCj2BCILxmiez+pLJOcQnJeHcKyq+vq66nEpTO6V4aeODfnSICUj6qIM4/Q
         TkBYY8rIPoP8OktQPyBHVP3BKkFyjJ5kegDTdWSMfiEVgcKng0izTiwhKaQggqZDV6wc
         /i1XZaIv65N5BPmNRXriRXxsVuYDGJ6iZSAWwKzxM4tndLOrKfJL+XRaA2iOfAFivYh7
         o52TLsvEWKSatZHnDfTbpLCTWaM89u5e/fWCBhOqEiURh3zu8rH7c18+v5s5MeC+TKEx
         GkKSKVRgbzhAcVbP6+FCwlhUKqpWxOqvbCHdbaN6QspAhxunxYBTaiopnsK9ti9KXU/r
         vD5w==
X-Gm-Message-State: AOAM532y9hqzxU69Jhd0ReFAGhHKVVb+UW3Th3OxhhihBbkbJAE8S0b6
        J7cBnuL3P2YA+Tt/RBEao0M=
X-Google-Smtp-Source: ABdhPJxTQRpH+93ohQ2kxQEvYVpvblRPLUz1F2Tl7te1mMGZmXw9+JCOMtRPHN5ZaS6na2R248Jcqw==
X-Received: by 2002:a5d:60d1:: with SMTP id x17mr2208372wrt.293.1593156873424;
        Fri, 26 Jun 2020 00:34:33 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o82sm16707891wmo.40.2020.06.26.00.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:34:31 -0700 (PDT)
Date:   Fri, 26 Jun 2020 09:34:30 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Mikko Perttunen <cyndis@kapsi.fi>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_channel_map)
Message-ID: <20200626073430.GA3109062@ulmo>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <4f9ddf30-ad8d-3750-20d7-867be17a1006@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
In-Reply-To: <4f9ddf30-ad8d-3750-20d7-867be17a1006@gmail.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2020 at 01:47:46AM +0300, Dmitry Osipenko wrote:
> 23.06.2020 15:09, Mikko Perttunen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > ### DRM_TEGRA_CHANNEL_MAP
> >=20
> > Make memory accessible by the engine while executing work on the channe=
l.
> >=20
> > ```
> > #define DRM_TEGRA_CHANNEL_MAP_READWRITE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (1<<0)
> >=20
> > struct drm_tegra_channel_map {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * [in] ID of the chann=
el for which to map memory to.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 channel_id;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * [in] GEM handle of t=
he memory to map.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 handle;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * [in] Offset in GEM h=
andle of the memory area to map.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Must be aligned by 4=
K.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 offset;
>=20
> Could you please give a use-case example for this partial mapping?
>=20
> I vaguely recalling that maybe it was me who suggested this in the past..
>=20
> I kinda see that this could be useful for a case where userspace
> allocates a large chunk of memory and then performs sub-allocations in
> the userspace driver. But do we have a real-world example for this right
> now?

I think the main point about this IOCTL was to make mapping/unmapping
more efficient and avoid relocations for situations where we know it is
safe to do so.

The fact that this can be used to create partial mappings is mostly just
an added bonus, in my opinion. Doing this doesn't create much complexity
but in turn gives us a lot more flexibility.

A couple of places where I think this could be useful are OpenGL and
Vulkan, both of which support buffer suballocation. This has a couple of
advantages on modern GPUs where sometimes you want to use very large
allocation granularity, etc.

Now, I don't think that we'll see much of that in Tegra DRM directly,
although grate could certainly make use of this, I suspect. However, I
think for interoperation of dGPU and Tegra DRM (with VIC for post-
processing, or hopefully some of the other hardware acceleration
engines at some point), this might come in handy.

There are other possible use-cases within just Tegra DRM as well. We may
want to only partially map planar buffers for video post-processing, for
example. Or map each plane separately.

> Please see more below.
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * [in] Length of memor=
y area to map in bytes.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Must be aligned by 4=
K.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 length;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * [out] IOVA of mapped=
 memory. Userspace can use this IOVA
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 directly=
 to refer to the memory to skip using relocations.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 Only ava=
ilable if hardware memory isolation is enabled.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 Will be =
set to 0xffff_ffff_ffff_ffff if unavailable.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 iova;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * [out] ID correspondi=
ng to the mapped memory to be used for
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 relocati=
ons or unmapping.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 mapping_id;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * [in] Flags.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 flags;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 reserved[6];
> > };
>=20
> It looks to me that we actually need a bit different thing here.
>=20
> This MAP IOCTL maps a portion of a GEM and then returns the mapping_id.
> And I think we need something more flexible that will allow us to use
> GEM handles for the relocation IDs, which should fit nicely with the
> DMA-reservations.
>=20
> What about an IOCTL that wraps GEM into another GEM? We could wrap a
> portion of GEM_A into a GEM_B, and then map the GEM_B using the MAP IOCTL.
>=20
> It could be something like this:
>=20
> ### DRM_TEGRA_BO_WRAP
>=20
> struct drm_tegra_wrap_bo {
> 	__u32 bo_handle_wrapped; // out
> 	__u32 bo_handle;         // in
> 	__u64 offset;
> 	__u64 length;
> };
>=20
> ### DRM_TEGRA_CHANNEL_MAP
>=20
> struct drm_tegra_channel_map {
>         __u32 channels_mask;
> 	__u32 mapping_id;
>         __u32 bo_handle;
>         __u32 flags;
>         __u64 iova;
> };
>=20
> =3D=3D=3D
>=20
> This allows multiple mapping_ids to have the same backing GEM, so the
> mapping_id could be resolved into a BO during of job's submission for
> the DMA-reservations handling.

That's pretty much what we have already above, isn't it? Just because we
call the field "mapping_id" doesn't mean that in the background we can't
create a GEM object and return it's handle as "mapping_id".

One advantage of Mikko's proposal is that we have a single IOCTL rather
than two to create the mapping, making it a bit more lightweight.

Thierry

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl71pQEACgkQ3SOs138+
s6FBPA//ees8+4iH1GmtteSTD1dHnVsCMhC7yR3zFIckKquMhvtgXDKfYFNLAoZy
Vs11A2BitISCPLwxrHXPe6OclNMgbMNtO4SfmopuZn0fBpgtj1it/gYujNEttH+G
d/u5Eyj9mo9TR+E9tEsCfs8syROohRJfKHP87b2pPduUQmvExvOS+dWSIru7k9ZY
P+kTHc3rDrrpp52bix4Q5bcJkwcDj+xr0jJAGT9vujWskKTtLR2gEihYxh//fEMH
iYXaaXSUBTfzQDksc+yh3yKHb3hlblwx7Duy/6yyPZ6p00+Iy6TTYygsrAlVn8ZN
18PPKTzNJ2Y4zFxt9k2D2T8taeokkX01dC2cUEDa6DdcOvsSgDz5CylnaEDmQK/H
WnKnJ/RevcYeeL6UwukC+Nf1E5LrwSVejQM8RgaNtSvFr0FxVN6Dxm2OHO8JETPb
CjVTidd+pCbJxW10wyj66Q9e69bCJc1o+IfJ3ogg3qnPyTq/MDINoGTx/aglXULo
DXBX85p0GeLKD3GgbYI/f8pS5kW+oHFRoGZGyxC+0Fc8FQMXdNss7I5okCzb0jCp
mMj3Ss/wX0RYtMg69F2LcuDgOfKU86xSWQ8HVcUL3Lhnbos02GJ/EvW4gZa03b6/
26UlJki3OUIu8H0Zbp/l/B8UHk1531T/9gpGpCjBu2/fpYbtaLQ=
=3pd5
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--

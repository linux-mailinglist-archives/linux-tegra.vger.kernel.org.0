Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB139345CB3
	for <lists+linux-tegra@lfdr.de>; Tue, 23 Mar 2021 12:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhCWLVm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 23 Mar 2021 07:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbhCWLVO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 07:21:14 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 586A0C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 04:21:13 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w18so23037274edc.0
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 04:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HrWzdh2jiJTDkJYKElndrRaLdCJHi5wmstMVELw6yos=;
        b=dyLakeaojRHfMluKOxgOqpcJvBo/nK3lhE4WzLDspahcCIWTSREJPieoRD0qYx0mAB
         Z7QKSMr5OAFNs4ouYYEfzKM6LHjAA4D/bGf8EPCHst6Tdbf24YNC2Lp9kswQfIr7GYe3
         Xtt5vc3jo0GoUSzHABzxi7XT0If4KAbOBax8Ax/5R3KvTRxte34c26PRqo0DKmKvOhgM
         eIC/XmQaQAPkrFXnklkRTPqRk4W6N2ZtQVkXoUJYNsjdOt1bmk5Yo7ZvqPoTbCL50TXS
         QAdxr0JhD6eAGFo7jDeoiuSyo4BCetOJ6XeFAPlzRgFGKHdcGabKtn0cX2vMTIthpuKt
         EiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HrWzdh2jiJTDkJYKElndrRaLdCJHi5wmstMVELw6yos=;
        b=VzJOb/7be2T0HMQkF9gOYxeCjpyE7qbV33rxZsgN/Zum5spFCmOCsgUMNUE1JLHEva
         tfBRGMQV5wDmIrgPlfFabrsNKCsOL+xy/F0leDPfS4xJ+iUqvO1Se85RD8U6SnX4g11W
         caUhonQ/P6ZI3ee3kbqVO7kklJom3WFCZwUyp1GAbLKUv0L4cbmUVkQZHizQO1ASGUGS
         dBYMsPr2NlQ1H3ltDzjOp+jPNsdWCHDi4oPrm7PtlLU2pk78Br8DfSRjAzIBp9/UCT82
         MlL3C58QZ86tcNcPHWnO+6d7etTkBJtTMSnEIjmsQIdv0Ey419lPOWwZoISYNLax9tdX
         aYNA==
X-Gm-Message-State: AOAM532ysS6s/15+GWxq3/JuAvss/xw6sYIojNKlySq632gY8/6rMg5E
        yZdXu65sHOGyYJ4s41D/UYU=
X-Google-Smtp-Source: ABdhPJwhAm3tTxF7gP5tkWCtxvhCBP36KBSwfyrjCJTFPDNcJJ46jb3BaPU0srokGiY7lrGYldp25Q==
X-Received: by 2002:a50:bb47:: with SMTP id y65mr4138981ede.305.1616498472009;
        Tue, 23 Mar 2021 04:21:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g11sm12757962edt.35.2021.03.23.04.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 04:21:10 -0700 (PDT)
Date:   Tue, 23 Mar 2021 12:21:31 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com,
        digetx@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-tegra@vger.kernel.org, talho@nvidia.com,
        bhuntsman@nvidia.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 06/21] gpu: host1x: Cleanup and refcounting for
 syncpoints
Message-ID: <YFnPO+aMw+QpkycT@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-7-mperttunen@nvidia.com>
 <YFnEpcHRDqhQPPom@orome.fritz.box>
 <6e4340b2-bde0-6811-866c-048997d434fe@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mcsWyr2YFL9WCSPD"
Content-Disposition: inline
In-Reply-To: <6e4340b2-bde0-6811-866c-048997d434fe@kapsi.fi>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--mcsWyr2YFL9WCSPD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 12:44:28PM +0200, Mikko Perttunen wrote:
> On 3/23/21 12:36 PM, Thierry Reding wrote:
> > On Mon, Jan 11, 2021 at 03:00:04PM +0200, Mikko Perttunen wrote:
> > > Add reference counting for allocated syncpoints to allow keeping
> > > them allocated while jobs are referencing them. Additionally,
> > > clean up various places using syncpoint IDs to use host1x_syncpt
> > > pointers instead.
> > >=20
> > > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> > > ---
> > > v5:
> > > - Remove host1x_syncpt_put in submit code, as job_put already
> > >    puts the syncpoint.
> > > - Changes due to rebase in VI driver.
> > > v4:
> > > - Update from _free to _put in VI driver as well
> > > ---
> > >   drivers/gpu/drm/tegra/dc.c             |  4 +-
> > >   drivers/gpu/drm/tegra/drm.c            | 14 ++---
> > >   drivers/gpu/drm/tegra/gr2d.c           |  4 +-
> > >   drivers/gpu/drm/tegra/gr3d.c           |  4 +-
> > >   drivers/gpu/drm/tegra/vic.c            |  4 +-
> > >   drivers/gpu/host1x/cdma.c              | 11 ++--
> > >   drivers/gpu/host1x/dev.h               |  7 ++-
> > >   drivers/gpu/host1x/hw/cdma_hw.c        |  2 +-
> > >   drivers/gpu/host1x/hw/channel_hw.c     | 10 ++--
> > >   drivers/gpu/host1x/hw/debug_hw.c       |  2 +-
> > >   drivers/gpu/host1x/job.c               |  5 +-
> > >   drivers/gpu/host1x/syncpt.c            | 75 +++++++++++++++++++----=
---
> > >   drivers/gpu/host1x/syncpt.h            |  3 ++
> > >   drivers/staging/media/tegra-video/vi.c |  4 +-
> > >   include/linux/host1x.h                 |  8 +--
> > >   15 files changed, 98 insertions(+), 59 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > > index 85dd7131553a..033032dfc4b9 100644
> > > --- a/drivers/gpu/drm/tegra/dc.c
> > > +++ b/drivers/gpu/drm/tegra/dc.c
> > > @@ -2129,7 +2129,7 @@ static int tegra_dc_init(struct host1x_client *=
client)
> > >   		drm_plane_cleanup(primary);
> > >   	host1x_client_iommu_detach(client);
> > > -	host1x_syncpt_free(dc->syncpt);
> > > +	host1x_syncpt_put(dc->syncpt);
> > >   	return err;
> > >   }
> > > @@ -2154,7 +2154,7 @@ static int tegra_dc_exit(struct host1x_client *=
client)
> > >   	}
> > >   	host1x_client_iommu_detach(client);
> > > -	host1x_syncpt_free(dc->syncpt);
> > > +	host1x_syncpt_put(dc->syncpt);
> > >   	return 0;
> > >   }
> > > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > > index e45c8414e2a3..5a6037eff37f 100644
> > > --- a/drivers/gpu/drm/tegra/drm.c
> > > +++ b/drivers/gpu/drm/tegra/drm.c
> > > @@ -171,7 +171,7 @@ int tegra_drm_submit(struct tegra_drm_context *co=
ntext,
> > >   	struct drm_tegra_syncpt syncpt;
> > >   	struct host1x *host1x =3D dev_get_drvdata(drm->dev->parent);
> > >   	struct drm_gem_object **refs;
> > > -	struct host1x_syncpt *sp;
> > > +	struct host1x_syncpt *sp =3D NULL;
> > >   	struct host1x_job *job;
> > >   	unsigned int num_refs;
> > >   	int err;
> > > @@ -298,8 +298,8 @@ int tegra_drm_submit(struct tegra_drm_context *co=
ntext,
> > >   		goto fail;
> > >   	}
> > > -	/* check whether syncpoint ID is valid */
> > > -	sp =3D host1x_syncpt_get(host1x, syncpt.id);
> > > +	/* Syncpoint ref will be dropped on job release. */
> > > +	sp =3D host1x_syncpt_get_by_id(host1x, syncpt.id);
> >=20
> > It's a bit odd to replace the comment like that. Perhaps instead of
> > replacing it, just extend it with the note about the lifetime?
>=20
> I replaced it because in the past the check was there really to just check
> if the ID is valid (the pointer was thrown away) -- now we actually pass =
the
> pointer into the job structure, so it serves a more general "get the
> syncpoint" purpose which is clear based on the name of the function. The =
new
> comment is then a new comment to clarify the lifetime of the reference.

Alright, makes sense.

> >=20
> > >   	if (!sp) {
> > >   		err =3D -ENOENT;
> > >   		goto fail;
> > > @@ -308,7 +308,7 @@ int tegra_drm_submit(struct tegra_drm_context *co=
ntext,
> > >   	job->is_addr_reg =3D context->client->ops->is_addr_reg;
> > >   	job->is_valid_class =3D context->client->ops->is_valid_class;
> > >   	job->syncpt_incrs =3D syncpt.incrs;
> > > -	job->syncpt_id =3D syncpt.id;
> > > +	job->syncpt =3D sp;
> > >   	job->timeout =3D 10000;
> > >   	if (args->timeout && args->timeout < 10000)
> > > @@ -380,7 +380,7 @@ static int tegra_syncpt_read(struct drm_device *d=
rm, void *data,
> > >   	struct drm_tegra_syncpt_read *args =3D data;
> > >   	struct host1x_syncpt *sp;
> > > -	sp =3D host1x_syncpt_get(host, args->id);
> > > +	sp =3D host1x_syncpt_get_by_id_noref(host, args->id);
> >=20
> > Why don't we need a reference here? It's perhaps unlikely, because this
> > function is short-lived, but the otherwise last reference to this could
> > go away at any point after this line and cause sp to become invalid.
> >=20
> > In general it's very rare to not have to keep a reference to a reference
> > counted object.
>=20
> Having a reference to a syncpoint indicates ownership of the syncpoint.
> Since here we are just reading it, we don't want ownership. (The non _nor=
ef
> functions will fail if the syncpoint is not currently allocated, which wo=
uld
> break this interface.) The host1x_syncpt structure itself always exists e=
ven
> if the refcount drops to zero.

Ah... you're right. host1x_syncpt_put() on the last reference doesn't
actually cause the backing memory to be freed. That's a bit counter-
intuitive, but I don't see why that can't work.

> > >   	if (!sp)
> > >   		return -EINVAL;
> > > @@ -395,7 +395,7 @@ static int tegra_syncpt_incr(struct drm_device *d=
rm, void *data,
> > >   	struct drm_tegra_syncpt_incr *args =3D data;
> > >   	struct host1x_syncpt *sp;
> > > -	sp =3D host1x_syncpt_get(host1x, args->id);
> > > +	sp =3D host1x_syncpt_get_by_id_noref(host1x, args->id);
> >=20
> > Same here. Or am I missing some other way by which it is ensured that
> > the reference stays around?
>=20
> As above, though here we actually mutate the syncpoint even though we don=
't
> have a reference and as such ownership. But that's just a quirk of this o=
ld
> interface allowing incrementing of syncpoints you don't own.

Yeah, doesn't actually make anything worse.

Thierry

--mcsWyr2YFL9WCSPD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZzzsACgkQ3SOs138+
s6FKpg//eYzrfaluXgCFsFF+i4YQlBuR94IZBF82TqWU6rsTS5k5qtrT5LicjTHA
rQTQpcBJXqkz//6QYNBYk26lUAAIHThPYqipMHY15DRwRH8YzTxu3ZdB+DKB/eKw
iXTqX2Gk96sc7d5fV32QBUSllyhqE5oXEVKV80F0CQRBLGDaLDWEkIglwXOTo7fd
AnU3agAi5V90nby9oNWH64nHka1CYcMSpRAbEqcvqY+YAVNt5XF05K8DsBHoSn/w
yRWFgQEyuOOYfpXKMvOx5UZlOTRy8tQqaf+daHcyIvJhXAhnd1ELrKyYZEvFFFK0
/LLGg77hqoLzff/qWlhedIfF+LzEHLPY6m+7ptNjuvoxtAfXRbz0sIWBY5pbklr6
qT9DjfV5T8Kx3j6Z16jz4L0c1uOgxeQulEZ44D1wR2EZ3TFpCxt6E4umHkjP11vr
ZVgWVllHxa/e7zAI7+LvIJzo4N5XurjD8IjvFEA78XtumiL49oT8xJbzHP4XcEIj
QTMabxPtDVlJaubspCVaWzJFksaXwC5I4HWcv+W6h+1YSx18yh8j3SsrMGfDxuqt
FVeaI3fFfQXtnnm8pzzRht0mu/bdrjNABdrqimLjLwXW3vflyyvd9SIhl6OftwaM
7UHBoVgQ64EamHPRATPnhqtiaYdF5g8ZOXn306JnZvn9nEZMupY=
=BPLi
-----END PGP SIGNATURE-----

--mcsWyr2YFL9WCSPD--

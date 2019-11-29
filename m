Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 215A210D3B5
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Nov 2019 11:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfK2KNA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 29 Nov 2019 05:13:00 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36632 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbfK2KNA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Nov 2019 05:13:00 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so8487792wma.1
        for <linux-tegra@vger.kernel.org>; Fri, 29 Nov 2019 02:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oa7MiYiAk5GrxWDt6PpZGpH2IjwbXlZEtryLiXI8D8E=;
        b=fsAUQ8Y0riz0EYLZhYjBnfBnCGqaXg+wiYPsPKoaTQkcQr8HnDt5/7jSLH2UQF7ZKO
         COqhqgavG6Bn7frGTCGPkY362hbvcCgVT68Se8P60CgUsT49rvFfjzoAvzUGqkEUOJG0
         GeRNe53KrZmesqHkE4tX+lN0miAcI12TGw25RMhBQb+khjxJdpXCxRTc57OmWTcDkVsS
         g/0TG1QnkziLJVRZkIiVZKCAQpRVrVzmkXX8H2GSY8JTmv65Yp/nxZ/G7TnNptaEboQ+
         BKk4XYTe8yG2L1a8mcK/AHiUoJI3nd2yB3jmw8g6EPqBEAdkdzdHFTPsV1NE/UOeN6yq
         vNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oa7MiYiAk5GrxWDt6PpZGpH2IjwbXlZEtryLiXI8D8E=;
        b=J3p6ZrUVVoKpS9ZaAwdoAW3FegpU2Fid29k6qHL6xeMIG5c+UtA0KsbAEG2tiC7m1a
         FXM8u7nb1/K8Txj3TiG+e+wxOHdPKv5Jud8VHrUy4UHvrE2S9CMbKy/BVhxKMqfxOjJM
         oZUWbmACKbec7HASHgthkxXHr7Y0+vmodjHyCP72fLFH+BzztmevNVHHhsKANf+llSto
         tg5CIHh4ZXQYS4MgbSSdWAvnzbweBbGeBVnrjj8iV/Y8tmxCLaBIDpF5Yd2p2PHwBRtA
         btuZNvmGKV+QQVR+nEjFlB7uC0J9zIHib9FNU624BqU2VbQSHhy4m5XTgKBHTBvlQ7H/
         SNQQ==
X-Gm-Message-State: APjAAAUwejTJixRaAgXRtItHASKnMHKXcM5N6yM5ZBOahqUAeO+pncwd
        Qli0Fbve+HDDSERUrBK1+pc=
X-Google-Smtp-Source: APXvYqxJzGJerIqg15/1EiUFWI6AzJxxWKBtqCrQsjszXmOjTkkY7pPk99+aVSYcHG0HDrmdqv/4eA==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr13087966wmh.82.1575022378007;
        Fri, 29 Nov 2019 02:12:58 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id d9sm25232647wrj.10.2019.11.29.02.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 02:12:56 -0800 (PST)
Date:   Fri, 29 Nov 2019 11:12:55 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm/tegra: hub: Remove bogus connection mutex check
Message-ID: <20191129101255.GA2771912@ulmo>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-2-thierry.reding@gmail.com>
 <20191129090643.GA624164@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
Content-Disposition: inline
In-Reply-To: <20191129090643.GA624164@phenom.ffwll.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2019 at 10:06:43AM +0100, Daniel Vetter wrote:
> On Thu, Nov 28, 2019 at 04:37:33PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > I have no recollection why that check is there, but it seems to trigger
> > all the time, so remove it. Everything works fine without.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/tegra/hub.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> > index 6aca0fd5a8e5..e56c0f7d3a13 100644
> > --- a/drivers/gpu/drm/tegra/hub.c
> > +++ b/drivers/gpu/drm/tegra/hub.c
> > @@ -615,11 +615,8 @@ static struct tegra_display_hub_state *
> >  tegra_display_hub_get_state(struct tegra_display_hub *hub,
> >  			    struct drm_atomic_state *state)
> >  {
> > -	struct drm_device *drm =3D dev_get_drvdata(hub->client.parent);
> >  	struct drm_private_state *priv;
> > =20
> > -	WARN_ON(!drm_modeset_is_locked(&drm->mode_config.connection_mutex));
>=20
> I suspect copypasta from the mst private state stuff, which relied on this
> lock to protect it. Except your code never bothered to grab that lock (or
> any other) so was technically broken until we added generic locking in
>=20
> commit b962a12050a387e4bbf3a48745afe1d29d396b0d
> Author: Rob Clark <robdclark@gmail.com>
> Date:   Mon Oct 22 14:31:22 2018 +0200
>=20
>     drm/atomic: integrate modeset lock with private objects
>=20
> Hence this is now ok to drop, originally it wasnt.
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Great, thanks for pointing that out. I'll update the commit message with
that explanation.

> Aside: You're single-thread all your atomic updates on the hub->lock,
> which might not be what you want. At least updates to separate crtc should
> go through in parallel. Usual way to fix this is to add a
> tegra_crtc_state->hub_changed that your earlier code sets, and then you
> walk the crtc states in the atomic commit (only those, not all, otherwise
> you just rebuild that global lock again), and then only grab the hub state
> when you need to update something.

I'm confused. Where do you see hub->lock? Did you mean wgrp->lock?

Thierry

--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3g7ycACgkQ3SOs138+
s6GOuQ/9HuycDIjBfg0rCdiRffTMfRaOWBHBnpkbzza9RvHQklg7RTWpqLMSe/iS
gkgagWGI5SQDygWi+WQK9hGJsR7iKv6GzZ62Bsza+TWKN10mYB6bUtjsLKGTIAYu
NRTs045Oa5xi0KKWfGnvFv2/gVM89TnjiJ+wf6CGQM5LHNkA4DfNokfyeIEFsw0p
xNAja97cocFh2I8ba9zDoXAJUGqgjhttqlfpgiQ3Bu02QpfDW46YjkWOBYF/6zmI
RbgAviKyrfxOAjEGfZBoHzWpOXMgq5Hz1TEQctznmhQy7MYEbPEFe7mPGFOPmOpU
ZG423NHBxG0tfz+SE2dME2nSQ9d8bywl2Gf9wPpyENAXvmlxUtTCFuZe340zKBN9
xz+tZWSvMS20qY0SuBjoT2D0r8P+pL6yxkram4FPBcTZc9TZxD1tmSuK8JR+iBws
2u7U2gt2IZwx4f2AOzoXL3akdKDlDNnRD1YRiQCtHEp37gZODYWWIjtU3n+UjPco
QTeAY54uzteREIYZbKtkPCezbPenQSFk70x1+8w6DSDNazHCGn5vuwAk/OxLWpnA
W4Qg27ytBi6ZoPO0F7amgz/rqrJTpq9zvJMU1wDaq+YoYfFlwzpFYkh1i3JKgFQR
kl7iOTfFGTVTxFMCI1yHU+NzAXNWcP5yRSmFpSFpqdZ5f2msSuM=
=wr9b
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA4A10EC11
	for <lists+linux-tegra@lfdr.de>; Mon,  2 Dec 2019 16:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbfLBPIO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 2 Dec 2019 10:08:14 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46693 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbfLBPIO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Dec 2019 10:08:14 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so41251551wrl.13
        for <linux-tegra@vger.kernel.org>; Mon, 02 Dec 2019 07:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gYOCCjZTbeC8RCJP/PsDR1y6a+nLRgHIwvI+k14PymE=;
        b=NB7hAVN+C/Hx4AGsWeOT9uX2qbM2LJXcorxOWhPFNAlKbkbZloiDwW63PnzfkzlHWY
         X3cDipl4i2KXzXWOOPcxz7ya4ruy8T0caFtluSbv6ZEj9KotT93DzPqei9RcHSs1qwqb
         IO0MAGVgilzN+ALUp8zK2ZnPgTThUsz8Xos63cSWxkNN586y8DjlLsfZqfNGlh6YgCQe
         0DhvdBWalJbK0e29wqF4GpROSObgmGk+5feO+sleOjdgvSoqNh3oZSvNlzmvUTyhFTt0
         oWxlCtZJ1/XRXPvD2zMVfw3hb30FDWJrA+pD8RwTFacGVzbUR7TUR9OYZD5C0i0f5m5s
         o9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gYOCCjZTbeC8RCJP/PsDR1y6a+nLRgHIwvI+k14PymE=;
        b=KtwEbX8bHNVPqwsGcfQaumEE3mmhgKIA0ZFcLvj9oYv1dpf/YKsjyLf06f+8AhRRPk
         giLtp62C+86nfoumaOkDx8GdKTTxiXfvlJZntDFbVqQ4ztmz77snRPMBmv5rQeTZVwub
         knE3qIIscedW8KgmpOwcxXV/sLWmwdmlcSGGIka6fToGo2+faUFXM6yXarYJ9OoGqxaz
         sHDqZEsU2p15b40kBSsCUp6PzmP9naWxqN4fHlJJeCTdKff/TMHEQ/taO2CYs4GIJDlK
         +N8YxrTIhNWqjGJCOyqnFem06+NfAGO8CFdcVizE4hYHWRQcjN5EbX7lnqlQbxK3qBNR
         AS3A==
X-Gm-Message-State: APjAAAX3AijY8q1MvxF1yI2zDZXLa46XrTm+IZf7XtITSUQ0Ty+Kz5me
        7lKD3FI1FykPPqdz0HbldbY=
X-Google-Smtp-Source: APXvYqy1xjzNwQKH98/eXjHIKuumKkDX6yjpjtH2hlgSOswKnG9D4Xql0biaYWYH3UFKgEsYnydp3A==
X-Received: by 2002:adf:ffc5:: with SMTP id x5mr30434304wrs.92.1575299291338;
        Mon, 02 Dec 2019 07:08:11 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id d20sm40627696wra.4.2019.12.02.07.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 07:08:10 -0800 (PST)
Date:   Mon, 2 Dec 2019 16:08:03 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm/tegra: hub: Remove bogus connection mutex check
Message-ID: <20191202150803.GC56608@ulmo>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-2-thierry.reding@gmail.com>
 <20191129090643.GA624164@phenom.ffwll.local>
 <20191129101255.GA2771912@ulmo>
 <20191129190309.GM624164@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
Content-Disposition: inline
In-Reply-To: <20191129190309.GM624164@phenom.ffwll.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2019 at 08:03:09PM +0100, Daniel Vetter wrote:
> On Fri, Nov 29, 2019 at 11:12:55AM +0100, Thierry Reding wrote:
> > On Fri, Nov 29, 2019 at 10:06:43AM +0100, Daniel Vetter wrote:
> > > On Thu, Nov 28, 2019 at 04:37:33PM +0100, Thierry Reding wrote:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >=20
> > > > I have no recollection why that check is there, but it seems to tri=
gger
> > > > all the time, so remove it. Everything works fine without.
> > > >=20
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > ---
> > > >  drivers/gpu/drm/tegra/hub.c | 3 ---
> > > >  1 file changed, 3 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hu=
b.c
> > > > index 6aca0fd5a8e5..e56c0f7d3a13 100644
> > > > --- a/drivers/gpu/drm/tegra/hub.c
> > > > +++ b/drivers/gpu/drm/tegra/hub.c
> > > > @@ -615,11 +615,8 @@ static struct tegra_display_hub_state *
> > > >  tegra_display_hub_get_state(struct tegra_display_hub *hub,
> > > >  			    struct drm_atomic_state *state)
> > > >  {
> > > > -	struct drm_device *drm =3D dev_get_drvdata(hub->client.parent);
> > > >  	struct drm_private_state *priv;
> > > > =20
> > > > -	WARN_ON(!drm_modeset_is_locked(&drm->mode_config.connection_mutex=
));
> > >=20
> > > I suspect copypasta from the mst private state stuff, which relied on=
 this
> > > lock to protect it. Except your code never bothered to grab that lock=
 (or
> > > any other) so was technically broken until we added generic locking in
> > >=20
> > > commit b962a12050a387e4bbf3a48745afe1d29d396b0d
> > > Author: Rob Clark <robdclark@gmail.com>
> > > Date:   Mon Oct 22 14:31:22 2018 +0200
> > >=20
> > >     drm/atomic: integrate modeset lock with private objects
> > >=20
> > > Hence this is now ok to drop, originally it wasnt.
> > >=20
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >=20
> > Great, thanks for pointing that out. I'll update the commit message with
> > that explanation.
> >=20
> > > Aside: You're single-thread all your atomic updates on the hub->lock,
> > > which might not be what you want. At least updates to separate crtc s=
hould
> > > go through in parallel. Usual way to fix this is to add a
> > > tegra_crtc_state->hub_changed that your earlier code sets, and then y=
ou
> > > walk the crtc states in the atomic commit (only those, not all, other=
wise
> > > you just rebuild that global lock again), and then only grab the hub =
state
> > > when you need to update something.
> >=20
> > I'm confused. Where do you see hub->lock? Did you mean wgrp->lock?
>=20
> struct tegra_display_hub->base.lock I have no idea what wgrp->lock is
> protecting - the functions seem to be only called from driver load/cleanup
> code, and that is single-threaded. If I'm not missing anything then
> wgrp->lock does nothing for you.

This is currently single-threaded, but the idea was to make window group
assignment more dynamic. I currently always enable window groups because
there's no good place to dynamically do that. Once I figure that out the
lock would become necessary, so I'd prefer to leave it in place as sort
of a reminder that I need to actually worry about the locking.

I'll have to look into the hub->base.lock, I don't recall exactly what I
thought at the time and it seems like I didn't leave enough comments in
the code to quickly refresh my memory...

Thierry

--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3lKNMACgkQ3SOs138+
s6FUlg/9EG3gGQHB60WdlsMwy/3sLY+y+bAHWukbojNWuh805OuIrfTGqJhNDGaI
VBhdBe2lhy8squHXdt3N3rfs89r4bY7UzCO2eExlo2EP7NBSsM5DjIyWv4Bs0mWe
YXheIVwWgfIR/xhQr3U7eF7aHA8v8j8eYgtv4DKw0oMPLCCSqT0MoDlN2D43jj9g
QQ8i+Z73OrmCw7WRkvTeh4FgpM2aimjBb82IbD5LXHVxR1dttsqsipbWqq+xP79A
oU8gXfRdaTJYlxwiCc1X2koH9Rlvels5IT0XcdEn3TYVENQ1ZZkkNZKesFD95DUb
HhtrJCk/Q4TSqhLW5wZNMkrtz5FzwDlaMM0WFaGjBd0r/xpWeyaq7Q/NrU0ESEhx
zz0rYCbFj3sv10GY7X+VS46K4gv7+fa+2GK8zMdojzijsb2wURCPYB6v7oTzXm89
fLBfdr3yiTwJ1L+iQZsSqi7h0eWyaSc83EPZb3zOyKxRqfHWY9qBgzZWodq9HLDV
F1xsk8mUF8ztcNfhdCL2DdNbL+3oqBESU2dYVibH6HD2rP/PAYjWYwDOBMqWVGd2
aFZg2CIVJFJ9YLU9Fr4ywern6o5UBDjaZoaXRkQa+QIS3icVWBBNmoEc5Hg7cq7d
NnB592aZtpUA0VW+S2plaa4mDJu1+/G+Nb/TDUr5n2ocXNzfqoM=
=QTRN
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--

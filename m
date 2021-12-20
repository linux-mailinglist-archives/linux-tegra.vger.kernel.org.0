Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5189447B053
	for <lists+linux-tegra@lfdr.de>; Mon, 20 Dec 2021 16:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239966AbhLTPbS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 20 Dec 2021 10:31:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237448AbhLTPbA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Dec 2021 10:31:00 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B59FC08EAFC
        for <linux-tegra@vger.kernel.org>; Mon, 20 Dec 2021 07:28:04 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id c4so20838111wrd.9
        for <linux-tegra@vger.kernel.org>; Mon, 20 Dec 2021 07:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9gNq5FqjvOqhDiys3mG3asKyTvxKYAisXEtEFLKE/4s=;
        b=l/9n8zdkyHZkCZP/MF7mUIqnTE+K192fX8bE117AY+Ws0B1/5amasZGNkICXrFr37X
         6eTZQDBAA+rrrWpSgwYaKRhioQ5o3ADSatcNLeIVumMIKEBrGp5GLHYBokphI4W+7ljt
         oFozVXWpgM0By7BduTQAYFmihp5+JI4ezm9iMgyrTQ/vdaxFaignZapEtieyaHzmnvlD
         puOGZWMNulwBhfvJNynkznSULnMYtPfzSvDdJOcFW1k/stKj61P3a8gF7r59/WamGwHu
         Kh0lQvfOmB49Oo3sziO476YheuxXq96H1IWWEfTDnAlW5ZGGN5IwYcAJJq7OYQuJYrwG
         1dPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9gNq5FqjvOqhDiys3mG3asKyTvxKYAisXEtEFLKE/4s=;
        b=r4dwDcFAMZ4IejUoUJEBGYQ8jVxnzPDz75GklihJmsYKqjwq14gWHzbO/+YREyW0Ob
         QX4qV7fVa64mBOO5Avz9YZD6C4JY0gROIpIftPqbAtonUNHisUzpMlobWq04zqSftKd8
         vpMrMAMDUM15UJDiX5gSUnnO8BX4gO5kz7ilsDDxNsJxuuP73KxV4topt4wlQkfEiir7
         C4HeCfeWYr66swdUmGpZu0OLoGyiJ9mn5/07LrmP3RmJXCZWpqJ0fSY0kNeEZTAPue+g
         s+ImZiNSaz6PopruiH8X7RwQVJTe+E7hSLhL1hm0RBYW7YquLHwUZC0sH0SvIk78FaK7
         8PZQ==
X-Gm-Message-State: AOAM532E1BvwKmY6vXuDKyCktGPx1mb5kk2HKq6CWVLcbyI4TwlleQKz
        rmWXF0G9Uoc9argVoyCsZC8=
X-Google-Smtp-Source: ABdhPJy+94H7aslEP3woTpVzL7Gu0Q1LNWYOc8m9SdWF8IxLSvhEWGtfOHBDJ5UajhaoPhyYoC5N7Q==
X-Received: by 2002:a5d:47a3:: with SMTP id 3mr4767887wrb.583.1640014083052;
        Mon, 20 Dec 2021 07:28:03 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id m3sm9660078wms.25.2021.12.20.07.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 07:28:02 -0800 (PST)
Date:   Mon, 20 Dec 2021 16:27:59 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thomas Graichen <thomas.graichen@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
Message-ID: <YcCg/xktJ2uShFRf@orome>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4tYtRRqV13xh3Wv9"
Content-Disposition: inline
In-Reply-To: <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com>
User-Agent: Mutt/2.1.4 (93ef06ae) (2021-12-11)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--4tYtRRqV13xh3Wv9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 20, 2021 at 05:45:41PM +0300, Dmitry Osipenko wrote:
> 20.12.2021 13:48, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Hi,
> >=20
> > this is an alternative proposal to fix panel support on Venice 2 and
> > Nyan. Dmitry had proposed a different solution that involved reverting
> > the I2C/DDC registration order and would complicate things by breaking
> > the encapsulation of the driver by introducing a global (though locally
> > scoped) variable[0].
> >=20
> > This set of patches avoids that by using the recently introduced DP AUX
> > bus infrastructure. The result is that the changes are actually less
> > intrusive and not a step back. Instead they nicely remove the circular
> > dependency that previously existed and caused these issues in the first
> > place.
> >=20
> > To be fair, this is not perfect either because it requires a device tree
> > change and hence isn't technically backwards-compatible. However, given
> > that the original device tree was badly broken in the first place, I
> > think we can make an exception, especially since it is not generally a
> > problem to update device trees on the affected devices.
> >=20
> > Secondly, this relies on infrastructure that was introduced in v5.15 and
> > therefore will be difficult to backport beyond that. However, since this
> > functionality has been broken since v5.13 and all of the kernel versions
> > between that and v5.15 are EOL anyway, there isn't much that we can do
> > to fix the interim versions anyway.
> >=20
> > Adding Doug and Laurent since they originally designed the AUX bus
> > patches in case they see anything in here that would be objectionable.
> >=20
> > Thierry
> >=20
> > [0]: https://lore.kernel.org/dri-devel/20211130230957.30213-1-digetx@gm=
ail.com/
> >=20
> > Thierry Reding (2):
> >   drm/tegra: dpaux: Populate AUX bus
> >   ARM: tegra: Move panels to AUX bus
> >=20
> >  arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
> >  arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
> >  arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
> >  drivers/gpu/drm/tegra/Kconfig             |  1 +
> >  drivers/gpu/drm/tegra/dpaux.c             |  7 +++++++
> >  5 files changed, 33 insertions(+), 19 deletions(-)
> >=20
>=20
> It should "work" since you removed the ddc-i2c-bus phandle from the
> panel nodes, and thus, panel->ddc won't be used during panel-edp driver
> probe. But this looks like a hack rather than a fix.

The AUX ->ddc will be used for panel->ddc if the ddc-i2c-bus property is
not specified. And that makes perfect sense because we'd basically just
be pointing back to the AUX node anyway.

> I'm not sure why and how devm_of_dp_aux_populate_ep_devices() usage
> should be relevant here. The drm_dp_aux_register() still should to
> invoked before devm_of_dp_aux_populate_ep_devices(), otherwise
> panel->ddc adapter won't be registered.

drm_dp_aux_register() is only needed to expose the device to userspace
and make the I2C adapter available to the rest of the system. But since
we already know the AUX and I2C adapter, we can use it directly without
doing a separate lookup. drm_dp_aux_init() should be enough to set the
adapter up to work for what we need.

See also the kerneldoc for drm_dp_aux_register() where this is described
in a bit more detail.

> The panel->ddc isn't used by the new panel-edp driver unless panel is
> compatible with "edp-panel". Hence the generic_edp_panel_probe() should
> either fail or crash for a such "edp-panel" since panel->ddc isn't fully
> instantiated, AFAICS.

I've tested this and it works fine on Venice 2. Since that was the
reference design for Nyan, I suspect that Nyan's will also work.

It'd be great if Thomas or anyone else with access to a Nyan could
test this to verify that.

Thierry

--4tYtRRqV13xh3Wv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmHAoP8ACgkQ3SOs138+
s6FkuA//efvwFbmguYpSE2Sv3WOT9vlvK+eAMYuZHZQb6bXvrlRGSl077/M8RdFG
cVcf5q19ktBxpgRn/sZ6vZLoSz5cNmUBq3AUr8fPWENAufuAU/1DEDD8aRrj8oP0
x4haZ7VEtPyfhK2DNvO1JynGh7DNHjimtfwCM0ldtrqzl4muuChtdYnVmV1o2i0y
XN8Le4joOpO1f/M8gKEjH9IJ4vgqktFgIky15RdITwyLWwtWmtKxfAWlOw1e0ym1
LssIhvK0ABgLIIBRt2VAaE/rOki/sFTpZ4xZbc7TQ8BODsC1WKj9SPAKqhbvDsB7
488Z9Up/7yb7e+zAMbGFr3ZBc3Z5DoSr2kkaG7S9FBNtGRdiGf1UW8r6TP4Tnt1M
wg0EpsX8E+2+yiLul6hZzwAEudfs+QFnaPHWZFhVLfe94SF8EG5vXr9wdCP7h+lE
kOfEl69SxQRYBeHepo/Y4+fEJOwewtt24z3yu8LCNn6p1m5iWOEf5lWTE3um0Mc/
dJaD/9kISduNmt6VQICO/LRi66uV2I+6R818/qhzEyFPlXqJra9GpOegukZS9/Oc
qn42+TnqakWMEQCPIq/gxH2JWuBsXQVYmFTcZJFxcXovdaS5x0ydnR1GhhMrg8+G
1NP9sKwUdApASty6UhQabp9HUBHc+JX7B3X0zWmfGad3u4r8SJ4=
=zqQy
-----END PGP SIGNATURE-----

--4tYtRRqV13xh3Wv9--

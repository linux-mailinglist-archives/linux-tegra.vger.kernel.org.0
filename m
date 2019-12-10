Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8236E118957
	for <lists+linux-tegra@lfdr.de>; Tue, 10 Dec 2019 14:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbfLJNMZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 10 Dec 2019 08:12:25 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34376 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727334AbfLJNMZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Dec 2019 08:12:25 -0500
Received: by mail-wm1-f68.google.com with SMTP id f4so2265413wmj.1
        for <linux-tegra@vger.kernel.org>; Tue, 10 Dec 2019 05:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gqlkQgce6sQDJahqYUInp/oF9UQ1oFIZRWbI2jpqmGs=;
        b=XYTyygbU8yrNU+JcwVzp6LA09TbM0JXLjMoH+fcxy7BrrT/F2wh494enbRXNlYclus
         V/uyszwZZAu5UkeExmj1j1HJR3oglAtOfVcrGuWVvAEJTH+SO084RHll7ImLxipyoJTq
         L3Z9TAYAa3jYvG5rkZAMGKIu+dgXcZN4jb351K91ItOgfthwQoYCa0YJsyiiPpU8isFq
         69jAGHYdYQ7IOKGhmq08mh3mVC3nKOI15p2Y9zsp+K+xdQaOq9jd7w8rqnYDLWkaZVNK
         SUlp4cYX0GG9SiB9othZNNvSZMxVmeeetHiVzIZ4mIqiQti5KPwaOEPvG6tYB3eRt+8m
         w1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gqlkQgce6sQDJahqYUInp/oF9UQ1oFIZRWbI2jpqmGs=;
        b=guJ2O6VB9JtMF1QP3nm7Vfr/Bf0xFyWbT13+GcXPWDeqrv8BAHx5UXEdJ9gjpX9x+8
         ZMi5c7HIdcEROajMT6ech4ybTdND4LY0qESdqTIiTii4Vo2WmzD+XUYny6ri2Ql8cIta
         fgQzQundUDIn3ZF/uMphtlCxdKPf0bpVWydcUmnzpwt6RDYnszIG/TbcUCnkQ4LNBnOJ
         YLWZ4YQhF5DpaKEYTmShEQum3bH1KRf9z+mPIyyKMnt/sOdaQIY0GrcoKHzcaFwr104o
         ImGSsoL7X2Cu61sGQyxEr+gsdXKo6q0zJDZOMwBUikPg3Z4lNBVC7qNai+XKyc76poSI
         KFWw==
X-Gm-Message-State: APjAAAXKTqenIYF3OQ9zqdxjuBqluYNh5x+M5Y/uRO8BEOASSFtw1qcY
        gZBJxufHm+cFMTXuKjl2jW0=
X-Google-Smtp-Source: APXvYqzWYr7/nzN3Mt5TSUg7BcTSi9HkEOqj0fAv071NUr4vLYQSWnuYQ5BbaVLhNfc/dypOwRSC3w==
X-Received: by 2002:a1c:486:: with SMTP id 128mr5272560wme.163.1575983542374;
        Tue, 10 Dec 2019 05:12:22 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id b67sm3148952wmc.38.2019.12.10.05.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 05:12:20 -0800 (PST)
Date:   Tue, 10 Dec 2019 14:12:19 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <skeggsb@gmail.com>
Cc:     Ben Skeggs <bskeggs@redhat.com>, linux-tegra@vger.kernel.org,
        ML nouveau <nouveau@lists.freedesktop.org>,
        Joerg Roedel <joro@8bytes.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [Nouveau] [PATCH v3 0/9] drm/nouveau: Various fixes for GP10B
Message-ID: <20191210131219.GE2703785@ulmo>
References: <20191209120005.2254786-1-thierry.reding@gmail.com>
 <CACAvsv4NX7jvZb5_X5auU4-KKk9PfmtJvmnQNjY7ihqgXaRS6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vv4Sf/kQfcwinyKX"
Content-Disposition: inline
In-Reply-To: <CACAvsv4NX7jvZb5_X5auU4-KKk9PfmtJvmnQNjY7ihqgXaRS6A@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--vv4Sf/kQfcwinyKX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2019 at 06:15:30PM +1000, Ben Skeggs wrote:
> On Mon, 9 Dec 2019 at 22:00, Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Hi Ben,
> >
> > here's a revised subset of the patches I had sent out a couple of weeks
> > ago. I've reworked the BAR2 accesses in the way that you had suggested,
> > which at least for GP10B turned out to be fairly trivial to do. I have
> > not looked in detail at this for GV11B yet, but a cursory look showed
> > that BAR2 is accessed in more places, so the equivalent for GV11B might
> > be a bit more involved.
> >
> > Other than that, not a lot has changed since then. I've added a couple
> > of precursory patches to add IOMMU helper dummies for the case where
> > IOMMU is disabled (as suggested by Ben Dooks).
> >
> > Joerg has given an Acked-by on the first two patches, so I think it'd be
> > easiest if you picked those up into the Nouveau tree because of the
> > build dependency of subsequent patches on them.
> I've merged all the patches in my tree, after fixing a small build
> issue on !TEGRA in the WPR config readout patch.

Thanks for taking care of that. I'm going to need to add a non-Tegra
configuration to my build scripts and make sure I run those.

On a related note: have you ever considered submitting the Nouveau tree
for linux-next? That'd be very convenient for people like me working on
multiple patch series at the same time. In fact I've got another set of
patches against Nouveau that I want to send out after you've merged
these. Technically I would need to rebase them on your tree (since there
may be dependencies on this set), but that means I need to pull in both
your tree and linux-next if I want to keep up to date on all fronts and
test all patches in my local tree at the same time.

I'm not sure how well that would fit into your workflow. It's typically
not more effort than setting up a permanent branch that you can push to
whenever there's something that's ready for broader consumption. Beyond
the initial setup (which is really not more complicated than sending
Stephen an email with a URL and the branch name), it's really quite
simple and goes a long way to get broad testing early on. And it's
especially handy to catch potential conflicts with cross-subsystem
changes like the IOMMU patches in this series.

Thierry

> > Thierry Reding (9):
> >   iommu: Document iommu_fwspec::flags field
> >   iommu: Add dummy dev_iommu_fwspec_get() helper
> >   drm/nouveau: fault: Add support for GP10B
> >   drm/nouveau: tegra: Do not try to disable PCI device
> >   drm/nouveau: tegra: Avoid pulsing reset twice
> >   drm/nouveau: tegra: Set clock rate if not set
> >   drm/nouveau: secboot: Read WPR configuration from GPU registers
> >   drm/nouveau: gp10b: Add custom L2 cache implementation
> >   drm/nouveau: gp10b: Use correct copy engine
> >
> >  .../drm/nouveau/include/nvkm/subdev/fault.h   |  1 +
> >  .../gpu/drm/nouveau/include/nvkm/subdev/ltc.h |  1 +
> >  drivers/gpu/drm/nouveau/nouveau_drm.c         |  3 +-
> >  .../gpu/drm/nouveau/nvkm/engine/device/base.c |  6 +-
> >  .../drm/nouveau/nvkm/engine/device/tegra.c    | 24 ++++--
> >  .../gpu/drm/nouveau/nvkm/subdev/fault/Kbuild  |  1 +
> >  .../gpu/drm/nouveau/nvkm/subdev/fault/base.c  |  2 +-
> >  .../gpu/drm/nouveau/nvkm/subdev/fault/gp100.c | 17 ++--
> >  .../gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c | 53 ++++++++++++
> >  .../gpu/drm/nouveau/nvkm/subdev/fault/gv100.c |  1 +
> >  .../gpu/drm/nouveau/nvkm/subdev/fault/priv.h  | 10 +++
> >  .../gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild    |  1 +
> >  .../gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c   | 65 +++++++++++++++
> >  .../gpu/drm/nouveau/nvkm/subdev/ltc/priv.h    |  2 +
> >  .../drm/nouveau/nvkm/subdev/secboot/gm200.h   |  2 +-
> >  .../drm/nouveau/nvkm/subdev/secboot/gm20b.c   | 81 ++++++++++++-------
> >  .../drm/nouveau/nvkm/subdev/secboot/gp10b.c   |  4 +-
> >  include/linux/iommu.h                         | 47 ++++++-----
> >  18 files changed, 249 insertions(+), 72 deletions(-)
> >  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c
> >  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
> >
> > --
> > 2.23.0
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau

--vv4Sf/kQfcwinyKX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3vma8ACgkQ3SOs138+
s6EMoA/+KLTq/6mdV+MZhJOaFxvM/cAMMf7P7ygfKhZGSjR+G5tdp4tpTr0xmTUM
FaVQbs+u6SAIynt09/muATo/CDBFZPncLliZoquTY/KASlMRNqMGmp5i4EbZgAas
Rtjb4DwmULvJqJGx4/ilzs0xBwMypaR1voLNfNHSWWN+oay3qQk+UKkxj09M7bXY
r3r9uEM6CH3w2HH5dVclioH29+bszQahRAjzBMQA4Pan+RxYkcdbD2EldmB2sr8F
JQsB9M/+9ESKuI8Gc4xoiOVx8tfEA4KTHOHlivnwiZmz2fqQayPB/huSFTswNmOK
06dpwYW+4nYD31hKFR9bgaw3OMTSYyp8l2pAjePTIFP02MYBD9WzfcssORJPf4h0
qV4BMtL2vUZxC09bmbxpLZX2/jrmJ7IC9yf+24I9c9RZ25cnsYqUmsbSwxToUkBX
4Td9CPjOPqFaZs2eqZc0kI46e8dk7AD/H6nVnJmIecQJm+CzvUMukV3UsbZb5Gvj
KNA+91ZvT+si9wnEGHVvyaRg9FNwN00b7PG2BH9Loa+yglBDaFOWziXRZWtnusXR
AL5BhsMEQgKGIT5VcBu1FvXNkUmCnULl/88R9JAfBtHAneWvKtI1x/KcZFJPje57
FeJPDY1CSKH7NOT2E8oKlJrgxdw6GjzB6hNGjlNk7RaFmupKoCA=
=bn4W
-----END PGP SIGNATURE-----

--vv4Sf/kQfcwinyKX--

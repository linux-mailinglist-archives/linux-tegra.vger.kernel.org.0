Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A8C2830D4
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Oct 2020 09:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbgJEHYe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Oct 2020 03:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbgJEHYe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 03:24:34 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1365CC0613CE;
        Mon,  5 Oct 2020 00:24:34 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id h24so3834073ejg.9;
        Mon, 05 Oct 2020 00:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MOoMUNrkhGZILoIhNc/dlvzV5zVbmrqMoAnmuY4eMSA=;
        b=VND59Zbet/KRWzmur5rvDuze5kYvzLamPTqto7EYeIVjVjun97JRANNXnmN52xtJPS
         V6cno2OJpkk7CV/Kcmq5nCC7ceCHiVaWUNqeZR+0DZofRafS2yTI3Lazx9z7Tvlzq1Cx
         +RSpSL63uzHVlhCFVxDg8D11qeH/psJBVZ8FigMu2q6StL8FqWi9S844dq/lejD/LrF3
         7HeAZE7RBhT2Vz37yDItncQ2B5maD8KAmX9Hk1zHWaAPX1eJ9tBafuUSTAIOK76/ICSM
         pDGI4ll3t7YJDIU7SpQc4AbTvr9FigdbbZZkZET8A8VwiKJqz5QD36JeCtZhP7U9mYa7
         es+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MOoMUNrkhGZILoIhNc/dlvzV5zVbmrqMoAnmuY4eMSA=;
        b=gJL1NgqsQGLGdmUgWX4Jgc+oDHYKgw2sXgTwhZoCaS5nER9v+pzbkgKnC6hfwMPRZC
         MI2hSH0KvLh+MiIiBBppi7oW0OUN/JVqkmMvx/oHR8EqACd5MOnLcI1B9s8bvyUf0aqR
         dkN6CLWSNd+XMVu5F5W+KNNW4aX/aBqDuP2BN8j7R62AGtVUTCX3XWxDxnoUYyyFDK0E
         M9XycgeNCKfzMGd68zZX8FWWxhHkepj8gYxMWHNgeseiNkQFMFQ1sW2LanhkqqwKVL29
         AbuSJo0HvUGtJoeh9WoIlcFf0RU/V2Z1KOgReWz8eBhxc4/1gODLf+4ogxDlZYg6ZLUB
         PsUw==
X-Gm-Message-State: AOAM530fVJ1/UA+WuI7Dm8JTvipHZaLJZuTS5yGWmucARFFjU/f0Tck3
        tOJEJhqy9mFZ2ZSuFyuKTsE=
X-Google-Smtp-Source: ABdhPJyaprDj3vNIgEstQkI1/gr5T0mTsIn0lSpxJf7kACCbHJqVocFVarVQSfPQCXbaaBIZbAOcHA==
X-Received: by 2002:a17:906:f1cf:: with SMTP id gx15mr13922584ejb.241.1601882672006;
        Mon, 05 Oct 2020 00:24:32 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id 92sm8020654edm.30.2020.10.05.00.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 00:24:30 -0700 (PDT)
Date:   Mon, 5 Oct 2020 09:24:29 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201005072429.GB425362@ulmo>
References: <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
 <20201001012630.GA28240@Asurada-Nvidia>
 <72b11925-5857-8ce5-d084-cab01ca1b396@gmail.com>
 <20201001024850.GA28456@Asurada-Nvidia>
 <20201001102316.GF3919720@ulmo>
 <20201001110425.GB1272@Asurada>
 <b966844e-4289-3ff0-9512-852f8419a664@gmail.com>
 <20201002010751.GA26971@Asurada-Nvidia>
 <1b621b9d-cdc3-c7aa-2fa2-d728ae2bbc5d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline
In-Reply-To: <1b621b9d-cdc3-c7aa-2fa2-d728ae2bbc5d@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2020 at 04:55:34AM +0300, Dmitry Osipenko wrote:
> 02.10.2020 04:07, Nicolin Chen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Oct 01, 2020 at 11:33:38PM +0300, Dmitry Osipenko wrote:
> >>>>> If we can't come to an agreement on globalizing mc pointer, would
> >>>>> it be possible to pass tegra_mc_driver through tegra_smmu_probe()
> >>>>> so we can continue to use driver_find_device_by_fwnode() as v1?
> >>>>>
> >>>>> v1: https://lkml.org/lkml/2020/9/26/68
> >>>>
> >>>> tegra_smmu_probe() already takes a struct tegra_mc *. Did you mean
> >>>> tegra_smmu_probe_device()? I don't think we can do that because it i=
sn't
> >>>
> >>> I was saying to have a global parent_driver pointer: similar to
> >>> my v1, yet rather than "extern" the tegra_mc_driver, we pass it
> >>> through egra_smmu_probe() and store it in a static global value
> >>> so as to call tegra_smmu_get_by_fwnode() in ->probe_device().
> >>>
> >>> Though I agree that creating a global device pointer (mc) might
> >>> be controversial, yet having a global parent_driver pointer may
> >>> not be against the rule, considering that it is common in iommu
> >>> drivers to call driver_find_device_by_fwnode in probe_device().
> >>
> >> You don't need the global pointer if you have SMMU OF node.
> >>
> >> You could also get driver pointer from mc->dev->driver.
> >>
> >> But I don't think you need to do this at all. The probe_device() could
> >> be invoked only for the tegra_smmu_ops and then seems you could use
> >> dev_iommu_priv_set() in tegra_smmu_of_xlate(), like sun50i-iommu driver
> >> does.
> >=20
> > Getting iommu device pointer using driver_find_device_by_fwnode()
> > is a common practice in ->probe_device() of other iommu drivers.
>=20
> Please give me a full list of the IOMMU drivers which use this method.

ARM SMMU and ARM SMMU v3 do this and so does virtio-iommu. Pretty much
all the other drivers for ARM platforms have their own variations of
tegra_smmu_find() using of_find_device_by_node() at some point.

What others do differently is that they call of_find_device_by_node()
=66rom ->of_xlate(), which is notably different from what we do in
tegra-smmu (where we call it from ->probe_device()). It's entirely
possible that we can do that as well, which is what we've been
discussing in a different sub-thread, but like I mentioned there I do
recall that being problematic, otherwise I wouldn't have left all the
comments in the code.

If we can determine that moving this to ->of_xlate() works fine in all
cases, then I think that's something that we should do for tegra-smmu to
become more consistent with other drivers.

> > But this requires a device_driver pointer that tegra-smmu doesn't
> > have. So passing tegra_mc_driver through tegra_smmu_probe() will
> > address it.
> >=20
>=20
> If you're borrowing code and ideas from other drivers, then at least
> please borrow them from a modern good-looking drivers. And I already
> pointed out that following cargo cult is not always a good idea.
>=20
> ARM-SMMU isn't a modern driver and it has legacy code. You shouldn't
> copy it blindly. The sun50i-iommu driver was added half year ago, you
> may use it as a reference.

That's nonsense. There's no such thing as "modern" drivers is Linux
because they are constantly improved. Yes, ARM SMMU may have legacy code
paths, but that's because it has been around for much longer than others
and therefore is much more mature.

I can't say much about sun50i-iommu because I'm not familiar with it,
but I have seen plenty of "modern" drivers that turn out to be much
worse than "old" drivers. New doesn't always mean better.

> Always consult the IOMMU core code. If you're too unsure about
> something, then maybe better to start a new thread and ask Joerg about
> the best modern practices that IOMMU drivers should use.

This doesn't really have anything to do with the IOMMU core code. This
has to do with platform and firmware code, so the IOMMU core is only
marginally involved.

Thierry

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl96yioACgkQ3SOs138+
s6GDnhAAhlKinPut4FcB4WuAdyApdRrVDRVNZ3iJ23ac44Pu91Fo0+HN9gZo6F+v
/riVDr5JjARTFFDLvwSbDTjnVRFTXSr1QDQBtJX6IOd/awV5zFgwu++UO80tYbUL
+qc9IqXpYBYBYgBhBwlQGsuicr2UoNWdJYYuEgwJ+7pUlSKfHtwkSgi23uA0KRKT
NqMS1loug5GviocVllqGNoqzLEiVybAFWubk/LsNEPgTbEiKYfGuGf0dDbthhM84
o81pZADWgCE5y0KQrQJo+BI5TZCCF13DBks/UhF9jnZaS3lY74/uXnbpinY393Bx
DcinRV4pmg9haL0rItHA5wgeslmf0CnXACY3yGzdRaCiclciI/n1oGcf+qV2wN5+
Qm08xdUopMCGpEhxq+yBZtlVTdFED0QueerN/PZgSzCev9RJmqccHyY3MTmV7uiK
pEe2SYSPORQRAJAgYyUHe6ydx5Nz4sIceCYsAjieHVT3me+MyoXkkqKMBKG5lHrc
t63/fR7b3zcejf9JEDJ8lxa/F7cFV/FtblT8mqEWJ2R1WMVC56aiUBAdVuTqWPJd
D2NI3UkXdQQliOTCn0M1Fsg6X6hUM91ksYxNFZSclQ7IcG+u3ba4Lh4V9xKL8+2C
G7dhftDMDr6btNmxmWsyftIBcy/g3p0SCMCS2Hf0zjfGqrdoNkc=
=WdES
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--

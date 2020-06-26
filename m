Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9EA520B0B1
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jun 2020 13:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgFZLkp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Jun 2020 07:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgFZLko (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Jun 2020 07:40:44 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63332C08C5C1
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2020 04:40:44 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id i14so9035822ejr.9
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2020 04:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BJC4oloYb5RbjxtRrvfFmqUozt++cFwO1fPLD+Iu6uQ=;
        b=gaO0lpVUM4tO4+Abx4tPmG5ompbTtXgQHrSEKTykvo+it12BrkH0I9Iqx7D70iORDM
         XMs0WU0CT1wTawfBLxXbGE3OmZq2QoL/cQGIlJRF1ZHe3hYiNa1ulKzm6LJZ42Ugan3Y
         N4AiqTfMMVd/uhLnQ+AYsGDycSVk0tD5qwEqJ2SUIduKbn7t0YLqaqY46a2ZgDSx3BR5
         DLDGgLkCYr+5prGVha06DsTJ7gTRPapXcj6ta7PKjNOj7tAddkZ9wrtwT1PUBFWLd9Dy
         iBl9Xe/MYveW+9MuB2EVhVHWVIDuKM7sxgvRiKqsCWL/grmDkBzwztCag+hSHQ+Bni4G
         cgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BJC4oloYb5RbjxtRrvfFmqUozt++cFwO1fPLD+Iu6uQ=;
        b=OGYzNuVjv3ZHnPHiVUt6sQHY3m0UC89dguNbYAQS1GirIOaAgkRVz9czaJ+oYLA2UW
         W7PL+WNVu6EqjRFbTS1OFIjXV69Vw3TCvz7O88ZSjEgHESrTHu26pN9nGIL4uWmZmwYR
         pNVIrW8QNjUZSUYtsdPBIJ4m08crsWUpFz3nPj2fgsVOZxszgPVm2oucg5Qz6W0mWTiM
         wcbz6GPc0zolE2qODCl1nyyytpYxtPtMMfDaL5cPzQohU0EPC1958tTB9zMTlx0hmVZ4
         h4zV5iaLVcqEKiP32k5UnhBIevT9zGtG5qO/sj3VmgrgF5QWo++lP0T9xSgjIcu1v3WE
         F5zg==
X-Gm-Message-State: AOAM5331yH9w3vqj5+YIMqZFjsUv3+y4kC/sns6mzjn80eg35YoTHTcV
        z876db32hOThll9lK54KHrA=
X-Google-Smtp-Source: ABdhPJzTuIrtaP1w1RW0PfvVTA+xgbMdrOWOhLS0fQydCM6Ckk34PyX48uLkgHGN4uezoeGCCHBABA==
X-Received: by 2002:a17:906:2e4b:: with SMTP id r11mr2105436eji.227.1593171643145;
        Fri, 26 Jun 2020 04:40:43 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q24sm15872460edg.51.2020.06.26.04.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 04:40:41 -0700 (PDT)
Date:   Fri, 26 Jun 2020 13:40:40 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Karol Herbst <kherbst@redhat.com>
Cc:     Mikko Perttunen <cyndis@kapsi.fi>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        talho@nvidia.com, bhuntsman@nvidia.com,
        dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI
Message-ID: <20200626114040.GA3143884@ulmo>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
In-Reply-To: <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2020 at 01:06:58PM +0200, Karol Herbst wrote:
> On Tue, Jun 23, 2020 at 3:03 PM Mikko Perttunen <cyndis@kapsi.fi> wrote:
> >
> > # Host1x/TegraDRM UAPI proposal
> >
> > This is a proposal for a stable UAPI for Host1x and TegraDRM, to replace
> > the current TegraDRM UAPI that is behind `STAGING` and quite obsolete in
> > many ways.
> >
> > I haven't written any implementation yet -- I'll do that once there is
> > some agreement on the high-level design.
> >
> > Current open items:
> >
> > * The syncpoint UAPI allows userspace to create sync_file FDs with
> > arbitrary syncpoint fences. dma_fence code currently seems to assume all
> > fences will be signaled, which would not necessarily be the case with
> > this interface.
> > * Previously present GEM IOCTLs (GEM_CREATE, GEM_MMAP) are not present.
> > Not sure if they are still needed.
> >
>=20
> Hi, as this wasn't addressed here (and sorry if I missed it): is there
> an open source userspace making use of this UAPI? Because this is
> something which needs to be seen before it can be included at all.

There's a set of commits that implement an earlier draft here:

    https://github.com/thierryreding/linux/tree/for-5.6/drm-tegra-destage-a=
bi

and corresponding changes to libdrm to make use of that and implement
tests using the various generations of VIC here:

    https://cgit.freedesktop.org/~tagr/drm/log/

Before actually jumping to an implementation we wanted to go over the
design a bit more to avoid wasting a lot of work, like we've done in
the past. Turns out it isn't easy to get everyone to agree on a good
ABI. Who would've thought? =3D)

I expect that once the discussion around the ABI settles Mikko will
start on implementing this ABI in the kernel and we'll update the
libdrm patches to make use of the new ABI as well.

Thierry

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl713rQACgkQ3SOs138+
s6HnQQ/9HkD1MHHeapEcnLVFgLiBum365fmqgGgJ5efaTwGtbES9Wet4idqD0wgz
9ARttZ3MLezzzJZWKolNI27ja+MPYnb8UyroITDTseXrVEiLR3/L6t0jeekX6zXA
0sbFZiv33cO9rkgD+z4hYAgadpCvZOOsKb7SciZFqYS6LMxPv6AQ6chX4s3/AXcA
ZSEUCoAesUWopKTsLSHtmBor0VKOaJdSWj4ei3POTBS7LQnhZCIGdZDy+i+Hlmsd
53LW21zaSECPxfSM6ibmhPv9+mvd1QSqBQXryXs8Bohj3/WfYPY6MLVj6Z+2XenQ
hpuXwsAtRJtdi5uJ+l+6N/X9zel1p0RqBXioCU409Gotzn7zbvAYQ2aAvFD8Y1fh
XwTpOMhU8zS16yBsCpFotc9igFeSULuMPt/GcLwnAjspHIoWE2yX5DII/mx/XCmc
IeTnKTlZ8WmWoJJAB/8lnypoMwatDA4ZAYbqgIOPN65dWlXdHxCGkayYN5xj1QRL
f3fBLHsiSXHJ54NhMj50wGMEFjBOq3NdFij7i3z8Zo6Y1UT18L3fuvszJuz0Qk7t
/IqCfN0Fgoc03sj8c9OH00+aMaGg9YxLaOYq06rox87fBD1xPpP7CbLxPbJuSLhf
lBUnIoQKS77gx5cEudEKrqYSSpCUllsxUBcGjhK/9E35MJ/YrTI=
=Ejbg
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--

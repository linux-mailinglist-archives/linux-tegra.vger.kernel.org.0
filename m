Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3413108C88
	for <lists+linux-tegra@lfdr.de>; Mon, 25 Nov 2019 12:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727602AbfKYLEx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 25 Nov 2019 06:04:53 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38377 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfKYLEw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Nov 2019 06:04:52 -0500
Received: by mail-wr1-f67.google.com with SMTP id i12so17504327wro.5
        for <linux-tegra@vger.kernel.org>; Mon, 25 Nov 2019 03:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FWoNrUy3f+kxqVONEubXQCc97eV7oqdZHrafrq6m5fg=;
        b=BJ+l10P/qirxHhoWsAonFLvrw/V9j3Aq/b4gd/qOFoLxAcTNpcvvOk2hhsXqeKXafy
         oTQXBSsEuyOHeFiFPNF1hfsVVHz7+FxXXDRhKIrRxPNXfRkDDAWU0/gXQNut6wrhmysn
         0xAvv/9KmOxOO0DDwp+SrmeSZPzauaIcVe/f2ns6GrYe/u9abaUkNjqSiSWKyDmWjEuc
         mRuWpaxaL4XdBShqrEIeO90AOF7F/th7Yl9nT6FxrDzBu9nzhOSOYPrKiEKB/CaPDAB0
         gzZlwXesbCm6mW4cO2KlyEQneyMpGkQgUEl3hP31CkwAoqp6U6JHZRkE2W2VCfRKA2w7
         vGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FWoNrUy3f+kxqVONEubXQCc97eV7oqdZHrafrq6m5fg=;
        b=Ogi03i/S/2pEp1MrajIK5sVDMdbpLSax6k5ivyRn/9FUQjktEvKf1w5jTFLqV1rD++
         uTEU1OjqMV8XyAXyaEdRGg6pWgpZdaeicg0lNryt+thK0aEwC45Vu2mqe+G6NhAqyDeF
         kijPy5z6LGlQhsLRSyPG5DavK1dBuGB1dGCHgkeg0Njxt6AScYbzpdms/j82TtwO3YD7
         OWEeukOPfFLu5vbulUDn6uXhggnE1uy/w6B7JgW5hVh2SidoXJm2qyAbZse3fBDxOUhE
         YTRAgwbdGcNobRjczilfwYNzmjfqZPPDNpmO2RQd97Y/z3CjqP2WesEhVALhWkd+gWVz
         mSGw==
X-Gm-Message-State: APjAAAWcCTu5T1WYzqL3kn6NAzHKNVdmaP2uCNLljOwUE/ZbnQUHRXVE
        wTlmmf2CDOXX88CcIwke+EM=
X-Google-Smtp-Source: APXvYqyRHbeRzaiQEbQEQDKhTi3f9hTcRDT6hNfd7YMqOwuw+BKG1CaGrMGpRa37eG8xy+Ue3ko64w==
X-Received: by 2002:a5d:638a:: with SMTP id p10mr29598029wru.336.1574679890895;
        Mon, 25 Nov 2019 03:04:50 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id c11sm9991308wrv.92.2019.11.25.03.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 03:04:49 -0800 (PST)
Date:   Mon, 25 Nov 2019 12:04:48 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 02/15] drm/tegra: Delete host1x_bo_ops->k(un)map
Message-ID: <20191125110448.GI1409040@ulmo>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y96v7rNg6HAoELs5"
Content-Disposition: inline
In-Reply-To: <20191118103536.17675-3-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--y96v7rNg6HAoELs5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:35:23AM +0100, Daniel Vetter wrote:
> It doesn't have any callers anymore.
>=20
> Aside: The ->mmap/munmap hooks have a bit a confusing name, they don't
> do userspace mmaps, but a kernel vmap. I think most places use vmap
> for this, except ttm, which uses kmap for vmap for added confusion.
> mmap seems entirely for userspace mappings set up through mmap(2)
> syscall.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/gem.c | 28 ----------------------------
>  include/linux/host1x.h      | 13 -------------
>  2 files changed, 41 deletions(-)

Tested along with the rest of the series and this is obviously right now
that the only user is gone, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>

--y96v7rNg6HAoELs5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3btVAACgkQ3SOs138+
s6HurQ/+MXn8OlSu5QbsbZSspjukoOrC3YnOeqVypfDi8GqKAcziGCYlyqID4WXd
6hxDvTfaPMTCx8EX0lNuTfk6Y6ogax3U9wWbWq0q99p08oTTtK+HzoDkbW18x8Lq
GY1jAT4+b09LiNZf0bl5gK+xcRZA6vTwip72rK2jJmlXrJ5THdPPKGCG4vCJbcy5
tYWys+GWQPUw9GlkcqoyGHAX9Q9l1h+dT/vzE1CklJ/dYKMifnw7Gfj+IC7rQpBS
H5QXkEgcy2DER5y+QYAfTtwXDwHIGU0/Wh2iVLULKM6iOkpc1YSEWupoRMrC6X5G
BImoYA+ajOhwFYM7Sb5625v7IMEex2AYowVcDKaCewogkXD3P4M/gybuG7iKVqrG
N02M419+MjtWOltwkPksUYu5PAPEiJdo0IqfWOeCUi4y8BOVgDfgGTw+iBRBNyba
QrWD/4VOpIr1gAWhi0nR2/LiHHvm1oNekDcKUd16RYGNoXeKXW3ja5QaMVeetVDH
NNGFhq81aBPhe2s0bi17vX8jq7N2yna0kr/NgulAyCaaz+InczriQ/JaM99meL/H
vE1jKkihKl/bsGj7qPDOZWZU7QCujd4v9tlSNrS9Oz+bETpVztJLs7faSInm4crr
EPEAWmdOkq5GU94RfMQBVFj8LcdNuHVIWnEAyYPeZvgAuvTgQh0=
=Snj2
-----END PGP SIGNATURE-----

--y96v7rNg6HAoELs5--

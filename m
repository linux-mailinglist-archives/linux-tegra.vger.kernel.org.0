Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 887E1100668
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 14:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbfKRNYB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 08:24:01 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40652 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbfKRNYB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 08:24:01 -0500
Received: by mail-wr1-f67.google.com with SMTP id q15so6656442wrw.7
        for <linux-tegra@vger.kernel.org>; Mon, 18 Nov 2019 05:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2+oThujBvfTQ1HHMZe0kADM+M8gUvebDa4eh+e7Lnqs=;
        b=sJaT2KEehNTiHjFieCJzDp/BvOFMujl/mfXgyF6MZPTgiB3OuZ3iqG723MLvdVZXBr
         VDtOPfzcXfqGOHYCdnWzC8lotS+Bhi4IHetCt5pYCtN3Rq+2h5w4RO9+ONKNDdYq4quX
         S4QvnIykhOZD8t/1gwqcRf14XWlG4y/Y8pecFjtmdIg53jINX4PBWvQ1R/mdf6qRWRvC
         /KlKoaCJh9p7Qs7lUAPGxsHBY8dWX1D/47xminyUjusn91SuyG9/XmJyFb24roe86AV/
         NBft9XrHE5RZm/XrmYIB0Qg3tHDabCAyyfqtu4Iz580CVLG9ecLJc6Wb065D/WvpEIK2
         iNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2+oThujBvfTQ1HHMZe0kADM+M8gUvebDa4eh+e7Lnqs=;
        b=Tk9BJobj2wOUWuZtJR2um+XMgklf3PS8gHmBK4UvhdU5nMwGYF6qv9ZxpZAGm6D/NJ
         kr9gJDOEkzExzqXUjyP+NXroBezlPh5AwmPDl21q/3yuiIyJKlQXyi3zLBpz1MZaiLRl
         C2kwdFkJe1lrRchWJzbM/oL6372wpAkYwPvhUh6SULXehfgZD6SQzb54goXe7WxOdHRu
         ZPSDY6Llziaq8xS5NXOCbP6Pi6D4TV1kESGV7XoJ0IOO6BoNFkD9Q9AvfqEDBvi4vX0A
         Ki62XyF138omEEr/UcQNTR5RnlkYmX3wpcgQZgUZSwWMzBXP6VVwNQKxLUnFXspsC8h4
         PSjg==
X-Gm-Message-State: APjAAAWhKMHqL2SnIq0EvX92Ud0J7OiIP3crHXaGCmFluZIC8DEj9qER
        qewvi5jSFoYMs9F7sY95kyg=
X-Google-Smtp-Source: APXvYqxneYQYNTdLLRfiG4+4rOyHceDXAy++0/66oG+zWkA+g6tzBXSeQJkywQCBNP+wasSE2f1Mhg==
X-Received: by 2002:adf:ab41:: with SMTP id r1mr32232759wrc.281.1574083439269;
        Mon, 18 Nov 2019 05:23:59 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id h140sm21933957wme.22.2019.11.18.05.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 05:23:58 -0800 (PST)
Date:   Mon, 18 Nov 2019 14:23:57 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     zhengbin <zhengbin13@huawei.com>
Cc:     treding@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
        jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code
Message-ID: <20191118132357.GC2246533@ulmo>
References: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline
In-Reply-To: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 07:46:10PM +0800, zhengbin wrote:
> zhengbin (2):
>   drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code in
>     tegra_bo_dumb_create
>   drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code in tegra_gem_create
>=20
>  drivers/gpu/drm/tegra/drm.c | 5 +----
>  drivers/gpu/drm/tegra/gem.c | 5 +----
>  2 files changed, 2 insertions(+), 8 deletions(-)

As I explained in response to the same patches sent for other drivers
already, I don't think this has any merit.

Thierry

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3Sm20ACgkQ3SOs138+
s6Evdg//QOlrbxFxraVGzdTmFWlFsmJ6OwQSOGxufr2gbH2Cpk9BOiAhspTui/RH
GQYR2dUFFihpoXrC3PUVAASsg05R6cinxYDRps838ekBdHd3hSP/jtNpnYJ7+A0n
7nf4+j43HPLQ1PfHGx4UQzyzuorNLy6q3JrUNDaumU6EO9yQYW1i6z6pbaEY74/I
tcFm5eU2iSY9yeIMJcYdOHrzpiKF7w4Nq5sy5iY1t949VMj3dJv101gHSoK2cZ5D
3iw2aYg5rhsOmflfWlktmwyT1eCYINB6NveSvWKRKo/0cHq2xg6jlJJMBnG4dioa
nmksq2eQwXLrktKjvlQ2Bz8E5Sj4SDyHIFWERYqdWoPOPhuNiawrUgY67C6PDl9L
Qm91wBibK+ih9hHvZ9NHmBJofU01p77PFN4MDF/j9im7hvfSYfqwN7f+C3hhnq2z
NU0DYyRG1TLpHNLItF7LVEJ+1NYFsoafDKuogNaQV66CSMEZ33vZkLHTaoKcKZrE
0XRGISUHCf5Uw6NKTbIml+l8/YlBoHU+MaOTuBOs1NPFKko3bN3ZIHyR6TNh2gg9
Veb6pq1LRp/ZqcgqmcnC3AOmTIG5F37kNtE0f8YXdt5jrvdq8UrHlVsS4DD6rEtq
MkT7umxMr/xTulGBLXPHiHCPQ836zY9oCUkbLNlDZdx1W93YTKk=
=4hdT
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--

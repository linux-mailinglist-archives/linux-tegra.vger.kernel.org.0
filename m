Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E64F3278FD
	for <lists+linux-tegra@lfdr.de>; Thu, 23 May 2019 11:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbfEWJQA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 23 May 2019 05:16:00 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:2558 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfEWJQA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 May 2019 05:16:00 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce664cb0002>; Thu, 23 May 2019 02:15:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 23 May 2019 02:15:59 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 23 May 2019 02:15:59 -0700
Received: from localhost (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 May 2019 09:15:58
 +0000
Date:   Thu, 23 May 2019 11:15:56 +0200
From:   Thierry Reding <treding@nvidia.com>
To:     Emil Velikov <emil.l.velikov@gmail.com>
CC:     <dri-devel@lists.freedesktop.org>, <kernel@collabora.com>,
        <linux-tegra@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/4] drm/tegra: remove irrelevant DRM_UNLOCKED flag
Message-ID: <20190523091555.GA18130@ulmo>
References: <20190522154702.16269-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190522154702.16269-1-emil.l.velikov@gmail.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558602955; bh=JiNWuDtsuAFVjdnenp7qJhr3ZcqG7e/96vpigUCg98Q=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:In-Reply-To:X-NVConfidentiality:User-Agent:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:
         Content-Disposition;
        b=iUFtbMfA0KvZvXb5x8fcndTW+owvmQk+aCrDaEDBh9R3llWbugB3nZFF/mO1lcpM9
         6NqZLWSeG8FzDCThv70MQ9CZR7Yu434rnjCdrfidYHhq7l6mCS9CAl4NKGxCgFPsGP
         hKeL3iX6f8yCoVcR/Ju94PBnFdzdBOt8YWBpC7tqsn7LJF5iTdbXqNiPnJYl+YQ+0B
         Ja0/hBPJxTd07kJAUmALFvtqeO4kduUbGJ/3Fu9t46Pm9Iv9z6nL5Juil7RsNx7KYP
         H9l98SChRJ3z+BVUYoI9/PTzVCDHhHwXfNiv1/LORchEE32rOtZ4KFUdodFDpLKKLX
         2pv5k5i4APO7Q==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 04:46:59PM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
>=20
> DRM_UNLOCKED doesn't do anything for non-legacy drivers. Remove it.
>=20
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)

I assume you want to take this through drm-misc? In that case:

Acked-by: Thierry Reding <treding@nvidia.com>

Otherwise let me know and I'll pick it up into the Tegra tree.

Thierry

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzmZMgACgkQ3SOs138+
s6HDbQ/+Nb4/XzRK2QUP3qBku8izstd6Np9t5erO7ZgQ0T/v5ctkG3ZZFMTjXRDl
y647hQphtVliCn3BzOyl51VzDN/vEoifIidUI8wkJXnm1fRb9tZxwzJHi/5iDgq4
mfbtN8sumBNp/YPDiGRR36te8qmf+BHPnuJ1diKb5foNFu871NkBWMzUBnSiDzcv
fLHluu/o6OJ7QdGYA5j145BbFlwtI0BNSq6PwGhDG+mZ9NQ4EX+EluJ2NS8fFN1l
4j7rY1qUMldmWSu/WEJR//jHlAUDOVvlLRhkVzHq06UD4OoU+cS2pTSju6cYQ9CH
daTJK+lNU0SFW5RfEtbMGhXLwXRXM9Z98YEXZcuLnRAN6U/gK8i7CHnC6mt89Ak6
LaCRACFyNiaeMC+ISo2F5pc4Lzujbxl7et9JVqgyCrwlVhK7XicjPklV/seXZYuU
fUQOryXR0d//mgo80+FR1lQg7KzsySQyXV1GsFMjNrmeoDniDmrO+3vVVyK3zHKc
EbLsrz2AzU1b8BkD88PjXJeu5EfG7ebo9LcOPa3p55EpZC7YPuRZxf2NmwsaBBYi
sNqkUl+/7Qz+ZihW2PqZYT25pzBysEeEIib9KwWM9yM3m9YlroU5zbftoBOxE91J
aqOAkN4KU6ixgOmh8Ymm5ky5ClfxMw/E2uJkPCmoBGEEpFmjb9Q=
=JLGP
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--

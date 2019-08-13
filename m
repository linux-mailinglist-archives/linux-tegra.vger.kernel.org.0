Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12CE28B419
	for <lists+linux-tegra@lfdr.de>; Tue, 13 Aug 2019 11:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbfHMJaW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 13 Aug 2019 05:30:22 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44185 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfHMJaW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Aug 2019 05:30:22 -0400
Received: by mail-wr1-f66.google.com with SMTP id p17so107080017wrf.11
        for <linux-tegra@vger.kernel.org>; Tue, 13 Aug 2019 02:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rPxNUvPkCxY9I7urtl3GOvag2ns9EI9qUXHNKYyuKhk=;
        b=EOaTK+3ynHmtnx/tk9zNy7spRID0q130X7LqjrejYm4u257/71prwKR/5gnDHwEobM
         B3czEsCzuHU1uGCs6I6zE0DKL2bzP46WQjSX5K5rcysgR+Dzj/Xdgy9Tfns940riSVhE
         uRy/kU3M6Nov+E2IqlJCQDeqGVhaX/5AjOtISDyRmaNYsfceEYJ5MekZh1trNqy9zcBY
         3Ni6zbTbNbIzzINqH0AO2tEtpNaJ7T63Ij4T5EDyitYxFNNEK/Lik84GEw1c7e2Ph451
         6Nl5D12JlS+SM+j/U1ahe5WHWIhs3Mh05CO95q0Ex8KuAYIGe/obGr0IXEiijwFjYlY2
         3uPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rPxNUvPkCxY9I7urtl3GOvag2ns9EI9qUXHNKYyuKhk=;
        b=E1ZfRLTjGnBk+no5Mpdic+C7Ji8Ss9hS0SCKS8+HYpzFkMxL3MVt90AfXNjGNM0D/S
         86ao15yIcOrVK6t36j+RwDUcfm67ReHeiPzc3TNuXV885NUE4P1vfs8z5+C6NlNZJEvX
         OmiE6C7VAWl8CwbuQ3tL3doATab8XnMAWDXvKOCe3lploqa+Jy/KTtaxjWvtB8Nc9ZSD
         p3KO9tEsf1LT2mcjgeEy5w6jMqLVBMIcjdIuvGYi7kutrMqtpmkkvLCcmXjXD12Zv3We
         jU2Je0zw7y/C3GMoYGGELK5e4nt/9vQWzTMzHnzbN/iCwdu+HRAtfF+ycJxPfrnxoKGU
         QKrw==
X-Gm-Message-State: APjAAAUYeo4EmU1ioNBCMlXqOmGWVU5V2lCKnziNxCo22Y/LwyzKwaDm
        K3lKAmCYEVN8voIwqL+Cg9A=
X-Google-Smtp-Source: APXvYqxCN5USDlHFWTM6WRL0ofYfxaJxGEGE4m10tQJJOXltWZN3CK9N79y6CdpBOykjoyhrN/xiLw==
X-Received: by 2002:a05:6000:1186:: with SMTP id g6mr47130551wrx.17.1565688619391;
        Tue, 13 Aug 2019 02:30:19 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id p13sm41515183wrw.90.2019.08.13.02.30.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 13 Aug 2019 02:30:18 -0700 (PDT)
Date:   Tue, 13 Aug 2019 11:30:17 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Brian Starkey <brian.starkey@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
        malidp@foss.arm.com, Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v2 2/4] drm/tegra: drop use of drmP.h
Message-ID: <20190813093017.GA1137@ulmo>
References: <20190804094132.29463-1-sam@ravnborg.org>
 <20190804094132.29463-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <20190804094132.29463-3-sam@ravnborg.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 04, 2019 at 11:41:30AM +0200, Sam Ravnborg wrote:
> Drop use of the deprecated drmP.h header file.
>=20
> For all touched files divide include files into blocks,
> and sort them within the blocks.
> Fix fallout.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/dc.c    | 13 +++++++++----
>  drivers/gpu/drm/tegra/dpaux.c |  5 +++--
>  drivers/gpu/drm/tegra/drm.c   |  8 ++++++++
>  drivers/gpu/drm/tegra/drm.h   |  3 +--
>  drivers/gpu/drm/tegra/dsi.c   |  8 +++++---
>  drivers/gpu/drm/tegra/fb.c    |  6 ++++--
>  drivers/gpu/drm/tegra/gem.c   |  3 +++
>  drivers/gpu/drm/tegra/gem.h   |  1 -
>  drivers/gpu/drm/tegra/gr2d.c  |  1 +
>  drivers/gpu/drm/tegra/hdmi.c  |  5 +++++
>  drivers/gpu/drm/tegra/hub.c   |  3 ++-
>  drivers/gpu/drm/tegra/hub.h   |  1 -
>  drivers/gpu/drm/tegra/plane.c |  1 +
>  drivers/gpu/drm/tegra/sor.c   |  3 +++
>  drivers/gpu/drm/tegra/vic.c   |  1 +
>  15 files changed, 46 insertions(+), 16 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1SgyYACgkQ3SOs138+
s6ET1Q/9FATaE8e/ljpukBw2vJqgwCk0lAruZ55ljBkh0uH9YwvQUq4kMo2agPHD
Q+lcdErT2IqaqqRbotzUryatC26aT7l1QmxaEtgU/uWHLIC8k3elpOMz9CNIHSDh
1NVAiBKMxQtG5nqWWmebr8v/e3Ae9vvxXxbtuMW6YlbupGgp9NS35a5jEzdJhhYW
zqkvUcFZ0xigSmUYBgGIzukI/+q375A8x6JGBiV+/ymu6up9yRO/3OoRrHDCAalt
GCeXyR5drV9Co25GGwGcfIJOF7aIirBhBhVJS25ArXh5uEz8+vhZCcu7UrNC3o40
/QVuTJpyAn5kdW1d8n0MKE/1+dnqapM+W8LfRQAyg0ySftsLDaH8TLvHsRD5gstO
N1KwpqVaKp4a1LrFwVuA2aTG31nSf68rfF9fRUmTNgu2mV24o5Su7yuYYG+vt1pa
LkVTtV8gWHxePSrcFGEaT0fGMmM40fq3qMNi3o8anq20Kw5d9N6PJfx07bMZdlDr
c4IPLKomLE4yJVAkF46+p3hWeGPyhGvUVkt3SGWOO4LTIuC7n4on82NZ+UJv5Eao
bffeD8rCscHn9hVbXm1p4jE9CvIZHWqkfkBxpL7GUP4M2Wg+qp372A8LVraUjsXg
AucjRSo6WFs2DQZf9+jk8xsvJ1QMUNT3cKg+jPfLPZ3wwr0Bb4o=
=DQVr
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--

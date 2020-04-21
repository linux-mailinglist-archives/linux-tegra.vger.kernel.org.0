Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE41E1B3285
	for <lists+linux-tegra@lfdr.de>; Wed, 22 Apr 2020 00:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbgDUWPI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 21 Apr 2020 18:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgDUWPI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Apr 2020 18:15:08 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A73C0610D5
        for <linux-tegra@vger.kernel.org>; Tue, 21 Apr 2020 15:15:07 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t14so54232wrw.12
        for <linux-tegra@vger.kernel.org>; Tue, 21 Apr 2020 15:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Vp+BHFQY1Hh6JqMh5HS6HD45Ub0B5oqXNKVfhqM48lQ=;
        b=WFiYhyJ7pjwr4PDhAdo6+XhGMKZ6vUDucMhofLSqrSLDoxNLBBsduHGlAS7dMb/4gS
         CQS+OLe1TxOdY5c3Yz773SSEGUiuHd1SLEuHNOCwE8D3Us/G6dzoisTmmKGeORMd1SPc
         Uh14qhPXIQshqET+q+oZ78Tev9pXJESyR+rIcXhYud4zi+ZfU5kf9e2CFDYuptN++q+3
         14ilU85tLhHIBkipGRecymrEprFU28vIfHioCxmeOFlVN4jq7VpcrhJ9UwEcfNnAwON5
         cKyMJmIlT8enqTEl8NDVVvCRlNZmZUj+4vdSwhbX3MfkIiGqrV7Eybwpkhqm7lDNNHmd
         dSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Vp+BHFQY1Hh6JqMh5HS6HD45Ub0B5oqXNKVfhqM48lQ=;
        b=s5DxTUleXg9bWrlAhHAz3RLDTVDkAo1LxdxJJ27EqDmAYIqcra881fmYSpo0C/fP3Z
         h4JJV7dxZ8i0By39iRnuujWr2VlYOJGuR+xsBhUOUOh/Ci9Vvn0WjFjnNxKBc6XYFt8g
         6G7l1UAWZXfrW9c+apKuDOeFTUHUb3bg7qDS4O6/IrHOoybMW13Hqvbd6fZCJOKJAk1G
         imBwDKqGiI57SGSNUMUxcT1SYc7YvDZeql89v9KYZBMk3EI8BbZFHj4Efe9XFtiYt7Cs
         9U8R65DemTrjxG46t4et90IbsPyz4vZ1iowgFzIJ9VzV4iu86ePCRSJLsM452xL93xgr
         3FyA==
X-Gm-Message-State: AGi0PuYQw5ksBKl9L3OSQr1lN/vfesuQPKapI2eEqRiEnwqkTFhC0Jgg
        tZO9DkMT9BDSnSavPLxnVhipNip7
X-Google-Smtp-Source: APiQypLzPm6SFJdjwFdz1QWHt7ZDv7wGpy6PStIN//zTdZhF9krr3qs4I+84wpP8PBiC2ldjM8H3FQ==
X-Received: by 2002:adf:afc6:: with SMTP id y6mr25210051wrd.74.1587507306478;
        Tue, 21 Apr 2020 15:15:06 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id h16sm6089076wrw.36.2020.04.21.15.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 15:15:05 -0700 (PDT)
Date:   Wed, 22 Apr 2020 00:15:03 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Clean up GPIO includes
Message-ID: <20200421221503.GA3445172@ulmo>
References: <20200415122427.111769-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <20200415122427.111769-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 02:24:27PM +0200, Linus Walleij wrote:
> The Tegra DRM drivers includes the legacy GPIO headers
> <linux/gpio.h> and <linux/of_gpio.h> but what it really
> uses is <linux/gpio/consumer.h> since only gpio_desc
> structs are ever referenced.
>=20
> Include the right header on the top level tegra/drm.h
> file and drop all the surplus includes.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 2 --
>  drivers/gpu/drm/tegra/drm.h   | 2 +-
>  drivers/gpu/drm/tegra/hdmi.c  | 1 -
>  drivers/gpu/drm/tegra/sor.c   | 1 -
>  4 files changed, 1 insertion(+), 5 deletions(-)

Applied, thanks.

Thierry

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6fcGQACgkQ3SOs138+
s6HLkhAAu4iEB6DmFiY8mIfbg5zlR+Zh1clXUkIPGTDhEGEQjmNF+j3mjMs+Ij6k
fJZapANopEijtJpoAYpr8mDOAQ1gcdWLAaeKfGKWLyW/r3aoDO1ZxsaLQBQIeimN
oIrDycRU0d2r5wbg1bHQfOq0wwaUS1YuHEMx4v2RGSvK/E5IrDB/O3Td7E1ols6l
K8zZFHvvAvTUaecYHwVKac2NqRJVDHjDqvu9YIvaXbJ2VbXDy5kY33MjX8nfBewK
HBsnQ/r8nUpAjSBx9SRZy3lxBiFXfYOiWQwNvvBF+GSO/za5RTWzSJP8WQKvn2eo
gw4Foxqp+5xBEqLmRzjPya1y3y2pno3WKTzLTYPcUjBwu8SnUJ1eAmxj8JQpdRPx
FYeEaka89Ip5fX+NJ89N/pTmRfSYH5zkKecTMbloafmXcbsLP79YsYSEFuiC8pUW
Tot7yRErxDXuCgfeqUwfx/pcuuYHTIolYBGzJkzX/Kylw6tD1kgg3ChngveZjPTz
GS49BeviCSSAELi/B51+vHaQa4um9SSClAlqW1Rp4VI+d16lQsIgO48cUhEUC6X2
2g/BBScvZ5Kl+QBJmDriMHaa6/n4UkU5J2wgnNgcwuPbLJLqsmrkPjHaUr4S+Om7
s0jglCkeo/U/naAYZrQu+M9pkhY+PE9BWWBhWgqiW3C6SNnZyKg=
=S/Uu
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--

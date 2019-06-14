Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8EB46391
	for <lists+linux-tegra@lfdr.de>; Fri, 14 Jun 2019 18:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbfFNQBv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 14 Jun 2019 12:01:51 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40078 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfFNQBv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jun 2019 12:01:51 -0400
Received: by mail-wm1-f68.google.com with SMTP id v19so2830302wmj.5
        for <linux-tegra@vger.kernel.org>; Fri, 14 Jun 2019 09:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fUFWgrHMxZFj694JqdS5Mj4bEK1nUO7EOXhJ9PHAuY8=;
        b=n5K1BgFJN8dNHinLtf34OmSk/68dIJ04uif9ywLR1lDfGCq1Kig7qS31uLwTqAI1EA
         PErGkpp66ID549+T10rLmRll9JqdnCO4xEpge76a4mpB/Z6laJC3XwZSClZz/sdoN6DF
         Vq/USjRgK6FRldyZo9ROlBWZ2ikrM8INMVoYa3fgMS7U+obO5W7ITATrH+oOrdVHV6/A
         DJWYFNX4b/mtd08zRlPz+RWmGCHD6TaKqFtwX9W+MUtaV4gEdwB0ZuHePDPYRGzG3nXt
         iUhzsWvVEfIFgXehdFlN5lXOK6+DaUU3IUPy0tHGbYT+CV23QltKcUAfyZVSyxVu7w5Z
         qSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fUFWgrHMxZFj694JqdS5Mj4bEK1nUO7EOXhJ9PHAuY8=;
        b=jMS5rmf1A5c9tbaAMkZ7uudAZVYOMRGV4UJzM7x8SZae16Hwepi4X7YI458k4QiYxs
         hrjHR+RBcYRiM+DnvCF/AnaNxhKwN2RK1Fokfa7aFO2hgFjzfXKYixSvbNorK0UAAQ3+
         fBZc6PJpb+67L/WkGS45ST/nSDHRcfknPgJZ4OCH9kLrG9Gn0DY+C5vLznPUSw6jKMgW
         e84fXRsorXIBNE0RUcWA8JvYjeiKLynBsprhMtsPzJDdgXw5CAFjjEJIy2okXKfKh+bW
         UTHTLTqenNwU5gBjioPcgmzFe8Wko1sPx/xPpPyFRbra4N8kL/GOitZEmqiNGztzsivH
         tU3g==
X-Gm-Message-State: APjAAAXiCJYAIU591+xH9yYRo1ciOx4KH1qd6Iw+jPRpkiC2m/23vxgC
        8uYDZK4tFN+gl9WJbFItMejaY88Y
X-Google-Smtp-Source: APXvYqy3dZO9hdBko6KVw3wzXcaVPzt7z4Fgaxw8z3HlBkP23ru41yrMf9/CE3IFELNjwTICU43WnA==
X-Received: by 2002:a1c:9e4d:: with SMTP id h74mr8809366wme.9.1560528108891;
        Fri, 14 Jun 2019 09:01:48 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id o14sm2901938wrp.77.2019.06.14.09.01.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 09:01:48 -0700 (PDT)
Date:   Fri, 14 Jun 2019 18:01:47 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     treding@nvidia.com, linux-tegra@vger.kernel.org,
        catalin.marinas@arm.com, will.deacon@arm.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: defconfig: Add HWMON INA3221 support
Message-ID: <20190614160147.GA28409@ulmo>
References: <20190424181010.28950-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
In-Reply-To: <20190424181010.28950-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2019 at 11:10:10AM -0700, Nicolin Chen wrote:
> Tegra186 board under arm64 is using this device, according to
> its dts file. So this patch enables its driver with a "=3Dm" as
> the other HWMON drivers.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0DxOoACgkQ3SOs138+
s6GVwg/+P/AvfzdpZqk+ZPGxa7bpI+hMZJWx608PHZLFziGdVT6L4TCTbkitOnA2
lsrSkOXjfjVBbxe+wz9zHRYjlQuTkeqNJ7qa/q7X0IDXn3L238gOz1Cw34IBu+Uq
GJUlHtzqAIMd4QoISPKUkEn2QxAGDJyxFq9XPOCgxcwwfmLK7J+n0qdfSrX86Azc
T8itykniaIepsFW4T85KUAd+D4ORat7sns5gpWNKqGG5QqCJJDLVURK8pDflqltz
x5EsWdPy7WrPV58CCj8dMKd8xO5FM7qUUlzP3/vQILQiXza9npEa6Okg5tTd1Yo8
Pso2qjA1JsoO2nxMYU1MOohveyuuuk0E31imHNf5Uem5x/ThUPWZQdXi5q5OMKl8
o8miSKjm0IFHE9mAgM/lQ1kGmD2s1eNpl90uObQFcqHeoLT6/yNlIvNLP5Ij7WW2
HtHG14Jbd2Bmax5OY8AFI8DPFqLRAJsyI0fAFFveZ0dSsn4fo08WAwbjRK+Ps0Ue
+94KsuaTg7Ig5aZ9fhStz9LGgw6lUG64gA/DjgQWSP0Q8f1Vr1LgB4T43x2tZ7Id
x95bl3PkZOavjeuGjV5FFV4K+foMkQyUQDHKFx2VimGo4ZH6xv0HNa+X9D4XeHx6
GD4tm6nhf2PQ9H1Oc7Rt/plmwhEm42sN+8DJAPpigq22j3i0bAE=
=eXs8
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45C2CC37EF
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Oct 2019 16:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbfJAOoQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 10:44:16 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38322 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbfJAOoQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 10:44:16 -0400
Received: by mail-wr1-f66.google.com with SMTP id w12so15872887wro.5
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2019 07:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OikTbuqK6A2qTYHDLDWJoXT63eutsATdUGWY/2GQzJY=;
        b=abMEp6vzixxcJfYcyYbYKRyEjJJRmRs/RPQS+OBV1oTZg6PVFHWb6N7pL62AIt0M+A
         nenqJUao+vG0+vO25Y9v0OF9a5uPnTLklvc3IuOug/FIavtKD+r7nBKqK2qw4MnD/N/H
         wtjTOw931MuW3F4lbuOblwUN1QHWZwJYReMXzlG7NorNXg9WeqxcF+n9QwUKa/Jll957
         PRRuOwfNrB02p/3sYF3x+p8uJVBv8N6j3A5IRAbNhS9ls2nEL9oEJm6SLGsM6IW42fuM
         Ahvo+mFz9iGCu/z553gi0g0lVWQjnSAie455OTm++K8jHP2Z3tqL6vLTC4OJa9slSRPO
         8WNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OikTbuqK6A2qTYHDLDWJoXT63eutsATdUGWY/2GQzJY=;
        b=F0ZxGhjagR+UXl4PBsd+bn41FiFmwq1OF4u3IaxCZ7KdC/Hk9yJCpiAcCunOobZQeT
         vffvetRUZscyJL7ekfECNzhsqrm+KxkTPf32hP2ouynriNOsZBz8gAJbNqQ4de4zv4yo
         2HqZe5wtifzryjmY8hX3cTPBkN85YeQyTzdKX60hYv/XgyLvkWO6ksRpM1YqLN2HIEX1
         BrP6hy0WrK0OpAhY8Ue9XTE/hSsXfBdjkR64kvkhyOVqRNBD3zORp2VosEnjcn7aCGWM
         QX1aeguNKGMPg7gaaMoc+vPJ1SnZJp0vKiwYAcnw/bGfEPJiGZN7eNw00QoCxqmCywEK
         VIGw==
X-Gm-Message-State: APjAAAVP11cbSIYTnX+Ia0WWnZcVB/F+PvemsyFexbkVE+T3XFY2Kl6A
        e2Kl92bZRswq0rKK+8YedF8=
X-Google-Smtp-Source: APXvYqw2ivYLXplUjnZIZ1ea/NWJkCSYWngeeeWH9PEqywV7J3OBAaBkyMz3gocbVVq0ZoFVVpX3Ng==
X-Received: by 2002:a5d:4f91:: with SMTP id d17mr1240548wru.329.1569941054301;
        Tue, 01 Oct 2019 07:44:14 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id x5sm15850173wrt.75.2019.10.01.07.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 07:44:13 -0700 (PDT)
Date:   Tue, 1 Oct 2019 16:44:12 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: tegra: Hook up edp interrupt on Tegra210 SOCTHERM
Message-ID: <20191001144412.GD3566931@ulmo>
References: <20190829105647.15212-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8w3uRX/HFJGApMzv"
Content-Disposition: inline
In-Reply-To: <20190829105647.15212-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--8w3uRX/HFJGApMzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2019 at 12:56:47PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> For some reason this was never hooked up. Do it now so that over-current
> interrupts can be logged.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to for-5.5/arm64/dt.

Thierry

--8w3uRX/HFJGApMzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2TZjsACgkQ3SOs138+
s6GzQhAAp0Igvn8aJSUBOB43OB1hXJ2JhVy10rLBK6HaiyTJhXvIKJ1m3yNjE/e1
J0ab0gMK7TR9zIwqCLUHFgofCssyMmdMaS4d4/IUzMfRE0B/g35e8ysP8wWDgKRs
wS5ISsi2sRbAyVeLCL4tQxcreF9kFEcIvQhHGWmOeAfYZ+vljDtawGnKynJ7IChz
CSkPoSesMQMmp3xcbZY8/F/X928XyluXv4pNuka/os1b2rUeCcjMevOVZxHDLqT7
UZh5W2HSDmweUHDbupQDmjM8mSwou+2yFVziYz0s2FLu6GNGczER1NbXrL6S6GC6
ivUl+1Uk9pyP25oZpVVeE1LZZPddDS9qBKY9amJp7+/DILo38KR1JXGwH5e7pG5l
E8l4vJ+Jwunx4PRHEXABe9MtBCPLUESKEUcBCVwKv2o5HYFYayJXVMVmHskcRosW
9a7CkGM4djMO5ac0ovjziimiun5WS4LYffOv8xzzLV+jUM5tdbM0F7X/NkQHvOmT
w4weKWLgJTebHdDi0lq7N1UxGVwZLUS9uh1MXVDPPToMimiwzrZxCMM4XfCOm0df
sBTJOyeoo/qgOjJNlZmmH+z0oKN7gU1/VyWip9LkxbKzpIyFFkXyg8xDrA9B3SYU
YMt+CRvU0SPTCr27sc8RccL1ZYjW25hU14fUssRwYjaWP422Ngg=
=Fg8B
-----END PGP SIGNATURE-----

--8w3uRX/HFJGApMzv--

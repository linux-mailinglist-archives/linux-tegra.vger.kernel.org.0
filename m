Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35286136FA9
	for <lists+linux-tegra@lfdr.de>; Fri, 10 Jan 2020 15:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbgAJOmg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jan 2020 09:42:36 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38644 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727915AbgAJOmg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jan 2020 09:42:36 -0500
Received: by mail-wm1-f67.google.com with SMTP id u2so2241110wmc.3
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2020 06:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gKS3tmch3/N52rIjlRbWARSsIZOOYHk+mlsPe5bDVj8=;
        b=aJanFcVoy2Rd1C10Ch2urhYr7PS2H8hqKDxM2RsiPdxs1zCgNaE0ocnR/vJAyt9nct
         41YRlGs57XiJ68MPGEe6yorYBu5us3VtSsRSxIwHsV9+DKO4C+xnLLtxIUGSy/7F0Fn9
         XDBs39XCu8jx2ZVg/d2sJh+fKjI+UwjjyxchmPWP1yl2P8lFgvBfvl7TgXyubbeUywCb
         xstJFj+tilo9MfgzxOkcBG6S9yWEgUtiu08IC3S0bVlEIQcYL70J2ec0vO6GadNu6Xgt
         4wFtX6N9iBT3FkpK7czZTOoCORaX47j9S3jrqSE4+sPfBJjPQdoc0Fb201dJsQkGmo2h
         /0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gKS3tmch3/N52rIjlRbWARSsIZOOYHk+mlsPe5bDVj8=;
        b=elVzUEb4md+u06v9AdksK05Qzpw4SWYt7sj62Hp48jA8u/S3i+qzOu1ZeJcji52qYA
         IZvXfuTMM/1HxwL7bGNzlx68hUZ22GJoCiJGVrsvOL5xpUfdvEMW839SyqiXzE5EvU3R
         /mznCs8ldHwUsx/BdsijASTQ29BrSeY9LGY/f8yvOhLgXOsm6VctBADKUJH+A7Sp+5PF
         QoZpGK1JC7YdnIVt5dFnmOEf+n8WYBQGEwddnkAeXf2zWMj2TfCEWBYmQDj/DvmW+oxM
         RmvmNHIx89KzRdN5IMh9Bh2ZX2E/ZrLpiA28780uwIx+7FdovQ2iH1oeW7cALJbjzGGi
         MnKg==
X-Gm-Message-State: APjAAAV7qHvNnoo+dPPr2Ukc75wU/wGdlaJ982ubOFDOa/OPv47txhJI
        4E4PnFQNHvOzLTEV2wT72KM=
X-Google-Smtp-Source: APXvYqz6MIkjIhRqqvAL7tRkhLqTzfa7harTlJeLc2ay364R1ODbrwaPuY6Y9KYi8q9A9qdxpuERNA==
X-Received: by 2002:a1c:28d4:: with SMTP id o203mr4788843wmo.123.1578667354092;
        Fri, 10 Jan 2020 06:42:34 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id n1sm2303297wrw.52.2020.01.10.06.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 06:42:32 -0800 (PST)
Date:   Fri, 10 Jan 2020 15:42:31 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Marc Dietrich <marvin24@gmx.de>,
        Nicolas Chauvet <kwizart@gmail.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1] ARM: dts: tegra20: paz00: Add memory timings
Message-ID: <20200110144231.GF2233456@ulmo>
References: <20191218185957.29237-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NGIwU0kFl1Z1A3An"
Content-Disposition: inline
In-Reply-To: <20191218185957.29237-1-digetx@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--NGIwU0kFl1Z1A3An
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 09:59:57PM +0300, Dmitry Osipenko wrote:
> PAZ00 board has two variants of DDR2 SDRAM devices for External Memory:
> one is Hynix HY5PS1G831CLFP-Y5 and the other is Micron MT47H128M8CF-25:H.
> The Micron variant doesn't have official timings in the wild, hence only
> timings for the Hynix are added. The memory frequency-scaling was tested
> using the Tegra20 devfreq driver.
>=20
> Tested-by: Marc Dietrich <marvin24@gmx.de>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra20-paz00.dts | 46 +++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)

Applied to for-5.6/arm/dt, thanks.

Thierry

--NGIwU0kFl1Z1A3An
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4YjVcACgkQ3SOs138+
s6HkpA/8CbhhHcQAkwJsrNO3qGrC0BCvrr95IzgmK2dlrt4HRaX0xI93G/7lAs3A
ESdv1OCJbpBUYV5qILm9PXeCaUPHgQVbRB/vf3WvJxFUqtOHeo2wP8931G3RsWVK
ZVql+BiFRh9+DNt12XcAATzsQ0UKA49+SVib7oR4jr7DYcWLqKrUyHeGkORLBUfa
ayLd/MrZg0gRG+u4cWgV5uw8J1gfWoyt1mq3hBSyvFGNhNuk+OIdsXZRpjrfGY53
6DriMKW0Lm0/vX6z4vAs05NBQttmYO0twCVTkqD/QthAz2ssBxBsizou7PyivxYo
elP0ufCAugGveccayZ3nv9vOU8TIBNpAWTu7teiNndB64SWUNZjnYLeQhS1SmzEW
hNudE74BlQsG3tNtOhvAq4TihFcl1dDMG2O4eV9Kll05X2BSAlVwZWUVJ0wdYclL
j9qEGReoJuyPweinCP5SRXdgqRoMQZsGFXm/B4F6a987OEiEXUJ4tVchSoAu0z1t
aIkHm1Y4VpQrivAh/7cFj5JUbxQxmAGLx6sqkAy+9B141Vw/oLYHdCibs7OfDxip
JGGwV7BLtunWMhi7fs1XKb4X+ocZlBd8+WSYLwWwwKU60VUJa4AU/TeBO8UL+RKB
1Wa8250M4xugLICBcfJi8ed/jfPbcbntXGiJkpnNsF5BZY1dUaY=
=ljwl
-----END PGP SIGNATURE-----

--NGIwU0kFl1Z1A3An--

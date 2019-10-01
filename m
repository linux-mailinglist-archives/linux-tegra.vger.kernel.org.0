Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF777C37E6
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Oct 2019 16:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388297AbfJAOnB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 10:43:01 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54099 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbfJAOnA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 10:43:00 -0400
Received: by mail-wm1-f68.google.com with SMTP id i16so3705831wmd.3
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2019 07:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xaOfNL1OoZaAEZgoqD2y8IAN6v4PCX0JaZgRKFJO1HQ=;
        b=E0gNF8L/rF2+/OEqxB7EevvyKkiZVOzrtXCSqlpesiHT48i4OB1hNnkCNBVHpA2r26
         i9hIu92U2PzHxk7nqyTPetkju8UyyfbJD0ZV1c6ZkYkv1/aDOPdtNHPlN6EmMNUyZ4WW
         LGpL6LwAzqIMvv9oIr4jaDg9L9383R0bg55LZGmR4uGUBFHaRqefR8udKsWer5mw9mc7
         yzi+u2xDfi+gBQrSQ7NtcMWBD+JA5YujOY+rcAgp0NGX4jVeWpJGNwMuxKrqPzyGuFyF
         mnSWKRqeSFh/pNpcmiJDHzCh8dpJf3rmKklSbEd3SRzfUyyPIBFFuAksnP7BRFutw+V2
         fA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xaOfNL1OoZaAEZgoqD2y8IAN6v4PCX0JaZgRKFJO1HQ=;
        b=hPDQ/4ePo0xuXLxcwmHq/n9xiKdyN/yLI/9nqZrkWiWtmhRHoQys9d+Y1/zvN1I1lg
         CVqKNa/P5uzjFtXGUFt8HJM0aKLzpUhq5Kl2sSzX2czqjuhRJohxHzHhWRqm9IzZ+P55
         ryShdqkbCmqnKVlOWRaA+GEbQ5q+H7wo/ny/sY7PbYqEOckRS03dtG/2fIF1FMqm5UQ9
         cH5KSBDQ0eS9jfqT6OgCMHP5HxAY2zrcy7VIIrQAfVgSTgzPKhIwKlXxaXyN6OEClP51
         HVXVU49Otgr1lahSwm9ly9JW6RWvGGjxmg/kg/4o3QP+L0Z7v3Iaf0ckOL89SOANC1iT
         G0kA==
X-Gm-Message-State: APjAAAVpO1su1b74lTMNSAjnWga294cSnSjlr+XRWilo4Qx9lnOlyxX1
        vTVyzjQ9BsIg9OTKT8Mb8VE=
X-Google-Smtp-Source: APXvYqzqyaxiVFjSZJ6se9jVgJ+Ez033K/VSdXb3iDYvQzAyyD9+O3UxsFJLAzajau0VXwFABU7zmg==
X-Received: by 2002:a1c:49d4:: with SMTP id w203mr3822100wma.132.1569940978003;
        Tue, 01 Oct 2019 07:42:58 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id i8sm17866280wrw.36.2019.10.01.07.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 07:42:56 -0700 (PDT)
Date:   Tue, 1 Oct 2019 16:42:55 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] arm64: tegra: Add unit-address for CBB on Tegra194
Message-ID: <20191001144255.GC3566931@ulmo>
References: <20190726101618.26896-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ctP54qlpMx3WjD+/"
Content-Disposition: inline
In-Reply-To: <20190726101618.26896-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ctP54qlpMx3WjD+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2019 at 12:16:16PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The control back-bone (CBB) starts at physical address 0, so give it a
> unit-address to comply with standard naming practices checked for by the
> device tree compiler.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 20 +++++++++----------
>  .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  2 +-
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  2 +-
>  3 files changed, 12 insertions(+), 12 deletions(-)

All three patches applied to for-5.5/arm64/dt.

Thierry

--ctP54qlpMx3WjD+/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2TZe8ACgkQ3SOs138+
s6HDfA/7BP/RRUz2uNcWaO6MfcsRZcw/kM1SqLT2nzI1Afne784R7SeHGLR3U7uh
hTFwQWaMN7lnpuN8+slIqsZLXdxZpSi2ZixYRpN1v982pqbe3ZbuyfPELvkkLtmf
fdFF/P+aQZE1mqGywjv/7gaXUZS8mXan0Y5a6No9PIk5/7xqRyRXWdXajiFZuf4N
w0Yg028XRx82BFIU2izhM3UUqtBIFkaEGnxr/+U4hybquf1nLfO7SdyVD52DTlH6
Yke1X4/OOqwjvseZZtSe7hU5ViYYKMInhDHkxKw5J/lyXtlhS1mkcpInvk0oSrhn
x+642n+BCKV8UWY9x25KWPyCjlXr+40itoS7F/3tuihhbQc4wIiejXwnJV2s3sUO
JuJwOqHFujpEPqwyYCpzjL8hla4Xkf2YaLsyesZ6GIszoWa7I77CEky7L+2uoizZ
9qIPnZuWooUDHOt06h1o7ONMnI3jXMIrNz234SIrZv7RQd1Kfp55xMENzwIvsUB5
KjM/sCC2Q/3t8hw5VaF8jv6K6I0hi6If1RD9k1j4kVA33TDgbib1rkB0wcZGaB7F
rnd63GdZIVhXGDgtjXdd+gsxIwNWN/5PZRA9/3gqWxYF2pAdyAiMZ2c9wdx+EznD
p7Hhtx90GpA1aVClyQ2+sKf26KmFczNsfV6neMkG01R+M1TABFg=
=1T99
-----END PGP SIGNATURE-----

--ctP54qlpMx3WjD+/--

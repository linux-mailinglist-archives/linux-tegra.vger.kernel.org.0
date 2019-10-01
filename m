Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91E3FC3790
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Oct 2019 16:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387781AbfJAOgO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 10:36:14 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50233 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727143AbfJAOgO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 10:36:14 -0400
Received: by mail-wm1-f68.google.com with SMTP id 5so3705524wmg.0
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2019 07:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4GDe6ksKaFyDhJQyRseWFiKeh5lvTxFjO9+Wkwvmvyk=;
        b=PleFEI5VX8kgq6C4rvqz2HPa/pO9WXKgfeigc3ETkvQOdxFnOlwB5/lrcF+jdeedfE
         asbbV0jaXVCxmRH5fcY/mLD7Es2m2F+enYgVLbndwmSm2t7w/zPp5VV7vw3ZkqEdD/kk
         LNjD0Uy5gUM4VYyACmTDpRCNrxHgcP/DF/6nD2IpSKk5dAXncA8hjt8XPaq13CdX4bBe
         OGgY4/0GyzT5YFEMk42qlfGuAyqc+gBWjHCrBymBfqqGxAL+1lUXzA072VrjtP73epu6
         Du4tynBubvABRarEyrSFqqQMnf819iXTlcVijYuN3gBodI8wQsC5VLW39u1VDXhA0e6p
         mjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4GDe6ksKaFyDhJQyRseWFiKeh5lvTxFjO9+Wkwvmvyk=;
        b=uMhcvTQPhfXXtqeKOrQHYU3hi4nTqk0qrz9mN/OgQezD5er+/crtZHsQWR4BTePz80
         BQtr4RGWIBL4YT8v0aA7CrprQYTNFF9wWPO1s778aUw3+kBwgBBb9GOPgoxcsYrzlhM/
         CxRroDa2M1tpcwE9PMLAPia3ZH36DPRuuWZU06zsnGOaoaZbtIavsRfTjM9TTHd+1gZ0
         xlfR2O894mb88pb++Aahv8xZNliaVr8DFtWahF8iQV+lxEq5bkQ3NMFR6EDDlQRsrxl2
         8Z0d4UlZ754qntGhcq1rGkACJxZ6x7IaSqlJjGp/OFfP1QhmRz3/GzvRC96UdQo+Sp1O
         gzGg==
X-Gm-Message-State: APjAAAVRXz4oGyKp/kP0Dk0vz44eU+G4D6FFJCpBC/0piGIDXy1IcXAz
        urC0Nw7Ot/6r8AU8N8JPEV4=
X-Google-Smtp-Source: APXvYqy7yk9cIjC7awFNWla4pKitytDBd28oUpDGamdgpzeTLDRdVgYtpyLJ+OBl9uFLapRnYBSVPQ==
X-Received: by 2002:a1c:23d7:: with SMTP id j206mr3982003wmj.57.1569940572822;
        Tue, 01 Oct 2019 07:36:12 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id t6sm5323112wmf.8.2019.10.01.07.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 07:36:11 -0700 (PDT)
Date:   Tue, 1 Oct 2019 16:36:10 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: tegra: Add CPU and cache topology for Tegra194
Message-ID: <20191001143610.GB3566931@ulmo>
References: <20190920145621.12527-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline
In-Reply-To: <20190920145621.12527-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2019 at 04:56:21PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Tegra194 has four CPU clusters, each with their own cache hierarchy.
> This patch creates the CPU map for these clusters and adds the second-
> and third-level caches and associates them with the CPUs.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - fix reg properties for CPU nodes and update unit-address to match
>=20
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 156 +++++++++++++++++++++--
>  1 file changed, 144 insertions(+), 12 deletions(-)

Applied to for-5.5/arm64/dt.

Thierry

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2TZFoACgkQ3SOs138+
s6E0DQ/9E5bKqzhcgdK1ReNtJcRQrizoLvlpRBtXyug8WVy1ecWNq6sb1LJrI4R8
GtT5QPNuZxb0xQYeoeIEa6qIV+TSbzG6uM3MHQE6JNTd53qFyx/P3toMqJtjupfG
IoS0Z8ojwvJidBXDOUFEfyl9q4AWOaYOCVA25NkA9EJuDSgLdgFTmkRnm5XUmpxy
3vV1ykDdN6chQrjGS49VOsU8xToWvXQ6k6yztMY7hrD+g//FqavbyIFVvSAs/bzn
RD0EJQkDWHopJ2EXgzCDJYzNtBE7jNyeJzxF4L5vIWf8X/wssdZFWD5YP5hHvNiY
gAFThEsolGcdMaU6WFzkmVf0ZX/+uuNh+KKMI1p1HtEcmCqANwmW4VfvfpKiAtTf
El2VQJ+C8JiqP/MX2MprMzzz6hv6THauEgKoTIMs0UaEO7a+4QoGoyWteoznhpfE
VkgIg1gPY/Jld3RETzk0jprU8KAweV9nzf97q/WShVe+Vrjw8hTrcUZYb0F9vcZc
rzdr8ZaIZLqSZXOnRFPkGiaEva0BecpVg2lEsddYy9GDbOALN5nNUgz4dsoUiQKZ
otSmXTpgDdTuxI7B6S5yVWbtEXKcMKQfR2iejvOV8WDKP1pqcnNAAopcxVlGvOF+
FKjhoYwZ2mYqb0clGHbRGlWQV1Eu/XuMPzbQJndIK71OUPuS2+s=
=YAaR
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--

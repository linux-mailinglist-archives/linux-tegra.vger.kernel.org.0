Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1E81C76DF
	for <lists+linux-tegra@lfdr.de>; Wed,  6 May 2020 18:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730088AbgEFQpB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 6 May 2020 12:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729747AbgEFQpB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 6 May 2020 12:45:01 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D68C061A0F
        for <linux-tegra@vger.kernel.org>; Wed,  6 May 2020 09:45:00 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g12so3502806wmh.3
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2020 09:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oIvgZsV8Bgyu7IuZVIKOz1YRNdUcKs8YV3CKER49pp4=;
        b=rlAVzuCLwDb7yuepHZjDlpkldlozrQBNJHtWRoxWMNk+D+zYiWKBnB1dIF1hx69qU/
         f23R1uUhyYfRFzb+GqsAIk6g6qIdqDWxNAI9a/cVMogaLmb0+9oxVwg4WqbjcjIwarvP
         PqDIbeXVkh3GUJxYSGEzfwNrsqyIf7ClGM7CkZYknsALrlPBYqmyQEbI/i6HYC5ZI9p+
         dHaVgOxKVKZbhQigUDRIo5fFFPC9cgFJWcLuCBeVpDrN/JN0QRgBBNtZMoVDASaAh2Sp
         nriAg4Ma+d5AaCe8VQCfcxcdOCd16ZAH3CJKfMQ7MqPgdxZBxrJhH5hn8cDKTgUFsobC
         +L3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oIvgZsV8Bgyu7IuZVIKOz1YRNdUcKs8YV3CKER49pp4=;
        b=ZQC1fFTlqNL8vgC0Xu9Am/23XTgvNW7eFUS6DqtIWat2qiTXtLCa6N8kj7823JCWVD
         PZCO3Get3YIegERIf5VluPvcuLBrWz4zTauHqbL2AcDKyCCb1yD0X5zIuWCRmiE+q4Rz
         b7A+5zngMxwUZKiaovRpvytu/aMr54B7jsJwwL8WR8H3dcSUuodwy1a2XzrDiP1/r3BR
         b7I+UHQmVDzr5x9AZTBaVIoztnjq3QeHi71H+c2LKpRJIZixLy5Z2ADfrEp/oI3vMWER
         R3ux0N0PbAhs30shDVdAfwqzssQ5BvsVe34FsXBvX9BTj3dKAN9Nyx4B9j3NdmD083vT
         r1uw==
X-Gm-Message-State: AGi0PuaC6j/NVo/fKiA60ttBvUqr2Gpy4A9Bd9fuOzhVAlt5H+dns0/k
        4vk/uI8r1qoQnQBfMrXkU/U=
X-Google-Smtp-Source: APiQypIaTilY72QfLDVV1ORbOcvMtGYTS8G4EsZWV/hlZ1XECK0SB6jJFg74PoF1MZTDo9GRdbREvA==
X-Received: by 2002:a7b:c858:: with SMTP id c24mr5690005wml.51.1588783499394;
        Wed, 06 May 2020 09:44:59 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id w9sm4005996wrc.27.2020.05.06.09.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 09:44:57 -0700 (PDT)
Date:   Wed, 6 May 2020 18:44:56 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] ARM: tegra: Correct PL310 Auxiliary Control Register
 initialization
Message-ID: <20200506164456.GC2723987@ulmo>
References: <20200313090104.20750-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
Content-Disposition: inline
In-Reply-To: <20200313090104.20750-1-digetx@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2020 at 12:01:04PM +0300, Dmitry Osipenko wrote:
> The PL310 Auxiliary Control Register shouldn't have the "Full line of
> zero" optimization bit being set before L2 cache is enabled. The L2X0
> driver takes care of enabling the optimization by itself.
>=20
> This patch fixes a noisy error message on Tegra20 and Tegra30 telling
> that cache optimization is erroneously enabled without enabling it for
> the CPU:
>=20
> 	L2C-310: enabling full line of zeros but not enabled in Cortex-A9
>=20
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/mach-tegra/tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to for-5.8/arm/core, thanks.

Thierry

--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6y6YcACgkQ3SOs138+
s6GD/A/+NzmvjIPJ34uaTNbvaUoVRNP+HMuGLoEmhzzf+wTDrT0UwTVlz0nKSh7F
6vwI05FUgT3FRozK65BE0DtYYjTCLQhISvMBn7tJ/LfHOGiXVuZeSLuKKzfkrleZ
wTuPkYj4v0lHtOncYNWDKzxHKYYbsoRKDVxyPnH3hLFbsxyG392xzcOgsegiv0Fk
EFED3VkVMoS3zSU2amy0m8BNDhQFojA2yYIAb76+fO/amRpFGhyi/cbU3diylCuY
RiOGX2hrfnkC21zMYl8vLE07QCAnm9ZiFU2O2hjp8l9fDIBdGo8UvT6xv4OKuo/b
lMWuO7z+tk+f8BovUQ6W4PSrL4xEvjKBoGLQzyDTTfpMWrQ9cJuFufg9FkskjGwD
oJV5IJdy5DgFmbcWHhkNveCLSE3CO4/NfNuWQQAXE1yfsP4m+rn3KQqzfCkiKnUL
SU4FwucPNnR7BwrdeIZ5kP1F9Fi0toiOuzZv2EgmtjAomlX7JYJy8Usi60NUptX5
UYV55WiDmRpVavBOTzuKLnqOXYfNpdzkQOuWzjjJE4+LjinqtTJcP8Oc3gBQyMaS
9fxR4LtKLBnBMPCA12+E71prlZZnMqUQcy2CwU1iSqdrR577AjPQsEtIY6LNYzCE
ogWFdne+JAry3+gwbAPxmYkAx4SLVvHrpCfOAlZl5mI8M3KwXc0=
=1shP
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--

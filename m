Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5DB108C95
	for <lists+linux-tegra@lfdr.de>; Mon, 25 Nov 2019 12:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbfKYLGM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 25 Nov 2019 06:06:12 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40553 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfKYLGM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Nov 2019 06:06:12 -0500
Received: by mail-wm1-f65.google.com with SMTP id y5so15415224wmi.5
        for <linux-tegra@vger.kernel.org>; Mon, 25 Nov 2019 03:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LP4ruR3l8U8jOVtJh9rj4vJon13MDWrKBNh0vRk+V8g=;
        b=iN/NHjotEqu4HB2HiKrLQTO9c41pQ/u/KCZEjhITSlOKW6soiGMM6yVi6/13U/ccnn
         z6RKwe985J5G5TX3d448JZCvaVQR7Y6wux6/LPz863vXyqKbqhwLNj+EPtdoq4L5onAY
         zwnhBQ3LCWaDMcuXJk/D8W2JilaLc3W5o9JO1vkinS7C4ARr53edlG0rLJdCPlWbZpSb
         coNawyqp5myA1l9tBRg6bXHwuAbHrZvfT8gvk6YU3ap0e0RWbcDQPGqqrKBrMKrkSPbO
         efelmzKfAmzpchklCArKtZbctd7JcUu1IDIS6r954hGP4Kq5NgLzS4lA7hL8E+Kn4BLR
         jmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LP4ruR3l8U8jOVtJh9rj4vJon13MDWrKBNh0vRk+V8g=;
        b=VpPvtqAJZQEw50ddSq//wBcpYFdMVP4hA0/C/KsGA/n2fEPvFtEUXu+MUYso0x2yef
         qGvm/sUelM45++mR5nZgaphaZzacQO5oZZy8C47GqfR+G+utj+50xtWSrruTz1OotTX9
         5GjGLZN6fUgonOUBXniIXAm2AVOd3SW/CAYM1A6NSaAc/wRG+yVDemtc5Qjo4/Lctmwb
         JIa5VvlzQjLNfWolLTJtkStTQJyaVfHSIPELTBiA2kQU0weJHpyhzjjoFUXu2Dx38AIc
         7xD+HAdz2MijlGBBVOyACaClqGA+n+55giMBUxGd/mt3P7gToFvwhh77XhQZ9H4PkWJD
         aJPQ==
X-Gm-Message-State: APjAAAXJuBJXW0GWk1HuD0jqG4of7D0l8pNgQ3kNz0MKkeZ2NK61CH8z
        VftyGwU5q3tIDN1vXJWqliRcplD8eX8=
X-Google-Smtp-Source: APXvYqxhK5BrJlrj5nlHZWUcvie5k7xHpkQdCSJkMyneCP6NcvgKpneX8mON58HTSgUpiYUo1Z1CfA==
X-Received: by 2002:a1c:46:: with SMTP id 67mr29793076wma.51.1574679968492;
        Mon, 25 Nov 2019 03:06:08 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id q15sm10246754wrs.91.2019.11.25.03.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 03:06:07 -0800 (PST)
Date:   Mon, 25 Nov 2019 12:06:06 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 08/15] drm/tegra: Remove dma_buf->k(un)map
Message-ID: <20191125110606.GJ1409040@ulmo>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-9-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MzdA25v054BPvyZa"
Content-Disposition: inline
In-Reply-To: <20191118103536.17675-9-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--MzdA25v054BPvyZa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:35:29AM +0100, Daniel Vetter wrote:
> No in-tree users left.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/gem.c | 12 ------------
>  1 file changed, 12 deletions(-)

Same as before, I don't see any regressions when running some of the
grate tests, and there's obviously no longer any reason to keep these
functions around given that they are no longer used, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>

--MzdA25v054BPvyZa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3btZ4ACgkQ3SOs138+
s6EBQA//fk5PmctnVvlQOE/mbBb4DbiuQwzB80jnUxJzXO6zy+zkPP6rbQ/EMps3
FOJ0tXH+IW0sqNtNut1nuBFounofQejEt+Km2mDa8EAXf7Eq2cckxZjP0kRIJUGb
sjsB3GtJmt/lte/Nni/TRKuZ4vvCG8F2cYUHXR11USBx4POjAP4E8uACGjejlYHZ
8RtGO19/7PbdyADTDqJkh0Q6c96cvWbc8sXAud8hJrBgc4IjX1Hq/alRvqqwj6ET
5nWQvflhdzcwMurhY+FtItmUBkUCXSRU+c+dqhhEbjwOmjodJqrqDW5eUYDfvA0p
26NCb8svcq0vuTzOLkP+++UBxL2ZM1ZpS15NZ4nCh7z5ilZHupK8gqXQCBU2CKTC
xqqtwZcjsPp5H57gDjBAJ8NkORLbL9GyTxTIJ29tUHf6LJYf9pKSoUk9lyWuYb/4
cWJlzCXVS3brX6jhFBozE4MHjstiDnWi3au/IIrgWAjiFEGQihMvGV70fMg/pTUn
LX+qb6oJzZuPLco2x8kNoYVEbDA2RNYDaj74VsIHxLCu/4EAB+STkzj4iaM92WoG
FNMaMdx1QU22xy806UUA5G5iV3JQU8kuoy0BqmXiNc5O6E/zFH/YWYKXct89YU8G
WpAwoNdRCNByLGSOBk3yJymyzrNAQDPadju66SN5f/WS5zOKiv8=
=KGzu
-----END PGP SIGNATURE-----

--MzdA25v054BPvyZa--

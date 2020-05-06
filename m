Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51551C76CD
	for <lists+linux-tegra@lfdr.de>; Wed,  6 May 2020 18:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbgEFQoS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 6 May 2020 12:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729669AbgEFQoS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 6 May 2020 12:44:18 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E25CFC061A0F
        for <linux-tegra@vger.kernel.org>; Wed,  6 May 2020 09:44:17 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k1so3012541wrx.4
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2020 09:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wyKk4Smwb8pEAuoXr1N9sY0GMo9B7KsT5N8PfQWzNZ8=;
        b=I6EKUXk6V7mWcCS2VONKeZIxuSrg7ifYoFF211eTpaJPwvCI63AgEpnC5yrVB7BxRE
         BUB2+TAOKNsJyI6MaymduTa+KOVkOpd946XR/nHbllBsFkE4UdvkmuozZosOPMWqL+Qr
         26mm0r2TcA+9Y3gC82NAw1hSj9rJ7p7SLlBgaL6O6H8Fu/SaDLs13AF4aZyb4e/wEpHB
         lzgX2dEhRylpkOSkA9HeNTYtoI8qguNc1TzBjvvvJ7WiDW5GiIC97wH5YmUXt+ya1x1G
         k0amzuVApRlo1nDnh322xAJYVriU01zoi3uNAo2sKLsy+fWFuXDXQUS+K7LkySjylQMk
         Lchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wyKk4Smwb8pEAuoXr1N9sY0GMo9B7KsT5N8PfQWzNZ8=;
        b=XY+gJKIyAhfLsq8G5048tNwFDDDMK3btu2leVjOIw+EZL3xhSM2lTytNm91gRwPdVe
         eLlIbIZaA1B0GTh3z70PDLMKCWCD84vEd2qz4dMPhDTE9pgPo0nnhcV6qy7mEsGZgwrW
         1Jfa+N4sZdi7rFln3CvVXN4wpf33Q+NFKgQmVRJuEkaoZFN4amn8JrB/BnXbKEX3t+Yz
         aASpUzasl5bcOxdU3Wpcc6I2+800T81U7e7uUdmMo/KG8dnVjLfycGuMNXbcxECmwcet
         kTpq/sOrMQH/3JFv3SreXhLocw4u5DLMq2ox/C4FnSW1M4j2LBZZ28PXvYLUnl47VWHB
         3b1A==
X-Gm-Message-State: AGi0PuZfbkLZEeN/XwyeuZf5CyjprUkiLorAXxeWRaqyjVSp/JzlgE/m
        D8t+noSlNNTwggmYJUuIkiA=
X-Google-Smtp-Source: APiQypLgED4Dxni5g/9GfZIcSInu/dXcWOUpWosGCix2299TyduugFvjnIqW4kG+x9+sYUY6bK9cog==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr2974635wrq.53.1588783456698;
        Wed, 06 May 2020 09:44:16 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id 19sm3662872wmo.3.2020.05.06.09.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 09:44:15 -0700 (PDT)
Date:   Wed, 6 May 2020 18:44:14 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 2/2] memory: tegra30-emc: Poll EMC-CaR handshake
 instead of waiting for interrupt
Message-ID: <20200506164414.GB2723987@ulmo>
References: <20200319193648.8810-1-digetx@gmail.com>
 <20200319193648.8810-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline
In-Reply-To: <20200319193648.8810-2-digetx@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2020 at 10:36:48PM +0300, Dmitry Osipenko wrote:
> The memory clock-rate change could be running on a non-boot CPU, while the
> boot CPU handles the EMC interrupt. This introduces an unnecessary latency
> since boot CPU should handle the interrupt and then notify the sibling CPU
> about clock-rate change completion. In some rare cases boot CPU could be
> in uninterruptible state for a significant time (like in a case of KASAN +
> NFS root), it could get to the point that completion timeouts before boot
> CPU gets a chance to handle interrupt. The solution is to get rid of the
> completion and replace it with interrupt-status polling.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra30-emc.c | 116 +++++++++++------------------
>  1 file changed, 44 insertions(+), 72 deletions(-)

Applied to for-5.8/memory, thanks.

Thierry

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6y6V4ACgkQ3SOs138+
s6FiGxAAuOcRnU09W1bffEluFV80U1jhAPJP4VpwtjyuVwY7NfgJ1Au3jdhKXXsS
XCFh+I1aVL9NvC6HEvYdYdrKLxMSlfs/VG19/wU8lqa2enYnJyYeTQBiw/21C/gF
pomxj/SYq4yopkWKdEFasndS7RNIqVj2771agc07uOIw+vcQ1gvYmY4ef6xQ/Alr
iOk9Juuyxlxt+jCkGbklMgVqGFfF4P9iBstPiI/N8b/PYMppzRKy+jyyApT2G/Vd
iqTGb/JHkaJMh9F4OWe/qMzRHISch5SvhVSGM3ueSOZ7T7iSw0kIFo3MCHIjLL46
tM0pKocAwCnCgSRUx944aCJMQUHT8GtuwdUV5IKWKClyMlBpBxnUMhm+gDcXK1ro
vOP+nBS8Vr7iqEjVj86ItwJpD2zyrB5biK8FU2MhdpPvtSX4fY7ZHxptWckrP0rs
Q9uuoyn7VuweT/rVWOmUlKOEbvzSpqd0+hk6xw1HHLQ77r3SQtxn06iz7qmz64kl
SccWii5omSMWkart042lY0oCptG+qfHkg/6iUaP1lJgtNtGyvuemwzf4nY1KIx5b
kFdpp5ticnCyJRxBH/o1LfUyeV72zkIbSnM3uI0ML1E48pHbTIim+t++qEwJ/KTJ
tsBin2pURNEjo12YgmihIa0LoSV8UwceBxKC2b6zd9iPbYtEa1o=
=pb27
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--

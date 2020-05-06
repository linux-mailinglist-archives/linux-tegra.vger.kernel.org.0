Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5869F1C76CA
	for <lists+linux-tegra@lfdr.de>; Wed,  6 May 2020 18:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729568AbgEFQoD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 6 May 2020 12:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727984AbgEFQoD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 6 May 2020 12:44:03 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 549F4C061A0F
        for <linux-tegra@vger.kernel.org>; Wed,  6 May 2020 09:44:03 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id h9so3025857wrt.0
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2020 09:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=U/ZQM1i7K7xMkwq/MN7oDOBL2QNehYxuq4isiqkjc/I=;
        b=tDv2lpdcY1pbvpdNi3xX1ggn1DFUPr8QTAstmlPCPSjLY5CWPVYMAO4UhkmNP38P7v
         dF1zgT5QwAiMq8/AaiQNMYgygYge/7zN5gMClGXRWvO2ea9klkNOz9TWrGNfoNPWD+dB
         qE9nZiAslD9DaPU/sozS0ngWA6/eJDrxJql2brgsLt5PypRL3lhjyzBXZ3+HvcKqyqcx
         sewLkMYMisv9bYhFjpd4XPIU6OoWl9xeY6MZrnjq+FIxjvB5X91FNLtoscZ4ukX8ZJE3
         qWCvQd/FMsbx6pKCYRIt371FTqWzHHBdjsAwZEP2tzw7heYztTku+kWGbKLRcsyKEfFN
         nhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=U/ZQM1i7K7xMkwq/MN7oDOBL2QNehYxuq4isiqkjc/I=;
        b=JF5fkyAAZTo7tYDjj7LiGQJxi+Ezwe0WA0uNMKJ8aAI8LAy2WZnTNptMPQhlo4thTa
         UW4r63KWMzNUG8a2W7gZt6oqsDqi9YWLeY5BYmK5vRWnV3o0p9xFcRjIlRozmlAmKTH/
         QVsMa2LETOdwJ88xJOjyIn7UOqmVO+IikTqknY3OB0iY6qW5UCaId76KSXI9SUw4T+f4
         XZeGsIr8kXJAWE/N/OkcM5aOX+LHDsxPPiJtKpa3Tbx/j0h62lHI1tLJFw7MlBwSTENH
         6xk+AGHFYX6HGiejju889S8fuZlTvTzVH0MUsaJc3C5rXNZQbxX3pgFT6CuagLuFj3fg
         0RKw==
X-Gm-Message-State: AGi0PuawzU9TNvSBFhds3Zjp89mqO9GTNy7pP6sxHUM0GVgEhmLpiKiQ
        iuhIv2m9E7Yrz+O2UkxSk5I=
X-Google-Smtp-Source: APiQypI8m78U1p05qsyStDF8Eorzms4tGNXNqTi7FQne6bmAiz3JZ86XzYLKaSzjfI322kG3Dw6JzA==
X-Received: by 2002:a5d:6a92:: with SMTP id s18mr9766440wru.50.1588783441780;
        Wed, 06 May 2020 09:44:01 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id c20sm3937232wmd.36.2020.05.06.09.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 09:44:00 -0700 (PDT)
Date:   Wed, 6 May 2020 18:43:59 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 1/2] memory: tegra20-emc: Poll EMC-CaR handshake
 instead of waiting for interrupt
Message-ID: <20200506164359.GA2723987@ulmo>
References: <20200319193648.8810-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
In-Reply-To: <20200319193648.8810-1-digetx@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2020 at 10:36:47PM +0300, Dmitry Osipenko wrote:
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
>  drivers/memory/tegra/tegra20-emc.c | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)

Applied to for-5.8/memory, thanks.

Thierry

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6y6U8ACgkQ3SOs138+
s6ED2g/+J3reqnVaEM79SjqdTgc+vOxhup58zQ1XpVQu0VUIwSeHVxNbmFkC8g8D
iyY/AhPcTl/8y4XaF2idwwqfm+uRfp3JNV7/8cQ+UqvTlEaEhVfNeOEaHz7KfWos
QfXva6eiLfL+jPI1MSy5I7+mL+Mb/UxT7LbsuKMdLp43kZuwe7i/lz3mbEby7O4z
XZQFYsNqaZmzSTC+nhLIucjYZXv+EvdiJDecePeDOWWnGxjb6LbCmvn1cZh4lY0m
uO4K3h7F9r+4eGJUiDcBACwG72KV9zYkP3G4uJM9RpxX2PJM0IDDrNRIQtyOgcmw
3CtPXi/WJQtJqnAb3J2uiVakqE9zWvLwFPzIk7JyR9peZrekhv0oZOxsD0c2F3tc
ZEEGd6qIitzZra1nduzfw/xiWPFfMXWlTU6SXqVHCgHtEtILF4o1AlYjRi1xXAO5
GbIlSNXTWANpLhH7vzHsOuQpxz8L3KoG8xgAwhhAVCqAEgzKqktdZP148xW6r3nN
wHA7blAZEPkmz7Ag6tbM+EbHVf5f6QbLXcpa2Gp3U3AADXUYykpqbBIYdEapMmzQ
eEJl6BiLjhWvBcNvsGe5QszLftADT+f6BZOzzCj3MXjUG1sn3AP0EppdCQH5dmSt
Amdo4PNmHZj0ObzjAU8zCNsfMJdb/JpY4WOljuIKqSEUHqdLHrE=
=jLxc
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--

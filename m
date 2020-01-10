Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76ADD136FAC
	for <lists+linux-tegra@lfdr.de>; Fri, 10 Jan 2020 15:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbgAJOn0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jan 2020 09:43:26 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38652 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbgAJOn0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jan 2020 09:43:26 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so2054922wrh.5
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2020 06:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q5LgP6Q0pYV9VwP0rK5ubhrSHM/hJszo1rLVs/tAL5I=;
        b=a2bVr4wUxHmZhyhea7V7U4ovjuNO/hths1MKZwVB+mBA01eNHhLj+oky0z62b84gcY
         gNUiRcWoWJZ0QtKfCyMIrkZJvsiZG+7Lhfp3IH/jozLZN+7ED0d5ADVXVgJ9tenxZHuE
         b40W4TqflMsGyKUkoHUP9KiwuzOvsR1YlwDZIGtl3/pEB5FGx0aCl8tdV7KSj/D43Z3B
         rdMmBHosy73i6VSOrd60XVI4X8ZHEXkTmZiE3513yf6xyntmQeNqSumlCwWzAqJ2AnQr
         7+05SOM4FbTYhASuv7wQ/mg7p5mokegOG0JRkAPEiIl+Wd14ZtnKgIQyYohFzvBJHnCf
         KKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q5LgP6Q0pYV9VwP0rK5ubhrSHM/hJszo1rLVs/tAL5I=;
        b=f/XOKW+Z5hd1eKx0uF1YMdNgoWSRKjTBb2imSnDIkGjtobfcmBpg6GfEZqno76PauC
         nlTtHm8S9OH/T4uz8OUL8dPA1kb2AQd/kyBbt3uPcxTBIt6pK9tO9gmZJjqqg+WiUdzZ
         DDPYcEg4GlzXl0oKy7ce+uakYkwUGrv0XSjHkQdNhAWuVB+KyCSUNieh0GKiFQllgEld
         ZfgSFTok2Qv/5kkRYRZ35VuVhjoUx8yEpDVrrMWtVuWZc0aimx/5bmsZIC0C6rCN//+7
         jYBh7wVyjdipSMRXtiDMChBqHHML6m4D0udRysRm6MKugF+WKzY9rSkJVHtvSUCye1wB
         XM7A==
X-Gm-Message-State: APjAAAVjqEPlwIsfTcrW53DgCxY2Ie9usS77PFFzSG0bBMNqJvHBusSP
        wn2aK/+4u2rhigIrnF9UaySkhXoG
X-Google-Smtp-Source: APXvYqxZqpd60poRwC4TpSWiGamfTV1xPA9zx8+PEnWeOF5l0NnHDSBkbcE+gP1Aux9VVNWC/NskUQ==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr3894424wrj.261.1578667404578;
        Fri, 10 Jan 2020 06:43:24 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id 25sm2391810wmi.32.2020.01.10.06.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 06:43:23 -0800 (PST)
Date:   Fri, 10 Jan 2020 15:43:22 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1] soc/tegra: regulators: Do nothing if voltage is
 unchanged
Message-ID: <20200110144322.GG2233456@ulmo>
References: <20191218185535.28009-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NPukt5Otb9an/u20"
Content-Disposition: inline
In-Reply-To: <20191218185535.28009-1-digetx@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--NPukt5Otb9an/u20
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 09:55:35PM +0300, Dmitry Osipenko wrote:
> There is no need to re-apply the same voltage. This change is just a minor
> cleanup.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/regulators-tegra20.c | 8 +++++++-
>  drivers/soc/tegra/regulators-tegra30.c | 6 ++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--NPukt5Otb9an/u20
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4YjYoACgkQ3SOs138+
s6Eusw/9G9TlQ95LtoxHiZ7aTwYjtkWu8hMQHdaqfAwA4dTYFXFR+GEwFiG8sbZE
Z3gymKFyJsGtJ/ZjEfpHjSIr17XgJSWjHoLWbZFMKK83qDhvvZVorATVgYxrwEVd
PGX/ID+vStx6nD+5wKBraSSTNZfHXDIcX/sZk0Fsg/Rt22d1pJP9o2MsPdNfCKss
NFnTF75mg/v1t5c7K4kj2GXmJS1ML3Md7rFapSohYO3F7nUSjG2W9J41skROaoLO
QnxXxzzEicALtEkzNqZqFrQpvJivW/gsE4WVStx1ycMQF82Z8Ev2+Lvj+MiuHCYO
EmBfQmz4uYxWMCJVZfnuaKCy20/TMDySYFJLbNS5qwdWubx/Tj3l5ZkwJQyIkLDO
o4W0FzUvIfPIIwbf8n6J93jP/1rDN3zKfAZyqbwbYfYAz964ztBak3LYirmtIHD8
pkOhDin5glDOUkI5it24wfS4SyOb1a6wKtluSRMSrPBL1e+074HoWAhpv5kt7Gyu
PcizKWX98I3gLfdhQ5I28/Zk8244psnk/iHulSs3207nQlurzirO+9dK/PGEwjJC
fZEGD0ed4psamobjXwYQQbilRFkWpf14EwkiBwvBVEd3J1knlrX78JoW0tDj3tQT
1Z6YmkSsIQEuJwE3pMN/rMkHGr0jmjcQFWFPBEl4+AzBbypQubk=
=gKKP
-----END PGP SIGNATURE-----

--NPukt5Otb9an/u20--

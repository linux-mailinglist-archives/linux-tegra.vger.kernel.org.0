Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A32E12BBC6
	for <lists+linux-tegra@lfdr.de>; Sat, 28 Dec 2019 00:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfL0XGJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 27 Dec 2019 18:06:09 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42742 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbfL0XGI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Dec 2019 18:06:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=/BtCTup5LkRr84T9j0F3KGj5sfWvVprZyXCfRA8eZ88=; b=RzzMmJyoO8yVlxtsIdXSHGQHF
        +5VakP72EFqCzomEI4NbEP2CBE/jIeRDvu3IkO4cqKIz857XSw/sEzNEVWRVAWN/gM6vCu3SkhJmX
        V3tTjD30Cl8Apif9uwKJh0HSIatp7dq/4ppeiNmCwju3EZEBa4PwE1Iw0dqgbKJWTJ5b0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1ikyOt-0006aq-2d; Fri, 27 Dec 2019 22:48:07 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 3B9AED01A22; Fri, 27 Dec 2019 22:48:06 +0000 (GMT)
Date:   Fri, 27 Dec 2019 22:48:06 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        mperttunen@nvidia.com, gregkh@linuxfoundation.org,
        sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com,
        josephl@nvidia.com, daniel.lezcano@linaro.org,
        mmaddireddy@nvidia.com, markz@nvidia.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 12/19] ASoC: tegra: Add initial parent configuration
 for audio mclk
Message-ID: <20191227224806.GP27497@sirena.org.uk>
References: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
 <1576880825-15010-13-git-send-email-skomatineni@nvidia.com>
 <a6567ff1-7bc2-3ca5-1200-92a63eb44ddb@gmail.com>
 <20191225175736.GC27497@sirena.org.uk>
 <856d8a92-0c24-6722-952c-06b86c706e97@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CKf/2jVYos1l2hij"
Content-Disposition: inline
In-Reply-To: <856d8a92-0c24-6722-952c-06b86c706e97@gmail.com>
X-Cookie: I have many CHARTS and DIAGRAMS..
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--CKf/2jVYos1l2hij
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2019 at 05:56:06PM +0300, Dmitry Osipenko wrote:
> 25.12.2019 20:57, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, Dec 23, 2019 at 12:14:34AM +0300, Dmitry Osipenko wrote:

> >> I'm not sure why clocks should be disabled during the rate-changing,
> >> probably this action is not really needed.

> > I know nothing about this particular device but this is not that
> > unusual a restriction for audio hardware, you often can't
> > robustly reconfigure the clocking for a device while it's active

> If nobody knows for sure, then will be better to keep
> tegra_asoc_utils_set_rate() unchanged.

Yeah, that's my instinct - unless we understand the disable it's
safer not to do it.

--CKf/2jVYos1l2hij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4GiiUACgkQJNaLcl1U
h9Df1wf/WpeKIdsJm9CpD2g6l/HiFfNALEg3OrDmzNwzbGiCqrMSTPog6EddD3e6
5EmfLE3DY2tSCu1nkVCtEhrfteuwqWsQQDmn6x/+iXZrGLzL0GsLVMhF0TwSgd9s
jIySU0jRy6I/AhnYgQ5qx/UsFjBRIweMVFMeoRJBkn0bzT0T5Q7f84ROYhKZcOtz
e7CHXFFtNBU0zJ2/VZLoILusTGzrIaNkkrZ82+6Zy76v9FyMdVM8LWMwr0V10C3O
8fl9hvJIfXB11FSWf7jsENBla9LotrwLLivIkhsPfUxA6ZYsYjWkw1KeYCOfKwE5
LURwVXe5lfCgCP+WY0M7dh/y2cWpAQ==
=jKXz
-----END PGP SIGNATURE-----

--CKf/2jVYos1l2hij--

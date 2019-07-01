Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 485FE17369
	for <lists+linux-tegra@lfdr.de>; Wed,  8 May 2019 10:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfEHIOM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 May 2019 04:14:12 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:49522 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbfEHIOG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 May 2019 04:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=l5Y5i3eRCqYRgt3e1Ma9Hecy5GcV6/iBwz5+8XPfAXM=; b=RBJSH9tCVR6Huv/cwWA7spPeB
        EDt69CjtM1i/9zs8MbFr5smH25c6mQofGkh5xnp6wcU7NduqNkRdkHWRqs+B5QXh+f3xTcq9A9G6d
        C0ttZlj7Q20bYzHVfeqXhLxfm2Y3HtP+gGiUNYsfJRgCXy9WSPF1peP3HLRb8Fi9AyOaE=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hOHiE-0007RY-TF; Wed, 08 May 2019 08:14:03 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id E7DE144000C; Wed,  8 May 2019 08:55:42 +0100 (BST)
Date:   Wed, 8 May 2019 16:55:42 +0900
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/6] regulator: core: Introduce API for
 machine-specific regulators coupling
Message-ID: <20190508075542.GV14916@sirena.org.uk>
References: <20190414175939.12368-1-digetx@gmail.com>
 <20190414175939.12368-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Pv0wy+ojp4n+t/Vq"
Content-Disposition: inline
In-Reply-To: <20190414175939.12368-2-digetx@gmail.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Pv0wy+ojp4n+t/Vq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 14, 2019 at 08:59:34PM +0300, Dmitry Osipenko wrote:
> Right now regulator core supports only one type of regulators coupling,
> the "voltage max-spread" which keeps voltages of coupled regulators in a
> given range. A more sophisticated coupling may be required in practice,
> one example is the NVIDIA Tegra SoC's which besides the max-spreading
> have other restrictions that must be adhered. Introduce API that allow
> platforms to provide their own custom coupling algorithms.

This is really concerning since it's jumping straight to open coding the
algorithm in platform specific code which isn't great, especially since
that platform specific code is now going to have to handle all possible
board specific restrictions that might be found on that platform.  Why
is it not possible to express the rules that exist in a more general
fashion which can be encoded in drivers?  I'm not thrilled about later
patches that export core functionality for platform specific use either.

--Pv0wy+ojp4n+t/Vq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSi34ACgkQJNaLcl1U
h9D1UAf/UAwJK/b/t/+xtrLdSj2q7XnjDc+jt0JG8fzPdnxULJenEbdnDLSPd+S0
VNe0KuOFhyWYAaY9E12iBe8Z3akZ3z5DviE5KODSYlmU9mf4wRgzuC828Ho3Z8Nz
ffbbBWmVu8/3F1OJktrfiuX1e52z25LmXT0c9XNa/EFi1XeMISR9Ghi/Q3sfG45u
1w4eeq2pVflE13N5vtu20vqOpjo3Z8glftnxFN1htIEDAhuhaKSTnmotr9dqQyML
lujag20oYDVKTtb18ZiFnJSEdfYeHqDdiz6BwvOyGwmupyIqS62xe0/h+nyjgMyM
jK5+9dcG0cRbL3BRsuekodVatgxo1A==
=R/Xh
-----END PGP SIGNATURE-----

--Pv0wy+ojp4n+t/Vq--

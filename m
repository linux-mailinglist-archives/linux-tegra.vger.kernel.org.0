Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE3AEFE42
	for <lists+linux-tegra@lfdr.de>; Tue,  5 Nov 2019 14:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389076AbfKENY3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 5 Nov 2019 08:24:29 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:45066 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388753AbfKENY3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Nov 2019 08:24:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=aOnwuuyE4wyeka4isg54SdffRlAcGItM8q6cpU4foXY=; b=ILeoy2nShNLSoUyw7JGnHEx4W
        umS1Xk4mc+Lw8gTBVKKF4lun0NofOAAmyhEVVETOLGSIS/QSkY+946TI2BIh/i0/UG8PT1bUFZjhJ
        MGPPXu2QbtmL38yk65en+yxpHhjdZSG83ReRq/Y4AQnjRp6spKorowrb5hSGIdujpQriQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iRyor-0006do-Cv; Tue, 05 Nov 2019 13:24:25 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 82747274301E; Tue,  5 Nov 2019 13:24:24 +0000 (GMT)
Date:   Tue, 5 Nov 2019 13:24:24 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Fix regulator_get_optional() misuse
Message-ID: <20191105132424.GC4500@sirena.co.uk>
References: <20191105125943.34729-1-broonie@kernel.org>
 <20191105131511.GA1609273@ulmo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ALfTUftag+2gvp1h"
Content-Disposition: inline
In-Reply-To: <20191105131511.GA1609273@ulmo>
X-Cookie: Genius is pain.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ALfTUftag+2gvp1h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 05, 2019 at 02:15:11PM +0100, Thierry Reding wrote:

> It is in fact optional in this case. This code remains solely for
> backwards compatibility with old DTBs because back at the time the VDD
> supply was associated with the DPAUX block where it should've really
> been associated with the eDP panel.

That should really have some documentation, and in any case would be
better implemented by using the supply_alias feature to remap the supply
to the panel device so that we're using the same code path when actually
managing the regulator either way.

--ALfTUftag+2gvp1h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3BeAcACgkQJNaLcl1U
h9DFjwf/RAQXnf6UefNspZqwTvn7CnHYgUtYc+g2j5Kqjfn3g/FDBqWQD13gmWHF
9+AfIWIUlHoWBrvfui7ntXOuaCTGh9s2Y4l1eGvdDob6DivSG8r10hm/jdBmcQTJ
RKfsnDp2+av42ywyLzRQe8rKAv2a/gtLTASRW9jZvkGoXgt58GGQAkjA5KZ/JvRx
wbZxOotjlzahabP8crRinylwFaPrDwlymRWGawY4BlemKyAD1FVpn6KRhvIgtLyd
OFezRot1Z8W2pLZpkC1MfcJlp8Zx0LJvxeUW098KPnqDi4a/TR4IcrEVSVw+uUqM
+HuQhTMXG8LfrVgi+hwGu8fldMXadQ==
=qReC
-----END PGP SIGNATURE-----

--ALfTUftag+2gvp1h--

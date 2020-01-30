Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8BC814DB4C
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Jan 2020 14:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgA3NKq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 30 Jan 2020 08:10:46 -0500
Received: from foss.arm.com ([217.140.110.172]:52452 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726873AbgA3NKq (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Jan 2020 08:10:46 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F18A328;
        Thu, 30 Jan 2020 05:10:43 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB3743F68E;
        Thu, 30 Jan 2020 05:10:42 -0800 (PST)
Date:   Thu, 30 Jan 2020 13:10:39 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
Message-ID: <20200130131039.GC6682@sirena.org.uk>
References: <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
 <4b90efd2-5d0c-84df-961d-80cee288e0d4@nvidia.com>
 <586ea2b9-c204-2bd1-f8e2-875e0974e42d@nvidia.com>
 <fe002ec7-ae6e-f770-b82a-49237e0b29c6@codethink.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Content-Disposition: inline
In-Reply-To: <fe002ec7-ae6e-f770-b82a-49237e0b29c6@codethink.co.uk>
X-Cookie: Positively no smoking.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 30, 2020 at 08:17:37AM +0000, Ben Dooks wrote:
> On 29/01/2020 14:33, Jon Hunter wrote:

> > controller. Applying these patches it is not distorted but now I am
> > observing the clocking issue Ben reported and so the tone is not quite
> > right.

> I thought they had been applied? I probably dragged them back in when
> putting in the support for the test channel on the colibri.

There were review comments from Jon on patch 6 that you never responded
to.

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4y1c8ACgkQJNaLcl1U
h9An+gf/cZ7dob6cuhVCdFlZUIMNYEci1qgBuRj3VS/Ofty278mI1D2x7w09IZwh
NZJE66Dw7Y3oCLNutN0zHQ+ODU5GQERW8fXImtH4MVzk4OVkHoMtXpjehbap1e0N
e47IJSIFpcM3VC8WpB1isSTzgxTD3weHTl2uGJK8AqicSOdD4fIPj7nh+8pOVAhU
C5pvIO028Qj8pkyKIR3r2Y9Pw3hbWuHyo6Luur5wm5EX0SGDvx2YQwltfoWstMP6
Uw6CA9O+u3AzfgqEc8+Wp09Xa9Byg9SaoY+0pOaX+A4LlREbO8G5pL/rkiPM5bjN
Z+CXymSuA5tizCUQgckTE3zE9gy0sA==
=EazR
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--

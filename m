Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62B52167EC8
	for <lists+linux-tegra@lfdr.de>; Fri, 21 Feb 2020 14:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgBUNiH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 21 Feb 2020 08:38:07 -0500
Received: from foss.arm.com ([217.140.110.172]:39538 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728085AbgBUNiH (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Feb 2020 08:38:07 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1539630E;
        Fri, 21 Feb 2020 05:38:06 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24D5D3F703;
        Fri, 21 Feb 2020 05:38:05 -0800 (PST)
Date:   Fri, 21 Feb 2020 13:38:03 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
        lgirdwood@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, digetx@gmail.com,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com,
        rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com
Subject: Re: [PATCH v3 05/10] ASoC: tegra: add Tegra210 based AHUB driver
Message-ID: <20200221133803.GF5546@sirena.org.uk>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-6-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p8PhoBjPxaQXD0vg"
Content-Disposition: inline
In-Reply-To: <1582180492-25297-6-git-send-email-spujar@nvidia.com>
X-Cookie: Dead? No excuse for laying off work.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--p8PhoBjPxaQXD0vg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 12:04:47PM +0530, Sameer Pujar wrote:

> The Audio Hub (AHUB) comprises a collection of hardware accelerators for
> audio pre/post-processing and a programmable full crossbar (XBAR) for
> routing audio data across these accelerators in time and in parallel.
> AHUB supports multiple interfaces to I2S, DSPK, DMIC etc., XBAR is a
> switch used to configure or modify audio routing between HW accelerators
> present inside AHUB.
>=20
> This patch registers AHUB component with ASoC framework. The component
> driver exposes DAPM widgets, routes and kcontrols for the device. The DAI
> driver exposes AHUB interfaces, which can be used to connect different
> components in the ASoC layer. Currently the driver takes care of XBAR
> programming to allow audio data flow through various clients of the AHUB.

The current way to represent complex digitial routing inside SoCs is to
use DPCM, this is not great and causes a bunch of problems with the
framework but it's at least consistent between SoCs and is less visible
to the ABI than this is.  Ideally what we'd be doing is propagating
digital configuration along audio paths like we do for analog with DAPM,
Morimoto-san has done a lot of the groundwork for doing that with
converting everything to components but nobody has worked on that yet.
Your stuff looks a lot more like this than it does DPCM at the minute
but it completely sidesteps the digital configuration part of things
without trying to integrate with the framework which isn't great.

I'm really not thrilled about the idea of just hacking around the side
of things like this is doing, the ideal thing would be starting the work
on the framework to propagate digital configuration - I *think* you can
get away with only a subset of the problem here (just copying
configuration straight through) since this looks like it's just straight
point to point links with little in the way of DSP.  If not DPCM would
be the way to go I think.

--p8PhoBjPxaQXD0vg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5P3ToACgkQJNaLcl1U
h9Dwzwf/advF/uesEAwOfyBFgKsZU2OvOfZNWh3z/hn0WbNlr6NtvLRDYEOjdsbA
1cWkU2QWhi1rmf+aeWuOOXLwfJ69OczEeEmo0PODUMrWFNFfWGhnyyo7vGU5MP0S
lHxiqyUhlU4SQJDNuHKhUZigSKEcwH1ofxGTk4SS43VGvG4KrQIZrIZeuWkYcdzN
Py+JpKWnpqDPAs19Rqe9jNUY2qFnF0V7VT5zZKMnXEVwHSjlHqzMHH/maokSugYa
ftNy9GuN7MKL18zAZ7DKDqljpUOPnRfnoiys4qq1LYXXey7e5nbFpOdihRBU5XQS
csloEVBpHZgw77kXeOmlE5dbWwlsQw==
=c0+G
-----END PGP SIGNATURE-----

--p8PhoBjPxaQXD0vg--

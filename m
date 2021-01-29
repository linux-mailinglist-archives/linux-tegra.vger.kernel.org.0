Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60BFC308B6B
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Jan 2021 18:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbhA2RVV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 29 Jan 2021 12:21:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:34540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231156AbhA2RVT (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 12:21:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61FD064D92;
        Fri, 29 Jan 2021 17:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611940838;
        bh=M4l2ojUapuvN/VXGlbHUv4kuoAzQj+JnzANoaLnU+Qo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FcYytULX0Hd0ewUGFrdV16DNvp6Tq93jny0mZuMRbamhA6c6wDZ6zV/5tdTHBqA72
         T/zjIoI6OzoWTS3xHe7hAbDhzmN3prb13mWdgpeW4xaJcFCiFqc+TeetrrHRa6mOkw
         OJvTC5FvilF6xdmqVqbGlQ1f7AnOANvyFt+2+g5mTpe6NAROjWEeLprM0cT//7Lqj7
         3PBlWQq/VygYKFVmNhxIn3pw0KOTupkMpw3+/2aE2rdACTsvmLvHcB8n4pu0fuPqco
         ulzOOh3GNNf1NxsVBULhbRDzK6NmjEveIVb3Hnj1byIxjNQrrEYGq2o87Q0KvKHR/L
         N9Z94KNDNwQRw==
Date:   Fri, 29 Jan 2021 17:19:54 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <dev.spujar@gmail.com>
Cc:     Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
        lgirdwood@gmail.com, robh+dt@kernel.org, jonathanh@nvidia.com,
        sharadg@nvidia.com, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 4/8] ASoC: tegra: Select SND_SOC_RT5659
Message-ID: <20210129171954.GF4560@sirena.org.uk>
References: <1611920470-24225-1-git-send-email-spujar@nvidia.com>
 <1611920470-24225-5-git-send-email-spujar@nvidia.com>
 <20210129124454.GB4560@sirena.org.uk>
 <d6cb9252-246e-d6c7-7500-5f1d1823325c@nvidia.com>
 <20210129154858.GE4560@sirena.org.uk>
 <a5a8df4b-21d1-0a12-df7d-9e94c353e2b5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Mjqg7Yu+0hL22rav"
Content-Disposition: inline
In-Reply-To: <a5a8df4b-21d1-0a12-df7d-9e94c353e2b5@gmail.com>
X-Cookie: One organism, one vote.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Mjqg7Yu+0hL22rav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 29, 2021 at 10:15:51PM +0530, Sameer Pujar wrote:
> On 1/29/2021 9:18 PM, Mark Brown wrote:

> > If the user wants a given CODEC driver then they should enable that
> > driver.

> Above card driver is intended to be used on multiple platforms. DT has
> already a way for user to describe the CODEC connection required for
> specific platform. So idea is enable these CODECs from driver point of view
> for this card driver and platform DT can use what is required. Also the
> CODEC driver will be a loadable module here.

No, you're missing the point of a generic driver here.  This will mean
that if someone wants to build the driver into the kernel for their
embedded board they will be forced to build in every CODEC driver
someone has decided might be used with this generic driver, and even if
they're building things modular someone trying to cut down the size of
their kernel images is going to at least have to spend time building
CODEC drivers they don't want to use.  Distributions should just select
all the CODEC drivers that are available in Kconfig, people configuring
for a particular target audience should be able to build only the
drivers they know they need.

> If above does not seem fine, alternatively can I just enable CODEC config
> independently from defconfig?

Yes.

--Mjqg7Yu+0hL22rav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAUQ7kACgkQJNaLcl1U
h9DANQf+PROWHs2fTqzdCFXsDS7dAd4O8nrdk9LLUm8fg5eKGVlqY0qrPvovzQ3Y
fVLwxRArhcUuSPC58FQZN6PSmjt+HC8skdhs+HEdU+KhPm96lyUw6GV7GjawhA/8
98C6JA/W7Fqu33ol8+CO/6kWbSmPqGRc3logvkttnmQiODnLE2UkloK19wnmDs3X
ROa9+u33KfgFu2SDO7WvQpMDTHeWPlz8nFGubaTRLFFpDL7fMGuB+5b01PKIkiiE
cbJgQpA3cLr1stksinduG6A8ZOhM/pXzz4ChhPuzpdbOxD6CG1LirUtgrpqoASHf
8++ozxE5aUjxzU7uGimtmQ+lul865w==
=P2v6
-----END PGP SIGNATURE-----

--Mjqg7Yu+0hL22rav--

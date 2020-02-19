Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95704164B62
	for <lists+linux-tegra@lfdr.de>; Wed, 19 Feb 2020 18:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgBSRD5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 19 Feb 2020 12:03:57 -0500
Received: from foss.arm.com ([217.140.110.172]:52834 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbgBSRD5 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Feb 2020 12:03:57 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42C8031B;
        Wed, 19 Feb 2020 09:03:57 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB9E03F703;
        Wed, 19 Feb 2020 09:03:56 -0800 (PST)
Date:   Wed, 19 Feb 2020 17:03:55 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v3 0/7] ASoC: soc-pcm cleanup step2
Message-ID: <20200219170355.GG4488@sirena.org.uk>
References: <87d0anceze.wl-kuninori.morimoto.gx@renesas.com>
 <5d19876d-86a4-a461-f47a-68c7ba1f46ac@gmail.com>
 <d60ccad5-9c52-551b-ae22-2815ab768a59@linux.intel.com>
 <alpine.DEB.2.21.2002191900170.2957@eliteleevi.tm.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="c7hkjup166d4FzgN"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2002191900170.2957@eliteleevi.tm.intel.com>
X-Cookie: FORTH IF HONK THEN
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--c7hkjup166d4FzgN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 07:01:33PM +0200, Kai Vehmanen wrote:
> On Wed, 19 Feb 2020, Pierre-Louis Bossart wrote:

> > We also see a regression Kai bisected to the same patch

> > https://github.com/thesofproject/linux/pull/1805#issuecomment-588266014

> issue rootcaused -- this relates to the new "opened" tracking, I'll send =
a=20
> patch shortly after a few more test rounds.

Oh, excellent thanks - I was just starting to poke at this a little!

--c7hkjup166d4FzgN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5NanoACgkQJNaLcl1U
h9DF8Qf9GsLpU85BKuVRGsLykt81rr/+87ujyl8pzIcOzVotCJtAhfKR4DsnnHJz
7u01I/fyGwYdxO2gvRjlFxe4UO0KVJh8Kbmyh4ZwPjeAEa5NLhs9D9JQo7qEhRWM
6ARwANJVcZ43UQDcvlV3ZX7lHCuRZPQi2ZuIiaI9jo4jRpfEIh25iVuxjafrKkkc
AD1EYa/nFJKUWXRMrJfFhZdXYQvnY6pCX/3PGwrxD0gnwsaPW7wVR5iwElZyToVK
i/TIjmyKHvNXYSKbpYA/FQYYuAzwIUFJD7wczFgCH4ImrJbdYZl7RxJnso81UynD
s8aFo8gkQQ5ke6JIyJF+eHlQjhevWA==
=C3SM
-----END PGP SIGNATURE-----

--c7hkjup166d4FzgN--

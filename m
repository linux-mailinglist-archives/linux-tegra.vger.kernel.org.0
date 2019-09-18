Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56DAAB6729
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 17:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730281AbfIRPc4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Sep 2019 11:32:56 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:54890 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387436AbfIRPc4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Sep 2019 11:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=NUuwtGyFyjN2+qqevPZPct0GdyeWLmKJgrIv+an/otE=; b=EK7YDQz4AdAEBxivs+FJrROv2
        uuXtj+PUQP8En0ByspUddMp7kyzpYA4+1xqEN8wdzBTalQnfPiyQRJMEYreA/K9BXf/Wp1kmHbYo8
        3SXuLJsgmCteOG8A7G7oeRrTcYnk/RsFO4613NP5sZogUt3qv1poX2xbGYKbUU2BrOXic=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAbTl-0005iW-HF; Wed, 18 Sep 2019 15:02:49 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 07CDD2742927; Wed, 18 Sep 2019 16:02:48 +0100 (BST)
Date:   Wed, 18 Sep 2019 16:02:48 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra@vger.kernel.org, linux-tegra-owner@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 1/8] ASoC: tegra: Add a TDM configuration
 callback
Message-ID: <20190918150248.GM2596@sirena.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-2-ben.dooks@codethink.co.uk>
 <7b21823a-86e8-d3de-10b5-e047a5e025ef@nvidia.com>
 <72705cbf3b70934bdf8e7a6116f420b5@codethink.co.uk>
 <5b0044e1-b781-9fd8-b250-3d87fe3af855@nvidia.com>
 <20190918104827.GB2596@sirena.co.uk>
 <40d78f13-c1b9-3e2d-c144-2209a4c0d716@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qVHblb/y9DPlgkHs"
Content-Disposition: inline
In-Reply-To: <40d78f13-c1b9-3e2d-c144-2209a4c0d716@linux.intel.com>
X-Cookie: The devil finds work for idle glands.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--qVHblb/y9DPlgkHs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 08:33:50AM -0500, Pierre-Louis Bossart wrote:
> On 9/18/19 5:48 AM, Mark Brown wrote:

> > In DSP modes only one edge really matters anyway so it's not super
> > important how long the pulse is.

> There are exceptions to the rule.
> In the early days of SOF, we had to provide support for amplifiers that did
> require a pulse larger than a bit. In the SOF IPC we added an
> 'frame_pulse_width' field to pass the configuration all the way from
> topology to the firmware and Intel SSP driver.
> The other quirk we added is the ability to control zero-padding per slot
> instead of at the end of the frame, e.g. 1 bit of padding after 24 bits when
> using 4 slots w/ 25 bits in a 100-bit frame.

Neither of those is part of the core DSP mode definition though in the
same way that constraints like MCLK or BCLK ratios aren't.  They're
modifiers on top.

--qVHblb/y9DPlgkHs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2CRxgACgkQJNaLcl1U
h9C3Uwf/d11JTgMoTNFlwHEDfWmf2l9yjezFSXcGaRxBGWDdfB+EPZe3EMNMC4Ry
Mq5zM2De0sa4JdiGgeKqUtXcBJqmRWeX8RBb66tyI1Qid5FVA/LPfWoMGgBExI9v
SpqXvUswmxvD9oJ4shc7Qg80TMdC4TMorfHnZidVSmv+jP0ovmRep/ZRPQK24b+h
vtClYbf85B7dUorPEAUD6Dgewh4/ZYe2u37tGh9X944Bqw/ze4+BGtQ2XEtXoycR
rOGENVk8V+8EVyqekA4tnv6cCnxSA09/3msb8+AolTJMouP8MK2VTOitnhJ+lrMU
RH7cdZXk43RRCJ0OqzDJZSZT3OIUUA==
=omCB
-----END PGP SIGNATURE-----

--qVHblb/y9DPlgkHs--

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20F4AB62BC
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 14:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730569AbfIRMGV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Sep 2019 08:06:21 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:46516 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727095AbfIRMGV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Sep 2019 08:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=MzATDNIERDtCE0amjUIhfbCd3EzA8xIdcEIzyZF2i9k=; b=prxV1W2pYwHHALb9Fs7LWIDl8
        tF+1UdnsA2D/gQLvHN4ghTOTfJ5nK7E7BC5KEZR96CPDuK0wLr26L5vUwwH02Nk2oQStQ+G/KiUsV
        KwJ7wQ0R4jwf/2XgmqZJ2S2QXq9uV4/3ONJuP0+am2UYrlzd7H8u47ZMOEfKdsbWU+/rQ=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAYib-00053i-H9; Wed, 18 Sep 2019 12:05:57 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 940F42742927; Wed, 18 Sep 2019 13:05:56 +0100 (BST)
Date:   Wed, 18 Sep 2019 13:05:56 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra-owner@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/8] ASoC: tegra: Allow 24bit and 32bit
 samples
Message-ID: <20190918120553.GE2596@sirena.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-3-ben.dooks@codethink.co.uk>
 <077870b1-8856-9a28-dd13-f8bfb1418adb@linux.intel.com>
 <de15ea8e9d2c07a1253fd414b421efbe@codethink.co.uk>
 <20190918100828.GA2596@sirena.co.uk>
 <943c243563b4936a537b52b6c3b1fd99@codethink.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Content-Disposition: inline
In-Reply-To: <943c243563b4936a537b52b6c3b1fd99@codethink.co.uk>
X-Cookie: The devil finds work for idle glands.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 12:50:13PM +0100, Ben Dooks wrote:
> On 2019-09-18 11:08, Mark Brown wrote:

> > > Yes, will do when this series has been reviewed and modifications
> > > done.

> > I didn't look at it due to the lack of signoffs.

> Thanks, although you could have just flagged this and reviewed the rest
> anyway. I'll post a new version with signoff sorted at the end of the week
> as I cannot get in to the office to test any changes until Friday.

None of the patches I looked at had signoffs, Pierre had already told
you about that problem and there were a bunch of other review comments
anyway before I saw the series so it was fairly clear that a new version
is needed anyway.  Once you've got some review you shouldn't rely on
getting extra review explicitly since it's not generally useful to repeat
the same review comments others have already made.

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2CHaEACgkQJNaLcl1U
h9Bfggf+KwyoUQbzbZdW85lkbYYzjdzcUvyz+11E+e1BPqECET8U0XyV3hBp0uAT
rcQ3ME6HGjxUDubR3fatWVg36HhkV54jmAitGld7v3zsDvEyC7KSR2a/i7OlxGmC
KmGqqqZR4iHwvnqrjJ+A2wC7HmuA/ZePVR6XCSt+pJ0EGrO/RlD2+mvjESUWDbtH
x37GNRGa6fMnBynxH0K4tKDNRyAtyRh3FKXYEDPC+Xi8m5kyIAmkn44BZT6n8KZq
zLAcAnsf1j+NiwihiJJdDauU8UFbOYNzm9Cw1VikWF4GOWI6RUagZugS+ZY6Q7WF
D1Ex0aYM7MFQF6xDCWziP3UjudCbfA==
=GnTn
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8C4DB6114
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 12:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbfIRKIn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Sep 2019 06:08:43 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:46390 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729125AbfIRKIm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Sep 2019 06:08:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=xwyKq2Af8oOa9Ecpf/EsUlNUNhPF1CKO7lVawL3W8PY=; b=crqdLtR3tMdN/woibuiHnuAPk
        qth15KSpYVLk2B4daGEt5o/WB+Z6W+o1Kb3ja6r71gkma0+zpi0oFBRnV7pHRWNg3Lg9sunk1S37K
        boYOxaKfZD4OWl27trwBcYZU1yhn2NK9wFg/7m86VGBxieE21WUi7cpxis91TkDkZ1R68=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAWsv-0004bc-HJ; Wed, 18 Sep 2019 10:08:29 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 7C73E2742927; Wed, 18 Sep 2019 11:08:28 +0100 (BST)
Date:   Wed, 18 Sep 2019 11:08:28 +0100
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
Message-ID: <20190918100828.GA2596@sirena.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-3-ben.dooks@codethink.co.uk>
 <077870b1-8856-9a28-dd13-f8bfb1418adb@linux.intel.com>
 <de15ea8e9d2c07a1253fd414b421efbe@codethink.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <de15ea8e9d2c07a1253fd414b421efbe@codethink.co.uk>
X-Cookie: The devil finds work for idle glands.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 08:44:50AM +0100, Ben Dooks wrote:
> On 2019-09-17 19:26, Pierre-Louis Bossart wrote:

> > You need to add your own Signed-off-by when sending patches from other
> > people

> Yes, will do when this series has been reviewed and modifications done.

I didn't look at it due to the lack of signoffs.

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2CAhsACgkQJNaLcl1U
h9C46Af9HqUug+yYqtvuz1iJgkDg06+OGdgZCZt3LzD03CVMezkETohpjdENSa97
vGv0ncXvs+B9obWMBxamAZQLIB02nbOaJRgV4KTB+BIs8Kea3S8MBiKnMJz4ImZN
cRw7fZzOihl2sWacVixGQmwyucX72YjyqLWR0fqTxyp61YxW2kgBGkiLiljGF+mC
I+AZ5Ad+INt/fMknuOqhvms1sLYjvWbGBgA1ShqHlw6OydHSR4QEBfNt57O4HPXr
wjvyk+vbVnhZcSSewJzHMQCfC33alghK12ORM6K+58CwN8SNh2OQrkQBwVMKqm9l
nvBqwW2hxdivNkRAvTT6d5wclb0MCQ==
=yQx4
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--

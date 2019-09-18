Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7949DB61CA
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 12:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbfIRKsj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Sep 2019 06:48:39 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:57016 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726916AbfIRKsj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Sep 2019 06:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3sWoz4niFJSen3AGrzTkTllFTaWXdo6cCmFVRySv9g4=; b=WDsTc/IOBtIRXnHYGRaSZqAaQ
        DvReBrSKNzYahFFA+dxZibGRyV+ewOLB7QQt3LoCTKwSRJ+yCvT2sJYudRrAta8BqPRO2wOdXCotQ
        t2IZON/AAB7ErGZMkFSYVGsldCsqgxwwMTpLFBJr5iF9oRfSItYZbSgXZE1KBGAZi1YBY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAXVc-0004of-L8; Wed, 18 Sep 2019 10:48:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id D14012742927; Wed, 18 Sep 2019 11:48:27 +0100 (BST)
Date:   Wed, 18 Sep 2019 11:48:27 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra-owner@vger.kernel.org
Subject: Re: [PATCH 1/8] ASoC: tegra: Add a TDM configuration callback
Message-ID: <20190918104827.GB2596@sirena.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-2-ben.dooks@codethink.co.uk>
 <7b21823a-86e8-d3de-10b5-e047a5e025ef@nvidia.com>
 <72705cbf3b70934bdf8e7a6116f420b5@codethink.co.uk>
 <5b0044e1-b781-9fd8-b250-3d87fe3af855@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline
In-Reply-To: <5b0044e1-b781-9fd8-b250-3d87fe3af855@nvidia.com>
X-Cookie: The devil finds work for idle glands.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 11:25:39AM +0100, Jon Hunter wrote:

> Why 2? From looking at various codecs that support dsp-a/b modes, it is
> more common for the f-sync to be 1 regardless of the number of slots.

In DSP modes only one edge really matters anyway so it's not super
important how long the pulse is.

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2CC3oACgkQJNaLcl1U
h9BFnAf/WyYMlppq9ssZv4HEBgxxsYN/XQexPFHMP7crDn62tGtHByJh3iKq1cRa
XJ3srU6r+IV+S3XI5udoz5il/R442tQjsjZ1deLoKTvih1pu83l0ELkQJOAV4YG2
3Dmt+KImny71YqKLgZ9haZTZuDEiRFGT7F4MxH1hepOS/aNYwvbojczspSncObVt
cEp1p8vSq9Wc/E628i7BQ1x+IM/3OLm3Toi3soPP+00s3Uh3s+1Ct7W/501JxCl3
bUrUIpHTI/SV8PseVs+o0Qt+6dwcXYo5GG1gVZS1IqwTsoUH5KNTZbhtrEa1SNJC
WUsl5grAThT2yA5nAL7EeG0DM9C1LA==
=Dj84
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--

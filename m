Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D5FE3BF5
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 21:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbfJXTS5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 15:18:57 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:60758 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfJXTS5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 15:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=BtJMMk6Glc0b1Itx4YaAQIjSgo1CwyjXyRamYqhUmsQ=; b=bycttnTQ+TdOU+tEejpM8m/RK
        4tlaV6tIT8NO4/RMWoF6LXyxRWx1juXQl9yiy2kOYuhC02m5XWgi3TiAuAlMNi7knR94JH4/o03DD
        gQrnPN/GjO8/Z0k8t8iCMMEMTZa5dRU0p5lvP6lZ/VmW390rxgucZPAD+Z5qJUxGRY94A=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iNidC-0003yV-SQ; Thu, 24 Oct 2019 19:18:46 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 5383C274293C; Thu, 24 Oct 2019 20:18:46 +0100 (BST)
Date:   Thu, 24 Oct 2019 20:18:46 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [PATCH v5 3/7] ASoC: tegra: i2s: Add support for more than 2
 channels
Message-ID: <20191024191846.GJ46373@sirena.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-4-ben.dooks@codethink.co.uk>
 <2eef499e-d9d4-732a-ddd6-8d307d8cb08d@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J2uG6jHjFLimDtBY"
Content-Disposition: inline
In-Reply-To: <2eef499e-d9d4-732a-ddd6-8d307d8cb08d@nvidia.com>
X-Cookie: Filmed before a live audience.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--J2uG6jHjFLimDtBY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 24, 2019 at 05:12:21PM +0100, Jon Hunter wrote:
> On 18/10/2019 16:48, Ben Dooks wrote:

> > @@ -90,10 +92,12 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
> >  		TEGRA30_I2S_CTRL_LRCK_MASK;
> >  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> >  	case SND_SOC_DAIFMT_DSP_A:
> > +		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;

> Sorry, I just saw the feedback on the previous iteration. I don't think
> we want to set the polarity but based upon the format that is passed ...

The polarity should be set based on the the inversion flags in the
format, normally both DSP modes trigger on the rising edge of the LRCLK.
The difference is if there's a delay before the first data bit or not.

--J2uG6jHjFLimDtBY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2x+RUACgkQJNaLcl1U
h9BG7Af/aTUi+TadPqNOylY+6X2Spzqs0gV+LMh/W0yvVf0aL57cGaJ10dMwmwbC
as56JKIZ89JWzfQHg5fBEXQswb9q12ExaVYNdnIjc/XEx9QnSGHD0Wse7J/lCnbD
FjluXJ9sUFuoRH7yayraajy6bnT2b4EQHB2xkzlYib6rsrqR51Xgrs4MH64MpA59
cCMHuxP12rACbUm5atFzeCgt6TvESWJ0pD++r9Ht/vVGyArSMjjt7HZdOFNSDGwc
1TAOqK6xdPvEqt5LJxXyw+1QCPZT8KFJ3He2g7lax4tuW+czSPfsgPxTEEDIRO2u
FZr56e49pYtzzeN6lG9U8XnkqsF89A==
=xWHD
-----END PGP SIGNATURE-----

--J2uG6jHjFLimDtBY--

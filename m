Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84FB4C3332
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Oct 2019 13:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732423AbfJALo2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 07:44:28 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:46722 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfJALo2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 07:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=EvWNvJMXaksJlF9wvagA6fpqLd2/rERWUg/jBbuLB0s=; b=u6Q8yJ0dimSfXH+3jCenyMK8p
        KPk5EbEnqQJ09VOUOD1iZcpZSy0uHzSWmaqmKJ2iTA1JoOh9Z21U28o7X8J2h+cbl7vYs9sZLSUKK
        ZfpmzWsJdgBsNP2xyY5l4vx1Rg5PpS43Zr1okUG+X9LJ546oYK8eoJaAD5uGonQkXz7f4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iFGZk-0004b7-7u; Tue, 01 Oct 2019 11:44:16 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id A8E5A27429C0; Tue,  1 Oct 2019 12:44:15 +0100 (BST)
Date:   Tue, 1 Oct 2019 12:44:15 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@lists.codethink.co.uk
Subject: Re: [PATCH v3 5/7] ASoC: tegra: set i2s_offset to 0 for tdm
Message-ID: <20191001114415.GB4786@sirena.co.uk>
References: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
 <20190930165130.10642-6-ben.dooks@codethink.co.uk>
 <6d6ae684-dd5f-b180-9114-dafe12886d4f@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
In-Reply-To: <6d6ae684-dd5f-b180-9114-dafe12886d4f@nvidia.com>
X-Cookie: Keep refrigerated.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 30, 2019 at 09:52:15PM +0100, Jon Hunter wrote:

> My understanding is that the difference between dsp-a and dsp-b is that
> dsp-a has an offset of 1 and dsp-b has an offset of 0.

Yes.

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2TPA4ACgkQJNaLcl1U
h9A+Owf7BGtMUWznPui3fHwOqsLBFqxq6KDL31MqnMLunEAAFc0EbKlVFjUvi6Bq
eGIj2OxGZ8hk8qWRiqAyVBh2RuDk2xzCBpVcz/H0pk5Lm2Uhn6O++7K2i2z+e3BC
p7KP1hvskrS3Oidev2vyfy+xoV2MropXU61RMSSKQevM3TbYXsupYQR5kuwwXdKo
XK2Wd9YZuk7FWJdUa7ArEdXOqdZu66SjGOMijN71vfJ2A4M+ds1+jYh5umMYjWtl
aJbUUr+kvk6Pjxsr0kMwgei6tT1iJ79VPMBuEsSt4UUD47YMWF/oilqldjoMNT0d
X5z6WuReKXFlijI1XcrpjFgEGVZ30w==
=TrRV
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--

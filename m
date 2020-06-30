Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A58620F319
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jun 2020 12:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729924AbgF3Kvp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Jun 2020 06:51:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:57732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729377AbgF3Kvp (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Jun 2020 06:51:45 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 346E52073E;
        Tue, 30 Jun 2020 10:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593514304;
        bh=HfXO0VpheAvjk0ln5fPpGb/+WLwAz84prT9BG0X9ilY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r2pSDdwiGRoQI9VKeLz1jw3q/Z55hiKs57B6RTbmJf36cofTKl3u8xNuSGOC0ucFu
         75fSyPBVGxMwk0Pr0eK4CfoyKFIyjYMoUUM2unZPNrHiz2dlciH66ii7K6aK0QTQDL
         Q3jCJp+w1eNhnSC3vPb4x/nIZttbAoKV9f8ULAQg=
Date:   Tue, 30 Jun 2020 11:51:42 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com,
        robh+dt@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, digetx@gmail.com,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, sharadg@nvidia.com,
        mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com,
        dramesh@nvidia.com, atalambedu@nvidia.com, nwartikar@nvidia.com,
        swarren@nvidia.com, nicoleotsuka@gmail.com
Subject: Re: [PATCH v4 00/23] Add support for Tegra210 Audio
Message-ID: <20200630105142.GF5272@sirena.org.uk>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6v9BRtpmy+umdQlo"
Content-Disposition: inline
In-Reply-To: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
X-Cookie: Walk softly and carry a megawatt laser.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--6v9BRtpmy+umdQlo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 27, 2020 at 10:23:22AM +0530, Sameer Pujar wrote:

> Following is the summary of current series.
>  * Add YAML DT binding documentation for above mentioned modules.
>  * Helper function for ACIF programming is exposed for Tegra210 and later.
>  * Add ASoC driver components for each of the above modules.
>  * Add DT entries for above components for Tegra210, Tegra186 and
>    Tegra194.
>  * Enable these components for Jetson Nano/TX1/TX2/Xavier
>  * Enhance simple-card DPCM driver to suit Tegra Audio applications with
>    few changes in core.
>  * To begin with, enable sound card support for Tegra210 based platforms
>    like Jetson Nano/TX1.

This series is too big and covers a few different topics which makes it
difficult to manage, please split it up.  The most obvious thing here is
that it contains both the drivers you're adding and a bunch of changes
to the generic audio cards (which are a single throwaway line in your
cover letter) - splitting out the generic card changes into a separate
series would result in more manageable sizes.

--6v9BRtpmy+umdQlo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl77GT0ACgkQJNaLcl1U
h9Cqgwf9Fw0z1EoYl+GQBfxwHgw1q0QJ+7vFY3wAPvTzfCpGF/GN0kWMZ5JRYfqA
HxqRAft5r6DgsdOMFRTCkL7ATAnWYyRaNDLoDeMINVQ9/mmaI1FPr/pNSo81X+OX
XL7gZ2xPW9t2GDqtW+AOLGi8crZdSGfWb8HZQDAp5S0tajhTYPpgprx8mXNHsAWk
mvpNfvCT1IeWgDpINtVq/75iixg+GgmA68C/x07ycpzpH2q3x91JbBjlGjlNXpL2
JMr7KKcz993cWC8BwOXIIxbetlbxS6LOINR0sQKFobxcqE16+UUmGpl/TFNDWqos
i2SEL/aLhcksjZJCyLrgV3MfQXoavQ==
=OUo+
-----END PGP SIGNATURE-----

--6v9BRtpmy+umdQlo--

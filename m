Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B474D27DE6
	for <lists+linux-tegra@lfdr.de>; Thu, 23 May 2019 15:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730553AbfEWNSG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 23 May 2019 09:18:06 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:49486 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730323AbfEWNSF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 May 2019 09:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=eSnzH8gIbU9tJo6la2gamT3PIFGOBGMMJHt4i5H7kKg=; b=lw7G/4RrH9Bm3DNiQrsfJaqQe
        WKKv/vODnOA81N7DCMb7ceVMt8TQQRWXaUgPnbWJJZFLUaBwQMA0ZfqYDpZWTLh+EeH/NQaVUhn8A
        XpGQal/q4oCNwN67wjZz8c7ROPNr+jWnTZGBbk6QZXYgFNulj2mcg4ytF/WYo4/m86N8s=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hTnbU-0000By-Ks; Thu, 23 May 2019 13:17:52 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 27CAA1126D24; Thu, 23 May 2019 14:17:52 +0100 (BST)
Date:   Thu, 23 May 2019 14:17:52 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: Applied "ASoC: simple-card: Fix configuration of DAI format" to
 the asoc tree
Message-ID: <20190523131752.GE17245@sirena.org.uk>
References: <20190521203241.B277E1126D1B@debutante.sirena.org.uk>
 <51ce00db-05ce-ba66-f1be-74c800f6daed@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Content-Disposition: inline
In-Reply-To: <51ce00db-05ce-ba66-f1be-74c800f6daed@nvidia.com>
X-Cookie: I brake for chezlogs!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 23, 2019 at 09:54:25AM +0100, Jon Hunter wrote:

> Please can you drop this patch?

> Per some offline review with Morimoto-san, it turns out that the actual
> issue resided in my DT (which was incorrect) and not the simple-card
> machine driver.

Sure, can you send a patch doing a revert with a commit log explaining
why please?

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzmnX8ACgkQJNaLcl1U
h9DyeAf/aqaSRpEHFdpE0yh4ivOxtAiWHU4BGbL0CGJ3CqeO3BzuYJQHxDNAgNWe
6+jnVf+RcMVwAFOJ3E4fqt6rYsQ+qIf/aHRGKmUX++TapvVWGnYCMZ6QK3FugGdp
9YAdt2Go05f+SuPe8xCpgnh2NZubzLRmKycDBbW9xc9C7OOgi+2BxXpdyL7Z66bH
cYsJ/OdsgDBVnrl2wT4xVMfS6C4x93ym2m4BZEls7E9tyV3E4niW/wMcTlC3I2gd
SvunVwfZf/3SagJYwJpOBl2zFX/Mi27G+b0O3uCXpidWAZag2CgDPtB2CoAH7/XH
r9LWxEXv8rzMATbdPAIp9UFP+BE4JA==
=jm60
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--

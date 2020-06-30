Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5443920F865
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jun 2020 17:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389425AbgF3PcY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Jun 2020 11:32:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:60314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389467AbgF3PcX (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Jun 2020 11:32:23 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 72B5D20760;
        Tue, 30 Jun 2020 15:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593531143;
        bh=X9DhlaL3h3M6dHLQYSpCp1s//BjVGMTXEFW1olrYlVY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cGmgcwpjkbNw52cCa7kRC/GPrkFsOqVEstQkyXvVZSV5xfX3TDwLBGaCURvEU0t5J
         025muooT8Nw9JkjVoawTY13UY5CS39I1DCSxV8E++nanIFjyfYf2b5mkS5P4oQgLsh
         spZcFcj44mNzi0dHHjyA82NYyDTZtJ89hsbkAFBI=
Date:   Tue, 30 Jun 2020 16:32:20 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
        lgirdwood@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, digetx@gmail.com,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, sharadg@nvidia.com,
        mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com,
        dramesh@nvidia.com, atalambedu@nvidia.com, nwartikar@nvidia.com,
        swarren@nvidia.com, nicoleotsuka@gmail.com
Subject: Re: Re: [PATCH v4 12/23] ASoC: simple-card: Support DPCM DAI link
 with multiple Codecs
Message-ID: <20200630153220.GL5272@sirena.org.uk>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-13-git-send-email-spujar@nvidia.com>
 <874kqu1x70.wl-kuninori.morimoto.gx@renesas.com>
 <1e0cf6d1-bf4e-8808-5390-c8a3b7c7fe7e@nvidia.com>
 <87mu4lz6pt.wl-kuninori.morimoto.gx@renesas.com>
 <1d7888c7-a8cc-e891-01aa-016e31cc9113@nvidia.com>
 <87ftadyrec.wl-kuninori.morimoto.gx@renesas.com>
 <492079e9-4518-78ba-a227-859d31594369@nvidia.com>
 <20200630110100.GH5272@sirena.org.uk>
 <81d106c0-e1c8-a79a-8caf-1f3be0d61f0c@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9/GiYV45wF7IL3Iq"
Content-Disposition: inline
In-Reply-To: <81d106c0-e1c8-a79a-8caf-1f3be0d61f0c@nvidia.com>
X-Cookie: Walk softly and carry a megawatt laser.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--9/GiYV45wF7IL3Iq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2020 at 06:23:49PM +0530, Sameer Pujar wrote:
> On 6/30/2020 4:31 PM, Mark Brown wrote:

> > Why simple-card and not audio-graph-card?

> Frankly speaking I have not used audio-graph-card before. I had a brief look
> at the related binding. It seems it can use similar DT properties that
> simple-card uses, although the binding style appears to be different.
> However I am not sure if it offers better solutions to the problems I am
> facing. For example, the ability to connect or form a chain of components to
> realize more complicated use cases with DPCM, some of which were discussed
> in [0]. Can you please help me understand why it could be preferred?

> [0] https://lkml.org/lkml/2020/4/30/519

It's the more modern thing which covers everything simple-card does and
more, I'd expect new development to go into that rather than
simple-card.

--9/GiYV45wF7IL3Iq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl77WwMACgkQJNaLcl1U
h9BoOgf8CqlyK9s07Hb+/KSOYbf63ZpZ3dwuHoWv8+gtnKh+DZIH3KN07uHzVHXw
q3NUE8wJkGfYijU49aUjB5lRw4KNjXtAUMUHNAKlzmjQM+cxlEj6nZOGWAFrHyYo
0rzPMLRbmsHTp9dcKdr7c/AXqYB8vgW+aYo6j76+W7fNvgW3thQllyW9ZKkvzQmz
7TePVknBmz5ov6rTQSau7p314ZBcJEYL74ANMr0LxKKe5TSv/xHLQM9WeEDdkMUE
kELoYHwZrWvOFUfy1nCl+uPqvUr+ciJD5gW5+PQvKnV0nAaVA2jW0RE3KMWKRu/S
PZJLfFNr7vFTIsIU0YMidjDYelIA0A==
=8bSR
-----END PGP SIGNATURE-----

--9/GiYV45wF7IL3Iq--

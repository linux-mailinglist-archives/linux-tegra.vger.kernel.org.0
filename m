Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD565148CAC
	for <lists+linux-tegra@lfdr.de>; Fri, 24 Jan 2020 18:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387827AbgAXRBC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 24 Jan 2020 12:01:02 -0500
Received: from foss.arm.com ([217.140.110.172]:54726 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387710AbgAXRBB (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jan 2020 12:01:01 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 761321FB;
        Fri, 24 Jan 2020 09:01:01 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8C5C3F6C4;
        Fri, 24 Jan 2020 09:01:00 -0800 (PST)
Date:   Fri, 24 Jan 2020 17:00:59 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
Message-ID: <20200124170059.GB4918@sirena.org.uk>
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <9b3a0cdd-34c7-ecb4-4a26-268fd4a63041@codethink.co.uk>
 <26aeb591-e770-5e6a-5ee4-05414ae4ddc6@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Content-Disposition: inline
In-Reply-To: <26aeb591-e770-5e6a-5ee4-05414ae4ddc6@nvidia.com>
X-Cookie: Drop that pickle!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 24, 2020 at 04:56:41PM +0000, Jon Hunter wrote:

> Yes that is going to be a problem. I assume that your codec wants a
> 256*fs MCLK? Maybe in that case you are better off having the codec
> drive the bit clock and fsync?

> Is 24-bit critical to what you are doing?

> Otherwise maybe we should drop the 24-bit support for now and just keep
> 32-bit.

Removing the support because one particular board has limited clocks
isn't good - it'd be better to have components with clocking
restrictions impose constraints as needed.

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4rIsoACgkQJNaLcl1U
h9BwLQf+KKkWJLuGXicMjabWZuzPftSubNU2PI7YkuSc1kFDJAvcKRIwKwuVj4Se
qgZrGUwWPyNruy3/LyZ0FxiAwGtAaOv5QngjdAzhpluSHy5ycBAoNw8ord1sFmt6
WU7BkX5rDUqu+ME2KsZLzV5UX2+w0x12QSx1j6TjGDiW6vQYJTyXVj2AZuCbRoYx
KrPdJPuoRM1qjGF/UGnNpoJ5vN4kzv8vRitbtAxOXT6ryMpUiVJWO8QlT2YlA3b3
oJQ3OkrkseWWEI6UBddvxA0jkhDa44K5A4blwt67ueTpvBT4Sw3AvnpFWsJhpHNF
VmXdypoMjQN21oIX3cAb3W6ph8ZudA==
=G/Sk
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--

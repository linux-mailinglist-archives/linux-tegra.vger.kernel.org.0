Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD12314B40B
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jan 2020 13:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgA1MNS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 28 Jan 2020 07:13:18 -0500
Received: from foss.arm.com ([217.140.110.172]:56044 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725959AbgA1MNS (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Jan 2020 07:13:18 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FE191045;
        Tue, 28 Jan 2020 04:13:17 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E6EB3F52E;
        Tue, 28 Jan 2020 04:13:16 -0800 (PST)
Date:   Tue, 28 Jan 2020 12:13:15 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
Message-ID: <20200128121315.GD4689@sirena.org.uk>
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GpGaEY17fSl8rd50"
Content-Disposition: inline
In-Reply-To: <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
X-Cookie: Doing gets it done.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--GpGaEY17fSl8rd50
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2020 at 10:20:25PM +0300, Dmitry Osipenko wrote:
> 24.01.2020 19:50, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> >                 .rates =3D SNDRV_PCM_RATE_8000_96000,
> >                 .formats =3D SNDRV_PCM_FMTBIT_S32_LE |
> > -                          SNDRV_PCM_FMTBIT_S24_LE |
> > +                          SNDRV_PCM_FMTBIT_S24_3LE |

> It should solve the problem in my particular case, but I'm not sure that
> the solution is correct.

If the format implemented by the driver is S24_3LE the driver should
advertise S24_3LE.

> The v5.5 kernel is released now with the broken audio and apparently
> getting 24bit to work won't be trivial (if possible at all). Ben, could
> you please send a patch to fix v5.5 by removing the S24 support
> advertisement from the driver?

Why is that the best fix rather than just advertising the format
implemented by the driver?

I really don't understand why this is all taking so long, this thread
just seems to be going round in interminable circles long after it
looked like the issue was understood.  I have to admit I've not read
every single message in the thread but it's difficult to see why it
doesn't seem to be making any progress.

--GpGaEY17fSl8rd50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4wJVoACgkQJNaLcl1U
h9DMkAf/bHJV00niDhM1x/+jpTGcn0N2F9TKUa1eQk5NFuzmH+wPdJN/fVIXQ9/H
9svsreaVKTU1il6uhl3HOUB2Prenx04OggzHfRaMQ4zbB1yCd67uL83R5jlj3yao
bdFTP/7O7ngzG9P7foNPQtJrWR72KEr7e6Ay4ekDrHJLiI9p0TBnwrLcA5Wop35m
C/k5YwvlJ8SzZgADBN74cxrzx/E59pw9w0M31RGRhAtXTWVu7GfjiitfvKLhcJWz
JfzVil637Tm3taQ4hiyqYvTGeQlUOS86ix1AcDBGQigMC0tCZtCnblr8pOhW09nv
i/k+B9psW4N99h6sq5+2z85Qk/svwQ==
=dv7A
-----END PGP SIGNATURE-----

--GpGaEY17fSl8rd50--

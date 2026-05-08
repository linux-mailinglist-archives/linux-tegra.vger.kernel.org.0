Return-Path: <linux-tegra+bounces-14316-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFziHfXc/Wn0jwAAu9opvQ
	(envelope-from <linux-tegra+bounces-14316-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 08 May 2026 14:54:13 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C59F34F695F
	for <lists+linux-tegra@lfdr.de>; Fri, 08 May 2026 14:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 865C23061E92
	for <lists+linux-tegra@lfdr.de>; Fri,  8 May 2026 12:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD453DCDBD;
	Fri,  8 May 2026 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Loyy1SeJ"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF7D397E75;
	Fri,  8 May 2026 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778244690; cv=none; b=bBpKOmieOtaX6tbiivWANNWD4GYAjYFqonNi2LoPQsvpI4sa+qFd5J12AOnnGsmzCWUMsd6RM9eaiAaefX78j7tw9IGb8zZaaQaKGlu720rRaiylegHHlKSzg291GXbUA3h/l/DRGYkP2Bt/3IyLAlpJsq65dkavershcjme+xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778244690; c=relaxed/simple;
	bh=wY8hvoDOP7zWM/bAKhRIfuei0lMntQ7eILycJzJdpxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGi6Sf+Bo9ZxGISOzAeFhReRG2KxFcMSeIF56eCEV6JjzwDCnIYl9YfyTsNNaWet8Rn/SfUNsS3Bl85wNv558qbBVlIRcgjBYcIQ7MubGmSO6ZImWQvqCLW8IkegUkAH9Ph3tMNkioUp34FOBTFfq6VZ+A6cUYZ3+VBlV013fRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Loyy1SeJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89344C2BCB8;
	Fri,  8 May 2026 12:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778244690;
	bh=wY8hvoDOP7zWM/bAKhRIfuei0lMntQ7eILycJzJdpxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Loyy1SeJjsS2292kO/bWSz3ycS8UV1zdVzhHOJmRh4vbI17JJQinQPRSEgfH+tsgb
	 +y/pewpDXlCX+9wmUq8nUzqkw7ebLdTJFSXwbus/+B7CQgkd/41nLHY8795wtqnyja
	 Tzu9V0sSBBDxiALocqp4MCsGYIZKIca3WLpK7m0Uh2C/zEly6O5okruoJ3ZjBaaJfa
	 JNDV6ilB3ulJC5bQLAoTzzIJLfUvBVW2wYEPRdsF7khYQX3H5aScym8+r9j77TGzbl
	 /fxC9sg0JIS34je1eLSqPhai9AF5W6c4QbQ43sTMO0Q9px5zdDwqd2Tn0K6WZKiSIZ
	 l0rXdYeiDD06A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id EADE91AC5895; Fri, 08 May 2026 13:51:27 +0100 (BST)
Date: Fri, 8 May 2026 21:51:27 +0900
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sheetal <sheetal@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tegra: fix build regression 32 bit kernels
Message-ID: <af3cT4GSj5rxyLaM@sirena.co.uk>
References: <20260508080031.4064272-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4smT8qUI7zg0niru"
Content-Disposition: inline
In-Reply-To: <20260508080031.4064272-1-arnd@kernel.org>
X-Cookie: Truckers welcome.
X-Rspamd-Queue-Id: C59F34F695F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14316-lists,linux-tegra=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,kernel.org,nvidia.com,arndb.de,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-tegra@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-tegra];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:email]
X-Rspamd-Action: no action


--4smT8qUI7zg0niru
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2026 at 10:00:25AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Compile-testing this driver for 32-bit causes a build failure:
>=20
> x86_64-linux-ld: sound/soc/tegra/tegra210_mixer.o: in function `tegra210_=
mixer_configure_gain':
> tegra210_mixer.c:(.text+0x709): undefined reference to `__udivdi3'

Someone already sent this.

--4smT8qUI7zg0niru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn93E8ACgkQJNaLcl1U
h9AbuQf/UmjkHoK/YO1p8PwcO8kqLTLWP88ixsNOo2CtRXc+M7MYjQGStkAP3x6Q
SFA7WgcyduOGgjWff7cdSJnaeFyM1aOC6XZYBfHc5iYI+17smdpwyMrKLr37BocR
/VCIe125geO4gYb3SQwC5nXekvHvPKXpPONcXBmMiOigRZKZqvV3Y/+iEOEfhvXj
P4RgpIC/d0lRPGFrh1wYbpUXCfO6bYeXbb6XX31JL91l+EGs/FsnumR6wmpE2x76
y74uEQKbmPQZyEv1qC2uZrAB9AfAGrtK/g4S6LkbzmJKrXkn4+RCOQJKY/3ExV+d
fpjv5XBvAxdGibkkB+besiB0nfv+3g==
=tyMJ
-----END PGP SIGNATURE-----

--4smT8qUI7zg0niru--


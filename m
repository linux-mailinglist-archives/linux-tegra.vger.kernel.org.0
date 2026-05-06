Return-Path: <linux-tegra+bounces-14238-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJIDJVYy+2nfXgMAu9opvQ
	(envelope-from <linux-tegra+bounces-14238-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 06 May 2026 14:21:42 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E17A4DA207
	for <lists+linux-tegra@lfdr.de>; Wed, 06 May 2026 14:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D20B300AB1E
	for <lists+linux-tegra@lfdr.de>; Wed,  6 May 2026 12:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A7B449EDD;
	Wed,  6 May 2026 12:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTUibB+y"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FC843CEFC;
	Wed,  6 May 2026 12:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070097; cv=none; b=lNRtETWDo4Y7+5wP3YfOIhNx0oinM/KaJLt8d3ENnWjoQFsRprlm4rseqzbW8NksKUaRNgBwCSuekLag6La0ecjtWMxwEaU8QER1RGPRFcQ+zxJJkpy6fRSGaulPxii/j3rCmVILA38nerd7Ztofb9dzZFFfDsZrs4569USus7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070097; c=relaxed/simple;
	bh=t3hbP7AubYp2C3nJfkuMIJM/a1DKJTDOt/tBbj3XISQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJ2j7WibK9XE0kkKedXx7SLJH2+ZamL0ZjCOokjX2XASz/yZVHpQT9yyWJSVQbBM+sDuVNJ24kr6Du6WkJ0XphYQ43BhWJxjy/aZ1UC4HcUQFX4FMQZLVgNjXc7nRXSXGDG3ZAVI0i1zkRQ4QrVDh0spx1TTNgWUbPWifzYPw08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTUibB+y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3ACAC2BCB8;
	Wed,  6 May 2026 12:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778070096;
	bh=t3hbP7AubYp2C3nJfkuMIJM/a1DKJTDOt/tBbj3XISQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTUibB+y8GyqoowmuKM8+ovNKS77fRx8/vjuE6rgloJBlMrA8gRRLKFLK4IU939MH
	 Cu2zMUhNbemjCYlUHyHvTR0u8fUz5nNyFVFXRY7nVTxT9h+MWpv8pUW0Y7qmIgcTdE
	 FF/0DtbB+awOVVIQ6n4lFrhulvhvWMQa1lZDgbP98g6uGMGBIZQ2fYPLl6PVSHRs8/
	 nizGoOrmlFu4AHpU9zPdPOh/g19viA8oy36W0W+QDOJ7jpBXRetnYDBeDzgWoKBYOR
	 q62oroFPZLBrKk/oA4kq96bJJ8yCM+yNS3zZzXE4NUlCtBkFtY1raNaCcw7YvhhjVI
	 /upQhf1T5NchQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 21D9E1AC587D; Wed, 06 May 2026 13:21:34 +0100 (BST)
Date: Wed, 6 May 2026 21:21:33 +0900
From: Mark Brown <broonie@kernel.org>
To: Sheetal <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ASoC: tegra: Add per-stream Mixer Fade controls
Message-ID: <afsyTS8XL3HuXIRI@sirena.co.uk>
References: <20260506102032.1644851-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dy75Tbp2warPCQ8+"
Content-Disposition: inline
In-Reply-To: <20260506102032.1644851-1-sheetal@nvidia.com>
X-Cookie: Alex Haley was adopted!
X-Rspamd-Queue-Id: 3E17A4DA207
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14238-lists,linux-tegra=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,kernel.org,nvidia.com,renesas.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sirena.co.uk:mid]


--dy75Tbp2warPCQ8+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 06, 2026 at 10:20:32AM +0000, Sheetal wrote:
> Add per-stream fade controls for the Tegra mixer to allow
> independently configuring target gain and fade duration for each of
> the 10 input streams (RX1 through RX10).

> +			else if (i == DURATION_INV_N3_ID)
> +				val = (u32)(BIT_ULL(31 + TEGRA210_MIXER_PRESCALAR) /
> +					    mixer->duration[id]);
> +			else

I'll apply this but there's one small issue which can be addressed
incrementally: if the duration is very small (32 or less) then we'll
overflow the u32 and generate nonsense values.  Either constraining the
minimum or doing the maths with a 64 bit value would avoid the issue.

--dy75Tbp2warPCQ8+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn7MkkACgkQJNaLcl1U
h9Ai0Qf/cPNIwpqGXVY2FnIqmaX+Ns9G9ioqwgdLQzB5EolNGkz6McWFNoc6L+Nj
WoNxnp/g/lJ/+6DTdWoaUgRNFswvzSiyNMOm4VG2pqojhu4CdTknTz/B3X1FNDaE
rI+oFomiVV6D/9gM9q2IJK/lHe09v9HNLMQVfpns4bydROD+aTjYiMQy/oX9hGwH
v4XZE3E8bYeaBqiWsxW7tPAooHF9YJK3Qu1jXFNHRuzIwFkR/NnTxN5o4hBUm9Ln
wBSr3P5twPXevbamfavAO/RthseRqVEl01uaDJtWjyFlxwCXEvq9ihmHqW5WOlBT
lu09CUSrQNtdKXBg9e9DmdtejF1BkQ==
=OIxD
-----END PGP SIGNATURE-----

--dy75Tbp2warPCQ8+--


Return-Path: <linux-tegra+bounces-13223-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ4BKaPlw2lvugQAu9opvQ
	(envelope-from <linux-tegra+bounces-13223-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2026 14:39:47 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 956BD325F41
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2026 14:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45241307AF40
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2026 13:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E6E3D6696;
	Wed, 25 Mar 2026 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVCq38OL"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611B9309DDF;
	Wed, 25 Mar 2026 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444078; cv=none; b=IBeDDcJtrte6AVv4/bb2vMiW1G8dG1WAyqzoxuM49OmPOEzbRnlDEWMnQm9ti9UurtRyIjO0sl/9w1gDzLPb6EuNQlvJoNVwOErLqqWkydFEailBosUwju9n8bBHhV38Kps/6eMInUE65WvTEU3FBTPVp9nOvmgLbG2D4QyO0ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444078; c=relaxed/simple;
	bh=I8o0yXI9ERPZDIXiuh1SbfWfBHVALmSfqR0P7beECYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHLOf7GD5QpE7zwcw3+ZWYfYyJqIcskybdcsYWHCHE32qBHgWH3kkTCWD8456RNeX2aUPgEuC/0fghPaUcT8Rc8RLogBT7QyKfQAGAGGe/1jFV8553nPmwH68Eiba5LaJOmaR3Ax6a2TGi9I1q1TNxIXLD5Y/ZsQhU+xr24ggv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVCq38OL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1BBC4CEF7;
	Wed, 25 Mar 2026 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774444078;
	bh=I8o0yXI9ERPZDIXiuh1SbfWfBHVALmSfqR0P7beECYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVCq38OLRRRqoy5hai2ay0t4C3l1txSz67gBEsCoTVE+sYo8ioLCtAF58mCsqk/n1
	 gFb5L05RzJPTPXPotBMSuj3C2on1Bs1eGL86oj2kp8odzJGwyM4BCR7eatvK+69hdk
	 FX5ZZuy3w3ARNFmZIz9UnAjh7UbvS5sdHdwGuOt26ZjIrdjtMYfm1ntt7hfzGobFL3
	 gB6LVk2kLdrnebmzVNTdpha2FRu02z/L2yUbslrfmuw92OtLBhM++qbcz7veNpL3bK
	 i7O048SjlobOcfDSAxwRbuqYytyPV51onZqb8ANfgrZsdI+ckr91jlBaaDD7EWj/ug
	 f6xb1c1+H0UnQ==
Date: Wed, 25 Mar 2026 13:07:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Sheetal <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohan Kumar <mkumard@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/14] ASoC: tegra: Use dev_err_probe() in
 tegra210_ahub probe
Message-ID: <00219f2a-4ac8-42ed-a81f-139c46e4ab3d@sirena.org.uk>
References: <20260325101437.3059693-1-sheetal@nvidia.com>
 <20260325101437.3059693-6-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F3Tch6PaKeufG7S9"
Content-Disposition: inline
In-Reply-To: <20260325101437.3059693-6-sheetal@nvidia.com>
X-Cookie: Those who can't write, write manuals.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13223-lists,linux-tegra=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,nvidia.com,perex.cz,suse.com,renesas.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 956BD325F41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--F3Tch6PaKeufG7S9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 25, 2026 at 10:14:28AM +0000, Sheetal wrote:
> Log errors in the Tegra210 AHUB probe path using dev_err_probe().

We also have some regmap logging in this file (again, can be done
incrementally).

--F3Tch6PaKeufG7S9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnD3igACgkQJNaLcl1U
h9Cuvgf+M2rEweRf+md/WixVhKN0ctGpu+M7h2F1kDZ3nok21ICyA6jXKT2NLh0c
nytBejf3Rm9Ck8EM4BFtRzIDNc+K9o32UKxdoi7UTibR6t8ekRHbOfvUe8/mm1NS
c5p0DFpVR3t88BLrBdglmEq4/sPXBLyI6qHXpMssyICPIJFcZ8elcSffJcjzAADC
LekUTcUkwfpEve3IwtVQ+Ol/vfTnZXSLYJjY3Zxcx1tnYi4NKcDOpYnXbQ681o9d
bvOFIWfA63SMaxyPn3KeOcV60jTCzG4tv/ZW1qKFzQT16sQszezofaj8tuCfcvTH
vxwWfp6Twl/46wroEBiQwwv0tXjQTQ==
=bT05
-----END PGP SIGNATURE-----

--F3Tch6PaKeufG7S9--


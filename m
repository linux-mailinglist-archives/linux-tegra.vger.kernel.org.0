Return-Path: <linux-tegra+bounces-14309-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDGtHzW2/WmAhwAAu9opvQ
	(envelope-from <linux-tegra+bounces-14309-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 08 May 2026 12:08:53 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CD24F4C7B
	for <lists+linux-tegra@lfdr.de>; Fri, 08 May 2026 12:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 029D03086BF5
	for <lists+linux-tegra@lfdr.de>; Fri,  8 May 2026 10:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8998F351C09;
	Fri,  8 May 2026 10:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGKFQige"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3AD3A6B84;
	Fri,  8 May 2026 10:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234547; cv=none; b=lK0JeWfEI6suQxMGg2FjBf3HP4adabGR5AWlVAMEA8vTTAYbzMZW2s4K4dB0RE5NAyuoHxsWDLcsf+nMBTxkQNSQ/CUAEqeUZlBcHwNIDe0Rr/Fjm2ZSuHk3fcTT9JRpsj11wOuCQ1UenYHGbERsrkLUWhi51ZzXSXm8PNCqpQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234547; c=relaxed/simple;
	bh=ZsB1u5QYgUd0o+x/1KXATQ2gf12Q6xH0bcuw7azMiA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqWZ2cBSng3e1okDuDkfn+7BuKo3DeZHmYb24pc/d30zrU0idQ+TeRqL30W8k/4hjphW+MaoO0JL5bwNHO51wuLMakrfJze6UNKWIHUrDJS85sT4gBDnZk6Bt7d3L3rmn1vLjGG7emQReG+OSB6N3KMmACu/X882VmpOGEFp7HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGKFQige; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AFDAC2BCB0;
	Fri,  8 May 2026 10:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778234545;
	bh=ZsB1u5QYgUd0o+x/1KXATQ2gf12Q6xH0bcuw7azMiA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGKFQigeFTyuG+IGL2bkdFytYFvJqICWLnn6l7I4ZEWLgHRte1+K7Nd+mPYdr/VjF
	 aTF9I5jhDzOl8gwJ34EpgUD9tpi97upHFypkyrY2Qw188Tn5Fm85shnEObCnXLvh3O
	 ZitbwClhSOHntDc35rvYDBh2QdQicDqckL8WonG6i2Bkrnvjz8AjxkdwjahmhyicoX
	 5d68y/gwGeDT6ZzOEAMGMWl26XlfDm/invYZZNdJtfrrS5NZ3H7nbIuyOiDeOa2C2P
	 06U7HZFNamFhdGUVbkPr14B57fl4gedw1FeXvPWWPBbS0s3ahw/sKuU0RtLiI9ukaI
	 mjqGrEtBeRoEw==
Date: Fri, 8 May 2026 12:02:23 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sheetal <sheetal@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tegra: fix build regression 32 bit kernels
Message-ID: <af20SU12MTdIKhEp@orome>
References: <20260508080031.4064272-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tzod3ryqakonmh7i"
Content-Disposition: inline
In-Reply-To: <20260508080031.4064272-1-arnd@kernel.org>
X-Rspamd-Queue-Id: 00CD24F4C7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,nvidia.com,arndb.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14309-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Action: no action


--tzod3ryqakonmh7i
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ASoC: tegra: fix build regression 32 bit kernels
MIME-Version: 1.0

On Fri, May 08, 2026 at 10:00:25AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Compile-testing this driver for 32-bit causes a build failure:
>=20
> x86_64-linux-ld: sound/soc/tegra/tegra210_mixer.o: in function `tegra210_=
mixer_configure_gain':
> tegra210_mixer.c:(.text+0x709): undefined reference to `__udivdi3'
>=20
> As the driver is only actually used on 64-bit Tegra210, rework the
> division to use the div_u64() helper that avoids the libgcc call.

To be pedantic: the driver is also used on subsequent generations, but
your argument of it only ever being used on 64-bit systems is correct,
so:

Acked-by: Thierry Reding <treding@nvidia.com>

--tzod3ryqakonmh7i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn9tK8ACgkQ3SOs138+
s6H0Ug/9EDI9eqWBQB6M5DqsYF1J4GeqVfPk96USDkicSNRY2NKbg+D1SKKUYNaR
Lja98lL7Lp4QOJmn5HowvZkM02XasJ+PvxWcAc5Kuewh5MghhBvJIgeDEHDbd7TT
I1/f3KjYFLyGTHbSgWwWXuys8QybHXk264FsD+/jh7I1310fu8DhCcccardQ++on
4n1Ilsza9dvqaehmhNVz+tnHmJ0/k8AOrXZmUtID44KggQBdjJYCRRctGXzCTwRD
WJ1B0q4EEPci9j+qCgmsEu8ZhdiUrO4ywzDUZEP23fSz6OtNYyyq4/IXKcV1rJdD
fbpw2O/OqdjqPtlBEs+tFXAA+CmHxWq16DnG8Ix40BKiecOsazkoRyf5wTE8NEOk
KIcBYWdTBniR/4cf7Nn9pDyduBqe1KgQ+MFDB+tTE2TE7RSDFZsc15i+ptgfXltd
HFQz9+OoQMEoXAKHiJRSx102uY183LlpqFJt3ojLU33yEvN1j0QQ0QmjCzM3gpKQ
FxM1Rh57HLn9fqRpLA5ZPWGRBRQsTBEsRLeEQPaOVMX1zAMymzBDTnLG5O6YwVZA
uEoPkzWMB/4wlkTsw9CoGwBua0THehXS4nB8dnoMpiMn0jHLVvD8XSUGHficJ/11
MOEMJ50xVHxprwU6B6p+xFXqRTAJYzHbA/s2GxxZG0SStGMi+tw=
=Yigm
-----END PGP SIGNATURE-----

--tzod3ryqakonmh7i--


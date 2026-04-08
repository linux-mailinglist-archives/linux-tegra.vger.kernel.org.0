Return-Path: <linux-tegra+bounces-13620-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEkiDryU1mmiGQgAu9opvQ
	(envelope-from <linux-tegra+bounces-13620-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 08 Apr 2026 19:47:40 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6F43BFD12
	for <lists+linux-tegra@lfdr.de>; Wed, 08 Apr 2026 19:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 45B1530055A9
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Apr 2026 17:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACCE3D88FF;
	Wed,  8 Apr 2026 17:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkihFGBe"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C723D88F5;
	Wed,  8 Apr 2026 17:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775670458; cv=none; b=jOqavKXzV4rcxYMfXFaXCGkdww4IAJHga5rQC2iXZVjYYk8FUW+RuPu5CMw8WC3FolMsW8uFWxSKp6OOmRbPz48etU4riisSmF5TgYpOk3VbN6cqhyjpUeWQVo2RLxmHZ9xbPRZD6MjSmxhrrQw2xgJODecNYxEN+TxuiT7+CNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775670458; c=relaxed/simple;
	bh=9/klKvSlizIayUaxcYHHwAkDpZgPnGNGV0vnti6e/DE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmFFAM12PGLnz8pHhdX8Rpzvebs6o5EOv0F0Lop9THksFadZEnSrP8THmpDtz7g/pMgP+nmNDPzIixz165FxXFEtpL15HQw8HsJlRjj272jMwDDw/gaP1jXgN2oM5dSUr0OccXju+kwDPxaMAbF4Cay9QSJ66fRVvy5o0HbOo6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkihFGBe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AEBC19421;
	Wed,  8 Apr 2026 17:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775670457;
	bh=9/klKvSlizIayUaxcYHHwAkDpZgPnGNGV0vnti6e/DE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkihFGBelbJSveqBK49nprxCicaenxXQ3u27vYfVfueA1vUqijM8WDOle3NgKT/Z2
	 bVyiZtwYZSySKromJ/nbvZEzg72U+84bdor1RN52/p7Kez/xPtFhuNohD1Ch9AcSrc
	 O29RhZtTOwbmSsGfhd1pYQ1VDp1/jRcaQRDgg7mU3m+XukF1KBuufzicPLawmHhlnA
	 DEvhZ4al7tIWoa1K/ZwoxGWxVTWDNVJ4kw3wUgjcG0UKvA9c2ZDBQd1PoO8M1b5ut4
	 YGyfzKtu4iIfIDbF3bC5aw3KDx9q1E+taACKGq13yWPKvyhy/xl0m4cugX6xcpDqLH
	 Figc8t0yMAf6Q==
Date: Wed, 8 Apr 2026 18:47:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Piyush Patle <piyushpatle228@gmail.com>
Cc: Sheetal <sheetal@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: tegra210_adx: simplify byte map get/put
 logic
Message-ID: <ae440ab7-e1ba-4f38-8ef9-85371f3236f0@sirena.org.uk>
References: <20260407170308.100238-3-piyushpatle228@gmail.com>
 <20260408170818.70322-1-piyushpatle228@gmail.com>
 <20260408170818.70322-2-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9uJ3Y4c7fwmPojbd"
Content-Disposition: inline
In-Reply-To: <20260408170818.70322-2-piyushpatle228@gmail.com>
X-Cookie: Often things ARE as bad as they seem!
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13620-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,perex.cz,suse.com,renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0A6F43BFD12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--9uJ3Y4c7fwmPojbd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2026 at 10:38:17PM +0530, Piyush Patle wrote:

> +static int tegra210_adx_write_map_ram(struct tegra210_adx *adx)
>  {
> +	const unsigned int bits_per_mask =3D BITS_PER_TYPE(*adx->map) * BITS_PE=
R_BYTE;

Why are we multiplying by BITS_PER_BYTE here?  We've got a number of
bits already from BITS_PER_TYPE().

> +	for (i =3D 0; i < adx->soc_data->ram_depth; i++) {
> +		u32 word =3D 0;
> +		int b;
> +
> +		for (b =3D 0; b < TEGRA_ADX_SLOTS_PER_WORD; b++) {
> +			unsigned int slot =3D i * TEGRA_ADX_SLOTS_PER_WORD + b;
> +			u16 val =3D adx->map[slot];
> +
> +			if (val >=3D 256)
> +				continue;
> +
> +			word |=3D (u32)val << (b * BITS_PER_BYTE);
> +			byte_mask[slot / bits_per_mask] |=3D 1U << (slot % bits_per_mask);

How big can bits_per_mask get?

> @@ -118,9 +144,7 @@ static int tegra210_adx_runtime_resume(struct device =
*dev)
>  	regcache_cache_only(adx->regmap, false);
>  	regcache_sync(adx->regmap);
> =20
> -	tegra210_adx_write_map_ram(adx);
> -
> -	return 0;
> +	return tegra210_adx_write_map_ram(adx);

We need to unwind at least the regcache_cache_only() above if resume
fails.

--9uJ3Y4c7fwmPojbd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWlLQACgkQJNaLcl1U
h9AqrQf8DBQqBwX4sl7s2gyOI2nc5H3IeGcGIcbkpye8/J3MC38oI7bbjFKIHQjO
m2IlMU5ctAuy+ELVGLMl4BRAOUgmyfP1BwlsPPvUMmkvZC7jdzeulfpvKOCDtTo3
8ScCLdEZO+twMxeffriIT7mq60Y4aNPz/cnomHe2BussgAv3Z1tcYarKFHC3uh/f
Cgltg4ppXRoXrmfMxpioajmCaWdMytFHkVxpY6hYy8sq1C0PBRLlPyGfyL+rcips
4/oy+BpWi3x39wVnZ3gjX5XOl3sqSOs6bM+3lVqn/SWwOoVaL+mBLx23Rwq48AwK
h4NOVXtUy9dX3AHt7cC5nfxErhOagg==
=0Lbn
-----END PGP SIGNATURE-----

--9uJ3Y4c7fwmPojbd--


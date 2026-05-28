Return-Path: <linux-tegra+bounces-14765-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mILIMCW6GGqsmggAu9opvQ
	(envelope-from <linux-tegra+bounces-14765-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 23:56:53 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F0F5FA9F0
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 23:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2FA5E300F62F
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 21:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A033655DA;
	Thu, 28 May 2026 21:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xd0FWhC6"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED3136493E;
	Thu, 28 May 2026 21:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005325; cv=none; b=uq4iZk8luPlZcBhoF2BDFx+VAvFRSE6LTYDjyEvecjiQpy3NhG00379apYWfCfLuUc63m5vLKSak+xi6c/aIU2ToIuPEaTNrT32U6VWf5eeDlJ9W3ijycb+ePPoBK0sUgo9vJDeGGG0L5E+lHPeyjSPKInE8zgxp+QZBhnipAxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005325; c=relaxed/simple;
	bh=WmdQSvkbmDNt//9do3DrpEA8QdzyV/lmXMbqqHY1oU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFKiBRxyV6Y8728In+JD7+3twpsE6htaGpWVEMGCbu7UCGeYLZOpGBO6VrdoFOyKniO2QhkSPXiX0waRSeT1arZeJNKqWa2trIDN6VnolwIer02DpV9MiEFYRzEjs0JcM/O0O8vQTI7RIM2hfktrunHzTKuIpKyJNdxHmF4PrMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xd0FWhC6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28BF1F00A3F;
	Thu, 28 May 2026 21:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780005324;
	bh=SAa76yh84Qd44sLoOd1TgRCB4ZjpaArNsn8/noDu15o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xd0FWhC6wMNsebE+Xj/IMQm7E5iWEy3S+pXL6lmO+nxSeDgGH4OSr+Gf7H8m+wzft
	 oPh2EkdtW5OxnsH1jj6DahHeYijtY/OSVSacu16lsbQC+CIAxdDHlymiol4E5gkz3N
	 tFGr7i2+DXzjtsfs3JW0WSgkaMPj1e1VXO4f8ojlpIeBOU8inCzZu1a7BKyY9Z1gX7
	 NNYUw6UKCtbLRjlL+ABhmoxmyLjmLbDt2GhjC/4IAtGBotUteanz0sGpVIZ23RZwsX
	 lPFoM2Zb+2AsB+T+QJ0HZcUm/rWqlF81j1+rqof1DxDBbu6b8WBuzUGApD6H54zV8g
	 eHWVve4eVkGqQ==
Date: Thu, 28 May 2026 23:55:21 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] clk: tegra: support 48MHz clock for pll_p_out1
Message-ID: <ahi5w_cXMD1cKcMJ@orome>
References: <20260427132447.118272-1-clamor95@gmail.com>
 <20260427132447.118272-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ldsvib3nptlmbhtz"
Content-Disposition: inline
In-Reply-To: <20260427132447.118272-2-clamor95@gmail.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14765-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,yahoo.de:email,nvidia.com:email]
X-Rspamd-Queue-Id: C2F0F5FA9F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ldsvib3nptlmbhtz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/1] clk: tegra: support 48MHz clock for pll_p_out1
MIME-Version: 1.0

On Mon, Apr 27, 2026 at 04:24:47PM +0300, Svyatoslav Ryhel wrote:
> From: Dmitry Osipenko <digetx@gmail.com>
>=20
> UEFI on Surface2 sets pll_p_out1 to 48MHz which is not supported by kernel
> and causes BUG() early on. Add 48MHz clock support for pll_p_out1.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--ldsvib3nptlmbhtz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYuckACgkQ3SOs138+
s6GCLw//Y/ywVSaL8SmWfKMwofVkFUNnxK4S0ZUcIIr/qdFN+VtdJjk9Rr0RywxH
J8abTuTR/7Lxh//2GsLcJxTtnc1YTMI4SAgm0uxWIuazO4qni+IhTaEMDkh1TAQS
9HhkeoKkJKkmAw8IMiXLSu4/g9/Kt+waI9NFlg5xE3mFTvD78gtSOpZr9zvYm0TO
zaqPlw1koxXcBVwdTGZxfmEIGjBod+Uj6MaB+wtNW4FMaOqx7dAlul844ROorim/
ifaZ++oo8Hq9b2kyq3hnKivksvhBWedaX998bahmjmHEFq5uHvxJSvtv7IRUGfZE
Rk/LtFc+RledJIvHG1yxm/c0cPFW/YhvVcl7YZnHf97JUsEa2FDhvV9OH3AXxQ5Y
bAci/3RgRMLDesDy2lueQFpm5FrIci/2i/gXIMHDtGB5JrpSCIFmX+Z4KhkEGBzG
B3p9DPAN1aZhNcwh5+UCwwMbK6TPzkUHkp3+M68TZ5rTEBMEtjyc15h2/Lh20VAD
5iOWUF+rhtOMZoEtjC98lGNYwa4L9pz9jdzuNTu09RLAqy3qstbq9/qR/FzeqqJL
HksSlTmFNyrZm4xmvGL1yVvfh0YYz6/6KZw0LS/kDCsDXAY5PG42aFq83DVJn1QX
KNjT/FcnVSLhm8pXHjifQ7pk4pZHcCjIYL6shNFnOJ14H7AGBRo=
=cEw/
-----END PGP SIGNATURE-----

--ldsvib3nptlmbhtz--


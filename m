Return-Path: <linux-tegra+bounces-12923-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHpeATsivGnQswIAu9opvQ
	(envelope-from <linux-tegra+bounces-12923-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Mar 2026 17:20:11 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7852CEA6C
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Mar 2026 17:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F123530D0B44
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Mar 2026 16:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70393793A6;
	Thu, 19 Mar 2026 16:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbJBCvyz"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F5D2EDD45
	for <linux-tegra@vger.kernel.org>; Thu, 19 Mar 2026 16:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773936595; cv=none; b=I8rqeVCPzt07oZLtM9FySUc0VFMXG51wtYcDX4Qeu7rihubrNL1NL89UajPLaEc5TS0q4GE39OzKGDpxeEuoRSodHXhiqDD0uS+eXJRYjJjPvrs3uftL/8ILkE3qvMZ8d4tdkvwvqavyFr2N15V/3yR2d8EH6jsTDZ323vhzP3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773936595; c=relaxed/simple;
	bh=Vm2RXvDdQvy8W+GSK8JzkxylVhZ9BxfcKJfddBrAzd0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWqARwYnGthbISQf3ejtBxD6JAiiv1dWPwVvz6Endjd9iYZz9/SnaeoniX0WtnmWyVu6EanREQ0UoAcksSMSUz+3Kgzs4ze8fTAS4IaU3rcnQGaQv11WnLKU6Z2TN3VvQ73v9J2GaI5UPtXnJ2o25Y0vqOKEk+7p6HcBWwz9A+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbJBCvyz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C87C19424;
	Thu, 19 Mar 2026 16:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773936595;
	bh=Vm2RXvDdQvy8W+GSK8JzkxylVhZ9BxfcKJfddBrAzd0=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=cbJBCvyzcCEJovPDR66IWn0++v3e8jW5tk6B65tsLEQop/ICx15fABemTFkaLeICG
	 RWb/ymxDdT0bIxO/i4t0F0uBr1tVDS6u7RSxtZHvsDqaUZWufmWPuyH1u+Jo3MfHGv
	 lOkGIQqW/SRqRjRerum+17dSakQ7eRUhn0+v2n87XR2840EVAxGUEubXk3LBKHBiad
	 nZmFtvkn2Ufdi6Wb4u97OetE8KMiPb3eC7a4qCwSA+gZBlYnu4UXF7wKw0ts74+aH4
	 e+EpDylXakXGFpzDKRhg/pgaqpwFPZg9WGGUpWvayWy0yRclOZ5BxlMIFywfn0Xg7G
	 tt01XcPFl9J3A==
Date: Thu, 19 Mar 2026 17:09:52 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] soc/tegra: Add Tegra238 Kconfig symbol
Message-ID: <abwfvqfw4CYIUAoX@orome>
References: <20260226150933.4067324-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ggvqexil74n6ufhr"
Content-Disposition: inline
In-Reply-To: <20260226150933.4067324-1-thierry.reding@kernel.org>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12923-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 8A7852CEA6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ggvqexil74n6ufhr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] soc/tegra: Add Tegra238 Kconfig symbol
MIME-Version: 1.0

On Thu, Feb 26, 2026 at 04:09:32PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The NVIDIA Tegra238 SoC is an upcoming new chip. Add a Kconfig symbol to
> allow fine-grained selection of support code for this chip.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/Kconfig | 9 +++++++++
>  1 file changed, 9 insertions(+)

Both patches applied, thanks.

Thierry

--ggvqexil74n6ufhr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmm8H9AACgkQ3SOs138+
s6GLZg//QL1EF61CA85bLrtZfmGSU/eUqsHpHelresQYGH7LFwk0nc7PNgUxfGCT
z7f9XtWa9dtsdDDeo+RZjnEYMGJ3UdFY7rguPgnL6VolWt22MFNAIrYBsl/d6kMK
zbaDF4xsX7BYPYN7IXbW1Wk1ZMb4wWDgWcC2udCqohdtpyhooCVED7XO3qLCCV9Z
Q96LBTF2GQrkUeo4jy07RIfEuqyYIW6hffrJT9qJGnpY4Qxd+RD5J272cCixpPfo
1U8uS4TZyQBwPfaGudduOg6Aqnjzd0XPJ5lcIJJCtuZdDwkMD5Il0jEEKdGrLqks
0SmxbnC164wd5PVmi6bcY08GclmNAHiuWl+UwMTQinALG/HChgJZ7aT7H7i0US9M
gIqSi3bcXO1I0wGWfKOvQCCU2U/mUcvUqpltMpF+0dUqw61OuozyDdOyhpfBMRea
1gPQ/i+XJMJ05ubWIhqqAUqohEaRCr67mGEVdyMh6gJbL9AADRY8Cu+nQ8jAkJn3
oW/UDvpAdlCGPGFAJXLwoeYtMNbL5TNVJJCFY9DREv6jecp4jlMYS9Hk7vDloqhT
7yg0cF/no8pTKRKHhEfzO6wHjV2vDDC5kHsNULnDgKRadGgMDHqU4qErwFwWM/K8
XdsQ3mzUGjcJnn+Lwq5Ao1N1dIoKWws8/sYTLBEm6Y6BL/x3Uow=
=mboK
-----END PGP SIGNATURE-----

--ggvqexil74n6ufhr--


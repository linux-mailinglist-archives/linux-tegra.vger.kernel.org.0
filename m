Return-Path: <linux-tegra+bounces-14312-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCq4ByO6/Wm4hwAAu9opvQ
	(envelope-from <linux-tegra+bounces-14312-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 08 May 2026 12:25:39 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A804F4FC4
	for <lists+linux-tegra@lfdr.de>; Fri, 08 May 2026 12:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68A2A300FC78
	for <lists+linux-tegra@lfdr.de>; Fri,  8 May 2026 10:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713363CF670;
	Fri,  8 May 2026 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2QAgu6G"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ABD3CCA11;
	Fri,  8 May 2026 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778235877; cv=none; b=oLtrVtAfepcD1HVY8/LoN1mGYRTkhDzQVTT+QK3NR6y1y/KlJMsfDRFT21uqar/eYIApUCWiwnW4+34F81Q3BzRAyIvO37OjMNtbhjWkjvxwrqxMxnQAFOgqZQSSdmlc575+HCshCAxdBOhHJ0yi6YP7X7Pmsj1HV1SG6kSgm5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778235877; c=relaxed/simple;
	bh=ZrmXcwK6NoeXzcPjGAuxnjjl9o5HFUIxXDwc0uFI3iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsuOCSxR3rYRdnGekQVR0fINKMkeanrdAvIs7r4HZ7GJ+Za+rLgQueG+7XjkwO3V9okh6c23gwf77u3rEZSRTh0XlQHk4LKQdecTboJ5h1Sz2OqxMWdauWtNaVuS3kLLyIqF4+1HSfYLDWqqlrVglTtacBugWwJVN7ny0SCIZew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2QAgu6G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38AE7C2BCB0;
	Fri,  8 May 2026 10:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778235876;
	bh=ZrmXcwK6NoeXzcPjGAuxnjjl9o5HFUIxXDwc0uFI3iY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i2QAgu6G1pEoE8R5ifG8pXAC5Z+bOxIPTs7piI+PN9i19XmuAfKgGndVHoDAvA7zs
	 HzR+R7H83pCzif6DQv8vk0U+1fi8n1K/8GEJv0jVxym4yL5V2+wv4C/Zoc6GGrS136
	 BtILp6YDvWocQBAhrvWjgTCx8VJ509uSv1zI5vJStnYk+F0wUJ8uF4l22404YBeyzc
	 xMZZxM8Nijr1xBRfKKSqDiW0ezg4dLiyY4Qois1LGc+nUERQHNXbDHx/7GofPi/YEK
	 4Km+GY9Q0NOIPr3PRJlXitT/T0x3faXF/gFKBL5vnufRdcXNicqEb5no4ZHGfTnp7q
	 pjV6xCKhEGv+w==
Date: Fri, 8 May 2026 12:24:33 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Saurav Sachidanand <sauravsc@amazon.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Akhil R <akhilrajeev@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>, 
	Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: tegra: fix pm_runtime leak on mutex_lock
 failure
Message-ID: <af25yiUXoxiWFcIU@orome>
References: <20260506195319.44810-1-sauravsc@amazon.com>
 <20260507221145.62183-1-sauravsc@amazon.com>
 <20260507221145.62183-2-sauravsc@amazon.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wfkyon33mwz4s2b3"
Content-Disposition: inline
In-Reply-To: <20260507221145.62183-2-sauravsc@amazon.com>
X-Rspamd-Queue-Id: 97A804F4FC4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14312-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--wfkyon33mwz4s2b3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] i2c: tegra: fix pm_runtime leak on mutex_lock
 failure
MIME-Version: 1.0

On Thu, May 07, 2026 at 10:11:44PM +0000, Saurav Sachidanand wrote:
> If tegra_i2c_mutex_lock() fails, the function returns without calling
> pm_runtime_put(), leaking the runtime PM reference acquired by the
> preceding pm_runtime_get_sync(). This prevents the device from ever
> entering runtime suspend.
>=20
> Add the missing pm_runtime_put() before returning on lock failure.
>=20
> Fixes: 6077cfd716fb ("i2c: tegra: Add support for SW mutex register")
> Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--wfkyon33mwz4s2b3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn9ueEACgkQ3SOs138+
s6EI8w//Q425l2AeGmqHjL8Z1rWbjoOiczIm5dDMAR8ivBVfO7emQL7oHJA5vsHJ
ZTHT0/cs0VBESpFIDiCMMXhJXujmzf0fc78sG+ILuyxKGnvoUy/J4r5IKoHtMrQF
QfJuA2I5jliE8fuIQkVfbnj7vy8OkmNNZngNWoufPorwH37J2crt1ZHercaHnwGd
XONYXGEUKqRl8AFBPSJw8YQnAIS6zQ4mO5be6sq4Zn6YmQlM03ASeCV3DUXPEl/P
BFjAltUl3E0Fn5UMuMB6BBHOOtlu53j0drMGn1KUCMk8JmjkKU90+Q6vZvDrHchA
eOU+qkIerddBUuFdb5tOwMv2yB+MpkrlpDfTZZPkgWQXssht3ofm/XQ00Ng5k4NX
nhfrYWz+QAYOVnxzBdGo2a69bJknUU6z4zu+r2IkxmRcSDy6Vo6qpRgN1GEoEc5p
JbMSsdfOzO2jabAUx7tQVHTwnNNdr6QmeV7V8tcI36MtHX91/CYCtmqWgkPBMOcc
vPOaTxM8qA2UBBVQq1ULdzsYuqVvoS9es/hcO3ZspPOkpIGSVcmNKQUVImeeoLeZ
A1f14Oh0E2lSURnu88kcczjJrJe/k5PLicve0jIyDIdzc2HcpEzhU3f5PGrKNegw
PEW+2uJWNSmv2jr9peXQtYqTxAuyIjGplFCNAGLzRyvTaxH20X4=
=gfD2
-----END PGP SIGNATURE-----

--wfkyon33mwz4s2b3--


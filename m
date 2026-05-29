Return-Path: <linux-tegra+bounces-14802-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKdiLU3BGWo1ywgAu9opvQ
	(envelope-from <linux-tegra+bounces-14802-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 29 May 2026 18:39:41 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C80C605C5D
	for <lists+linux-tegra@lfdr.de>; Fri, 29 May 2026 18:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 77328300DEFF
	for <lists+linux-tegra@lfdr.de>; Fri, 29 May 2026 16:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E373F1AA0;
	Fri, 29 May 2026 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSzRunRI"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EBA3F0A92;
	Fri, 29 May 2026 16:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780072775; cv=none; b=XRaM0lYYhWELvYmzM5RtRvrsySoauDY1XWvhlA5gfVZZzGdNn6vIZfW7sX30cso4araQzHs3bnNZ/whhwRFn5TlZJjBsOYkwbI30Uz90bK33uspHEbo8hp5dPjL+BO73td0MWLAdpWz3pb6Z9iBqIv4dWUyUhAju2wsCYviB+wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780072775; c=relaxed/simple;
	bh=VjnCVE6+nAepMLGDcsxvt7qsP0XteCur1iaQg0wTcO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0No5Lobwt5UMKH8W6th9p0EM2yPiY0QrHzjlWwZtxzxKsUlwJXo2DtTJbpHRFS3VXso/LzPl4dNIVuio1pQHMUUm5959Idr16idQdPiZAG4/miyzuKF9Dsff9oT+Y23nV4zm6E8OjDwfAnYK4YgmdyUmSi6kQvLTgIzouGcWY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSzRunRI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717261F00893;
	Fri, 29 May 2026 16:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780072771;
	bh=VjnCVE6+nAepMLGDcsxvt7qsP0XteCur1iaQg0wTcO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XSzRunRIjV/1cDCR8hunRML+RBI+/AecUMerctL3z9dDqmc28uc2vO22Us+j7YSaC
	 kZhjxicwZllc37Xi2N1maMgB3wmBBRq5UFvvK26Gc8uxfyh3XW9jqEoJokHOn4qjF4
	 E8dlpKScxlnOra/oEsCXE+WYl/x0u4lYZp4XLeTeB1ub+7KFIow//Mtg+XldMLX0m0
	 QzNsnkSa9NnwCmGiMsYKeA9dTjkzjpe40bduWnDx9CNzh44LVhZJ0Mj029VxdF1KQn
	 Uz+8oqpbkHtMs0gT2Vxi4E97Q4XYxVQ2h5dB1JzNvR7zxK14CVTWy9pzIxlVqGbbSm
	 deBcvMjbHv2nw==
Date: Fri, 29 May 2026 17:39:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: tegra: Add Motorola Artix 4G
 and Droid X2
Message-ID: <20260529-clump-appeasing-72dd559cacc5@spud>
References: <20260529083752.44796-1-clamor95@gmail.com>
 <20260529083752.44796-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gMEqJn1HomYBIguy"
Content-Disposition: inline
In-Reply-To: <20260529083752.44796-2-clamor95@gmail.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14802-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4C80C605C5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--gMEqJn1HomYBIguy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--gMEqJn1HomYBIguy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahnBPwAKCRB4tDGHoIJi
0megAP4gqkw06YctWX9H+UK8EZI+oUGwNVthUSxCHw3vNpNbEAD/TXE8Z2ST7jyT
mcUvoz3S8wZAwefcWDTVoTCGP6LfAgI=
=MfMW
-----END PGP SIGNATURE-----

--gMEqJn1HomYBIguy--


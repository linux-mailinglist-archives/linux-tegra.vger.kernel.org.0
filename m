Return-Path: <linux-tegra+bounces-14760-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGvnKF+yGGr9mAgAu9opvQ
	(envelope-from <linux-tegra+bounces-14760-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 23:23:43 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 070BE5FA5DC
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 23:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEC79301C3D7
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 21:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AF833372A;
	Thu, 28 May 2026 21:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLrdjzuV"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE92D328B7B;
	Thu, 28 May 2026 21:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780002760; cv=none; b=F3+mHKe0xq2xTpkxUY2jmQ4owEM8TUNtzXFIXo67uwmeOk6SPI8ZXPhoP46SgR98qIRJXbh+g8v85m4hflDl+5NGvsUaGuEt9CEHbmSgF6yxKN3EuWsFjOh3/lCIURPQCn4QDdgP4LdcsvTbCXnYmzXBOrjfK6ZzvU1f7AjlRD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780002760; c=relaxed/simple;
	bh=N6Q6dZlSpEmNSOYoyglyqXsB7by6b/s3pGUdN8sYtlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTgH7C2Ci+GRl7mmqQ6xCwyQ1Nbh8G8BnvKmblx4g0Mahm2IA9JiuKSInRAG0NcN/9fNnH75nkQiat2Rm8YK1XuAauUOdmG8ixZ5bN5g9+eGUrwMg0VIuHW3EwBdF3wLheT/tAheljN/pZC5ssVKwIuseIQoUmpaEzE2HJCPVzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLrdjzuV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289F41F00A3C;
	Thu, 28 May 2026 21:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780002758;
	bh=+A4LcBHs+bvjbmYW4AZ4n3BDBMEU6xKBUVGi2RDblfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KLrdjzuVoq+HRGpJHvbpPRanueI5bVqkBeKiQeoRIzGALYGP9byvd0lOVZWCNxcng
	 yqf7WSRzLFKcnzyZbT9A8KmBvSwccQR9fyD/6/NU6oveUnD4ojr7Z7OCDzemlwYibG
	 AMJhKrsHQe9TlHM51/nLGbFURMPQb+sasHeGXoJOIEX1ClEGb5meLX1+eTB5UN+qOG
	 FkN9nXkHlSJaOhnzZ4O1fMuQFQgI4e1TR1Wzuj4lNfFNST3X3BkyY8Wqp88vE8FkvQ
	 PHMrGNqH7IxZnTfoQu6mHtiWlEN9n1wJA0N54FBul+Mhdr0FRxflfh1spaZj4F7Ows
	 8lszmWNXxIq6Q==
Date: Thu, 28 May 2026 23:12:36 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: jonathanh@nvidia.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: tegra: pmc: Add Tegra238 compatible
Message-ID: <ahivtxKVx75EvaD7@orome>
References: <20260518101420.171465-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wltrl2omqbtsvzb4"
Content-Disposition: inline
In-Reply-To: <20260518101420.171465-1-pshete@nvidia.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14760-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 070BE5FA5DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--wltrl2omqbtsvzb4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] dt-bindings: tegra: pmc: Add Tegra238 compatible
MIME-Version: 1.0

On Mon, May 18, 2026 at 10:14:19AM +0000, Prathamesh Shete wrote:
> The PMC found on Tegra238 is similar to the version in earlier chips but
> some of the register offsets and bitfields differ, so add a specific
> compatible string for this new variant.
>=20
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes from v1:
>   - No change.
> ---
>  .../devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml      | 2 ++
>  1 file changed, 2 insertions(+)

Both patches applied, thanks.

Thierry

--wltrl2omqbtsvzb4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYr8QACgkQ3SOs138+
s6GPHBAAiQW0MnmIaqQXudS2RMeuVlnegu0Jxy2aKb+23Hn7nhxoz39mllAXpE5o
sGaBPst/vHYeUytKrZyK566O04upyJEJ2ZSZSKBXbP5+P4c6mTpp+lTXzYA+Gcuy
nCFtIsIL/mGMOeh6Y3yA9CJKGAHAPzCi4AwgOtoPstyAFRD0l5AoXEqaPvHQ1auU
tqBVdZuCTNxkOm61jhSaBE/1JAZuzuuoH3bXXuJ0US3evTB2/hVb1nImU28NH2WA
3qSQJYtGWMU87sFtGft3x35ajihkAFYiDG4mrEJvQohVIG7EJ/CRkqGVLIbOyrsB
ALay74CQAzg9ECv1AhSOCb+9z/k3HF9R1+yrWvBk1o+CedOf5Rz26P5zqGzTlGir
99HWWecxpRm0X/qtDcC1UABeX4KTkzdhsMv+XrmsLNOAIvc9HzkEWNk/9BbOpBma
g35P7GttrBWiCSWRzL48vMBkT+M1NyMuQCHLNDgh2UBvRet9QzJt26OTOdVMbrH8
92l3JMKH7RT/6/onLGJK+3vUYGgkPVLamWC+pCTnD79sLrwzch7v0muDdKLIMJPl
blj0ZQIgmk1Y+gZ4JzzaKIEjbekGBOO5nCLD+2pB79OUJ9J06dGcwQ2ZSBlV+yBu
0xlsr5xf0iZijf6M8y60Exw99A8EZ9LPPxxwjJKENztSgxNv10E=
=48Ev
-----END PGP SIGNATURE-----

--wltrl2omqbtsvzb4--


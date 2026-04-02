Return-Path: <linux-tegra+bounces-13531-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAmbNXJazmkxnAYAu9opvQ
	(envelope-from <linux-tegra+bounces-13531-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 02 Apr 2026 14:00:50 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BED9388B48
	for <lists+linux-tegra@lfdr.de>; Thu, 02 Apr 2026 14:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB4503013695
	for <lists+linux-tegra@lfdr.de>; Thu,  2 Apr 2026 11:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DE8364927;
	Thu,  2 Apr 2026 11:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QzJ6V8vR"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CB43806BA;
	Thu,  2 Apr 2026 11:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130884; cv=none; b=pzD2aAShfHBBQnfdvlyDP+8jQcB9ZTLSdVtT9hF6PMFjEujWDZk14mRN18cpKYcU6kbMg/MLUy62GvUqJXkIkcVjnzjnK5vE2k7+c1fwZaC5NEUN1dUq35hp2D+Beui6iO5Uu29iyaoazD4uz55BZLaeynYsQV+0WPmoZiHqMWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130884; c=relaxed/simple;
	bh=6jY2zA83Vj3154ea5Z6LcOkfUV+L4Q1s56RH12N/p/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXVJpyBmKCcTqbazAxL3suaPghyGcR8aIPX0uxOxNtgpbBAcV86tPV63JPpTBG3agV5HXMvHkIUa8tnHJYLh7MCKhFF9W10AGaxDZifdtTBr4EhhRSpvy8KIQ0MY0jfXS6uqGqw+ue/CAlGbc/B+I6EHK8ksE2KrBZcQgANCfm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QzJ6V8vR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDF2C19423;
	Thu,  2 Apr 2026 11:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775130883;
	bh=6jY2zA83Vj3154ea5Z6LcOkfUV+L4Q1s56RH12N/p/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QzJ6V8vRXkuz56WfCU2oxKir4hB82qs6ZJ/UIt9OgZy540/ZSV6TiuVkJwhJCHRt/
	 tP4xQIPbZWA7UZkuvDDV3OtVQ7i0Rl4m6xTol9ipzMb19AWnzz+jL2CCE96tDnzv7/
	 0BSUpyt1yXagj2RFEow2zIlASCpnY7SxkkQCASH3taBGXXsm4dzx04wCJemW93FzjN
	 zKhQaisQNmWZaLAE33bD4ktRuAMPV95PQODBX3vaDj8oB7u0m7xnaP0CXzOCPaaCRT
	 qrEJLOVVCyzhRm/CL2Ot790znrr3YXSQ1YaAFhc6tpWZWGgldPZSulfwdan0oQzMun
	 u7B1cpQcA8t4A==
Date: Thu, 2 Apr 2026 13:54:40 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: pci: Document the NVIDIA Tegra264
 PCIe controller
Message-ID: <ac5YiVt-HZMe8FfQ@orome>
References: <20260320225443.2571920-1-thierry.reding@kernel.org>
 <20260320225443.2571920-4-thierry.reding@kernel.org>
 <177440189257.2451552.18196101830235626115.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hywuacew5zvcyg2p"
Content-Disposition: inline
In-Reply-To: <177440189257.2451552.18196101830235626115.robh@kernel.org>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13531-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[nvidia.com:query timed out];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[robh.kernel.org:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7BED9388B48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--hywuacew5zvcyg2p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/5] dt-bindings: pci: Document the NVIDIA Tegra264
 PCIe controller
MIME-Version: 1.0

On Tue, Mar 24, 2026 at 08:24:53PM -0500, Rob Herring (Arm) wrote:
>=20
> On Fri, 20 Mar 2026 23:54:35 +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The six PCIe controllers found on Tegra264 are of two types: one is used
> > for the internal GPU and therefore is not connected to a UPHY and the
> > remaining five controllers are typically routed to a PCI slot and have
> > additional controls for the physical link.
> >=20
> > While these controllers can be switched into endpoint mode, this binding
> > describes the root complex mode only.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v2:
> > - move ECAM region first and unify C0 vs. C1-C5
> > - move unevaluatedProperties to right before the examples
> > - add description to clarify the two types of controllers
> > - add examples for C0 and C1-C5
> >=20
> >  .../bindings/pci/nvidia,tegra264-pcie.yaml    | 149 ++++++++++++++++++
> >  1 file changed, 149 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra2=
64-pcie.yaml
> >=20
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Unfortunately making the ECAM region the first entry causes the DTC to
emit a couple of simple_bus_reg warnings, as seen in some more pedantic
build tests. I'll revert this back to the oneOf construct from v1.

Thierry

--hywuacew5zvcyg2p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnOWQAACgkQ3SOs138+
s6FLXhAAkYkhf1nRIIvJYIqH6tgxjrZt5dvdiwTzt9PBd/ZsfokG/QxZ4wEAhaOc
xaaMRao0IdDpQw+NXblxEKeQK+19PxqJErQW7y1upkoebQcbKfL9EaHEAwEnoTo7
p//belmepyrLtvujjYGZiFkzhPsvaK3SlIuD6/sNuBeOPrH16cXQ6z2cWkKhiXhP
B+v+okT4nFTzVsVRIQR+Ywucjgs00zgTNXEV9U/hCoWCW2OW5jyfudpNKMVMKtZb
jZGDKG+KTYgAlwjndLUEmfea/2OBYfQKT+6fxlNrP/nzkgyzgbNLwwV8CYrDaXjw
l1z4+UQfKoUW/u72TUo98Hhp0EH2H3NCLNNaHzjWfDpvwZesYsgw8vHwBvZqaP5L
DUUHtsyEl6+oDI36ix2TCIn/bP5cbwpf4xrHhCOE6EcVcGAZQ9PvWMtc1Qkl7cNj
lC08iHWi0Zs1JPLTSpCewwHuz3iu8cDNaY29avNNCbAhp26+lvvKTUQ6lVwExFzU
pDtbK+I++xPKB0xpL3+3lez0qoJ/PW3glzwutyKNbZ3/qGzGmehRmBjYrK1M6xIv
HJkSLHxuZWti9u9ZrK6yvulH9SXwOMXR+DMsJRth2v6n1ofMpnrjgZaSpKblWryl
Vfd3soZ+AdkD3MTs7v4V1dojwiWJyajpqxzeyLtwYRWfSllPGyE=
=oZ2w
-----END PGP SIGNATURE-----

--hywuacew5zvcyg2p--


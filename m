Return-Path: <linux-tegra+bounces-13379-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNKvMCQZx2mXSwUAu9opvQ
	(envelope-from <linux-tegra+bounces-13379-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sat, 28 Mar 2026 00:56:20 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F3E34C939
	for <lists+linux-tegra@lfdr.de>; Sat, 28 Mar 2026 00:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5372E300B9EF
	for <lists+linux-tegra@lfdr.de>; Fri, 27 Mar 2026 23:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B57532E743;
	Fri, 27 Mar 2026 23:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mx5CSkLC"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ABE2848B2;
	Fri, 27 Mar 2026 23:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774655606; cv=none; b=Q2OQsuEN36OTYn4/UOWR9y3xPWdjVRvFJRjj/d2Pzd3zmXJJwR7ihZWprxMBW2i3mZWa3NNKfxL77cmFqWFMLismEUZBxP0HPHkZUpZOW/gMwnN7h4pcTdYW/gZm372YMOlcFcDUcGJrK5Egjamj4BFss1I85jQQ1SkxYfS2wYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774655606; c=relaxed/simple;
	bh=4uqL5/4EL6AQy+9VAdKQvIq0LGTDCVvjJICRgHmR4Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiBw5m8xgjvBJRbNVQ0ZyYLZNLQky1hMtif1Jhkhy3LMnlJxqnyzgWnfwz9VXlAcp8zQvvYZy1qUClUsq7ubEIgeDcmgqlmcifGfD8qu39Mw7kjtDFlLc64hu2yRPXPKaHW1AIPX2h/Zx8tw7DnUVrzP7wq5MPG1CBB004GUSr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mx5CSkLC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A80C19423;
	Fri, 27 Mar 2026 23:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774655606;
	bh=4uqL5/4EL6AQy+9VAdKQvIq0LGTDCVvjJICRgHmR4Es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mx5CSkLC4wjQawKdrZEsC6w3kowLvw7+Mj0SCQs9SeSZfCA6PnubLRDHdtOYH4XhD
	 DrDcFrSW05RxbAlyQS/S5KQ/AcQVO+2lOZyx8YDEhBKJGTkW9OwzUM0Vb6GCTYblpi
	 /8EefStbWDdqmDuDmY4XnK9LDc8xCVRIiKyoLuRJD1pP4FUhopbC8P3m3lkSBd5BD8
	 bKAk1U4O0CALSu1RokF1DuTAD+YW9guxkwKwJx+98c5omh+a9xlAv/FhdFyhBhZyh6
	 MwoQfZmwbZL/NwDxW5zD+KCASyPbqXCcR30QJ8NlNYOJBpOzpPjQnf8AVmmdUc/yfq
	 3P0nlsxkaOtmQ==
Date: Sat, 28 Mar 2026 00:53:23 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Sumit Gupta <sumitg@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 3/5] dt-bindings: memory: Add Tegra114 memory client
 IDs
Message-ID: <accXjw2BSCbzMyak@orome>
References: <20260126190755.78475-1-clamor95@gmail.com>
 <20260126190755.78475-4-clamor95@gmail.com>
 <54043284-141e-421a-a54d-a018c884b324@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ttc7ojgydhtaud2i"
Content-Disposition: inline
In-Reply-To: <54043284-141e-421a-a54d-a018c884b324@kernel.org>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13379-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,nvidia.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 28F3E34C939
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ttc7ojgydhtaud2i
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 3/5] dt-bindings: memory: Add Tegra114 memory client
 IDs
MIME-Version: 1.0

On Tue, Feb 17, 2026 at 08:22:24AM +0100, Krzysztof Kozlowski wrote:
> On 26/01/2026 20:07, Svyatoslav Ryhel wrote:
> > Each memory client has unique hardware ID, add these IDs.
> >=20
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> > ---
> >  include/dt-bindings/memory/tegra114-mc.h | 67 ++++++++++++++++++++++++
>=20
> This is never a separate commit. Squash with the binding.

You have previously requested that bindings and driver changes be
applied together. If this header file is applied to your memory tree it
means I cannot apply the corresponding DT changes until a release later
because the defines are part of the header included in the DT bindings
patch.

Seems a bit suboptimal. Do you have any good ideas on how to solve that
particular issue? The only one that comes to mind is for you to pick up
the DT changes as well, though that obviously runs a greater risk of
causing merge conflicts down the road.

Thierry

--ttc7ojgydhtaud2i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnHGHMACgkQ3SOs138+
s6GItRAAvq0DhDQOUCXxdJSvtavIVbxeeOEjgyInAa2CXy0aW0+IZeqRosvABfR0
cvN/PPwHevS1hsX6DFztcmRa4aLnLy9LVvKOQQ96c6kJs2jnsXFU3/9IKsIjMMOO
wqNNIpi9p0p06pbjei1VljniV1/sSbLb8rMWOitQR6ytiyCmofh6NnsShIT1+RV3
26e6XuTAzOhI6P1R2u/pU7sqDAw5bxenpQ5D93oH7yAtZm7tbqnocrZQvllZAG51
S5M7HytxDwNOFgQSpqzzHiCEa+m9A3Bbjg9HGJ5/PAIR2+eOcQXVMYdNLkCh5EzC
BPCJs5qpaxzUins0RQmtiSGnzUHtO9MH66YUCtxO9kn20scIoefy0vDtV972efeg
qRA5qzuR+e0w8m+DAnv82RfDfw2elYOomi5X9E/eHco8gKlOBBKsfFVeuTS8bRp1
ZXWEFcb3yGabYZtle5wDoYdaniK981Bqw3ms9OaAN10SHccGPAVLLw/DEZlZovR5
MZQcljLdmC4tdyVILRkpfDadQZPg7pfaycds33Cv6LMzEFfDO9BoIi2PHv6r4OK9
4uQvW2UsCLzYmyIbxnFBy98m1TM0BJtD4MiHtdmFhXD5qCKDIcFPJRm47zuKVTxO
pdMMS+XdqTBP4PYqT6VdTmXEtmdBKVatJ2vC1UTjeDurm0z4zW0=
=neHu
-----END PGP SIGNATURE-----

--ttc7ojgydhtaud2i--


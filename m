Return-Path: <linux-tegra+bounces-13090-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG7AKRdQwmnvbAQAu9opvQ
	(envelope-from <linux-tegra+bounces-13090-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 24 Mar 2026 09:49:27 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FBA304FEE
	for <lists+linux-tegra@lfdr.de>; Tue, 24 Mar 2026 09:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A29E131A3D83
	for <lists+linux-tegra@lfdr.de>; Tue, 24 Mar 2026 08:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87EB63D348C;
	Tue, 24 Mar 2026 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mm4dky/O"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004BF3CEBBC;
	Tue, 24 Mar 2026 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774341166; cv=none; b=oXfF5iXC3EaMa67YyQ6iq46g+B+CtMk5o3SilpfwwsTBaMYhWW400wffSt5EO+W9lm0tieti+ntha9yWW0YeAccJgU7B1+xBRYuMttCD4jjesoiBSmM825gS4jmDsHOVVd/zjmpuvVCWjpaRVStFwXFEYSZxNLzvONisTGCXMD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774341166; c=relaxed/simple;
	bh=BpcRrGX+yW4T+dD0D2mGo8pfmNuUh0uSl1dX9JsUAJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THbFl7wA7EDapL88tGNBLpT6bR5DEKdVXbj9F5KZnxlbHuoC80qgn3y4kSdCZROurjG8ndyrXHpeOUzUoEe2oF1NexcTUqh4kjJF0nNZGtTb8dBX3DPmoysqr+4Kkh/r6RE0b0i7uxEs17/GWhFXQCahNeC4Q1fZl3aaF4KJSVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mm4dky/O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3867C19424;
	Tue, 24 Mar 2026 08:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774341165;
	bh=BpcRrGX+yW4T+dD0D2mGo8pfmNuUh0uSl1dX9JsUAJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mm4dky/Og/hBJnwAM6Bzw2DZA/7eL3jle/aHDpojfW6vNCGAEvjdi5eajmrr8wOI8
	 zGXKjvEsXTEQN93ViyTfGlhfG2iGl8m/bc5dd+OALaxPnDXINVPkKpqxhb6qxW7eUM
	 me+tt6WO/1izvIO5AFWNQBJjuMYTWlyANTy19FlNTRPSTYDmsRQy3GQOGZUXJt5qkx
	 lLAENFQTAFuwaJrjI/hT9dxSc0gXP+lPeD9wz1MWENOoT76fjLbMKp5MkrRp2MkTFj
	 Qcw0KRrQo8pWU5ejCNiMr0i5OHziQw2+OS+1V9/k0gO6m24u2pN52mbkrgfMG4eMUr
	 meRw2PNDig6MQ==
Date: Tue, 24 Mar 2026 09:32:41 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: Document Tegra194 and Tegra264
 controllers
Message-ID: <acJLwYEfJVX4MseT@orome>
References: <20260320234056.2579010-1-thierry.reding@kernel.org>
 <8611828.LvFx2qVVIh@senjougahara>
 <d3ca4cd0-c343-4885-ba97-814aeaf80fac@kernel.org>
 <5154962.LvFx2qVVIh@senjougahara>
 <511d83fe-eb94-4c25-8ce1-b2476dfbd404@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ipz55wmxfw36sc3w"
Content-Disposition: inline
In-Reply-To: <511d83fe-eb94-4c25-8ce1-b2476dfbd404@kernel.org>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13090-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 06FBA304FEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ipz55wmxfw36sc3w
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] dt-bindings: pwm: Document Tegra194 and Tegra264
 controllers
MIME-Version: 1.0

On Tue, Mar 24, 2026 at 08:02:04AM +0100, Krzysztof Kozlowski wrote:
> On 24/03/2026 05:24, Mikko Perttunen wrote:
> > On Monday, March 23, 2026 4:23=E2=80=AFPM Krzysztof Kozlowski wrote:
> >> On 23/03/2026 03:45, Mikko Perttunen wrote:
> >>> On Saturday, March 21, 2026 7:49=E2=80=AFPM Krzysztof Kozlowski wrote:
> >>>> On Sat, Mar 21, 2026 at 12:40:55AM +0100, Thierry Reding wrote:
> >>>>> From: Thierry Reding <treding@nvidia.com>
> >>>>>
> >>>>> The PWM controller found on Tegra264 is largely compatible with the=
 one
> >>>>> on prior generations, but it comes with some extra features, hence =
a new
> >>>>> compatible string is needed.
> >>>>>
> >>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>>>> ---
> >>>>>
> >>>>>  Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml | 2 =
++
> >>>>>  1 file changed, 2 insertions(+)
> >>>>
> >>>> Where is the driver patch? Why this is not being part of driver
> >>>> submission (see also submitting bindings DT in description how patch=
es
> >>>> should be sent)?
> >>>>
> >>>> Best regards,
> >>>> Krzysztof
> >>>
> >>> Just posted:
> >>> https://lore.kernel.org/linux-tegra/20260323-t264-pwm-v1-0-4c4ff74305=
0f@n
> >>> vidia.com/T/#mfb40392e07d7ac9cedbaf853442eed822da7671e
> >> so this is completely misplaced. Please read submitting patches in DT
> >> dir and follow standard style of sending patches upstream. Just like
> >> every other contributor. You don't get any exceptions here.
> >>
> >=20
> > You asked to see patches, so I thought I'd be helpful and clean up my w=
ork in=20
> > progress and respond. I'm not looking for any exceptions. Please do not=
 make=20
> > such accusations.
>=20
> I asked where are the patches. The non-existing cover letter of this
> patchset explained nothing in this regard. After my question where are
> the patches, you sent them without explanation why, so don't assume I
> can read your intentions that you posted them just so I can see the
> patches and you do not intend to merge them.

Alright, alright. I'll take the blame for this. I should've coordinated
better with Mikko and made my intentions clearer in the cover letter.
Let's move forward by integrating both series.

Mikko, can you please integrate the DT bindings and DT patches into your
driver series?

Thanks,
Thierry

--ipz55wmxfw36sc3w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnCTCkACgkQ3SOs138+
s6EztA/+LZEiO1o6Grqg1HW/sMmiExEkKoo6QsqWry+2LvK2jgtn41LnoVC2RZts
q6ACZ30g7PKPthsX5ZXdZNDPShePnvV3a+EceSo0J49RWaUTOCUyP0CibPJhqCUu
UUtQQ6Pt9x7Fa/kif+ssr2lL+7iq6yfIN+2f8WjBJUaWFQ3PWbmhxi1+m8E3WEMw
oTz/3c6cnSqK9JgELsYQHBkjBb3mhNvBa0pHssvD6lUJRNXt8eTmRMWyaEAppZqT
MbfUQmIXTYctCewu+gm5JJF15VECMgdTLkL8pbqBvHP/jWvTHUtaCmv9pMDjhSpC
8j7k/eAvjy5XyCaAKtuTP7YWGuRQqcjQvNVrvVPNnZAGtTAwyqL1wl5+Z1cfxw3w
y2D57yKrIT2Y0NUTZM7KjEPTVG27t15541L62BKbEMHLMvprRbRht+riXsZ92A4Z
BsYnWs7PJnad/TmgULHW78hGvMTRh2tjDu34EP+GSuuc8pPphU0nXIbK/F+T4UjL
h7s38f2po+JIGjtkpNnYkDfxKWuya3CwOKcpc9ZpsyshbWVx6hdYmF187TR9rt8l
t++Tl1lzdUF9+kq5HgIOTKTfE5waDShxVBv/WVsBCQHRnTDI3YlDtlvT7lRjIIee
sBuU7enh5SY73QJCucIcGcKnDlwTi1ObluIi+ZVnm07q0liys18=
=PgDL
-----END PGP SIGNATURE-----

--ipz55wmxfw36sc3w--


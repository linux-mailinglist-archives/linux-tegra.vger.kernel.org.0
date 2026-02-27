Return-Path: <linux-tegra+bounces-12233-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEqCGDSHoWlOuAQAu9opvQ
	(envelope-from <linux-tegra+bounces-12233-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 27 Feb 2026 12:59:48 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C489C1B6DD6
	for <lists+linux-tegra@lfdr.de>; Fri, 27 Feb 2026 12:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15BAB3044BB4
	for <lists+linux-tegra@lfdr.de>; Fri, 27 Feb 2026 11:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4877A332EBD;
	Fri, 27 Feb 2026 11:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEAH37lb"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2544431985B;
	Fri, 27 Feb 2026 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772193392; cv=none; b=pXknJNVIVlOOrFb/qgtSpGcww44DSRmPKbfQhG1NHQ1vlkBpXLnF3Hve1yWPI0M0dtq+lG6b22QZQYpugDO8biEv8H5f3m1uwUlJa02DqsgES/siyt7JimKYEOKdjzwYvR1J3llTEZASvac4aNAsfLb1an3IFnGIi0t01RHZF9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772193392; c=relaxed/simple;
	bh=4zOZQNZBLKcd5Q1XsUBbW9ZIN013BG0dKU8LMq8mTRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKQAaaRfwuN9avKQuoSaNTJNCily6JMn7oIxYn1+vQN2k84/WDfl38XWp37lEypjMUDti3Ktn8EJDRrxrJGsWyH9G6Sgzr5dVlqtzBwpQTIaGapDY1iN7Uvr7IE5f7icjOJVmMHwTaJquV9loat3vLJZSxLoXQNUFVLFW1qvMiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEAH37lb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BABC116C6;
	Fri, 27 Feb 2026 11:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772193391;
	bh=4zOZQNZBLKcd5Q1XsUBbW9ZIN013BG0dKU8LMq8mTRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FEAH37lbQTpFM91u+Ljj/lCH5BOo7aN8u0PmOHmWJcgoWBNjmf40MQDnl6tXg51FR
	 Y24GZbkO+hRcllECGrw+8EoyOvQL1vBCESOVFzqpBEi+maz+w2RFnhcOIhdYtx/qKc
	 ZVk3cZzc4uasgqVUEtrMwx0Q0REV1N0MV4O4Lr0FZUg3dRE/fU0CTNfGQH96FyaEAn
	 z+y7622Asx8+5HeYtgUOxXqlZE0I53HzjTC7VTNftqvasvlnldq/Pqjtgbyn8AE2am
	 fnIGglq1OsK0cx9Dyhf+1rBRPs3eMuAg0VCOFKXIRfezRKPZeMFltFDlI+xrpXY7qf
	 scEw//xQJr8Jg==
Date: Fri, 27 Feb 2026 12:56:29 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 4/4] memory: tegra-mc: Use %pe format
Message-ID: <aaGGZrjCqAGrhz8P@orome>
References: <20260226-memory-simplify-v1-0-ccb94f378628@oss.qualcomm.com>
 <20260226-memory-simplify-v1-4-ccb94f378628@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wzbn5rw763ds6vmz"
Content-Disposition: inline
In-Reply-To: <20260226-memory-simplify-v1-4-ccb94f378628@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12233-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,nvidia.com:email]
X-Rspamd-Queue-Id: C489C1B6DD6
X-Rspamd-Action: no action


--wzbn5rw763ds6vmz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/4] memory: tegra-mc: Use %pe format
MIME-Version: 1.0

On Thu, Feb 26, 2026 at 09:35:27PM +0100, Krzysztof Kozlowski wrote:
> Make code printing pointer error value a bit simpler and fix coccinelle
> suggestion:
>=20
>   tegra/mc.c:975:4-11: WARNING: Consider using %pe to print PTR_ERR()
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/memory/tegra/mc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--wzbn5rw763ds6vmz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmmhhm0ACgkQ3SOs138+
s6Fo7w/8Dga5K/0/9FBJxKug3R/wwbPK/GA/np1+kmgPGNR7QVp966YR8gzasfV4
mdn19fXzQ860qnbKRPT9jX8iJz783WHZPlDSsQotRjFRqLlWJU6jL2IcCRxWDqmT
mmH1yb3LTnD5jGCZFEEyAlL6mjDDPXw5seUTvkcp8jZLnCuspXjkIm1jrOFRtuMb
1HJ9BIwlAiUx9vX9SQ2ruurCsZFxu/3ctjUDjB/KmwgofWjZM4Q/ig2T3r1p3I5H
s9ozBEHLOZJh6qUYETWoJlTnINKSw151+n2lzkA1lctNNmsPGA/Z9G0ddEL8JF5e
aJlzj6UNTygP0Yyo0D5e5qTcSkTWbakbKruqJuW/OCuyRKIF58si8Qa7XZ3W+4Lx
xs3hIaxPS0KfeiB2Q/2iFCa49tnJDvy87B5xHcOsiO3MmzzyVbiDLfI/8blfU3fF
UGbWj5vpqOTtBcg5l+32MXZM28IDpGGo7E1E2H5R58cGa0AGFqpwhaohOEadrwDl
BasrZEPYo3zMHW43Vg9Jxrp41ot1jlx4HDT6oS3PAOoSDWsaxJWspIcKjaIlyz3d
a+YlYBur6IIaNdlYsBOK4AVUqCq0K0gnY5jANLrYaS8AejmMs9ztYsdDJ6ZvWv95
ABnwMt9oez1DXfYbAHX+ly7RTeFzXbRTAq+ENmwqHCE/gLfEy2c=
=wBT+
-----END PGP SIGNATURE-----

--wzbn5rw763ds6vmz--


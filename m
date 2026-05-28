Return-Path: <linux-tegra+bounces-14754-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EyvLN+sGGpolwgAu9opvQ
	(envelope-from <linux-tegra+bounces-14754-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 23:00:15 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9075FA084
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 23:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF7A13001C6B
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 20:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A6D33291F;
	Thu, 28 May 2026 20:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iz09SeYN"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82D232AADE;
	Thu, 28 May 2026 20:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780001663; cv=none; b=gow8iRP0uYori9xu29hG/S8frH45zgFZLIRcQsVWNC6nCM16muAo3W2mz3YEq3RyOD4el/LHXVX+g73mo9nAteUiUeAEQP19baiHLVpLaCu+W1G158OLcoJVIMxhqpO5ljefJCjyG9vwdWcHrlkPUyBr3xONEQmTSFp2aCTl+5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780001663; c=relaxed/simple;
	bh=BTN7qLK+52a2HJxIYQc+mWk4qZm/9K3r+nUc1Cj5nyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbK6d3C0P2iHdGxwDZkc/YgGkouvfAaRSy0qX2T9RA9yi/SC+hVBrG36oWgFEmDnxOd0xSvpuuZnMeaJ66kGv2IyPSUSv+Yq/RPMt006hRlig0Vk5hHWODdbE6Awz3Q1se3f7n7agg50kZMnRBOg5gJHg8V/dgaOgcNWvqIutvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iz09SeYN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBCD21F000E9;
	Thu, 28 May 2026 20:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780001661;
	bh=2G34fnGmkmRCuga2v0nSyRziiDYtvnbdhLlcoW44ug4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iz09SeYN4Iyo7/d0Y1asGiSqpFxJ6DEuwVmbPBLu6rS1g2/p4TvnaIf8kN+OYOAvS
	 HxaUYHZCEY15IiiybTkFbaMPI/i0fs9omYnI38tKrgaaAMH0mq4Hy2+VOXdgBC0MzP
	 DwmVmhNPgjebG5WvTVnZFwwfWMMIFKWjRySLEdmIjBUaOQZZ+mP2rNQmQuzDEEv+9Y
	 Q0TTiF2cEETZe3NQLYtFJGabAMrGGmHDBz8rVGxbUAokYWUJTqbOYd67FLeCgIjTNO
	 bBs923GW+GF7FmKeoxIQzND+9Q47wkcDyqeTlNYiLArjUDHkMf2cTsIcekHnzSwH5U
	 hhu8W3ZJI2Qcg==
Date: Thu, 28 May 2026 22:54:19 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/4] firmware: psci: switch SYSTEM_OFF to sys-off handler
 API
Message-ID: <ahirc5aAH3dwDawe@orome>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <20260514-smaug-poweroff-v1-1-30f9a4688966@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nzilneadabmojjrh"
Content-Disposition: inline
In-Reply-To: <20260514-smaug-poweroff-v1-1-30f9a4688966@tecnico.ulisboa.pt>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14754-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2E9075FA084
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--nzilneadabmojjrh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/4] firmware: psci: switch SYSTEM_OFF to sys-off handler
 API
MIME-Version: 1.0

On Thu, May 14, 2026 at 04:47:19PM +0200, Diogo Ivo wrote:
> Replace the legacy pm_power_off hook with the generic sys-off
> handler infrastructure.
>=20
> Convert psci_sys_poweroff() to the sys-off callback prototype and
> register it through register_sys_off_handler() with firmware
> priority. This removes the direct dependency on pm_power_off and
> drops the now-unused <linux/pm.h> include.
>=20
> This aligns the PSCI poweroff path with the modern system-off
> framework used by other firmware and platform drivers.
>=20
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  drivers/firmware/psci/psci.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--nzilneadabmojjrh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYq3oACgkQ3SOs138+
s6EvIQ/+NSPLjpH1GzS6NNKI/4+bRuT5u2FFyygNCKfSSaR9Px7pHu8aO1Hi9vFr
CKqWer/BMr6/hRqVTNO7TTV49hZL2l8wx0koB/j8OjXph2KrDTEFug6ExD5zUld7
rzNgPkHWOZF7DwwJfdBuUgon+THoxNeoEU590foaoGhl8xZQ0WMcsuRKj4w1p3UZ
Ma5NEmgtBecUfZfttyiaUnbvF8b6nD5fp1aVC6AhMzkr4PUGDjSMytv54cVkOrZy
mWvpq1hW7kW21cuki+jCNxgIykuwQmm/XOkxqGibhZTwi+B8c0nQxFH2slPkX4rM
4Xt+vZrOKyOvqS7PStE5+4u61koGJs2Cc8pocqIMjfNvIS/Vea2lHD+gvO9IwWa6
PHZKr2+UYFt3YTwCD5dJuoUaMtBo+GEv9KDMC0FD928gg7vBr+dya7cD27XO2iGS
d0JqnT/1OkLZy1s7EA9KuWdU5/h5gvMPlcWAur2tSavXEO3IxjzJDJYmW1H+4xil
TRxSzzJMGxlAPxJQNnQDzqixLaeDqwVRws+gxH6RJyJoGBbPPFGm7UTu2+7zKBDb
F0hRL8bI8ZYq06Zn0F1J3kIrWlUO/CHXWugomWD/6IuCVM6fVQC5UmhaQtTqUbXH
gSZ3ocRT1zcTmO5V4rx+Djg/ZhfjKv3j/tJVGSYPuAv15BluSOU=
=7W3h
-----END PGP SIGNATURE-----

--nzilneadabmojjrh--


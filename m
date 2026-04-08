Return-Path: <linux-tegra+bounces-13619-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIOeKF+T1mmiGQgAu9opvQ
	(envelope-from <linux-tegra+bounces-13619-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 08 Apr 2026 19:41:51 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BE73BFBB4
	for <lists+linux-tegra@lfdr.de>; Wed, 08 Apr 2026 19:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A42623001FF3
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Apr 2026 17:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD403D0930;
	Wed,  8 Apr 2026 17:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Br3oYPxw"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481B933A9F8;
	Wed,  8 Apr 2026 17:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775670109; cv=none; b=Iwsps1zFfP3P1KGEO3h3O907sTBxsNDuPyV76q5b7+t4Sq6m7HGhTJa/mFY+RcS9AHfnNbmTCscf1W5ux1/xh67wzkYbS1Mbi28zTOkxfdevGPLXLGeWPfPCB05rMMUPSB3DgMVRqp9K0R+TilLrh9QFQzIAO+z39JHYSUM4P3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775670109; c=relaxed/simple;
	bh=J84vD1MfHdhlIE45pWpk4QorgWHsZyV9Z6xCzUY9sJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9uohN/JnsX+DQN16K8ZflxdhZlmnmjgUptfosr/m6Bnr877uymR7rXsdOqJki2mQ1vf6agzW1CURbv2WGY0N9tD9egIWtBZONPGnH9k3bZTeUidecnX9YhyfEh9oeXesad4ZvkFBykmgyVSpucJLHCqWIZPqXV2fEAMT5OfeWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Br3oYPxw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B04FCC19421;
	Wed,  8 Apr 2026 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775670108;
	bh=J84vD1MfHdhlIE45pWpk4QorgWHsZyV9Z6xCzUY9sJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Br3oYPxwfxE8avFS7AyaPEOtJrWtjvL3Fm90zg6D/SojjwMubCNx8DSNKX1c+IXZo
	 8sjtPcyzK52uN/Unc+jOy0JHGRyp5Q28wVLwmOeVAe1e1StPGSyGoWik6tpdq+CCPc
	 wpy5HtfU2xxTanfOSfeQSB/0y67OeMyhh1/QZqrFQXLRmMOl6+Fjf+NHia9T3vEYvw
	 0UC3E6LZt1eDtGZktlofoFrTZCTuHGi+YTUEZo8FQ7QzixS9jS2i/6FNtRafnGDLPN
	 GpHJ8bUiXrgKhggH1fujysnIfi7g3DAL5cES/Ds2rpgnABgQHGLXFtAUXrcYB+5C37
	 uzSQvlGfTJM/g==
Date: Wed, 8 Apr 2026 18:41:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Piyush Patle <piyushpatle228@gmail.com>
Cc: Sheetal <sheetal@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ASoC: tegra210: simplify byte map handling in ADX
 and AMX
Message-ID: <75436380-cb29-4bb0-bee6-c5a55dec25ae@sirena.org.uk>
References: <20260407170308.100238-3-piyushpatle228@gmail.com>
 <20260408170818.70322-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rLKbNeXUz46oRQav"
Content-Disposition: inline
In-Reply-To: <20260408170818.70322-1-piyushpatle228@gmail.com>
X-Cookie: Often things ARE as bad as they seem!
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13619-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,perex.cz,suse.com,renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 45BE73BFBB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--rLKbNeXUz46oRQav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 08, 2026 at 10:38:16PM +0530, Piyush Patle wrote:
> The Tegra210 ADX and AMX drivers both keep their "Byte Map N" ALSA
> control state as a byte-packed u32 map[] array along with a separate
> byte_mask[] bitmap. This is because the control range exposed to
> userspace is [0, 256], where 256 is the "disabled" sentinel and
> does not fit in a byte, so the two arrays have to be cross-checked
> on every get()/put().

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--rLKbNeXUz46oRQav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWk1cACgkQJNaLcl1U
h9CV7gf+OnvvdaesJ+iuZqcfsbhlSFtHcqc0HnBEI7swWON42gcgZK1sJ/gNzwrn
S8uvnTcrnhdFBZm6yxtY52ldPjiajMKb7d1VVf5FShfkCdm6sZewYujlA0WJa3YN
Mr4imkGLazSQmeDwUuaP54LCgMFk8wnL/PGzly5S7gnnuhUYtAXoKMsqja77uTqz
f+B3h62B+uY7o1G+bz1zE4lnH4yN9CNFM9Kb3HloOkL2D/cd8AKUPCTK28qq6L4K
Ov0PDP7lbR3SQ7/n0V8hLYtrgDvG8E8eAGIt2zLOJeD0g41DQVe4mS6i0TclfPmg
t5CiBK3j6SSOXYAjpFI/2gnGl0lr4A==
=hyAv
-----END PGP SIGNATURE-----

--rLKbNeXUz46oRQav--


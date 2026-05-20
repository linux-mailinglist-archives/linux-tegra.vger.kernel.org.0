Return-Path: <linux-tegra+bounces-14583-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLeIAcvcDWqE4QUAu9opvQ
	(envelope-from <linux-tegra+bounces-14583-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 20 May 2026 18:09:47 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6715D59188E
	for <lists+linux-tegra@lfdr.de>; Wed, 20 May 2026 18:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99DC0307162B
	for <lists+linux-tegra@lfdr.de>; Wed, 20 May 2026 15:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291933EAC84;
	Wed, 20 May 2026 15:28:53 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1662835200B;
	Wed, 20 May 2026 15:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290933; cv=none; b=MCQAcXCXISS01h8h0hslq33LCQHqn3VFJq9g8jAGk5GGe9os0BI6IHc3ffgk9JyYUEP9TY/RaAN/pk/wus/TpzN7+/z/WmchdPTjLoJDbKcQhxg6zg+WELCGXWAZXBHCKiqivCHtWblqcWzK+alc9O4ZsIQBqu3DtEltozmLt4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290933; c=relaxed/simple;
	bh=mf4KbaCpQm9xd1cXPyZqMrRp/gjNYSj5t/CNjPsqiAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRAjEQGQ5TcRbkUfAnFf295+EpgLqDVcsQmRrcycOHM/1R5rlTSHx81dva2BePgh8s6QPIIlHDNQSfuEZmQ+Dag6TVhmuAuZBXTvb/QDtL1/kCo8RHnG83dHwgIdiEEamNuQZE3pRfrDRao6LtmLiLZFUHpPJimFQ+5d9XJzff8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A9B1F000E9;
	Wed, 20 May 2026 15:28:49 +0000 (UTC)
Date: Wed, 20 May 2026 16:28:47 +0100
From: Mark Brown <broonie@debian.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Vishwaroop A <va@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Breno Leitao <leitao@debian.org>,
	Suresh Mangipudi <smangipudi@nvidia.com>,
	Krishna Yarlagadda <kyarlagadda@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] spi: tegra210-quad: Convert to hard IRQ with
 high-priority workqueue
Message-ID: <5bb26a3d-8c38-42e1-9651-40dc4214428c@sirena.org.uk>
References: <20260519155108.4092518-1-va@nvidia.com>
 <20260519155108.4092518-2-va@nvidia.com>
 <ad327285-aaa9-47b0-9d88-401c2f9509f7@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gs/QETUb1ityE75m"
Content-Disposition: inline
In-Reply-To: <ad327285-aaa9-47b0-9d88-401c2f9509f7@nvidia.com>
X-Cookie: Natural laws have no pity.
X-Spamd-Result: default: False [-3.46 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[debian.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14583-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@debian.org,linux-tegra@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 6715D59188E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--Gs/QETUb1ityE75m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 10:22:53AM +0100, Jon Hunter wrote:
>=20
>=20
> On 19/05/2026 16:51, Vishwaroop A wrote:
> > Threaded IRQ handlers suffer from scheduler latency on heavily loaded
> > systems, causing false transfer timeouts. Convert to hard IRQ handler
> > that schedules work on a high-priority unbound workqueue.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--Gs/QETUb1ityE75m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoN0y4ACgkQJNaLcl1U
h9Dvsgf/TVhRlqJFmkSqyuCrnCpmvVrDozRDPDFXV6rK57pxxz7Ri3lV3j8ec0RF
ovv3mmb5fTf6hJ63BZgRc5qAtHKdDrdnjeXTU1rqtC9ufcIfXTYHyFQHCPBQ0xzk
EADSbbzGnyZJZ/keBUK2mUrD8tJQGsvMf0UX6saiStXX6V5uHEDKq+Yg4GZeXTgS
mKqPa405BqLRA6fev4NuSl4bXPE2OBP8AfeOH9UmncZH5whTrJ+yTt4GzMdeHom7
W0kWHUNbWv1jmLmlRnfYl3R+iDPK5kLjhHHFza5hGq4zCj1QgXDFez8S+y7s6cqT
ZZ11vrVH9tS6ZEI2shKUwyWz46Vzmg==
=A0Pr
-----END PGP SIGNATURE-----

--Gs/QETUb1ityE75m--


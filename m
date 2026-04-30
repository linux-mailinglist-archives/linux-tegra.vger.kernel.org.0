Return-Path: <linux-tegra+bounces-14085-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN8cFsQx82lPyQEAu9opvQ
	(envelope-from <linux-tegra+bounces-14085-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Apr 2026 12:41:08 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A96B84A0ED2
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Apr 2026 12:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6936C3008D1F
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Apr 2026 10:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BEE03AA4F1;
	Thu, 30 Apr 2026 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bldCdZND"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5890639EF30;
	Thu, 30 Apr 2026 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777545664; cv=none; b=Y4eryXn7GUVsBZRD0vn9lK9WbDBJy9QdNXnM8wOQziXf2j6aCtxCRWXqbpnVV3UdHKdWGyTqyEujaYNSWze8KxM5V+euLGkssMOhzoRhXKi2/EPz714HVSxYqZxkQEBdy3cYm90OB2MEhCXQGD2H7sPa2JxjiWjv3uMfG3vskes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777545664; c=relaxed/simple;
	bh=C5pMirUInL0Wgzkxt9sEiCkDGWtvuhIS382p9bXhc74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5XNaHWrG7ro4+h87kHO6bY8g4G9F2cdXHUYXkbPvtMep9Si6bGeSc90SY6cXOmi+1OP2iLifo3khJXYl0sY6F11sRFO35gO6w9AJhLz+WEUNbXlp2ow8+6QGMJKj2ezgrsWvhGoKpFDWuH4A42UiViTBAmWg41gldE+rAHVrl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bldCdZND; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E72DC2BCB3;
	Thu, 30 Apr 2026 10:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777545664;
	bh=C5pMirUInL0Wgzkxt9sEiCkDGWtvuhIS382p9bXhc74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bldCdZNDcGEWWum+cCJWCDoSjztMl1O+Ng21a8bDiYLNzXWOHxviI4GZbF7TsB/pl
	 wSxtgUZ+kj4xTN8kh8NSGzV2zwxUJU4qU2EoKfjGUkeHxqVPrCLoMdHpOnBIZNRfh3
	 7lR6IbeUK9+60qc+2xssOewxjsZxjojO3YQnJBaIqpNaMKxZHfZH9963gHL502l5GP
	 3UYuCKn3X9/lAQD40kQ9qFo3oNX1B0JBBccA5f6ng4pNf8p/ENkdvoYX8eFI5kwvlk
	 eYsC6P26rkDc0n1Yna/qS8Qaxi2lrNs1zQKfCpDgTh5dlM3Z6o2r99gEyG/oC1b2XF
	 8Kp8CGCx4SDqw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E9F181AC585E; Thu, 30 Apr 2026 11:41:01 +0100 (BST)
Date: Thu, 30 Apr 2026 19:41:01 +0900
From: Mark Brown <broonie@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: tegra: Add per-stream Mixer Fade controls
Message-ID: <afMxvRbiMhVF0F7i@sirena.co.uk>
References: <20260429070603.2791011-1-sheetal@nvidia.com>
 <afLv3S6kWnt0D6PW@sirena.co.uk>
 <f6200923-d796-4ac1-85d8-3ed7383b90a0@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FwfmPUddWjxvT/HH"
Content-Disposition: inline
In-Reply-To: <f6200923-d796-4ac1-85d8-3ed7383b90a0@nvidia.com>
X-Cookie: 667:
X-Rspamd-Queue-Id: A96B84A0ED2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14085-lists,linux-tegra=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,kernel.org,nvidia.com,renesas.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.co.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


--FwfmPUddWjxvT/HH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2026 at 03:12:08PM +0530, Sheetal . wrote:
> On 30-04-2026 11:29, Mark Brown wrote:
> > On Wed, Apr 29, 2026 at 07:06:03AM +0000, Sheetal wrote:

> > Also is there any overhead to having the sample counting enabled?  This
> > is the only thing that turns it off AFAICT so if userspace doesn't look
> > at the control we'll just leave it running indefinitely.  Perhaps a
> > timer to disable might be useful?  It's generally a bit odd that we have
> > a write to the hardware in a get().

> Rather than a timer (which would require sample rate tracking to convert the
> sample-based duration to wall-clock time), sample count will be disabled
> before re-enabling it in the put callback, ensuring the counter restarts
> from zero for each new fade. Does that sound reasonable, or would you prefer
> a different approach?

It depends on how important it is to do the disable - if there's no
real need to do it until the next fade that's fine, if there's some cost
to having it run then you might need something more active.

--FwfmPUddWjxvT/HH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnzMb0ACgkQJNaLcl1U
h9A0Swf/QJuyedeQRUYdhl0SAGgcDnnkPtp6p/hlISZIekesuZCIpCT+EnPiheil
Mj5JAdg85fGfGUtTjO4ZGTX3u/DzZcc+dn0GZmop84Qy0N682DslJwGSmjQiRAI9
K7KrE2qx3aKNeatT5qRnN63+PXYeIV1GjYdcqHt49MrL763ZJ1XHY84fW/K+7Al5
KBWhHRoIsHNiTUiblajsxhUm+mU89NkOJxfcqVANkdtI5hmQhktwtfPvQijAgm6G
zfM+HyTaE3upKxJkk/8h2UsZ6Y5YVimVPP9S+uDinn1yRZhVSnOSG/Im3f2nRnJA
PwrDdvlGotNxv3cIPHpfyYvJOaBRDA==
=Gm18
-----END PGP SIGNATURE-----

--FwfmPUddWjxvT/HH--


Return-Path: <linux-tegra+bounces-14829-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LcvLRGUHWqmcQkAu9opvQ
	(envelope-from <linux-tegra+bounces-14829-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 01 Jun 2026 16:15:45 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC72620A26
	for <lists+linux-tegra@lfdr.de>; Mon, 01 Jun 2026 16:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DFE1D307D0FE
	for <lists+linux-tegra@lfdr.de>; Mon,  1 Jun 2026 14:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD01A3A48F6;
	Mon,  1 Jun 2026 13:59:28 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744FC3B635E;
	Mon,  1 Jun 2026 13:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322368; cv=none; b=ZIFOavO9lZivJl9A7XZQBOejEtvxWCE2QatA+SJ1Gxz2JfTRj2x/NuPuUa7OaJplkNCRv4o7N/3woMM6xoGDqTo8w+HL6mi5WaWAXYd1ugyqygjvSV6DDnr7+EAEQwlntT9MzR0BmfZQLbubmM0I+RXRYNJFf5wwIlz1ddlPJoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322368; c=relaxed/simple;
	bh=1xHIWqh7F+h6OYvKF4j9HkQQBvPOuRQJV+piBQzzFKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2SMxYk/K0agqYB6VPO2F+kfs95ApuQ44TcK/dhyuZZ1wR+jdCKO4h2J24W2fjKajmvwPsmIWD5CwNpzRIcBxAx4+4wz6ozjXcvEAeR4iBWe8qXBtvJRpS8OrSS6aVKp+kcUojMYEy3g3ZnGH3GqIQmUSr3rpTC4EXTgmB0bOYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283DF1F00893;
	Mon,  1 Jun 2026 13:59:23 +0000 (UTC)
Date: Mon, 1 Jun 2026 14:59:21 +0100
From: Mark Brown <broonie@debian.org>
To: Vishwaroop A <va@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Breno Leitao <leitao@debian.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Suresh Mangipudi <smangipudi@nvidia.com>,
	Krishna Yarlagadda <kyarlagadda@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] spi: tegra210-quad: Process small PIO transfers
 in hard IRQ context
Message-ID: <3fb380c3-6a49-487a-9793-a1f08d272ac2@sirena.org.uk>
References: <20260520192405.70469-1-va@nvidia.com>
 <20260520192405.70469-4-va@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Kya4tfdkHUux56J+"
Content-Disposition: inline
In-Reply-To: <20260520192405.70469-4-va@nvidia.com>
X-Cookie: Have a nice day!
X-Spamd-Result: default: False [-3.46 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[debian.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14829-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@debian.org,linux-tegra@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BEC72620A26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--Kya4tfdkHUux56J+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2026 at 07:24:05PM +0000, Vishwaroop A wrote:

> The 256-byte threshold (FIFO depth) ensures small transfers for devices
> like TPMs use the fast path, while larger transfers continue using
> workqueue.

> +	/*
> +	 * For small PIO transfers (e.g., TPM), process directly in hard IRQ
> +	 * context unless there was a FIFO error. Error recovery calls
> +	 * device_reset() which can sleep, so must be deferred to workqueue.
> +	 */
> +	if (!tqspi->is_curr_dma_xfer && tqspi->curr_dma_words <= QSPI_FIFO_DEPTH &&
> +	    !tqspi->tx_status && !tqspi->rx_status)
> +		return handle_cpu_based_xfer(tqspi);

Is cur_dma_words always in the same units as QSPI_FIFO_DEPTH - I see
there's packed transfer support in the driver?

--Kya4tfdkHUux56J+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmodkDgACgkQJNaLcl1U
h9C92wf+JbgvZaM0+OCJY29Io4j2DNQhX/7L+iDedPehQGbDnJDPR6RTroPzRzkX
JMs8hDcNQtB9jAdEOz6XCAdKzSnw85PQcgL4NwM9F4t2bmxtfHkkC0e8Ty9fN8Hj
0pP9N9YOT7knGvpvAKC9aIYZtKTRFHcULcBvA9TJidpP9bMGGUQSbNpHzd0dluXi
MLKaYQFxg4XcUiE29MnhlMft5hoUEcbltb0xYtgMOfDz7j1Gs59dtg2wzI53tuHN
4zBL7gv9zDb7mm3UTHjn3kRAYOa9llW6DOjorKRQ8ln5GPVXjzD9kEs6c0xj/nFf
IBpvEjxsPrifyUhM1l05/gjTactelg==
=W+ey
-----END PGP SIGNATURE-----

--Kya4tfdkHUux56J+--


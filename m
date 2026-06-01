Return-Path: <linux-tegra+bounces-14828-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAtDNNKQHWpKcQkAu9opvQ
	(envelope-from <linux-tegra+bounces-14828-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 01 Jun 2026 16:01:54 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B27E620712
	for <lists+linux-tegra@lfdr.de>; Mon, 01 Jun 2026 16:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD9CE3060958
	for <lists+linux-tegra@lfdr.de>; Mon,  1 Jun 2026 13:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B62A3AD520;
	Mon,  1 Jun 2026 13:54:29 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841C2361675;
	Mon,  1 Jun 2026 13:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322069; cv=none; b=Z1K+499GzTsJHcNF8ZJ+tpthzT0jjFl5lJC+1r21nBDMuTtC4618Hxipi1NuPRMHhTpNqFDJZZVsi2tYIYX1TU0S82ShaWwEv3JPlMDRFbxrp+ZFVFFw8OcKkeaxj7OaowIgHy0T4rq/R1B6ctsnAMOXeuSUKHONMThAYff9/QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322069; c=relaxed/simple;
	bh=gwB2SLM8rJ8pdfKWNa7GpQSRIrfwVx5fLRaioIzEosI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOZK8IIYye7j6LQIzzBhlFTsJJyKgeQ8ksIvxqviJHDPWsM/Xl1wSHLVEgxgcO6BLYwolslk/ZioqI0kl7Hr3fMRUN/fmTiBONx062nih3/IboYYrmzxogZlVjhDRGzSwcnZAXybO6KsjA6XALcq/RWzjBNfYDdv+lzum5dsE88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CB91F00893;
	Mon,  1 Jun 2026 13:54:26 +0000 (UTC)
Date: Mon, 1 Jun 2026 14:54:23 +0100
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
Subject: Re: [PATCH v3 1/3] spi: tegra210-quad: Convert to hard IRQ with
 high-priority workqueue
Message-ID: <b4f2951c-8579-456b-8861-85efc21f2807@sirena.org.uk>
References: <20260520192405.70469-1-va@nvidia.com>
 <20260520192405.70469-2-va@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3CsbvVl06yWyy70s"
Content-Disposition: inline
In-Reply-To: <20260520192405.70469-2-va@nvidia.com>
X-Cookie: Have a nice day!
X-Spamd-Result: default: False [-3.46 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[debian.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14828-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@debian.org,linux-tegra@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 4B27E620712
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--3CsbvVl06yWyy70s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2026 at 07:24:03PM +0000, Vishwaroop A wrote:
> Threaded IRQ handlers suffer from scheduler latency on heavily loaded
> systems, causing false transfer timeouts. Convert to hard IRQ handler
> that schedules work on a high-priority unbound workqueue.

> +static void tegra_qspi_work_handler(struct work_struct *work)
>  {
> -	struct tegra_qspi *tqspi = context_data;
> +	struct tegra_qspi *tqspi = container_of(work, struct tegra_qspi, irq_work);
>  	unsigned long flags;
> -	u32 status;

> -	spin_lock_irqsave(&tqspi->lock, flags);
>  	if (!tqspi->curr_xfer) {
>  		spin_unlock_irqrestore(&tqspi->lock, flags);
> -		/* Spurious interrupt - transfer not ready */
> -		if (!(status & QSPI_RDY))
> -			return IRQ_NONE;
> -		/* Real interrupt, already handled by timeout path */
> -		return IRQ_HANDLED;
> +		tegra_qspi_unmask_irq(tqspi);
> +		return;
>  	}

What ensures that we have a runtime PM reference when this work runs?
It's also a bit odd that we unmask after dropping the lock, that feels
like it opens up races.

> +static irqreturn_t tegra_qspi_isr(int irq, void *context_data)
> +{
> +	struct tegra_qspi *tqspi = context_data;
> +	u32 status;
> +
> +	status = tegra_qspi_readl(tqspi, QSPI_TRANS_STATUS);
> +	if (!(status & QSPI_RDY))
> +		return IRQ_NONE;

Since we now have IRQF_SHARED we need to take a runtime PM reference
here, the interrupt handler could be called due to something else
sharing the interrupt lin.e

> +	ret = devm_request_irq(&pdev->dev, tqspi->irq, tegra_qspi_isr,
> +			       IRQF_SHARED, dev_name(&pdev->dev), tqspi);

> -exit_free_irq:
> -	free_irq(qspi_irq, tqspi);
>  exit_pm_disable:
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_force_suspend(&pdev->dev);

The use of devm for the interrupt with non-devm for other things seems
likely to be racy....

>  	spi_unregister_controller(host);
> -	free_irq(tqspi->irq, tqspi);
> +	cancel_work_sync(&tqspi->irq_work);

...especially here.

--3CsbvVl06yWyy70s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmodjw4ACgkQJNaLcl1U
h9BfFgf+P9Sg8OKmc7iKUZOoj6Lt3oAcSp5297yyJixnFCyrg8iBW/iAzRXYDztC
4otnyN3qUoDAGc+0RdXa4oV2XYC96i+yImD0CnzCjCCCnt3c1NaML/mpRhC+ACft
c5eX3/HZu41QseGZ6zxxVp1WWBgb1uOYxwccv0Y3+Wn1MA+cR13ND5bi03Sv69kH
FMX/tC2FHCd71PBHlIKvYDgSdI9XwgdKb4qj8OemEaikDqMic+aG0pmmwi6nnwn0
Gdneoqsts3ANUZYgu+IxDOdU4tTOHZhV/IyJSSVCYX9ccxrTZsYACQ0cbymBnUwE
r+3ho9suuds7detX0WJGNUurNSC0Pw==
=02pU
-----END PGP SIGNATURE-----

--3CsbvVl06yWyy70s--


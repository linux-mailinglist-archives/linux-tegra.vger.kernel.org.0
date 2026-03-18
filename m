Return-Path: <linux-tegra+bounces-12877-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLcEDb2aumnaZQIAu9opvQ
	(envelope-from <linux-tegra+bounces-12877-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Mar 2026 13:29:49 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB38E2BB7BF
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Mar 2026 13:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C16233063A12
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Mar 2026 12:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5263BA25B;
	Wed, 18 Mar 2026 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvnL8ryB"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5703B3D648F;
	Wed, 18 Mar 2026 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773836742; cv=none; b=JyZvQChygNBvQa2TLDIMD0VJOHbbSDPGEq2tmdj7rPR7Q/cyULtc1X40SsNls7jzijYrPOIESWFvTFIAXrbjH1yrm7g80Z9T+GZaCz3cvjZVQ/Z0FaVnw1ve9dfbTpEewovsgrIbHc2oI+Crqqsc3fuT6mEp5wnJ6VJq2pXtWxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773836742; c=relaxed/simple;
	bh=KWlesM47MC5Ft953VQj7csAx3OZjlyVCoImi6UB0NkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkydlnhTQM5e1YVXCBS9lRpzprw7lbjT/eb8oI54oZTD544jRen9gCcm1IUoBFX7du2B/8TpMTDTdETKjiJJWQ53oSwKRXgLa/CyKAxWmfpIDHAsUusOabcwdBDz8RsmEY+LDReRCuk3g9rQSJsnW38cytMRKBF/TZeQLAAlokQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvnL8ryB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D169C19421;
	Wed, 18 Mar 2026 12:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773836741;
	bh=KWlesM47MC5Ft953VQj7csAx3OZjlyVCoImi6UB0NkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hvnL8ryBXIxmDaDwksF1w7inflF2ksLtkn4RwDV6NTqUv/vC0lja1SCXzzCFzynfR
	 eq2GuyLZcPnHFQI21YkeIBjK7uAPbV27sLHaS5+YQ9W3AJ/5sZ2xFsFVR5bVm4wXVP
	 Bs1BjDaT/yaSm1krrMW/vSwN6fLvLelv1pATtPfdnHTUQjdoV34AVWYPRSeHuwUd4m
	 OLCx1e5f+uBBMozMvsGfhCbwLdE5kXtTOGHN21BT63JXcdi7VkePbe1JE5kEIJUDhn
	 oELgUkF17QEOA1bSAqomrWPSMLCryG0L7SPTHgJL/4ORiwE2OUnedXs+muRubCKEtp
	 sDJTSQWkzL0jg==
Date: Wed, 18 Mar 2026 12:25:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Sheetal <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohan Kumar <mkumard@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tegra: Add error logging for probe and callback
 failures
Message-ID: <e42d9bcd-1f7b-410a-907c-89bbdc38bc45@sirena.org.uk>
References: <20260318094631.1769708-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UYYEptKV6HpHqjN5"
Content-Disposition: inline
In-Reply-To: <20260318094631.1769708-1-sheetal@nvidia.com>
X-Cookie: All celebrity voices impersonated.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12877-lists,linux-tegra=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,nvidia.com,perex.cz,suse.com,renesas.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: AB38E2BB7BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--UYYEptKV6HpHqjN5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 18, 2026 at 09:46:31AM +0000, Sheetal wrote:
> Add dev_err_probe() and dev_err() logging across probe and runtime
> error paths in Tegra audio drivers to improve debuggability.
> Use dev_err_probe() only where -EPROBE_DEFER can be returned.

It's probably better to just use it as a defensive measure in case the
APIs change for the ones that are in the probe path.  It's easier than
figuring out if the API that's being called could defer.

>  	regs = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(regs))
> +	if (IS_ERR(regs)) {
> +		dev_err(dev, "failed to map registers\n");
>  		return PTR_ERR(regs);
> +	}

If you're going to log the error message it's helpful to include the
error code, though IIRC in this case errors are already logged by the
API so there's no need to log anything at all.

--UYYEptKV6HpHqjN5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm6mcAACgkQJNaLcl1U
h9Dv0AgAhJVFaPFxPxdYh23aYsWHGjnjDU7XFAWu6AHAJhl5rk8NYJsa4jIawClz
QdCtH1MBcGYLwa6O1awx3NUP50JR37okU+MeQ7w5JcLcg8LRg+Y6V1EjJ9ly7rer
hDPLW4/up5SfHVFwUFsX8OIF5/VeAaKkPN6bg/K1UixCXmFS8+3kq00Z9m0VOv8E
/63bbQ0J14sz3BH+d8pWyP4ZIDKAvqpGT1yZyhEbLae02TGSmIutY9pgTwF/X8b8
WVAe+hVYLdn7NmNyi2wq8XBEQM5CYpeUhf9tr5Qk+vwMgEaBjYGb5vCiyu8enQS7
wJMWd9zTRyZaNYLxo+I2tw0cJKnuvA==
=fFP1
-----END PGP SIGNATURE-----

--UYYEptKV6HpHqjN5--


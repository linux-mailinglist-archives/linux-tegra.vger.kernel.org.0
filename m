Return-Path: <linux-tegra+bounces-13222-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKGGGzbkw2lvugQAu9opvQ
	(envelope-from <linux-tegra+bounces-13222-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2026 14:33:42 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A55325D95
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2026 14:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1DF23005171
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2026 13:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FB63D47DC;
	Wed, 25 Mar 2026 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BO63G6ox"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2245309DDF;
	Wed, 25 Mar 2026 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443960; cv=none; b=cT4QcwLiZvnvnt94S96gL8Ucqlr5iVoqnjPF6NlUclHLtMQozmoEIk3GUKVK7YElWixOsDS7FLRZOhnm+PK+KBFE4gyJ19iErQpJW7r65dAPPjeEUembjEeMzw2k6oHlhRUBOg8Qdi633jLBdkQ4ibDtJ5DLh/dmEzJ20nAGbm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443960; c=relaxed/simple;
	bh=rzV9KEWajsJ8B7/mrSMUykQ+PshUl0DaCZOiK0wU4K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5wi6fnOMzcd+h/o62xWl6whfnFNzl6FeroOcnG9FVHkdPh+8nrsYCMBYCX7kBeZ+9J5sLcf9XdtVek4BaU2zb6eg18uJVajCRvE6wpskcr7n9QiTuRbsxAwPiORRtQYVxyi7fG1qeVjDzGH3EIbarX6HCnKwy+I5k/pYbDDs8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BO63G6ox; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E818FC4CEF7;
	Wed, 25 Mar 2026 13:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774443960;
	bh=rzV9KEWajsJ8B7/mrSMUykQ+PshUl0DaCZOiK0wU4K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BO63G6oxa07lS0t1c1T081SSWJuyslzBluzpbDYnR47f2TygxiAvm8Z72IBgnZS4H
	 /aIFvi2DgMpVPHGkZXPH09X+w6wU/CY3jZL5q8jfwJzaIzat1Oqumvhnakp0evsxCI
	 no5P4mpmQjY78OFjnqJV+GDpi9Ezf5fVECsYl8SinoFCaNyCxfrTodb7DhGCQMCb5h
	 NTO60xNZpR/ja1g6LfhsJKGyLtXm4AHqPDa/LgeGntpzycapgO97gtKfgMEbLAG+uA
	 fqzUumjwan4EzloD1MOapENaYLDmCWwHcnIQLiUrw1MEux6L621cKASzZvRYujUJM0
	 M7teEAu3sTZnA==
Date: Wed, 25 Mar 2026 13:05:55 +0000
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
Subject: Re: [PATCH v3 03/14] ASoC: tegra: Add error logging in
 tegra210_admaif driver
Message-ID: <6fd4ecb9-73e8-4555-855b-28350aaae44f@sirena.org.uk>
References: <20260325101437.3059693-1-sheetal@nvidia.com>
 <20260325101437.3059693-4-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OnDLxHD9zFb8vgxW"
Content-Disposition: inline
In-Reply-To: <20260325101437.3059693-4-sheetal@nvidia.com>
X-Cookie: Those who can't write, write manuals.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13222-lists,linux-tegra=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,nvidia.com,perex.cz,suse.com,renesas.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 88A55325D95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--OnDLxHD9zFb8vgxW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 10:14:26AM +0000, Sheetal wrote:

> Log errors in the Tegra210 ADMAIF probe and runtime callback paths.

> @@ -966,10 +969,9 @@ static int tegra_admaif_probe(struct platform_device=
 *pdev)
>  	regcache_cache_only(admaif->regmap, true);
> =20
>  	err =3D tegra_isomgr_adma_register(&pdev->dev);
> -	if (err) {
> -		dev_err(&pdev->dev, "Failed to add interconnect path\n");
> -		return err;
> -	}
> +	if (err)
> +		return dev_err_probe(&pdev->dev, err,
> +				     "failed to add interconnect path\n");

tegra_isomgr_adma_register() already logs failures.

--OnDLxHD9zFb8vgxW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnD3bIACgkQJNaLcl1U
h9APrgf/cOOfXP2mYN7BJkyLLf8ai/LfkO2ETIXGmjRFH6nXunkGkWhguCyQTFYk
xmendkIzqJJib49j/Llu60ClScLk76K2xYx0sI58oWzRcrAJ9Ad1Ee+hZ3Iohy8n
EYhdZMg0RgqyU2KJcu4dfUB4v3Fp6at4HZ57iR2L6DaAThr/BVtkOemB99XWjk0e
bDusZhk1RpO3cM1mi2CBbxRAzf+Vu//iDG2zvSD1ONqz5dXAagDsR9zj8zRnzbI4
3yo2tfDy3ZPCtG+0m/LF08xhS5CmBpauIzpovC5sKR0Uojd/SdK+FzyU9aLAjHGV
Y5ImjA55BUJtOOHDqXhocOUhrjXtSQ==
=Obhc
-----END PGP SIGNATURE-----

--OnDLxHD9zFb8vgxW--


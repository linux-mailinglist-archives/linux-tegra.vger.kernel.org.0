Return-Path: <linux-tegra+bounces-13053-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Jk2A9azwWnlUgQAu9opvQ
	(envelope-from <linux-tegra+bounces-13053-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Mar 2026 22:42:46 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8079C2FDE3A
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Mar 2026 22:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B52D301A727
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Mar 2026 21:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D7E37FF5D;
	Mon, 23 Mar 2026 21:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCOOf6tA"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E4637268A;
	Mon, 23 Mar 2026 21:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302124; cv=none; b=OjB+YggyM07ZTa2OY1/+u9vFV4L1ImNiTti0wueij+CPmdwDv1mDU2Hw/6bTBYmbDz4igJae+A3fVc7ETbNQW9PdmHD1x9dw1X9t3Q+ckmD9g/A98FsSziMKXQkUhzq2aqidRWfP/cRSxKaUq0HopV/EHnF8XTBqtItnjQiXypg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302124; c=relaxed/simple;
	bh=YIBsT/bVneMumz6Y32rAuLr+BaONiGwhQ8C/4kF1LNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0tj1i9KhqocPBm3BFkqBKgoxl4Ck1ThlPMowd30XMHcLCKTxBkwQRPqCvhuzU0Eef1vP7zmEn9N/hCZQW9h7CJlJvESXw+0kzW7cLgUtY+lI7HeSD4GF4nDTLqKdplliabeDF+wWH7X6EWtk6w3rIZb9UvKA/5KpClEoo6U7Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCOOf6tA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA31AC4CEF7;
	Mon, 23 Mar 2026 21:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774302123;
	bh=YIBsT/bVneMumz6Y32rAuLr+BaONiGwhQ8C/4kF1LNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eCOOf6tAO5i6zaGqYWwJPGGgIhfB96k2qfwO8e6v5iR/LuISkJCIFvYjy0WgQtavY
	 Qdh5NwA8pWIioete1bglbtnQZAkGQ2pn8BBIYu9Pd8DrVaXtiOmXqkYwaYKo7WYhml
	 O3FjDxKmNjc1a8V7obJBKgev0s/fur6NNuYhcSDJNmvDqieErxC4vy2lqHvy/rJ2de
	 lEEQr/Zc3qZKTG6qR6nlKsblcUpH6aG33Q9KNCr4YY60mut51FQRBrBuuVNeWwZYHI
	 vnLRaoRnoPhTSakoVsMinkBqG/8taCJ3tMMm3KdMfU7booWBjMyz1789g72gxtocFD
	 z8lPNA2vanhtQ==
Date: Mon, 23 Mar 2026 21:41:59 +0000
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
Subject: Re: [PATCH v2] ASoC: tegra: Add error logging for probe and callback
 failures
Message-ID: <9682102b-f437-4d27-9ad2-5f5aa3df2961@sirena.org.uk>
References: <20260323101242.3100108-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UR1BIgkbZSvCTTgQ"
Content-Disposition: inline
In-Reply-To: <20260323101242.3100108-1-sheetal@nvidia.com>
X-Cookie: This is a good time to punt work.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13053-lists,linux-tegra=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,nvidia.com,perex.cz,suse.com,renesas.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 8079C2FDE3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--UR1BIgkbZSvCTTgQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 10:12:42AM +0000, Sheetal wrote:
> Add error logging across probe and runtime error paths in Tegra audio
> drivers to improve debuggability. Use dev_err_probe() in all probe
> error paths as a defensive measure against future API changes that
> may return -EPROBE_DEFER. Use dev_err() for runtime callback paths.
> Skip redundant logging where the underlying API already reports errors.

> diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_a=
hub.c
> index 43a45f785d5b..4626dd0a4d55 100644
> --- a/sound/soc/tegra/tegra210_ahub.c
> +++ b/sound/soc/tegra/tegra210_ahub.c
> @@ -64,8 +64,11 @@ static int tegra_ahub_put_value_enum(struct snd_kcontr=
ol *kctl,
>  	unsigned int i, bit_pos, reg_idx =3D 0, reg_val =3D 0;
>  	int change =3D 0;
> =20
> -	if (item[0] >=3D e->items)
> +	if (item[0] >=3D e->items) {
> +		dev_err(cmpnt->dev, "invalid MUX item: %u >=3D %u\n",
> +			item[0], e->items);
>  		return -EINVAL;
> +	}
> =20

This one can be triggered directly from userspace so it's better to be
slient, otherwise people can spam the logs.

> index 6d3a2b76fd61..d9318aaaf32e 100644
> --- a/sound/soc/tegra/tegra210_mixer.c
> +++ b/sound/soc/tegra/tegra210_mixer.c
> @@ -253,6 +253,9 @@ static int tegra210_mixer_set_audio_cif(struct tegra2=
10_mixer *mixer,
>  		audio_bits =3D TEGRA_ACIF_BITS_32;
>  		break;
>  	default:
> +		dev_err(regmap_get_device(mixer->regmap),
> +			"unsupported format for MIXER CIF: %d\n",
> +			params_format(params));
>  		return -EINVAL;
>  	}

Not your bug but the driver claims to support _S8 format and this
function doesn't actually implement it so we end up with another path
where userspace can spam dev_err() as a result of this.

--UR1BIgkbZSvCTTgQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBs6YACgkQJNaLcl1U
h9CH5Qf7BF9lXJ4ju9quZAGFpucnkA2UvALgsnejrRhb3DGiYaYcJOYGVFUe28az
NDtzGEAkVZT0CR3/Rnk+R2cvm9PK5l7MhGTGOp0zn4tGXNl4isXjV5b1bHGTfw0l
aUCWN7dcFYzpVtZRqxSCzXby4yACPfvFWRPdMn1aOGVQt3UtfLq6cyS92DSPpV6C
bGKroDwTNVGbSgEdr3fwa+oZcP6/8iimKOetYwGAgwwtjwTIDNUur8La2yi67tso
HY17nTqm2iCMnZpGsg075Acav/f+KrJoF3fDTaPKfa7LqBvzchRCT87KndJivXw4
G90EQDpClE9fXRwkhLWnxJuadkuSnA==
=OFxY
-----END PGP SIGNATURE-----

--UR1BIgkbZSvCTTgQ--


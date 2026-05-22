Return-Path: <linux-tegra+bounces-14627-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILfqHxotEGqSUgYAu9opvQ
	(envelope-from <linux-tegra+bounces-14627-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 22 May 2026 12:16:58 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D925B1DCB
	for <lists+linux-tegra@lfdr.de>; Fri, 22 May 2026 12:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E6A9302410D
	for <lists+linux-tegra@lfdr.de>; Fri, 22 May 2026 10:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835C33C8C74;
	Fri, 22 May 2026 10:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8TpQ1W2"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97ED3C76A1
	for <linux-tegra@vger.kernel.org>; Fri, 22 May 2026 10:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444698; cv=none; b=YHy9wxvwlDmYg96+GhVgLgJEyhpDCINU0K359qSi74gsxUm/5t781l08JGIuVmfwDQmNFKOIMm2mWu9dd2V6SBIhIaFzMHmW+rrx9O87zuiZuOATQVzcGeIFg9U70Ke1gU3BWBE+dbxgTTGyiWvhkVK4mAWVPOve/FidyCVt3JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444698; c=relaxed/simple;
	bh=1PEqBL2N/tP9c98YsA95gPInc3U0Rsi9oDwoPYi84jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EztFmQg3vmij2qPbUSQpPOAUnF9KcAfXKVoZJ5Nbex/hhN6Bt8bC/bwaB4cLFkTTRYxHZc+WqQ+0du5PvUiNqk9AgHbdfNrd82p95dbQ0Fe6hiiwM4gsQlfCsHr0V7TYFluJR8SYUvZiyCc8O5gWhu+xce+CYBj9I1CEFhNXRWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8TpQ1W2; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-453903ee4adso3706436f8f.3
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2026 03:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444695; x=1780049495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VERC87ErTg1j6vxwxEYthaPZVN4kWyhvQyh1LqaXbdA=;
        b=G8TpQ1W2Qzm/qd3IXfB+tdbZj4KegJGVty0YHvYmtgqDj6u73B7QfRuvjdsPXQevE9
         coXUT6QPHnrAohAlom6giTbZFoiHAkI0nSpPcywCh01BTj52jcsEpaDE7HUl5H4xKHwb
         Z4zqM8K5nCxDYAkqisv+FYe2C3CvNKVG5/6ppHmlw7eUp1JmetQnIBiPr4GfT/UIlAD9
         YcCJN9ycd+1zCjswCLlv5T33MzMcH7bU/+OARWXIyo3Iy5W2H3GFC/YAPWqiaUB1I12Y
         yxrUNyFVi19RTifHhXzBOBEfiH5HfCfp4cTbEioBbOszXt9CI5nKZQ1NP9tnrbkYtizC
         be+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444695; x=1780049495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VERC87ErTg1j6vxwxEYthaPZVN4kWyhvQyh1LqaXbdA=;
        b=OPTFZ49ep/2+qRBPdnDorMm6n7/An+bYGxW+sIW76h7TDHQimMhdJjRgJ7IawzMT37
         gJHz14luMLAMVA8HkRYPkRkup0a/Dv7JObb+qG9kdlQPgkvUv4sCFiNvBmyKO+4wro7X
         hCzfBus2lZQj/5UEK3OoSIB63M1t0AIx0z1390/nDMY0uFyUunqu0oxTphfOJazDduQH
         bXbgbAmimrENrIBs5xzcZ8vtoVxbrGBGc4xvucbaObEAsDbMPQYflYCzNPAPBlRlRTqO
         WKYT/5XUwMzY8nXhNwdojm9AZVX26SKXP5nnK/p0WwkCUgsrfPKKGl97WKvCRLwODUsu
         RL2w==
X-Forwarded-Encrypted: i=1; AFNElJ9OFTqAIsnWs9HKUg4QNpGAxmZsGiilNjv36/7NA5k3W9FdiqVrkSKWHqmQTsFVsl9G+3yB/qTiPlW7vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFZrFXn6pu1oCfr9TMLKGC2pk2WTPe7TILoK7cgyzkUMPIyO0U
	qRsAIRbKV/MYA+YxT4ll1DNmQWtkdk+ZZVBGzQDfBdfLpecbVjckWq2q
X-Gm-Gg: Acq92OHn5nfcoWwLnGLphlMTe/lIv9V8RGBf6139sNafWD+nyyEMUYj3gTLVuVphzrW
	btyGErlNZjU7dS6eQAE8bnpMoK89F95cCXpat17Nhi2viE1Bp6Dkaz0jnPxmPJ/9RySnbjZG9ry
	pLykjsQQIPNMJ0AJOCUZcheuY+51Gjl+0MrpsNkHhn+oDqDMDx9fZl7c6iJipTkh35y+V0ljRH6
	U3KO8xGB55t9GHHItl/phdbvGB+5/M8QQIMfH/hXK2cpAsnonPw8nRWAccOUbvDW1ttiVfs2kkt
	HiFLBcnWYQC2GrNleelpfaFxWEpvHsO0btzv1bxdub/BWsxyP+QdJbK4pGc2j0ZDooGn5YE9d0W
	woJDKqGHgcb+UVbQ8YM0LU/Jzw3pCSLAE+2XOrjQr69ku9zF/ZP0J8wkMIBaK/aJ60WSYRKIhq4
	r+p9C9nNTQzINKileI4nOEPic0ltGt+pu47+AGv/JXYBbEb4jC3CCJph7fIhBBHhHAjgOdMOi5O
	k0v+nzBJN5scA==
X-Received: by 2002:a5d:64e4:0:b0:45e:a0ab:8bc9 with SMTP id ffacd0b85a97d-45eb38c3793mr4093659f8f.41.1779444695040;
        Fri, 22 May 2026 03:11:35 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb9asm3419737f8f.27.2026.05.22.03.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:11:33 -0700 (PDT)
Date: Fri, 22 May 2026 12:11:31 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 04/10] dmaengine: tegra: Make reset control optional
Message-ID: <ahArpX_3Og7d8wA8@orome>
References: <20260331102303.33181-1-akhilrajeev@nvidia.com>
 <20260331102303.33181-5-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7q66bzfjf74euvvi"
Content-Disposition: inline
In-Reply-To: <20260331102303.33181-5-akhilrajeev@nvidia.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14627-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierryreding@gmail.com,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Queue-Id: 85D925B1DCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--7q66bzfjf74euvvi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 04/10] dmaengine: tegra: Make reset control optional
MIME-Version: 1.0

On Tue, Mar 31, 2026 at 03:52:57PM +0530, Akhil R wrote:
> On Tegra264, reset is not available for the driver to control as
> this is handled by the boot firmware. Hence make the reset control
> optional and update the error message to reflect the correct error.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/dma/tegra186-gpc-dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dm=
a.c
> index 5948fbf32c21..a0522a992ebc 100644
> --- a/drivers/dma/tegra186-gpc-dma.c
> +++ b/drivers/dma/tegra186-gpc-dma.c
> @@ -1381,10 +1381,10 @@ static int tegra_dma_probe(struct platform_device=
 *pdev)
>  	if (IS_ERR(tdma->base_addr))
>  		return PTR_ERR(tdma->base_addr);
> =20
> -	tdma->rst =3D devm_reset_control_get_exclusive(&pdev->dev, "gpcdma");
> +	tdma->rst =3D devm_reset_control_get_optional_exclusive(&pdev->dev, "gp=
cdma");
>  	if (IS_ERR(tdma->rst)) {
>  		return dev_err_probe(&pdev->dev, PTR_ERR(tdma->rst),
> -			      "Missing controller reset\n");
> +			      "Failed to get controller reset\n");

This change is a bit pointless, but I suppose it's a little more
accurate this way, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--7q66bzfjf74euvvi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoQK9MACgkQ3SOs138+
s6FHnA//XF4yJADgbsPfLGq/nIoR6D15Rkyz2/y+WoltFZ/NE79EUP9PKuTKyaZB
Zg768U33kvdc5mhOKspm7OXUCUkw+dyFGHW0Ud8sXdLZUnJdagT5LwUCgxZh/7fv
Y9LF9Ol+dQl+aKNFH2gZJUDLGlYsdcnqNADudoqVh7Jh/Javn9PPvx/oa2I2J8QP
B0ybLk6adFzB/jm6hG8K48cHojhlZ5ea0Ri0+WFpjbBbhTzdHUal7pzdpjPoXwGT
5QuHid/lj82oWJQO34iuYCYPY6fy/FUO4esr35elwttdxaNBL689MOmF6NeAwIKS
cm4rk9Eme54ukkQ5lULHMDz4U5D0Py4/G7XH8XHzwhTbe8t42Gqu9mLK8pv4BAM4
mXMIA8j2MuDb5QjZmCcpJOHiBkXpvVReKem4mYZ3GO+QP0XZe2dUOx6NqKy76u1G
0J69wsztZW9VP4MY8ImIx8+pqWAsysnp4WvC9I10MSmV5dzBN4Oq2EBDMgwouZl5
efk549EwfnEdQI1HkRbMumKZYdtyRsJ7S1CQ/h8LGcy2kiRIWz+Bh1T27KXpTr0K
nkc2zuW5+eAtNfcLK+r2rLDqscBWX7fq/+YS72+b+zYdUoGgL+FwcZVZ561OVrwD
8KLN1/XUDCWZP+A+j8FwM6O4cDTuVPHTC3Q/64jPCC8Eu1Di1qk=
=uscJ
-----END PGP SIGNATURE-----

--7q66bzfjf74euvvi--


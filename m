Return-Path: <linux-tegra+bounces-13328-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOhMCL2SxmkyMAUAu9opvQ
	(envelope-from <linux-tegra+bounces-13328-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 27 Mar 2026 15:22:53 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A523C345FD7
	for <lists+linux-tegra@lfdr.de>; Fri, 27 Mar 2026 15:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A3A37306243E
	for <lists+linux-tegra@lfdr.de>; Fri, 27 Mar 2026 14:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBC13F2112;
	Fri, 27 Mar 2026 14:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p8fZVgPE"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEC23F23AA
	for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2026 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774620952; cv=none; b=vF2CRqutwkA1HovviRWN7F0UCxrwQNoo+d2RD5YOYhjGFJsl73T9uisYJHiHgkcAKg/XnDYbD7/1PYoKsUrrwMgdckllEL1+Wjze5C427R6pWiA+E7Y97SKitdvqE4zEisx5QsbxXjTrxFbLktr+bEcBiwyd0aYA0ULPwywL+lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774620952; c=relaxed/simple;
	bh=CMCodREyX8+SopcJOJgbtv3/VIX8gK3dnN/CbucnNlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/nOOXqrPMHiGIX5u1ta1J+Yq4mqAOcQJvEMK8pPd7OHH34oymmI+Xh+Nfxigb2AD8eIiTOGgTxx9YnIzdHVSBH6RkGDF6cvhHtdOmbAUIhwRbH+l9072Qe7v1Xd91RiaCgbzq1S3+/is1y/uWGNo1/gRDPHVtvBpmDyjjBZ1CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p8fZVgPE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so16115055e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2026 07:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774620947; x=1775225747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ENWfid/HKNpDLLdwdQudk9l0qrO8hsNfLIypj1TrVms=;
        b=p8fZVgPEHNnTksMSBOMX4LnmoO24radOGWSVp/pc1EG1g59Vp3ogz7/Qf9NJsFdJKF
         PXK0/fBZPbpKNfuKSBzwDvPJs9JdBPzHcCDZksq4yN735f8ZI6+VbSQPR5gpoGqrkqFE
         YwV6AyCIsYTmNJYJkvqZdtfavh3TdZH6+K55jowJzUAO1ujnTLei3EVXSu49UBnM2Bi7
         oL/nB/ysRnUpk3mZ8quV9TNZYb/n2GSQbsda8I0zRSrzcwyXmFNVTcJ8kezfIqvYnPx0
         rpfWqDgaj3yNINw8cKuXVoLWQFxyqFDSSHAvkVyjjMmI9+mbukDgjhmCexTO6a5mYdci
         2vnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774620947; x=1775225747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENWfid/HKNpDLLdwdQudk9l0qrO8hsNfLIypj1TrVms=;
        b=mkllOUXu/jVf6WanGGkxjpl+ZgEYHZ6bZZD0xWyI0BN/ImheXmJSZxjqwIzQmQp+JR
         qlKp/OD4TPTvfz2fmV7Djym1jbryM1B1U6bp3mXZVafWWYNihcQElfIr4nqikD+4yQQb
         3+OWvozBpLKQSHoCBAhGITrMjWBNMaDRIxBLBuYhFj+vt5poRv3qxRNbjE4TMzcQ+Boj
         o/eourAAD48cu80orO1n0MUle3CFqU/9hQS+G5Hxi98TU2pD0btcRLNw+NJ02TP1Mzkr
         HlpphUQsMOSKZH8jIT6I+V7ThIAjxEgyztELJCJQ0N3M2OGUkieIjtv7+qtQ7KCwHCRY
         Bvfg==
X-Forwarded-Encrypted: i=1; AJvYcCUicF8r0+sTbJB0g8+LhtjmmJxEqIth9U4JPh4BuakEoMdgFLEAsYLgiwyk2nSpNv6QzO4wV0lDI8wiuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvbCXtqFFmeultozi5JmgGyOxa6rP3luZM5Zy0kQOHa9lY5gcv
	C4mfDr1vgF1mwQs5coKPgWXpQwf3oNrcGF9AuPyz6iZGJnNV7PWFuXyz
X-Gm-Gg: ATEYQzzGlPers/uB1Gs0bZwHof83YrvJpNb8onkQnwu9H4DAtcBDe7QlvTUpjr0NqGT
	sg7FiNuILBJeAcFfbxGEFHx+2sPpGQiVloALOo7S9YxZfyn6Wp0OfRdg66bB+PrAi2I9GknEjHV
	p7rxqKfcnM+zavWgSNCDjk5GOsug6aPdVP3gUy1svLWwCiX/VK+Wsf/2+pqLy13gT4Cp9puqHn3
	6exFZ/RtWedYHM/aVr5KIomd0yT0QG9j7F2unXUHzb1Xec0vUP6RN8zW0gWwHKP7P6YqGGZZZWq
	p3J2tCb3Xx1UHTx6rTQkUgpLhUPMqBTGutv677AYhod1J/Z3l6i41GRVyT61cBtso+rfkAkUxZS
	NhZQJpjMgIUJnPb8BYWWxyK/kyAY1a+/tCpPKU6MBRzO6me6z/0u+xa3wu8lIj4CImEM/3fcl+w
	R2aELoYYHTIEJV0kKQ/9dZhx4pjuVe9xdl9DV5AQ7z/BxdpCS5PfJZQG2tt/3UaN6ITa9r2L+FT
	Px7DSUMskjtRw==
X-Received: by 2002:a05:600c:4f44:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-48727ec7819mr47471835e9.20.1774620946562;
        Fri, 27 Mar 2026 07:15:46 -0700 (PDT)
Received: from orome (p200300e41f249a00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f24:9a00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c9134fsm169393935e9.9.2026.03.27.07.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:15:45 -0700 (PDT)
Date: Fri, 27 Mar 2026 15:15:43 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: ldewangan@nvidia.com, digetx@gmail.com, andi.shyti@kernel.org, 
	jonathanh@nvidia.com, akhilrajeev@nvidia.com, smangipudi@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 RESEND 1/3] i2c: tegra: Introduce tegra_i2c_variant
 to identify DVC and VI
Message-ID: <acaRB5dt4EtM5-3j@orome>
References: <20260324055843.549808-1-kkartik@nvidia.com>
 <20260324055843.549808-2-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jfnd3kil7qhew4ug"
Content-Disposition: inline
In-Reply-To: <20260324055843.549808-2-kkartik@nvidia.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13328-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierryreding@gmail.com,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-tegra];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A523C345FD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--jfnd3kil7qhew4ug
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 RESEND 1/3] i2c: tegra: Introduce tegra_i2c_variant
 to identify DVC and VI
MIME-Version: 1.0

On Tue, Mar 24, 2026 at 11:28:41AM +0530, Kartik Rajput wrote:
> Replace the per-instance DVC/VI boolean flags with a tegra_i2c_variant
> enum and move the variant field into tegra_i2c_hw_feature so it is
> populated via SoC match data.
>=20
> Add dedicated SoC data entries for the "nvidia,tegra20-i2c-dvc" and
> "nvidia,tegra210-i2c-vi" compatibles and drop compatible-string checks
> from tegra_i2c_parse_dt.
>=20
> Suggested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> Changes in v10:
> 	* Suqashed "i2c: tegra: Move variant to tegra_i2c_hw_feature"
> 	  with this patch.
> ---
>  drivers/i2c/busses/i2c-tegra.c | 112 ++++++++++++++++++++++++++++-----
>  1 file changed, 95 insertions(+), 17 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--jfnd3kil7qhew4ug
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnGkQ4ACgkQ3SOs138+
s6EeTRAApxEOk4jnbGUYNrBgi7YuAjHtOZZB7FrDo3dqbeVfm0/psgQ8VYyFSJ2o
d3jTB0eAUw7BDoqzOMNqAzqMf35zysGF/E0/vvFy/zsdbjCS8RvKzcgLCzwMb5LU
v87B3bFu7FMdiyC0rGDixzbNa0fmNHVNp+9DcDFxj82HeklGPhp960UDchudoHSq
ncvCO6HSB5ahqJNLqtRreSKSYDShgOA3BvNYhsjkdR3ZYCnl1HiedFmfkP+Z2UY0
oV7id1b/R1ZaO4Kc+fNu6iYM0yBjS9FL2JNZwUYL0kCf9xWJRvXe5+3nHIKLTCye
ILEcM6cjkgsBzmjIR5sgOGbIGu2El1C5OVarVQE71rl7mcMicS6OP1uEFL62glmj
yQffc7p4NMNor3WB6bzWwa+4576wT7942Pb6ajUIm9DfBZ4zvlrTTJERTtXVpjBK
tviH5nCYvl5/2bCQ1ZBvEXDcmOOh1ALstlsMbpXCfBobK84CaTp4dPfIPaNjyoq+
nT5qVQo4HqYAPKeL++wrWZyCCmmp4z7JA4sEPRR0Al/Repnao67x3aimFBLePJvl
9GN8FF4z++foxG0/Mf5jIWQ8uQEghG1WUWgOIs3LQReYxJo6P1JMqSwXyH5vnFdV
SXmpZX3rb3DL6YlXSENaAG7b/uj0IBtyUsyH8RerSIyRg3YLJdg=
=+qhH
-----END PGP SIGNATURE-----

--jfnd3kil7qhew4ug--


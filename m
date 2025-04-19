Return-Path: <linux-tegra+bounces-5997-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F257A942AB
	for <lists+linux-tegra@lfdr.de>; Sat, 19 Apr 2025 11:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B8747A8D32
	for <lists+linux-tegra@lfdr.de>; Sat, 19 Apr 2025 09:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC721C3BF1;
	Sat, 19 Apr 2025 09:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="XKnDJwgw"
X-Original-To: linux-tegra@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C5B1B6CE3
	for <linux-tegra@vger.kernel.org>; Sat, 19 Apr 2025 09:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745056153; cv=none; b=HVfdCV+UyidaEFhbHqU83HHd/f/G+jAIzmIRsD5kdyB2n4qUNQ2Ekktk/SYyv3JSI66Q7YM6mmpCWZspX6J6KQSOa8fr0kDIASOqOIGAIyakUtvyhRYR+HS1fuT1JUw+45XVx4cg6e6mVDiZqfpZzE60JH1NqdN9fqBMvSjr29U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745056153; c=relaxed/simple;
	bh=zklzViCR78rtGWWpSQ+SH1wiYY08pHKOOyED16FNUtY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=VDI4yzfc1cahGQB0BUm2/3+WPDNMOvA2YEDzlOgO1zItToG52JMrragSAjpBUkV7Q8WDFcOpUAScTD8+aNATMkp6HLlaUNOS1i3CLAd5SZ1WNt6Q1FCCggTaCdkqpMbczAEqSEA0rGY2eobntUkG4fVWjUEpZmoL/lHCg4sFRB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=XKnDJwgw; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1745056135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WYcIiX7im0SwEgUBjW9RpMKMf9b+aamLPfpMOC5NliI=;
	b=XKnDJwgwVh+2AJkayQ0NeH2Kvg8qAbd1tnYvcMl+DKXHqiczpSpLHXSIzPBsxU/16t7iF4
	hlYG9UTJWjXQNnUnkl64Qgc/oFfw/T8qtw6j0f9K6IvZmc7UEmQIKrmtpBHirzgLvOQPh0
	J3ZWdIczd+6ufV4zdSA/E+qA1OtlNVgCdyNgn29IB8XuTI5EEc9vqkSezr7poIUqsoBwmV
	MxMirsfelUlnq6h9recCZVOrPLxjseiwhEtSocWqQ96RR6A5TKgXHBsJoiTs3TwP6IiEf0
	CejUseD8cefGgezfsiE2cTsZxrvlhitP1egzdsgPVf3AdOdTHVAn/I5JnviHXA==
Content-Type: multipart/signed;
 boundary=787e13d5ada3b08197d931c1726e36235e1092534fb802965a37df9b17c0;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 19 Apr 2025 11:48:46 +0200
Message-Id: <D9AIRPBIHXAO.3SDHEJW99DP4X@cknow.org>
Subject: Re: [PATCH v3 00/10] Tegra Security Engine driver improvements
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Herbert Xu" <herbert@gondor.apana.org.au>
Cc: "Akhil R" <akhilrajeev@nvidia.com>, <davem@davemloft.net>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <linux-crypto@vger.kernel.org>, <linux-tegra@vger.kernel.org>, "Dragan
 Simic" <dsimic@manjaro.org>, "Corentin Labbe" <clabbe@baylibre.com>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250224091610.49683-1-akhilrajeev@nvidia.com>
 <D99QMGBHHYJO.1D7D0ZXJLBG9Y@cknow.org>
 <aAMhYaq0Ze-z6E8q@gondor.apana.org.au>
In-Reply-To: <aAMhYaq0Ze-z6E8q@gondor.apana.org.au>
X-Migadu-Flow: FLOW_OUT

--787e13d5ada3b08197d931c1726e36235e1092534fb802965a37df9b17c0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Apr 19, 2025 at 6:06 AM CEST, Herbert Xu wrote:
> On Fri, Apr 18, 2025 at 01:45:23PM +0200, Diederik de Haas wrote:
>>=20
>> Earlier today I tried to boot my 6.15-rc1 kernel on my RockPro64
>> (rk3399) and that didn't go too well:
>
> This should be fixed in the latest mainline kernel where hash
> request chaining has been disabled.

Excellent, thanks for letting me know.
b2e689baf220 ("crypto: ahash - Disable request chaining")

Cheers,
  Diederik

--787e13d5ada3b08197d931c1726e36235e1092534fb802965a37df9b17c0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaANxgAAKCRDXblvOeH7b
blJ4AP4v0v8uHn92ZBD/ipPt+rGobZitRKp0xpoUesLYwz/VOQD+ObBSY+Fau99D
uvbyarhPlqm3RUyDXRzJnNuy1XXOEwY=
=82VX
-----END PGP SIGNATURE-----

--787e13d5ada3b08197d931c1726e36235e1092534fb802965a37df9b17c0--


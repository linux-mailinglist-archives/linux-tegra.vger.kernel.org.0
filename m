Return-Path: <linux-tegra+bounces-4046-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AE59B159A
	for <lists+linux-tegra@lfdr.de>; Sat, 26 Oct 2024 08:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B348F1C2175D
	for <lists+linux-tegra@lfdr.de>; Sat, 26 Oct 2024 06:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29959179954;
	Sat, 26 Oct 2024 06:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="h1r5yiB0"
X-Original-To: linux-tegra@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF90629CE5;
	Sat, 26 Oct 2024 06:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729925770; cv=none; b=WhRpdCD2h/8JwFyS2m2VuFp4dPWrpL9+b7BODJ6wXmCueQ5qoea0RyU4SMqGpCMPns8hsF+fw61s5KWeVDYwZr55psxsSfKSzrMbMGqHdjNMK7D9bKDymMpMTXIjqMgxPi/RhNdO6xXpDZ2sGcu78TG6RceafCvjOZRb/NVYf9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729925770; c=relaxed/simple;
	bh=3PL8Gj4mYhTYgCg38KPptxZPec8jciUWHVqr0KSr3hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BciX5/q2Fe/+fbmFBb5fQZL14BRvNMCf3RsGiJZDgMdH2q454GyobeeEe+CXr280IB2f7lsW29kRU0oDRmIgCUPlR6SgCHKKexb4UKIS9dgZYFyux+OsDOHN8sUPSXwWpeQUB0ccNDyVwSXfmNTsQO4jKsot2MDii6Jf2jDMPak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=h1r5yiB0; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CKwWiP3L9FoFQ3QZ4XP65Va3pMFiOXrM5xre8AA6FKA=; b=h1r5yiB0L+DPF93P415n2rzXVM
	jnx8/keBw7pGn1laadzUU0Xii+EcoAo5AYcVepbeNc7LDlO8x8+yReGmTuEwcTrI4X7ZwkGTSa0rC
	fIq9IXnsOqUmLWmEZvbORyjLyXxSpqeEz9RA0vAtgIVdhrJEE0hrTe114xwLdAWBID5DI9f11YcJL
	83Um8x3qAYd1UB0uLBff50y0BaT2NTJlKMersEks8PfgwvCH6vy/AZqk/YXPbVWGwe+jE/GCULKeE
	jyIZM8KWjh1mAl2n3wFizPdgpZPkG89sJCKwR0sJU2neWeogYwSPmM1VvaD6xphmhLxJQ51qDD18d
	E9lmahRA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1t4aiP-00CFvH-1Z;
	Sat, 26 Oct 2024 14:56:02 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 26 Oct 2024 14:56:01 +0800
Date: Sat, 26 Oct 2024 14:56:01 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Akhil R <akhilrajeev@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] crypto: tegra: remove redundant error check on ret
Message-ID: <ZxySgeHMXMcKNITH@gondor.apana.org.au>
References: <20241015131122.152046-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015131122.152046-1-colin.i.king@gmail.com>

On Tue, Oct 15, 2024 at 02:11:22PM +0100, Colin Ian King wrote:
> Currently there is an unnecessary error check on ret without a proceeding
> assignment to ret that needs checking. The check is redundant and can be
> removed.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/crypto/tegra/tegra-se-aes.c | 2 --
>  1 file changed, 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


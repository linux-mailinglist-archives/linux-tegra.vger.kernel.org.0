Return-Path: <linux-tegra+bounces-2813-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C2C91C689
	for <lists+linux-tegra@lfdr.de>; Fri, 28 Jun 2024 21:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E221B282ECD
	for <lists+linux-tegra@lfdr.de>; Fri, 28 Jun 2024 19:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56806F30A;
	Fri, 28 Jun 2024 19:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="pIPvFia1"
X-Original-To: linux-tegra@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AE71B94F;
	Fri, 28 Jun 2024 19:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719602785; cv=none; b=JrDaT6qF34a2o8bIg9wKsNa027RhUsUAtgDp7uGZRA2sORs+WSiUkBSdplpP+TOdn45pCVmt/sS/bddqZYmZm9wVpvFhGPS66iCpOn4B/Rmw2RoZ/i91gowLWUGRyHDRQBVHGBdbNWMYP0L1SRoFaVMjkrm8AlJV7GyQd2kUCQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719602785; c=relaxed/simple;
	bh=wfttQ4irodpYug+6tg6O3xKAbBz2IjoGgFPQFIjoayY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oxj6ncvd9uR1P9jCZ+MQIQ7ikONc/TTSM3TWWMMuPVK/vXIYQUgbRPDEtHPiRGz3UFEkoGbcB8kOPvbA5bXif3IGS393leh3PB/2kZHHZ8OlQli2agWcv4Inu4OXYT3bZah79OHdopsK9IWxf56xMeN8xlFQUB84seB0ea+v1PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=pIPvFia1; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id C7E781C0098; Fri, 28 Jun 2024 21:26:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1719602773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JtDEctZl5csME915JD1o7S/fADLLKRHQ6IHxoN8gnJM=;
	b=pIPvFia1iyz9cQOK1ng10vPjzJaLxBMU2iXRgilHaRdZEmjI10MItvG+CCM2TPoXNjkQz+
	jbhQvAg7z36xuk6TVOxWuBgxKTJsu8apuJ5Nwyr5v2aCMlDsosM02zznZGGbdgC+0bWgMr
	wK7YOaW8M1Lvtaqt8VCnTaulTdPvSu0=
Date: Fri, 28 Jun 2024 21:26:00 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@nvidia.com,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v9 0/6] Add Tegra241 (Grace) CMDQV Support (part 1/2)
Message-ID: <ZnXBrhcaiHqV9sn2@duo.ucw.cz>
References: <cover.1718228494.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M55KJ6JsedfzaN2+"
Content-Disposition: inline
In-Reply-To: <cover.1718228494.git.nicolinc@nvidia.com>


--M55KJ6JsedfzaN2+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> NVIDIA's Tegra241 (Grace) SoC has a CMDQ-Virtualization (CMDQV) hardware
> that extends standard ARM SMMUv3 to support multiple command queues with
> virtualization capabilities. Though this is similar to the ECMDQ in SMMU
> v3.3, CMDQV provides additional Virtual Interfaces (VINTFs) allowing VMs
> to have their own VINTFs and Virtual Command Queues (VCMDQs). The VCMDQs
> can only execute a limited set of commands, mainly invalidation commands
> when exclusively used by the VMs, compared to the standard SMMUv3 CMDQ.

Text is block-aligned without duplicated spaces. How did you do
that...?

Anyway, it looks great.

Best regards,

								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--M55KJ6JsedfzaN2+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZn8OSAAKCRAw5/Bqldv6
8qZXAJ9DkBgF2X8KifU4u59xbet4ETIS0wCfRqMfWdm2bAX+xuqbVdS3ziga0Vo=
=VuQU
-----END PGP SIGNATURE-----

--M55KJ6JsedfzaN2+--


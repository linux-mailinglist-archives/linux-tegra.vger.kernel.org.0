Return-Path: <linux-tegra+bounces-5907-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C10A85A64
	for <lists+linux-tegra@lfdr.de>; Fri, 11 Apr 2025 12:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 034B816E3F1
	for <lists+linux-tegra@lfdr.de>; Fri, 11 Apr 2025 10:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B042822128F;
	Fri, 11 Apr 2025 10:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="xQGjZOiX"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF98122126C;
	Fri, 11 Apr 2025 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744368314; cv=none; b=lbOpyWwCFHGbclDHIv764KCSq1nuHkc2t17i1vP85H+oHhbplZK8pm6cKlfTzw24g3ZUzwdVg/7m5EmmAomdDIfMJPj0+FZFMG2Qtk5XTB08giFyhzhDsN2Eqdzgv8mlZnYzzghjR/yy01c7s792/zukyshMwIwrM6yCZd1fB94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744368314; c=relaxed/simple;
	bh=2K2UtTXIu1TLmaoMSN6Rl21RoiWylh/+IQqQ++fQ1oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lk5Hrfc8MemSCBPd697seTpO5L0VplMC00c2yn7LpSO46QK+Y3unJuQsx+fcaddxE0HujUiyuRIzK1z97GNqs9WngrEz85zwR3bfZIyQ/B7aAO2M0QTL1aaPaIeGySnU65U0n+zrVOQWoDBk2wNwTClMmRMtQshEKFP83Dre3dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=xQGjZOiX; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id CF96D47D2D;
	Fri, 11 Apr 2025 12:45:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744368311;
	bh=2K2UtTXIu1TLmaoMSN6Rl21RoiWylh/+IQqQ++fQ1oE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xQGjZOiXT4O1vOT67iNfe/6y1h61IBPDdS6R64Pmwrb5MbJI7Uoj0BIGWwSOGxBdM
	 QVTJcnmovZrc8mxAc1n4rRVmEudBfT3HmOGHmclBWH+iSp1NNCzc2F0KxdATVzQfpD
	 PtiwYdmoQdAeilf/MejyRqXLty62Df3wadu8JcqF0yapGWGgfhTkg8Zt+ITklOacTy
	 pNYzZQcNsdoKOlstPqh/kzNZxZafaca+gBACZtj/wRsNxpSiM5QYpbqWU++KF/JuZp
	 9Zu3KLtRmCos8yZUpU7YO+RSai2RKs7jBmYBt3WJM+G7Kc9lm55S5Jwz5RAygaCW72
	 eEPPOKqY+hIGA==
Date: Fri, 11 Apr 2025 12:45:10 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, jgg@nvidia.com, thierry.reding@gmail.com,
	vdumpa@nvidia.com, robin.murphy@arm.com, jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH rc v2] iommu/tegra241-cmdqv: Fix warnings due to
 dmam_free_coherent()
Message-ID: <Z_jytpEPKzzKAxKo@8bytes.org>
References: <20250407201908.172225-1-nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407201908.172225-1-nicolinc@nvidia.com>

On Mon, Apr 07, 2025 at 01:19:08PM -0700, Nicolin Chen wrote:
> Fixes: 483e0bd8883a ("iommu/tegra241-cmdqv: Do not allocate vcmdq until dma_set_mask_and_coherent")
> Cc: stable@vger.kernel.org
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
> Changelog
> v2
>  * Fail tegra241_cmdqv_init_structures() and let devres take care of the
>    lvcmdq queue memory space
> v1
>  https://lore.kernel.org/all/cover.1744014481.git.nicolinc@nvidia.com/
> 
>  .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 32 +++----------------
>  1 file changed, 5 insertions(+), 27 deletions(-)

Applied, thanks.


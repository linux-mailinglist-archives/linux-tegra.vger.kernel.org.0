Return-Path: <linux-tegra+bounces-4026-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F73B9AE931
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2024 16:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36615B25006
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2024 14:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5DA1E7660;
	Thu, 24 Oct 2024 14:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oj4ILo4x"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFA91E7642;
	Thu, 24 Oct 2024 14:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729780980; cv=none; b=geOdoSLlKnh8FGy4xTa33eRdLJjPOjfDoM7wUUagXWyg4ZfobLOKu8kbh8PfahJCkkTTlItBWcegaq465FddPvxEuRz2JWMjAu9QVGDcabCHOBc6/lpYGuyRJDZjRJgdmL2GKsTINMhoQsZmmGe9tDa7znj4qGK5ciQ/WgYhBF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729780980; c=relaxed/simple;
	bh=1ejVg1CipTkaaCEMkv2lOH0qtir938jRrfngzcytoAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xf8QHKmczgw7ApJY5hPPOy8ENQocaZetuldPjCd4tYBWuF2pPY5l8IA50VWW/Ydh4enazBqdYhUmv4jrMnlLncv5EIBTiDtHoQPD8akdnRRvEw5ss5aSkLWcQLKaFTfcp90ytbAgKCSxxmlpJTs0NW99ejrwvxzxjkTQV85yHDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oj4ILo4x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93ACCC4CEE4;
	Thu, 24 Oct 2024 14:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729780980;
	bh=1ejVg1CipTkaaCEMkv2lOH0qtir938jRrfngzcytoAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oj4ILo4x+wAh6tghZKbYtGDNkfjGraSOQIc9xpRWDoRwIqkIW82JC83/gUevGKW4R
	 V4RsuAJ3fFcmiB8FNIgeR5I75CMcbgjkKRJF4ts1rKOrpFeR1NG/lKPtuOR1sxIvGC
	 ow4dQJjrWll9hpgyc5zdnwkPbHwMVLvKKUTYs/aRpXNFdBjDs9LC6LgF71SAqKaMWv
	 44+ni4CHmZTF+pqSHFkwDbHg4b+soCBa1BmkbFa+DxThT5dxdOgwSxS/NqotbhrmHV
	 U+naQ8/X6aDMOxPC/KJfK6XVxUbiGd7pEm5g9XT7f4F8bVhuXKi1RQd1S0JL10AyJN
	 BlhPuCMi6YovA==
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	thierry.reding@gmail.com,
	vdumpa@nvidia.com,
	robin.murphy@arm.com,
	joro@8bytes.org,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mochs@nvidia.com,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] iommu/tegra241-cmdqv: Staticize cmdqv_debugfs_dir
Date: Thu, 24 Oct 2024 15:42:50 +0100
Message-Id: <172977371410.1428518.18139472724590199214.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241021230847.811218-1-nicolinc@nvidia.com>
References: <20241021230847.811218-1-nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 21 Oct 2024 16:08:46 -0700, Nicolin Chen wrote:
> Fix a sparse warning.
> 
> 

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/tegra241-cmdqv: Staticize cmdqv_debugfs_dir
      https://git.kernel.org/will/c/89edbe88db28

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


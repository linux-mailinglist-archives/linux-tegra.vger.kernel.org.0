Return-Path: <linux-tegra+bounces-4110-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC8C9C5E0B
	for <lists+linux-tegra@lfdr.de>; Tue, 12 Nov 2024 18:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E68911F21ACA
	for <lists+linux-tegra@lfdr.de>; Tue, 12 Nov 2024 17:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37217207A18;
	Tue, 12 Nov 2024 16:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyDGHS8V"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B6B20651E;
	Tue, 12 Nov 2024 16:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731430617; cv=none; b=TyfF1NPgzzEy2MYENokeZ/ox+I9P8j+ADlfBc2hfmwwU4rt6zlDe1Pl/SqoqzxhNrUU29g1N3k/kdzpjmu+wAIshvxX6qjugpSiA/oxh+CGZmgaKGFZhpZDrxsrkthEezi+C6CSRUTXbkxL1Cwbr0QsXmFfJ5jLKrZ5q6hGsUxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731430617; c=relaxed/simple;
	bh=EQvwaUi2w45hQ0nesz6tI/0jRlGB8KnI5X1+VY1Emb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=apyIezI8Ir/Gvsb6r/YhJDln+XDeTt7N+/usow+5yjP/WI5SA0nvrmjDlOkIyLqOjJjGahqwfboIWPE8gMR80DneTm/m8S4hTiorLOsnd+7N97jTnEGlkASkSF/4WuqXwjjVeEInZKiYluK+5clKWhujCsLFEAzFNfEP49ZXPBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyDGHS8V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C3AC4CECD;
	Tue, 12 Nov 2024 16:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731430616;
	bh=EQvwaUi2w45hQ0nesz6tI/0jRlGB8KnI5X1+VY1Emb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gyDGHS8VsFO8YiUHKzzdrGVONkbwC6XBKloCM7ImIfjtBGzSzNAUgp2U1WQRNik81
	 Fsef0rzOtkP2gxPHhseqbSGQUo+F007cVaRRm44WCe98vAwzUKEsIImwT1EVlLXEEz
	 0LPJez1/xObpd4tI+PXrrXb1OOwTry4zKTP8DK80gDMaU+/6dzq1hkBA8kBgDGuAIh
	 InhNdo6bpFLAoS8m7e+5Nejf1cDjQeqc0stHuDrWH0xdL7jzaX5A21tmfk1g5qFhJ1
	 EUacgxVFtwvt6r+/zqkKBBkvW0fRLCFGYz0b3KVM4AcH0I70MqjMdfXNiVT4hNrF9p
	 aXeJjSEvP0IdQ==
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	joro@8bytes.org,
	thierry.reding@gmail.com,
	vdumpa@nvidia.com,
	jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH rc] iommu/tegra241-cmdqv: Fix alignment failure at max_n_shift
Date: Tue, 12 Nov 2024 16:56:50 +0000
Message-Id: <173142418330.1973910.1191259071038387348.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241111030226.1940737-1-nicolinc@nvidia.com>
References: <20241111030226.1940737-1-nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 10 Nov 2024 19:02:26 -0800, Nicolin Chen wrote:
> When configuring a kernel with PAGE_SIZE=4KB, depending on its setting of
> CONFIG_CMA_ALIGNMENT, VCMDQ_LOG2SIZE_MAX=19 could fail the alignment test
> and trigger a WARN_ON:
>     WARNING: at drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3646
>     Call trace:
>      arm_smmu_init_one_queue+0x15c/0x210
>      tegra241_cmdqv_init_structures+0x114/0x338
>      arm_smmu_device_probe+0xb48/0x1d90
> 
> [...]

Applied to iommu (arm/smmu), thanks!

[1/1] iommu/tegra241-cmdqv: Fix alignment failure at max_n_shift
      https://git.kernel.org/iommu/c/a3799717b881

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


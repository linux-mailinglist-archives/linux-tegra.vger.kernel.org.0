Return-Path: <linux-tegra+bounces-3623-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 182A596C39E
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Sep 2024 18:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9F432839C1
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Sep 2024 16:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486871E0080;
	Wed,  4 Sep 2024 16:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohAkgLCP"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D9D1DFE09;
	Wed,  4 Sep 2024 16:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725466363; cv=none; b=Dp8L04ILl7TlFik3G4e1SMEXMeMdTw4vodE7uCXjFHBckKSWBLk7Py/Cfev2qlVLlTbnOcWgz9pgAZOl8apsH8whjlIeGXFTtBdpkWRM11engzjeRnQx5lwOt+pV8ABl3P1SIklCMWlymvsmcxH+wqfZiPBnC2k9vlLbmNKpxGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725466363; c=relaxed/simple;
	bh=ccD051nw8bhJzyVq5/F/tF57fRYGPu80Rt8YQCVY858=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XCUY5+Zrbb/JFUSE7N+eHtZZZhcrZuK/ptGX6Oq4butUag9GsIkWYl4JM/WOlIjpvyNxA/nK4AZQ0fWeCuOQJw9951f0j2zo5Fq+RXu9kIs38zy86AJNAPLsvquh1R7L72efizfKgO336yz4taBous7cxkiisiLatk2cwCd9kV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohAkgLCP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33C1C4CEC2;
	Wed,  4 Sep 2024 16:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725466362;
	bh=ccD051nw8bhJzyVq5/F/tF57fRYGPu80Rt8YQCVY858=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ohAkgLCPdyXQsjQLek+04BD/vW5L5JZ1vWz5/GMvv9gBGXsZI4wUyU6Hp/RfpDsB5
	 oqi7Mg/NT0rDI3qwhhdbY0An1dGTTx8MD3ykbwKHoRs3VM+JOdxWHskChey/tujphb
	 3pHjAQfER2Ty65QBjaOu9zfvJopJ4FnKkHHhrMvg2ISBEFzXZisaDm388SKuFu1Qgm
	 v+j2CvepZI20PKgtfljPp6mbwHOnagbQ03FOYWGEt8yRkwnXL8jUvIO8THHniDgP0o
	 Qmk8mhnGcMmDYSlAd6cN8Ou9kNGcUpIONu3ukBQvMWsMIhbEGuzoguNhgTLlB6Xj8i
	 MKSYdyhqUQOKA==
From: Will Deacon <will@kernel.org>
To: Nate Watterson <nwatterson@nvidia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] iommu/tegra241-cmdqv: Fix ioremap() error handling in probe()
Date: Wed,  4 Sep 2024 17:12:32 +0100
Message-Id: <172546457078.2664706.4987719467063191375.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <5a6c1e9a-0724-41b1-86d4-36335d3768ea@stanley.mountain>
References: <5a6c1e9a-0724-41b1-86d4-36335d3768ea@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 04 Sep 2024 11:02:43 +0300, Dan Carpenter wrote:
> The ioremap() function doesn't return error pointers, it returns NULL
> on error so update the error handling.  Also just return directly
> instead of calling iounmap() on the NULL pointer.  Calling
> iounmap(NULL) doesn't cause a problem on ARM but on other architectures
> it can trigger a warning so it'a bad habbit.
> 
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/tegra241-cmdqv: Fix ioremap() error handling in probe()
      https://git.kernel.org/will/c/086a3c40ebd0

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


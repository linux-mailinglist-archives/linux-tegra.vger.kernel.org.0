Return-Path: <linux-tegra+bounces-2381-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 960F38CD4F6
	for <lists+linux-tegra@lfdr.de>; Thu, 23 May 2024 15:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7C3D1C2184D
	for <lists+linux-tegra@lfdr.de>; Thu, 23 May 2024 13:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B554914A606;
	Thu, 23 May 2024 13:41:18 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BFE13C80E;
	Thu, 23 May 2024 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716471678; cv=none; b=PrB7rckc4mCOFwXJX/M1b+iR0UKYxvLq68eVSDE3KNRvyfk7JGpGtfrTw9Ag3z6Es4w8B82MlOOxXuPg06rbVVbu0yqALvqo46TArlw91rjs/6aResX/e0877Aa8MY1cz21Js4kDvp0/BrAMtEOAkxLLPvXBmE/jOGBnftSq3DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716471678; c=relaxed/simple;
	bh=ks/+jIX9/JNl5qEusE2VtlXC4Pkhhyxy6RcAKxsnmkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gEslz0sqWxfRrhKdw2DSV2wbHanTQTVLpTArtUNINlBT+g5o10u5sB0UNVSEzVhmej2OS6K/IpUEMcmcLSU2x2TPK1VGLdvipMOvtGonYVh9G3l89C10Jp+OFNZWzMF7OPwy+Y8uPJ4V9n2TQgbOmTbx7coKqST6iBRH1vfC3r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15852DA7;
	Thu, 23 May 2024 06:41:39 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95D5E3F881;
	Thu, 23 May 2024 06:41:13 -0700 (PDT)
Message-ID: <6b707eb4-5cf3-4b66-8152-5ba252f5df39@arm.com>
Date: Thu, 23 May 2024 14:41:12 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] iommu: Optimize IOMMU UnMap
To: Ashish Mhetre <amhetre@nvidia.com>, will@kernel.org, joro@8bytes.org,
 linux-arm-kernel@lists.infradead.org, Rob Clark <robdclark@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: vdumpa@nvidia.com, linux-tegra@vger.kernel.org, treding@nvidia.com,
 jonathanh@nvidia.com, iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240523031935.90856-1-amhetre@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240523031935.90856-1-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2024 4:19 am, Ashish Mhetre wrote:
> The current __arm_lpae_unmap() function calls dma_sync() on individual
> PTEs after clearing them. By updating the __arm_lpae_unmap() to call
> dma_sync() once for all cleared PTEs, the overall performance can be
> improved 25% for large buffer sizes.
> Below is detailed analysis of average unmap latency(in us) with and
> without this optimization obtained by running dma_map_benchmark for
> different buffer sizes.
> 
> Size	Time W/O	Time With	% Improvement
> 	Optimization	Optimization
> 	(us)		(us)
> 
> 4KB	3.0		3.1		-3.33
> 1MB	250.3		187.9		24.93

This seems highly suspect - the smallest possible block size is 2MB so a 
1MB unmap should not be affected by this path at all.

> 2MB	493.7		368.7		25.32
> 4MB	974.7		723.4		25.78

I'm guessing this is on Tegra with the workaround to force everything to 
PAGE_SIZE? In the normal case a 2MB unmap should be nominally *faster* 
than 4KB, since it would also be a single PTE, but with one fewer level 
of table to walk to reach it. The 25% figure is rather misleading if 
it's only a mitigation of an existing erratum workaround, and the actual 
impact on the majority of non-broken systems is unmeasured.

(As an aside, I think that workaround itself is a bit broken, since at 
least on Tegra234 with Cortex-A78, PAGE_SIZE could be 16KB which MMU-500 
doesn't support.)

> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>   drivers/iommu/io-pgtable-arm.c | 34 +++++++++++++++++++++++++---------
>   1 file changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 3d23b924cec1..94094b711cba 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -256,13 +256,15 @@ static void __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries,
>   				   sizeof(*ptep) * num_entries, DMA_TO_DEVICE);
>   }
>   
> -static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtable_cfg *cfg)
> +static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtable_cfg *cfg, int num_entries)
>   {
> +	int i;
>   
> -	*ptep = 0;
> +	for (i = 0; i < num_entries; i++)
> +		ptep[i] = 0;
>   
>   	if (!cfg->coherent_walk)
> -		__arm_lpae_sync_pte(ptep, 1, cfg);
> +		__arm_lpae_sync_pte(ptep, num_entries, cfg);
>   }
>   
>   static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
> @@ -633,13 +635,25 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
>   		max_entries = ARM_LPAE_PTES_PER_TABLE(data) - unmap_idx_start;
>   		num_entries = min_t(int, pgcount, max_entries);
> -
> -		while (i < num_entries) {
> -			pte = READ_ONCE(*ptep);
> +		arm_lpae_iopte *pte_flush;
> +		int j = 0;
> +
> +		pte_flush = kvcalloc(num_entries, sizeof(*pte_flush), GFP_ATOMIC);

kvmalloc() with GFP_ATOMIC isn't valid. However, I'm not sure if there 
isn't a more fundamental problem here - Rob, Boris; was it just the map 
path, or would any allocation on unmap risk the GPU reclaim deadlock 
thing as well?

Thanks,
Robin.

> +		if (pte_flush) {
> +			for (j = 0; j < num_entries; j++) {
> +				pte_flush[j] = READ_ONCE(ptep[j]);
> +				if (WARN_ON(!pte_flush[j]))
> +					break;
> +			}
> +			__arm_lpae_clear_pte(ptep, &iop->cfg, j);
> +		}
> +		while (i < (pte_flush ? j : num_entries)) {
> +			pte = pte_flush ? pte_flush[i] : READ_ONCE(*ptep);
>   			if (WARN_ON(!pte))
>   				break;
>   
> -			__arm_lpae_clear_pte(ptep, &iop->cfg);
> +			if (!pte_flush)
> +				__arm_lpae_clear_pte(ptep, &iop->cfg, 1);
>   
>   			if (!iopte_leaf(pte, lvl, iop->fmt)) {
>   				/* Also flush any partial walks */
> @@ -649,10 +663,12 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   			} else if (!iommu_iotlb_gather_queued(gather)) {
>   				io_pgtable_tlb_add_page(iop, gather, iova + i * size, size);
>   			}
> -
> -			ptep++;
> +			if (!pte_flush)
> +				ptep++;
>   			i++;
>   		}
> +		if (pte_flush)
> +			kvfree(pte_flush);
>   
>   		return i * size;
>   	} else if (iopte_leaf(pte, lvl, iop->fmt)) {


Return-Path: <linux-tegra+bounces-3164-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B634C948CF2
	for <lists+linux-tegra@lfdr.de>; Tue,  6 Aug 2024 12:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E84D01C23655
	for <lists+linux-tegra@lfdr.de>; Tue,  6 Aug 2024 10:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA13B1BE854;
	Tue,  6 Aug 2024 10:39:28 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCB015B54C;
	Tue,  6 Aug 2024 10:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722940768; cv=none; b=BiFyO6RIO2y7nflfXokdTb8wtNmiKI8lLPT/zcEC5438BVIncF9DMbfrKixIYTxagjlYwu2UufYUWTdjI2B98n25V7Epj5C2WjZwoQ2g1Wn4DT+OrE8JTFS37O/P0JMaT8+kyZmXOmxFUwNklkq4NP9oMWRrNwJiWQrxlLGneQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722940768; c=relaxed/simple;
	bh=f3yrW3TgSKGlLolol72ndZGCbsVRSJQaOX3C228bnyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyadqOJP0sUQxXLnokF6H5UGGTtJCnBZG0aSTJ576ASZbzqe4vO4O9NxP4YybY2qSG5NaJ1THNCmXlocsECdMlGcp75phtRV5ROaP5no8a0lJPGtm0Ajz13niAWxrqUBSzOietCTebrsCnrXaJVK0g09Zv25E1JkCzcBAgLtZ9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E24CFEC;
	Tue,  6 Aug 2024 03:39:51 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E0FC3F6A8;
	Tue,  6 Aug 2024 03:39:24 -0700 (PDT)
Message-ID: <bfd0f7c7-5492-47ec-9c66-4c1ad4cd0e52@arm.com>
Date: Tue, 6 Aug 2024 11:39:23 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] iommu: Optimize IOMMU UnMap
To: Ashish Mhetre <amhetre@nvidia.com>, will@kernel.org, joro@8bytes.org
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20240805084106.214584-1-amhetre@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240805084106.214584-1-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2024 9:41 am, Ashish Mhetre wrote:
> The current __arm_lpae_unmap() function calls dma_sync() on individual
> PTEs after clearing them. Overall unmap performance can be improved by
> around 25% for large buffer sizes by combining the syncs for adjacent
> leaf entries.
> Optimize the unmap time by clearing all the leaf entries and issuing a
> single dma_sync() for them.
> Below is detailed analysis of average unmap latency(in us) with and
> without this optimization obtained by running dma_map_benchmark for
> different buffer sizes.
> 
> 		UnMap Latency(us)
> Size	Without		With		% gain with
> 	optimiztion	optimization	optimization
> 
> 4KB	3		3		0
> 8KB	4		3.8		5
> 16KB	6.1		5.4		11.48
> 32KB	10.2		8.5		16.67
> 64KB	18.5		14.9		19.46
> 128KB	35		27.5		21.43
> 256KB	67.5		52.2		22.67
> 512KB	127.9		97.2		24.00
> 1MB	248.6		187.4		24.62
> 2MB	65.5		65.5		0
> 4MB	119.2		119		0.17
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
> Changes in V2:
> - Updated the commit message to be imperative.
> - Fixed ptep at incorrect index getting cleared for non-leaf entries.
> 
> Changes in V3:
> - Used loop-local variables and removed redundant function variables.
> - Added check for zero-sized dma_sync in __arm_lpae_clear_pte().
> - Merged both patches into this single patch by adding check for a
>    NULL gather in __arm_lpae_unmap() itself.

Yeah, that's cleaned up really nicely!

Other than a nit that the subject ideally wants to be something more 
accurate like "iommu/io-pgtable-arm: Optimise non-coherent unmap" (sorry 
I forgot to mention that last time),

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> ---
>   drivers/iommu/io-pgtable-arm.c | 31 +++++++++++++++++--------------
>   1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index f5d9fd1f45bf..6fecf3d9fe67 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -274,13 +274,13 @@ static void __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries,
>   				   sizeof(*ptep) * num_entries, DMA_TO_DEVICE);
>   }
>   
> -static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtable_cfg *cfg)
> +static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtable_cfg *cfg, int num_entries)
>   {
> +	for (int i = 0; i < num_entries; i++)
> +		ptep[i] = 0;
>   
> -	*ptep = 0;
> -
> -	if (!cfg->coherent_walk)
> -		__arm_lpae_sync_pte(ptep, 1, cfg);
> +	if (!cfg->coherent_walk && num_entries)
> +		__arm_lpae_sync_pte(ptep, num_entries, cfg);
>   }
>   
>   static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
> @@ -654,26 +654,29 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   		max_entries = ARM_LPAE_PTES_PER_TABLE(data) - unmap_idx_start;
>   		num_entries = min_t(int, pgcount, max_entries);
>   
> -		while (i < num_entries) {
> -			pte = READ_ONCE(*ptep);
> +		/* Find and handle non-leaf entries */
> +		for (i = 0; i < num_entries; i++) {
> +			pte = READ_ONCE(ptep[i]);
>   			if (WARN_ON(!pte))
>   				break;
>   
> -			__arm_lpae_clear_pte(ptep, &iop->cfg);
> -
>   			if (!iopte_leaf(pte, lvl, iop->fmt)) {
> +				__arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
> +
>   				/* Also flush any partial walks */
>   				io_pgtable_tlb_flush_walk(iop, iova + i * size, size,
>   							  ARM_LPAE_GRANULE(data));
>   				__arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));
> -			} else if (!iommu_iotlb_gather_queued(gather)) {
> -				io_pgtable_tlb_add_page(iop, gather, iova + i * size, size);
>   			}
> -
> -			ptep++;
> -			i++;
>   		}
>   
> +		/* Clear the remaining entries */
> +		__arm_lpae_clear_pte(ptep, &iop->cfg, i);
> +
> +		if (gather && !iommu_iotlb_gather_queued(gather))
> +			for (int j = 0; j < i; j++)
> +				io_pgtable_tlb_add_page(iop, gather, iova + j * size, size);
> +
>   		return i * size;
>   	} else if (iopte_leaf(pte, lvl, iop->fmt)) {
>   		/*


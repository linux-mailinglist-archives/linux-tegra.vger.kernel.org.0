Return-Path: <linux-tegra+bounces-19-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DF77F5D84
	for <lists+linux-tegra@lfdr.de>; Thu, 23 Nov 2023 12:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 023771C20B64
	for <lists+linux-tegra@lfdr.de>; Thu, 23 Nov 2023 11:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F2522EFF;
	Thu, 23 Nov 2023 11:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-tegra@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 251B5D49;
	Thu, 23 Nov 2023 03:13:30 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56C701042;
	Thu, 23 Nov 2023 03:14:16 -0800 (PST)
Received: from [10.57.70.183] (unknown [10.57.70.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 502F33F73F;
	Thu, 23 Nov 2023 03:13:28 -0800 (PST)
Message-ID: <2ba7bab4-daee-4883-acd4-ec9a10c82103@arm.com>
Date: Thu, 23 Nov 2023 11:13:13 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu: Don't reserve IOVA when address and size are zero
To: Ashish Mhetre <amhetre@nvidia.com>, joro@8bytes.org, will@kernel.org,
 robh@kernel.org, treding@nvidia.com
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20231123061201.16614-1-amhetre@nvidia.com>
Content-Language: en-GB
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20231123061201.16614-1-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-23 6:12 am, Ashish Mhetre wrote:
> When the bootloader/firmware doesn't setup the framebuffers, their
> address and size are zero in "iommu-addresses" property. If we intend to
> use display driver in kernel without framebuffer then it's causing
> the display IOMMU mappings to fail as IOVA is reserved with size and
> address as zero.

Can you clarify the problem there? Looking at the code in 
iova_reserve_iommu_regions() I'm guessing it's that "region->start + 
region->length - 1" underflows so reserve_iova() actually ends up 
reserving the entire valid IOVA space?

> An ideal solution would be firmware removing the "iommu-addresses"
> property and corresponding "memory-region" if display is not present.
> But the kernel should be able to handle this by checking for size and
> address of IOVA and skipping the IOVA reservation if both are 0.

Surely it doesn't make sense to reserve a 0-length region at *any* base 
address? The symptom above wouldn't be quite the same if the base was 
nonzero, but corrupting the rbtree with an entry where pfn_hi < pfn_lo 
would definitely not be good either.

> Fixes: a5bf3cfce8cb ("iommu: Implement of_iommu_get_resv_regions()")
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>   drivers/iommu/of_iommu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index 157b286e36bf..150ef65d357a 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -255,6 +255,10 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>   				size_t length;
>   
>   				maps = of_translate_dma_region(np, maps, &iova, &length);
> +				if (iova == 0 && length == 0) {
> +					dev_dbg(dev, "Skipping IOVA reservation as address and size are zero\n");

FWIW I'd be inclined to log a visible warning that firmware is giving us 
nonsense.

Thanks,
Robin.

> +					continue;
> +				}
>   				type = iommu_resv_region_get_type(dev, &phys, iova, length);
>   
>   				region = iommu_alloc_resv_region(iova, length, prot, type,


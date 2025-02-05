Return-Path: <linux-tegra+bounces-4850-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C18B6A295E5
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Feb 2025 17:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A2DB1882FC5
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Feb 2025 16:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3351DC9B3;
	Wed,  5 Feb 2025 16:11:10 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7881D8E07;
	Wed,  5 Feb 2025 16:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771870; cv=none; b=UZRX1hd/Z1DsjYe0pWLtxgUTxLaptvqLIjraerI99tGwck9gCZQ7gYTsA0aqotfPIi+V7RUUSiu8hys3ZhIFLqso7LSdx8wz11nZWiM9NouxL8GRN8PeNd8dW61ekmWGf6Z4USAPiZ99nN/ULs6G4iDRF4fkOwtsp9zlQIVlKYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771870; c=relaxed/simple;
	bh=d4LhsD3lA8sn51zkFNV/8GzLm09PHfYU4Wr+BwsY6hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VtFP4Y5ER0fMY5gltletBY1Zr24+RqidA1STbyDZ5yg/lqj+Cd9Bf4wqIUH7cxjBrUAhqcb9IfmnahmQTZ7MQuELwJzdItCNfJ78B3ECdsjutPRJSDuD5BEzHmWDwVkdCYPNslBsij2Bc4OGxK9x7IIWh8hvOj0Wl+72H26h3bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3605E1063;
	Wed,  5 Feb 2025 08:11:31 -0800 (PST)
Received: from [10.57.35.21] (unknown [10.57.35.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6F3C3F58B;
	Wed,  5 Feb 2025 08:11:01 -0800 (PST)
Message-ID: <f8d73cd3-f85c-49c3-8b37-4eaad0255860@arm.com>
Date: Wed, 5 Feb 2025 16:11:00 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] iommu/amd: Use roundup_pow_two() instead of
 get_order()
To: Jason Gunthorpe <jgg@nvidia.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, Lu Baolu <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Heiko Stuebner <heiko@sntech.de>,
 iommu@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Hector Martin <marcan@marcan.st>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel@sholland.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 David Rientjes <rientjes@google.com>, Matthew Wilcox <willy@infradead.org>
References: <16-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <16-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-02-04 6:34 pm, Jason Gunthorpe wrote:
>    1 << (get_order(x) + PAGE_SHIFT) ==  roundup_pow_two()

...unless x < 2048, which does seem possible here if last_bdf is 
sufficiently small. Not too significant in the cases where the result is 
only rounded back up again for an allocation or remap anyway, but I do 
wonder about the use of dev_table_size in iommu_set_device_table(), and 
whether this change might break it, or whether it's already wrong for 
that case and this might actually fix it...

Thanks,
Robin.

> Use the shorter version.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/amd/init.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
> index f1c5041647173c..7d77929bc63af3 100644
> --- a/drivers/iommu/amd/init.c
> +++ b/drivers/iommu/amd/init.c
> @@ -247,10 +247,7 @@ static void init_translation_status(struct amd_iommu *iommu)
>   
>   static inline unsigned long tbl_size(int entry_size, int last_bdf)
>   {
> -	unsigned shift = PAGE_SHIFT +
> -			 get_order((last_bdf + 1) * entry_size);
> -
> -	return 1UL << shift;
> +	return roundup_pow_of_two((last_bdf + 1) * entry_size);
>   }
>   
>   int amd_iommu_get_num_iommus(void)



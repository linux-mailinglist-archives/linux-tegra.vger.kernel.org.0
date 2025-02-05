Return-Path: <linux-tegra+bounces-4848-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 524F7A2957D
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Feb 2025 16:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9C373A84C1
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Feb 2025 15:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D9B1DF242;
	Wed,  5 Feb 2025 15:56:09 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0AA5198A17;
	Wed,  5 Feb 2025 15:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770969; cv=none; b=lqyJJHdYWnEW/RTT4nyxh0aeBsCnnJXGURYYkFtaUo+d93+kWct/zs/M7SCgHzOgDSONEo9WrPbyFsOJMfVs3Z29FJjQPeQ51Her7vQLT9X7VFTO7r/gk7Jmy8vPDKbSWw5rVNgOqr2WLaaxA2x6fzHeneXymMgNPXqqirdK1k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770969; c=relaxed/simple;
	bh=xCeSU+2CcEoi4tdU18PIYzawi2kTD1Je4ESjJY6x3CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WKFps8m5JTTJiQ0Ewbr4uEW6i0VfI7ZRR8J/lNVjsKlnH5YpULLRlu8WdyoL9WPJIveO2ErKDFvJU5SNiINOt4XLbcGiJVJjatiwCoQLT7YrS/n4hcxw3QjceT1e1+pU2vjmnVh1oiql+wECudhNw+z2bsMEcKLJqAE+ipm+FgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97C0A1063;
	Wed,  5 Feb 2025 07:56:30 -0800 (PST)
Received: from [10.57.35.21] (unknown [10.57.35.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CF773F58B;
	Wed,  5 Feb 2025 07:56:00 -0800 (PST)
Message-ID: <ff16c183-0679-423c-939d-9906da174051@arm.com>
Date: Wed, 5 Feb 2025 15:55:58 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/19] iommu/pages: Replace iommu_free_pages() with
 iommu_free_page()
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
References: <5-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <5-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-02-04 6:34 pm, Jason Gunthorpe wrote:
> Now that we have a folio under the allocation iommu_free_page() can know
> the order of the original allocation and do the correct thing to free it.
> 
> Callers no longer need to pass in the allocation order to the free
> function. Just use iommu_free_page() everywhere.

Nit: we end up left with the _alloc_pages/_free_page combo which to me 
looks slightly odd and uncomfortable - any chance we could go the other 
way and align on _free_pages for consistency?

Thanks,
Robin.

> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/amd/init.c            | 28 +++++++++++-----------------
>   drivers/iommu/amd/ppr.c             |  2 +-
>   drivers/iommu/exynos-iommu.c        |  8 ++++----
>   drivers/iommu/intel/irq_remapping.c |  4 ++--
>   drivers/iommu/intel/pasid.c         |  3 +--
>   drivers/iommu/intel/pasid.h         |  1 -
>   drivers/iommu/intel/prq.c           |  4 ++--
>   drivers/iommu/io-pgtable-arm.c      |  4 ++--
>   drivers/iommu/io-pgtable-dart.c     | 10 ++++------
>   drivers/iommu/iommu-pages.h         | 14 ++------------
>   drivers/iommu/riscv/iommu.c         |  6 ++----
>   drivers/iommu/sun50i-iommu.c        |  2 +-
>   12 files changed, 32 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
> index c5cd92edada061..f1c5041647173c 100644
> --- a/drivers/iommu/amd/init.c
> +++ b/drivers/iommu/amd/init.c
> @@ -653,8 +653,7 @@ static inline int __init alloc_dev_table(struct amd_iommu_pci_seg *pci_seg)
>   
>   static inline void free_dev_table(struct amd_iommu_pci_seg *pci_seg)
>   {
> -	iommu_free_pages(pci_seg->dev_table,
> -			 get_order(pci_seg->dev_table_size));
> +	iommu_free_page(pci_seg->dev_table);
>   	pci_seg->dev_table = NULL;
>   }
>   
> @@ -671,8 +670,7 @@ static inline int __init alloc_rlookup_table(struct amd_iommu_pci_seg *pci_seg)
>   
>   static inline void free_rlookup_table(struct amd_iommu_pci_seg *pci_seg)
>   {
> -	iommu_free_pages(pci_seg->rlookup_table,
> -			 get_order(pci_seg->rlookup_table_size));
> +	iommu_free_page(pci_seg->rlookup_table);
>   	pci_seg->rlookup_table = NULL;
>   }
>   
> @@ -691,8 +689,7 @@ static inline int __init alloc_irq_lookup_table(struct amd_iommu_pci_seg *pci_se
>   static inline void free_irq_lookup_table(struct amd_iommu_pci_seg *pci_seg)
>   {
>   	kmemleak_free(pci_seg->irq_lookup_table);
> -	iommu_free_pages(pci_seg->irq_lookup_table,
> -			 get_order(pci_seg->rlookup_table_size));
> +	iommu_free_page(pci_seg->irq_lookup_table);
>   	pci_seg->irq_lookup_table = NULL;
>   }
>   
> @@ -716,8 +713,7 @@ static int __init alloc_alias_table(struct amd_iommu_pci_seg *pci_seg)
>   
>   static void __init free_alias_table(struct amd_iommu_pci_seg *pci_seg)
>   {
> -	iommu_free_pages(pci_seg->alias_table,
> -			 get_order(pci_seg->alias_table_size));
> +	iommu_free_page(pci_seg->alias_table);
>   	pci_seg->alias_table = NULL;
>   }
>   
> @@ -826,7 +822,7 @@ static void iommu_disable_command_buffer(struct amd_iommu *iommu)
>   
>   static void __init free_command_buffer(struct amd_iommu *iommu)
>   {
> -	iommu_free_pages(iommu->cmd_buf, get_order(CMD_BUFFER_SIZE));
> +	iommu_free_page(iommu->cmd_buf);
>   }
>   
>   void *__init iommu_alloc_4k_pages(struct amd_iommu *iommu, gfp_t gfp,
> @@ -838,7 +834,7 @@ void *__init iommu_alloc_4k_pages(struct amd_iommu *iommu, gfp_t gfp,
>   	if (buf &&
>   	    check_feature(FEATURE_SNP) &&
>   	    set_memory_4k((unsigned long)buf, (1 << order))) {
> -		iommu_free_pages(buf, order);
> +		iommu_free_page(buf);
>   		buf = NULL;
>   	}
>   
> @@ -882,14 +878,14 @@ static void iommu_disable_event_buffer(struct amd_iommu *iommu)
>   
>   static void __init free_event_buffer(struct amd_iommu *iommu)
>   {
> -	iommu_free_pages(iommu->evt_buf, get_order(EVT_BUFFER_SIZE));
> +	iommu_free_page(iommu->evt_buf);
>   }
>   
>   static void free_ga_log(struct amd_iommu *iommu)
>   {
>   #ifdef CONFIG_IRQ_REMAP
> -	iommu_free_pages(iommu->ga_log, get_order(GA_LOG_SIZE));
> -	iommu_free_pages(iommu->ga_log_tail, get_order(8));
> +	iommu_free_page(iommu->ga_log);
> +	iommu_free_page(iommu->ga_log_tail);
>   #endif
>   }
>   
> @@ -2781,8 +2777,7 @@ static void early_enable_iommus(void)
>   
>   		for_each_pci_segment(pci_seg) {
>   			if (pci_seg->old_dev_tbl_cpy != NULL) {
> -				iommu_free_pages(pci_seg->old_dev_tbl_cpy,
> -						 get_order(pci_seg->dev_table_size));
> +				iommu_free_page(pci_seg->old_dev_tbl_cpy);
>   				pci_seg->old_dev_tbl_cpy = NULL;
>   			}
>   		}
> @@ -2795,8 +2790,7 @@ static void early_enable_iommus(void)
>   		pr_info("Copied DEV table from previous kernel.\n");
>   
>   		for_each_pci_segment(pci_seg) {
> -			iommu_free_pages(pci_seg->dev_table,
> -					 get_order(pci_seg->dev_table_size));
> +			iommu_free_page(pci_seg->dev_table);
>   			pci_seg->dev_table = pci_seg->old_dev_tbl_cpy;
>   		}
>   
> diff --git a/drivers/iommu/amd/ppr.c b/drivers/iommu/amd/ppr.c
> index 7c67d69f0b8cad..0a7c32ab841707 100644
> --- a/drivers/iommu/amd/ppr.c
> +++ b/drivers/iommu/amd/ppr.c
> @@ -48,7 +48,7 @@ void amd_iommu_enable_ppr_log(struct amd_iommu *iommu)
>   
>   void __init amd_iommu_free_ppr_log(struct amd_iommu *iommu)
>   {
> -	iommu_free_pages(iommu->ppr_log, get_order(PPR_LOG_SIZE));
> +	iommu_free_page(iommu->ppr_log);
>   }
>   
>   /*
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index c666ecab955d21..3c64fcdde6d294 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -932,9 +932,9 @@ static struct iommu_domain *exynos_iommu_domain_alloc_paging(struct device *dev)
>   	return &domain->domain;
>   
>   err_lv2ent:
> -	iommu_free_pages(domain->lv2entcnt, 1);
> +	iommu_free_page(domain->lv2entcnt);
>   err_counter:
> -	iommu_free_pages(domain->pgtable, 2);
> +	iommu_free_page(domain->pgtable);
>   err_pgtable:
>   	kfree(domain);
>   	return NULL;
> @@ -975,8 +975,8 @@ static void exynos_iommu_domain_free(struct iommu_domain *iommu_domain)
>   					phys_to_virt(base));
>   		}
>   
> -	iommu_free_pages(domain->pgtable, 2);
> -	iommu_free_pages(domain->lv2entcnt, 1);
> +	iommu_free_page(domain->pgtable);
> +	iommu_free_page(domain->lv2entcnt);
>   	kfree(domain);
>   }
>   
> diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
> index ad795c772f21b5..31a170501d2410 100644
> --- a/drivers/iommu/intel/irq_remapping.c
> +++ b/drivers/iommu/intel/irq_remapping.c
> @@ -620,7 +620,7 @@ static int intel_setup_irq_remapping(struct intel_iommu *iommu)
>   out_free_bitmap:
>   	bitmap_free(bitmap);
>   out_free_pages:
> -	iommu_free_pages(ir_table_base, INTR_REMAP_PAGE_ORDER);
> +	iommu_free_page(ir_table_base);
>   out_free_table:
>   	kfree(ir_table);
>   
> @@ -641,7 +641,7 @@ static void intel_teardown_irq_remapping(struct intel_iommu *iommu)
>   			irq_domain_free_fwnode(fn);
>   			iommu->ir_domain = NULL;
>   		}
> -		iommu_free_pages(iommu->ir_table->base, INTR_REMAP_PAGE_ORDER);
> +		iommu_free_page(iommu->ir_table->base);
>   		bitmap_free(iommu->ir_table->bitmap);
>   		kfree(iommu->ir_table);
>   		iommu->ir_table = NULL;
> diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
> index fb59a7d35958f5..88070bb7f9b093 100644
> --- a/drivers/iommu/intel/pasid.c
> +++ b/drivers/iommu/intel/pasid.c
> @@ -67,7 +67,6 @@ int intel_pasid_alloc_table(struct device *dev)
>   	}
>   
>   	pasid_table->table = dir;
> -	pasid_table->order = order;
>   	pasid_table->max_pasid = 1 << (order + PAGE_SHIFT + 3);
>   	info->pasid_table = pasid_table;
>   
> @@ -100,7 +99,7 @@ void intel_pasid_free_table(struct device *dev)
>   		iommu_free_page(table);
>   	}
>   
> -	iommu_free_pages(pasid_table->table, pasid_table->order);
> +	iommu_free_page(pasid_table->table);
>   	kfree(pasid_table);
>   }
>   
> diff --git a/drivers/iommu/intel/pasid.h b/drivers/iommu/intel/pasid.h
> index 668d8ece6b143c..fd0fd1a0df84cc 100644
> --- a/drivers/iommu/intel/pasid.h
> +++ b/drivers/iommu/intel/pasid.h
> @@ -47,7 +47,6 @@ struct pasid_entry {
>   /* The representative of a PASID table */
>   struct pasid_table {
>   	void			*table;		/* pasid table pointer */
> -	int			order;		/* page order of pasid table */
>   	u32			max_pasid;	/* max pasid */
>   };
>   
> diff --git a/drivers/iommu/intel/prq.c b/drivers/iommu/intel/prq.c
> index c2d792db52c3e2..8620327b64394b 100644
> --- a/drivers/iommu/intel/prq.c
> +++ b/drivers/iommu/intel/prq.c
> @@ -338,7 +338,7 @@ int intel_iommu_enable_prq(struct intel_iommu *iommu)
>   	dmar_free_hwirq(irq);
>   	iommu->pr_irq = 0;
>   free_prq:
> -	iommu_free_pages(iommu->prq, PRQ_ORDER);
> +	iommu_free_page(iommu->prq);
>   	iommu->prq = NULL;
>   
>   	return ret;
> @@ -361,7 +361,7 @@ int intel_iommu_finish_prq(struct intel_iommu *iommu)
>   		iommu->iopf_queue = NULL;
>   	}
>   
> -	iommu_free_pages(iommu->prq, PRQ_ORDER);
> +	iommu_free_page(iommu->prq);
>   	iommu->prq = NULL;
>   
>   	return 0;
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 7632c80edea63a..b4c3729076376b 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -300,7 +300,7 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
>   	if (cfg->free)
>   		cfg->free(cookie, pages, size);
>   	else
> -		iommu_free_pages(pages, order);
> +		iommu_free_page(pages);
>   
>   	return NULL;
>   }
> @@ -316,7 +316,7 @@ static void __arm_lpae_free_pages(void *pages, size_t size,
>   	if (cfg->free)
>   		cfg->free(cookie, pages, size);
>   	else
> -		iommu_free_pages(pages, get_order(size));
> +		iommu_free_page(pages);
>   }
>   
>   static void __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries,
> diff --git a/drivers/iommu/io-pgtable-dart.c b/drivers/iommu/io-pgtable-dart.c
> index c004640640ee50..f7b939d4b7d0b9 100644
> --- a/drivers/iommu/io-pgtable-dart.c
> +++ b/drivers/iommu/io-pgtable-dart.c
> @@ -262,7 +262,7 @@ static int dart_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
>   
>   		pte = dart_install_table(cptep, ptep, 0, data);
>   		if (pte)
> -			iommu_free_pages(cptep, get_order(tblsz));
> +			iommu_free_page(cptep);
>   
>   		/* L2 table is present (now) */
>   		pte = READ_ONCE(*ptep);
> @@ -423,8 +423,7 @@ apple_dart_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
>   
>   out_free_data:
>   	while (--i >= 0) {
> -		iommu_free_pages(data->pgd[i],
> -				 get_order(DART_GRANULE(data)));
> +		iommu_free_page(data->pgd[i]);
>   	}
>   	kfree(data);
>   	return NULL;
> @@ -433,7 +432,6 @@ apple_dart_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
>   static void apple_dart_free_pgtable(struct io_pgtable *iop)
>   {
>   	struct dart_io_pgtable *data = io_pgtable_to_data(iop);
> -	int order = get_order(DART_GRANULE(data));
>   	dart_iopte *ptep, *end;
>   	int i;
>   
> @@ -445,9 +443,9 @@ static void apple_dart_free_pgtable(struct io_pgtable *iop)
>   			dart_iopte pte = *ptep++;
>   
>   			if (pte)
> -				iommu_free_pages(iopte_deref(pte, data), order);
> +				iommu_free_page(iopte_deref(pte, data));
>   		}
> -		iommu_free_pages(data->pgd[i], order);
> +		iommu_free_page(data->pgd[i]);
>   	}
>   
>   	kfree(data);
> diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
> index 26b91940bdc146..b15e0f85b3f739 100644
> --- a/drivers/iommu/iommu-pages.h
> +++ b/drivers/iommu/iommu-pages.h
> @@ -105,11 +105,10 @@ static inline void *iommu_alloc_page(gfp_t gfp)
>   }
>   
>   /**
> - * iommu_free_pages - free page of a given order
> + * iommu_free_page - free page of any  order
>    * @virt: virtual address of the page to be freed.
> - * @order: page order
>    */
> -static inline void iommu_free_pages(void *virt, int order)
> +static inline void iommu_free_page(void *virt)
>   {
>   	struct page *page;
>   
> @@ -121,15 +120,6 @@ static inline void iommu_free_pages(void *virt, int order)
>   	put_page(page);
>   }
>   
> -/**
> - * iommu_free_page - free page
> - * @virt: virtual address of the page to be freed.
> - */
> -static inline void iommu_free_page(void *virt)
> -{
> -	iommu_free_pages(virt, 0);
> -}
> -
>   /**
>    * iommu_put_pages_list - free a list of pages.
>    * @page: the head of the lru list to be freed.
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 8f049d4a0e2cb8..6e7df7273426da 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -48,14 +48,13 @@ static DEFINE_IDA(riscv_iommu_pscids);
>   /* Device resource-managed allocations */
>   struct riscv_iommu_devres {
>   	void *addr;
> -	int order;
>   };
>   
>   static void riscv_iommu_devres_pages_release(struct device *dev, void *res)
>   {
>   	struct riscv_iommu_devres *devres = res;
>   
> -	iommu_free_pages(devres->addr, devres->order);
> +	iommu_free_page(devres->addr);
>   }
>   
>   static int riscv_iommu_devres_pages_match(struct device *dev, void *res, void *p)
> @@ -80,12 +79,11 @@ static void *riscv_iommu_get_pages(struct riscv_iommu_device *iommu, int order)
>   			      sizeof(struct riscv_iommu_devres), GFP_KERNEL);
>   
>   	if (unlikely(!devres)) {
> -		iommu_free_pages(addr, order);
> +		iommu_free_page(addr);
>   		return NULL;
>   	}
>   
>   	devres->addr = addr;
> -	devres->order = order;
>   
>   	devres_add(iommu->dev, devres);
>   
> diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
> index 8d8f11854676c0..3d77aed8507373 100644
> --- a/drivers/iommu/sun50i-iommu.c
> +++ b/drivers/iommu/sun50i-iommu.c
> @@ -713,7 +713,7 @@ static void sun50i_iommu_domain_free(struct iommu_domain *domain)
>   {
>   	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
>   
> -	iommu_free_pages(sun50i_domain->dt, get_order(DT_SIZE));
> +	iommu_free_page(sun50i_domain->dt);
>   	sun50i_domain->dt = NULL;
>   
>   	kfree(sun50i_domain);



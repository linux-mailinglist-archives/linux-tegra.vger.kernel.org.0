Return-Path: <linux-tegra+bounces-5569-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 414BCA5DBCA
	for <lists+linux-tegra@lfdr.de>; Wed, 12 Mar 2025 12:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAE5F3B4B6B
	for <lists+linux-tegra@lfdr.de>; Wed, 12 Mar 2025 11:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E293623F384;
	Wed, 12 Mar 2025 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zyYCKhiH"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746F423F360
	for <linux-tegra@vger.kernel.org>; Wed, 12 Mar 2025 11:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741779828; cv=none; b=CorykfRrfWiaqmPTgLJDmLfVD6dFFWU11X4IvCDenYQoQfkI1Sju+Bi3yWJ0e3ndisZUifWD+c6pkQzi5snizpJuuVH0m9LMcE1LkE+WvvDYkMkqC4aRJDmOJcMAQbdnJAumNjq0sJ0HwTdTRdVLHyGh2FzC614T5eQH0QYcLoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741779828; c=relaxed/simple;
	bh=7gboenAv6OrtacWzeJCZKw6RXR/AWQp7Mq+8xfCCPFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M55Q3Y7B02wwjGV5k/onXKGVrtLT37yPQ5Dd7hwCFzfP7NYBknQR9ffrAgMoWuZl1EL8Wxp7IyUxv0eryySpt8bVG1oLow+VZA+QtigoQNyQs3m2epZ/D4/P2OuDHs6FoP46RKvbZxfwPXecnG4Yw4/qtaZYCHq3AUQ+UNShsPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zyYCKhiH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-438d9c391fcso40835e9.0
        for <linux-tegra@vger.kernel.org>; Wed, 12 Mar 2025 04:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741779825; x=1742384625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bi4vdjvAcyXpRkVhBCReFuDutZvzBYwW8TjvCR3hMi8=;
        b=zyYCKhiHVBCIQmA4T/BYMe2Y8UeZTs8Z6r3QALgqQJIxT2KQtKIuepKuLVHr9v8125
         bRNWB5NTYANOEmvoYT3kovpRFFEYenuVoFVpgb1JHkIzHp9lTqaZa8FFoqz7V/9FXmoa
         8fAbDU/WVkwWB81NuLKnEoqLgtVribZUeSAukwyAaYGUhWbxb+rDyzxUn/SePZWBdxYY
         0rJsDuqJ/8jAB5p76bLQ6ipvLPfueyhe0cj8qAh37RynLxayPMvNirieoRhZeG5ZAAfB
         FkRCMRq6o/r8asZHfiBWX53Dsu0F4CzdeoxCRQxlu+6/8xiaIPvwWwFV3tTiIn4pQ6n0
         CrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741779825; x=1742384625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bi4vdjvAcyXpRkVhBCReFuDutZvzBYwW8TjvCR3hMi8=;
        b=TYQVw6BGFn0nub6QpzHgrYIS5NALijHgDDKqeBaUqQH2Qag1JA03zAXj4bvCdO9KE1
         m4c0o9hDkLzohK4AZhByT00Vjh9o/pbpU47GYdXdZncUe6i99bXJ98P2dwnTmNA5aNOF
         42QnpeLa9SjN4eQ4MdOm9+nZ0FfUwBIKjecnUEMq85kfwNEmCBOUtnEDI+O4s3XqBGcw
         K7fFeF7clqv4Bhh8CsWfGpaxF7RncTxm0e8udakc8LB0IizlWWIsPqNgfUXDSonOxWhF
         3lOgRAsYrO9bqqT2WN6dNFxurgbR6cTugqTYwaozsxnuotFezkjGv4UMcQsgfW5lTFA+
         mN2g==
X-Forwarded-Encrypted: i=1; AJvYcCXPKroT4geLEMCg2HJIonfdQKN5HgtUh98k318gEdldJlXfoBhXm8ttwh/b8+0GT9tpeIbm+3jM5wrKQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHubHkGfLyz5LXxNXRVQ8U3NutBXAhTyuFK+0dQ1avtZABz7TK
	Z+ooryuALVvbJ5srUM8ZtPVC/ljfWaQlRjXGHEmTMD2076DmkzMIl8R8jEwRCA==
X-Gm-Gg: ASbGnct2h3lm5M9BgqS9uwvnNs28STd/l006cdcvxglfzF4zTJ3XWDxnKU8K/JvMeOG
	Y6fPoDM3s5oJgh35MdmIAmRxXo+u1IuO63RpskDBooKUEYjDesbQbuO5Cb9iT4cBJdBhsxx2Wrg
	pjcG6beknB9Sd4b8+7wDL9/3sxDAu0D9m17d17zfg3uEfpRdpIUeHXxbG9QcK/z14508tEY4qu/
	1P2GL5+FzK+EwFvJCuuH9MdFXCUaROLZDELDqgpfDh73HxgYmOo3vGgP68w4unj8Q8KnWd6rHki
	0Dsv2vRLCNdQJmJ6CJeX+rVCiHyyWcTQBB2GnPF3Kp0eLso8Xr1s/5rSwt4XW3txCODKAOVvvZJ
	XOvE6
X-Google-Smtp-Source: AGHT+IG3o5aXTDR0BrAiPLvftUp6isSo43deyO/b1vdYnYY8WdbQC3VpOkUuzae6W2VaT6LjXw2VSg==
X-Received: by 2002:a05:600c:c84:b0:43b:c396:7405 with SMTP id 5b1f17b1804b1-43d0a5fd606mr1025755e9.7.1741779824514;
        Wed, 12 Mar 2025 04:43:44 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a74cfa5sm18804915e9.10.2025.03.12.04.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 04:43:43 -0700 (PDT)
Date: Wed, 12 Mar 2025 11:43:39 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 05/23] iommu/pages: Remove the order argument to
 iommu_free_pages()
Message-ID: <Z9FzazECgXgE8TNX@google.com>
References: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <5-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>

On Tue, Feb 25, 2025 at 03:39:22PM -0400, Jason Gunthorpe wrote:
> Now that we have a folio under the allocation iommu_free_pages() can know
> the order of the original allocation and do the correct thing to free it.
> 
> The next patch will rename iommu_free_page() to iommu_free_pages() so we
> have naming consistency with iommu_alloc_pages_node().
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>

> ---
>  drivers/iommu/amd/init.c            | 28 +++++++++++-----------------
>  drivers/iommu/amd/ppr.c             |  2 +-
>  drivers/iommu/exynos-iommu.c        |  8 ++++----
>  drivers/iommu/intel/irq_remapping.c |  4 ++--
>  drivers/iommu/intel/pasid.c         |  3 +--
>  drivers/iommu/intel/pasid.h         |  1 -
>  drivers/iommu/intel/prq.c           |  4 ++--
>  drivers/iommu/io-pgtable-arm.c      |  4 ++--
>  drivers/iommu/io-pgtable-dart.c     | 10 ++++------
>  drivers/iommu/iommu-pages.h         |  9 +++++----
>  drivers/iommu/riscv/iommu.c         |  6 ++----
>  drivers/iommu/sun50i-iommu.c        |  2 +-
>  12 files changed, 35 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
> index c5cd92edada061..f47ff0e0c75f4e 100644
> --- a/drivers/iommu/amd/init.c
> +++ b/drivers/iommu/amd/init.c
> @@ -653,8 +653,7 @@ static inline int __init alloc_dev_table(struct amd_iommu_pci_seg *pci_seg)
>  
>  static inline void free_dev_table(struct amd_iommu_pci_seg *pci_seg)
>  {
> -	iommu_free_pages(pci_seg->dev_table,
> -			 get_order(pci_seg->dev_table_size));
> +	iommu_free_pages(pci_seg->dev_table);
>  	pci_seg->dev_table = NULL;
>  }
>  
> @@ -671,8 +670,7 @@ static inline int __init alloc_rlookup_table(struct amd_iommu_pci_seg *pci_seg)
>  
>  static inline void free_rlookup_table(struct amd_iommu_pci_seg *pci_seg)
>  {
> -	iommu_free_pages(pci_seg->rlookup_table,
> -			 get_order(pci_seg->rlookup_table_size));
> +	iommu_free_pages(pci_seg->rlookup_table);
>  	pci_seg->rlookup_table = NULL;
>  }
>  
> @@ -691,8 +689,7 @@ static inline int __init alloc_irq_lookup_table(struct amd_iommu_pci_seg *pci_se
>  static inline void free_irq_lookup_table(struct amd_iommu_pci_seg *pci_seg)
>  {
>  	kmemleak_free(pci_seg->irq_lookup_table);
> -	iommu_free_pages(pci_seg->irq_lookup_table,
> -			 get_order(pci_seg->rlookup_table_size));
> +	iommu_free_pages(pci_seg->irq_lookup_table);
>  	pci_seg->irq_lookup_table = NULL;
>  }
>  
> @@ -716,8 +713,7 @@ static int __init alloc_alias_table(struct amd_iommu_pci_seg *pci_seg)
>  
>  static void __init free_alias_table(struct amd_iommu_pci_seg *pci_seg)
>  {
> -	iommu_free_pages(pci_seg->alias_table,
> -			 get_order(pci_seg->alias_table_size));
> +	iommu_free_pages(pci_seg->alias_table);
>  	pci_seg->alias_table = NULL;
>  }
>  
> @@ -826,7 +822,7 @@ static void iommu_disable_command_buffer(struct amd_iommu *iommu)
>  
>  static void __init free_command_buffer(struct amd_iommu *iommu)
>  {
> -	iommu_free_pages(iommu->cmd_buf, get_order(CMD_BUFFER_SIZE));
> +	iommu_free_pages(iommu->cmd_buf);
>  }
>  
>  void *__init iommu_alloc_4k_pages(struct amd_iommu *iommu, gfp_t gfp,
> @@ -838,7 +834,7 @@ void *__init iommu_alloc_4k_pages(struct amd_iommu *iommu, gfp_t gfp,
>  	if (buf &&
>  	    check_feature(FEATURE_SNP) &&
>  	    set_memory_4k((unsigned long)buf, (1 << order))) {
> -		iommu_free_pages(buf, order);
> +		iommu_free_pages(buf);
>  		buf = NULL;
>  	}
>  
> @@ -882,14 +878,14 @@ static void iommu_disable_event_buffer(struct amd_iommu *iommu)
>  
>  static void __init free_event_buffer(struct amd_iommu *iommu)
>  {
> -	iommu_free_pages(iommu->evt_buf, get_order(EVT_BUFFER_SIZE));
> +	iommu_free_pages(iommu->evt_buf);
>  }
>  
>  static void free_ga_log(struct amd_iommu *iommu)
>  {
>  #ifdef CONFIG_IRQ_REMAP
> -	iommu_free_pages(iommu->ga_log, get_order(GA_LOG_SIZE));
> -	iommu_free_pages(iommu->ga_log_tail, get_order(8));
> +	iommu_free_pages(iommu->ga_log);
> +	iommu_free_pages(iommu->ga_log_tail);
>  #endif
>  }
>  
> @@ -2781,8 +2777,7 @@ static void early_enable_iommus(void)
>  
>  		for_each_pci_segment(pci_seg) {
>  			if (pci_seg->old_dev_tbl_cpy != NULL) {
> -				iommu_free_pages(pci_seg->old_dev_tbl_cpy,
> -						 get_order(pci_seg->dev_table_size));
> +				iommu_free_pages(pci_seg->old_dev_tbl_cpy);
>  				pci_seg->old_dev_tbl_cpy = NULL;
>  			}
>  		}
> @@ -2795,8 +2790,7 @@ static void early_enable_iommus(void)
>  		pr_info("Copied DEV table from previous kernel.\n");
>  
>  		for_each_pci_segment(pci_seg) {
> -			iommu_free_pages(pci_seg->dev_table,
> -					 get_order(pci_seg->dev_table_size));
> +			iommu_free_pages(pci_seg->dev_table);
>  			pci_seg->dev_table = pci_seg->old_dev_tbl_cpy;
>  		}
>  
> diff --git a/drivers/iommu/amd/ppr.c b/drivers/iommu/amd/ppr.c
> index 7c67d69f0b8cad..e6767c057d01fa 100644
> --- a/drivers/iommu/amd/ppr.c
> +++ b/drivers/iommu/amd/ppr.c
> @@ -48,7 +48,7 @@ void amd_iommu_enable_ppr_log(struct amd_iommu *iommu)
>  
>  void __init amd_iommu_free_ppr_log(struct amd_iommu *iommu)
>  {
> -	iommu_free_pages(iommu->ppr_log, get_order(PPR_LOG_SIZE));
> +	iommu_free_pages(iommu->ppr_log);
>  }
>  
>  /*
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index c666ecab955d21..1019e08b43b71c 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -932,9 +932,9 @@ static struct iommu_domain *exynos_iommu_domain_alloc_paging(struct device *dev)
>  	return &domain->domain;
>  
>  err_lv2ent:
> -	iommu_free_pages(domain->lv2entcnt, 1);
> +	iommu_free_pages(domain->lv2entcnt);
>  err_counter:
> -	iommu_free_pages(domain->pgtable, 2);
> +	iommu_free_pages(domain->pgtable);
>  err_pgtable:
>  	kfree(domain);
>  	return NULL;
> @@ -975,8 +975,8 @@ static void exynos_iommu_domain_free(struct iommu_domain *iommu_domain)
>  					phys_to_virt(base));
>  		}
>  
> -	iommu_free_pages(domain->pgtable, 2);
> -	iommu_free_pages(domain->lv2entcnt, 1);
> +	iommu_free_pages(domain->pgtable);
> +	iommu_free_pages(domain->lv2entcnt);
>  	kfree(domain);
>  }
>  
> diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
> index ad795c772f21b5..d6b796f8f100cd 100644
> --- a/drivers/iommu/intel/irq_remapping.c
> +++ b/drivers/iommu/intel/irq_remapping.c
> @@ -620,7 +620,7 @@ static int intel_setup_irq_remapping(struct intel_iommu *iommu)
>  out_free_bitmap:
>  	bitmap_free(bitmap);
>  out_free_pages:
> -	iommu_free_pages(ir_table_base, INTR_REMAP_PAGE_ORDER);
> +	iommu_free_pages(ir_table_base);
>  out_free_table:
>  	kfree(ir_table);
>  
> @@ -641,7 +641,7 @@ static void intel_teardown_irq_remapping(struct intel_iommu *iommu)
>  			irq_domain_free_fwnode(fn);
>  			iommu->ir_domain = NULL;
>  		}
> -		iommu_free_pages(iommu->ir_table->base, INTR_REMAP_PAGE_ORDER);
> +		iommu_free_pages(iommu->ir_table->base);
>  		bitmap_free(iommu->ir_table->bitmap);
>  		kfree(iommu->ir_table);
>  		iommu->ir_table = NULL;
> diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
> index fb59a7d35958f5..00da94b1c4c907 100644
> --- a/drivers/iommu/intel/pasid.c
> +++ b/drivers/iommu/intel/pasid.c
> @@ -67,7 +67,6 @@ int intel_pasid_alloc_table(struct device *dev)
>  	}
>  
>  	pasid_table->table = dir;
> -	pasid_table->order = order;
>  	pasid_table->max_pasid = 1 << (order + PAGE_SHIFT + 3);
>  	info->pasid_table = pasid_table;
>  
> @@ -100,7 +99,7 @@ void intel_pasid_free_table(struct device *dev)
>  		iommu_free_page(table);
>  	}
>  
> -	iommu_free_pages(pasid_table->table, pasid_table->order);
> +	iommu_free_pages(pasid_table->table);
>  	kfree(pasid_table);
>  }
>  
> diff --git a/drivers/iommu/intel/pasid.h b/drivers/iommu/intel/pasid.h
> index 668d8ece6b143c..fd0fd1a0df84cc 100644
> --- a/drivers/iommu/intel/pasid.h
> +++ b/drivers/iommu/intel/pasid.h
> @@ -47,7 +47,6 @@ struct pasid_entry {
>  /* The representative of a PASID table */
>  struct pasid_table {
>  	void			*table;		/* pasid table pointer */
> -	int			order;		/* page order of pasid table */
>  	u32			max_pasid;	/* max pasid */
>  };
>  
> diff --git a/drivers/iommu/intel/prq.c b/drivers/iommu/intel/prq.c
> index c2d792db52c3e2..01ecafed31453c 100644
> --- a/drivers/iommu/intel/prq.c
> +++ b/drivers/iommu/intel/prq.c
> @@ -338,7 +338,7 @@ int intel_iommu_enable_prq(struct intel_iommu *iommu)
>  	dmar_free_hwirq(irq);
>  	iommu->pr_irq = 0;
>  free_prq:
> -	iommu_free_pages(iommu->prq, PRQ_ORDER);
> +	iommu_free_pages(iommu->prq);
>  	iommu->prq = NULL;
>  
>  	return ret;
> @@ -361,7 +361,7 @@ int intel_iommu_finish_prq(struct intel_iommu *iommu)
>  		iommu->iopf_queue = NULL;
>  	}
>  
> -	iommu_free_pages(iommu->prq, PRQ_ORDER);
> +	iommu_free_pages(iommu->prq);
>  	iommu->prq = NULL;
>  
>  	return 0;
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 7632c80edea63a..62df2528d020b2 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -300,7 +300,7 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
>  	if (cfg->free)
>  		cfg->free(cookie, pages, size);
>  	else
> -		iommu_free_pages(pages, order);
> +		iommu_free_pages(pages);
>  
>  	return NULL;
>  }
> @@ -316,7 +316,7 @@ static void __arm_lpae_free_pages(void *pages, size_t size,
>  	if (cfg->free)
>  		cfg->free(cookie, pages, size);
>  	else
> -		iommu_free_pages(pages, get_order(size));
> +		iommu_free_pages(pages);
>  }
>  
>  static void __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries,
> diff --git a/drivers/iommu/io-pgtable-dart.c b/drivers/iommu/io-pgtable-dart.c
> index c004640640ee50..7efcaea0bd5c86 100644
> --- a/drivers/iommu/io-pgtable-dart.c
> +++ b/drivers/iommu/io-pgtable-dart.c
> @@ -262,7 +262,7 @@ static int dart_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
>  
>  		pte = dart_install_table(cptep, ptep, 0, data);
>  		if (pte)
> -			iommu_free_pages(cptep, get_order(tblsz));
> +			iommu_free_pages(cptep);
>  
>  		/* L2 table is present (now) */
>  		pte = READ_ONCE(*ptep);
> @@ -423,8 +423,7 @@ apple_dart_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
>  
>  out_free_data:
>  	while (--i >= 0) {
> -		iommu_free_pages(data->pgd[i],
> -				 get_order(DART_GRANULE(data)));
> +		iommu_free_pages(data->pgd[i]);
>  	}
>  	kfree(data);
>  	return NULL;
> @@ -433,7 +432,6 @@ apple_dart_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
>  static void apple_dart_free_pgtable(struct io_pgtable *iop)
>  {
>  	struct dart_io_pgtable *data = io_pgtable_to_data(iop);
> -	int order = get_order(DART_GRANULE(data));
>  	dart_iopte *ptep, *end;
>  	int i;
>  
> @@ -445,9 +443,9 @@ static void apple_dart_free_pgtable(struct io_pgtable *iop)
>  			dart_iopte pte = *ptep++;
>  
>  			if (pte)
> -				iommu_free_pages(iopte_deref(pte, data), order);
> +				iommu_free_pages(iopte_deref(pte, data));
>  		}
> -		iommu_free_pages(data->pgd[i], order);
> +		iommu_free_pages(data->pgd[i]);
>  	}
>  
>  	kfree(data);
> diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
> index 26b91940bdc146..88587da1782b94 100644
> --- a/drivers/iommu/iommu-pages.h
> +++ b/drivers/iommu/iommu-pages.h
> @@ -105,11 +105,12 @@ static inline void *iommu_alloc_page(gfp_t gfp)
>  }
>  
>  /**
> - * iommu_free_pages - free page of a given order
> + * iommu_free_pages - free pages
>   * @virt: virtual address of the page to be freed.
> - * @order: page order
> + *
> + * The page must have have been allocated by iommu_alloc_pages_node()
>   */
> -static inline void iommu_free_pages(void *virt, int order)
> +static inline void iommu_free_pages(void *virt)
>  {
>  	struct page *page;
>  
> @@ -127,7 +128,7 @@ static inline void iommu_free_pages(void *virt, int order)
>   */
>  static inline void iommu_free_page(void *virt)
>  {
> -	iommu_free_pages(virt, 0);
> +	iommu_free_pages(virt);
>  }
>  
>  /**
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 8f049d4a0e2cb8..1868468d018a28 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -48,14 +48,13 @@ static DEFINE_IDA(riscv_iommu_pscids);
>  /* Device resource-managed allocations */
>  struct riscv_iommu_devres {
>  	void *addr;
> -	int order;
>  };
>  
>  static void riscv_iommu_devres_pages_release(struct device *dev, void *res)
>  {
>  	struct riscv_iommu_devres *devres = res;
>  
> -	iommu_free_pages(devres->addr, devres->order);
> +	iommu_free_pages(devres->addr);
>  }
>  
>  static int riscv_iommu_devres_pages_match(struct device *dev, void *res, void *p)
> @@ -80,12 +79,11 @@ static void *riscv_iommu_get_pages(struct riscv_iommu_device *iommu, int order)
>  			      sizeof(struct riscv_iommu_devres), GFP_KERNEL);
>  
>  	if (unlikely(!devres)) {
> -		iommu_free_pages(addr, order);
> +		iommu_free_pages(addr);
>  		return NULL;
>  	}
>  
>  	devres->addr = addr;
> -	devres->order = order;
>  
>  	devres_add(iommu->dev, devres);
>  
> diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
> index 8d8f11854676c0..6385560dbc3fb0 100644
> --- a/drivers/iommu/sun50i-iommu.c
> +++ b/drivers/iommu/sun50i-iommu.c
> @@ -713,7 +713,7 @@ static void sun50i_iommu_domain_free(struct iommu_domain *domain)
>  {
>  	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
>  
> -	iommu_free_pages(sun50i_domain->dt, get_order(DT_SIZE));
> +	iommu_free_pages(sun50i_domain->dt);
>  	sun50i_domain->dt = NULL;
>  
>  	kfree(sun50i_domain);
> -- 
> 2.43.0
> 


Return-Path: <linux-tegra+bounces-6274-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC46AA1C1A
	for <lists+linux-tegra@lfdr.de>; Tue, 29 Apr 2025 22:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C4FE4686EB
	for <lists+linux-tegra@lfdr.de>; Tue, 29 Apr 2025 20:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2F8267B6F;
	Tue, 29 Apr 2025 20:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m84/JFgG"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554CF259C9D
	for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 20:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745958287; cv=none; b=o+dKIO+B+yRma3TL14q8K0WQrjpYh/1XE7aSnIFqNHwm8sxBhpcY88BRTCqmdwyEYrTKNzdlFQ7JvXRT9qmCXiVfQeWgagF5OA8kb/VwGe6vMtGci3AVjNIEzckQ61VOb0c7LRc0hK03bl50rP7PaOS6VIAX3YPKK7dVlSStrcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745958287; c=relaxed/simple;
	bh=9O+6WTpy0xx60kojalMCZT1tuZWqKS2nTsLIZ0rjn3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZn+AZw4m+vKRRmtBnG05pjQC626z9obNrM0+HJoyG0AFRLIU+DxqetNIfyWKpXwWkPqZ8yzRru5wWAQnKCFj9elZyVD0vXI1xGwpNiqNTmejp+JwA/OgGny1SHZKhcxPvW55aW9yE4O+6GDPS8/4VPc7nexBwtmu1NTX+BZjtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m84/JFgG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2263428c8baso69185ad.1
        for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 13:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745958284; x=1746563084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=th0orYzeEy2a+Bk04Qy69a62SaixG+OtsUq4sJ7ZV0s=;
        b=m84/JFgGwyvqX7UATwGkil1sjv6jc7VBdEhHe3AUUKM5PejLJattORAk0zLYhPSuz/
         EkDL38vIQoo3QBQcL2MsCMjfxcmrXY3oX8zRhRrhPY1jFQSoSS23aQIXO9x1W1r1sh7F
         0B8e4flob4SWIcQNce7MGKw06lsmegNGHDvUn/EVEJSZvRXjT359Z076SLNq4TXHWyO8
         ZumSIJ7yewu/2iCmZbUqCh4VF9gmk4kFfvj+DmUeZBLFnBBUK2sNZy8aKJxCnmRRp2nq
         pQTf1Rv2bkeo2qAVAIZVn+kZElGzUMOPg7DZ7Jc2KVfXNLy9Ha4we3jA3ju/hM9bechI
         aEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745958284; x=1746563084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th0orYzeEy2a+Bk04Qy69a62SaixG+OtsUq4sJ7ZV0s=;
        b=mMHR444hXeje5BQu64XvY2TWZAQYS8RdPF/7lJSi4KChWQDYlgqnk1av9aO9emywoU
         VC2KwkxLhV8cMkaF9uSYxN45R3T4bRe6e5hkVAuw7+fImuB49MWqUmCo3L75Q7efnjkv
         zQv4CHNmOCR3lTzgTNXmlT5ejgO7xw9BgoGKDOtKI/PhaUvwgiEBkqfbIm/qTO+o83uF
         MPSjmvV4Fm5gU8v9l8acqWUG3+OiJZqYGD6TQZgP7ak/LJl1NQiHHW+gSLIqVD0v/33y
         dwWLPc7mPZYMIwY9yfdw7kGiHr6H+WWPRpl7FTUYCwNNU+b83YqDTXhoP0aKB6ggxTUV
         VEKA==
X-Forwarded-Encrypted: i=1; AJvYcCWsNzr1+JJKueCW14/27A2xrMgTqj7mer1t7pGVHey7SkQw0qLYb/rlRStyp8pp3Jg9GnvRu2GxmxI4uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeQF8Rna5367ykrxBbPh/HQ+hVmv1iX9VXUu5NjC3dlelOMUB3
	8vjG1NQvN4/rCAtxIgaDqtVZG55LgecNbxoTh0HRashsm6qs64GwpXNP0J51Vw==
X-Gm-Gg: ASbGncuH5CyYJwkUqA+4ybeW+Xql+2YcYZBjeiRPUxSu9mvMejn12tsVAdemxZQh12J
	Ky0lt9aBKWRp64P9H9ZqKGuFshcqdSBNsLN3v98NtoTAqaASF9N/v0eGDJTG++Q5hevoqg8G4qS
	qoOsf8c3UakK/f6FCUKbxlxQ3D/u7pw2Ii/uQuufCrLKs4muuceB7iOKKX7h+YdsOgVKNxC1y1j
	f8SzE9zcTd6OE9Mv1JfPKOg3JCXOC7tUX2wx+ypkjOQv9tehA7BjH1DDCOgRTpXotTcEBAAqXsV
	rMkfxUV8tOr87Yz0ZLgPTSOnP9csac5JV8bK9wdnjnsfajPYSP0dChuQHSpD2vDkRUJ76Rpw
X-Google-Smtp-Source: AGHT+IFEmxdIWmGebHZgDe3BPjAbf4Gr2zvdjQF+sAsv0SidwYPT51jhJKxYdYkU6a4RRgjjfiLv+w==
X-Received: by 2002:a17:902:e746:b0:215:aca2:dc04 with SMTP id d9443c01a7336-22df4075fa8mr719485ad.26.1745958284303;
        Tue, 29 Apr 2025 13:24:44 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a5e09bsm100828b3a.131.2025.04.29.13.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 13:24:43 -0700 (PDT)
Date: Tue, 29 Apr 2025 20:24:33 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 13/22] iommufd: Add mmap interface
Message-ID: <aBE1gUz9y415EuBQ@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7be26560c604b0cbc2fd218997b97a47e4ed11ff.1745646960.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7be26560c604b0cbc2fd218997b97a47e4ed11ff.1745646960.git.nicolinc@nvidia.com>

On Fri, Apr 25, 2025 at 10:58:08PM -0700, Nicolin Chen wrote:
> For vIOMMU passing through HW resources to user space (VMs), add an mmap
> infrastructure to map a region of hardware MMIO pages.
> 
> Maintain an mt_mmap per ictx for validations. To allow IOMMU drivers to
> add and delete mmappable regions to/from the mt_mmap, add a pair of new
> helpers: iommufd_ctx_alloc_mmap() and iommufd_ctx_free_mmap().
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h |  8 +++++
>  include/linux/iommufd.h                 | 15 ++++++++++
>  drivers/iommu/iommufd/driver.c          | 39 +++++++++++++++++++++++++
>  drivers/iommu/iommufd/main.c            | 39 +++++++++++++++++++++++++
>  4 files changed, 101 insertions(+)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index b974c207ae8a..db5b62ec4abb 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -7,6 +7,7 @@
>  #include <linux/iommu.h>
>  #include <linux/iommufd.h>
>  #include <linux/iova_bitmap.h>
> +#include <linux/maple_tree.h>
>  #include <linux/rwsem.h>
>  #include <linux/uaccess.h>
>  #include <linux/xarray.h>
> @@ -44,6 +45,7 @@ struct iommufd_ctx {
>  	struct xarray groups;
>  	wait_queue_head_t destroy_wait;
>  	struct rw_semaphore ioas_creation_lock;
> +	struct maple_tree mt_mmap;
>  
>  	struct mutex sw_msi_lock;
>  	struct list_head sw_msi_list;
> @@ -55,6 +57,12 @@ struct iommufd_ctx {
>  	struct iommufd_ioas *vfio_ioas;
>  };
>  
> +/* Entry for iommufd_ctx::mt_mmap */
> +struct iommufd_mmap {
> +	unsigned long pfn_start;
> +	unsigned long pfn_end;
> +};
> +
>  /*
>   * The IOVA to PFN map. The map automatically copies the PFNs into multiple
>   * domains and permits sharing of PFNs between io_pagetable instances. This
> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index 5dff154e8ce1..d63e2d91be0d 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -236,6 +236,9 @@ int iommufd_object_depend(struct iommufd_object *obj_dependent,
>  			  struct iommufd_object *obj_depended);
>  void iommufd_object_undepend(struct iommufd_object *obj_dependent,
>  			     struct iommufd_object *obj_depended);
> +int iommufd_ctx_alloc_mmap(struct iommufd_ctx *ictx, phys_addr_t base,
> +			   size_t size, unsigned long *immap_id);
> +void iommufd_ctx_free_mmap(struct iommufd_ctx *ictx, unsigned long immap_id);
>  struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
>  				       unsigned long vdev_id);
>  int iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
> @@ -262,11 +265,23 @@ static inline int iommufd_object_depend(struct iommufd_object *obj_dependent,
>  	return -EOPNOTSUPP;
>  }
>  
> +static inline int iommufd_ctx_alloc_mmap(struct iommufd_ctx *ictx,
> +					 phys_addr_t base, size_t size,
> +					 unsigned long *immap_id)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
>  static inline void iommufd_object_undepend(struct iommufd_object *obj_dependent,
>  					   struct iommufd_object *obj_depended)
>  {
>  }
>  
> +static inline void iommufd_ctx_free_mmap(struct iommufd_ctx *ictx,
> +					 unsigned long immap_id)
> +{
> +}
> +
>  static inline struct device *
>  iommufd_viommu_find_dev(struct iommufd_viommu *viommu, unsigned long vdev_id)
>  {
> diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
> index fb7f8fe40f95..c55336c580dc 100644
> --- a/drivers/iommu/iommufd/driver.c
> +++ b/drivers/iommu/iommufd/driver.c
> @@ -78,6 +78,45 @@ void iommufd_object_undepend(struct iommufd_object *obj_dependent,
>  }
>  EXPORT_SYMBOL_NS_GPL(iommufd_object_undepend, "IOMMUFD");
>  
> +/* Driver should report the output @immap_id to user space for mmap() syscall */
> +int iommufd_ctx_alloc_mmap(struct iommufd_ctx *ictx, phys_addr_t base,
> +			   size_t size, unsigned long *immap_id)
> +{
> +	struct iommufd_mmap *immap;
> +	int rc;
> +
> +	if (WARN_ON_ONCE(!immap_id))
> +		return -EINVAL;
> +	if (base & ~PAGE_MASK)
> +		return -EINVAL;
> +	if (!size || size & ~PAGE_MASK)
> +		return -EINVAL;
> +
> +	immap = kzalloc(sizeof(*immap), GFP_KERNEL);
> +	if (!immap)
> +		return -ENOMEM;
> +	immap->pfn_start = base >> PAGE_SHIFT;
> +	immap->pfn_end = immap->pfn_start + (size >> PAGE_SHIFT) - 1;
> +
> +	rc = mtree_alloc_range(&ictx->mt_mmap, immap_id, immap, sizeof(immap),

I believe this should be sizeof(*immap) ?

> +			       0, LONG_MAX >> PAGE_SHIFT, GFP_KERNEL);
> +	if (rc < 0) {
> +		kfree(immap);
> +		return rc;
> +	}
> +
> +	/* mmap() syscall will right-shift the immap_id to vma->vm_pgoff */
> +	*immap_id <<= PAGE_SHIFT;
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(iommufd_ctx_alloc_mmap, "IOMMUFD");
> +
> +void iommufd_ctx_free_mmap(struct iommufd_ctx *ictx, unsigned long immap_id)
> +{
> +	kfree(mtree_erase(&ictx->mt_mmap, immap_id >> PAGE_SHIFT));
> +}
> +EXPORT_SYMBOL_NS_GPL(iommufd_ctx_free_mmap, "IOMMUFD");
> +
>  /* Caller should xa_lock(&viommu->vdevs) to protect the return value */
>  struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
>  				       unsigned long vdev_id)
> diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
> index ac51d5cfaa61..4b46ea47164d 100644
> --- a/drivers/iommu/iommufd/main.c
> +++ b/drivers/iommu/iommufd/main.c
> @@ -213,6 +213,7 @@ static int iommufd_fops_open(struct inode *inode, struct file *filp)
>  	xa_init_flags(&ictx->objects, XA_FLAGS_ALLOC1 | XA_FLAGS_ACCOUNT);
>  	xa_init(&ictx->groups);
>  	ictx->file = filp;
> +	mt_init_flags(&ictx->mt_mmap, MT_FLAGS_ALLOC_RANGE);
>  	init_waitqueue_head(&ictx->destroy_wait);
>  	mutex_init(&ictx->sw_msi_lock);
>  	INIT_LIST_HEAD(&ictx->sw_msi_list);
> @@ -410,11 +411,49 @@ static long iommufd_fops_ioctl(struct file *filp, unsigned int cmd,
>  	return ret;
>  }
>  
> +/*
> + * Kernel driver must first do iommufd_ctx_alloc_mmap() to register an mmappable
> + * MMIO region to the iommufd core to receive an "immap_id". Then, driver should
> + * report to user space this immap_id and the size of the registered MMIO region
> + * for @vm_pgoff and @size of an mmap() call, via an IOMMU_VIOMMU_ALLOC ioctl in
> + * the output fields of its driver-type data structure.
> + *
> + * Note the @size is allowed to be smaller than the registered size as a partial
> + * mmap starting from the registered base address.
> + */
> +static int iommufd_fops_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +	struct iommufd_ctx *ictx = filp->private_data;
> +	size_t size = vma->vm_end - vma->vm_start;
> +	struct iommufd_mmap *immap;
> +
> +	if (size & ~PAGE_MASK)
> +		return -EINVAL;
> +	if (!(vma->vm_flags & VM_SHARED))
> +		return -EINVAL;
> +	if (vma->vm_flags & VM_EXEC)
> +		return -EPERM;
> +
> +	/* vm_pgoff carries an index (immap_id) to an mtree entry (immap) */
> +	immap = mtree_load(&ictx->mt_mmap, vma->vm_pgoff);
> +	if (!immap)
> +		return -ENXIO;
> +	if (size >> PAGE_SHIFT > immap->pfn_end - immap->pfn_start + 1)
> +		return -ENXIO;
> +
> +	vma->vm_pgoff = 0;
> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO);
> +	return remap_pfn_range(vma, vma->vm_start, immap->pfn_start, size,
> +			       vma->vm_page_prot);
> +}
> +
>  static const struct file_operations iommufd_fops = {
>  	.owner = THIS_MODULE,
>  	.open = iommufd_fops_open,
>  	.release = iommufd_fops_release,
>  	.unlocked_ioctl = iommufd_fops_ioctl,
> +	.mmap = iommufd_fops_mmap,
>  };
>  
>  /**

Thanks,
Praan

> -- 
> 2.43.0
> 


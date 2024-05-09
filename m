Return-Path: <linux-tegra+bounces-2221-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A48168C150F
	for <lists+linux-tegra@lfdr.de>; Thu,  9 May 2024 20:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FE101F220E5
	for <lists+linux-tegra@lfdr.de>; Thu,  9 May 2024 18:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8DC7E58C;
	Thu,  9 May 2024 18:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gsI5ZZ/V"
X-Original-To: linux-tegra@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E938B7D401
	for <linux-tegra@vger.kernel.org>; Thu,  9 May 2024 18:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715280722; cv=none; b=l5nBSz8mzIMeNKPzXECk3ORMjZAxVIU5AHeiIaLKT3Lk1yP904G6VEYISbrO7gxgB76d5hTG5SAdSVp/yceG/43JcULQl8UBuQDRpissVJivewDm3khPC7M/jjnlcHmJqoDa+5RfMpzIdTYHrBB8eXg0BartUJIJEGysiiobJWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715280722; c=relaxed/simple;
	bh=p3ZmMFrnk1XjojhVMqBZxsZAePTORIKEt4tFeh1WQzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkYgd4NmY63BBlQO1CErkSTO38n0OBB8jUEElDM298gcSGXebEJQ4vEqfhtWiP5OHi+ZAaaTxsAgRmS8UBOQ4uJ9jh6b0qwDBG2sC4NBr2+RFDNOKfJtJitCx9jpObUVdCGX7vBEu4aPsA7FH0DmCjWnm4paEikPrv1ZdvFKjP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gsI5ZZ/V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715280719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yYLckJEUPnAUSAggVa8xwJUNCi1FmfrvekHysjk4ZWw=;
	b=gsI5ZZ/Vbu6DJ0z0PNnRgmo5vBT7rgO1vaZEQvz7oirsvAkrLSFCsXQzV+2vkn81vupoZh
	rz/tCQ1UDfURvCYHZ+O5+UeKVLZLOZ715mEyaPGXWAe2O33ZadhYKsMbA/ujgl63UfAl59
	X50SIeBGSGy3EHzfd3q4+Ow9fXxivSM=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-9MHm_s42ORaKAiFggcgvjA-1; Thu, 09 May 2024 14:51:58 -0400
X-MC-Unique: 9MHm_s42ORaKAiFggcgvjA-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2b29f4af4e4so1055615a91.1
        for <linux-tegra@vger.kernel.org>; Thu, 09 May 2024 11:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715280717; x=1715885517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYLckJEUPnAUSAggVa8xwJUNCi1FmfrvekHysjk4ZWw=;
        b=m/YUM7LoR8biLauPJI7zRzdzWqREgRybUzoiDP073gO5dHR1CvhlWz0qXFXyqCFKo9
         KYTRbiBh2JgDQhOHmh/iCsmJZhIQjIVsA+15FWhlj+oqjFJnF61YMofiiJE8eUUF5fwC
         HfxRxWhkRur8A8Sz8O8da0sfc97QA863kE4JdHdV9E2xPoTJ3KmPprBPyyQv6Zgs8IJp
         3ejbCx24A7ALQGoSiUk633cu9kQREALilbKEuX94Wlc2QI6YYJ+905qrq0iGUFaBpy2e
         H7gGfylDdtKeF3QpEmUGmdMmlMhS9TE4j8fgCvrvlgPY26X2+rFzMRKGW/3a5PCPClQG
         51BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGSdY1uyDkcLCXKfrEVEPZgbk+YWb5s4ptgXf31WraZhhXd6GpT3kFEoWQqMOCbpUpcO4xm35TqbVXYW+866+Do1Cq+12OIVjZ19o=
X-Gm-Message-State: AOJu0YxMxztBtcP1DaMyqZ12GXcvfS+aX2ZqCAyHVkjJZG1/gKV+63wm
	n9nnPoEymmDxJRHuf7I5bRbKV3mbzLNuXhgis7iB5mtu0ex2CaLwRhrl8ywHMl8NKsy05nABiqV
	OaR6Unzvpz7UCx/HMdybIDmcrf7zo+9wFt8/hwvNgbyLigTE1Llm/WdF+yfjE
X-Received: by 2002:a17:90b:314a:b0:2a6:f414:4e0b with SMTP id 98e67ed59e1d1-2b6ccd84692mr294540a91.41.1715280717387;
        Thu, 09 May 2024 11:51:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhnwRwj/LRS/Zxqh8tdix5FNheZ/1UYSUcoDCC8nqb5M6WXH6pxhINWBFsCzf4wCeA1195dA==
X-Received: by 2002:a17:90b:314a:b0:2a6:f414:4e0b with SMTP id 98e67ed59e1d1-2b6ccd84692mr294520a91.41.1715280716949;
        Thu, 09 May 2024 11:51:56 -0700 (PDT)
Received: from localhost (ip98-179-76-110.ph.ph.cox.net. [98.179.76.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b628ca4cddsm3673728a91.42.2024.05.09.11.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 11:51:56 -0700 (PDT)
Date: Thu, 9 May 2024 11:51:55 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, patches@lists.linux.dev, 
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH rc] iommu/arm-smmu: Use the correct type in
 nvidia_smmu_context_fault()
Message-ID: <xn6ghekaim52yotb6zikv7af3l225vlvt2m5wtho4powlpaelb@diu3pshryraw>
References: <0-v1-24ce064de41f+4ac-nvidia_smmu_fault_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-24ce064de41f+4ac-nvidia_smmu_fault_jgg@nvidia.com>

On Thu, May 09, 2024 at 02:45:51PM GMT, Jason Gunthorpe wrote:
> This was missed because of the function pointer indirection.
> 
> nvidia_smmu_context_fault() is also installed as a irq function, and the
> 'void *' was changed to a struct arm_smmu_domain. Since the iommu_domain
> is embedded at a non-zero offset this causes nvidia_smmu_context_fault()
> to miscompute the offset. Fixup the types.
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000120
>   Mem abort info:
>     ESR = 0x0000000096000004
>     EC = 0x25: DABT (current EL), IL = 32 bits
>     SET = 0, FnV = 0
>     EA = 0, S1PTW = 0
>     FSC = 0x04: level 0 translation fault
>   Data abort info:
>     ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>     CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>     GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>   user pgtable: 4k pages, 48-bit VAs, pgdp=0000000107c9f000
>   [0000000000000120] pgd=0000000000000000, p4d=0000000000000000
>   Internal error: Oops: 0000000096000004 [#1] SMP
>   Modules linked in:
>   CPU: 1 PID: 47 Comm: kworker/u25:0 Not tainted 6.9.0-0.rc7.58.eln136.aarch64 #1
>   Hardware name: Unknown NVIDIA Jetson Orin NX/NVIDIA Jetson Orin NX, BIOS 3.1-32827747 03/19/2023
>   Workqueue: events_unbound deferred_probe_work_func
>   pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>   pc : nvidia_smmu_context_fault+0x1c/0x158
>   lr : __free_irq+0x1d4/0x2e8
>   sp : ffff80008044b6f0
>   x29: ffff80008044b6f0 x28: ffff000080a60b18 x27: ffffd32b5172e970
>   x26: 0000000000000000 x25: ffff0000802f5aac x24: ffff0000802f5a30
>   x23: ffff0000802f5b60 x22: 0000000000000057 x21: 0000000000000000
>   x20: ffff0000802f5a00 x19: ffff000087d4cd80 x18: ffffffffffffffff
>   x17: 6234362066666666 x16: 6630303078302d30 x15: ffff00008156d888
>   x14: 0000000000000000 x13: ffff0000801db910 x12: ffff00008156d6d0
>   x11: 0000000000000003 x10: ffff0000801db918 x9 : ffffd32b50f94d9c
>   x8 : 1fffe0001032fda1 x7 : ffff00008197ed00 x6 : 000000000000000f
>   x5 : 000000000000010e x4 : 000000000000010e x3 : 0000000000000000
>   x2 : ffffd32b51720cd8 x1 : ffff000087e6f700 x0 : 0000000000000057
>   Call trace:
>    nvidia_smmu_context_fault+0x1c/0x158
>    __free_irq+0x1d4/0x2e8
>    free_irq+0x3c/0x80
>    devm_free_irq+0x64/0xa8
>    arm_smmu_domain_free+0xc4/0x158
>    iommu_domain_free+0x44/0xa0
>    iommu_deinit_device+0xd0/0xf8
>    __iommu_group_remove_device+0xcc/0xe0
>    iommu_bus_notifier+0x64/0xa8
>    notifier_call_chain+0x78/0x148
>    blocking_notifier_call_chain+0x4c/0x90
>    bus_notify+0x44/0x70
>    device_del+0x264/0x3e8
>    pci_remove_bus_device+0x84/0x120
>    pci_remove_root_bus+0x5c/0xc0
>    dw_pcie_host_deinit+0x38/0xe0
>    tegra_pcie_config_rp+0xc0/0x1f0
>    tegra_pcie_dw_probe+0x34c/0x700
>    platform_probe+0x70/0xe8
>    really_probe+0xc8/0x3a0
>    __driver_probe_device+0x84/0x160
>    driver_probe_device+0x44/0x130
>    __device_attach_driver+0xc4/0x170
>    bus_for_each_drv+0x90/0x100
>    __device_attach+0xa8/0x1c8
>    device_initial_probe+0x1c/0x30
>    bus_probe_device+0xb0/0xc0
>    deferred_probe_work_func+0xbc/0x120
>    process_one_work+0x194/0x490
>    worker_thread+0x284/0x3b0
>    kthread+0xf4/0x108
>    ret_from_fork+0x10/0x20
>   Code: a9b97bfd 910003fd a9025bf5 f85a0035 (b94122a1)
> 
> Cc: stable@vger.kernel.org
> Fixes: e0976331ad11 ("iommu/arm-smmu: Pass arm_smmu_domain to internal functions")
> Reported-by: Jerry Snitselaar <jsnitsel@redhat.com>
> Closes: https://lore.kernel.org/all/jto5e3ili4auk6sbzpnojdvhppgwuegir7mpd755anfhwcbkfz@2u5gh7bxb4iv
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Tested-by: Jerry Snitselaar <jsnitsel@redhat.com>
Acked-by: Jerry Snitselaar <jsnitsel@redhat.com>

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> Joerg, once Jerry ack's this you should grab it for this cycle.
> 
> Thanks,
> Jason
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
> index 87bf522b9d2eec..957d988b6d832f 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
> @@ -221,11 +221,9 @@ static irqreturn_t nvidia_smmu_context_fault(int irq, void *dev)
>  	unsigned int inst;
>  	irqreturn_t ret = IRQ_NONE;
>  	struct arm_smmu_device *smmu;
> -	struct iommu_domain *domain = dev;
> -	struct arm_smmu_domain *smmu_domain;
> +	struct arm_smmu_domain *smmu_domain = dev;
>  	struct nvidia_smmu *nvidia;
>  
> -	smmu_domain = container_of(domain, struct arm_smmu_domain, domain);
>  	smmu = smmu_domain->smmu;
>  	nvidia = to_nvidia_smmu(smmu);
>  
> 
> base-commit: dff9180946cc45d90a77e1c8645989cdcfd31437
> -- 
> 2.43.2
> 



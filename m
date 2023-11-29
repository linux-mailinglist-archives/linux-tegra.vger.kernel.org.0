Return-Path: <linux-tegra+bounces-113-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F29767FCEF7
	for <lists+linux-tegra@lfdr.de>; Wed, 29 Nov 2023 07:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B807B21682
	for <lists+linux-tegra@lfdr.de>; Wed, 29 Nov 2023 06:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEB4F9C2;
	Wed, 29 Nov 2023 06:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bu9LKCMw"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D48100
	for <linux-tegra@vger.kernel.org>; Tue, 28 Nov 2023 22:18:27 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5cfd2325a06so52095707b3.1
        for <linux-tegra@vger.kernel.org>; Tue, 28 Nov 2023 22:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701238707; x=1701843507; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8J4qMZXxn7dMNLyiBgKsZSJFUlenzauaBGTwqmqEkBs=;
        b=Bu9LKCMwAEyeZhjFEjzQZAlQfeHblnds9mH52MAD5JFR7alspWp6uCO28vfpqAXMJl
         3okcUl7pFCmP6O5iYoBxTSrgFkyZ+wqu6qMJZVok7v5Sns4gwZxlHhhbVmsHSxMIleyO
         eyAdGQnYYXbXjtXhlXEpJVSj+lkq1EvSK4DamzesU/mmmWBSIMbX2Wet38KdpAbpTimf
         0qAhKpMkoty3wx/yu4lixkJffB+wXXClIydIcMwx3YNlWzQFYyyJX7hEHSbM/+ezAlNN
         SLLYZCpsdUolK/k8yYGi/2bmJcW/HQ1O91oLpXORi1fczVZ94VM2hzeMlCClJL618xpP
         qXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701238707; x=1701843507;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8J4qMZXxn7dMNLyiBgKsZSJFUlenzauaBGTwqmqEkBs=;
        b=cRPp8TxtcFgn8GUan+JgTiXpwb3ZUTdyr8iPamC+mfdvJQO0V3Y3NqJu9M1NS2C/P6
         wNpO09UpnXsqNB87f0i3itb96qHNXzOFTvUgRvcy9ONjoRO4VjLozdQP5fwT/2EqrDbQ
         r7i0Sm8g//GM6BZnPy28CpyNeEJ9RZRRgpPSLlf669d/R9d0sKbk9UGRFfWjS2vI4WNQ
         QxkMZyIJrE5dIdA75vc0jaOrtEEsAvMUh1vj5CGz9Yg3RyDCcVY71FJumYWUvVGq2Ih/
         wxQIaWPRmA77gVf622WrV5vIYXCY6i6RTDaTpQIwX9eewghqjF41NECVVBSZ0kDSy6Lv
         AS5A==
X-Gm-Message-State: AOJu0YwyGCI33Yt0mFRV2PwFKu0Oasu3mkm5WM/S6nzvPGTKWbynB6MX
	hm7SAoNSNzlbb38WJAjrnZcwjkewafsu
X-Google-Smtp-Source: AGHT+IFcUygGdfS95PQxvEDzLlpossLvNyVov+P9EiIyJqoPwhfNYT1rdzAgRP7ca8iJPDCSOmBZ7cELCldp
X-Received: from morats.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:d9e])
 (user=moritzf job=sendgmr) by 2002:a25:d287:0:b0:db3:8b00:22eb with SMTP id
 j129-20020a25d287000000b00db38b0022ebmr482941ybg.6.1701238706756; Tue, 28 Nov
 2023 22:18:26 -0800 (PST)
Date: Wed, 29 Nov 2023 06:18:25 +0000
In-Reply-To: <9-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com> <9-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Message-ID: <20231129061825.altvhmgltws2bvhh@google.com>
Subject: Re: [PATCH 09/10] ACPI: IORT: Cast from ULL to phys_addr_t
From: Moritz Fischer <moritzf@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Danilo Krummrich <dakr@redhat.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org, 
	dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	David Woodhouse <dwmw2@infradead.org>, Frank Rowand <frowand.list@gmail.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Haiyang Zhang <haiyangz@microsoft.com>, iommu@lists.linux.dev, 
	Jon Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>, 
	Karol Herbst <kherbst@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Laxman Dewangan <ldewangan@nvidia.com>, Len Brown <lenb@kernel.org>, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org, 
	linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, nouveau@lists.freedesktop.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Sven Peter <sven@svenpeter.dev>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vineet Gupta <vgupta@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Christoph Hellwig <hch@lst.de>, 
	Jerry Snitselaar <jsnitsel@redhat.com>, Hector Martin <marcan@marcan.st>, Moritz Fischer <mdf@kernel.org>, 
	patches@lists.linux.dev, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Rob Herring <robh@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

On Tue, Nov 28, 2023 at 08:48:05PM -0400, Jason Gunthorpe wrote:
> gcc on i386 (when compile testing) warns:

This is a weird test. The Makefile for drivers/acpi/arm64 is conditional
on CONFIG_ARM64. How does this happen?

> 8->8
obj-$(CONFIG_ARM64)		+= arm64/
> 8->8


>   drivers/acpi/arm64/iort.c:2014:18: warning: implicit conversion  
> from 'unsigned long long' to 'phys_addr_t' (aka 'unsigned int') changes  
> value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
>                             local_limit =  
> DMA_BIT_MASK(ncomp->memory_address_limit);

> Because DMA_BIT_MASK returns a large ULL constant. Explicitly truncate it
> to phys_addr_t.

> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/acpi/arm64/iort.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index 6496ff5a6ba20d..bdaf9256870d92 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -2011,7 +2011,8 @@ phys_addr_t __init  
> acpi_iort_dma_get_max_cpu_address(void)

>   		case ACPI_IORT_NODE_NAMED_COMPONENT:
>   			ncomp = (struct acpi_iort_named_component *)node->node_data;
> -			local_limit = DMA_BIT_MASK(ncomp->memory_address_limit);
> +			local_limit = (phys_addr_t)DMA_BIT_MASK(
> +				ncomp->memory_address_limit);
>   			limit = min_not_zero(limit, local_limit);
>   			break;

> @@ -2020,7 +2021,8 @@ phys_addr_t __init  
> acpi_iort_dma_get_max_cpu_address(void)
>   				break;

>   			rc = (struct acpi_iort_root_complex *)node->node_data;
> -			local_limit = DMA_BIT_MASK(rc->memory_address_limit);
> +			local_limit = (phys_addr_t)DMA_BIT_MASK(
> +				rc->memory_address_limit);
>   			limit = min_not_zero(limit, local_limit);
>   			break;
>   		}
> --
> 2.42.0


Cheers,
Moritz


Return-Path: <linux-tegra+bounces-111-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A15D7FCED6
	for <lists+linux-tegra@lfdr.de>; Wed, 29 Nov 2023 07:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEECFB2179A
	for <lists+linux-tegra@lfdr.de>; Wed, 29 Nov 2023 06:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D874DDD0;
	Wed, 29 Nov 2023 06:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q66W6vPz"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9346A2703
	for <linux-tegra@vger.kernel.org>; Tue, 28 Nov 2023 22:06:05 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5ce16bc121aso68692467b3.1
        for <linux-tegra@vger.kernel.org>; Tue, 28 Nov 2023 22:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701237965; x=1701842765; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BFBgGZHgdrEFpnu/cpKOcJzser1reIBdXzg/6fniV64=;
        b=q66W6vPzM7okuZ9Mx4XIk8VNR+c1Amb08ha3K6IyxL3kfGNjEzHARUvK1MbtPPtEFp
         ZPOD1wgCX8lknocIHcP0VGD5HDPJQxpBXosT1oXyajw7zu37sVQoc6Y1j7UbI2+eeJCm
         K9bkfvk7rTaDRA8xFD+fhnMOLFisGgWZ9LBMH2HUdJ5ePFW3DCLjb8eJeFA8H7lFIMsI
         ePfBdYk3uEHvo8u74wAYaNCs0OlhSDKNJDF/nudnkW/uTKyvKeykaRXv/kPEYS/cWK4r
         eDqNFhS93XPBXVQkpoZ9PEsnaevZp9Tvm43EaDXvRArQRLd/Y6aOCXYhgYrAvLa4pD4B
         AQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701237965; x=1701842765;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BFBgGZHgdrEFpnu/cpKOcJzser1reIBdXzg/6fniV64=;
        b=wmzuQ9pVJz6bg0HzIkpIrVIU4vw0QMI3JzJsuzPWhqtX9E4PCqk7m3mheEuBIbHe1n
         nYid78Yw5PScogue/GJXeLJaBzhT59fpx0ocfCSJ9IWY8i3dq98e/lEev9VIbs2vtDwC
         Tmh9Vz11db2HwxdggIMVnTqhUdmY4Gb9LpoV+Tazxrjp2sKBUOpbtNnm5Xn6XxU3MjNc
         eiTyQUT1aQva4dgqhgCQmtE4KzRE7peKoMZcZOQe05FhfRZUiPKsWplTJOX6LfLT6HFA
         k9VAjD5Q/SmLRkMM871/7CGmmO8RZevrdxUI7gUU/06IOzObYw0LKfuN9tgW6bkXNYkW
         vvRA==
X-Gm-Message-State: AOJu0YxDpewuN6Tk3sCGXvnVvsZtP3pi766yIWsLxYCida+lOW06tiI7
	/29PTLp6WpvXLw8TABCXNm8nBWwaBK6v
X-Google-Smtp-Source: AGHT+IG4ZcbE3hB8V6+vKX0zxYUr0OpHfbf/WNlvcGBdlOoo8eTYBCxtpp+7m/8KdVPZTHDTWhORx94znMfW
X-Received: from morats.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:d9e])
 (user=moritzf job=sendgmr) by 2002:a25:c044:0:b0:db5:1f69:704e with SMTP id
 c65-20020a25c044000000b00db51f69704emr38263ybf.1.1701237964651; Tue, 28 Nov
 2023 22:06:04 -0800 (PST)
Date: Wed, 29 Nov 2023 06:06:03 +0000
In-Reply-To: <4-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com> <4-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Message-ID: <20231129060603.hxtmbsefxurxnwkh@google.com>
Subject: Re: [PATCH 04/10] iommu: Mark dev_iommu_get() with lockdep
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

On Tue, Nov 28, 2023 at 08:48:00PM -0400, Jason Gunthorpe wrote:
> Allocation of dev->iommu must be done under the
> iommu_probe_device_lock. Mark this with lockdep to discourage future
> mistakes.

> Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
> Tested-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 2 ++
>   1 file changed, 2 insertions(+)

> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 0d25468d53a68a..4323b6276e977f 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -334,6 +334,8 @@ static struct dev_iommu *dev_iommu_get(struct device  
> *dev)
>   {
>   	struct dev_iommu *param = dev->iommu;

> +	lockdep_assert_held(&iommu_probe_device_lock);
> +
>   	if (param)
>   		return param;

> --
> 2.42.0


Reviewed-by: Moritz Fischer <moritzf@google.com>

Cheers,
Moritz


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC0DB3EA3
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Sep 2019 18:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389830AbfIPQP3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Sep 2019 12:15:29 -0400
Received: from foss.arm.com ([217.140.110.172]:46580 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389785AbfIPQP2 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Sep 2019 12:15:28 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31DA928;
        Mon, 16 Sep 2019 09:15:28 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50B6A3F67D;
        Mon, 16 Sep 2019 09:15:27 -0700 (PDT)
Subject: Re: [PATCH 08/11] drm/nouveau: tegra: Skip IOMMU initialization if
 already attached
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Ben Skeggs <bskeggs@redhat.com>, linux-tegra@vger.kernel.org,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20190916150412.10025-1-thierry.reding@gmail.com>
 <20190916150412.10025-9-thierry.reding@gmail.com>
 <156993ea-ece6-9eb5-b664-a55c631e2600@arm.com> <20190916155724.GG7488@ulmo>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <ee285d4f-e5ff-e043-35cd-1338b1bb238f@arm.com>
Date:   Mon, 16 Sep 2019 17:15:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190916155724.GG7488@ulmo>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/09/2019 16:57, Thierry Reding wrote:
> On Mon, Sep 16, 2019 at 04:29:18PM +0100, Robin Murphy wrote:
>> Hi Thierry,
>>
>> On 16/09/2019 16:04, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> If the GPU is already attached to an IOMMU, don't detach it and setup an
>>> explicit IOMMU domain. Since Nouveau can now properly handle the case of
>>> the DMA API being backed by an IOMMU, just continue using the DMA API.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>    .../drm/nouveau/nvkm/engine/device/tegra.c    | 19 +++++++------------
>>>    1 file changed, 7 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
>>> index d0d52c1d4aee..fc652aaa41c7 100644
>>> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
>>> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
>>> @@ -23,10 +23,6 @@
>>>    #ifdef CONFIG_NOUVEAU_PLATFORM_DRIVER
>>>    #include "priv.h"
>>> -#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
>>> -#include <asm/dma-iommu.h>
>>> -#endif
>>> -
>>>    static int
>>>    nvkm_device_tegra_power_up(struct nvkm_device_tegra *tdev)
>>>    {
>>> @@ -109,14 +105,13 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_tegra *tdev)
>>>    	unsigned long pgsize_bitmap;
>>>    	int ret;
>>> -#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
>>> -	if (dev->archdata.mapping) {
>>> -		struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
>>> -
>>> -		arm_iommu_detach_device(dev);
>>> -		arm_iommu_release_mapping(mapping);
>>> -	}
>>> -#endif
>>> +	/*
>>> +	 * Skip explicit IOMMU initialization if the GPU is already attached
>>> +	 * to an IOMMU domain. This can happen if the DMA API is backed by an
>>> +	 * IOMMU.
>>> +	 */
>>> +	if (iommu_get_domain_for_dev(dev))
>>> +		return;
>>
>> Beware of "iommu.passthrough=1" - you could get a valid default domain here
>> yet still have direct/SWIOTLB DMA ops. I guess you probably want to
>> double-check the domain type as well.
> 
> Good point. An earlier version of this patch had an additional check for
> IOMMU_DOMAIN_DMA, but then that failed on 32-bit ARM because there the
> DMA API can also use IOMMU_DOMAIN_UNMANAGED type domains. Checking for
> IOMMU_DOMAIN_IDENTIFY should be safe, though. That doesn't seem to
> appear in arch/arm, arch/arm64 or drivers/iommu/dma-iommu.c.

Right, "domain && domain->type != IOMMU_DOMAIN_IDENTITY" should be 
sufficient to answer "is the DMA layer managing my address space for 
me?" unless and until some massive API change happens (which I certainly 
don't foresee).

Robin.

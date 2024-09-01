Return-Path: <linux-tegra+bounces-3585-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 289EC967664
	for <lists+linux-tegra@lfdr.de>; Sun,  1 Sep 2024 14:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D87AC2820F2
	for <lists+linux-tegra@lfdr.de>; Sun,  1 Sep 2024 12:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440CA175D5F;
	Sun,  1 Sep 2024 12:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UFkfwSah"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC0D14F9F1;
	Sun,  1 Sep 2024 12:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725193103; cv=none; b=QBxAf7jo76IzxlpjnvFwoWrMdbIL96RA1sBEeIZP3UkApWEUtC3nr43ZlBipDi6zJOgAEDPrMMCVT+QdfpdrCvPW18Cv1Yy2+PrS8wk+4S8HmO5Bm25hVkRSjFVWP8XwlhVl5tvuEb4vCWQ6wX0CpQ3tfR4oDOgJUhqx9TJyLk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725193103; c=relaxed/simple;
	bh=7/QB0KtM8B4HpCGa2zOGQwulKoPIrKDzA21NTiK6nDQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mNKU5zeqqxnzuke3wfr+TIDLWwKL6YO3AxppLSOhlRgvQRZqnV+xUiH2y6XRZizb7VF+AjcXahelkjrJDmiv3minw7GgaUcVFgZxj1WHoYDEhaKGJQ2zl7vj5EqeacJUHecKLzcyfQkKnzbpQXgMFe5miYlX46EBhnzc4Q+k7KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UFkfwSah; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725193102; x=1756729102;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7/QB0KtM8B4HpCGa2zOGQwulKoPIrKDzA21NTiK6nDQ=;
  b=UFkfwSahCpo82B9TyN6nr3qBhq1mfaojlQD5cg/Ui8i5t7ZW1j4iWtJa
   8p7uiSJyCDLHk6I3z1Ac16MpUJBtkNI9jQNtx0OAlyxD44EXA8bZYsaqN
   UFZc3yavr5awARzSswSO8g/yRJ1NVr5k+vGbm7XbNKURCWgnKUadWHYVs
   h8aA/PyKABwJ0UznIpUfXMcTdjbv1+sY8tgr75N+DEsZGBu/4d4Q0o1Fg
   rgmFEv6PU62+85DYgJJXrbPyEws5nPtS1MtZmJNFoehMrqwr29o6RqTDF
   hseUGXE7dQGQikF+g9TDWqpidQkl5uHT5fSC9nIqSYoIfOVfdYi/cLrpq
   A==;
X-CSE-ConnectionGUID: GLNAL9dYRGOXEtqFJ+6R9w==
X-CSE-MsgGUID: tl34bjxpSuOexBzTqjdo3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="27655075"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="27655075"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 05:18:21 -0700
X-CSE-ConnectionGUID: g8VwmCVNS2+7h8Z4f5k2qg==
X-CSE-MsgGUID: AfsLNis4Qr+b2Wrpi+N8nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="64699177"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.240.228]) ([10.124.240.228])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 05:18:14 -0700
Message-ID: <fd0257de-ce1a-40f3-a0b6-2f0c7dcee896@linux.intel.com>
Date: Sun, 1 Sep 2024 20:18:11 +0800
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sandy Huang <hjc@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Mikko Perttunen <mperttunen@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/tegra: Remove call to iommu_domain_alloc()
To: Thierry Reding <thierry.reding@gmail.com>
References: <20240812071034.9443-1-baolu.lu@linux.intel.com>
 <20240812071034.9443-3-baolu.lu@linux.intel.com>
 <qyvyd2ftebjlgmzyayfvxsqa64c4wgx7keix3a6eexdspbvawy@a5ffnm5h5tgp>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <qyvyd2ftebjlgmzyayfvxsqa64c4wgx7keix3a6eexdspbvawy@a5ffnm5h5tgp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/8/28 23:27, Thierry Reding wrote:
> On Mon, Aug 12, 2024 at 03:10:34PM GMT, Lu Baolu wrote:
>> Commit <17de3f5fdd35> ("iommu: Retire bus ops") removes iommu ops from
>> the bus structure. The iommu subsystem no longer relies on bus for
>> operations. So iommu_domain_alloc() interface is no longer relevant.
>>
>> Normally, iommu_paging_domain_alloc() could be a replacement for
>> iommu_domain_alloc() if the caller has the right device for IOMMU API
>> use. Unfortunately, this is not the case for this driver.
>>
>> Iterate the devices on the platform bus and find a suitable device
>> whose device DMA is translated by an IOMMU. Then use this device to
>> allocate an iommu domain. The iommu subsystem prevents domains
>> allocated by one iommu driver from being attached to devices managed
>> by any different iommu driver.
>>
>> Signed-off-by: Lu Baolu<baolu.lu@linux.intel.com>
>> Link:https://lore.kernel.org/r/20240610085555.88197-20-baolu.lu@linux.intel.com
>> ---
>>   drivers/gpu/drm/tegra/drm.c | 34 +++++++++++++++++++++++++---------
>>   1 file changed, 25 insertions(+), 9 deletions(-)
> Actually I think we can just do something like this:
> 
> --- >8 ---
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index d9f0728c3afd..d35e411d536b 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1150,7 +1150,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
>   	}
>   
>   	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
> -		tegra->domain = iommu_domain_alloc(&platform_bus_type);
> +		tegra->domain = iommu_paging_domain_alloc(dev->dev.parent);
>   		if (!tegra->domain) {
>   			err = -ENOMEM;
>   			goto free;
> --- >8 ---
> 
> That refers to the physical device that the host1x_device virtual device
> was instantiated from and is a common parent to all physical devices
> that are part of the virtual device.

Yes, this is really what we want. I will update the patch series later.

Thanks,
baolu


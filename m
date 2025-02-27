Return-Path: <linux-tegra+bounces-5388-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F96A4751F
	for <lists+linux-tegra@lfdr.de>; Thu, 27 Feb 2025 06:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8579E7A291D
	for <lists+linux-tegra@lfdr.de>; Thu, 27 Feb 2025 05:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4862F1E835E;
	Thu, 27 Feb 2025 05:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/E7isyd"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD68C1E521C;
	Thu, 27 Feb 2025 05:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740633628; cv=none; b=heZhe1n3m/RNCODh6kdtqpiXodaV5K0Qo4UGnwzU+SUYqXvR8Xcu2SHrCo8Htz0dTu+rCE6BIbChN4I2Y3FUDY/WisWpgPj7o5mxi/fatnbnDwFuYnn8rzWzWBb/r+T3jT3Esik8qPb/nH/rL47b3Z6nVyfpN07yiwmMlvjO6jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740633628; c=relaxed/simple;
	bh=vGpcN7P16mx836ZMuMkEdKUR6edRJ0QZzGvP196Ce2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhVOtHtdNh4N0eYetHoqHt2sdB3p6KDvz1NVqycsG8umS1zUFJYJVC+li1OHdDi/746GFd/2ot/Qu5koI8p7UHzrhn+Z/JNKGfTSqxCqYGNQehy8vEt5kLow9w9eMOmhq5Lt/cDB3+nwOegCcBuI4Xlw3MGNu8nT2ViLI6Vfv2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/E7isyd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740633626; x=1772169626;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vGpcN7P16mx836ZMuMkEdKUR6edRJ0QZzGvP196Ce2I=;
  b=R/E7isydRjOtBFZArtb6+yIu5kNtnnp4JEkcMG10tUR/suBM6UHyhrWj
   iltXFdv+Jj9sgxcUbFjwapk3cbGbwK/pFgXnbePsxoi3x25t/LSEmJYfb
   dwJnmN7I6EhpMSef5ZdH5HpRKfX7khFKqvLZY2oyRDkoJVLGQtCyysesx
   lvUNpQCU5R0yHWQf+HjYNDQR9SMsWrtJCryIdtkfR8RLAqTKWQSPlCuMu
   +p0fg4jKbYvdWN3usP8aMUStgFbyNZ84LwL1jiP872tEhgUNpXEi0qCSR
   7riFWtD13nAAt27ObDj7ta5xorvg6q0QTgY3MATKPXz1N49YH91Jc94aj
   A==;
X-CSE-ConnectionGUID: HDO+E/a3R0mrncXRz1KR7Q==
X-CSE-MsgGUID: ejt2W7QEQf+1t4Jpt+BLsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41638730"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41638730"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 21:20:26 -0800
X-CSE-ConnectionGUID: Lk/GChz9R1GaGsF8Qphm4A==
X-CSE-MsgGUID: M2gLbS9DTJqV6N7Ph1buOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117561459"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 21:20:19 -0800
Message-ID: <35920cb4-05cf-4814-9648-0c7ad39f55aa@linux.intel.com>
Date: Thu, 27 Feb 2025 13:17:02 +0800
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/23] iommu/pages: Move from struct page to struct
 ioptdesc and folio
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Hector Martin <marcan@marcan.st>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Robin Murphy
 <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 David Rientjes <rientjes@google.com>, Matthew Wilcox <willy@infradead.org>
References: <14-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <fafdcc71-b246-4855-a088-24854b124b21@linux.intel.com>
 <20250226135112.GB28425@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20250226135112.GB28425@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/26/25 21:51, Jason Gunthorpe wrote:
> On Wed, Feb 26, 2025 at 08:42:23PM +0800, Baolu Lu wrote:
>> On 2025/2/26 3:39, Jason Gunthorpe wrote:
>>> This brings the iommu page table allocator into the modern world of having
>>> its own private page descriptor and not re-using fields from struct page
>>> for its own purpose. It follows the basic pattern of struct ptdesc which
>>> did this transformation for the CPU page table allocator.
>>>
>>> Currently iommu-pages is pretty basic so this isn't a huge benefit,
>>> however I see a coming need for features that CPU allocator has, like sub
>>> PAGE_SIZE allocations, and RCU freeing. This provides the base
>>> infrastructure to implement those cleanly.
>> I understand that this is intended as the start point of having private
>> descriptors for folios allocated to iommu drivers. But I don't believe
>> this is currently the case after this patch, as the underlying memory
>> remains a struct folio. This patch merely uses an iommu-pages specific
>> structure pointer to reference it.
> Right now the mm provides 64 bytes of per-page memory that is a struct
> page.
> 
> You can call that 64 bytes a struct folio sometimes, and we have now
> been also calling those bytes a struct XXdesc like this patch does.
> 
> This is all a slow incremental evolution toward giving each user of
> the per-page memory its own unique type and understanding of what it
> needs while removing use of of the highly overloaded struct page.
> 
> Eventually Matthew wants to drop the 64 bytes down to 8 bytes and
> allocate the per-page memory directly. This would allow each user to
> use more/less memory depending on their need.
> 
> https://kernelnewbies.org/MatthewWilcox/Memdescs
> 
> When that happens the
> 
> 	folio = __folio_alloc_node(gfp | __GFP_ZERO, order, nid);
> 
> Will turn into something maybe more like:
> 
>     ioptdesc = memdesc_alloc_node(gfp, order, nid, sizeof(struct ioptdesc));
> 
> And then the folio word would disappear from this code.
> 
> Right now things are going down Matthew's list:
> 
> https://kernelnewbies.org/MatthewWilcox/Memdescs/Path
> 
> This series is part of "Remove page->lru uses"

Cool! Thank you for the explanation.

Thanks,
baolu


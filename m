Return-Path: <linux-tegra+bounces-5348-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F258A45665
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Feb 2025 08:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DF073A73DF
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Feb 2025 07:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8198D26B2A6;
	Wed, 26 Feb 2025 07:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFU0nEgT"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C4F26B082;
	Wed, 26 Feb 2025 07:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740553700; cv=none; b=fww6OK/AgORQF63s/H7wtHCd1XJGpJb/9Kqf8LP0Qnq6mR8chBqo5h7wuu34GYKJfu22C+9P5n67c+srVGm+6alUHdXNw+Ip84Rm6KP3Ks+lqb3iUMCfBc3ztDb8/QsD5k35JdumwFPgMkL6zWX2qfItFxC4ooFj9h4fb34InQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740553700; c=relaxed/simple;
	bh=lGuqG7+DEuXe1J2USAdDSTgmWvYFPHZTBIRv2glH2pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UsVihEqOi+UWNbd9DkhWhKwxuxqFctarxgSLQw815/e5olxth8sBfowsRwBD0X+oG1UF+DZGf8unS/qegn5XuqtLFr2oc0pIPTy/f7t0Yu5Ff4s0hfFdAFFfJdSLY3IqBzCLCmOkaCzknBWj6fTriaP038DzuQiezMsh+JA/QZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFU0nEgT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740553699; x=1772089699;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lGuqG7+DEuXe1J2USAdDSTgmWvYFPHZTBIRv2glH2pk=;
  b=gFU0nEgTFHyqe9+BWhIZPDwlaqLX4P3zCzQaudTZsdlpdaktfa2S0dB/
   iBJWVmCdt0M5nIRV98kPmcnUg1BK5sITD91W7lWVO2t3ZoCrA+5DDFqXE
   WbkWr5mKVFX0iIP80rGHjf6QYD1LBskoxwCiETp+qM4cc2FdFSScIeAlr
   NnL4qDavjSpi0ZgZm81svLM0xNxyzzmHhIXD2JuztZuM97liSLk67oCjg
   QUzObWYRomDvH0ZNyaBhR0Xzo53r0WlBM+2tSTsyOIpQBQ5afYDLtmdY0
   hCvdRiFBmPOyjavnzTsmezrlzxtAF4/nSqTWYQaepT2kCsA0WUU0wf9Yv
   g==;
X-CSE-ConnectionGUID: 8rAi/qjASW2OxrjwdWnZ8Q==
X-CSE-MsgGUID: O123bd75R2aiB+/q0evedA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45301074"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="45301074"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 23:08:18 -0800
X-CSE-ConnectionGUID: 4yW5/f4YTV6BcwIufl/fnA==
X-CSE-MsgGUID: ENbmKCDxR/qajyMYQN9NYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="121717499"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 23:08:11 -0800
Message-ID: <3ddae747-fbf4-4cca-a13c-8d6e6b89841d@linux.intel.com>
Date: Wed, 26 Feb 2025 15:04:56 +0800
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/23] iommu/pages: Remove iommu_put_pages_list_old and
 the _Generic
To: Jason Gunthorpe <jgg@nvidia.com>, Alim Akhtar <alim.akhtar@samsung.com>,
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
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 David Rientjes <rientjes@google.com>, Matthew Wilcox <willy@infradead.org>
References: <13-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <13-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/26/25 03:39, Jason Gunthorpe wrote:
> Nothing uses the old list_head path now, remove it.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>


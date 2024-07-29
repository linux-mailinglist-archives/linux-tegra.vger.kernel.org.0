Return-Path: <linux-tegra+bounces-3121-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E7393F72E
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jul 2024 16:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2E671C21B7B
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jul 2024 14:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95305153812;
	Mon, 29 Jul 2024 14:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFLC0eGQ"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A843154BE0;
	Mon, 29 Jul 2024 14:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722261714; cv=none; b=H9TZ5agX5RIDEms9nZBbg42TYqnCCo+O2raW6yp12sD+4wpQpCzH5Wvpgiaajp3DlG8sXAG+gfmQgq56w+N8QfjT3bm/TVz8aL9RcjfRtscM+jHfw3KwWbMYeJ7CgmVE4DgrzNynORsRge+1PRjlYRAB8d2gImGNeauVsp7pmVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722261714; c=relaxed/simple;
	bh=Y1Nevpy7uyu+oEQw6udVEHNAduDwy+JCJe65utQ5wiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqbM/CNyAhiwwNbwoX7bAv9GpoJfYAJyeaLXEsIPwvSFDmnbOuEQpD7FNXZ3ucXI3nczTY1BVlw21nSkHD0QNBdpq1/14ixcznhE9glvvih6DTSusEO2fWYl5ml7OROG+h25praYKjmLlmi25QYZATHndEG1ZAkD9B1xuco7+BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFLC0eGQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722261712; x=1753797712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y1Nevpy7uyu+oEQw6udVEHNAduDwy+JCJe65utQ5wiQ=;
  b=HFLC0eGQC+4giwxnhs1CfSRuJYVQqBfO335Vn/GdsXUWNy5fAdq6xDiA
   WAL9T2Tuvp9PqF1RxA9wH5Wr36qwX1wTem1FaoewUkeSib70TstjeGXem
   PdHkvZ+TyAeRCnIACkJ7iS0ipfWIpa+CXlJezDcoNEdxvPlK8R6KcwzXq
   ZYU1wDojqN4Yxa4jG/NCLleAEKqvCLbodjB5FrRfhNzydon0BFcL9svni
   9y7Q/wClKITcWE9lcOdv9Bbzxig9VzNCnyKd9paNIhwS1zz3ZTijjc1v3
   N8m3AvWoeP2Fz44iIjAHUIyCCt8LQF6BMrUv9fTmKXeFeTqf1xePYkOB/
   A==;
X-CSE-ConnectionGUID: B2Te7/SdTYGIgSkEZq8vqQ==
X-CSE-MsgGUID: Z779Oy8yRdGUd+X8GdT2bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="30603370"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="30603370"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 07:01:52 -0700
X-CSE-ConnectionGUID: WrsHn0OKRsq82MOfpFclQg==
X-CSE-MsgGUID: HNG9f+BxTTS5qEhc3zVxbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="54235294"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Jul 2024 07:01:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYQwc-000rjw-1m;
	Mon, 29 Jul 2024 14:01:46 +0000
Date: Mon, 29 Jul 2024 22:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	robin.murphy@arm.com, joro@8bytes.org, jgg@nvidia.com,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v10 8/9] iommu/arm-smmu-v3: Add in-kernel support for
 NVIDIA Tegra241 (Grace) CMDQV
Message-ID: <202407292157.BauV7TPf-lkp@intel.com>
References: <ca671f4d090546c21a0aba6fa4ddda8da26d4474.1722206275.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca671f4d090546c21a0aba6fa4ddda8da26d4474.1722206275.git.nicolinc@nvidia.com>

Hi Nicolin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.11-rc1 next-20240729]
[cannot apply to joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolin-Chen/iommu-arm-smmu-v3-Issue-a-batch-of-commands-to-the-same-cmdq/20240729-072957
base:   linus/master
patch link:    https://lore.kernel.org/r/ca671f4d090546c21a0aba6fa4ddda8da26d4474.1722206275.git.nicolinc%40nvidia.com
patch subject: [PATCH v10 8/9] iommu/arm-smmu-v3: Add in-kernel support for NVIDIA Tegra241 (Grace) CMDQV
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240729/202407292157.BauV7TPf-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240729/202407292157.BauV7TPf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407292157.BauV7TPf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:186: warning: Function parameter or struct member 'vintfs' not described in 'tegra241_cmdqv'
>> drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:186: warning: Excess struct member 'vtinfs' description in 'tegra241_cmdqv'


vim +186 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c

   160	
   161	/**
   162	 * struct tegra241_cmdqv - CMDQ-V for SMMUv3
   163	 * @smmu: SMMUv3 device
   164	 * @base: MMIO base address
   165	 * @irq: IRQ number
   166	 * @num_vintfs: Total number of VINTFs
   167	 * @num_vcmdqs: Total number of VCMDQs
   168	 * @num_lvcmdqs_per_vintf: Number of logical VCMDQs per VINTF
   169	 * @vintf_ids: VINTF id allocator
   170	 * @vtinfs: List of VINTFs
   171	 */
   172	struct tegra241_cmdqv {
   173		struct arm_smmu_device smmu;
   174	
   175		void __iomem *base;
   176		int irq;
   177	
   178		/* CMDQV Hardware Params */
   179		u16 num_vintfs;
   180		u16 num_vcmdqs;
   181		u16 num_lvcmdqs_per_vintf;
   182	
   183		struct ida vintf_ids;
   184	
   185		struct tegra241_vintf **vintfs;
 > 186	};
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

